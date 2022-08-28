Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E9685A3ED0
	for <lists+linux-media@lfdr.de>; Sun, 28 Aug 2022 19:25:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230166AbiH1RYt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 28 Aug 2022 13:24:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229683AbiH1RYr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 28 Aug 2022 13:24:47 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D45AC2C6
        for <linux-media@vger.kernel.org>; Sun, 28 Aug 2022 10:24:44 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 472CAE5
        for <linux-media@vger.kernel.org>; Sun, 28 Aug 2022 19:24:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661707483;
        bh=ZYzN8SPDzmTHLWDu/R4TZ84Qv1QWzAeXfQhtiiGL5vc=;
        h=Date:From:To:Subject:From;
        b=YMNvk6k7D4Kt8Wmpd1Mwqyg7sUVLoAcC+N+ACr8SyialF+sbGrOBPSGXlx02X8saH
         6N63bseb6Vco5sg3uG3cFiep9im1mx7HyzJX3YQA/iD6+bET0axSiSaPHPnjPnz2XO
         MiLFbNNIi6OYw/xmzlrW9FhXDjWUaUbVa/tLqmeE=
Date:   Sun, 28 Aug 2022 20:24:35 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v6.1] uvcvideo changes
Message-ID: <Ywuk09W5czQ/fuDP@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  git://linuxtv.org/pinchartl/media.git tags/uvc-next-20220828

for you to fetch changes up to 9ee63810d44ccbf7b77f29c4350a9288da107e69:

  media: uvcvideo: Limit power line control for Sonix Technology (2022-08-28 20:19:12 +0300)

----------------------------------------------------------------
- Misc fixes for the uvcvideo driver

----------------------------------------------------------------
José Expósito (1):
      media: uvcvideo: Fix memory leak in uvc_gpio_parse

Laurent Pinchart (1):
      media: uvcvideo: Use indexed loops in uvc_ctrl_init_ctrl()

Slark Xiao (1):
      media: uvcvideo: Fix typo 'the the' in comment

Yunke Cao (1):
      media: uvcvideo: Use entity get_cur in uvc_ctrl_set

huanglei (1):
      media: uvcvideo: Limit power line control for Sonix Technology

 drivers/media/usb/uvc/uvc_ctrl.c   | 117 ++++++++++++++++++++-----------------
 drivers/media/usb/uvc/uvc_driver.c |  17 ++++--
 drivers/media/usb/uvc/uvc_video.c  |   2 +-
 3 files changed, 79 insertions(+), 57 deletions(-)

-- 
Regards,

Laurent Pinchart
