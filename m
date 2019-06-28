Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 466FD59199
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2019 04:49:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727179AbfF1CsD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 22:48:03 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:44908 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726818AbfF1CsD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 22:48:03 -0400
Received: by mail-pf1-f194.google.com with SMTP id t16so2177771pfe.11;
        Thu, 27 Jun 2019 19:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=rsPonA+LoPMnREzyOjv+yCOVy4+lZMOat92F/ls7OsU=;
        b=q0Kmn6JBDMWr863rqbl043/wnXxZdt2WetVxNy6oyj9hJ14E30v+VuIz9qgeZiSpce
         nWj5PQSXUsr0lAUNeQf6Ui16vkL3YFlMhoYjuPa/sIva667KZPce+Hg9qh4znBQ6AIPn
         A6aJ46/T/OctXwOkliS9qpPKNU8pxhBJRsPj0S2WLWz6Z0jiedOnUcQY1auGNHpYmjnX
         UW64IyROag4ph/sFjkZpxM1EseAXjKAJC6aM+ePJoAgnXcitTqVC1hxgiMYrSKHND4yz
         Dk2hSqxq/0tRXYtJkWlktQbxVrIay1rB6P8JPQ4MXxJngULVk4m0a7M8V9TCy2zJ8k2e
         tRjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=rsPonA+LoPMnREzyOjv+yCOVy4+lZMOat92F/ls7OsU=;
        b=gPtUY1wPw7P8nDjNa4mg1NtqHtkDyV3SLtXrAsdK7NcFFYxXh7Dc1phyitLwbmllvu
         ujFCbUixRKx5fhl2rn5fRTBxFd8UiHT9RZ8KGjB09113LcpN99oWZIQTX5e7eslGw+Mz
         PMKwZDfzKH7FggDF9Jf7lQYYTHm7bM/ANEumjIxG0Xn3fw3uDXxDTUmv0+jSEE6vnBSA
         0z3cZUU+882EMzCGNrG2EhYuKV2fEdhTJ9Prj2hPkZKUlps5wrZpyI2Rlm163KYia4yj
         xy/TCS9eJCJ/GZMbJj1PhTjZBsh/jPJ5sx0xstwPEi4dX5PVvM9FR4vuKiP1UWLoq+zs
         wYLQ==
X-Gm-Message-State: APjAAAUsah01W6WdHs4OiD8NylYOMN37zaO8tsolki+M0+kWvnGu125y
        nozMN4+SkMbxTMwq+UBe5tU=
X-Google-Smtp-Source: APXvYqym3fkD8EOsdW/dAOTE2+FIluU4b7I3vmxn1f0D3QENIyYOZwV4riKQHXlQt8k6csxXiy6dxg==
X-Received: by 2002:a63:24c1:: with SMTP id k184mr7161368pgk.120.1561690082750;
        Thu, 27 Jun 2019 19:48:02 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.googlemail.com with ESMTPSA id g13sm454755pfi.93.2019.06.27.19.48.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2019 19:48:02 -0700 (PDT)
From:   Fuqian Huang <huangfq.daxian@gmail.com>
Cc:     Fuqian Huang <huangfq.daxian@gmail.com>,
        Mike Isely <isely@pobox.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 12/27] media: use kzalloc instead of kmalloc and memset
Date:   Fri, 28 Jun 2019 10:47:56 +0800
Message-Id: <20190628024756.15422-1-huangfq.daxian@gmail.com>
X-Mailer: git-send-email 2.11.0
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Replace kmalloc followed by a memset with kzalloc.

Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
---
 drivers/media/usb/pvrusb2/pvrusb2-eeprom.c | 3 +--
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c    | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

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

