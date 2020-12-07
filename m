Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC4442D0A9E
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 07:17:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725947AbgLGGRC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Dec 2020 01:17:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725681AbgLGGRC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Dec 2020 01:17:02 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 054BDC0613D0;
        Sun,  6 Dec 2020 22:16:22 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id 131so8751031pfb.9;
        Sun, 06 Dec 2020 22:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iiHJeltxaabT79se0AWHJdVn8cjl0nsmIZ6SNfEY33k=;
        b=mEEWtm2safQCv+8NZSg8SePHN/i5Nco09W1+dg1OrFiwGxiCJ78IAsNDJRx6s6F3L3
         gPvdwDxazf9opyNo+VgzCNupjvPsMz9BqNEKRdRVO9y+02OESF7aLC4JE8f6FEjvJ9PF
         UiRsYLc/ndFJqlgqSn7KOtBVyRA22D1GqulCpUwK5Uvbt68tlU6I6XpbKfbBggjFuM0i
         A26oV1jxxP0trhvDjeay0ppO6cj12bIGqpU6cMQxG3M/pJYi8a5klvnI7wYz9mJbrB+T
         AHpR44Q7d6iOUijRVGuokBBtTRcwjFjAaDtuxFp6YWG/UKKbPXfDaKVaTHnN6h7EL8HQ
         HhOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iiHJeltxaabT79se0AWHJdVn8cjl0nsmIZ6SNfEY33k=;
        b=W0UYW3MfNQo1YPm3K3OsT97NXWkDHa0hLUxJcFTG8zt4AIHPb2TFf2nl66UmquF5xI
         8qpmgNFu/X5PKHmEg2TlAL7CKQJsT7+QWZDb286uHPp5HOKRTyydAOd6gVix/QXumIWX
         kWLY/Khh4n+vL7zKI7WGLsMppjuQZ83YinC/kD7Te42mzqgUppJ4qXOQUa6zYSFudv95
         3IWWozUsKXIlPzHjwqIoWzR7ZHwZym8+o4vZkoJFSUSC5jlAgXNqhpWCckm/YP2wRxbO
         1RaHc/yIiTxrxRAa9wJmFf+dD7u50Xty1IKfDmZ27XTAOCGDhMzwjH3t4pFeeUM5N3b/
         zyvA==
X-Gm-Message-State: AOAM530xNiji45ynmgdjM4BdOqSGMIxoqKeFj5IhfrBi41gm8BjIUl3F
        f8DWS/nhj+aQnmcYzwIIj7giJVu6hiCTMOPJ
X-Google-Smtp-Source: ABdhPJxFk3QPKHQ9NUbh0kp8oNB+EHmXYJ3+kzsk3A3yR4fj0lmjc/CVUI76eEC4at7+YMr3wyiu+w==
X-Received: by 2002:a63:4516:: with SMTP id s22mr17486246pga.45.1607321781483;
        Sun, 06 Dec 2020 22:16:21 -0800 (PST)
Received: from localhost.localdomain ([49.207.214.127])
        by smtp.gmail.com with ESMTPSA id y24sm12555028pfn.176.2020.12.06.22.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Dec 2020 22:16:20 -0800 (PST)
From:   Anant Thazhemadam <anant.thazhemadam@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Anant Thazhemadam <anant.thazhemadam@gmail.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        syzbot+e27b4fd589762b0b9329@syzkaller.appspotmail.com
Subject: [PATCH] media: usb: dvd-usb: fix uninit-value bug in dibusb_read_eeprom_byte()
Date:   Mon,  7 Dec 2020 11:46:06 +0530
Message-Id: <20201207061606.163403-1-anant.thazhemadam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In dibusb_read_eeprom_byte(), if dibusb_i2c_msg() fails, val gets
assigned an value that's not properly initialized.
Using kzalloc() in place of kmalloc() for the buffer fixes this issue,
as the val can now be set to 0 in the event dibusb_i2c_msg() fails.

Reported-by: syzbot+e27b4fd589762b0b9329@syzkaller.appspotmail.com
Tested-by: syzbot+e27b4fd589762b0b9329@syzkaller.appspotmail.com
Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
---
 drivers/media/usb/dvb-usb/dibusb-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/dvb-usb/dibusb-common.c b/drivers/media/usb/dvb-usb/dibusb-common.c
index 02b51d1a1b67..aff60c10cb0b 100644
--- a/drivers/media/usb/dvb-usb/dibusb-common.c
+++ b/drivers/media/usb/dvb-usb/dibusb-common.c
@@ -223,7 +223,7 @@ int dibusb_read_eeprom_byte(struct dvb_usb_device *d, u8 offs, u8 *val)
 	u8 *buf;
 	int rc;
 
-	buf = kmalloc(2, GFP_KERNEL);
+	buf = kzalloc(2, GFP_KERNEL);
 	if (!buf)
 		return -ENOMEM;
 
-- 
2.25.1

