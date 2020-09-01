Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C650D2591AB
	for <lists+linux-media@lfdr.de>; Tue,  1 Sep 2020 16:54:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728253AbgIAOyK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Sep 2020 10:54:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727009AbgIAL0x (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Sep 2020 07:26:53 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 877BAC06125F
        for <linux-media@vger.kernel.org>; Tue,  1 Sep 2020 04:17:21 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 1B5B9298907
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
Subject: [PATCH v4 00/10] media: staging: rkisp1: add support to V4L2_CAP_IO_MC
Date:   Tue,  1 Sep 2020 13:16:02 +0200
Message-Id: <20200901111612.10552-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The patchset solves several problems in the rkisp1 driver.

1. Currently the resizers output media code MEDIA_BUS_FMT_YUYV8_2X8 when the input is
MEDIA_BUS_FMT_YUYV8_2X8.
The patchset adds support to other media codes on the resizer according to
the chroma subsampling.
Setting the correct media code on the source pad that matches the
chroma subsampling reflects userspace  that the resizer has downsampling
capability and also the resizer entity does not have to check the capture entity's
configuration to get the scaling ratio, the information of how to scale can be
obtained from the source media code of the resizer.

2. Add support for the V4L2_CAP_IO_MC capability on
the mainpath and selfpath captures. This helps userspace to know the
right configuration for streaming. This is especially helpful for the
RGB and Grey formats that expect media bus MEDIA_BUS_FMT_YUYV8_2X8
which is not something userspace can 'guess'. Adding a mapping of the
required mbus code for each pixelformat also makes the link_validation
code much simpler, it just has to check if the configuration matches the mapping.

3. Removes unsupported packed yuv formats - this patch was already part of a pull request
and was dropped due to merge conflicts.

4. Remove bayer formats on the selfpath resizer since they are not
supported on the selfpath capture.

5. Remove support to YUV444 pixel format, I was not able to find a configuration
that supports this format. I kept getting bad looking frames.
I tried to add capture yuv444 formats by adding an entry:

+       {
+               .mbus_code      = MEDIA_BUS_FMT_YUV8_1X24,
+               .hdiv           = 1,
+               .vdiv           = 1,
+       }

to the list of supported formats: rkisp1_rsz_yuv_src_formats[]

full patch: http://ix.io/2vNJ

On the mainpath I get good images, but on the selfpath I get bad looking images:

https://pasteboard.co/JoWp3U4.png

https://pasteboard.co/Jp1YWLR.png

Interestingly, when changing the sp_input from default RKISP1_MI_CTRL_SP_INPUT_YUV422
to RKISP1_MI_CTRL_SP_INPUT_YUV444, then the images that are not upscaled look good:

https://pasteboard.co/Jp22u6E.png

but with upscaling (1604x1232 -> 1920x1500) it still looks bad:

https://pasteboard.co/Jp22MBU.png


6. Fix the configuration to support Grey format - the 'write_format' field should
be 'planar'

changes since v3:
patch 1 - remove '----' line from commit log
patch 5-7 - refactor code, add documentation
patch 8 - change function name rkisp1_rsz_yuv_mbus_info and code in function rkisp1_rsz_set_src_fmt


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
  media: staging: rkisp1: cap: simplify the link validation by compering
    the media bus code
  media: staging: rkisp1: fix configuration for GREY pixelformat

 drivers/staging/media/rkisp1/rkisp1-capture.c | 199 +++++++++++-------
 drivers/staging/media/rkisp1/rkisp1-common.h  |  11 +
 drivers/staging/media/rkisp1/rkisp1-resizer.c |  93 ++++++--
 3 files changed, 203 insertions(+), 100 deletions(-)

-- 
2.17.1

