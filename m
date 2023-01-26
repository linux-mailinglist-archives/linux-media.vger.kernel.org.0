Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0210C67D977
	for <lists+linux-media@lfdr.de>; Fri, 27 Jan 2023 00:15:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233060AbjAZXPR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 18:15:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229663AbjAZXPQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 18:15:16 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8C41F742
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 15:15:14 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1pLBSX-0004JJ-RO; Fri, 27 Jan 2023 00:15:09 +0100
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1pLBSY-000fF0-4N; Fri, 27 Jan 2023 00:15:09 +0100
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1pLBSV-00EH7x-KB; Fri, 27 Jan 2023 00:15:07 +0100
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     laurent.pinchart@ideasonboard.com
Cc:     gregkh@linuxfoundation.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, linux-usb@vger.kernel.org,
        linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH v3 0/5] [PATCH v3] usb: uvc: improve header files and function use
Date:   Fri, 27 Jan 2023 00:14:51 +0100
Message-Id: <20230126231456.3402323-1-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series is improving the use of the uvc_format_desc
in v4l2-uvc.h and also reuses the declarative strings from
v4l_fill_fmtdesc.

This series applies on

git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git media-uvc-next-20230115

which has been merged in the Linux media tree for v6.3 (as shown by
https://git.linuxtv.org/media_stage.git/commit/?id=82adfe34694c98f1115a7b75cff6af9c4a35dba9).

v1 -> v3: dropped 4/5 ("media: v4l2: move v4l_fill_fmtdesc to common v4l2_fill_fmtdesc function")

Marek Vasut (1):
  media: uvcvideo: Add GUID for BGRA/X 8:8:8:8

Michael Grzeschik (4):
  usb: uvc: move media/v4l2-uvc.h to usb/uvc.h
  usb: uvc: move uvc_fmts and uvc_format_by_guid to own compile unit
  usb: uvc: make uvc_format_desc table const
  usb: uvc: use v4l2_fill_fmtdesc instead of open coded format name

 drivers/media/common/Kconfig                  |   3 +
 drivers/media/common/Makefile                 |   1 +
 drivers/media/common/uvc.c                    | 183 +++++++++++++++
 drivers/media/usb/uvc/Kconfig                 |   1 +
 drivers/media/usb/uvc/uvc_ctrl.c              |   2 +-
 drivers/media/usb/uvc/uvc_driver.c            |   4 +-
 drivers/usb/gadget/Kconfig                    |   1 +
 drivers/usb/gadget/function/uvc_v4l2.c        |  16 +-
 include/{media/v4l2-uvc.h => linux/usb/uvc.h} | 209 +-----------------
 9 files changed, 201 insertions(+), 219 deletions(-)
 create mode 100644 drivers/media/common/uvc.c
 rename include/{media/v4l2-uvc.h => linux/usb/uvc.h} (59%)

-- 
2.30.2

