Return-Path: <linux-media+bounces-55650-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFgGKjTts2m4dQAAu9opvQ
	(envelope-from <linux-media+bounces-55650-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 11:55:48 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EAF281CDD
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 11:55:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 16FDB328678B
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 10:50:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 305A938A713;
	Fri, 13 Mar 2026 10:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VdkwrTlC"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1E135A391;
	Fri, 13 Mar 2026 10:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773399055; cv=none; b=WFAemMbG1M94S+Gfbvaeut6pCIIXRV3a7kpVBP7+BzKhmhzEpk+qYVCDKSBoG9eGjGkmOmB70Rjf/AReIhsk3kuGZf8dJDvCY4w97XAD9G4HSemP7zlYJbdk4EeIlJ/a7W5JsnatITt75DVN2RlR7oJ2sUWQp6q7DzNMxjA5o+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773399055; c=relaxed/simple;
	bh=jQ3u4c92YwoGknjkcyUxsR1TvGEIvsxuKIwRbXYv5dk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SwQe6GOlgvbiGp0JY5pPv2fUHb4dZ94Qc9elhhyiQTcoGtp9iorT3J3T/6vFtf3gKnX3ou9CQ1TXO5SjTx5RF4jEml6H+AmM6NJZHv7M/w7CcFHmZlDwOmPVI5R3gY1qOFb7xLcS1nHXnyLuFF+edYLg5Qg5a5Np8ZFdAMRzQBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=VdkwrTlC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.224.131] (unknown [91.80.67.247])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 587201356;
	Fri, 13 Mar 2026 11:49:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773398969;
	bh=jQ3u4c92YwoGknjkcyUxsR1TvGEIvsxuKIwRbXYv5dk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VdkwrTlC33IAycjMyr4nTpQKwkQibfzTtTApTfsPMdLJ9xEyupdzV58QGvZdcZqUG
	 rcPA/lRmz/2etj9pmDFaHDQkLOpPfOMuznG74RDNaK6mJ9T0GwBu3Xy8MPlWxU/bFR
	 32G5hpCReBXuocRR6UVnlJhHV0yYOBiDqWX30Od4=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Fri, 13 Mar 2026 11:49:43 +0100
Subject: [PATCH 6/6] media: mali-c55: Bypass Purple Fringe Correction
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-mali-c55-fixes-v7-0-v1-6-21805b2b516b@ideasonboard.com>
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
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1404;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=jQ3u4c92YwoGknjkcyUxsR1TvGEIvsxuKIwRbXYv5dk=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBps+vyfZC+99D3J4dk+sAp1QJRuLr3U1gRZ9crY
 TN+6YMAstyJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCabPr8gAKCRByNAaPFqFW
 PK7eEACS2UmNeiRh1oIf2dBcnFc0i4Ee5Niy3Lfox3KGTH8elFr3Bx4wqXxhYgtIVzyZJrCnPjW
 8ltd0LzJfYYWS0fku/uNWUv3YtFU7W1YThXKDQ+ngxHgRu3fNsNclz1KnVkcC8dj9LWq9fD3IYv
 sH88zOCi/JLfaotOwbJZApf9PFI/44FV1zayBdp9ivDmBJhnmO6Z+P8ilUp1PzDd5kIH8aFqi+m
 Xg1PD9umfhteaO5h/YuKsJl3IYnBs0TAlwAXvpuD4ff8NxwThVUqBkIHZRXlfd47xVaC30wvbtK
 OUh6F/6pzsb6cJC7HWBCMZpyaQm1fMmy50jqTA22IMYkO8matQ430rBgqG4e47EUaf2jaLAuFbr
 3HTr3EmWw5YhyJ0CdSCEgicoop0ASFU9SQ/8DZt+0KUCyn/mqp3SBCdTMD7dEuiF/BYWg4uGlNi
 Psu829QeZ5L5gauJhMoZldxLA3yNFWVjA4u9eiZbM9mB5VGqup0fh1ZUFJb/VFVl4Npfp3aYspu
 jcfgnZuh+a2R03qTfLAK/+DZJfMVIRZu0llavVo55RGwYn24GzuCpx7OaTYFpeIEEPyQLpk7uWe
 KXWFRivIVrUhtT1kQzC935TiHCW22QrlRiZ9ZUJXc0FLmj8BvwUUANppa5i0Em1Jbe6gd2zNo5Q
 2C+IDKO6BqoyH8Q==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55650-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Queue-Id: 30EAF281CDD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Purple Fringe Correction module is enable by default with a POR
configuration which might not be correct for the lens/sensor combination
in use.

If the Purple Fringe Correction module has to be used, it needs to be
supported in the driver's uAPI and properly configured by userspace.

As the driver doesn't support it at the moment, bypass it by default.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/arm/mali-c55/mali-c55-params.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
index b9fc904a3844..de0e9d898db7 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-params.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
@@ -830,9 +830,10 @@ void mali_c55_params_init_isp_config(struct mali_c55 *mali_c55,
 				 MALI_C55_REG_BYPASS_3_IRIDIX,
 				 MALI_C55_REG_BYPASS_3_IRIDIX);
 
-	/* Bypass the colour noise reduction  */
+	/* Bypass the colour noise reduction and the PF modules  */
 	mali_c55_ctx_write(mali_c55, MALI_C55_REG_BYPASS_4,
-			   MALI_C55_REG_BYPASS_4_CNR);
+			   MALI_C55_REG_BYPASS_4_CNR |
+			   MALI_C55_REG_BYPASS_4_PF_CORRECTION);
 
 	/* Disable the sinter module */
 	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_SINTER_CONFIG,

-- 
2.53.0


