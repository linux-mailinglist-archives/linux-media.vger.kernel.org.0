Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 487F84646F0
	for <lists+linux-media@lfdr.de>; Wed,  1 Dec 2021 06:57:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346805AbhLAGBB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Dec 2021 01:01:01 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:54174 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbhLAGBA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Dec 2021 01:01:00 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8D095A15;
        Wed,  1 Dec 2021 06:57:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1638338259;
        bh=QKPug67dJCBhQgdp1tA60+oRXris/Uc0KDjDu3U/abc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sRpNzbsuvo1pJfHtE8f7JQQc4I6p2qfs3is4OdecdHc2HBlzqf1R06XM2/5oDVQr8
         V9MwPsug+Mpu+90H5UubM4OXVKCMfO7zVCUoCB7x0wIN67F45sD3F1OL69Uv+DfsKp
         88LvND0Mmxj9lpGQKD9LlmZOBt3txvaRHTREnJXo=
Date:   Wed, 1 Dec 2021 07:57:14 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: [GIT PULL FOR v5.17] [v2] uvcvideo fixes
Message-ID: <YacOun3Diggsi05V@pendragon.ideasonboard.com>
References: <CANiDSCskY=HjJjf+0cfHfHgaxwn4TtcUC=e6JBU_EfvRuBq-ag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCskY=HjJjf+0cfHfHgaxwn4TtcUC=e6JBU_EfvRuBq-ag@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 1f1517fafda598839a02e39968c5063ddcfa51fc:

  media: cx18: drop an unused macro (2021-11-22 08:32:02 +0000)

are available in the Git repository at:

  git://linuxtv.org/pinchartl/media.git tags/uvc-next-20211201

for you to fetch changes up to 525214b072dbdddd3d40d6e061dc3714798e8e23:

  media: uvcvideo: Avoid returning invalid controls (2021-12-01 07:42:35 +0200)

----------------------------------------------------------------
- uvcvideo fixes

----------------------------------------------------------------
Colin Ian King (1):
      media: uvcvideo: Fix memory leak of object map on error exit path

James Hilliard (1):
      media: uvcvideo: Increase UVC_CTRL_CONTROL_TIMEOUT to 5 seconds.

Johan Hovold (1):
      media: uvcvideo: fix division by zero at stream start

Ricardo Ribalda (3):
      media: uvcvideo: Set the colorspace as sRGB if undefined
      media: uvcvideo: Avoid invalid memory access
      media: uvcvideo: Avoid returning invalid controls

 drivers/media/usb/uvc/uvc_ctrl.c   | 4 ++--
 drivers/media/usb/uvc/uvc_driver.c | 6 ++++--
 drivers/media/usb/uvc/uvc_v4l2.c   | 6 ++++--
 drivers/media/usb/uvc/uvc_video.c  | 4 ++++
 drivers/media/usb/uvc/uvcvideo.h   | 2 +-
 5 files changed, 15 insertions(+), 7 deletions(-)

-- 
Regards,

Laurent Pinchart
