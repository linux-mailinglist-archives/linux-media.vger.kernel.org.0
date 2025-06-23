Return-Path: <linux-media+bounces-35563-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E37AE3394
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 04:32:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2411E7A6AE5
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 02:31:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7796419E7D0;
	Mon, 23 Jun 2025 02:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="w1PyRO60"
X-Original-To: linux-media@vger.kernel.org
Received: from out162-62-58-216.mail.qq.com (out162-62-58-216.mail.qq.com [162.62.58.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8457F450FE;
	Mon, 23 Jun 2025 02:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750645951; cv=none; b=PV/6GbCgX9jZFqN0vrH679ZZfJkzGjL4uf6pLXtwGvj/s1970uJJFB0jpPZAu4hlu202MEEtF/JkbOGfPBASyt+s1HT+ahlW+MCQVcUt6oKppQEA1Z9Cmz2XlagtM4EWfrhAf1OfykfUL+/vxwxytxPt024NH3l95kUWfgAJLqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750645951; c=relaxed/simple;
	bh=I3IwtnwfiJJKXZ5Hkkf154DD2eNcuoNBv5UjoiVoioI=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=p1pplG0ALJfmp2s43cB8HM6omaC7QVHgGu8Q4CLmrDpviq8QJmw11s6dL+u2AJxeMCPmMjLuW1GzCRwxzvFDr99I2dPE7TJR6XYMxL9H//uynZPhM2U2PSxP8u0e2hv2I9i1bi3xk9mtoHTM3gTdv7hNcvbAUBA4zm+YYfu/aCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=w1PyRO60; arc=none smtp.client-ip=162.62.58.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1750645936;
	bh=Q7aC4c4TDIl4ETvPWSjXBXjWnAW8+l3VAH/BNluf1jI=;
	h=From:To:Cc:Subject:Date;
	b=w1PyRO60+2c7MuCo7mN+goQa/ez65g/COIgCoeaGQex+WpnZY3TMbGu/2J9LBlKzy
	 bYvmTY4jX31/gO6SSF0fT5+YJhffm0txMopO64isMTHePJaze87fXpOPjeyoFses1g
	 IPLVXzkGpEPCVpIl4z59lbIdXterXfLjIjtSWovU=
Received: from KernelDevBox.byted.org ([115.190.40.15])
	by newxmesmtplogicsvrszc13-0.qq.com (NewEsmtp) with SMTP
	id 685B8C50; Mon, 23 Jun 2025 10:26:05 +0800
X-QQ-mid: xmsmtpt1750645565tpzus0yxd
Message-ID: <tencent_A9851A542D89AE1B94DA80AD2CB0280F5907@qq.com>
X-QQ-XMAILINFO: OUUkXTc+3Jyn75R45GuDWrKXbZu/1fRI2Vz8/6oCEMCh+bptW9kxi4nedxP5Qx
	 FEJ+1Pn+t8x2NBB83d7Osu0RvGvy4PkYMwjq+dk3xVMHRKM8LQz0t0t3lbwI28DL4/B0uMdVyYxf
	 mNNGd4lwg+eHthufqkV5cVNxTwn4wb6ZpTTo5cz1jI8/Drb63PozFbBcTUpHpw+FBMhbiDdeksjr
	 yMOGR80HbDl+DrFouJRWyeCwi5wAHcf5m9btem39fST0+rqNUdGlmhVkHEZV9Cnvr7CK8Z/n9ag6
	 7TQPXZIelCCt1+wzLQSDt+mcpJXRTz2ZJV2oEfqgcS7r2/NIlB4ispBPphOqnnnriAGjCwK2LJVL
	 v2e3F5hYDvQRGWOUIXl9Y/3G8NJLqtjIiACXHGv2hJz3X0S20ILQSwhUJUtd4rAu5bDoautrG1rG
	 +aLd/KLPNOjgSYnQcRpC0HOd/3YIa8qXmUmkGw2pJ3b9I4JGfPYwklukFeLdzZujiPWDcl/z9rXG
	 dmRyVkIHRyjpiKCukQXQVz8M36XCG66XzdibgQbNskRk+zXMbqxkqygvG0CsfjvijvzGolBreXR5
	 I8gOqM5hwpmKRLdf9dTQTpe6hZEOPMZvAdoW81ivCeZ8Fg9biSgRXpFtsjnxn2Tbf50xqzP3P51/
	 Um9xJE4o522a+PakwEJsNWwYUwG2PgAoa4eetS6i/7CD9HiKXSEV4CgNDwqMJ/G6teBkvzSR3vqb
	 V/h1m/eMqmOwjkUMr8jPKRkc3TWNYQZLINWgg66e7pGs7YU8HmeOJlTsx2sXejzz8/oVojAqJ/BS
	 3cLpKhDlSIILLE24kL1RFU5t2XHFfI8ky4Jz771xlw47SMNISXL8FXLlGWhJpNIEnT3qeknqy1mz
	 VwVMrQBJVwizewPYkcUUwYuB4hDpc9e+dYVEbf1AyuMAV6zusWij9VBps8XpbEk15XuRVBmuuWrR
	 vuY+MrJhLOaptnBphBqXI/+L67+B2HoL9jmKBw1wpy4UUOjpwiurSi9mlZMeMDeBd/ze81vQNCpx
	 z3Jo3fTESaE1McqGd92xVJThiLVzQ+XVBi6vdlAbRt7wZfv64MA3BIhBUgvsymRpZF0WSU5B5RV7
	 QOGFD3z9bLacnDW2x4ih/fU9v1jQ==
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
From: Zhang Shurong <zhang_shurong@foxmail.com>
To: jacopo@jmondi.org
Cc: mchehab@kernel.org,
	u.kleine-koenig@pengutronix.de,
	hverkuil@xs4all.nl,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Shurong <zhang_shurong@foxmail.com>
Subject: [PATCH v3] media: rj54n1cb0c: Fix memleak in rj54n1_probe()
Date: Mon, 23 Jun 2025 10:26:04 +0800
X-OQ-MSGID: <20250623022604.469797-1-zhang_shurong@foxmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rj54n1_probe() won't clean all the allocated resources in fail
path, which may causes the memleaks. Add v4l2_ctrl_handler_free() to
prevent memleak.

Fixes: f187352dcd45 ("media: i2c: Copy rj54n1cb0c soc_camera sensor driver")

Signed-off-by: Zhang Shurong <zhang_shurong@foxmail.com>
---
Changes in v2:
- Fixed compile error
Changes in v3:
- Fixed coding style warnings identified by scripts/checkpatch.pl
---
 drivers/media/i2c/rj54n1cb0c.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/rj54n1cb0c.c b/drivers/media/i2c/rj54n1cb0c.c
index b7ca39f63dba..a2fe906408c5 100644
--- a/drivers/media/i2c/rj54n1cb0c.c
+++ b/drivers/media/i2c/rj54n1cb0c.c
@@ -1330,8 +1330,10 @@ static int rj54n1_probe(struct i2c_client *client)
 	v4l2_ctrl_new_std(&rj54n1->hdl, &rj54n1_ctrl_ops,
 			V4L2_CID_AUTO_WHITE_BALANCE, 0, 1, 1, 1);
 	rj54n1->subdev.ctrl_handler = &rj54n1->hdl;
-	if (rj54n1->hdl.error)
+	if (rj54n1->hdl.error) {
+		v4l2_ctrl_handler_free(&rj54n1->hdl);
 		return rj54n1->hdl.error;
+	}
 
 	rj54n1->clk_div		= clk_div;
 	rj54n1->rect.left	= RJ54N1_COLUMN_SKIP;
-- 
2.39.5


