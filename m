Return-Path: <linux-media+bounces-52875-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WAAGH7Ujk2kX1wEAu9opvQ
	(envelope-from <linux-media+bounces-52875-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 15:03:33 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A99D5144654
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 15:03:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A8A0E300D0CB
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 13:50:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4DAA3101A7;
	Mon, 16 Feb 2026 13:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J9qRCSz4"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394262FFDD5;
	Mon, 16 Feb 2026 13:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771249802; cv=none; b=sCMHBKz9Cl5ozBzz0M9H9fSDIzWN2R6GS/0CFChECsucBIeWN8q5j9hO13wnHiea2gAo5UT7iHIft+4bUEJkA937ZoJGIq6ZNTlkR5kv+GnjtygNxDVdGjbuImSUa6e/8nWKrfNXP7hM1e8d9lToENKNhYdFNY4dbfybEYYsuKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771249802; c=relaxed/simple;
	bh=odlPpkS2jQgoxF9cQXI0l/s7n/aRhfbeIhr3VuRYmmc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dXal+g1CgKlTU3jQ1PpYPQWwIYD8INet8KSc+SMuiBDGRqo1+931Zhw3n8NqRyXxP5Ygs5tIpydPgXocIoXORbBS/YxbQnZY8zLMZIDzdFxzOP/vLbZHKN6YyAvvF5EWf/VFH0PIQISEtPIT+GJiLuS16gCs9HQ3Pml0SVp5MMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J9qRCSz4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C7BE7C19424;
	Mon, 16 Feb 2026 13:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771249801;
	bh=odlPpkS2jQgoxF9cQXI0l/s7n/aRhfbeIhr3VuRYmmc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=J9qRCSz4uO2xiAhR/e/LC++r6btAJ/GBrLgfa+E9BNwZPjcywBWR/XqBlogAtXuw/
	 3gXWMQ+KFXW93dmBJlzB6fxfGctorSSLxeZF32SAdW2V/Dx4FIeEuRFsygh3tsl2EB
	 pbFAziaPvoglYvnzjdrVOSjkjHeczCMHjCmEkR5YWaVps0P2nbihJPTCV7/tdjxpqb
	 f7Rqz/jphWJp3kqVC0K44atopq/CjevPsrIfu7yFFAlZms3LtdY984hz7H7ryJQlym
	 3tF70XFzq6XHnTzEnz3BZPbt9vW1PgQvzoBul2ntlbvRO3xyg7By/a8yHtchq21YAK
	 R+BB/taTCPsTw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6636E81A20;
	Mon, 16 Feb 2026 13:50:01 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Mon, 16 Feb 2026 14:49:56 +0100
Subject: [PATCH 1/2] media: rockchip: rkcif: fix off by one bugs
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-rkcif-fixes-v1-1-b16db20b6d68@collabora.com>
References: <20260216-rkcif-fixes-v1-0-b16db20b6d68@collabora.com>
In-Reply-To: <20260216-rkcif-fixes-v1-0-b16db20b6d68@collabora.com>
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
 Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771249800; l=1959;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=hY5NYgV0NqG8C6Dk+MwlRTr+tzjGBXH7fs5QS8NeCBo=;
 b=O2PDUNh9qz7Tr144sCMVHBrtQKPzSzKCM+j/1klR0rZDDnXk4sW8oYnutrggcT354PmwoFrI2
 OcXHPtwhNzcBMJ02N1uRkSzwENvfX7zr7kdXzcujXwuCHgXHgmiD65Z
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52875-lists,linux-media=lfdr.de,michael.riesch.collabora.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[michael.riesch@collabora.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,collabora.com:mid,collabora.com:email,collabora.com:replyto,linaro.org:email]
X-Rspamd-Queue-Id: A99D5144654
X-Rspamd-Action: no action

From: Dan Carpenter <dan.carpenter@linaro.org>

Change these comparisons from > vs >= to avoid accessing one element
beyond the end of the arrays.

Fixes: 1f2353f5a1af ("media: rockchip: rkcif: add support for rk3568 vicap mipi capture")
Cc: stable@kernel.org
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
index 1b81bcc067ef..a933df682acc 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
@@ -489,8 +489,8 @@ static inline unsigned int rkcif_mipi_get_reg(struct rkcif_interface *interface,
 
 	block = interface->index - RKCIF_MIPI_BASE;
 
-	if (WARN_ON_ONCE(block > RKCIF_MIPI_MAX - RKCIF_MIPI_BASE) ||
-	    WARN_ON_ONCE(index > RKCIF_MIPI_REGISTER_MAX))
+	if (WARN_ON_ONCE(block >= RKCIF_MIPI_MAX - RKCIF_MIPI_BASE) ||
+	    WARN_ON_ONCE(index >= RKCIF_MIPI_REGISTER_MAX))
 		return RKCIF_REGISTER_NOTSUPPORTED;
 
 	offset = rkcif->match_data->mipi->blocks[block].offset;
@@ -510,9 +510,9 @@ static inline unsigned int rkcif_mipi_id_get_reg(struct rkcif_stream *stream,
 	block = stream->interface->index - RKCIF_MIPI_BASE;
 	id = stream->id;
 
-	if (WARN_ON_ONCE(block > RKCIF_MIPI_MAX - RKCIF_MIPI_BASE) ||
-	    WARN_ON_ONCE(id > RKCIF_ID_MAX) ||
-	    WARN_ON_ONCE(index > RKCIF_MIPI_ID_REGISTER_MAX))
+	if (WARN_ON_ONCE(block >= RKCIF_MIPI_MAX - RKCIF_MIPI_BASE) ||
+	    WARN_ON_ONCE(id >= RKCIF_ID_MAX) ||
+	    WARN_ON_ONCE(index >= RKCIF_MIPI_ID_REGISTER_MAX))
 		return RKCIF_REGISTER_NOTSUPPORTED;
 
 	offset = rkcif->match_data->mipi->blocks[block].offset;

-- 
2.39.5



