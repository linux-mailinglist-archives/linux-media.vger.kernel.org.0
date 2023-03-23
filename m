Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A622F6C66DB
	for <lists+linux-media@lfdr.de>; Thu, 23 Mar 2023 12:41:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231254AbjCWLle (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Mar 2023 07:41:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbjCWLld (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Mar 2023 07:41:33 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 848611043F
        for <linux-media@vger.kernel.org>; Thu, 23 Mar 2023 04:41:32 -0700 (PDT)
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <m.tretter@pengutronix.de>)
        id 1pfJJy-0007OB-9Q; Thu, 23 Mar 2023 12:41:30 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH 0/8] usb: gadget: uvc: fix errors reported by v4l2-compliance
Date:   Thu, 23 Mar 2023 12:41:09 +0100
Message-Id: <20230323-uvc-gadget-cleanup-v1-0-e41f0c5d9d8e@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANU6HGQC/02OywqDMBBFf0Vm3UFNLMX+SukiE8c4UGLIQwTx3
 xu76vLAPYd7QOIonODZHBB5kySrr9DfGrCL8Y5RpsqgOqU7rTSWzaIzk+OM9sPGl4DDg/phvBPP
 NEIVySRGisbb5VI977nNaxDblkR/gWsbIs+y/w683uf5BY+15COQAAAA
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Michael Grzeschik <m.grzeschik@pengutronix.de>,
        linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        kernel@pengutronix.de, Michael Tretter <m.tretter@pengutronix.de>
X-Mailer: b4 0.11.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series fixes various errors and warnings that are reported by
v4l2-compliance for the v4l2 output device created by the UVC gadget.

Most notably, it changes the driver to take the initial format from the
configfs instead of using a hard coded value that might be rejected later in
the SET_FORMAT call. Note that user space is still responsible for negotiating
the format with the UVC host.

Michael

To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Scally <dan.scally@ideasonboard.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc: linux-usb@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: kernel@pengutronix.de
Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>

---
Michael Tretter (8):
      usb: gadget: uvc: use fourcc printk helper
      usb: gadget: uvc: fix return code of REQBUFS
      usb: gadget: uvc: implement s/g_output ioctl
      usb: gadget: uvc: move video format initialization to uvc_v4l2
      usb: gadget: uvc: initialize video format using configfs
      usb: gadget: uvc: try harder to find a valid format
      usb: gadget: uvc: add colorspace handling
      usb: gadget: uvc: implement s/g_parm

 drivers/usb/gadget/function/f_uvc.c     |   2 +
 drivers/usb/gadget/function/uvc.h       |   5 +
 drivers/usb/gadget/function/uvc_queue.c |   6 +-
 drivers/usb/gadget/function/uvc_v4l2.c  | 235 ++++++++++++++++++++++++++++++--
 drivers/usb/gadget/function/uvc_v4l2.h  |   3 +
 drivers/usb/gadget/function/uvc_video.c |   5 -
 6 files changed, 238 insertions(+), 18 deletions(-)
---
base-commit: 8be174835f07b2c106b9961c0775486d06112a3c
change-id: 20230323-uvc-gadget-cleanup-47b1495befb9

Best regards,
-- 
Michael Tretter <m.tretter@pengutronix.de>
