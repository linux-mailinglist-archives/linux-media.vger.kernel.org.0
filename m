Return-Path: <linux-media+bounces-10777-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F09658BBF97
	for <lists+linux-media@lfdr.de>; Sun,  5 May 2024 09:24:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 876641F216CB
	for <lists+linux-media@lfdr.de>; Sun,  5 May 2024 07:24:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B8B66FBF;
	Sun,  5 May 2024 07:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="e7a2bOpQ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-17.smtpout.orange.fr [80.12.242.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338C14430;
	Sun,  5 May 2024 07:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714893866; cv=none; b=rboKUbVNmML/TW1UiPTIBbcgTT2oxJWduAdKkjvXaRaxGtA3rVc1ZpaEZ53ClEBwjRdEeO5sdVTFVwIU5UcLFTjfPa5PKtMMfqv3cxtGczALho4+4+3Roi4Qxy3yn7Ao1lrzYngrzYkxoNWgWA43mhtfoeWVXAgFD0azTCdWWQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714893866; c=relaxed/simple;
	bh=MOWx9PMjovRITw6DYoO+/7nH9pLJzDASajlevipqP2M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qbSRCwfUko7DMhl9pFV7Zh8DqI2dVHXynmkEHZnpK9BBqLr2Tp3WfdMLveUqOjgEqGc1x21MuoQEWH018gREYpu4SbOKgKQwXSHbH0jJHNrodZSbLhINOTfgSbopP/xh0tSlFeX/5QEL4tPQtROCiod1Pi99AR5MI8S/+rH+c9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=e7a2bOpQ; arc=none smtp.client-ip=80.12.242.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from localhost.localdomain ([86.243.17.157])
	by smtp.orange.fr with ESMTPA
	id 3WEJstpJiUMqY3WEJsdYuL; Sun, 05 May 2024 09:24:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1714893855;
	bh=ARbxTy58EQYluvEH4/oGZHENQAGLJeF+Yi1IYCHP7nI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=e7a2bOpQaoP0syn2kk0u7X9gkkEkeODWWbHn4U2kd9QjXONmzFwLmKzP1Wz+CWuBP
	 rhiVB2Ns++Y8MubfJ1wRgQarQ79D7cR5Sa1vmfVxP2r74zPXy+7rMmpNiqiMSQRpJg
	 XNWXRQTA79zzs0c36I5kRte0HGZN/I4yn9VArEQ8D/jrg8Is2PXZkmrG62kO1o4UfT
	 0nK8ghzfcrXFLJOWAQiMBhjOeVl+tbAp/vQPRckJQuaS9Ke9g3mpyzgAED4AZvv5ws
	 hG/9BdueMK+6ZifepzdJxTUgoUJmjy7eBqJ35kvXcG85IV6DZq6kbfIzMD2R1aZGpZ
	 w1azK8EQhUVRw==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 05 May 2024 09:24:15 +0200
X-ME-IP: 86.243.17.157
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-media@vger.kernel.org
Subject: [PATCH] media: i2c: tvp5150: Constify some structures
Date: Sun,  5 May 2024 09:24:02 +0200
Message-ID: <119b3ec62e6305c83ffadc7f40cbda9fc3d5be11.1714893773.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'vbi_ram_default' and 'tvp5150_config' are not modified in this diver
and are only used as a const struct.

Constifying these structures moves some data to a read-only section, so
increase overall security.

On a x86_64, with allmodconfig:
Before:
   text	   data	    bss	    dec	    hex	filename
  57197	   2936	     36	  60169	   eb09	drivers/media/i2c/tvp5150.o

After:
   text	   data	    bss	    dec	    hex	filename
  57517	   2608	     36	  60161	   eb01	drivers/media/i2c/tvp5150.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/media/i2c/tvp5150.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
index 64b91aa3c82a..0fe6a37bdb7f 100644
--- a/drivers/media/i2c/tvp5150.c
+++ b/drivers/media/i2c/tvp5150.c
@@ -514,7 +514,7 @@ struct i2c_vbi_ram_value {
  * and so on. There are 16 possible locations from 0 to 15.
  */
 
-static struct i2c_vbi_ram_value vbi_ram_default[] = {
+static const struct i2c_vbi_ram_value vbi_ram_default[] = {
 
 	/*
 	 * FIXME: Current api doesn't handle all VBI types, those not
@@ -1812,7 +1812,7 @@ static const struct regmap_access_table tvp5150_readable_table = {
 	.n_yes_ranges = ARRAY_SIZE(tvp5150_readable_ranges),
 };
 
-static struct regmap_config tvp5150_config = {
+static const struct regmap_config tvp5150_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
 	.max_register = 0xff,
-- 
2.45.0


