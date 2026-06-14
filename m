Return-Path: <linux-media+bounces-64789-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zUFNIN2oLmqr1gQAu9opvQ
	(envelope-from <linux-media+bounces-64789-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 15:13:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2EC6811B7
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 15:13:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=FrI6Yq4C;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64789-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64789-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8DB5830252B7
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 13:10:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAD713A6B92;
	Sun, 14 Jun 2026 13:10:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158D53A4508
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 13:10:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781442614; cv=none; b=KFhfdlwxQw0fCqTjFzZ//xQhFnkMGSukZWYjMMpECy6Vau/an/xVkIdz0bx+g+BC6F+F383uUZfop/AGTpjkmCGofTuW82MatmR69q1sm9CsqocAr2CbKrxQG6ATENPIs7kZ4VdfxvHRb/P9COTyYXiji9CxU1ojZn0NInQv5HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781442614; c=relaxed/simple;
	bh=3bfgMusxiRGeo2i6HGXgtHLR7Felcs11Fme4aBVT0rQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=My8+PYlubPvznLOVR8vLir4TTWpHb03DKQkhZBz/vZpnjHukg8NdvSgrTtJc+RJQQfpApi+jASSlpKDM9kGrFR4FvsVisav6BcugJpSYrRFkYgSikfy4G60p23nUbR5LVuLrskhZXKSi2edzGBWWoGSryrLVeCQhyG+3xM9gX7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FrI6Yq4C; arc=none smtp.client-ip=209.85.222.176
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-915671abde5so289564485a.3
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 06:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781442612; x=1782047412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5zfgey8wi8pckGyHiNYDJA2CHFfMtkrqEl07FMub/Hg=;
        b=FrI6Yq4CswqXVH/IewhlGZeoqewtGDIIao1GWVrPrpNPqaFCmZ5qcm/leEf3VqR4Pu
         ZtkkfDvd0pLhqMrr0wuUSE8KVUmjdyRJn0Urs61x4bMRHAoVpSYEAc2lnWCPEFx8KECX
         plMUmFrhma7HrTAiDXupoLgNsIkrVRNmt4O2qK2bF/pyaBBgQSChYVDLKYKW+oNbWVHm
         rSnucXIQITpBlrYdnNGfbLwAef+UpG1zLMNP28Q+GshyeRYN1qnN04D0SzoAsd7EhnPS
         NjgXQ5ScdbnlkMc5OOB1rTypnNIXVojumFMvrDM0xM8jmMlWmqhWCZWsfrjY7ADu+i2q
         mJIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781442612; x=1782047412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5zfgey8wi8pckGyHiNYDJA2CHFfMtkrqEl07FMub/Hg=;
        b=bqg8nTyQgFb5LdJzfIlasfTFHCOm2eucmIV6C9r8Sbj8ZPF/EIpL4zAt4fdTbAjMgl
         y/iailtA3SxGan2IzZy5v1EZlHi7BXx04H3zPvedfkATeoY1bdTbt9CpkmeN2ddkfXSS
         kxkpKns37X6QYyQc2Ud2/0HZ+W8Ad8t+TnN+INdqqUq3eybLeBt11eejR2KNMAi1xEY/
         zvKOc3gndBsvDyilVCXdk+zJISy7ph9Oa2co8q61p+zIlf7H5M5sAwRU2r3go2M/SeBn
         734CuG+9BUaIiMRKS935FtvwIFv8l2+TAiRerZR5JykCuKnCAp9+Scm5/S44cnZPNHP2
         egEw==
X-Forwarded-Encrypted: i=1; AFNElJ9ovACBsxd0cWfpxQKjMg7QYrwnYiE/VD8pDinzgSf9UUalZ7pmOdsoYMBAr9tvJhIrb0wVAS+a00abqA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRL+5sNAevs2n0v+nw1AfbQRmSS4OOT1snaiUOwq5lY2wUUMX5
	tDcxoXMu7QZrF1Zw7VZ/OpCns115QZG8piE/X9A5JGUbxIWHCPZcxPXV
X-Gm-Gg: Acq92OHWqmq5zlnJ0+3XR6Vr+HM0p2yk7lvKx5jCUCzDyyDpQ+ZgI5hWQPmTq/SQVia
	Y6vZ4u/NyZrdQm1JXjpzCiYsx05KUq6wpucl6f2lKKt4Mt5juJLSzqyC0MDytSdfd8fKA4ATqiy
	Iwe1gHLHBIkJxgfY6/tuPvA6eeUUYGJpC3W5XPM5DLO0ChTsEYX2IIlcySHYbN6NC2ZwbzolQYY
	wN/9Of3/qCqyFWH/8UyOAveq4wdxpOH0n1hxUYXOZhrj9YOG9XcCoiGh6GYs3CwzGARKjrIfgp0
	yUXmzv7uuWwSZqVS5+d8Q1c0folsjwyPQKgcieNWXdYV8RCV6kdM4zIrB9qJv1DzXFoP3kbUrR2
	OLpTuPW6ymELlgCJKMKUZQk5eJd9MiGGM7CZv7RL3lRuOxLxw75bNDcYxdXjM42G6kqVBDwrYOo
	3/Fs5LnkoZ63SemrOQbhN4ICYSiRr8CnzPL44HesUSZ6UiD+RFJl9ck6KZKDvqIDCklwmLd7HeJ
	9yNuFF2gUGqNfddLy4C8EEBtlRahTV3h1wgt/6Y72U=
X-Received: by 2002:a05:620a:2590:b0:915:aa7d:42bc with SMTP id af79cd13be357-917eefc36aemr1143196185a.10.1781442611978;
        Sun, 14 Jun 2026 06:10:11 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-91619f1b400sm752878985a.15.2026.06.14.06.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 06:10:11 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Heiko Stuebner <heiko@sntech.de>,
	Kees Cook <kees@kernel.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] media: verisilicon: hantro: bound G2 HEVC tile loop to the buffer capacity
