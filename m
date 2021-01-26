Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8823304CBE
	for <lists+linux-media@lfdr.de>; Tue, 26 Jan 2021 23:54:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730693AbhAZWyb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jan 2021 17:54:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404054AbhAZSGF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Jan 2021 13:06:05 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67BF2C061756
        for <linux-media@vger.kernel.org>; Tue, 26 Jan 2021 10:05:22 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6E98A2C1
        for <linux-media@vger.kernel.org>; Tue, 26 Jan 2021 19:05:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1611684320;
        bh=TXiQhEl1E1xwzQfCknKBeV1IugYrI50tzcmHYa8KN8I=;
        h=Date:From:To:Subject:From;
        b=lh3542gs8wqA2pXLjUXAN8HTuls92rz+PSIJS9iVZQzqzDXLLGboGDOcVT39A3lja
         5MmBCh6FtS8xnnFQrl8rp62i33dXEupPNhAle/31uDjetNs1/MmQocPddIVhRoRQaT
         +x6RG31prnMpuxJd8fXPChYckN2PXmwFki5f2fho=
Date:   Tue, 26 Jan 2021 20:05:01 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.12] UVC driver changes
Message-ID: <YBBZzXcB8R1xd3Hm@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

The following changes since commit 066a94e28a23e04c0e9cb293f9ead56d409d7e41:

  media: dt-bindings: media: Use graph and video-interfaces schemas (2021-01-22 22:40:15 +0100)

are available in the Git repository at:

  git://linuxtv.org/pinchartl/media.git tags/uvc-next-20210126

for you to fetch changes up to 9a71d1f0628599823d9233e62aa2fa17d5322013:

  media: uvcvideo: Rename debug functions (2021-01-26 19:07:18 +0200)

----------------------------------------------------------------
UVC changes for v5.12:

- UVC privacy GPIO support
- Fix format/size setting regression with some devices
- Support 1bcf:0b40

----------------------------------------------------------------
Joe Perches (1):
      media: uvcvideo: Rename debug functions

Laurent Pinchart (2):
      media: uvcvideo: Force UVC version to 1.0a for 1bcf:0b40
      media: uvcvideo: Accept invalid bFormatIndex and bFrameIndex values

Ricardo Ribalda (10):
      media: uvcvideo: Move guid to entity
      media: uvcvideo: Allow extra entities
      media: uvcvideo: Allow entities with no pads
      media: uvcvideo: Provide sync and async uvc_ctrl_status_event
      media: uvcvideo: Allow entity-defined get_info and get_cur
      media: uvcvideo: Implement UVC_EXT_GPIO_UNIT
      media: uvcvideo: Add Privacy control based on EXT_GPIO
      media: uvcvideo: Use dev_ printk aliases
      media: uvcvideo: New macro uvc_trace_cont
      media: uvcvideo: use dev_printk() for uvc_trace()

 drivers/media/usb/uvc/uvc_ctrl.c   | 179 ++++++------
 drivers/media/usb/uvc/uvc_driver.c | 552 ++++++++++++++++++++++++-------------
 drivers/media/usb/uvc/uvc_entity.c |  11 +-
 drivers/media/usb/uvc/uvc_isight.c |  17 +-
 drivers/media/usb/uvc/uvc_queue.c  |   9 +-
 drivers/media/usb/uvc/uvc_status.c |  44 +--
 drivers/media/usb/uvc/uvc_v4l2.c   |  62 +++--
 drivers/media/usb/uvc/uvc_video.c  | 162 +++++------
 drivers/media/usb/uvc/uvcvideo.h   |  95 +++++--
 9 files changed, 680 insertions(+), 451 deletions(-)

-- 
Regards,

Laurent Pinchart
