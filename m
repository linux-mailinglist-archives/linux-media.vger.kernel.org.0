Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A73223E91D
	for <lists+linux-media@lfdr.de>; Fri,  7 Aug 2020 10:37:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728052AbgHGIhL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Aug 2020 04:37:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728050AbgHGIhJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Aug 2020 04:37:09 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7F02C061574;
        Fri,  7 Aug 2020 01:37:08 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id b25so742334qto.2;
        Fri, 07 Aug 2020 01:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k9aUK2mQpB8IUygH+TuB5qk+mim3+DkPUwL5ZlVMSOM=;
        b=PHeeuNJ3apNOk15b2QOv8shZLy0RH/ehXfLnQRSBO/pRPQUro2N/otiSAX+vzct/TQ
         i5hTW6ZLbOykcrNAmMPZt8RAa3dEaXH+DPZS4i5hAYK4soNTjk4e4N92Xnk8ZsZaAcF5
         mlth3TsASjt+nhTeG8H/ZMrLhsDkLXHFietLqViDCeclj+AsYaCah0ezU95UGFkxLsWP
         /ZEq9Jf9DX0H4VUHqm9XAXdIjBBa0fd0bhL3/gn7o3+ep9ULE/kCq5JGbSI0kVsXB+l+
         05wInMQrVHpOAT6ItExQbXhac2HFCTcSP3yuZk1RZCXoWIFtyVJj0REi7wZ0fgBafPla
         TjJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k9aUK2mQpB8IUygH+TuB5qk+mim3+DkPUwL5ZlVMSOM=;
        b=GjkkcUYlIH//zhcu9rQUn7Mt69NTqCnZ2962/DR+L6uU5LDLAhN+L3Ah/uh1y4eJLw
         L392AozgB1zXAI48zWgMzxPgH9oTl5vQOs5RDiCVzQOuPfwjUIS63Qk/xdjhs+dwySW8
         xTIGMdrqALBp+8u77ClgJ9OWZfyxaRw+0vRnfjEos3VqSfhcNihpd+z5kD3DXGCc3fKn
         R+YTfYZevH51Ha8QifukuL2iuYFTL0EedBvr3qkGmM1ovQYiWxKRDEBYsaNld5XGrE2X
         hOfrX2E++rtx3GBOs9Mhy5cNekNiqYe8KvgwU1sJCJVHlWbTo0p7rKkKw+nhasm/cKWf
         x2QA==
X-Gm-Message-State: AOAM530BPBDKG04/DZcSPKSlwhJNU6yJKy869TkBZOsm9otRyQ8CO7iu
        e4fFeD9S2khW+sPUyinLekWGOF3baH2wrg==
X-Google-Smtp-Source: ABdhPJxfPB9mOhGr52D8DmaLxitiBQWCE+ifnjrd7sQoC2MSZQCoqKKh2UHdXWmdFOHmQIjeEIX9yg==
X-Received: by 2002:aed:2f02:: with SMTP id l2mr13204988qtd.48.1596789428090;
        Fri, 07 Aug 2020 01:37:08 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
        by smtp.gmail.com with ESMTPSA id c42sm7846728qte.5.2020.08.07.01.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2020 01:37:07 -0700 (PDT)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     skhan@linuxfoundation.org,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 18/20] media: pci: cobalt-i2c.c: fix comparison of 0/1 to bool variable
Date:   Fri,  7 Aug 2020 05:35:45 -0300
Message-Id: <20200807083548.204360-18-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Fix the following coccinelle reports:

drivers/media/pci/cobalt/cobalt-i2c.c:176:16-21: WARNING:
Comparison of 0/1 to bool variable
drivers/media/pci/cobalt/cobalt-i2c.c:180:29-33: WARNING:
Comparison of 0/1 to bool variable
drivers/media/pci/cobalt/cobalt-i2c.c:121:16-21: WARNING:
Comparison of 0/1 to bool variable
drivers/media/pci/cobalt/cobalt-i2c.c:125:29-33: WARNING:
Comparison of 0/1 to bool variable

Found using - Coccinelle (http://coccinelle.lip6.fr)

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/pci/cobalt/cobalt-i2c.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/cobalt/cobalt-i2c.c b/drivers/media/pci/cobalt/cobalt-i2c.c
index c374dae78bf7..10c9ee33f73e 100644
--- a/drivers/media/pci/cobalt/cobalt-i2c.c
+++ b/drivers/media/pci/cobalt/cobalt-i2c.c
@@ -118,11 +118,11 @@ static int cobalt_tx_bytes(struct cobalt_i2c_regs __iomem *regs,
 		iowrite8(data[i], &regs->txr_rxr);
 
 		/* Setup command */
-		if (i == 0 && start != 0) {
+		if (i == 0 && start) {
 			/* Write + Start */
 			cmd = M00018_CR_BITMAP_WR_MSK |
 			      M00018_CR_BITMAP_STA_MSK;
-		} else if (i == len - 1 && stop != 0) {
+		} else if (i == len - 1 && stop) {
 			/* Write + Stop */
 			cmd = M00018_CR_BITMAP_WR_MSK |
 			      M00018_CR_BITMAP_STO_MSK;
@@ -173,11 +173,11 @@ static int cobalt_rx_bytes(struct cobalt_i2c_regs __iomem *regs,
 
 	for (i = 0; i < len; i++) {
 		/* Setup command */
-		if (i == 0 && start != 0) {
+		if (i == 0 && start) {
 			/* Read + Start */
 			cmd = M00018_CR_BITMAP_RD_MSK |
 			      M00018_CR_BITMAP_STA_MSK;
-		} else if (i == len - 1 && stop != 0) {
+		} else if (i == len - 1 && stop) {
 			/* Read + Stop */
 			cmd = M00018_CR_BITMAP_RD_MSK |
 			      M00018_CR_BITMAP_STO_MSK;
-- 
2.28.0

