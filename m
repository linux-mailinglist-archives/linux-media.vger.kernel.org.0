Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50B576042B5
	for <lists+linux-media@lfdr.de>; Wed, 19 Oct 2022 13:09:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229975AbiJSLIJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Oct 2022 07:08:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232378AbiJSLH2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Oct 2022 07:07:28 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94C9B1781EA
        for <linux-media@vger.kernel.org>; Wed, 19 Oct 2022 03:36:21 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1ol6Q2-0005oF-9s; Wed, 19 Oct 2022 12:35:26 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1ol6Q1-0006FS-Dg; Wed, 19 Oct 2022 12:35:25 +0200
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1ol6Q0-00COQ1-JZ; Wed, 19 Oct 2022 12:35:24 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     linux-media@vger.kernel.org, balbi@kernel.org,
        laurent.pinchart@ideasonboard.com, kernel@pengutronix.de
Subject: [PATCH v4 0/2] usb: gadget: uvc: handle setup stream ctrl requests
Date:   Wed, 19 Oct 2022 12:35:20 +0200
Message-Id: <20221019103522.2925375-1-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patches are handling the streaming ctrl request before sending it
to the userspace and just before it is replied to the host. Adding a
validation and some data simplifaction.

Michael Grzeschik (2):
  usb: gadget: uvc: default the ctrl request interface offsets
  usb: gadget: uvc: add validate and fix function for uvc response

 drivers/usb/gadget/function/f_uvc.c    | 17 +++++-
 drivers/usb/gadget/function/uvc.h      |  1 +
 drivers/usb/gadget/function/uvc_v4l2.c | 76 ++++++++++++++++++++++++++
 include/uapi/linux/usb/g_uvc.h         |  3 +
 4 files changed, 94 insertions(+), 3 deletions(-)

-- 
2.30.2

