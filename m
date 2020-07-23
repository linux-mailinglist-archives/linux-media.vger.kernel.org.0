Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81D6422B057
	for <lists+linux-media@lfdr.de>; Thu, 23 Jul 2020 15:21:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728985AbgGWNVU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Jul 2020 09:21:20 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:48452 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726521AbgGWNVT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Jul 2020 09:21:19 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 89036298A1A
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com, mchehab@kernel.org,
        tfiga@chromium.org
Subject: [PATCH v3 00/10] media: staging: rkisp1: add support to V4L2_CAP_IO_MC
Date:   Thu, 23 Jul 2020 15:20:04 +0200
Message-Id: <20200723132014.4597-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch is a v3 of the patchset

"media: staging: rkisp1: various fixes to capture formats"

https://patchwork.kernel.org/cover/11551791/

The patchset solves several problems in the rkisp1 driver:

1. Currently the resizers always return media code MEDIA_BUS_FMT_YUYV8_2X8.
The patchset adds support to other media codes on the resizer according to
the chroma subsampling.
Setting the correct media code on the source pad that matches the
chroma subsampling reflects userspace  that the resizer has downsampling
ability and also the resizer entity does not have to check the capture entity's
configuration to get the scaling ratio, the information of how to scale can be
obtained from the source media code of the resizer.

2. Add support for the V4L2_CAP_IO_MC capability on
the mainpath and selfpath captures. This helps userspace to know the
right configuration for streaming. This is especially helpful for the
RGB and Grey formats that expect media bus MEDIA_BUS_FMT_YUYV8_2X8
which is not something userspace can guess. Adding a mapping of the
expected mbus code for each pixelformat also makes the link_validation
code much simpler, it just has to check if the configuration matches the mapping.

3. Removes unsupported packed yuv formats - this patch was already part of a pull request
and was dropped due to merge conflicts.

4. Remove bayer formats on the selfpath resizer since they are not
supported on the selfpath capture.

5. Remove support to YUV444 pixel format, I was not able to find a configuration
that supports this format. I kept getting bad looking frames and
this format is not that important to support. Also the TRM says:
"
In sensor mode the MRSZ block supports only down-scaling. This is because the sensor
cannot be stopped from delivering data during one frame.
"
So it seems that the format cannot be supported.

6. Fix the configuration to support Grey format - the 'write_format' field should
be 'planar'

Dafna Hirschfeld (10):
  media: staging: rkisp1: cap: change RGB24 format to XBGR32
  media: staging: rkisp1: cap: remove unsupported formats
  media: staging: rkisp1: cap: remove unsupported format YUV444
  media: staging: rkisp1: don't support bayer format on selfpath resizer
  media: staging: rkisp1: add capability V4L2_CAP_IO_MC to capture
    devices
  media: staging: rkisp1: add a helper function to enumerate supported
    mbus formats on capture
  media: staging: rkisp1: rsz: enumerate the formats on the src pad
    according to the capture
  media: staging: rkisp1: rsz: Add support to more YUV encoded mbus
    codes on src pad
  media: rkisp1: cap: simplify the link validation by comparing the
    media bus code
  media: staging: rkisp1: fix configuration for GREY pixelformat

 drivers/staging/media/rkisp1/rkisp1-capture.c | 185 ++++++++++--------
 drivers/staging/media/rkisp1/rkisp1-common.h  |   8 +
 drivers/staging/media/rkisp1/rkisp1-resizer.c | 108 +++++++---
 3 files changed, 195 insertions(+), 106 deletions(-)

-- 
2.17.1

