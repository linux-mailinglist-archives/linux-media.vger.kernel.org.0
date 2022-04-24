Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3DAB50D5DB
	for <lists+linux-media@lfdr.de>; Mon, 25 Apr 2022 00:45:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239841AbiDXWsR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Apr 2022 18:48:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239805AbiDXWsQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Apr 2022 18:48:16 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03CA811179
        for <linux-media@vger.kernel.org>; Sun, 24 Apr 2022 15:45:15 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5B0D9822
        for <linux-media@vger.kernel.org>; Mon, 25 Apr 2022 00:45:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650840313;
        bh=rZiyukLm5tkcAvnL8wCm/4mKw8yXARS3JgX86848ZUo=;
        h=Date:From:To:Subject:From;
        b=Dglixcxt+oeMPrGyzZTT1bJnq1oH+0/bBtmaCB5ZemHClfuuY7zEJUI2JfZ2ZKdhD
         JZNjDdGGOhHArOuQyLBJgOhjDW+lDwlKmPY8MqHJ3Wfc/B5eZdG8VKezqLHWXr2a7k
         z+jsK+IKT6UN+A2/prG90Xj7qIeeUgGuS/N5Ggjc=
Date:   Mon, 25 Apr 2022 01:45:12 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.19] uvcvideo fixes and improvements
Message-ID: <YmXS+Fx9meoZv5W8@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

The following changes since commit d0c19bed8cd3d005739c0a6374118c553564ef10:

  media: platform: imx-mipi-csis: Remove unneeded 'default n' (2022-04-24 09:07:31 +0100)

are available in the Git repository at:

  git://linuxtv.org/pinchartl/media.git tags/v4l2-next-20220425

for you to fetch changes up to 68af2e2a7379027abd24c635e1e6c59376060d9a:

  media: uvcvideo: Add UVC_GUID_FORMAT_H265 (2022-04-25 01:31:31 +0300)

----------------------------------------------------------------
uvcvideo fixes and improvements

----------------------------------------------------------------
Hangyu Hua (1):
      media: uvcvideo: Fix bit overflow in uvc_probe_video

James_Lin (1):
      media: uvcvideo: Add UVC_GUID_FORMAT_H265

Jonathan Neuschäfer (1):
      docs: media: uvcvideo: Use linux-media mailing list

Ricardo Ribalda (3):
      media: uvcvideo: Fix memory leak if uvc_ctrl_add_mapping fails
      media: uvcvideo: Simplify uvc_endpoint_max_bpi()
      media: uvcvideo: Undup use uvc_endpoint_max_bpi() code

Xiaomeng Tong (1):
      media: uvcvideo: Fix missing check to determine if element is found in list

 .../userspace-api/media/drivers/uvcvideo.rst       |  2 +-
 MAINTAINERS                                        |  1 -
 drivers/media/usb/uvc/uvc_ctrl.c                   | 10 ++++++++
 drivers/media/usb/uvc/uvc_driver.c                 | 11 +++++----
 drivers/media/usb/uvc/uvc_v4l2.c                   | 28 ++++++++++++----------
 drivers/media/usb/uvc/uvc_video.c                  | 16 +++----------
 drivers/media/usb/uvc/uvcvideo.h                   |  4 ++++
 7 files changed, 40 insertions(+), 32 deletions(-)

-- 
Regards,

Laurent Pinchart
