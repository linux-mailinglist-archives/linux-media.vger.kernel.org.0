Return-Path: <linux-media+bounces-38060-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 96723B0A477
	for <lists+linux-media@lfdr.de>; Fri, 18 Jul 2025 14:53:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3E67A831E5
	for <lists+linux-media@lfdr.de>; Fri, 18 Jul 2025 12:52:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E9352D97B4;
	Fri, 18 Jul 2025 12:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TZZOzh/H"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FF1CA4B;
	Fri, 18 Jul 2025 12:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752843178; cv=none; b=NrrM/vQdizV1grt7feYCOqG/BYIAvyYtHsZfkTCYVtcuCdztvjTQ2s4WYKFL65ujTuhjCaWY932QaXrF+y5OH/isIrb9wPlpQUc4L2S/4lw2GxI4d02WTKYGWlrvdllEX4jTxbOQImhJviz8t1DIcKHSdNBFx6C6wcxQpX3FGPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752843178; c=relaxed/simple;
	bh=NLzaj3chJ8j3M7r/+NjIVMEeYvDloByhR46o9CGuCN8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=CdJZugf2HCKMKUSn6tXlVjSs2mvHhuvtWQlyJxOf9sOBvLVMkefP7IQZMqS2S3VaHHNYlWCXD0gButmBPnclpSjbKZepEyl2Fl8pYJ6jDqD8t77ihqWo3eX+6oBmUaxKlofNtHH1UUVlLIDbRVFaQdMdln6eQk655tnGlZPTo5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TZZOzh/H; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-237e6963f63so12405225ad.2;
        Fri, 18 Jul 2025 05:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752843176; x=1753447976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=tzWLxvcTgWZIAaFaMHK77YFDBh6V9DLia4KmjOhaU4I=;
        b=TZZOzh/HsA0cNd/GNQcRnf6zUkWxpLSlvbJnUX6+/BnwJlMFILCs0a/PfZAeBhx98D
         e9CZh6RYEU2BJuaTIXJgPIsve74WBsZX8Yq8RFVkv5u9fxIPvDXKsnvmfz7MeBGv1WU+
         gtm2Nf6KgFON0z48AsZ7Zq/NG7Du14YR9+gcol85d/5hQqT9aiShDmBBAdvGJ48JvLdp
         XE3nCJrCmoP/pMMewAA6Rv7PtWwO46AzX94eyucCSRkUuwZELQ0+1PuWA39I1X9qO84d
         CmoxN7+cWw37tytjv+neyOf+MEE0SC4yEhT798uIhcCDUstQjvHs2ZL/jOOKMu7FJ7Wl
         jnfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752843176; x=1753447976;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tzWLxvcTgWZIAaFaMHK77YFDBh6V9DLia4KmjOhaU4I=;
        b=GS+dhogCxQUBFUKInfJN0ajwB6K7J0AvXnOFQx2nlQg86SshRcpwmNOXeQ2FNLbwEU
         ZvtUjLtVCY4cxla/0C9LmtjFr+WxnPcMkImv8oG0RUR74NxlJcSA22kwDOXDkoiTrReN
         BbU5VLh5jRzz4JcgYVbDp2FuX8RBdCnTdh78v+NoCaEE/oC7XnZUn8tEuFIKqxH6MJhf
         pCkPWBpSzHViMerJ3z59QykQKmLVuUuVW/AipBwLdhgKDuMIOx/fNNRVpi4XIyyze0P5
         kzoF6UajzxscfEp6nEGsE/wzOFRO4yUY+GKte5awvUKeO7m3dxWGfR6E6dawa1Qmx17a
         VOvw==
X-Forwarded-Encrypted: i=1; AJvYcCUHeTnVhHAFRHGaEnGgELzebeYARtrlFy8EuyE1FXqBQuqdTv/mMKeb7hg2ExnAUOE0rZkjaZRKhMH6iX8=@vger.kernel.org, AJvYcCWmXCXKkEo2SwKCArbxJyJ5jcUblPRGhMQ4xte8JmgbdC7q5YzPGDkQP80xpFRO9ibyjL1mbFEj+Aj4nm0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr8XBpSZsqnVYgqEFyRwlJBvT2zNeiy/r5YmWfatC4fEJKIKe4
	2lsldOmnGvsTAPMSKQAtIWlbC/7IQXh3Jo9JaaB69a49HQQnO6COjbvk
