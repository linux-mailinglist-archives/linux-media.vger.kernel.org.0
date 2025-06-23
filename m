Return-Path: <linux-media+bounces-35562-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D96E1AE3382
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 04:09:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C44C3AFDC3
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 02:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D74F19C54B;
	Mon, 23 Jun 2025 02:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="C7/O820d"
X-Original-To: linux-media@vger.kernel.org
Received: from out203-205-221-191.mail.qq.com (out203-205-221-191.mail.qq.com [203.205.221.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15FF05680;
	Mon, 23 Jun 2025 02:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750644556; cv=none; b=bFkQZIsVzqv+mfMPXqTFhEZ5gtW73ep3R2o9+wCgzb23UAnHUfPqaXPiXHwGtleP3cAo1DzJt3jWA8qiAo7IHWakDqUuJaX/esW5Gmu6UpFpUXNS8sVsY9vqOjz9M0nPLtU8Vg/EVc0070rujq4JILdZ+C3gPY9IEINwyL7vV9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750644556; c=relaxed/simple;
	bh=j7eB2q/z+OmNZgKngcstYOKG/zJzngNIKXKD3iBF/Dg=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=AiesMKgnXZySmOT/Dxu+UElL6efxZZYBwEvE2QSBj/y0GkeiI2Q7F0VstgOetD3WQp/BVHtGqGB02kxdNPpw7lYXC7ar4UPj/kLzyQ/o3SDTb70oRd8k98Tw4Ou1jVRsF9N/irZ1wwDVo1/om8kEr2IEPdvceIoYU1+KghM36c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=C7/O820d; arc=none smtp.client-ip=203.205.221.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1750644549;
	bh=w/IrRe6rUfjhYGQ8ZfN7BV9RMAt4q7SyqaPSnuvYJIw=;
	h=From:To:Cc:Subject:Date;
	b=C7/O820dHcQsTuYPh9yYTcPCNkhQCa5910iQmfx9X3WfKuGCwPNt3/Lk7Mex1Qqur
	 J0N+kUdbLctsXlETgW9YLD++/PT16uAtPVMbhgfiuGRDE8MzD6B9uYKUQ+Z56ZALvy
	 3GUMvcsxMRwF7+nBRYaSkI09joUJJuVxx6MrTwuU=
Received: from KernelDevBox.byted.org ([115.190.40.13])
	by newxmesmtplogicsvrsza29-0.qq.com (NewEsmtp) with SMTP
	id A4B64F3; Mon, 23 Jun 2025 10:02:36 +0800
X-QQ-mid: xmsmtpt1750644156t8037weuk
Message-ID: <tencent_9B4FC2E406B836606B07ACC3E34B41023505@qq.com>
X-QQ-XMAILINFO: NEGqkzgyFYqOMmLsFDV9oBbnG4YtWbtG0GmkIoZyRGG54UjuwN5P1NioKAAyeQ
	 RcSXQ0wN2LW8wxjpWPQXkgcXbVkGjHNu8r9Godyot5iC81OwZj6I8YSxey5pZCVYB8kszl1knPxi
	 lUGHTemOJl4sRNPDriMoHSGTulYL8ky+KJiY1o3nWi0AXQ4X3Zz19DKsKq5yE+wWbdr7GqK0zoy3
	 FKloUO1l1voPupw4aL6b+4bNNZ57DHTTBCMHztuEJRbgipM118YnWavofPQCvGgBiHNvbC3D/8Ns
	 B+dHR5fa32obJIjzpA/izCQo0P217pfjRulr9Hhk6PCnL9oq4susIlHj0X5hnIcZDDzQquJN1EHs
	 q8oV0qvYtgCRctCL7Xhbf4CNiApBtb/2gmOuABU7LVhE8tLkRcT9b+BnpHm62/EGBj6cHebA3S+/
	 S3CjC80kTn2eYYaZXS5sJqOMy6hz3t2zKys3muXlcc1Hh5r/DZT3cFL0/sMiGsOipExtdhvgRHNg
	 woWxWpTXvuO9+5oLR8QssextAslWSbctHvG2qnKJSo9TJ7XuKpPnDp86zS1F1suZ5kekg+PkcEMN
	 TmO7mmU3NVmddF0GCkr3rhaTdQmtDvhSzChoH/co3hW5z3eh4PKJGuYW0Ej8ly2FFH/z7dYMLVbA
	 VvFT6yP7VwGjZ25tH9Dbf4ZSlpRdTf3EYVxYnwm+gUfng3uqkMfwEXBff6sLs0jEdVxVbRy2g6U+
	 B2Z4dz641xMcacdTZE84ySk8Yyu9msXGO112PL7ge5dWBLBNa6rHAirOi1Cy+FFL1nrU861lKfq5
	 zzwVSbCBPoveuiSLlAfUOcLVeAA/aVpPSMAaEk0npgMjVwy6WPaa3MsLO9u2SIHUzNRw74NgaN/e
	 e4WRuH+fa7yKBoYyIknck7kFAJ67lnOVIy6a0BrOA97XgCL5d6NRtqXTnALQGY3IqMrfJKcP2Fzl
	 O21gaXT4q9EjjZVg7AirrDqDEPaL2Q+271FUGGboGwCNl/1qy7NlOKBqtxHS87
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
From: Zhang Shurong <zhang_shurong@foxmail.com>
To: jacopo@jmondi.org
Cc: mchehab@kernel.org,
	u.kleine-koenig@pengutronix.de,
	hverkuil@xs4all.nl,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Shurong <zhang_shurong@foxmail.com>
Subject: [PATCH v2] media: rj54n1cb0c: Fix memleak in rj54n1_probe()
Date: Mon, 23 Jun 2025 10:02:32 +0800
X-OQ-MSGID: <20250623020232.438624-1-zhang_shurong@foxmail.com>
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
- fixed compile error
---
 drivers/media/i2c/rj54n1cb0c.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/rj54n1cb0c.c b/drivers/media/i2c/rj54n1cb0c.c
index b7ca39f63dba..5645dbb6b38b 100644
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
+    }
 
 	rj54n1->clk_div		= clk_div;
 	rj54n1->rect.left	= RJ54N1_COLUMN_SKIP;
-- 
2.39.5


