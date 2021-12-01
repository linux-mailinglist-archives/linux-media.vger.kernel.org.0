Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 750A5464590
	for <lists+linux-media@lfdr.de>; Wed,  1 Dec 2021 04:45:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231776AbhLADsk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Nov 2021 22:48:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231177AbhLADsj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Nov 2021 22:48:39 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75A81C061574
        for <linux-media@vger.kernel.org>; Tue, 30 Nov 2021 19:45:19 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B34EAA15
        for <linux-media@vger.kernel.org>; Wed,  1 Dec 2021 04:45:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1638330316;
        bh=vXio3TjOmZcDcYdEnkuBi+mukBSy0g9FHw05Ep3k/bo=;
        h=Date:From:To:Subject:From;
        b=GMBd3ojJupNwtql0QEZaEsmpUGqEiKf4GLtpkA3qc9ROfv9fqagTszuIyaAxcgaOw
         kEr8swI8/pFO3cr4/Ozi+otTJ9OjsiRFPawcGhy0PWl745S80kIf5lsu2WEetaozvY
         oT70YWpCn7x2SFhRW9z7mp/vgYsReRq8AchVap54=
Date:   Wed, 1 Dec 2021 05:44:52 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.17] uvcvideo fixes
Message-ID: <YabvtBPLnjO5SFgn@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

The following changes since commit 1f1517fafda598839a02e39968c5063ddcfa51fc:

  media: cx18: drop an unused macro (2021-11-22 08:32:02 +0000)

are available in the Git repository at:

  git://linuxtv.org/pinchartl/media.git tags/uvc-next-20211201

for you to fetch changes up to 4d5d51427c5983d73a3e424bf4c6e49fbbe7db80:

  media: uvcvideo: Avoid returning invalid controls (2021-12-01 05:37:41 +0200)

----------------------------------------------------------------
- uvcvideo fixes

----------------------------------------------------------------
Colin Ian King (1):
      media: uvcvideo: Fix memory leak of object map on error exit path

James Hilliard (1):
      media: uvcvideo: Increase UVC_CTRL_CONTROL_TIMEOUT to 5 seconds.

Johan Hovold (1):
      media: uvcvideo: fix division by zero at stream start

Ricardo Ribalda (2):
      media: uvcvideo: Set the colorspace as sRGB if undefined
      media: uvcvideo: Avoid returning invalid controls

 drivers/media/usb/uvc/uvc_ctrl.c   | 2 +-
 drivers/media/usb/uvc/uvc_driver.c | 6 ++++--
 drivers/media/usb/uvc/uvc_v4l2.c   | 6 ++++--
 drivers/media/usb/uvc/uvc_video.c  | 4 ++++
 drivers/media/usb/uvc/uvcvideo.h   | 2 +-
 5 files changed, 14 insertions(+), 6 deletions(-)

-- 
Regards,

Laurent Pinchart