X-Gm-Gg: ASbGncuyW04Tm2PjHR+/Im0M3tSCuxMT504zqAH6LdvnVHOwRAJP6w1KnrmuMjyojt2
	ARYo6PvK0Ps0BmNOb4duzSrTsyCZbzcGQ2rFHgz9SS79fr1ULWFxdjYrS5wHlv6MydDm1ki4xwh
	pf9tjTUK8GSRBndrl4yovv3Epc3yBzpcF5LtVR01aYCjef2KiNt4LFXPdHvX4L04BYzX96CzI1O
	vZvnUn0KYyOiUuNRt3wGf/qLGzti2dHtHU9sA09Y+rzlwrIijWRgklPJ2F7ksDSIw+lGIyunXPY
	ObwADkHriyi9yQMbTvGuiYha6YCjJU2ryGnYU7GPJQ3paWLcPBvtTygjjvXXP6LGls8sHRKvtHz
	FbWmw5u9YkL1rMMN6hYoE5zEeG3HCAhJOeDe6X5XSLdvoJ0rvbD9/gMRRsg/QFVZlFhw+s53TZw
	==
X-Google-Smtp-Source: AGHT+IExCjv2PYQ0Nbp5/6M3l1rh0G2qV7i6JojbHrMYDYD8daiifGqvWX3AOj8ms/vKg/Ul9yZQKQ==
X-Received: by 2002:a17:903:ace:b0:234:adce:3ebc with SMTP id d9443c01a7336-23e2578a8aemr170190955ad.52.1752843175652;
        Fri, 18 Jul 2025 05:52:55 -0700 (PDT)
Received: from SIQOL-WIN-0002-DARSHAN.localdomain ([49.36.68.205])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6cfb7dsm12663295ad.140.2025.07.18.05.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 05:52:55 -0700 (PDT)
From: Darshan Rathod <darshanrathod475@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Darshan Rathod <darshanrathod475@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: b2c2: flexcop-eeprom: Fix assignment in if condition
Date: Fri, 18 Jul 2025 12:52:41 +0000
Message-ID: <20250718125245.82910-1-darshanrathod475@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function flexcop_eeprom_check_mac_addr() contains an
assignment in an 'if' condition. This coding style is not
accepted in the Linux kernel as it can conceal bugs.

Put the assignment before the 'if' condition, in an
explicit separate statement. It will also bring this code
in line with checkpatch.pl.

Also, correct a few off-by-one spaces in a function call and
variable declaration.

Signed-off-by: Darshan Rathod <darshanrathod475@gmail.com>
---
 drivers/media/common/b2c2/flexcop-eeprom.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/media/common/b2c2/flexcop-eeprom.c b/drivers/media/common/b2c2/flexcop-eeprom.c
index 0f2151cd36f2..da7c537ef93b 100644
--- a/drivers/media/common/b2c2/flexcop-eeprom.c
+++ b/drivers/media/common/b2c2/flexcop-eeprom.c
@@ -90,7 +90,7 @@ static char eeprom_set_mac_addr(struct adapter *adapter, char type, u8 *mac)
 static int flexcop_eeprom_read(struct flexcop_device *fc,
 		u16 addr, u8 *buf, u16 len)
 {
-	return fc->i2c_request(fc,FC_READ,FC_I2C_PORT_EEPROM,0x50,addr,buf,len);
+	return fc->i2c_request(fc, FC_READ, FC_I2C_PORT_EEPROM, 0x50, addr, buf, len);
 }
 
 #endif
@@ -107,7 +107,7 @@ static u8 calc_lrc(u8 *buf, int len)
 static int flexcop_eeprom_request(struct flexcop_device *fc,
 	flexcop_access_op_t op, u16 addr, u8 *buf, u16 len, int retries)
 {
-	int i,ret = 0;
+	int i, ret = 0;
 	u8 chipaddr =  0x50 | ((addr >> 8) & 3);
 	for (i = 0; i < retries; i++) {
 		ret = fc->i2c_request(&fc->fc_i2c_adap[1], op, chipaddr,
@@ -135,13 +135,15 @@ int flexcop_eeprom_check_mac_addr(struct flexcop_device *fc, int extended)
 	u8 buf[8];
 	int ret = 0;
 
-	if ((ret = flexcop_eeprom_lrc_read(fc,0x3f8,buf,8,4)) == 0) {
+	ret = flexcop_eeprom_lrc_read(fc, 0x3f8, buf, 8, 4);
+
+	if (ret == 0) {
 		if (extended != 0) {
 			err("TODO: extended (EUI64) MAC addresses aren't completely supported yet");
-			ret = -EINVAL;
-		} else
-			memcpy(fc->dvb_adapter.proposed_mac,buf,6);
-	}
-	return ret;
+			ret = ret = -EINVAL;
+		} else {
+			memcpy(fc->dvb_adapter.proposed_mac, buf, 6);
+		}
+		return ret;
 }
 EXPORT_SYMBOL(flexcop_eeprom_check_mac_addr);
-- 
2.43.0


