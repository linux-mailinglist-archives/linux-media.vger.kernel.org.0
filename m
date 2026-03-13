Return-Path: <linux-media+bounces-55702-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAC5EcwltGl7hwAAu9opvQ
	(envelope-from <linux-media+bounces-55702-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 15:57:16 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DE28628567D
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 15:57:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E62BB318F0D6
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 14:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E20C43B47F9;
	Fri, 13 Mar 2026 14:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="G5C1dj1c"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C703A6EF1;
	Fri, 13 Mar 2026 14:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773413658; cv=none; b=VT7dWWVIBuCoRatCEnZwbSZL8Wofl3l8nVdFU9FnK9ekbfCjn13MrmiZrjhzGXtFyZEmTcQdL11P734EadYMCA58G+0CODcY8yh7ohu4JPyvypk3Vac86ttD1fe09XhyHCjDDwspjAf0uT9+BTqhMcxmWpFew88uoZAWUPCScV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773413658; c=relaxed/simple;
	bh=XmLxcsUAKYkkjidcJqmK+cPfVsW3Ab7zChbDUSYi5/I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K3D9UnjdHhWKqUD5JQfBT4/3+OcNCfirNe5ttdifRj49PGij28RVR+C2tv/Vo8QcwBRt+kMfgb2tfxsH0z3xXBMCUQrgWxr8zTx2XZkMzjc5kQIOTM1WmvP7zKKmE9mpEo+Q4EYZk6rNaVx/sS04yTkqKwzvu0XfhnTy2oGVLCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=G5C1dj1c; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.224.131] (unknown [37.159.122.93])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C68AD1988;
	Fri, 13 Mar 2026 15:53:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773413584;
	bh=XmLxcsUAKYkkjidcJqmK+cPfVsW3Ab7zChbDUSYi5/I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=G5C1dj1ckaUOTHYu1RKBghzNKcxPOuDR9U3lfrH5Qt/SQy/t3NpbtdoMcfdE5hTx3
	 5qbVuko7+i2GJbDU5unlCWyptYAF6HgYQflSQ1Cjkml2pr/YsXJO61dZFw+KiN/s1T
	 T1pX9lgnE2Bc6H/Z1wwGGXmWOKifsJqahalE8hrg=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Fri, 13 Mar 2026 15:54:00 +0100
Subject: [PATCH v2 4/6] media: mali-c55: Fix Iridix bypass macros
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260313-mali-c55-fixes-v7-0-v2-4-885c07961f30@ideasonboard.com>
References: <20260313-mali-c55-fixes-v7-0-v2-0-885c07961f30@ideasonboard.com>
In-Reply-To: <20260313-mali-c55-fixes-v7-0-v2-0-885c07961f30@ideasonboard.com>
To: Anthony McGivern <anthony.mcgivern@arm.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Nayden Kanchev <Nayden.Kanchev@arm.com>, 
 Konstantin Babin <Konstantin.Babin@arm.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 =?utf-8?q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1553;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=4N8oWm2wYAkAH06Iaeu2AiHBgMRAhSGXVKI6cFa7GuA=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBptCUOVdeQQ45IWm9/p0X2/9jhqMA9KWPvvAiYn
 jZIHuvYUmqJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCabQlDgAKCRByNAaPFqFW
 PGboD/9Es04a1vkeV7z/5agU/dXgwV2OrwbEy1rnfLfFeJVUUSdd/vO9+gy5Fw9GPnxiSIIF8dq
 coBGouvOVzDyAQhWnvEeDi1xic45/t4zB6IKO/LqqTwJlidOFxA8eDamVAJHzZsV59K57Pytt07
 1xH32KyrtajQyBtEGlrcob1x+6m54W0y7ybV1IqqMoT2kH+OcPvELlWFPYgPTKKxBiL3sheZIRd
 M4cScFj3smoPd16oYZ2mD76W2KV2sjpDLZI6d9nt4VTBwYC9WvX0Pao7WzE9UaKIpsz8tkiJ8VV
 qc2myhffcFQvJREgfjQ3eZ1L8QjsowZH6jTmDV3uNB/IK94ipg4V5YcKPxcPNrB/EDGfVhed085
 UU7mCzLEPuGHngVP3k4Lq1xDTFh1RZNp9UgDg+w8G8l6yh7t4PSMA/6vmy3gA8mamBcfb/aIInT
 jCqNPuG9UeqP1LpVDwISbdLlf7VUmCTPoDBs0kkhnAEe0DVv9rxcr6enV1NUtWqYPOHyKy8D+SK
 11MEeFsRuVlqtgE0CbAfUc/CMASw6f4O3+wJjNDb3YEBh49Dyc5twIrdnV4oFFhQ/g3OO3YETxg
 nDqMIsxOBE8T+NwmvRm6cRLaeDi9f9CiuppghLe+Z2/+Kima5oLACGyZifzEcm3xoViOjACirbs
 RUraOm/EC2KAaOg==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55702-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DE28628567D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Daniel Scally <dan.scally@ideasonboard.com>

The Mali C55 Iridix block has a digital gain function and tone mapping
function, whose enablement is controlled by two different bits
in the BYPASS_3 register.

Unfortunately, the "Gain" and "Tonemap" bypass bit definitions are the
wrong way around. Swap them.

Cc: stable@vger.kernel.org
Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
Reviewed-by: Barnabás Pőcze <barnabas.pocze@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/arm/mali-c55/mali-c55-registers.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-registers.h b/drivers/media/platform/arm/mali-c55/mali-c55-registers.h
index f5a148add1c8..f098effde7b4 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-registers.h
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-registers.h
@@ -128,8 +128,8 @@ enum mali_c55_interrupts {
 #define MALI_C55_REG_BYPASS_3_SENSOR_OFFSET_PRE_SH	BIT(1)
 #define MALI_C55_REG_BYPASS_3_MESH_SHADING		BIT(3)
 #define MALI_C55_REG_BYPASS_3_WHITE_BALANCE		BIT(4)
-#define MALI_C55_REG_BYPASS_3_IRIDIX			BIT(5)
-#define MALI_C55_REG_BYPASS_3_IRIDIX_GAIN		BIT(6)
+#define MALI_C55_REG_BYPASS_3_IRIDIX_GAIN		BIT(5)
+#define MALI_C55_REG_BYPASS_3_IRIDIX			BIT(6)
 #define MALI_C55_REG_BYPASS_4				0x18ec0
 #define MALI_C55_REG_BYPASS_4_DEMOSAIC_RGB		BIT(1)
 #define MALI_C55_REG_BYPASS_4_PF_CORRECTION		BIT(3)

-- 
2.53.0


