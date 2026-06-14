Return-Path: <linux-media+bounces-64822-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mz5cEeDdLmow5QQAu9opvQ
	(envelope-from <linux-media+bounces-64822-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 18:59:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D03306819FD
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 18:59:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=na8Eb7PB;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64822-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64822-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F27F0301C90D
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 16:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9F9C3C9429;
	Sun, 14 Jun 2026 16:57:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E813CAE95
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 16:57:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781456276; cv=none; b=FlTIxd7L9A8M3fHOrUt/Cn4MTLuKJ49gMpTmxc3VeG80O120bPvGCvt56hh85d1RiXkw7lxuwSpx8RGR2fvijSRDQ2gNgg65R0diA4LJsOyowc2aZBJCKG0e1go/nfRVlVduYhfGzVtJ1eYccUwdDOVFuldZGCLDjcTjyGbrxXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781456276; c=relaxed/simple;
	bh=gN87j6PTIvn/ARa0NZpeucZfdsvYUJ/gi5CQ4Gta24A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TPotqXLNtXfZlejndF17IUlbkEYkSjjXkhNgNH8Aj7VWWYSZxIgBB1XT7OMGPqOq+wQZDvWyszCviL7Al5Nb2uN8NBaE2cy1fl0wO1QhgP9rmgAyORGEwgarDx5kfoX7fbZklOrJqR+KLVugNBkV+CQ6y103ayGwunBBxVOk1L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=na8Eb7PB; arc=none smtp.client-ip=209.85.214.176
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2c0c2d792c8so15706305ad.1
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 09:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781456275; x=1782061075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lrWzw8QqzhBXRcDuoAQQBRc2zIXQC2Yh/JGGLwvdA1I=;
        b=na8Eb7PBS1PY8q0ZmkUlMjM0lmXPULQNfTjMxLHqZga1XeS5EOaVGiQTTJSG1KKCzn
         RrxiNxJyfZocI5/1hMes+oBfKjgiN0V3d/iNqyb6tKIhF7fGlyO4xQxCm+2zWEbdt3HM
         bKvhw/KjpCgS3iBhbH94LcO9kFnodbkWgHbA970udkivvrdNCNJy6R0esIdVQNsUwFUE
         k2ypmo3SydKLiksEXymmLZGaFRcefzRMTV/r/RwUBhBSWuhS5bEryyARPeKvxsDHrsPH
         Za7RmJgvdl5fnpeUctueW+xgcakBuwjB3qQlALGrrjWnTIDhtAi+kmdeKK7qttrlu7Gp
         IhZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781456275; x=1782061075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lrWzw8QqzhBXRcDuoAQQBRc2zIXQC2Yh/JGGLwvdA1I=;
        b=bzmbWHtrrRWlib9c9d02rCEUMpKimAy6o2uVOBX1RYlJ5vZbUZtBboXwwmCDRtFlnC
         VQA+atH89YKHjMC/taLAoyKYZPE+Tl1X4wwBabuKzXYeKn8Gv1rNm044Ep9JrOZZeT8n
         XkKQjnetRLZ2LHFXuElln71IJOp6Y7D/X2m3PIL3IvlSSzoX4EeC2S3rbSgbpY/PEc6U
         rFt4kRgg6Gi9rarE6/UAv3iVvuWuoV7d1dyfZPNc1AcrCVNDzHPO8xGxNIdh/1c+iYec
         MuwCTN7e/9f35LEewR66eXMC5ojwe/Ir8xuo/Mz10y7DksU83mn/RymeGF1J8X2oj7KX
         0TPw==
X-Gm-Message-State: AOJu0YyERDsiblg0pw/7tITL+afU2dTzbWYAg2aEp7H40QbNTGFVKLXU
	pj2qM5oxg7Spd6JWWaDfAuyMYRKui7If3BLFSC7aPXuVfx9XiZ4s4SwlvZkWqzoX
X-Gm-Gg: Acq92OH7Q/D/LDFfJmV7Cndc8+R4V8CdKXRSgkyqUHkci34rggAYVBjoxJwZfva2v2r
	qYX6G/36qOCvymzkjQ/f9zd+vOs7GqGa/Fr6xPrRMRnbEzevO61nnFqg1scO2Gm2Bj8F1qkuK1O
	+H6AXTty/zIJ+xTuGw2xf6h4Xp4xnI8exHY4KLxkZXjxzmFKsEZrXA5d2/fiQyUgeEgaXluT8nm
	ea/YdcmHI7jE2J8RM8rbHV1Ut2nuaF4dq+2XLrKrXdLiNY0TO76PEh4nFtQZ4rZANnTK3sMg4n0
	0kcFUELu+iOBR/5dlrwDZ8olDoj3JbX2FtYDQXjyIZQuySkxMn3lKlCS9dGWIipngjXPCMllGf2
	MbALLPUMZpcvAJuSyUzQAqAUWPMd3PK/HzM43aHfdIflf6ze+kgPZjVVJ67f0UjvSs7X1VKZwVN
	e12RKq9q68hVlV+P2J1ItOEn5qbSlAi+yzlb0JrSez5yrQkFaCaOxY
X-Received: by 2002:a17:903:2301:b0:2bf:27b2:4b80 with SMTP id d9443c01a7336-2c411f6dca1mr118507075ad.14.1781456274563;
        Sun, 14 Jun 2026 09:57:54 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e5590sm85284025ad.14.2026.06.14.09.57.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 09:57:54 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 16/22] media: platform: hantro_drv: Add missing media_entity_cleanup()
Date: Sun, 14 Jun 2026 22:25:53 +0530
Message-ID: <20260614165630.3896-17-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260614165630.3896-1-birenpandya@gmail.com>
References: <20260614165630.3896-1-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,collabora.com,pengutronix.de,lists.infradead.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64822-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:birenpandya@gmail.com,m:nicolas.dufresne@collabora.com,m:benjamin.gaignard@collabora.com,m:p.zabel@pengutronix.de,m:linux-rockchip@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D03306819FD

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/platform/verisilicon/hantro_drv.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 2e81877f640f..ad71c0402ef3 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -771,8 +771,10 @@ static int hantro_register_entity(struct media_device *mdev,
 		return ret;
 
 	ret = media_device_register_entity(mdev, entity);
-	if (ret)
+	if (ret) {
+		media_entity_cleanup(entity);
 		return ret;
+	}
 
 	return 0;
 }
@@ -860,12 +862,13 @@ static int hantro_attach_func(struct hantro_dev *vpu,
 
 err_rel_entity2:
 	media_device_unregister_entity(&func->sink);
-
+	media_entity_cleanup(&func->sink);
 err_rel_entity1:
 	media_device_unregister_entity(&func->proc);
-
+	media_entity_cleanup(&func->proc);
 err_rel_entity0:
 	media_device_unregister_entity(&func->vdev.entity);
+	media_entity_cleanup(&func->vdev.entity);
 	return ret;
 }
 
@@ -878,6 +881,9 @@ static void hantro_detach_func(struct hantro_func *func)
 	media_device_unregister_entity(&func->sink);
 	media_device_unregister_entity(&func->proc);
 	media_device_unregister_entity(&func->vdev.entity);
+	media_entity_cleanup(&func->sink);
+	media_entity_cleanup(&func->proc);
+	media_entity_cleanup(&func->vdev.entity);
 }
 
 static int hantro_add_func(struct hantro_dev *vpu, unsigned int funcid)
-- 
2.50.1 (Apple Git-155)


