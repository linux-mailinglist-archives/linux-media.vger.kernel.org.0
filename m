Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF1CD66B442
	for <lists+linux-media@lfdr.de>; Sun, 15 Jan 2023 22:49:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231549AbjAOVtF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Jan 2023 16:49:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231428AbjAOVtD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Jan 2023 16:49:03 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13A6718141
        for <linux-media@vger.kernel.org>; Sun, 15 Jan 2023 13:48:59 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 59A41308;
        Sun, 15 Jan 2023 22:48:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673819337;
        bh=xuE3d1IAsU9mNxqKz7mbxFoHBmVCgTrZvTH2ARy5UOU=;
        h=Date:From:To:Cc:Subject:From;
        b=c8GF47e7WOdphVIqMFqu952Q7Of73uhkAiy13Nqt7FTgOLOkCiz+i4LpKfN4/x8Cx
         RFh/8AfGi05QNGTDMBEMvjnINR65WdQnAjmoap+j26sw3Hy82IfHpGcmXrKACSCDjU
         5NKMIV9OKFivj1VBYmOA/yvSBid3XbEiiHJWgrlI=
Date:   Sun, 15 Jan 2023 23:48:57 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Michael Grzeschik <m.grzeschik@pengutronix.de>,
        Ricardo Ribalda <ribalda@chromium.org>
Subject: [GIT PULL FOR v6.3] [v3] uvcvideo changes
Message-ID: <Y8R0yfSL+1BNi/f3@pendragon.ideasonboard.com>
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

Here's a third attempt at a pull request for the uvcvideo driver, fixing
a compilation warning that I had missed.

The first commit in the branch (50459f103edf "media: uvcvideo: Remove
format descriptions") may need to be merged in the linux-usb tree as
well, as it would conflict with work from Michael Grzeschik on the UVC
gadget side. I've thus based this pull request on v6.2-rc1, making sure
it can be used as a stable branch for Michael. Please merge it as-is,
without cherry-picking.

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git tags/media-uvc-next-20230115

for you to fetch changes up to b839212988575c701aab4d3d9ca15e44c87e383c:

  media: uvcvideo: Silence memcpy() run-time false positive warnings (2023-01-15 23:45:15 +0200)

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
