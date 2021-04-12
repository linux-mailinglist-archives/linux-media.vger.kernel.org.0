Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CB7A35C7C3
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 15:36:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241680AbhDLNg6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 09:36:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239992AbhDLNg6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 09:36:58 -0400
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C906CC061574;
        Mon, 12 Apr 2021 06:36:38 -0700 (PDT)
Received: by mail-qv1-xf2b.google.com with SMTP id i3so685728qvj.7;
        Mon, 12 Apr 2021 06:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=HFLBwpH7bnJqRpBXV3LZM+eIf2wqGdsU526G+Z9OgrU=;
        b=XYLX8Shi4RLk9DI1jD3w47/7MIzpiCqHhzNKrsRsHFhrOJUs5vRtrHUcsOdB62p685
         71OM0XXU3JHwK6+0c6TP0I7twL1HiKLVTPK0mx+vJgq4K1P2urXIy7l+26wPMzIbZJgQ
         lNiCD7jlSiPq5AFhqgiXAzIzNaN7zYyNXsYI1dg7o8EP0hLNFwxTyUVrK1M34G9IiiXU
         wiS14CpnmH88v0InxYj9Vg6Fy3wEOqXj2qeb5vPpE1m+XIO4o4NBMlxaJq4uUccjWOfW
         Xe89ZEZ4gqLuGtU/7R3cvyTq1GTinSjYfX37pje+XWF3KRDp2HZGFN5bZvizL2Yxu/YL
         F/JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=HFLBwpH7bnJqRpBXV3LZM+eIf2wqGdsU526G+Z9OgrU=;
        b=eSgxEPjI7jh6By3y5EAfrTEDjZORlhU5nioKoB2J4cugNeK0OG196Bw4B4wd8UwZDw
         C5uCuOADEqjck85i1L/O/XwVs1uQJ6qokdBsJqswBlZ9sF1m+EgVPo2qQDys8sueigB9
         9Q56R34jaiDyUUORMBxZQrRWsjeqv9+mFjDpo/H/ZAMGx4PqWB4h3iUPsQBcboIMhyvu
         zITXcl+LjALGQm3WZjopuBI72Bt0aTvW3RuYSSj+DRlI/LPTOScNQNys4GCK0ylzod6X
         G0Lv5ii4Nm4isys1N+KhugGsLx+haz9abg2rvMg+Q0iSVGQvDo7WSShGkUq+w2NHMykF
         QXyQ==
X-Gm-Message-State: AOAM5329Y/0EvfQvVGe8mgHQuukD3BOTHsb6Wq7GUGW+zNKSlOiqpjgd
        vqt0qr1vlKuW3KW9cxESMq8=
X-Google-Smtp-Source: ABdhPJyhwqbpDxJEqURyhnTserSFuV7XnsTLZjpKfCPJMLXshFRaBPkg6pUAXHOyMEzrHjw9JCDIcQ==
X-Received: by 2002:a0c:fc46:: with SMTP id w6mr9852472qvp.0.1618234597739;
        Mon, 12 Apr 2021 06:36:37 -0700 (PDT)
Received: from focaruja ([2001:1284:f016:a037:476a:dfcd:f18f:9ad5])
        by smtp.gmail.com with ESMTPSA id b15sm3419566qtg.82.2021.04.12.06.36.36
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Mon, 12 Apr 2021 06:36:37 -0700 (PDT)
Date:   Mon, 12 Apr 2021 10:36:34 -0300
From:   Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: [PATCH] staging: media: omap4iss: Replace macro function by static
 inline function in file iss_csi2.c
Message-ID: <20210412133634.GA1791@focaruja>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Replace macro function by static inline function.
Issue suggested by Julia.

Signed-off-by: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
---
 drivers/staging/media/omap4iss/iss_csi2.c | 49 ++++++++++++++++---------------
 1 file changed, 26 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/media/omap4iss/iss_csi2.c b/drivers/staging/media/omap4iss/iss_csi2.c
index a6dc2d2..cbeba44 100644
--- a/drivers/staging/media/omap4iss/iss_csi2.c
+++ b/drivers/staging/media/omap4iss/iss_csi2.c
@@ -597,9 +597,12 @@ static int csi2_configure(struct iss_csi2_device *csi2)
 /*
  * csi2_print_status - Prints CSI2 debug information.
  */
