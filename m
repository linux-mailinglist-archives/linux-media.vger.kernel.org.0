Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46CEC588B8
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2019 19:38:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726863AbfF0Riq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 13:38:46 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:37096 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726508AbfF0Riq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 13:38:46 -0400
Received: by mail-pf1-f193.google.com with SMTP id 19so1587784pfa.4;
        Thu, 27 Jun 2019 10:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=ILvJeXXrJtIpar6XfvJXT/7Myht5vQDgIN3UR4dQtvM=;
        b=o6/y93bY03CS3Hh0zXZTxAOSkT2wDSwUwRQT0pXSrPY28PCoSMMxKejNC7sCFWt9qJ
         A2/HdkX5KHDUGpOR1sQVjKPX+CN7M/aGmxUyo3ftfS7ghtMKPn01ItVZGpzoOszRz0LS
         KmM8o9nsVTHDCbfDLdYsFuSUEUSCCd+HPLH4CPg46NwdXRWu1ynrKILuByxx7rcc3A/8
         hlFg+F7OIWriCFcqunyT/ZdOa24ycIwZ7GAWdSRChY86+CSoEvFxlVTD14uj0qoUl98f
         nygUVmrK3Xl57QcDyslwhqR5iommy8XswWxDcElMH3qEVNL4/iE/kdh7ksYZOY+v2UO1
         E8Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ILvJeXXrJtIpar6XfvJXT/7Myht5vQDgIN3UR4dQtvM=;
        b=hiv/0dqZLLMcTGGz76QE01gxRkIQhSxnOOB/Gv9AreJX//z2JbGn8BBKY8zEkx0Vok
         RLcLH/eOTHJbWzrE16Z9WR8i1Xzw7d82n87XtF0bF0ZrFx3g3YmNZ3xP/s7qOoIOPCLr
         AMVnUQW16c9dkrdy7jjSRy1Y4TSwyQhrWtwy554cinQ6oHJ8BGvPNT01BUa4aUYrXIHy
         j0tovhxQciPseVE3JKgiQabkcOg2H4cd5/WKX0gPhiiiJVFR+t9iozRoRd68m7X+xIg0
         fDKEmCrkyTUR0p3+LNY89oYM0sPGy3lers4rN+9NNbSRI+uNtAB2Ed41kwYI0G6lS77s
         eQ5A==
X-Gm-Message-State: APjAAAWI/WBuennTchdARhzgWHw4PZpdZAisPJ8pxzRU4TZWDXrs85CN
        uoef1g2P+E3dbBRGZZha19svlr7NKrpEyQ==
X-Google-Smtp-Source: APXvYqzJ94WZYLrg+GzEnmZ/FVsSAAVSrinsjqrv1x92ZgviqosaudTwXRwBB8jwUbywDlDdMBuytA==
X-Received: by 2002:a17:90a:3aed:: with SMTP id b100mr7503627pjc.63.1561657125744;
        Thu, 27 Jun 2019 10:38:45 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.googlemail.com with ESMTPSA id n98sm6576526pjc.26.2019.06.27.10.38.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2019 10:38:45 -0700 (PDT)
From:   Fuqian Huang <huangfq.daxian@gmail.com>
Cc:     Fuqian Huang <huangfq.daxian@gmail.com>,
        Mike Isely <isely@pobox.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 32/87] usb: pvrusb2: replace kmalloc and memset with kzalloc in pvrusb2-eeprom.c
Date:   Fri, 28 Jun 2019 01:38:39 +0800
Message-Id: <20190627173840.3519-1-huangfq.daxian@gmail.com>
X-Mailer: git-send-email 2.11.0
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

kmalloc + memset(0) -> kzalloc

Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
---
 drivers/media/usb/pvrusb2/pvrusb2-eeprom.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/usb/pvrusb2/pvrusb2-eeprom.c b/drivers/media/usb/pvrusb2/pvrusb2-eeprom.c
index 79f0e0c6df37..fac90af8b537 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-eeprom.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-eeprom.c
@@ -39,7 +39,7 @@ static u8 *pvr2_eeprom_fetch(struct pvr2_hdw *hdw)
 	int ret;
 	int mode16 = 0;
 	unsigned pcnt,tcnt;
-	eeprom = kmalloc(EEPROM_SIZE,GFP_KERNEL);
+	eeprom = kzalloc(EEPROM_SIZE,GFP_KERNEL);
 	if (!eeprom) {
 		pvr2_trace(PVR2_TRACE_ERROR_LEGS,
 			   "Failed to allocate memory required to read eeprom");
@@ -74,7 +74,6 @@ static u8 *pvr2_eeprom_fetch(struct pvr2_hdw *hdw)
 	   (1) we're only fetching part of the eeprom, and (2) if we were
 	   getting the whole thing our I2C driver can't grab it in one
 	   pass - which is what tveeprom is otherwise going to attempt */
-	memset(eeprom,0,EEPROM_SIZE);
 	for (tcnt = 0; tcnt < EEPROM_SIZE; tcnt += pcnt) {
 		pcnt = 16;
 		if (pcnt + tcnt > EEPROM_SIZE) pcnt = EEPROM_SIZE-tcnt;
-- 
2.11.0

