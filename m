Return-Path: <linux-media+bounces-64802-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +siOJdTPLmrk3QQAu9opvQ
	(envelope-from <linux-media+bounces-64802-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 17:59:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D2B68175A
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 17:59:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="Co6EB/vi";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64802-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64802-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9E74B302616A
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 15:56:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B51D23C584B;
	Sun, 14 Jun 2026 15:56:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC9C3C8C52
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 15:56:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781452580; cv=none; b=i7J9zEWElkQpnRXDzyqhnRb6D9kj4uzCfyNKzc+qxeQlhEdZOMdEf8SVirSOoQtgDoaTd4rPez/tV7zjYn8ga5une+e9mLZi02bUfEtLM/UQ6fQHyP84dbPLMCW8DNbj8g0VGJUtRLqrjzbOcPiGRI2RBuX38rJoE+INzZVXNMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781452580; c=relaxed/simple;
	bh=hmHOAPhRLoMfAfFhPoMmt5S6UD7EEY8vWV+vVjYiIbc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NWP6GVdUOwGn0AU61gApIsDrJd+BkpT5NnyxIEkJtBzjpVrFj6I8b3wSBSwSSl6oC2PYWLeajxqTMX41Q7Bs9ahh9H2uljV4ieMeL/el67nn5qZ1WYddWNiJUckuYYVGgbLDjUPHAIYO1CPqMXskaHyCZE48B7wdGYcOEF3fc6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Co6EB/vi; arc=none smtp.client-ip=209.85.219.53
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8ce9df48e1bso30427256d6.1
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 08:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781452578; x=1782057378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T/sfSCxlJV21DnAv9Ka6YHdwihRoTK4jXXXiCxaH1uE=;
        b=Co6EB/viR2RZM6d9XVPJ1fUhm5NO0Ega/tMX26VO9fYj4JQz2JUCITegH1dYR+L/Mg
         YVTZpmbU7NygNh/nk2FpnlATW0QGPSn9mWS2DG6xqyHQodU7TRWJwzOStw7dor1SN67e
         pUiTxI16vyCCuH8+OXc1xKkPsZZrnxtEeIy0oiz79YkZ4Gr4iwg7D1vbgRl88o7UZCKm
         NJuXsW47di0neOr2rWUzBNptZyvMasQYyIC9S5vRCaLALn1ENTcIxu+AzcGUa2XdnVxV
         RiwwfVGhxHnzkkFjYJfPivM2ew1Q2UFs6n5lNck7hR30LeyyGBaCPIva9tIT1tq0h4xd
         wrLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781452578; x=1782057378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T/sfSCxlJV21DnAv9Ka6YHdwihRoTK4jXXXiCxaH1uE=;
        b=NzxWAje+uzpE40T3fvmH6AwPMSbdI7+l8MEtGjSeof5wYuLlW6bkuI6UDWGrEli3qD
         EkybC/WQ/BqkTXzakhTQKxv2aVun67ckQqdO/Ka/WltgCylbRcH2KdgF28xYXsFf5VtI
         /IMp4OtTHDbkGd5bacHwD09vt4BAAH8o4CkMM04Pvt1BNndQ5W9FilWc3AqP/LciAZp3
         Hj8snRtY/1738oEAfOt5SBpOl4arjEwHBuk4kmKDRDhOcYVNI/y5tmnL/Mlxa52kfgOy
         eBqVL5xsL4FX0UdFGiQSV769cWA1hZ93y6wDWBXRUvapI2iH6XNZEKTB+pITHmMT2Nkh
         eKSQ==
X-Forwarded-Encrypted: i=1; AFNElJ9dmju/d17ouQMs/Hty3yRdiUdPP/j7KYUvpNMyIjWQvPMQ4leBB4LnKQLXtJl5vVbOHnp8wt1JPr+ATQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyya62AN+l3xF8LKnJDnApxHSw93F6W20GA1lBQ2Ll05SdB+DrH
	46dS3XNghEn+K17r4voTrQ55qmBCXJwbLT/lpMBBAtMkorbxCkNtI7fTBSN8Q8PDVNg=
X-Gm-Gg: Acq92OFkaT59+T4JpQFbir7OByBl4RmzMAZ2aYXFOl5qGankLV98YdGdGmsCNn6TXoE
	Zy9LHqBRblOCO9k9GOxA6BWKHEvgXnwwLrBkId0cqNFq7KCiD4GaDXRe2YeHIJUqvOk+9RGzJTb
	sVryhQrzIv1XnPSo7nvaMF53+GS4SgNm3VADEPnttYHEJGyGizY0oUGbiaCO6eJ6KrZcrr13HuZ
	DdceoK/UNUUqsKPcpKryrUhkDnRazgFuojgJiK8bVhQbpJo0LQgXWX5LhwClZz3xQFCJV2Ajn0W
	5F2htuMTx62d3mRZi0M2o17Pvo8CjK2MQhKVzLv5tzcbqUFMcRA57p0ENAKWAsXiysuDw3Fy4Zo
	twPQntwv7NLz1ZTdwQVKDUEKkDjhP2B0v62R5oiqo8wCWfa6HGBoqhDMKV4kjNkPke7ambXlVKR
	uuGhDjQ2m1tBQufxGNdAZJUEC1cVGc7VPEL4u8MDv3wkATXI42IMSw1R4IJtZjy5MyRX8vYUmjT
	XNzZivAXclB/tF9M6dCIoJHSLs2zlc4W0O6r22/tIc=
X-Received: by 2002:ad4:5dc2:0:b0:8ce:d302:f069 with SMTP id 6a1803df08f44-8d32b47b28emr185934816d6.3.1781452577762;
        Sun, 14 Jun 2026 08:56:17 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d30522cbeasm82008446d6.44.2026.06.14.08.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 08:56:17 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
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
Subject: [PATCH v2 3/6] media: verisilicon: hantro: bound G2 HEVC tile loop to the buffer capacity
Date: Sun, 14 Jun 2026 11:56:05 -0400
Message-ID: <20260614155609.3107600-4-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614155609.3107600-1-michael.bommarito@gmail.com>
References: <20260614155609.3107600-1-michael.bommarito@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64802-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:hverkuil@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:nicolas.dufresne@collabora.com,m:laurent.pinchart@ideasonboard.com,m:benjamin.gaignard@collabora.com,m:detlev.casanova@collabora.com,m:ezequiel@vanguardiasur.com.ar,m:yunfei.dong@mediatek.com,m:jonas@kwiboo.se,m:heiko@sntech.de,m:kees@kernel.org,m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[michaelbommarito@gmail.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: E6D2B68175A

prepare_tile_info_buffer() writes one entry per tile into the tile_sizes
DMA buffer, sized for a grid equal to the PPS uAPI array capacity. Bound
the loop to that capacity so the writes stay inside the buffer.

Fixes: cb5dd5a0fa51 ("media: hantro: Introduce G2/HEVC decoder")
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
Assisted-by: Claude:claude-opus-4-8
---
 drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c b/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
index e8c2e83379def..94fbd79885aa5 100644
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


