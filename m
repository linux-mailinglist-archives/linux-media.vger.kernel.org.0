Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1251D5763F7
	for <lists+linux-media@lfdr.de>; Fri, 15 Jul 2022 17:00:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231901AbiGOPAS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jul 2022 11:00:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231618AbiGOPAP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jul 2022 11:00:15 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F95C7AC34
        for <linux-media@vger.kernel.org>; Fri, 15 Jul 2022 08:00:14 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 95A1B993
        for <linux-media@vger.kernel.org>; Fri, 15 Jul 2022 17:00:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657897212;
        bh=+itADVrnQsTsbyb0ifPLmoJkv3ZDeYGxlVL3sYx1BbE=;
        h=Date:From:To:Subject:From;
        b=XAd3s30u9Afd7xg6sn1HKLYo2ThmxF2GFGsl6I7BOX8G4LRArqG+kdgGfskmwZYj+
         WwrVsXCREFcJpuqdtfsfHB8BQBZN3n9fVADuRX/X40ed+C3mng/lI6KJ/DwEqNsC+P
         dLZaHxJa5XjSUeNap+mxjL+6tZ6vRIC7MUwosTf4=
Date:   Fri, 15 Jul 2022 17:59:41 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.20] Miscellaneous uvcvideo improvements and fixes
Message-ID: <YtGA3W+wwzQIE74a@pendragon.ideasonboard.com>
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

I realized I forgot to send a pull request for the uvcvideo driver. In
case there's still time, here it is.

The following changes since commit b228cf38f0b72d797fab60386da7ee935e033aac:

  media: venus: set ubwc configuration on specific video hardware (2022-07-15 15:41:55 +0100)

are available in the Git repository at:

  git://linuxtv.org/pinchartl/media.git tags/uvc-next-20220715

for you to fetch changes up to 13fadd1df43b955d176d9039de8f6fbbf9be529c:

  usb: gadget: uvc: Fix list double add in uvcg_video_pump (2022-07-15 17:55:41 +0300)

----------------------------------------------------------------
Miscellaneous uvcvideo improvements and fixes

----------------------------------------------------------------
Dan Vacura (1):
      usb: gadget: uvc: Fix list double add in uvcg_video_pump

Laurent Pinchart (3):
      media: uvcvideo: Fix comment blocks style
      media: uvcvideo: Replace broken URL
      usb: gadget: uvc: Fix comment blocks style

Michael Grzeschik (1):
      media: uvcvideo: Remove unneeded goto

Ricardo Ribalda (7):
      media: uvcvideo: Add missing value for power_line_frequency
      media: uvcvideo: Add support for per-device control mapping overrides
      media: uvcvideo: Limit power line control for Quanta UVC Webcam
      media: uvcvideo: Limit power line control for Chicony Easycamera
      media: uvcvideo: Limit power line control for Chicony Easycamera
      media: uvcvideo: Limit power line control for Quanta cameras
      media: uvcvideo: Limit power line control for Acer EasyCamera

 drivers/media/usb/uvc/uvc_ctrl.c        | 112 ++++++++++++++++++++-----
 drivers/media/usb/uvc/uvc_driver.c      | 143 +++++++++++++++++++++++++++-----
 drivers/media/usb/uvc/uvc_isight.c      |  13 ++-
 drivers/media/usb/uvc/uvc_queue.c       |   6 +-
 drivers/media/usb/uvc/uvc_status.c      |   6 +-
 drivers/media/usb/uvc/uvc_v4l2.c        |  18 ++--
 drivers/media/usb/uvc/uvc_video.c       |  96 ++++++++++++++-------
 drivers/media/usb/uvc/uvcvideo.h        |  16 ++--
 drivers/usb/gadget/function/f_uvc.c     |  30 ++++---
 drivers/usb/gadget/function/uvc_queue.c |   6 +-
 drivers/usb/gadget/function/uvc_video.c |  15 +++-
 11 files changed, 348 insertions(+), 113 deletions(-)

-- 
Regards,

Laurent Pinchart
