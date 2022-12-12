Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE04264A83A
	for <lists+linux-media@lfdr.de>; Mon, 12 Dec 2022 20:47:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233360AbiLLTrx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Dec 2022 14:47:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233344AbiLLTrv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Dec 2022 14:47:51 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E8BA12609
        for <linux-media@vger.kernel.org>; Mon, 12 Dec 2022 11:47:50 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1p4om7-00034p-QO; Mon, 12 Dec 2022 20:47:43 +0100
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1p4om6-0045V5-C4; Mon, 12 Dec 2022 20:47:43 +0100
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1p4om5-00CZJ5-LT; Mon, 12 Dec 2022 20:47:41 +0100
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     laurent.pinchart@ideasonboard.com
Cc:     gregkh@linuxfoundation.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, linux-usb@vger.kernel.org,
        linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 0/5] usb: uvc: improve header files and function use
Date:   Mon, 12 Dec 2022 20:47:11 +0100
Message-Id: <20221212194716.2995569-1-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
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

Michael Grzeschik (5):
  usb: uvc: move media/v4l2-uvc.h to usb/uvc.h
  usb: uvc: move uvc_fmts and uvc_format_by_guid to own compile unit
  usb: uvc: make uvc_format_desc table const
  media: v4l2: move v4l_fill_fmtdesc to common v4l2_fill_fmtdesc
    function
  usb: uvc: use v4l2_fill_fmtdesc instead of open coded format name

 drivers/media/common/Kconfig                  |   3 +
 drivers/media/common/Makefile                 |   1 +
 drivers/media/common/uvc.c                    | 177 ++++++++++++
 drivers/media/usb/uvc/Kconfig                 |   1 +
 drivers/media/usb/uvc/uvc_ctrl.c              |   2 +-
 drivers/media/usb/uvc/uvc_driver.c            |  12 +-
 drivers/media/v4l2-core/v4l2-common.c         | 263 +++++++++++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c          | 264 +-----------------
 drivers/usb/gadget/Kconfig                    |   1 +
 drivers/usb/gadget/function/uvc_v4l2.c        |  16 +-
 include/{media/v4l2-uvc.h => linux/usb/uvc.h} | 206 +-------------
 include/media/v4l2-common.h                   |   2 +
 12 files changed, 466 insertions(+), 482 deletions(-)
 create mode 100644 drivers/media/common/uvc.c
 rename include/{media/v4l2-uvc.h => linux/usb/uvc.h} (59%)

-- 
2.30.2

