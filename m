Return-Path: <linux-media+bounces-55649-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HYxOTrss2mDdQAAu9opvQ
	(envelope-from <linux-media+bounces-55649-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 11:51:38 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1AF281C25
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 11:51:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 86BD1308513E
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 10:50:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F53837D13E;
	Fri, 13 Mar 2026 10:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IRihsh1J"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AAA73563FB;
	Fri, 13 Mar 2026 10:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773399049; cv=none; b=bcfQg8mC/w9yuDh7z1aI3iW3Y0uppxfWcofxCDw4Jw8NXw6WRQPnffuxZgN/ruhXrXcvGDjqLB4f9hgRvxbMArxRoQV+atrm5k1HLIiHJjqC4W30fpJtzMRbEG7b0/WslDHzFakLjdS5aAAsYt0zEr1bjOW7gPXoGYL6oj80Cjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773399049; c=relaxed/simple;
	bh=lrwSQ/eNX8gpc35hv6R8FV7RRXS5hR4Ghlea09Df8+E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D1ILU4qHidn8Par2r6ER4QI0m+Y9iyiRXTuV1CzpnObICh+RPT95x2dSoi+tarIiXnsol5GeEeTFo/4ZujId4C4AtsPPZGRIl38OrzLj6G+kPG2Ce8089OEPJUb8wmKH8I5jvM9SYV4sG7JaY8ZsRUH2+41vR8m20dR46OK3SMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IRihsh1J; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.224.131] (unknown [91.80.67.247])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7E6D6103D;
	Fri, 13 Mar 2026 11:49:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773398967;
	bh=lrwSQ/eNX8gpc35hv6R8FV7RRXS5hR4Ghlea09Df8+E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IRihsh1JsLfI3uHhUbwAoRQFH5KQr78paoXALH8cXU3zvA34H4kTWKdm87dWp/QyD
	 tZ8/OHfvMqbwO5SViIGIOHCV/SUTLD44cIgPTJw2m2soHVOkkpLIPvuSxMuy3Jetpn
	 xVBob9Hf1SH6lVsqIC9xZHBdbK6K7+8gruBzmQKE=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Fri, 13 Mar 2026 11:49:42 +0100
Subject: [PATCH 5/6] media: mali-c55: Bypass the Iridix Tonemap engine
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-mali-c55-fixes-v7-0-v1-5-21805b2b516b@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1374;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=lrwSQ/eNX8gpc35hv6R8FV7RRXS5hR4Ghlea09Df8+E=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBps+vyN4Z8CJ3oCs8bAicqyiMyvQA1SFVdbVbnP
 S7V/dl35VGJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCabPr8gAKCRByNAaPFqFW
 PHiKD/9tE4ixa5XlICgvdjf/Q4J6zRElmcqbNevENfw76opAjSfLvtZSSTFkZdRDeuAV2op/c4C
 KxEv9RC9PgW63KZb0NM3ArDFtH/3ZBqLxxlVQVtjDLd5E6yTYwjt7QW9UHqTez7scx4g2+Xi5TC
 UM1pinWaW/z+5U2bOben0goCvOPLYEb7+fNXokNLaYJkNkodqmWSYlmMMPHXrkNtmuQvYdCT2+6
 AFN/OJdlSzRb4mC7+f58vy5orgN/037vmSIosuoWkdMRixnzRjC90M+gHrW9clxm+KzL3BU+c5K
 uisPg1CYELQAcG3C/qIojDowkNBFfWU0mx1gfQKVp+IwG/qMi+fTkXS6z0gvShdAHRu/nWFMc/m
 4unWWXp9eX21xvcTmjShL3ldHtvDUukWht0ZlpL0NdXXpPyh9sVBnoZgDzOxNbW/Lu9h2+9mAaA
 aL2Q1UbQ14EIx+AOq4GFGPYb2Vruqvs07G7VO7jkCTFzen+VonoLMQYP3q9dKnRVJrSdNsFgnp4
 Hk7H08OBd/PS8nRgbjFmQmCjcElxm8rnMcmVajr87E9eRrLt/gepDFUdF7Eak4rCom8zURFNDQM
 ml90HM2PklSR/dDi8YvVzgTR0bE4B+WuVQlNE26kSnNAUkTyUQ5nFIdR3escW1NwMnB9afbmDnG
 wj+1VQLT/z9snug==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55649-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8F1AF281C25
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Iridix Tonemap engine, if not bypassed, applies a digital gain
in order to compensate under-exposed images.

This however breaks the exposure and gain regulation performed on the
sensor.

If the Iridix Tonemap has to be used, it need to be supported in the
ISP uAPI and properly configured by userspace.

As the driver doesn't support it at the moment, bypass it by default.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/arm/mali-c55/mali-c55-params.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
index 773e5b6a2b7e..b9fc904a3844 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-params.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
@@ -825,6 +825,11 @@ void mali_c55_params_init_isp_config(struct mali_c55 *mali_c55,
 	/* Disable the temper module's DMA read/write */
 	mali_c55_ctx_write(mali_c55, MALI_C55_REG_TEMPER_DMA_IO, 0x0);
 
+	/* Disable IRIDIX module. */
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_BYPASS_3,
+				 MALI_C55_REG_BYPASS_3_IRIDIX,
+				 MALI_C55_REG_BYPASS_3_IRIDIX);
+
 	/* Bypass the colour noise reduction  */
 	mali_c55_ctx_write(mali_c55, MALI_C55_REG_BYPASS_4,
 			   MALI_C55_REG_BYPASS_4_CNR);

-- 
2.53.0


