Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 573EA261D5D
	for <lists+linux-media@lfdr.de>; Tue,  8 Sep 2020 21:36:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732338AbgIHTgE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Sep 2020 15:36:04 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:53670 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732252AbgIHTgB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Sep 2020 15:36:01 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 06A113B
        for <linux-media@vger.kernel.org>; Tue,  8 Sep 2020 21:35:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1599593759;
        bh=jTku1Jf4Cqz+3jDTQDT3J1bwsxXWM0mpKU0IMEGOWRc=;
        h=Date:From:To:Subject:From;
        b=K92m6z+/AkB81rzx2jRWJyt0EN1TXFivg1DqBLe2t20TCg0Hve7g+szhQj8pzrYyQ
         uHRxUu4OMDA8IpnhXf1uBnWisT/nDYMpH5BWzFCrnf1jnscvHfNRRi6OC1eUmbCCKR
         iBynUMM79Xq1rZVuHUMdxp38WDx3YOKEqrltXyAU=
Date:   Tue, 8 Sep 2020 22:35:33 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.10] Miscellaneous UVC changes
Message-ID: <20200908193533.GA9607@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

The following changes since commit d034731bb4b4f2bf5f378231a6d99e59c2cb59f6:

  media: vivid: fix compile warning/error (2020-09-08 11:54:00 +0200)

are available in the Git repository at:

  git://linuxtv.org/pinchartl/media.git tags/uvc-next-20200908

for you to fetch changes up to 1c2200153c500600b478e9f47361c9435aaac477:

  media: uvcvideo: Convey full colorspace information to V4L2 (2020-09-08 19:53:31 +0300)

----------------------------------------------------------------
Miscellaneous UVC changes for v5.10

----------------------------------------------------------------
Adam Goode (2):
      media: uvcvideo: Ensure all probed info is returned to v4l2
      media: uvcvideo: Convey full colorspace information to V4L2

Alexander A. Klimov (1):
      media: uvcvideo: Replace HTTP links with HTTPS ones

Daniel W. S. Almeida (1):
      media: uvcvideo: Fix dereference of out-of-bound list iterator

Dmitry Buzdyk (1):
      media: uvcvideo: Add mapping for HEVC payloads

Hans de Goede (2):
      media: uvcvideo: Fix uvc_ctrl_fixup_xu_info() not having any effect
      media: uvcvideo: Cleanup uvc_ctrl_add_info() error handling

Jun Chen (1):
      media: uvcvideo: Fix annotation for uvc_video_clock_update()

Laurent Pinchart (2):
      media: uvcvideo: Set media controller entity functions
      media: uvcvideo: Silence shift-out-of-bounds warning

 drivers/media/usb/uvc/uvc_ctrl.c   | 46 ++++++++++++------------
 drivers/media/usb/uvc/uvc_driver.c | 71 +++++++++++++++++++++++++++++++++++---
 drivers/media/usb/uvc/uvc_entity.c | 35 +++++++++++++++++++
 drivers/media/usb/uvc/uvc_v4l2.c   | 34 ++++++++++++++++++
 drivers/media/usb/uvc/uvc_video.c  |  2 +-
 drivers/media/usb/uvc/uvcvideo.h   |  8 ++++-
 6 files changed, 167 insertions(+), 29 deletions(-)

-- 
Regards,

Laurent Pinchart
