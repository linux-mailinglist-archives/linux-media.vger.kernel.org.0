Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02E55588BB
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2019 19:39:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726688AbfF0Ri6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 13:38:58 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:37424 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726508AbfF0Ri5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 13:38:57 -0400
Received: by mail-pg1-f196.google.com with SMTP id 25so1342029pgy.4;
        Thu, 27 Jun 2019 10:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=l77SWRoBIHoK9a0cWIJB2K1I9BXAHdpgkh62i7lteaI=;
        b=pBK+PQ7vNNXMUNvRrKgmwSOYumr4wHPBKPoKeTMmK+F1WTR6caF7ck3f7bub+oSbq5
         b7QwhT3Blnqb3gUDdfPXWpKZTfpG9QROQ/9JxwEOWr7EkHuaymVllWYfai2wXmICmF1r
         +PcOlI1fhfWY9hm9+Zg9wwQXA2bW+jVO69oRsVs6Kk6BWSh6T4JxTFOskvVx2TV4JE6L
         NRl2ZrHpuhkYh8xmv/CoY/H+Q75dwdx974SJd/M4gwU1q8sKx6sYzgRCNvPvGkH6oraJ
         gUPlU1J/m/wmscVlEiUnYVwGYiIFTc0dsVgMtuSnIfuE3WgJKSn9ZzAn89M/QlXWbYU/
         DDNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=l77SWRoBIHoK9a0cWIJB2K1I9BXAHdpgkh62i7lteaI=;
        b=TRjmyHm6SPe1nOm+6LT8/baZK0EGvFzFgjsFkEJwBbqQrALPoJMze7iPVFt9ndQT7F
         wguaTIlVCu9ao6OCBNtlmRKwawlAXJTk03jurxYbNYRNEKSH44z3Ivdoa+CNmXX7kRf2
         23f6qtzb5hiLU5qNUVYpnScNdzXC+EMhHACCqyTPYV/kZwMkmpYcb5CCG2Pi+febjbAB
         3jS5y+UNKeQo+UCJif5b49ryM/UV9VbOLOeCDOn7mJNgTH7XRHJrZ49zib/13vsazA/P
         emujz30jf5EAbL1sqpcuzrWCrUEKXm/jixTPqfCqXTRlPWkIK/D3XAfZ0lYpBETtGt0k
         uEVg==
X-Gm-Message-State: APjAAAVs2pplaZZSYCzpcFCa6ZQZMYk6hBeDaNKg/apub1h48Gt8Yked
        lFJuP7kiS3KcJVGLlAvtqco=
X-Google-Smtp-Source: APXvYqyFDmdsOVzz5JMrB7B1rJfLVQ15Sj8U3x0L1xsIz0tFY90YloEg+3C4yrtXHqA1wG7jTHv1pA==
X-Received: by 2002:a65:6495:: with SMTP id e21mr4726679pgv.383.1561657136560;
        Thu, 27 Jun 2019 10:38:56 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.googlemail.com with ESMTPSA id h6sm3862006pfn.79.2019.06.27.10.38.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2019 10:38:56 -0700 (PDT)
From:   Fuqian Huang <huangfq.daxian@gmail.com>
Cc:     Fuqian Huang <huangfq.daxian@gmail.com>,
        Mike Isely <isely@pobox.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 33/87] usb: pvrusb2: replace kmalloc and memset with kzalloc
Date:   Fri, 28 Jun 2019 01:38:50 +0800
Message-Id: <20190627173850.3571-1-huangfq.daxian@gmail.com>
X-Mailer: git-send-email 2.11.0
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

kmalloc + memset(0) -> kzalloc

Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
---
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
index 70b5cb08d65b..ff75b4a53dfa 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
@@ -3309,7 +3309,7 @@ static u8 *pvr2_full_eeprom_fetch(struct pvr2_hdw *hdw)
 	int ret;
 	int mode16 = 0;
 	unsigned pcnt,tcnt;
-	eeprom = kmalloc(EEPROM_SIZE,GFP_KERNEL);
+	eeprom = kzalloc(EEPROM_SIZE,GFP_KERNEL);
 	if (!eeprom) {
 		pvr2_trace(PVR2_TRACE_ERROR_LEGS,
 			   "Failed to allocate memory required to read eeprom");
@@ -3344,7 +3344,6 @@ static u8 *pvr2_full_eeprom_fetch(struct pvr2_hdw *hdw)
 	   (1) we're only fetching part of the eeprom, and (2) if we were
 	   getting the whole thing our I2C driver can't grab it in one
 	   pass - which is what tveeprom is otherwise going to attempt */
-	memset(eeprom,0,EEPROM_SIZE);
 	for (tcnt = 0; tcnt < EEPROM_SIZE; tcnt += pcnt) {
 		pcnt = 16;
 		if (pcnt + tcnt > EEPROM_SIZE) pcnt = EEPROM_SIZE-tcnt;
-- 
2.11.0

