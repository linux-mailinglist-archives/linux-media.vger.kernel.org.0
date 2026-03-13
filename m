Return-Path: <linux-media+bounces-55645-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGgHAorss2mDdQAAu9opvQ
	(envelope-from <linux-media+bounces-55645-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 11:52:58 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8A8281C51
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 11:52:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB53A3204599
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 10:50:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 050C039022F;
	Fri, 13 Mar 2026 10:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GuLRxbYk"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5E41F131A;
	Fri, 13 Mar 2026 10:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773399033; cv=none; b=RyKpzhw5VtBHQdZOFtW88qlBpJ3W8+36GXfxl6nL/jzle7XXthB2b3621EequfIwRZpqs/gyTQ1F5eTZ0a/LEpyHdL2eYpeFYnknbJSKsYF+8fx4PRVDXdbOS26MTPBJAUhq/SmxqQzgaZp4ZIlVe74831PC4HM7+N46VjXTp2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773399033; c=relaxed/simple;
	bh=A27gmqqqTjMmGh17VIJ1fTSY2+1aF1uz7uwgexKRpUI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QJyY8UcTDjZFRl2wMUwr4XmPm/1x5rGalH38pWf03jNDIqV7sUrqsakyOPSw6xRSulnD7VTeT+FO4zL9SX3pT6kZXq2+YYsP/h/pkNnvx/Lf7HItY0KJ0xaimKXGqe4mrQgRmU1hhzcU8GgIvFnWHKyVzZKup7CDx4NQvl5QTy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GuLRxbYk; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.224.131] (unknown [91.80.67.247])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0B88C103D;
	Fri, 13 Mar 2026 11:49:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773398961;
	bh=A27gmqqqTjMmGh17VIJ1fTSY2+1aF1uz7uwgexKRpUI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GuLRxbYksfjnPclzoc98k4KClfUXPyFUXBU639a0bD3kdP3R+APxpXyiLQ8dL1KfV
	 WWb5Q9a9VP9sdyqpy+kHU6P4LCHzYJ/ikuFiVDiV0PeVeoSRN2RDYrDbNF3mydwjr0
	 XCdqP4Obpky8To2B2fwpL++d5bbsSVkcjagtIV6E=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Fri, 13 Mar 2026 11:49:38 +0100
Subject: [PATCH 1/6] media: mali-c55: Fix wrong comment of ISP block types
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-mali-c55-fixes-v7-0-v1-1-21805b2b516b@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1630;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=A27gmqqqTjMmGh17VIJ1fTSY2+1aF1uz7uwgexKRpUI=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBps+vxa/5g/kI1qaylZmci1Z8vVgAUEhzzn7nVs
 u0J5KfPRd6JAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCabPr8QAKCRByNAaPFqFW
 PO2WD/9DGsq5i7IX6IvkzIWXc60whY4zkws45xH9OTejFc9pPp4FfCFt96csvfxdeZUXDNFrQjP
 BZaHhYD23YoZU+ZWbvWtb8dp4pangho9ggV7sQyi0kfQO9QWsFBZyI26v09M253Mze3qmg0koq3
 dZD2N/IOlJ0vOPQrQ2ptCqlXdj6+NoKPqdb3pSNETcE0jNMtXOKYYqeO1ZZPHP5WCmQwyjrM8R4
 0TWhKm+U9W3s89Cl9s86jJFS5pNoE986ScSWvQH3QF+Laz2NUT5HTo46fgGdphd5r+xm1CJQidi
 R30v5GP/ZAItJk44RrLHU7LPuHMbXrrKu/DCgWXlJbwpADD+qoTFggaALkosIKcA3OEFB+lj9F3
 aunNy1/gAp8496MPQWOf+BD711GfN9JjLA3/30cS/HFQcAIqpe6kknNej0CtjpoetZ14m9uSLyt
 5qyahyfagKghD1HM2ajtVv5N9JbbUFYu2jGMqErEM3OHFcllP5XumfpueRJkhbK3rH53bl7qQLV
 DjVIQrAFFSjuEdjrQbsW0QRlD3wEMDvRJnen8/jPtw0Wo94fxFmmpARIB2Mz8jA94YNVp7CihoU
 B0jw+jhtBNMIlcvY5Up0kC/jmRx0KdIsGZ//CU+D38I1Z0gyX1/DSOx98Z1gv/wg3MjWH/X3ep6
 uJacSYKh/8PgWDQ==
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
	TAGGED_FROM(0.00)[bounces-55645-lists,linux-media=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Queue-Id: 5C8A8281C51
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Some bad copy&paste happened in the description of the ISP block types
and AWB_CONFIG got mixed up with SHADING_CONFIG.

Fix it by assigning to each block the correct type.

As only the comment is changed, there is no uABI breakage or regression.

Cc: stable@vger.kernel.org
Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/arm/mali-c55/mali-c55-params.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
index be0e909bcf29..c03a6120ddbf 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-params.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
@@ -43,9 +43,9 @@
  * @digital_gain:	For header->type == MALI_C55_PARAM_BLOCK_DIGITAL_GAIN
  * @awb_gains:		For header->type == MALI_C55_PARAM_BLOCK_AWB_GAINS and
  *			header->type = MALI_C55_PARAM_BLOCK_AWB_GAINS_AEXP
- * @awb_config:		For header->type == MALI_C55_PARAM_MESH_SHADING_CONFIG
- * @shading_config:	For header->type == MALI_C55_PARAM_MESH_SHADING_SELECTION
- * @shading_selection:	For header->type == MALI_C55_PARAM_BLOCK_SENSOR_OFFS
+ * @awb_config:		For header->type == MALI_C55_PARAM_BLOCK_AWB_CONFIG
+ * @shading_config:	For header->type == MALI_C55_PARAM_MESH_SHADING_CONFIG
+ * @shading_selection:	For header->type == MALI_C55_PARAM_MESH_SHADING_SELECTION
  * @data:		Allows easy initialisation of a union variable with a
  *			pointer into a __u8 array.
  */

-- 
2.53.0


