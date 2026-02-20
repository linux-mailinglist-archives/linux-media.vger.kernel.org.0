Return-Path: <linux-media+bounces-53120-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oOWUEqcYmGki/wIAu9opvQ
	(envelope-from <linux-media+bounces-53120-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Feb 2026 09:17:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A2E16594F
	for <lists+linux-media@lfdr.de>; Fri, 20 Feb 2026 09:17:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE9F43046030
	for <lists+linux-media@lfdr.de>; Fri, 20 Feb 2026 08:15:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64A6E336EC3;
	Fri, 20 Feb 2026 08:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m7WmexyX"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC87C27C84E;
	Fri, 20 Feb 2026 08:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771575309; cv=none; b=FAP8EVwCEmrsy2yvU/8zhuUD8UmlbCN1eKckqNKWolbFPaIZD8ztOSJl+ExVDZXS8vihaHlyug5kfOJWn2RsAbpm2G7YPKi9eTgGmap8w+4LRyLtRI17y4xp+Dmf0tKyP7Xh/1Pi+zITv3OBt9rnJ1KJv1YoaiD5Dfk6Qx0DoOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771575309; c=relaxed/simple;
	bh=g/dKe7ealZ2Roz+w0mia01uKOCP+aV0TUZ6SoON1WvU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PSQGsF13CJvPuC+KxxOgYg62j89GQpZficTF1ig+1tt13CMP4ea6QXvuTFBdLjqbNlCZTGHapcLhnQCW/BL+oN1vMynscy28vqAH82Z/vIOLci8aJlaGR7EjgV7dLQRfyI7ymrBe7afcRGZWkBmgRqp92aKAgZ/T+pPPrjLubiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m7WmexyX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 71332C19424;
	Fri, 20 Feb 2026 08:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771575309;
	bh=g/dKe7ealZ2Roz+w0mia01uKOCP+aV0TUZ6SoON1WvU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=m7WmexyXFUpR564zdYVzl0jpUfbGWki2B868oYV9SvP2w1U978QnEU+GW/KUkUFYZ
	 prX5H9PAGydDhOh4KN1gPMr2PqzkZkVAQMj9UI4X8bfBc7aeMWIoiwdgEa04Wrc0l/
	 yNuH6GewHmQviG/dBWIgjvPYDLXtRft6D50lWpw715FYHiSYeVE9mmd1SBVUGMqfKT
	 H7aZ6biFyUAkgLcPMwP1rpQNTOiFxSZvMeLgshLqOB/UbQOVLT2Zjd58HatB8FNYfJ
	 XilNxGFXx446icJCucRLLpWX8LPiFVX8d37QjNTDi/k023SdGPplo65P9bgf0DJaQa
	 vCcQMYv6sIb6Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CE4EC54FD4;
	Fri, 20 Feb 2026 08:15:09 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Fri, 20 Feb 2026 09:15:07 +0100
Subject: [PATCH v2 1/2] media: rockchip: rkcif: fix off by one bugs
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-rkcif-fixes-v2-1-ee40931fe0ff@collabora.com>
References: <20260216-rkcif-fixes-v2-0-ee40931fe0ff@collabora.com>
In-Reply-To: <20260216-rkcif-fixes-v2-0-ee40931fe0ff@collabora.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, 
 Paul Elder <paul.elder@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Collabora Kernel Team <kernel@collabora.com>, stable@kernel.org, 
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Chen-Yu Tsai <wens@kernel.org>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771575308; l=2303;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=+CTMmqq/FBf0OUNoxM2h1AJhLJnTaBpUVbDN8g6FJXc=;
 b=jkqMSDUDANKBRHHyuTdC4NY7nDzfs9Wzk6LdU8E0ORJ+OVHx360FP8JRfy5VTJk4vVrWWJ7MQ
 HVgUvXIym14CwVEQA2gWZ/Cq0XPnkiR8U22M7NCl4m2YbgLdCjOcg6X
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53120-lists,linux-media=lfdr.de,michael.riesch.collabora.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	HAS_REPLYTO(0.00)[michael.riesch@collabora.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:mid,collabora.com:email,collabora.com:replyto,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: 97A2E16594F
X-Rspamd-Action: no action

From: Dan Carpenter <dan.carpenter@linaro.org>

Change these comparisons from > vs >= to avoid accessing one element
beyond the end of the arrays.
While at it, use ARRAY_SIZE instead of the _MAX enum values.

Fixes: 1f2353f5a1af ("media: rockchip: rkcif: add support for rk3568 vicap mipi capture")
Cc: stable@kernel.org
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Tested-by: Chen-Yu Tsai <wens@kernel.org>
[fix cosmetic issues]
Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
index 1b81bcc067ef..9e67160a16e4 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
@@ -489,8 +489,8 @@ static inline unsigned int rkcif_mipi_get_reg(struct rkcif_interface *interface,
 
 	block = interface->index - RKCIF_MIPI_BASE;
 
-	if (WARN_ON_ONCE(block > RKCIF_MIPI_MAX - RKCIF_MIPI_BASE) ||
-	    WARN_ON_ONCE(index > RKCIF_MIPI_REGISTER_MAX))
+	if (WARN_ON_ONCE(block >= ARRAY_SIZE(rkcif->match_data->mipi->blocks)) ||
+	    WARN_ON_ONCE(index >= ARRAY_SIZE(rkcif->match_data->mipi->regs)))
 		return RKCIF_REGISTER_NOTSUPPORTED;
 
 	offset = rkcif->match_data->mipi->blocks[block].offset;
@@ -510,9 +510,9 @@ static inline unsigned int rkcif_mipi_id_get_reg(struct rkcif_stream *stream,
 	block = stream->interface->index - RKCIF_MIPI_BASE;
 	id = stream->id;
 
-	if (WARN_ON_ONCE(block > RKCIF_MIPI_MAX - RKCIF_MIPI_BASE) ||
-	    WARN_ON_ONCE(id > RKCIF_ID_MAX) ||
-	    WARN_ON_ONCE(index > RKCIF_MIPI_ID_REGISTER_MAX))
+	if (WARN_ON_ONCE(block >= ARRAY_SIZE(rkcif->match_data->mipi->blocks)) ||
+	    WARN_ON_ONCE(id >= ARRAY_SIZE(rkcif->match_data->mipi->regs_id)) ||
+	    WARN_ON_ONCE(index >= ARRAY_SIZE(rkcif->match_data->mipi->regs_id[id])))
 		return RKCIF_REGISTER_NOTSUPPORTED;
 
 	offset = rkcif->match_data->mipi->blocks[block].offset;

-- 
2.39.5



