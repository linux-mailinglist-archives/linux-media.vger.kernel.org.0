Return-Path: <linux-media+bounces-17886-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA259705C2
	for <lists+linux-media@lfdr.de>; Sun,  8 Sep 2024 10:21:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8D0CCB219DF
	for <lists+linux-media@lfdr.de>; Sun,  8 Sep 2024 08:21:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA950136326;
	Sun,  8 Sep 2024 08:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="FlZu3XJY"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-20.smtpout.orange.fr [80.12.242.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8736D481D1;
	Sun,  8 Sep 2024 08:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725783678; cv=none; b=buiQwrf1T9JJekw3SEePUVntPp5PkJl0H4De6maNA5+X/VzcugBKgYkZ/pb4vAVVAnUgLq5E9nTkdxG911j/q5bKhDdmbYx6pB0c3+EUkQoCMSxrz+5ut+tNe4LIjHW/hrQEWQ/917CMv3lw1WsHDEHM+hGloWnkgKGDGlzoga8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725783678; c=relaxed/simple;
	bh=KmyIw4s7JcNk9rW5F8w4aDMjCMIawXFYRFVG+FdSl2U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kYw+WHcpmbTmQ9+JLgowuBqUkEL4kW5/kVqpwE6Z1VJhNW9kHY3T6cytRZsNTPsrznfqLm19kyWH2DQH9+crsCSJjUEvJ70NKvKdVK3w/HYL3hYW4k9X8IexDH8+9CEUkX3k8+joNU9sm0OCT3S61Qw4Uyd/gT7VdB4M4wKvXmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=FlZu3XJY; arc=none smtp.client-ip=80.12.242.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id nDAQsWqBbNe0InDAQsCb5p; Sun, 08 Sep 2024 10:21:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1725783666;
	bh=mB8r9utYDzoQqJnYPb9tbgFFpnfU8g77w3vPVA1MzE4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=FlZu3XJYsL7mc5dtbv9g+pg2e9cOagmcUgUuwoXIhHOsz/3n6vYFQjdcxqpvp8ygD
	 DAGapcl2GX/KfGazF/u/RLQK+GHiAl7sMkrCKOPUTSVoFSDQ6fp2dbXkr+A2P1AYae
	 BwRjvARwTJyz5TeZJryHkcaB19pF8znMHTg7KD9/hPKmIvW2G/rEc/Brc+1dTfBo6Z
	 KIpbYwc7BbBKFA0cAVfmIScDfKaq+Ao91wLBuLwZQ7j7nQ/TmFYXFYD1KMtW9S1/zz
	 EL20WTbosbM7px7xzYre0gSrjpV+5mIshe9Ntt/d48lOtVW/6ls64f2Q80rAKECDZJ
	 dBqkY3LOpo8pQ==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 08 Sep 2024 10:21:06 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-media@vger.kernel.org
Subject: [PATCH v2] media: dibx000_common: Constify struct i2c_algorithm
Date: Sun,  8 Sep 2024 10:21:00 +0200
Message-ID: <6539caa4d0eb235e9d2a28ae8e341e46fece1544.1725780011.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'struct i2c_algorithm' is not modified in this driver.

Constifying this structure moves some data to a read-only section, so
increase overall security, especially when the structure holds some
function pointers.

To do so, the prototype of i2c_adapter_init() has to be updated as well.

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

Changes in v2:
  - Fix commit message

v1: https://lore.kernel.org/all/6539cac4d4eb239e9d2528ae7e34be46fe0e1544.1725780011.git.christophe.jaillet@wanadoo.fr/
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


