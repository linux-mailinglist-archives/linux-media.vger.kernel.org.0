Return-Path: <linux-media+bounces-28987-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B24A756BA
	for <lists+linux-media@lfdr.de>; Sat, 29 Mar 2025 15:37:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73332170F9F
	for <lists+linux-media@lfdr.de>; Sat, 29 Mar 2025 14:37:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B48751D6DBC;
	Sat, 29 Mar 2025 14:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="HmTj8p2G"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-13.smtpout.orange.fr [80.12.242.13])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2592B18BC36;
	Sat, 29 Mar 2025 14:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743259022; cv=none; b=VsZccMWsz5wdzguG43nVVS0yZhaeC1khSsQ/5PZ70abPMAWzkv1Z154V2F6aN5/7d9gMjPoaHPrT3R9XNXTtgLBkDUdze+vtQy0q3rN+b4DJLA3xqk2xubKRkv3j7iRL+GzsBslyAQgpAB/grRdInM+4RtRuuXbMCnr7pulHwNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743259022; c=relaxed/simple;
	bh=narW4DL49Jfu6r70biWpPMSTaDKMbdo98AXOU7GetK0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PasJEDzjxVs8Yw9RuUMXpRbZmUIbMAlHts3ckNVxxZMjG5rwj6XNZvbUgLnJO4LjQ67nk/LF/nXILNRadERD3Y+35Ewz4f5Q2EEApysrN0ZRDeAJDhecafAC2nASaNBBpylFhHoufCmIK1O4DO8cjEHphlkyNLvtJzLVgm15XV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=HmTj8p2G; arc=none smtp.client-ip=80.12.242.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id yX9Rt6hgnncIDyX9UtEY0S; Sat, 29 Mar 2025 15:27:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1743258433;
	bh=ADABkbaZEHdGim0QqXmBBlzaCc4f6um2BWPGM6bOKCw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=HmTj8p2G4sa1u2FzH9Lo/fkM+EYzhO75GFBdqs7auZQPSB1KeuOLuwqGsR/KfX+zS
	 hqIP0XVa6ljiI9jkd0OMYLXx1ezZPXjgm5ap7H5lKKoU1LJnBhMp2XALIGQXBkZjDp
	 DD0MRMqcLNaCODa0pPUo7FGbbfKP5HwEknUz25lNnBYTt2VsDW24OVQQQXBYmVsHJD
	 LmB+4Gyc3bWWOtIn85eSBo/Vfr/Bqbl51t7pM/gJs3qMnWv2X3phRV9yIBOx+iOC5u
	 RhcWp7GwqwLMpLMMFtXJR3HzyCqjv2Sx1pWyS1ljgoob3UBHF2TKIPljnjkjB+oX+Y
	 yad9SK9zjIiXQ==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 29 Mar 2025 15:27:13 +0100
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-media@vger.kernel.org
Subject: [PATCH] media: flexcop-i2c: Constify struct i2c_algorithm
Date: Sat, 29 Mar 2025 15:26:42 +0100
Message-ID: <2f61177c9f2a0b5a03994f3f94132ace9fb45e47.1743258328.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.49.0
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

On a x86_64, with allmodconfig, as an example:
Before:
======
   text	   data	    bss	    dec	    hex	filename
   6645	    216	     16	   6877	   1add	drivers/media/common/b2c2/flexcop-i2c.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
   6721	    160	     16	   6897	   1af1	drivers/media/common/b2c2/flexcop-i2c.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested-only.
---
 drivers/media/common/b2c2/flexcop-i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/common/b2c2/flexcop-i2c.c b/drivers/media/common/b2c2/flexcop-i2c.c
index 1f1eaa807811..21edf870d927 100644
--- a/drivers/media/common/b2c2/flexcop-i2c.c
+++ b/drivers/media/common/b2c2/flexcop-i2c.c
@@ -209,7 +209,7 @@ static u32 flexcop_i2c_func(struct i2c_adapter *adapter)
 	return I2C_FUNC_I2C;
 }
 
-static struct i2c_algorithm flexcop_algo = {
+static const struct i2c_algorithm flexcop_algo = {
 	.master_xfer	= flexcop_master_xfer,
 	.functionality	= flexcop_i2c_func,
 };
-- 
2.49.0