-#define CSI2_PRINT_REGISTER(iss, regs, name)\
-	dev_dbg(iss->dev, "###CSI2 " #name "=0x%08x\n", \
-		iss_reg_read(iss, regs, CSI2_##name))
+static inline csi2_print_register(iss, regs, name)
+{
+	dev_dbg(iss->dev, "###CSI2 " #name "=0x%08x\n",
+		iss_reg_read(iss, regs, CSI2_##name));
+}
+
 
 static void csi2_print_status(struct iss_csi2_device *csi2)
 {
@@ -610,26 +613,26 @@ static void csi2_print_status(struct iss_csi2_device *csi2)
 
 	dev_dbg(iss->dev, "-------------CSI2 Register dump-------------\n");
 
-	CSI2_PRINT_REGISTER(iss, csi2->regs1, SYSCONFIG);
-	CSI2_PRINT_REGISTER(iss, csi2->regs1, SYSSTATUS);
-	CSI2_PRINT_REGISTER(iss, csi2->regs1, IRQENABLE);
-	CSI2_PRINT_REGISTER(iss, csi2->regs1, IRQSTATUS);
-	CSI2_PRINT_REGISTER(iss, csi2->regs1, CTRL);
-	CSI2_PRINT_REGISTER(iss, csi2->regs1, DBG_H);
-	CSI2_PRINT_REGISTER(iss, csi2->regs1, COMPLEXIO_CFG);
-	CSI2_PRINT_REGISTER(iss, csi2->regs1, COMPLEXIO_IRQSTATUS);
-	CSI2_PRINT_REGISTER(iss, csi2->regs1, SHORT_PACKET);
-	CSI2_PRINT_REGISTER(iss, csi2->regs1, COMPLEXIO_IRQENABLE);
-	CSI2_PRINT_REGISTER(iss, csi2->regs1, DBG_P);
-	CSI2_PRINT_REGISTER(iss, csi2->regs1, TIMING);
-	CSI2_PRINT_REGISTER(iss, csi2->regs1, CTX_CTRL1(0));
-	CSI2_PRINT_REGISTER(iss, csi2->regs1, CTX_CTRL2(0));
-	CSI2_PRINT_REGISTER(iss, csi2->regs1, CTX_DAT_OFST(0));
-	CSI2_PRINT_REGISTER(iss, csi2->regs1, CTX_PING_ADDR(0));
-	CSI2_PRINT_REGISTER(iss, csi2->regs1, CTX_PONG_ADDR(0));
-	CSI2_PRINT_REGISTER(iss, csi2->regs1, CTX_IRQENABLE(0));
-	CSI2_PRINT_REGISTER(iss, csi2->regs1, CTX_IRQSTATUS(0));
-	CSI2_PRINT_REGISTER(iss, csi2->regs1, CTX_CTRL3(0));
+	csi2_print_register(iss, csi2->regs1, SYSCONFIG);
+	csi2_print_register(iss, csi2->regs1, SYSSTATUS);
+	csi2_print_register(iss, csi2->regs1, IRQENABLE);
+	csi2_print_register(iss, csi2->regs1, IRQSTATUS);
+	csi2_print_register(iss, csi2->regs1, CTRL);
+	csi2_print_register(iss, csi2->regs1, DBG_H);
+	csi2_print_register(iss, csi2->regs1, COMPLEXIO_CFG);
+	csi2_print_register(iss, csi2->regs1, COMPLEXIO_IRQSTATUS);
+	csi2_print_register(iss, csi2->regs1, SHORT_PACKET);
+	csi2_print_register(iss, csi2->regs1, COMPLEXIO_IRQENABLE);
+	csi2_print_register(iss, csi2->regs1, DBG_P);
+	csi2_print_register(iss, csi2->regs1, TIMING);
+	csi2_print_register(iss, csi2->regs1, CTX_CTRL1(0));
+	csi2_print_register(iss, csi2->regs1, CTX_CTRL2(0));
+	csi2_print_register(iss, csi2->regs1, CTX_DAT_OFST(0));
+	csi2_print_register(iss, csi2->regs1, CTX_PING_ADDR(0));
+	csi2_print_register(iss, csi2->regs1, CTX_PONG_ADDR(0));
+	csi2_print_register(iss, csi2->regs1, CTX_IRQENABLE(0));
+	csi2_print_register(iss, csi2->regs1, CTX_IRQSTATUS(0));
+	csi2_print_register(iss, csi2->regs1, CTX_CTRL3(0));
 
 	dev_dbg(iss->dev, "--------------------------------------------\n");
 }
-- 
2.7.4

