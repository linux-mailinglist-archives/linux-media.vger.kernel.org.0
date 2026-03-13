Return-Path: <linux-media+bounces-55648-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aArlDPjss2m4dQAAu9opvQ
	(envelope-from <linux-media+bounces-55648-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 11:54:48 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FAB281CC5
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 11:54:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C536326F628
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 10:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC1BE390227;
	Fri, 13 Mar 2026 10:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VXwA7Ev6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941A439021D;
	Fri, 13 Mar 2026 10:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773399048; cv=none; b=BU6/ia9IntFWvHk/8pc46QZoL0zIMVzc2YdS5sADooUTPTaAdPVZ7IGXKqOGolKBE66RnLMyKXV2ZYBMnbENtyv2ATuNzm9j1vVMgvV6kW8vnL7IcVmIHEpvQIIFaLkAJNNJqVe+dc+qdnr3ESTeUH5MFwxyQ7GaPP3SJeiDqLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773399048; c=relaxed/simple;
	bh=+NKU7t0m2c2xpIVekVO7e1owo4msUruBbbjKKcY701M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fz+5alVeWFKZJIDwylOhZZBBapGqujpjX95Pwc7cKW33akdZ+ZiI7JqdBAtqgztLPakbB/oaLR96AwdkEWYCVs/8vQDRNva/YGpfJ2EyH/GXPxjRWthbvDSr/VY7QbRGfWG2CYSFBxnd3fCm460dfF/7AB+do6JDVA6uFoIVpgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=VXwA7Ev6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.224.131] (unknown [91.80.67.247])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D72A2E70;
	Fri, 13 Mar 2026 11:49:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773398966;
	bh=+NKU7t0m2c2xpIVekVO7e1owo4msUruBbbjKKcY701M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VXwA7Ev6EGY5XZYkV2kk76TJiGs6JIWHqzTGe/nMKs5nclbH+AYa5NuebQy7kjNZQ
	 lwM0FgqkCbpyWrFH1Ybg7jdLIc2xZhDjzLWOxiX77KsG2MIPkuuqvxnBf4+zICyvXc
	 usq5nDz8ihpzZO1B6/cf8hgjOzu10PK17BnpwhUw=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Fri, 13 Mar 2026 11:49:41 +0100
Subject: [PATCH 4/6] media: mali-c55: Fix Iridix bypass macros
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-mali-c55-fixes-v7-0-v1-4-21805b2b516b@ideasonboard.com>
References: <20260313-mali-c55-fixes-v7-0-v1-0-21805b2b516b@ideasonboard.com>
In-Reply-To: <20260313-mali-c55-fixes-v7-0-v1-0-21805b2b516b@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1668;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=POjVQBq2yxjp6UpxE7vnIQ1SFmAa86qGgqFH/J9SS5k=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBps+vyZKcec8LIB+seOnzjzBRCcyK9pNMGaF+2w
 AG/vkUV5EeJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCabPr8gAKCRByNAaPFqFW
 PGhlEAC5OjgsKLMS2hFthaiXSbhQNuOvPzxtC2/EUiBJFk9ZjNtMTyG7qP7PzXQW6Vq5Kl2+b8s
 P7rV8dc+rFAZY9iIhaL9hGzTfoye8u+ePE43YLk5owmjM/dWP6G8YjO2urdhb03m2Crg/AFRt8d
 pjMckmXkmTvQKo1ir09IGNSLvME5U9akaKPcnaOHbwMCA2HaRHWYlf0BX5w6dfSdeD6Y9ABrQgv
 WjGKx2Ld2cNZ8wzW3ZKrhSZsnrIkrouSXsS1U/Ad2NkuP7461ezaPRLG9LUnhrf+o465CKOGMQR
 LGyVkUfcDygcg37CDjJjs9GAtAY1m9sBV/7w35mBXdTk2aKPeerYW6vC7VQbiJVX5shmjVlu4WV
 4ycLMBdx7bPMPwd5hj+Ej/PdnOectjvuDudSwZxwMGyuU3lB0uw5ZEmIXVX9IIBWIRkVPk71g6f
 v9s9Eczcw/IG8sONwy5E95SrK9Gxl8pn/DQ3MCqk/qNKvH75tj6N2LKVF6j+WYZMa9nSVISsQlL
 YV7DRWtza58bL763JIxCuwz4K4R9p5GQ6LcFrssn2nMb4oJIRT8YrcoGfJIxO2xZefUYRIAPfWx
 YzxLUVcSImYxji/dQfBlMvQU1PG2N1HcNG3IXxO35MWADW9xRnDrsUz+/LxdkH2P5T6H70ggT5Q
 aJJP3N7erqjBN8g==
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
	TAGGED_FROM(0.00)[bounces-55648-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Queue-Id: A4FAB281CC5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Daniel Scally <dan.scally@ideasonboard.com>

The Mali C55 Iridix block has a digital gain function and tone mapping
function, whose enablement is controlled by two different bits
in the BYPASS_3 register.

Unfortunately, the "Gain" and "Tonemap" bypass bit definitions are the
wrong way around. Swap them so that the ISP is now operated with the
"Iridix Gain" block enabled and default configured at a x1.0 gain and
with the "Iridix Tonemap" disabled, as it was originally intended.

Cc: stable@vger.kernel.org
Fixes: 8ec187829a4c ("media: mali-c55: Fix Iridix bypass macros")
Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
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


