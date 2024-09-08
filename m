Return-Path: <linux-media+bounces-17885-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A79A9970552
	for <lists+linux-media@lfdr.de>; Sun,  8 Sep 2024 09:21:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64E1C282B21
	for <lists+linux-media@lfdr.de>; Sun,  8 Sep 2024 07:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2AC871750;
	Sun,  8 Sep 2024 07:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="MxDhUpew"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-19.smtpout.orange.fr [80.12.242.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648B71CA81;
	Sun,  8 Sep 2024 07:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725780055; cv=none; b=SquHgSRJK/vydgu177rsOeHbJmX+Bh9XsLF7+T+k0c/jS5zW8XzTDVK0xOLKUz/Ebk2mixzlwyLtmI5iL6h6Dv8J/Sw6FsFpnox4Twh7AueKAB6+ksQ0GZcsSRxORlk5eh3PVZRrhe75ExGrqNGr0NHkjATw7LKte6NSFQ/wHCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725780055; c=relaxed/simple;
	bh=HeG2uL8Bqswn5W8MK5eBY16hS8/iTMvLaKfm0muxDTo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GyaXp7eX46QVboRKe72CXtFmLOkG9OAAQfUIXWcDNmhqHvXWT+Y0Qx7KMhpsha4MxNHjztHnOpoTV9NeeUu3KIyCNDA5ohpBi7ikgQd+pATd+ipdJk8Pn8AF2VEImEOQnWML1fCimhErchMpzejWMuNCSqq5NcGDwLh7tAWhYfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=MxDhUpew; arc=none smtp.client-ip=80.12.242.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id nCDzsEBBjH7HInCDzsT8vQ; Sun, 08 Sep 2024 09:20:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1725780044;
	bh=tmhFCMafs4w7/ikKQfk8iMWvMCPuQdk70+cMn7alsA8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=MxDhUpewEFnAOziGUSMo3wFmMdeYNJHhK4WsSVwrFHgUejtmqHIwZyP0Vn4edjK+y
	 Y45Y9L4ofHE0wRXzNSu+1h7OhLar2+ekng1+bqztcqGSSGrtHkVmQhRtLHpwCY/IZk
	 h+D8hGeeJNOfVL+GUyOJoR4QIWgVZZR3Zi+3XJvoTf7bF4Fb1ZPZYBzJKBtLDLDb1O
	 dEDXFWUuK6XYzqz/MDgFLx31cgd6bE0d5EpVq2usBU4zs1FO9tAlLkHBE+kP8LmthR
	 2DUL+AtoHcXAIazHE9CDUxhLVw2lUCs+8af+5jneHUAjGDmghcDo5I0gDP5S0J2Ier
	 wu6xOnHO1DXSw==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 08 Sep 2024 09:20:44 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-media@vger.kernel.org
Subject: [PATCH] media: dibx000_common: Constify struct i2c_algorithm
Date: Sun,  8 Sep 2024 09:20:37 +0200
Message-ID: <6539cac4d4eb239e9d2528ae7e34be46fe0e1544.1725780011.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'struct i2c_algorithm' and 'struct virtio_device_id' are not modified in
this driver.

To do so, the prototype of i2c_adapter_init() has to be updated as well.

Constifying this structure moves some data to a read-only section, so
increase overall security, especially when the structure holds some
function pointers.

On a x86_64, with allmodconfig:
Before:
======
   text	   data	    bss	    dec	    hex	filename
  17213	    932	     20	  18165	   46f5	drivers/media/dvb-frontends/dibx000_common.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  17490	    660	     20	  18170	   46fa	drivers/media/dvb-frontends/dibx000_common.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
--
Compile tested only
---
 drivers/media/dvb-frontends/dibx000_common.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/dvb-frontends/dibx000_common.c b/drivers/media/dvb-frontends/dibx000_common.c
index 63a4c6a4afb5..bd5c5d7223aa 100644
--- a/drivers/media/dvb-frontends/dibx000_common.c
+++ b/drivers/media/dvb-frontends/dibx000_common.c
@@ -250,12 +250,12 @@ static int dibx000_i2c_master_xfer_gpio34(struct i2c_adapter *i2c_adap, struct i
 	return num;
 }
 
-static struct i2c_algorithm dibx000_i2c_master_gpio12_xfer_algo = {
+static const struct i2c_algorithm dibx000_i2c_master_gpio12_xfer_algo = {
 	.master_xfer = dibx000_i2c_master_xfer_gpio12,
 	.functionality = dibx000_i2c_func,
 };
 
-static struct i2c_algorithm dibx000_i2c_master_gpio34_xfer_algo = {
+static const struct i2c_algorithm dibx000_i2c_master_gpio34_xfer_algo = {
 	.master_xfer = dibx000_i2c_master_xfer_gpio34,
 	.functionality = dibx000_i2c_func,
 };
@@ -324,7 +324,7 @@ static int dibx000_i2c_gated_gpio67_xfer(struct i2c_adapter *i2c_adap,
 	return ret;
 }
 
-static struct i2c_algorithm dibx000_i2c_gated_gpio67_algo = {
+static const struct i2c_algorithm dibx000_i2c_gated_gpio67_algo = {
 	.master_xfer = dibx000_i2c_gated_gpio67_xfer,
 	.functionality = dibx000_i2c_func,
 };
@@ -369,7 +369,7 @@ static int dibx000_i2c_gated_tuner_xfer(struct i2c_adapter *i2c_adap,
 	return ret;
 }
 
-static struct i2c_algorithm dibx000_i2c_gated_tuner_algo = {
+static const struct i2c_algorithm dibx000_i2c_gated_tuner_algo = {
 	.master_xfer = dibx000_i2c_gated_tuner_xfer,
 	.functionality = dibx000_i2c_func,
 };
@@ -422,7 +422,7 @@ void dibx000_reset_i2c_master(struct dibx000_i2c_master *mst)
 EXPORT_SYMBOL(dibx000_reset_i2c_master);
 
 static int i2c_adapter_init(struct i2c_adapter *i2c_adap,
-				struct i2c_algorithm *algo, const char *name,
+				const struct i2c_algorithm *algo, const char *name,
 				struct dibx000_i2c_master *mst)
 {
 	strscpy(i2c_adap->name, name, sizeof(i2c_adap->name));
-- 
2.46.0


