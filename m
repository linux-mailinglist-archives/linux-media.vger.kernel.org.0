Return-Path: <linux-media+bounces-54865-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEDCFc8RrWm8xwEAu9opvQ
	(envelope-from <linux-media+bounces-54865-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 08 Mar 2026 07:06:07 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B094722EA6B
	for <lists+linux-media@lfdr.de>; Sun, 08 Mar 2026 07:06:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E7EB2302768B
	for <lists+linux-media@lfdr.de>; Sun,  8 Mar 2026 06:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D74D2DB789;
	Sun,  8 Mar 2026 06:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KQDO2cVp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA219336883
	for <linux-media@vger.kernel.org>; Sun,  8 Mar 2026 06:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772949961; cv=none; b=HP72WbE9l3bpPbZL2mB61kPqTb+LG8dJOr3x/kN7HqYiI3TRGru/8ducOKD2YCe4FB2BSiW2pQiWF1Ptxwi/Ntd6ao4kjRbhoVo/V+6LJh7hhfzBVt/YCQzmMXhIwYD1SgWXitO8q+8JjOXrrrypRe+3aLQCFpZIaOPBHpTJtnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772949961; c=relaxed/simple;
	bh=ZBwtWgP14Sltd/BIrSJ7lUdKZLMDX51Ozy88gEhGli0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lWIfKYcTVqgsCplZr3XYDISkid6K2k6jewT7NYwMfxje1VLLj8QccrGbRaeLtX7XSbFg2EG0+ORJGc8aajEkvy5E8CHhc5FjpHTxmD2NCy+FSupC9mLVpGQA9DF6XyqMAYgOx888iZuldegNasq021Iiy/+Id83Mo5jqsK8Xmco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KQDO2cVp; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ad21f437eeso76121565ad.0
        for <linux-media@vger.kernel.org>; Sat, 07 Mar 2026 22:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772949960; x=1773554760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NdmHfX8iJMNVaUFQiMWVIu/bs4A6fwnA5qtvVTfwi5o=;
        b=KQDO2cVpuh9SPtSx2AmQGV4mStQ1dd3H51X0GWFSWnjjglzGm5VEO7JKD5f1azexO4
         8mow8SNBeeXYUItHqklc3XbbS9xRq3XvqsWY1y07s/3v5EhpwgsRttQE9gAsazxpt00O
         sInqjQLuEZwMufitG1yErSF6fqYrlqrrepg86nU8i1mUq5vAqkcsCCX/cX/zc81qiiVW
         XypsS09DAt77rDXQ5JSlRpcoBH11Ufq/abzm6TdlHPEFsJMAOUsSacnLgLi5hB4mKRbe
         eiwd2bmk+XEX0Tcz3Z9eAEqyDcoO9b1GKu2XBMFqEIuQt+xdX92CyHvYS7ZMliMdLkDN
         SXdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772949960; x=1773554760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NdmHfX8iJMNVaUFQiMWVIu/bs4A6fwnA5qtvVTfwi5o=;
        b=pjWylXKaW0pzNI19Ozsz2pfJzrIIXf2mPXUy2oeUI+Ga59Jgl0CvskW/0Ct3UB590N
         o6CKZKrxTW7vFnuO0vEIokucXmNV1CeKutF4HZ/O8yUqqh069XwjdShUik3jTjCmsuAm
         fCLKxghWb0XhpGdQv+GwgN1k/MZunlOwI13E2Zjq6H53olk/Ynn+Utfnu30l78yk60eY
         kwWBtctS7CuhgJxhNHn59iA+fnn3ej0kuoMVfI0pqz28TX7iMN1oy7RbFPqlBh+dA7/T
         SG4whsSy6j+j+HoJuPYfx4QsgfSTtXPteUVWX82WO/P7LGeOLv53PQD/kiGP8UpVgRN0
         qFYg==
X-Forwarded-Encrypted: i=1; AJvYcCVSHtF/hnGr565zlHlOGMXYaA9flcRb3m8Dh6jr1UBFzNB5g4ZGnWTgJRgiCmvUlmnjc64rttvpiQXBxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyABJ2NMIbuwjCZe7HZphalRYa0OCMSwYeOM+a8LTWYuToqBMDc
	Ar0TbvoWTP47+gidNHXkUNCrGPM4eQ49Ci55dgj23GLH82YIh64iBlwi
X-Gm-Gg: ATEYQzwEQd++5+/uTqqOBA2ATCPBQx8V2d7aeD7pPJlzBZjBOGp4bLP2uOWQsoIfvUe
	WCsPbkUXTzt4TUOLxxkCYpICMBsoEBMXDtL97Wc0TkmS3bHzoZzZHWxo8SgorT1+EmXJK81YlfC
	ziqpQAVZmm6vPM70vUa6c/w7iIpmpcfE91k+rOIHZ6dk1+soorm1KOyRxa3RYttzM25H5d0HAa2
	grIon9zIb1BR7xf0t9LAIKVrORd8F8QKZ6Q5voqDU9rchNXVQMDvbU2eVY4FiMdvBHOhb6Drnnc
	dtA7EM7RXxPm22xxqkP3/n4Z7nDbjkBFx7/S/vSWqIN4Mu913GK09ciPp0bwtbXLgKgD1xwdm9k
	bKT3CoAJV8CDXo+OgVfBGtNbuKrV0qZWSA7AFwum+RS+BWwNVlcvTDeMWkuRJdo2WWmBn5+Ekkv
	/SHYLPlRZvXtvOecAMcHBs53O4ZwSleL8J+cm2acpG2uUDIoM0
X-Received: by 2002:a17:903:2f85:b0:2aa:dad4:dfa2 with SMTP id d9443c01a7336-2ae75c01749mr109084195ad.18.1772949960247;
        Sat, 07 Mar 2026 22:06:00 -0800 (PST)
Received: from hu-ckantibh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840aefbdsm93680815ad.82.2026.03.07.22.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 22:05:59 -0800 (PST)
From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
X-Google-Original-From: Sanjay Chitroda <sanjayembedded@gmail.com>
To: mirela.rabulea@nxp.com,
	mchehab@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org
Subject: [PATCH v2] media: imx-jpeg: convert kzalloc_obj() to devm_kzalloc()
Date: Sun,  8 Mar 2026 11:35:54 +0530
Message-Id: <20260308060554.1764128-1-sanjayembedded@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B094722EA6B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[pengutronix.de,gmail.com,vger.kernel.org,lists.infradead.org,linuxfoundation.org];
	FROM_NEQ_ENVFROM(0.00)[sanjayembeddedse@gmail.com,linux-media@vger.kernel.org];
	TO_DN_NONE(0.00)[];
	TAGGED_FROM(0.00)[bounces-54865-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.985];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

From: Sanjay Chitroda <sanjayembeddedse@gmail.com>

The driver allcoates memory using kzalloc_obj() and frees it in the relase
path. since the allocated memory is tied to the lifetime of the device,
devm_kzalloc() can be used instead.

Using device-managed allocation simplifies the error handling paths and
remove the need for manual cleanup.

No functional change intended.

Signed-off-by: Sanjay Chitroda <sanjayembeddedse@gmail.com>
---
Changes in v2:
 - Rebase on tip of latest tip
 - Updated commit message accordingly.
 - Link to v1 https://lore.kernel.org/all/20260307210404.1428894-1-sanjayembedded@gmail.com/
---
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index b442dcba02e7..bd4b5f08a85c 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -2200,14 +2200,12 @@ static int mxc_jpeg_open(struct file *file)
 	struct mxc_jpeg_ctx *ctx;
 	int ret = 0;
 
-	ctx = kzalloc_obj(*ctx);
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
 		return -ENOMEM;
 
-	if (mutex_lock_interruptible(&mxc_jpeg->lock)) {
-		ret = -ERESTARTSYS;
-		goto free;
-	}
+	if (mutex_lock_interruptible(&mxc_jpeg->lock))
+		return -ERESTARTSYS;
 
 	v4l2_fh_init(&ctx->fh, mxc_vfd);
 	v4l2_fh_add(&ctx->fh, file);
@@ -2246,8 +2244,6 @@ static int mxc_jpeg_open(struct file *file)
 	v4l2_fh_del(&ctx->fh, file);
 	v4l2_fh_exit(&ctx->fh);
 	mutex_unlock(&mxc_jpeg->lock);
-free:
-	kfree(ctx);
 	return ret;
 }
 
@@ -2754,7 +2750,6 @@ static int mxc_jpeg_release(struct file *file)
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
 	v4l2_fh_del(&ctx->fh, file);
 	v4l2_fh_exit(&ctx->fh);
-	kfree(ctx);
 	mutex_unlock(&mxc_jpeg->lock);
 
 	return 0;
-- 
2.34.1


