Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A50B557640D
	for <lists+linux-media@lfdr.de>; Fri, 15 Jul 2022 17:05:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232739AbiGOPFH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jul 2022 11:05:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232296AbiGOPFG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jul 2022 11:05:06 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9310DAF
        for <linux-media@vger.kernel.org>; Fri, 15 Jul 2022 08:05:05 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 63F3D9DA
        for <linux-media@vger.kernel.org>; Fri, 15 Jul 2022 17:05:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657897504;
        bh=0N/93jeaB1u0/dLMGpIK/qS8O/jQa+/3FMgjG4jRLjI=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=LGNMesRdEMUA+XROoN4oER1/s/O7EWaiKcyoOJd5El+ZXONrmzrzGy129+0aYRoXi
         4Gq0TkpDiRdN7HIao/h6QndwHLfChdb9nh5ozUjlSOvsQroqMRDMk15r9Oqn6eLQpk
         nW7b6w4rMKAU3xTQxd8RFRDV8QfimbWBxShFp/xE=
Date:   Fri, 15 Jul 2022 18:04:32 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.20 - v2] Miscellaneous uvcvideo improvements and
 fixes
Message-ID: <YtGCAK4vGXXNRTED@pendragon.ideasonboard.com>
References: <YtGA3W+wwzQIE74a@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YtGA3W+wwzQIE74a@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

With the UVC gadget patches dropped this time, I had incorrectly added
them in v1. They should go through Greg's tree.

The following changes since commit b228cf38f0b72d797fab60386da7ee935e033aac:

  media: venus: set ubwc configuration on specific video hardware (2022-07-15 15:41:55 +0100)

are available in the Git repository at:

  git://linuxtv.org/pinchartl/media.git tags/uvc-next-20220715

for you to fetch changes up to 6e01f2e7618a9bc723c62fdfcbd266a9e2b2ad8c:

  media: uvcvideo: Remove unneeded goto (2022-07-15 18:03:16 +0300)

----------------------------------------------------------------
Miscellaneous uvcvideo improvements and fixes

----------------------------------------------------------------
Laurent Pinchart (2):
      media: uvcvideo: Fix comment blocks style
      media: uvcvideo: Replace broken URL

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

 drivers/media/usb/uvc/uvc_ctrl.c   | 112 +++++++++++++++++++++++------
 drivers/media/usb/uvc/uvc_driver.c | 143 ++++++++++++++++++++++++++++++++-----
 drivers/media/usb/uvc/uvc_isight.c |  13 ++--
 drivers/media/usb/uvc/uvc_queue.c  |   6 +-
 drivers/media/usb/uvc/uvc_status.c |   6 +-
 drivers/media/usb/uvc/uvc_v4l2.c   |  18 +++--
 drivers/media/usb/uvc/uvc_video.c  |  96 ++++++++++++++++---------
 drivers/media/usb/uvc/uvcvideo.h   |  16 +++--
 8 files changed, 314 insertions(+), 96 deletions(-)

-- 
Regards,

Laurent Pinchart
