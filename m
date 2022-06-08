Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15711542EA5
	for <lists+linux-media@lfdr.de>; Wed,  8 Jun 2022 13:04:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237615AbiFHLEA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jun 2022 07:04:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237422AbiFHLD7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jun 2022 07:03:59 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B67271BD8FC
        for <linux-media@vger.kernel.org>; Wed,  8 Jun 2022 04:03:52 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1nytTb-0003xv-3G; Wed, 08 Jun 2022 13:03:51 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1nytTb-007ApG-Ee; Wed, 08 Jun 2022 13:03:50 +0200
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1nytTZ-000ahy-43; Wed, 08 Jun 2022 13:03:49 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     linux-media@vger.kernel.org, balbi@kernel.org,
        paul.elder@ideasonboard.com, kieran.bingham@ideasonboard.com,
        nicolas@ndufresne.ca, laurent.pinchart@ideasonboard.com,
        kernel@pengutronix.de
Subject: [RESEND v2 0/3] usb: gadget: uvc: fixes and improvements
Date:   Wed,  8 Jun 2022 13:03:36 +0200
Message-Id: <20220608110339.141036-1-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series includes several patches to improve the overall usb uvc
gadget code. It includes some style changes and some serious fixes.

Michael Grzeschik (3):
  usb: gadget: uvc: calculate the number of request depending on
    framesize
  usb: gadget: uvc: increase worker prio to WQ_HIGHPRI
  usb: gadget: uvc: call uvc uvcg_warn on completed status instead of
    uvcg_info

 drivers/usb/gadget/function/f_uvc.c     |  4 ++++
 drivers/usb/gadget/function/uvc.h       |  1 +
 drivers/usb/gadget/function/uvc_queue.c | 17 ++++++++++++-----
 drivers/usb/gadget/function/uvc_v4l2.c  |  2 +-
 drivers/usb/gadget/function/uvc_video.c | 11 ++++++++---
 5 files changed, 26 insertions(+), 9 deletions(-)

-- 
2.30.2

