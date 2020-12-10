Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6638A2D58AF
	for <lists+linux-media@lfdr.de>; Thu, 10 Dec 2020 11:59:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730998AbgLJK4v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Dec 2020 05:56:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:56192 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389166AbgLJK4h (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Dec 2020 05:56:37 -0500
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 00/13] Address issues with PDF output at media uAPI docs
Date:   Thu, 10 Dec 2020 11:55:39 +0100
Message-Id: <cover.1607597287.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Keeping LaTeX/PDF output working is hard, as Sphinx require lots of
manual adjusts, as it has several troubles:

- It can't compute properly table cell sizes when literals are used;
- It doesn't break long literal words with hiphens when needed;
- It easily write things out of tables and out of pages;
- It doesn't have any tag that would allow changing the font size;
- It doesn't re-scale tables.

So, from time to time, a manual (hard) work is needed in order to
check what broke, fixing them.

This series address most of such issues that happen at the uAPI
media documents.

Jon,

Patch 1 actually fixes a bug at conf.py.  The remaining patches
depend on it. My plan is to have this series merged for 5.11.

IMO, the best would be to have this patch applied via my tree,
but I'm OK if you prefer to merge this one via yours.

Regards,
Mauro

Mauro Carvalho Chehab (13):
  docs: conf.py: fix sphinx version detection for margin set
  media: colorspaces-details.rst: drop tabularcolumns
  media: control.rst: use a table for V4L2_CID_POWER_LINE
  media: docs: sliced-vbi: fix V4L2_SLICED_WSS_625 docs
  media: ext-ctrls-codec-stateless.rst: change a FWHT flag description
  media: ext-ctrls-codec.rst: add a missing profile description
  media: ext-ctrls-codec.rst: simplify a few tables
  media: ext-ctrls-jpeg.rst: cleanup V4L2_CID_JPEG_COMPRESSION_QUALITY
    text
  media: docs: pixfmt: use section titles for bayer formats
  media: buffer.rst: fix a PDF output issue
  media: ext-ctrls-codec-stateless.rst: fix an H-264 table format
  media: pixfmt-yuv-planar.rst: fix PDF OUTPUT
  media: docs: uAPI: fix table output in LaTeX/PDF format

 Documentation/conf.py                         |   3 +-
 .../media/cec/cec-ioc-adap-g-caps.rst         |   4 +-
 .../media/cec/cec-ioc-adap-g-conn-info.rst    |   6 +-
 .../media/cec/cec-ioc-adap-g-log-addrs.rst    |  12 +-
 .../media/cec/cec-ioc-dqevent.rst             |  10 +-
 .../media/cec/cec-ioc-g-mode.rst              |   4 +-
 .../media/cec/cec-ioc-receive.rst             |   8 +-
 .../userspace-api/media/dvb/fe-type-t.rst     |   2 +-
 .../media/mediactl/media-ioc-device-info.rst  |   2 +-
 .../mediactl/media-ioc-enum-entities.rst      |   2 +-
 .../media/mediactl/media-ioc-enum-links.rst   |   6 +-
 .../media/mediactl/media-ioc-g-topology.rst   |  12 +-
 .../media/mediactl/media-types.rst            |   4 +-
 .../userspace-api/media/rc/rc-tables.rst      |   2 +-
 .../userspace-api/media/v4l/buffer.rst        |  22 +-
 .../media/v4l/colorspaces-details.rst         |  31 --
 .../userspace-api/media/v4l/control.rst       |  13 +-
 .../userspace-api/media/v4l/dev-meta.rst      |   2 +-
 .../userspace-api/media/v4l/dev-raw-vbi.rst   |   4 +-
 .../userspace-api/media/v4l/dev-rds.rst       |   4 +-
 .../userspace-api/media/v4l/dev-sdr.rst       |   2 +-
 .../media/v4l/dev-sliced-vbi.rst              |  50 +--
 .../userspace-api/media/v4l/dev-subdev.rst    |   6 +-
 .../userspace-api/media/v4l/diff-v4l.rst      |  10 +-
 .../media/v4l/ext-ctrls-camera.rst            |  14 +-
 .../media/v4l/ext-ctrls-codec-stateless.rst   | 181 +++++++++--
 .../media/v4l/ext-ctrls-codec.rst             | 288 ++++++++++++------
 .../userspace-api/media/v4l/ext-ctrls-dv.rst  |   2 +-
 .../media/v4l/ext-ctrls-flash.rst             |   7 +-
 .../media/v4l/ext-ctrls-jpeg.rst              |  13 +-
 .../userspace-api/media/v4l/field-order.rst   |   2 +-
 .../media/v4l/pixfmt-compressed.rst           |  12 +-
 .../media/v4l/pixfmt-packed-yuv.rst           |  26 +-
 .../media/v4l/pixfmt-reserved.rst             |  10 +-
 .../userspace-api/media/v4l/pixfmt-rgb.rst    |   9 +-
 .../media/v4l/pixfmt-srggb10-ipu3.rst         |  12 +-
 .../media/v4l/pixfmt-srggb10p.rst             |   2 +-
 .../media/v4l/pixfmt-srggb12p.rst             |   2 +-
 .../media/v4l/pixfmt-srggb14.rst              |   2 +
 .../media/v4l/pixfmt-srggb14p.rst             |   6 +-
 .../media/v4l/pixfmt-srggb16.rst              |   2 +
 .../userspace-api/media/v4l/pixfmt-srggb8.rst |   3 +-
 .../media/v4l/pixfmt-v4l2-mplane.rst          |   4 +-
 .../userspace-api/media/v4l/pixfmt-v4l2.rst   |   4 +-
 .../media/v4l/pixfmt-yuv-luma.rst             |  10 +
 .../media/v4l/pixfmt-yuv-planar.rst           |  34 ++-
 .../media/v4l/subdev-formats.rst              |  26 +-
 .../media/v4l/v4l2-selection-flags.rst        |  14 +-
 .../media/v4l/v4l2-selection-targets.rst      |  12 +-
 .../media/v4l/vidioc-create-bufs.rst          |   2 +-
 .../media/v4l/vidioc-cropcap.rst              |   4 +-
 .../media/v4l/vidioc-dbg-g-chip-info.rst      |   6 +-
 .../media/v4l/vidioc-dbg-g-register.rst       |   4 +-
 .../media/v4l/vidioc-decoder-cmd.rst          |   8 +-
 .../media/v4l/vidioc-dqevent.rst              |  21 +-
 .../media/v4l/vidioc-dv-timings-cap.rst       |   6 +-
 .../media/v4l/vidioc-encoder-cmd.rst          |   6 +-
 .../media/v4l/vidioc-enum-dv-timings.rst      |   2 +-
 .../media/v4l/vidioc-enum-fmt.rst             |  10 +-
 .../media/v4l/vidioc-enum-frameintervals.rst  |   7 +-
 .../media/v4l/vidioc-enum-framesizes.rst      |   8 +-
 .../media/v4l/vidioc-enum-freq-bands.rst      |   4 +-
 .../media/v4l/vidioc-enuminput.rst            |   8 +-
 .../media/v4l/vidioc-enumoutput.rst           |   6 +-
 .../media/v4l/vidioc-enumstd.rst              |   6 +-
 .../userspace-api/media/v4l/vidioc-expbuf.rst |   2 +-
 .../media/v4l/vidioc-g-audio.rst              |   6 +-
 .../media/v4l/vidioc-g-audioout.rst           |   2 +-
 .../userspace-api/media/v4l/vidioc-g-crop.rst |   2 +-
 .../userspace-api/media/v4l/vidioc-g-ctrl.rst |   2 +-
 .../media/v4l/vidioc-g-dv-timings.rst         |  20 +-
 .../userspace-api/media/v4l/vidioc-g-edid.rst |   2 +-
 .../media/v4l/vidioc-g-enc-index.rst          |   6 +-
 .../media/v4l/vidioc-g-ext-ctrls.rst          |  20 +-
 .../userspace-api/media/v4l/vidioc-g-fbuf.rst |   6 +-
 .../userspace-api/media/v4l/vidioc-g-fmt.rst  |   2 +-
 .../media/v4l/vidioc-g-frequency.rst          |   2 +-
 .../media/v4l/vidioc-g-jpegcomp.rst           |   4 +-
 .../media/v4l/vidioc-g-modulator.rst          |   9 +-
 .../userspace-api/media/v4l/vidioc-g-parm.rst |  11 +-
 .../media/v4l/vidioc-g-priority.rst           |   2 +-
 .../media/v4l/vidioc-g-selection.rst          |   2 +-
 .../media/v4l/vidioc-g-sliced-vbi-cap.rst     |  29 +-
 .../media/v4l/vidioc-g-tuner.rst              |  12 +-
 .../media/v4l/vidioc-querycap.rst             |   8 +-
 .../media/v4l/vidioc-queryctrl.rst            |  21 +-
 .../media/v4l/vidioc-reqbufs.rst              |  14 +-
 .../media/v4l/vidioc-s-hw-freq-seek.rst       |   2 +-
 .../v4l/vidioc-subdev-enum-frame-interval.rst |   2 +-
 .../v4l/vidioc-subdev-enum-frame-size.rst     |   2 +-
 .../v4l/vidioc-subdev-enum-mbus-code.rst      |  14 +-
 .../media/v4l/vidioc-subdev-g-crop.rst        |   2 +-
 .../media/v4l/vidioc-subdev-g-fmt.rst         |   4 +-
 .../v4l/vidioc-subdev-g-frame-interval.rst    |   2 +-
 .../media/v4l/vidioc-subdev-g-selection.rst   |   2 +-
 .../media/v4l/vidioc-subdev-querycap.rst      |   4 +-
 .../media/v4l/vidioc-subscribe-event.rst      |   4 +-
 97 files changed, 802 insertions(+), 446 deletions(-)

-- 
2.29.2


