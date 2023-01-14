Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 971FA66AD9D
	for <lists+linux-media@lfdr.de>; Sat, 14 Jan 2023 21:21:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230274AbjANUVI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 14 Jan 2023 15:21:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229906AbjANUVH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 14 Jan 2023 15:21:07 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36C4C46A3
        for <linux-media@vger.kernel.org>; Sat, 14 Jan 2023 12:21:06 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 34E9C4D4;
        Sat, 14 Jan 2023 21:21:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673727664;
        bh=5g+dBAh2fh+NSuBwKhmD6mOfIgq9X9X4kta/ugqxD50=;
        h=Date:From:To:Cc:Subject:From;
        b=reTuLkCbIAxUB1Clo1OMfWilHmj/EZilBe0cE+xnK5MTBtbZG/FsLnTxMOCfZiAcL
         bnMR1YrUlQmjoNZGWkEAr+RVIb2ir0HipO1d0W6aDSdwx97ZMDWdyJKIjNgOgC8wkw
         47e2qyskkzUmMapyK/9cZ6d+PY1kWWGG3ngiB44s=
Date:   Sat, 14 Jan 2023 22:21:04 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Michael Grzeschik <m.grzeschik@pengutronix.de>,
        Ricardo Ribalda <ribalda@chromium.org>
Subject: [GIT PULL FOR v6.3 - second try] uvcvideo changes
Message-ID: <Y8MOsMAaEyhQdLte@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Now with the right public git URL.

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git tags/media-uvc-next-20230114

for you to fetch changes up to fd957081cff04668f390c6f290bdcc7fc009a0f1:

  media: uvcvideo: Silence memcpy() run-time false positive warnings (2023-01-14 17:21:40 +0200)

The first commit in the branch (b5fd00fb8e89 "media: uvcvideo: Remove
format descriptions") may need to be merged in the linux-usb tree as
well, as it would conflict with work from Michael Grzeschik on the UVC
gadget side. I've thus based this pull request on v6.2-rc1, making sure
it can be used as a stable branch for Michael. Please merge it as-is,
without cherry-picking.

----------------------------------------------------------------
uvcvideo fixes and improvements

----------------------------------------------------------------
Guenter Roeck (1):
      media: uvcvideo: Handle errors from calls to usb_string

Hans Verkuil (2):
      media: uvcvideo: Check for INACTIVE in uvc_ctrl_is_accessible()
      media: uvcvideo: Improve error logging in uvc_query_ctrl()

Kees Cook (1):
      media: uvcvideo: Silence memcpy() run-time false positive warnings

Laurent Pinchart (2):
      media: uvcvideo: Remove format descriptions
      media: uvcvideo: Factor out usb_string() calls

Pedro Guilherme Siqueira Moreira (3):
      media: uvcvideo: Fix missing newline after declarations
      media: uvcvideo: Fix assignment inside if condition
      media: uvcvideo: Fix usage of symbolic permissions to octal

Ricardo Ribalda (18):
      media: uvcvideo: Handle cameras with invalid descriptors
      media: uvcvideo: Only create input devs if hw supports it
      media: uvcvideo: Remove void casting for the status endpoint
      media: uvcvideo: Recover stalled ElGato devices
      media: uvcvideo: Limit power line control for Acer EasyCamera
      media: uvcvideo: Return -EACCES for Wrong state error
      media: uvcvideo: Do not return positive errors in uvc_query_ctrl()
      media: uvcvideo: Fix handling on Bitmask controls
      media: uvcvideo: Refactor __uvc_ctrl_add_mapping
      media: uvcvideo: Limit power line control for Acer EasyCamera
      media: uvcvideo: Extend documentation of uvc_video_clock_decode()
      media: uvcvideo: Implement mask for V4L2_CTRL_TYPE_MENU
      media: uvcvideo: Refactor uvc_ctrl_mappings_uvcXX
      media: uvcvideo: Refactor power_line_frequency_controls_limited
      media: uvcvideo: Fix power line control for Lenovo Integrated Camera
      media: uvcvideo: Use standard names for menus
      media: uvcvideo: Fix race condition with usb_kill_urb
      media: uvcvideo: Quirk for autosuspend in Logitech B910 and C910

 drivers/media/usb/uvc/uvc_ctrl.c   | 342 +++++++++++++++++++++++++++----------
 drivers/media/usb/uvc/uvc_driver.c | 181 +++++++++++---------
 drivers/media/usb/uvc/uvc_entity.c |   2 +-
 drivers/media/usb/uvc/uvc_status.c | 125 +++++++++-----
 drivers/media/usb/uvc/uvc_v4l2.c   | 111 ++++++++----
 drivers/media/usb/uvc/uvc_video.c  |  58 +++++--
 drivers/media/usb/uvc/uvcvideo.h   |  39 ++++-
 include/uapi/linux/uvcvideo.h      |   6 +-
 8 files changed, 596 insertions(+), 268 deletions(-)

-- 
Regards,

Laurent Pinchart
