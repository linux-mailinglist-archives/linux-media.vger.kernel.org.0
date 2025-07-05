Return-Path: <linux-media+bounces-36888-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA454AFA0F4
	for <lists+linux-media@lfdr.de>; Sat,  5 Jul 2025 18:36:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 20DC87B279E
	for <lists+linux-media@lfdr.de>; Sat,  5 Jul 2025 16:35:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AC3B20487E;
	Sat,  5 Jul 2025 16:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="Ax8ulBTO"
X-Original-To: linux-media@vger.kernel.org
Received: from out162-62-57-64.mail.qq.com (out162-62-57-64.mail.qq.com [162.62.57.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA02B2E36F1;
	Sat,  5 Jul 2025 16:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751733395; cv=none; b=TvZvQCfrOs7GlZw1RrZ7gLcSAEtOxFHrq4Chj2jwe0HCW2C4Qb67w53zpPlFKrWF0ncqUPluaScCdba6sBhquf/z69nPo/BenQ3by4zJirC7nbsLDmVZLR8Z7wPDh9yvAAwps1jUQWcPoi0TPq3F/womU04SwqMRlW50xxPVyHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751733395; c=relaxed/simple;
	bh=MhRXGLOx9YI7OF9HeGPxrYc2otnoj4dqXsLLtPSES3I=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=gq0bPXRIjsUQwmBZOxGyqIZXl4eVqgmu5TspNHuV/tdvKxuxU28FCaoQB/bK7CrFRRYvZD7AmjN6QBmu0EE/jCIwrn6c1Qmw4LstoN8GISqiGs51tzPSd9OSJRl486ZLAyLMx4kjkBpGvCw3EbmoSIQCBbN7SlG7f2maiOBjt3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=Ax8ulBTO; arc=none smtp.client-ip=162.62.57.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1751733078;
	bh=VRQDu5gbkSUt0yy6u5srlQ1NMyyenQ731udJHBRNu+Y=;
	h=From:To:Cc:Subject:Date;
	b=Ax8ulBTOoVe6STJ6PXNgd/jK1rMRszado3w9w/vnWX7fekZBRVRNTyC5dnRfbnQJc
	 qTVtuP399au2K33tdwHMIRyTDzIXQfcBACrd1cZEPpa0PFnEXKbWg2kiQFckU6uh2n
	 LxC9HfBCW53FvH5vCU5XUWWmMZLt3/3VGePFhVTY=
Received: from KernelDevBox.byted.org ([115.190.40.14])
	by newxmesmtplogicsvrsza28-0.qq.com (NewEsmtp) with SMTP
	id 7D02C42D; Sun, 06 Jul 2025 00:31:16 +0800
X-QQ-mid: xmsmtpt1751733076tdfjqvdx2
Message-ID: <tencent_BFA6B5F65B7B607F1E7E0AB0A843129B3708@qq.com>
X-QQ-XMAILINFO: NMiAo2azIaDAspBmoJ0cBdXt7n1GlUAnF8SpN/szs9H4A4l7F1snduk789AoPn
	 2BLe65A8/tnUqOBf0o2HJW52A0B3dNf+wMOrwztQdlq5KP2AkY00gz7YLTB0rYrqauJSPw9fZu2m
	 EtmZY5wp4YP8t1Riw9qVvhXr2CDv9S/WrwyMBXmkFDaKkQnTFxH3C3eERWmW1AcTz651rSP5ZbgI
	 irpJuizi+9ANtvlqCTDpkqWlz7/3x0XT9jZZzYN9IJaD5iFLSaQcdPvTkcsGghTL4EDaH2T3dEmL
	 VDAsBElxHteQqyvAdKAXYjpe0278TKKnS9mAu8uawUVF536X42NY3hXr8mCNiVbxmRqyt3CFN8qN
	 McByxC4IMoHiG4zSXeVc4uBYqF0NGuq/xU8thRNqr4wxPRsnZpPwLGRoUzeFpelrHBjBa7PaedDC
	 Qfs7+mN4ekGr8clyS9UxDlj5RA8CqQAtY2sb70etcdSBt6Y4ieUczjW+jKoq6eheyVED0N3Zb1E9
	 XGboSH9M6sVFaQuoFTiWtalQaukOtv+pfxHR63/O6GvTgz2+X6XwhNJoXFfZcs7ioaLM9GCeE9vV
	 qjRPtw7y9uFAMG4TMi6CXpU0vjfto7SW4S1BKxi8HxChLm0K2y2FHgF9t98JXFMc2afq52cYgoxE
	 Qkka01yMAY36lbvx/vrgP9T53RjIOyoSwyJFpfah0PeV2ZwMQaw+5cRRTH76JN7fs05PCWIrcXal
	 lA9/6bLjq84ll3qaJ+XX4f93K8ChjheHaOLGFYOU+ve0UVyFb4UIvw04GMfDHIoH4LZhnUaGLEsB
	 R4//fTchMUrKdNChUBOC+BV1WgbWC50nKpKsPYjy+RvwtwYh3rT5XioX1R7p5f3nD+IhfJWYUlYd
	 bBqsf7ANxAKseQac4jI2j4mrA2tzHWplbSv3qMTCZzlYBqdGTp9v1T+Y17cuJ4EMt8yUs5t+RTIJ
	 Bljr54naq3rE9dlkX5wV60o4RlMldPdkmKGGF9WtvfFCOfUX8pIvZcYHUCU9ceEcxIzGAIB26gVV
	 ZuJwJcNA==
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
From: Zhang Shurong <zhang_shurong@foxmail.com>
To: prabhakar.csengg@gmail.com
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Shurong <zhang_shurong@foxmail.com>
Subject: [PATCH v2] media: ov2659: Fix memory leaks in ov2659_probe()
Date: Sun,  6 Jul 2025 00:31:09 +0800
X-OQ-MSGID: <20250705163109.3493366-1-zhang_shurong@foxmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ov2659_probe() doesn't properly free control handler resources in failure
paths, causing memory leaks. Add v4l2_ctrl_handler_free() to prevent these
memory leaks and reorder the ctrl_handler assignment for better code flow.

Fixes: c4c0283ab3cd ("[media] media: i2c: add support for omnivision's ov2659 sensor")
Signed-off-by: Zhang Shurong <zhang_shurong@foxmail.com>
---
Changes in v2: 
- Updated commit message to use proper terminology ("memory leak") as suggested by Markus
- No code changes from v1
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


