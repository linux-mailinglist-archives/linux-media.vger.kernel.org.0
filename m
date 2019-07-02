Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33E165D367
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2019 17:49:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726308AbfGBPs7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jul 2019 11:48:59 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:58360 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725996AbfGBPs7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Jul 2019 11:48:59 -0400
Received: from turingmachine.home (unknown [IPv6:2804:431:c7f4:61e7:d711:794d:1c68:5ed3])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tonyk)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 5D5F228A215;
        Tue,  2 Jul 2019 16:48:54 +0100 (BST)
From:   =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, hverkuil@xs4all.nl, helen.koike@collabora.com,
        kernel@collabora.com, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@collabora.com>
Subject: [PATCH 0/7] media: vimc: Add a V4L2 output device
Date:   Tue,  2 Jul 2019 12:47:45 -0300
Message-Id: <20190702154752.14939-1-andrealmeid@collabora.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This patch adds a V4L2 output device on vimc, that comply with V4L2 API
for video output. If there is an output device and a capture device at the
same pipeline, one can get a video loopback pipeline feeding frames at
the output and then seeing them at the capture. It's possible to insert
vimc submodules at the pipeline to modify the image (e.g. a scaler).

If one starts a streaming at the capture, with the output off, the
capture will display a noisy frame. If one starts a streaming at the
output with the capture off, the output will just consume the buffers,
without sending them to the pipeline. If both output and capture are
streaming, the loopback will happen.

The patches 1 and 2 provide some ground to create the output
device. The patch 3 creates the device and modify how the vimc-streamer
was dealing with the s_stream callback on other vimc modules, to make
simpler implementing this callback at vimc-output. Patch 4 change the
behavior of the pipeline in order to be closer to a real life hardware.
Patches 5-7 updates the default pipeline and the documentation to
include the new output device.

This is the result of v4l2-compliance after this patch series:
$ v4l2-compliance -m0 -s50
Grand Total for vimc device /dev/media0: 476, Succeeded: 476, Failed: 0,
Warnings: 0

A git tree up to date with media-master and with this changes can be found
at: https://gitlab.collabora.com/tonyk/linux/tree/vimc/output

In order to test it, one can follow these instructions:

1 - Configure the pipeline (requires v4l-utils):

$ media-ctl -d platform:vimc -V '"Sensor A":0[fmt:SBGGR8_1X8/640x480]'
$ media-ctl -d platform:vimc -V '"Debayer A":0[fmt:SBGGR8_1X8/640x480]'
$ media-ctl -d platform:vimc -V '"Sensor B":0[fmt:SBGGR8_1X8/640x480]'
$ media-ctl -d platform:vimc -V '"Debayer B":0[fmt:SBGGR8_1X8/640x480]'
$ v4l2-ctl -z platform:vimc -d "RGB/YUV Capture" -v width=1920,height=1440
$ v4l2-ctl -z platform:vimc -d "Raw Capture 0" -v pixelformat=BA81
$ v4l2-ctl -z platform:vimc -d "Raw Capture 1" -v pixelformat=BA81
$ v4l2-ctl -z platform:vimc -e "RGB/YUV Input" -v width=640,height=480

2 - Use a userspace application:
2.a gst-launch (requires gstreamer and gst-plugins-good):

Feed frames into the output and grab from the capture (rescaled for
convenience):

$ gst-launch-1.0 videotestsrc pattern=ball ! \
	video/x-raw,width=640,height=480,format=RGB \
	! v4l2sink device=/dev/video2 v4l2src device=/dev/video3 ! \
	video/x-raw,width=1920,height=1440,format=RGB ! videoscale ! \
	video/x-raw,width=640,height=480 ! videoconvert ! ximagesink

2.b qv4l2 (requires v4l-utils):

Open the output device:

$ qv4l2 -d2

Open the capture device:

$ qv4l2 -d3

Start the streaming at both, at any order. You can change the frame
content at "Test Pattern Generator" -> "Test Pattern" on the output.

Thanks,
	André

André Almeida (7):
  media: vimc: Create video module
  media: vimc: video: Add write file operation
  media: vimc: Create a V4L2 output device
  media: vimc: Send null buffer through the pipeline
  media: vimc: core: Add output device on the pipeline
  media: vimc.dot: Update default topology diagram
  media: vimc.rst: Add output device

 Documentation/media/v4l-drivers/vimc.dot    |   4 +-
 Documentation/media/v4l-drivers/vimc.rst    |  12 +-
 drivers/media/platform/vimc/Makefile        |   4 +-
 drivers/media/platform/vimc/vimc-capture.c  | 356 +++----------------
 drivers/media/platform/vimc/vimc-common.h   |   5 +-
 drivers/media/platform/vimc/vimc-core.c     |   7 +-
 drivers/media/platform/vimc/vimc-debayer.c  |  14 +-
 drivers/media/platform/vimc/vimc-output.c   | 362 ++++++++++++++++++++
 drivers/media/platform/vimc/vimc-scaler.c   |  13 +-
 drivers/media/platform/vimc/vimc-sensor.c   |  10 +-
 drivers/media/platform/vimc/vimc-streamer.c |  24 +-
 drivers/media/platform/vimc/vimc-video.c    | 273 +++++++++++++++
 drivers/media/platform/vimc/vimc-video.h    | 130 +++++++
 13 files changed, 849 insertions(+), 365 deletions(-)
 create mode 100644 drivers/media/platform/vimc/vimc-output.c
 create mode 100644 drivers/media/platform/vimc/vimc-video.c
 create mode 100644 drivers/media/platform/vimc/vimc-video.h

-- 
2.22.0

