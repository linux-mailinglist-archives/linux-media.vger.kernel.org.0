Return-Path: <linux-media+bounces-54008-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBCQNpdBpGkgbQUAu9opvQ
	(envelope-from <linux-media+bounces-54008-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 14:39:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4931CFFF4
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 14:39:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9CBC5301627B
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 13:39:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AF5532D7F1;
	Sun,  1 Mar 2026 13:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mFy0lI3e"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044F232AACB
	for <linux-media@vger.kernel.org>; Sun,  1 Mar 2026 13:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772372372; cv=none; b=j+4P8xgbb0P6g/m+U3eJQFJwxhW1EJqaaL53QlhRAwcJyFsb938YV4edxRsB+Qh3INOFL544stKEuSgxtN0WlYNlw2q1dG6tu4QxmWNhAOV7kGXDOEv7M2sI8YzgZlB91XagtWqs8+hDg9EZpyKvauWSDdjuq8KZb0KpUBEph74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772372372; c=relaxed/simple;
	bh=qvTfx76KlUm8ldBdn4DpsFUDxCVObx+MC6CAaoDM30w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Sxc6WDnBKK91Gx5h3ZXnsWO/Ruy0v0lTG9KA6LTzH4GTzM469ocMzbQe/kaPDp6n76Es/+d5RwgN3xMTQdQhF5Y1KZYT1mwDq2ZNraVMzo9TLRJ7dwHzKv7pOcIKIIMbme8nTihXMldp64NwKMvWr7RrBI/XILbFk8i4hplIawA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mFy0lI3e; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2aaf43014d0so28687335ad.2
        for <linux-media@vger.kernel.org>; Sun, 01 Mar 2026 05:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772372370; x=1772977170; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+Eg1r2EOYc/DtkNCJftZdyjm9sOOP8ZPXYeDO2tNZyo=;
        b=mFy0lI3eUEPGMFQi1M41zkpWeIB5HaxdMQ/M3eoNtjWBEcLYILl3C/piTWVjwNyUBq
         CBnjQ3Twqze+TM7aStBqT4uuW39j6i42iQ8hhVnSm616NBg2w1oe88vVwxv1Ra12BRUW
         GV45CgcLYcttteCR5wkR14uv87sXDqlLgj+THS4lJn1FoR58g12O2koqdw6sjiuBT/Ol
         XlACeuyOCBbDnnMaD699YhtA3+MT637J+bPyb+2Cg1hzyhVe52RfvMiEm4kJyZxaQ0dd
         MSsx2T7KeQdpsMwA8t1gPvWE6OZLon1BIo/dpKyx3QG9bhX3k+urmWVNtEIIrxMSgeTz
         eAqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772372370; x=1772977170;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Eg1r2EOYc/DtkNCJftZdyjm9sOOP8ZPXYeDO2tNZyo=;
        b=nlKlAFHhc3cs5i4XiBsNiTrvZnmQTNm1SxPwlWMWfHaGUu0xD5x6GItMfVuBkHhfmT
         tsn1bjWdFA4Fe40se88CNmYWUa27gcmTr8WnbSG7aL74gDSI5D9UcyGgqarBkl4Fa+WM
         4nkPAgk3xDZBu9Z1ZWekQ2yAwK+dkuhaNDqnJXYQLX+0cRoXJL1yd4MrEFNtwRgD5bLh
         K+/cqm1GFNYRiuryKB17afIvgxAScrKLrE5+dShy1IzB81r4JawJ72Da2tJ3fC7xTEKC
         LOrqbjI2Q8+hJyxTeuxYsobvtNKIPbgRm9CrWRUf4BuwOz9QeDEABkZq6URodYTb/sGw
         MLTQ==
X-Gm-Message-State: AOJu0YyIgRxYF6pIRKojbIWeKWtUT2ZVblgk/omuaq8jVclPgEkCOgmF
	lmDQaSJCPpgkFBrRnoX4wY3rqXrhsyzl4NP4pnwiMZGBeAiUTTqyCliq
X-Gm-Gg: ATEYQzwJZz5uqXiBa4f0ZLX/Az5lfErIZbQ9CBopGT0YvvnQ2Kpqist6++oF7FaAzhf
	cGgwYTNA12IH67A19hlXiGdp2p15lDpud8QZuexdwyaliuSHYB3iL3H6S4hPw+YtpGBVZe1M89P
	JEADYAZ481QGNEYVNanAs4TxKnuaLwuJ4QmrnvmUh+ko6xgi+VUROWvBPvSRaCfD5QylHYY9F+Q
	y5o4qoOYEVoxUeMpX4V4+Ang6CpkqRTbW/mX78Wa1MQEsGy9hG/+X8PNQh/DOXVVcU6/LDMptFF
	Py/qDT1m0PkbX8EZ94ag8xj7JdMSqaM+tW0oufFYEoYZS2evd7r8l3LdjOajp0NFBVM2dGk3FTl
	6lmWRFXO14lVQA/M0XlY0cdJHzDtxUsYTC0mwiamdgJ3IjSzfoHsoUJhC/hDerSgQ4Ja8uZ5qXz
	ixq9npQysXzNbSI1J8wbPz/+rQXmWi4TqmOXxsjmQPGFPifjE=
X-Received: by 2002:a17:903:32c7:b0:295:745a:8016 with SMTP id d9443c01a7336-2ae2e3e720amr109441575ad.11.1772372370401;
        Sun, 01 Mar 2026 05:39:30 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9009:3f2:fcc8:844a:f21c:8d7f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae4d3113e0sm12715325ad.79.2026.03.01.05.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 05:39:30 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sun, 01 Mar 2026 21:39:25 +0800
Subject: [PATCH] media: ti: vpe: Add missing v4l2_device_unregister in
 vip_remove()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260301-vip-v1-1-d90572c2c55a@gmail.com>
X-B4-Tracking: v=1; b=H4sIAIxBpGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYwND3bLMAt1ks1RLYyMjY0sTE3MloMqCotS0zAqwKdGxtbUAbfVEy1U
 AAAA=
X-Change-ID: 20260301-vip-c6e932239447
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Benoit Parrot <bparrot@ti.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Dale Farnsworth <dale@farnsworth.org>, 
 Sukrut Bellary <sbellary@baylibre.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772372367; l=982;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=qvTfx76KlUm8ldBdn4DpsFUDxCVObx+MC6CAaoDM30w=;
 b=IiMQ5oD2LmKzkgzWijxx3vFGa9QvNVDem7L9PuDXGExWuY0Mi/cFo/vTIQL7jKGscANEc7N3V
 uZQ0XWuzgNvAC1PU5foyu/UgD3qq/DfKqZEbOxJc4tLWC2B2Y3tLAWT
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54008-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ustcgu@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5A4931CFFF4
X-Rspamd-Action: no action

The v4l2_device is registered during probe but was not being unregistered
during remove. Add the missing v4l2_device_unregister() call to properly
clean up resources.

Fixes: fc2873aa4a21 ("media: ti: vpe: Add the VIP driver")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/media/platform/ti/vpe/vip.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/ti/vpe/vip.c b/drivers/media/platform/ti/vpe/vip.c
index a4b616a5ece7..0e91e87bda9b 100644
--- a/drivers/media/platform/ti/vpe/vip.c
+++ b/drivers/media/platform/ti/vpe/vip.c
@@ -3641,6 +3641,7 @@ static void vip_remove(struct platform_device *pdev)
 	}
 
 	v4l2_ctrl_handler_free(&shared->ctrl_handler);
+	v4l2_device_unregister(&shared->v4l2_dev);
 
 	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);

---
base-commit: 3fa5e5702a82d259897bd7e209469bc06368bf31
change-id: 20260301-vip-c6e932239447

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


