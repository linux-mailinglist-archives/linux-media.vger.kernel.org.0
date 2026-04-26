Return-Path: <linux-media+bounces-59631-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJx2Ml8Q7mndqQAAu9opvQ
	(envelope-from <linux-media+bounces-59631-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2026 15:17:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6D2469EED
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2026 15:17:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 677A4301545D
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2026 13:16:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9405E361DDD;
	Sun, 26 Apr 2026 13:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OUDRj9N5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7C034F24B
	for <linux-media@vger.kernel.org>; Sun, 26 Apr 2026 13:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777209402; cv=none; b=h5Iw79XcZCftIL3saVtlTlyGgdtOc5+xIP+7fhPC+tddj7Vuvew9QfiPBjgXVUXscCJ+iOqwR0+zRIdFLI4m4F/rX4WOs4HIWVTTEvLcazVPy8YQt+z1pcLr2y2k1h+DI2yaZeMI0nfbUzOBXSlBCWaE4ssl5gNFWcfyeKJUYFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777209402; c=relaxed/simple;
	bh=e7QWtxSkrIHtUdA7OH0NJS72f3PZVhziWa99JGad/Tk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=O1UcEMi+GXTViqpbbfAXAuey4c7bKMTB9PdxuzZZZWA4pBIcUTvGlL/CkGKL/e5Zm5oc35y747fwyZiuspo4HZm4Gj9sy9hMbCW7mmNoh2LG8BcfIFLBKzIj23/igMspxOm6kOIxXJ+nway2bRW+T7MI4go3JlcotBJi/MMBOLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OUDRj9N5; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-82cebbdbdccso5763453b3a.1
        for <linux-media@vger.kernel.org>; Sun, 26 Apr 2026 06:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777209400; x=1777814200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mfpir1cWg4EgfZHLjfNae2jfgPK4QiC8JAKh+M/m5S8=;
        b=OUDRj9N5JSklq2oJFKv5HoZuk1dK3FguaS2NjCv1tEvY+jT3bVMj0AoSbH27ccN7Xz
         6rClED7AGlKUYuqTQwtfNNCEE2H1MYIg4XPlFSZ7yfyAPMBJaZFeVDQvv+GyFA7pHZvn
         mx0bFQkilfbSSo9QV9jgTlTt1PeMaMBhdgbEAJo/L27v6UcIfzE4fskMsfzEX+n2q58t
         Mq15gWvRrw262/600gJCX/apIkCTQy+25aXELIP8ByD2++d9wBEOuGhcQTA1v09IT4hR
         0I0H6yUqBEaro1MIekwNqx9NFGVQw9wS2ytUgTneX4MCWs82vks0gihIMwrFKDE9Xug6
         slGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777209400; x=1777814200;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mfpir1cWg4EgfZHLjfNae2jfgPK4QiC8JAKh+M/m5S8=;
        b=RJyLJ+uE5uY08C+Rs5FB9VEFF3JeGiaTJlVzNCbTEh45NBUKWwWpJ36kqO93nyVe68
         tGWTi0u8kq3wegmWi2XkmC4oyWuD4se/2wok4ZbbD0AXeNO8Nf2Z5CzavNc0FNtV/bFc
         u0xE2o65wG25XBIEy11wpTb5gC9iEo6w3lqA0pwgg1CWrr6Ffzly3LU/DSPYu15TRYiI
         H0qnL7nDwYD7z2q0zO1kTazJ7dHfuIJ//N3apDAHV8ShSrHBAzNgK2ZRlt3xgyRLE0Ja
         cq4mrtaW+duanQlqEkQKkaqivVo6sGYrRWqu+u4lJ4yB8MkoZMaJZrPtMwLyqjc0jWOk
         mUIQ==
X-Gm-Message-State: AOJu0YwnC78VAVDGuZJip5dGHNeYHP5gblZTcEsLVRcW3sfwJwLWjW4q
	6edkPA3OYVnvt4DFbXiNWSc2fIO61j5UcKnnKOR7lMdPN6IoLTKPYGw=
X-Gm-Gg: AeBDieuENMYG7lS2fAoNZ3vy5Wx/94oTSmtb0LEc8YsKnxahmsEUnbVFesMdkWlu/e8
	1IY9lzGSNSssdSCmmWuZz2tn8iazUDGpqi0PzENSUBosB7wUBBvjo/MHsDzCaS+cQllcTGsvMwI
	daoPmOgQZFPXbowPC6DkYvY4HD+44QKXHJZu4aBKRgJRwF/n24QjIGUtaF+Smyi7C8DlLa164sv
	Ven2TwNVET7Lr8PFDzahmm0uH5h2H+wXZA1ttwef3V4nkLn4UXBq0ISG+zN0nceV2TrKajI1mZu
	r14aZkTKfVz6wOluEA5yntq7tzV7xigdH4zYs4BTkHJo8n6K2oVuphewLf+u4oOMq28TvJvlULk
	5ok9vV3DOpgR1LDZkKp/vu5wqTfGEzWrR3EstMpSL1B+tGPF1rsR8HORpKYPYzzN6cnNDBxAUpG
	QT56sHSa1WP75qM1OOTexDYsW4cjn1g74dUakxrY/daW+m896mzFx7bB2eR4MaWI7gJLykkirTu
	k2lghrZWlVBFmSpOn0nfamENwvS8GGKt+reRukj4tQ/9xs=
X-Received: by 2002:a05:6a00:2d88:b0:829:6f7d:3086 with SMTP id d2e1a72fcca58-82f8b3aff42mr34206860b3a.11.1777209400127;
        Sun, 26 Apr 2026 06:16:40 -0700 (PDT)
Received: from localhost.localdomain ([1.226.165.54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe41cfsm31773801b3a.43.2026.04.26.06.16.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 26 Apr 2026 06:16:39 -0700 (PDT)
From: "=?UTF-8?q?=EB=B0=95=EB=AA=85=ED=9B=88?=" <mhun512@gmail.com>
X-Google-Original-From: =?UTF-8?q?=EB=B0=95=EB=AA=85=ED=9B=88?= <pakmyeonghun@bagmyeonghun-ui-MacBookPro.local>
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>,
	Myeonghun Pak <mhun512@gmail.com>
Subject: [PATCH] media: ti: vpe: unwind v4l2 device registration on probe error
Date: Sun, 26 Apr 2026 22:16:31 +0900
Message-ID: <20260424000000.547-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4F6D2469EED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-59631-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhun512@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

From: Myeonghun Pak <mhun512@gmail.com>

If the vpe_top resource is missing, vpe_probe() returns -ENODEV after
v4l2_device_register() has succeeded. Probe failures do not call the
driver's remove callback, so the v4l2 device remains registered on that
error path.

Route that failure through the existing v4l2_device_unregister() unwind
label, matching the other errors after v4l2_device_register().

Fixes: 4d59c7d45585 ("media: ti-vpe: vpe: Add missing null pointer checks")
Cc: stable@vger.kernel.org
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Notes for send preparation:
- Fixes tag was validated against upstream history; the local row worktree
  remains shallow/grafted and cannot verify it by itself.
- Build was not completed because this worktree has no .config.

 drivers/media/platform/ti/vpe/vpe.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti/vpe/vpe.c b/drivers/media/platform/ti/vpe/vpe.c
index a7e5a85e72..81bd1f9cee 100644
--- a/drivers/media/platform/ti/vpe/vpe.c
+++ b/drivers/media/platform/ti/vpe/vpe.c
@@ -2539,7 +2539,8 @@ static int vpe_probe(struct platform_device *pdev)
 						"vpe_top");
 	if (!dev->res) {
 		dev_err(&pdev->dev, "missing 'vpe_top' resources data\n");
-		return -ENODEV;
+		ret = -ENODEV;
+		goto v4l2_dev_unreg;
 	}
 
 	/*
-- 
2.39.5

