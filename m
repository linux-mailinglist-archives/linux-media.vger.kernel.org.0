Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 870CD3B3C44
	for <lists+linux-media@lfdr.de>; Fri, 25 Jun 2021 07:33:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230192AbhFYFgQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Jun 2021 01:36:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbhFYFgO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Jun 2021 01:36:14 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A88FC061574;
        Thu, 24 Jun 2021 22:33:54 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id g24so4810691pji.4;
        Thu, 24 Jun 2021 22:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VQoN7+7QargeetsXxpA8OHPMu1/ktlz7NWRsGKdKNks=;
        b=nx6MokHwnQzz6LZVX6pkU7VOZNuGvAGmX3H+HeWsFUdFoyzNhct2Qf3Zg2XuR82Iys
         MZBni6BR7UFS3wIgfsXbcR6j00TwISBVzd1NxacKnxhXioMqc3ohwQfgHpeWVIoAtfSb
         TF65R+ihL/RzvJhJrDLg97r7w/CI6NQ65juyJmZeJ17+EgRrFQ5/2spnORKS2FHGb58F
         IJ9f7yxEPU1Hv0ZXbzLvaFDXP9TRF7Z/s5gTq/V/DjABMZj2iSpEmLkI/uKwPW1Qk9PC
         ewDLn659KgUDVKJQ4gMvI9Ars3yK6ORb67cF6BdX8e+mfKjkq7S10xx+PiM2yszoydJQ
         pqpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VQoN7+7QargeetsXxpA8OHPMu1/ktlz7NWRsGKdKNks=;
        b=ciPsGpUysUXcTdxgIxgZ90Kdr02wjJtxRW9tzc6vfhEoo4P+8L04TR9Nc2CesFTR3Q
         W+UGlAHANb583NHtXsIG/cIFsIZW2gcK0PMk8U+Yh6iKMZQcP1T+SpBTD7SShV8budbJ
         sJVSgPItE0Q2OJ2rCdVD4ykFEINCQpo2LQRkGah4u9HA33PNOTeYTQnn1JpBoyoTpjRL
         CXCdKcenZYG5jy+z0JrX9eThJZXbDKbhggL5trRURW3m3TJjLArhgIHLANO3BA62NyWY
         325I267aYOwMzw68XdMr9jAFS9mLbjR3WY2yO4BtY5xeqcRsn2IIz/sSy7+6w9p91jrN
         Ex5Q==
X-Gm-Message-State: AOAM533uzILT3pLw2YEpesCob9gJn5QO/m3NajuWY8vT2S9p+s7xJIKA
        Rv5rFDfTgcb/RLUbIR0B1ck=
X-Google-Smtp-Source: ABdhPJxApS8W7KWk7eF40vYnGjkm69GxpeZIw7ZJJ/Ed0bYqTzt3c/R7TvUQsvQ1ul3TZwPQgASO2w==
X-Received: by 2002:a17:90b:1809:: with SMTP id lw9mr9378757pjb.128.1624599233471;
        Thu, 24 Jun 2021 22:33:53 -0700 (PDT)
Received: from localhost.localdomain ([45.135.186.130])
        by smtp.gmail.com with ESMTPSA id v13sm4802883pja.44.2021.06.24.22.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 22:33:52 -0700 (PDT)
From:   Dongliang Mu <mudongliangabcd@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dongliang Mu <mudongliangabcd@gmail.com>
Cc:     syzbot+e27b4fd589762b0b9329@syzkaller.appspotmail.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: dvb-usb: fix uninit-value in dvb_usb_adapter_dvb_init
Date:   Fri, 25 Jun 2021 13:33:27 +0800
Message-Id: <20210625053335.466325-1-mudongliangabcd@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If dibusb_read_eeprom_byte fails, the mac address is not initialized.
And nova_t_read_mac_address does not handle this failure, which leads to
the uninit-value in dvb_usb_adapter_dvb_init.

Fix this by handling the failure of dibusb_read_eeprom_byte.

Reported-by: syzbot+e27b4fd589762b0b9329@syzkaller.appspotmail.com
Fixes: 786baecfe78f ("[media] dvb-usb: move it to drivers/media/usb/dvb-usb")
Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
---
 drivers/media/usb/dvb-usb/nova-t-usb2.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/dvb-usb/nova-t-usb2.c b/drivers/media/usb/dvb-usb/nova-t-usb2.c
index e7b290552b66..07d3d68612e7 100644
--- a/drivers/media/usb/dvb-usb/nova-t-usb2.c
+++ b/drivers/media/usb/dvb-usb/nova-t-usb2.c
@@ -130,7 +130,7 @@ static int nova_t_rc_query(struct dvb_usb_device *d, u32 *event, int *state)
 
 static int nova_t_read_mac_address (struct dvb_usb_device *d, u8 mac[6])
 {
-	int i;
+	int i, ret;
 	u8 b;
 
 	mac[0] = 0x00;
@@ -139,7 +139,9 @@ static int nova_t_read_mac_address (struct dvb_usb_device *d, u8 mac[6])
 
 	/* this is a complete guess, but works for my box */
 	for (i = 136; i < 139; i++) {
-		dibusb_read_eeprom_byte(d,i, &b);
+		ret = dibusb_read_eeprom_byte(d,i, &b);
+		if (ret)
+			return ret;
 
 		mac[5 - (i - 136)] = b;
 	}
-- 
2.25.1

