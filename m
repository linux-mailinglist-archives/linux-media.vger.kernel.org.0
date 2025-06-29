Return-Path: <linux-media+bounces-36178-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFA3AECE25
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 16:51:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 601663B5713
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 14:50:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8745C232386;
	Sun, 29 Jun 2025 14:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="O1JC/FVo"
X-Original-To: linux-media@vger.kernel.org
Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D439230D0A;
	Sun, 29 Jun 2025 14:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751208604; cv=none; b=P93sEJYNCTNwILuYgU4z6nBFVLfZt7HmBl2JQwbudeFFWoOVJ7tdgl6aiXp8PmEd7Bfcj/i86kCqV8LgYp0Ag8IDZw5O9tYN/mpS7jBSx3FlhK6ntiuT7xfuH7OvNrC59OFNZaeGBOn1fNpCHeYGm6c9CVehgxX8AOqJ+GQUVRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751208604; c=relaxed/simple;
	bh=/4eXOj3Xo31VxxB5DkoSMS0btVgRszIg52mb9y9HycQ=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=kmrRfcUyaSs3yavWBZhJ6QPVvYWm+MgfzKnZmnBC1kTLJxukFXFUKH+Y8BLfQyIMy6k1OL2QV/TaFJwHtv3ZN70+iV+TyTnVcBujLgnD6hSHsGF1HmtXNw7CTppgQFhb4gP0NE0lQ+5x+6jV6CG+V1hc5Lc0sXDh5DvbTImQ0Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=O1JC/FVo; arc=none smtp.client-ip=43.163.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1751208587;
	bh=JLkEkSY4PrPT4Wi5fo8zsPEvuNz7SNGEU7wk/Og0J1E=;
	h=From:To:Cc:Subject:Date;
	b=O1JC/FVoiAAM6ewxYtxCF2tOCMcKwABHMYYIuqWQiiYIEw8SJQUMataJy8qgnTGrQ
	 y97LcFn+dURf6KBchgbfo7tRAmubIGAhIbGxEFzXdTlOFLIyhu2ln7aasH+fenuJaf
	 raOrOhA9hs+KfreB2sZ60VAnXhP0wnuyHLoyH7LM=
Received: from KernelDevBox.byted.org ([115.190.40.13])
	by newxmesmtplogicsvrsza36-0.qq.com (NewEsmtp) with SMTP
	id C6C276D2; Sun, 29 Jun 2025 22:49:44 +0800
X-QQ-mid: xmsmtpt1751208584tz6q2oc6o
Message-ID: <tencent_7745E114F55B42E026AEF67EAB1D6CDBA305@qq.com>
X-QQ-XMAILINFO: OVFdYp27KdlJ1mlcCyrh9IfZYecebn38y8LeuuRDi3uc4ifONxfmjTeTmtiKTA
	 qA92LISTj3AuGYmIJfN6Pj2D644fLfde6X8fp2tD2zFSQRifPPYbIvV5bPToldakVek/bLLrpLCs
	 9YSrN0LWfz9J/9qGRKW5NRl6ZM4dVfx9FNBlwCuFeboluay+KnfiZEdhxgYi4xyEhSxxqk6fDXQ8
	 AzdirquW9ZXUBnCUVshHuhfz4iXTyCaEL1CIfi8nSf4dxem+ecjumgy0191HkyeVzVwRVmxNYhS0
	 M+YxbTTMickiibrqboz7dFRIl0IQXzeFGlbpW7K2SMrFg0DiUFu6FJZPmxxJ5LbAavuFZh3KoooR
	 ZS4/ylG943+YtHMtnWuT4JSNNV5gyqgGX0nJZvVykXLkUvaRUAAnLS2nWNBuT+IS/xH8wdIaCdvi
	 Zf4cNkF9ovQEBJuBJvSJYNlm75OZlRaQaf+WhP7SflsDOY/p22rreWTbG4LlJrIPNiq1tDNjKZJo
	 2vfyngVrVevtpjpPsQZp/9DZdUNZ1pYw0iBKPnG/xYomenfb3GovcFEp4e4loEPM2nY/yi5G2kz6
	 eyEH+kgXT7BrO5g5KpjgOC9T03BPm4+oUxkU2wxawKDZobE1+UUcHlrLgIzF79OHoJC4o/j7eJdx
	 4AJ3cao5eOFhSnp3vSKYmks33N/AA/az8mIjL85iONSDKu9SnSP6MPXJJ7xilzv7ryN9l4J9wmCg
	 qCai7HByJSlXuRPSVv5OvAvprkFYuavi+zGugq14MuQd++4nXDs3JMC+BmqZVxoXhk1cpJJwe46R
	 oGDG8RJDkJXkopsgFjEBaYUyBE6K1SbuqM1SS9PHma5xIkG6U4ECsEtPMuVHLAWMQ87392aWJVkj
	 OXRbVWONvzV1gvG5eev+uEeumsQTmrywvm0i2BA2KI19KgisRZyeOAHsloBRaptN/gDn1d3feAaV
	 xtO7wypXaDJdDX+EbKMYmWPOtZfaVPI/WKBY284vTQrCYBeRuDL4iePTM7XtcbGxJiAQP6s4A=
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
From: Zhang Shurong <zhang_shurong@foxmail.com>
To: prabhakar.csengg@gmail.com
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Shurong <zhang_shurong@foxmail.com>
Subject: [PATCH] media: ov2659: Fix memleak in ov2659_probe()
Date: Sun, 29 Jun 2025 22:49:39 +0800
X-OQ-MSGID: <20250629144939.1928824-1-zhang_shurong@foxmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ov2659_probe() won't clean all the allocated resources in fail
path, which may causes the memleaks. Add v4l2_ctrl_handler_free() to
prevent memleak.

Fixes: c4c0283ab3cd ("[media] media: i2c: add support for omnivision's ov2659 sensor")
Signed-off-by: Zhang Shurong <zhang_shurong@foxmail.com>
---
 drivers/media/i2c/ov2659.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov2659.c b/drivers/media/i2c/ov2659.c
index 06b7896c3eaf..586b31ba076b 100644
--- a/drivers/media/i2c/ov2659.c
+++ b/drivers/media/i2c/ov2659.c
@@ -1469,14 +1469,15 @@ static int ov2659_probe(struct i2c_client *client)
 				     V4L2_CID_TEST_PATTERN,
 				     ARRAY_SIZE(ov2659_test_pattern_menu) - 1,
 				     0, 0, ov2659_test_pattern_menu);
-	ov2659->sd.ctrl_handler = &ov2659->ctrls;
 
 	if (ov2659->ctrls.error) {
 		dev_err(&client->dev, "%s: control initialization error %d\n",
 			__func__, ov2659->ctrls.error);
+		v4l2_ctrl_handler_free(&ov2659->ctrls);
 		return  ov2659->ctrls.error;
 	}
 
+	ov2659->sd.ctrl_handler = &ov2659->ctrls;
 	sd = &ov2659->sd;
 	client->flags |= I2C_CLIENT_SCCB;
 
-- 
2.39.5