Date: Sun, 14 Jun 2026 09:10:00 -0400
Message-ID: <20260614131003.2524025-4-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614131003.2524025-1-michael.bommarito@gmail.com>
References: <20260614131003.2524025-1-michael.bommarito@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64789-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:hverkuil@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:nicolas.dufresne@collabora.com,m:sebastian.fricke@collabora.com,m:laurent.pinchart@ideasonboard.com,m:benjamin.gaignard@collabora.com,m:detlev.casanova@collabora.com,m:ezequiel@vanguardiasur.com.ar,m:yunfei.dong@mediatek.com,m:jonas@kwiboo.se,m:heiko@sntech.de,m:kees@kernel.org,m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[michaelbommarito@gmail.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michaelbommarito@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DB2EC6811B7

prepare_tile_info_buffer() writes one entry per tile into the tile_sizes
DMA buffer, sized for a grid equal to the PPS uAPI array capacity. Bound
the loop to that capacity so the writes stay inside the buffer.

Fixes: cb5dd5a0fa51 ("media: hantro: Introduce G2/HEVC decoder")
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
Assisted-by: Claude:claude-opus-4-8
---
This is an i.MX8M Hantro G2 SoC block not reachable on the x86 KUnit host,
so the driver-side out-of-bounds write is not reproduced here.

 drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c b/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
index e8c2e83..94fbd79 100644
--- a/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
+++ b/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
@@ -22,6 +22,12 @@ static void prepare_tile_info_buffer(struct hantro_ctx *ctx)
 	bool tiles_enabled, uniform_spacing;
 	u32 no_chroma = 0;
 
+	/* Bound the loops to the tile_sizes buffer capacity. */
+	num_tile_cols = min_t(unsigned int, num_tile_cols,
+			      ARRAY_SIZE(pps->column_width_minus1));
+	num_tile_rows = min_t(unsigned int, num_tile_rows,
+			      ARRAY_SIZE(pps->row_height_minus1));
+
 	tiles_enabled = !!(pps->flags & V4L2_HEVC_PPS_FLAG_TILES_ENABLED);
 	uniform_spacing = !!(pps->flags & V4L2_HEVC_PPS_FLAG_UNIFORM_SPACING);
 
-- 
2.53.0


