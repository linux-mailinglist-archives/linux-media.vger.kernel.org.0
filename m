Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2F3F1FAF8B
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2020 13:53:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728549AbgFPLxA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jun 2020 07:53:00 -0400
Received: from smtp.asem.it ([151.1.184.197]:53186 "EHLO smtp.asem.it"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726306AbgFPLxA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jun 2020 07:53:00 -0400
Received: from webmail.asem.it
        by asem.it (smtp.asem.it)
        (SecurityGateway 6.5.2)
        with ESMTP id SG000321165.MSG 
        for <linux-media@vger.kernel.org>; Tue, 16 Jun 2020 13:52:58 +0200S
Received: from ASAS044.asem.intra (172.16.16.44) by ASAS044.asem.intra
 (172.16.16.44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 16
 Jun 2020 13:52:56 +0200
Received: from flavio-x.asem.intra (172.16.17.208) by ASAS044.asem.intra
 (172.16.16.44) with Microsoft SMTP Server id 15.1.1979.3 via Frontend
 Transport; Tue, 16 Jun 2020 13:52:56 +0200
From:   Flavio Suligoi <f.suligoi@asem.it>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Flavio Suligoi <f.suligoi@asem.it>
Subject: [PATCH 1/1] media: pci: dt3155: fix spelling mistake
Date:   Tue, 16 Jun 2020 13:52:55 +0200
Message-ID: <20200616115255.6280-1-f.suligoi@asem.it>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-SGHeloLookup-Result: pass smtp.helo=webmail.asem.it (ip=172.16.16.44)
X-SGSPF-Result: none (smtp.asem.it)
X-SGOP-RefID: str=0001.0A090203.5EE8B299.0039,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0 (_st=1 _vt=0 _iwf=0)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix typo: "TRIGER" --> "TRIGGER"

Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
---
 drivers/media/pci/dt3155/dt3155.c | 2 +-
 drivers/media/pci/dt3155/dt3155.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/dt3155/dt3155.c b/drivers/media/pci/dt3155/dt3155.c
index 82581aa5a2a3..ef8d5c9cfffe 100644
--- a/drivers/media/pci/dt3155/dt3155.c
+++ b/drivers/media/pci/dt3155/dt3155.c
@@ -426,7 +426,7 @@ static int dt3155_init_board(struct dt3155_priv *pd)
 	iowrite32(FIFO_EN | SRST, pd->regs + CSR1);
 	iowrite32(0xEEEEEE01, pd->regs + EVEN_PIXEL_FMT);
 	iowrite32(0xEEEEEE01, pd->regs + ODD_PIXEL_FMT);
-	iowrite32(0x00000020, pd->regs + FIFO_TRIGER);
+	iowrite32(0x00000020, pd->regs + FIFO_TRIGGER);
 	iowrite32(0x00000103, pd->regs + XFER_MODE);
 	iowrite32(0, pd->regs + RETRY_WAIT_CNT);
 	iowrite32(0, pd->regs + INT_CSR);
diff --git a/drivers/media/pci/dt3155/dt3155.h b/drivers/media/pci/dt3155/dt3155.h
index 43d32b8d5feb..c9ce79cb5566 100644
--- a/drivers/media/pci/dt3155/dt3155.h
+++ b/drivers/media/pci/dt3155/dt3155.h
@@ -31,7 +31,7 @@
 #define ODD_DMA_STRIDE	 0x24
 #define EVEN_PIXEL_FMT	 0x30
 #define ODD_PIXEL_FMT	 0x34
-#define FIFO_TRIGER	 0x38
+#define FIFO_TRIGGER	 0x38
 #define XFER_MODE	 0x3C
 #define CSR1		 0x40
 #define RETRY_WAIT_CNT	 0x44
-- 
2.17.1

