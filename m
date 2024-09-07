Return-Path: <linux-media+bounces-17879-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAA4970412
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2024 22:32:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A1CD11C21B55
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2024 20:32:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA3A21684A2;
	Sat,  7 Sep 2024 20:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="nRQl57fA"
X-Original-To: linux-media@vger.kernel.org
Received: from msa.smtpout.orange.fr (smtp-77.smtpout.orange.fr [80.12.242.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0723F9CC;
	Sat,  7 Sep 2024 20:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725741141; cv=none; b=XSa+0XPL9gVa9XNhwQmoXe29/85swjtq4gtd07wCHhgMAIHcBhYVHj98nTkFOn4od8LJpnAIhd/WmT43AVJN/ntcUKXE4UZ9JdqGuEMJVINv9Y720Dz2GjVq6UNbG7iUIP0K0FDH5DQvxwzDChSSecudwnpXnltdUqMqWmeDXCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725741141; c=relaxed/simple;
	bh=yLGqfgyzjqmRJqgzGXDIOUEE7fkWFRssNKvQottSDeE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NhDNHLvaic2wGoqlpAEF8UPqHil/J67EwWh3A2ViNysZz+H6A4ndHCYGIZfDaja6p5rohvshq5uHrLhcNMT+7zZ71YLUI9e/3t0oV+g/iiEzbGjfZ24vifHF7XXdHI91URyqMGj8gstEmGOPJ8hxx221Ep5eebqqVczWOvcnb1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=nRQl57fA; arc=none smtp.client-ip=80.12.242.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id n25BsU48FQaX2n25BsQW8P; Sat, 07 Sep 2024 22:30:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1725741058;
	bh=C0HZK5gX7EHpsfXjRldNuzd5k9/czrbSmOypVOt8t4c=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=nRQl57fAIj4iAyoix6Xd9h5lK4DROgDUevvVoCCMKfQ5UTP/igI0K5cejrQF0/k6G
	 60BfNX6Ruph7bT2Y5yI9pFjebJ9sRHWGmFH4qfV7QddLLfcGPdC8WQWFqdHEcL0NZr
	 yvGUlo9EnGjNul5VZIpNv6JPpqrr0h/E7pWQP2sCF5AK+YGtAHhGkpcwOybqSdxiUA
	 bZEtTSwAKWOm9x8mMPO+WgAd551gmxtPvjHX5E+BPi8jE57QJNYN+nLZZOrLxzhOmy
	 hJJfWsCYdrKMuCKVjlmJU03b3lzhafWgFrQQwiP44j0R3zup9wUvSjl2j8FR83zF9N
	 HSuotU3NrP2ag==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 07 Sep 2024 22:30:57 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Malcolm Priestley <tvboxspy@gmail.com>,
	Michael Krufky <mkrufky@linuxtv.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-media@vger.kernel.org
Subject: [PATCH] media: dvb-usb-v2: Constify struct i2c_algorithm
Date: Sat,  7 Sep 2024 22:30:42 +0200
Message-ID: <d84110421a78dc6769435b2c7ff30c7e873f4cd0.1725741030.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'struct i2c_algorithm' are not modified in these drivers.

Constifying this structure moves some data to a read-only section, so
increase overall security, especially when the structure holds some
function pointers.

More over, dvb_usb_device_properties->i2c_algo seems to only be copied in
i2c_adapter->algo, which is already a "const struct i2c_algorithm".
This is done in dvb_usbv2_i2c_init()

On a x86_64, with allmodconfig, as an example:
Before:
======
   text	   data	    bss	    dec	    hex	filename
  35366	   5832	     36	  41234	   a112	drivers/media/usb/dvb-usb-v2/af9015.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  35430	   5768	     36	  41234	   a112	drivers/media/usb/dvb-usb-v2/af9015.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
--
Compile tested only
---
 drivers/media/usb/dvb-usb-v2/af9015.c   | 2 +-
 drivers/media/usb/dvb-usb-v2/af9035.c   | 2 +-
 drivers/media/usb/dvb-usb-v2/anysee.c   | 2 +-
 drivers/media/usb/dvb-usb-v2/au6610.c   | 2 +-
 drivers/media/usb/dvb-usb-v2/az6007.c   | 2 +-
 drivers/media/usb/dvb-usb-v2/ce6230.c   | 2 +-
 drivers/media/usb/dvb-usb-v2/dvb_usb.h  | 2 +-
 drivers/media/usb/dvb-usb-v2/dvbsky.c   | 2 +-
 drivers/media/usb/dvb-usb-v2/ec168.c    | 2 +-
 drivers/media/usb/dvb-usb-v2/gl861.c    | 2 +-
 drivers/media/usb/dvb-usb-v2/lmedm04.c  | 2 +-
 drivers/media/usb/dvb-usb-v2/mxl111sf.c | 2 +-
 drivers/media/usb/dvb-usb-v2/rtl28xxu.c | 2 +-
 13 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/af9015.c b/drivers/media/usb/dvb-usb-v2/af9015.c
index 4014f7d07330..3eddc40377bf 100644
--- a/drivers/media/usb/dvb-usb-v2/af9015.c
+++ b/drivers/media/usb/dvb-usb-v2/af9015.c
@@ -260,7 +260,7 @@ static u32 af9015_i2c_func(struct i2c_adapter *adapter)
 	return I2C_FUNC_I2C;
 }
 
-static struct i2c_algorithm af9015_i2c_algo = {
+static const struct i2c_algorithm af9015_i2c_algo = {
 	.master_xfer = af9015_i2c_xfer,
 	.functionality = af9015_i2c_func,
 };
diff --git a/drivers/media/usb/dvb-usb-v2/af9035.c b/drivers/media/usb/dvb-usb-v2/af9035.c
index 0d2c42819d39..04e8bdf0acf4 100644
--- a/drivers/media/usb/dvb-usb-v2/af9035.c
+++ b/drivers/media/usb/dvb-usb-v2/af9035.c
@@ -477,7 +477,7 @@ static u32 af9035_i2c_functionality(struct i2c_adapter *adapter)
 	return I2C_FUNC_I2C;
 }
 
-static struct i2c_algorithm af9035_i2c_algo = {
+static const struct i2c_algorithm af9035_i2c_algo = {
 	.master_xfer = af9035_i2c_master_xfer,
 	.functionality = af9035_i2c_functionality,
 };
diff --git a/drivers/media/usb/dvb-usb-v2/anysee.c b/drivers/media/usb/dvb-usb-v2/anysee.c
index 8699846eb416..12b6d0ac9049 100644
--- a/drivers/media/usb/dvb-usb-v2/anysee.c
+++ b/drivers/media/usb/dvb-usb-v2/anysee.c
@@ -244,7 +244,7 @@ static u32 anysee_i2c_func(struct i2c_adapter *adapter)
 	return I2C_FUNC_I2C;
 }
 
-static struct i2c_algorithm anysee_i2c_algo = {
+static const struct i2c_algorithm anysee_i2c_algo = {
 	.master_xfer   = anysee_master_xfer,
 	.functionality = anysee_i2c_func,
 };
diff --git a/drivers/media/usb/dvb-usb-v2/au6610.c b/drivers/media/usb/dvb-usb-v2/au6610.c
index be223fc8aa14..c20a9469f564 100644
--- a/drivers/media/usb/dvb-usb-v2/au6610.c
+++ b/drivers/media/usb/dvb-usb-v2/au6610.c
@@ -115,7 +115,7 @@ static u32 au6610_i2c_func(struct i2c_adapter *adapter)
 	return I2C_FUNC_I2C;
 }
 
-static struct i2c_algorithm au6610_i2c_algo = {
+static const struct i2c_algorithm au6610_i2c_algo = {
 	.master_xfer   = au6610_i2c_xfer,
 	.functionality = au6610_i2c_func,
 };
diff --git a/drivers/media/usb/dvb-usb-v2/az6007.c b/drivers/media/usb/dvb-usb-v2/az6007.c
index 2410054ddb2c..65ef045b74ca 100644
--- a/drivers/media/usb/dvb-usb-v2/az6007.c
+++ b/drivers/media/usb/dvb-usb-v2/az6007.c
@@ -838,7 +838,7 @@ static u32 az6007_i2c_func(struct i2c_adapter *adapter)
 	return I2C_FUNC_I2C;
 }
 
-static struct i2c_algorithm az6007_i2c_algo = {
+static const struct i2c_algorithm az6007_i2c_algo = {
 	.master_xfer = az6007_i2c_xfer,
 	.functionality = az6007_i2c_func,
 };
diff --git a/drivers/media/usb/dvb-usb-v2/ce6230.c b/drivers/media/usb/dvb-usb-v2/ce6230.c
index d3b5cb4a24da..7ebaf3ee4491 100644
--- a/drivers/media/usb/dvb-usb-v2/ce6230.c
+++ b/drivers/media/usb/dvb-usb-v2/ce6230.c
@@ -154,7 +154,7 @@ static u32 ce6230_i2c_functionality(struct i2c_adapter *adapter)
 	return I2C_FUNC_I2C;
 }
 
-static struct i2c_algorithm ce6230_i2c_algorithm = {
+static const struct i2c_algorithm ce6230_i2c_algorithm = {
 	.master_xfer   = ce6230_i2c_master_xfer,
 	.functionality = ce6230_i2c_functionality,
 };
diff --git a/drivers/media/usb/dvb-usb-v2/dvb_usb.h b/drivers/media/usb/dvb-usb-v2/dvb_usb.h
index 288c15a7d72b..ecdc20d45132 100644
--- a/drivers/media/usb/dvb-usb-v2/dvb_usb.h
+++ b/drivers/media/usb/dvb-usb-v2/dvb_usb.h
@@ -243,7 +243,7 @@ struct dvb_usb_device_properties {
 	int (*download_firmware) (struct dvb_usb_device *,
 			const struct firmware *);
 
-	struct i2c_algorithm *i2c_algo;
+	const struct i2c_algorithm *i2c_algo;
 
 	unsigned int num_adapters;
 	int (*get_adapter_count) (struct dvb_usb_device *);
diff --git a/drivers/media/usb/dvb-usb-v2/dvbsky.c b/drivers/media/usb/dvb-usb-v2/dvbsky.c
index 1221c924312a..ceac0ea21dab 100644
--- a/drivers/media/usb/dvb-usb-v2/dvbsky.c
+++ b/drivers/media/usb/dvb-usb-v2/dvbsky.c
@@ -169,7 +169,7 @@ static u32 dvbsky_i2c_func(struct i2c_adapter *adapter)
 	return I2C_FUNC_I2C;
 }
 
-static struct i2c_algorithm dvbsky_i2c_algo = {
+static const struct i2c_algorithm dvbsky_i2c_algo = {
 	.master_xfer   = dvbsky_i2c_xfer,
 	.functionality = dvbsky_i2c_func,
 };
diff --git a/drivers/media/usb/dvb-usb-v2/ec168.c b/drivers/media/usb/dvb-usb-v2/ec168.c
index 0e4773fc025c..973b32356b17 100644
--- a/drivers/media/usb/dvb-usb-v2/ec168.c
+++ b/drivers/media/usb/dvb-usb-v2/ec168.c
@@ -176,7 +176,7 @@ static u32 ec168_i2c_func(struct i2c_adapter *adapter)
 	return I2C_FUNC_I2C;
 }
 
-static struct i2c_algorithm ec168_i2c_algo = {
+static const struct i2c_algorithm ec168_i2c_algo = {
 	.master_xfer   = ec168_i2c_xfer,
 	.functionality = ec168_i2c_func,
 };
diff --git a/drivers/media/usb/dvb-usb-v2/gl861.c b/drivers/media/usb/dvb-usb-v2/gl861.c
index c71e7b93476d..0538170ccf29 100644
--- a/drivers/media/usb/dvb-usb-v2/gl861.c
+++ b/drivers/media/usb/dvb-usb-v2/gl861.c
@@ -162,7 +162,7 @@ static u32 gl861_i2c_functionality(struct i2c_adapter *adapter)
 	return I2C_FUNC_I2C;
 }
 
-static struct i2c_algorithm gl861_i2c_algo = {
+static const struct i2c_algorithm gl861_i2c_algo = {
 	.master_xfer   = gl861_i2c_master_xfer,
 	.functionality = gl861_i2c_functionality,
 };
diff --git a/drivers/media/usb/dvb-usb-v2/lmedm04.c b/drivers/media/usb/dvb-usb-v2/lmedm04.c
index 8a34e6c0d6a6..c9aa77ff088f 100644
--- a/drivers/media/usb/dvb-usb-v2/lmedm04.c
+++ b/drivers/media/usb/dvb-usb-v2/lmedm04.c
@@ -549,7 +549,7 @@ static u32 lme2510_i2c_func(struct i2c_adapter *adapter)
 	return I2C_FUNC_I2C;
 }
 
-static struct i2c_algorithm lme2510_i2c_algo = {
+static const struct i2c_algorithm lme2510_i2c_algo = {
 	.master_xfer   = lme2510_i2c_xfer,
 	.functionality = lme2510_i2c_func,
 };
diff --git a/drivers/media/usb/dvb-usb-v2/mxl111sf.c b/drivers/media/usb/dvb-usb-v2/mxl111sf.c
index cd5861a30b6f..870ac3c8b085 100644
--- a/drivers/media/usb/dvb-usb-v2/mxl111sf.c
+++ b/drivers/media/usb/dvb-usb-v2/mxl111sf.c
@@ -911,7 +911,7 @@ static u32 mxl111sf_i2c_func(struct i2c_adapter *adapter)
 	return I2C_FUNC_I2C;
 }
 
-static struct i2c_algorithm mxl111sf_i2c_algo = {
+static const struct i2c_algorithm mxl111sf_i2c_algo = {
 	.master_xfer   = mxl111sf_i2c_xfer,
 	.functionality = mxl111sf_i2c_func,
 #ifdef NEED_ALGO_CONTROL
diff --git a/drivers/media/usb/dvb-usb-v2/rtl28xxu.c b/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
index f7884bb56fcc..487c6ab784ab 100644
--- a/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
+++ b/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
@@ -290,7 +290,7 @@ static u32 rtl28xxu_i2c_func(struct i2c_adapter *adapter)
 	return I2C_FUNC_I2C;
 }
 
-static struct i2c_algorithm rtl28xxu_i2c_algo = {
+static const struct i2c_algorithm rtl28xxu_i2c_algo = {
 	.master_xfer   = rtl28xxu_i2c_xfer,
 	.functionality = rtl28xxu_i2c_func,
 };
-- 
2.46.0


