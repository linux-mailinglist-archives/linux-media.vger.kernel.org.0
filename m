Return-Path: <linux-media+bounces-64800-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4dHcHHjPLmqx3QQAu9opvQ
	(envelope-from <linux-media+bounces-64800-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 17:57:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB48E681740
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 17:57:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=a2gWyOHZ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64800-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64800-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9391C300D872
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 15:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EB593C81B4;
	Sun, 14 Jun 2026 15:56:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98ABF390C84
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 15:56:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781452576; cv=none; b=oyo6dd5QMnAz82qIfzLgrc+lLUpmpEUeOtM0iZWRAeteYPle8q8+5OGr2YHZxHQjH4zfLaxyuiz+eCfwav0LfdDGpxcBiHr6rMS31CDBsjIolpXJOE8Ed3sdijI9xnCQRrC9GYbsVKxNkSix05N854MGQyADUGTsmt+2tvSFegM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781452576; c=relaxed/simple;
	bh=oKkEKfhwkvx+v+Ta6PmsjoL6hTzX8sHn6G8U7vMuz54=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K1KUfLTwYM+SDRFMr+Z1HAxjwbSEpCBkjkZKjA0aEAldIVsH1+OibIxbg2DAPY4c6TTfUvm6t9oKZn7UG0OS89cde0xRMFKA0z08emsaBydlbXI58alHtyVNEeSTFOY+q9RN+WQdAapaKoWt0f+PSFZ6ijUh+1xA9XHRxM4jyH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a2gWyOHZ; arc=none smtp.client-ip=209.85.219.52
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8cceaa6f75bso41054236d6.0
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 08:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781452575; x=1782057375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ElgwnBNirjLiswOhHY1Csa+P9LjdxoJoEu8lkda184=;
        b=a2gWyOHZ2olj+zJ82fBLX3/Yda06Mw3riLRxSXhh23+uyQGcztB8Q4dRvNCOeKVtL7
         QzYvm73D7WGrcU3KqEACJ2lsSzrTRAxPbSTn2hJTlDJCQlj4tIwx8zzfD+j/tUHKO+eU
         mGG3m0aRK+Q3qGP5ktdHh3gZnEo9sKfWkoM2IW0cDdjVyYPJEkNAhDGIretZQdx+YzNe
         Roupo/R76SV9fSo6efJ+y+8nRPYvQvv0HdPE3GvqD3HnViUWCxmVaHEsHA38jr+yoWRf
         9M43z2UN2f5rZ13Jhe9hUbVsQvKfAIdI5Wk7aE1S9HEDzlP+MIjXtQgGUcUMpUGxBFyg
         ktCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781452575; x=1782057375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0ElgwnBNirjLiswOhHY1Csa+P9LjdxoJoEu8lkda184=;
        b=QBBLx+6yMvsjNSY0eqgeQhzdr0k1VgnZmBYcC+vFQ5moKM/EgJtggcSBEdaHzYpnxj
         A2yKCHriA90sgLSFcr1iGH2AKWhvFJ4P6WQy+yg5sC7U3RxZOg4csqGTktpMtJ9sw2cY
         tXclnF2sTcQA311GO2kZNsfIjNcz/xjf4yP3YFajUXjNS4JH+rjA34AqOmT9Rb5Pc3b9
         066g/Q+wkxkTn6W7XMWr3u+0TjBLTJrRKsfgxbG0jfsrGNklBksLv/H47HwGn/agMoBD
         GQL7UiulcqhqCR+zbOPi1a3EvxEdYwqse3tTuQkkiWOUFKo5GgySLZXiyVMGeJkT+m6p
         jVxw==
X-Forwarded-Encrypted: i=1; AFNElJ++cnxn7s3DBeinooGTFUd5homnJ5F1fHwdpglUn64llyU3B73XdsT9zap0IHlC/3VPgBnFlYLNhAHKPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFaDqtON04PIybhTS/DMxfiwL0sdNbJa7KYZjVYyffCIkRZ6KQ
	FNzwojbH7ClUieRTFJVQGXw7yDOqbEV1BhJ5kb7LxRjEGSnpzJuoLlt1
X-Gm-Gg: Acq92OHUMQHjWVAhmn4kqKIllEI52SRnV8J4s65ojmbKO0i96E54/CjdgKk9dKXbP49
	SWfic5f6yacXdBtL6kQ6b7yaXPWc7mEpVfrBf0NI8K+ZgM04p8xtzg5ny5H4l3XfhTCcFLhlRNu
	OY/FYgwtbd0hUUamHDR4teWKRJmkCtxv1ypqFq/5yVoXoD+FYqECdSH8H4QfrXLcw1XMwakFJ4G
	k2O9Erv+hWwBOJIJjDELrdtbgkLQz+bIpipM22JFpbpmHKCa4p0+WaOMtHR3yB6P9mJt3GzafMH
	saaRsv/8z74THRegY450H3B++1afqOjVmPntgZ37s7vnLTHKJhVEGoANyiHSgCZVEcQI4WhmPWt
	C4H++aCRvRAcBoJYtLwt3xwDkhe3245PJl7vQ7xr9kpUjSN0GScD/QalH2MzB51YbBCSg0p98g+
	s43k+7mKHGqMIJFy10wNFWSPdtghFMpSQ8m6ByfkCO2giWxu3IaaHT22niQq9Itz8pfG40meodI
	V70a1ac97EMAvtEUhHdv1NT/eBICZSvZApax0bVbsA=
X-Received: by 2002:a05:6214:3993:b0:8ce:b018:89ff with SMTP id 6a1803df08f44-8d44f8fc7a0mr121880556d6.36.1781452574638;
        Sun, 14 Jun 2026 08:56:14 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d30522cbeasm82008446d6.44.2026.06.14.08.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 08:56:14 -0700 (PDT)
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
Subject: [PATCH v2 1/6] media: v4l2-ctrls: validate HEVC and AV1 tile counts
Date: Sun, 14 Jun 2026 11:56:03 -0400
Message-ID: <20260614155609.3107600-2-michael.bommarito@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64800-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:hverkuil@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:nicolas.dufresne@collabora.com,m:laurent.pinchart@ideasonboard.com,m:benjamin.gaignard@collabora.com,m:detlev.casanova@collabora.com,m:ezequiel@vanguardiasur.com.ar,m:yunfei.dong@mediatek.com,m:jonas@kwiboo.se,m:heiko@sntech.de,m:kees@kernel.org,m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[michaelbommarito@gmail.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
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
X-Rspamd-Queue-Id: CB48E681740

The stateless HEVC and AV1 controls carry tile counts that several SoC
decoder drivers consume as loop bounds when laying out fixed-size hardware
descriptor buffers, but std_validate_compound() does not bound them.

For V4L2_CTRL_TYPE_HEVC_PPS with tiling enabled, num_tile_columns_minus1
and num_tile_rows_minus1 (u8) drive loops over column_width_minus1[20] and
row_height_minus1[22]. For V4L2_CTRL_TYPE_AV1_FRAME, tile_info.tile_cols
and tile_rows (u8) bound loops over the mi_*_starts[] / *_in_sbs_minus_1[]
arrays. Reject counts beyond the uAPI array capacity with -EINVAL.

These are active-count fields (loop bounds), so bounding the upper limit
here mirrors the existing num_active_dpb_entries check. Only the upper
bound is enforced; a zero tile count is left to the consuming driver, so
the zero-initialised AV1 frame control that existing userspace submits is
not rejected, and the AV1 divisor (context_update_tile_id / tile_cols) is
guarded where it is used in the rockchip decoder (patch 4).

Driver-interpreted index values (HEVC pic_parameter_set_id, AV1
context_update_tile_id) are bounded in the consuming drivers instead
(patches 2 and 4).

Fixes: 256fa3920874 ("media: v4l: Add definitions for HEVC stateless decoding")
Fixes: 9de30f579980 ("media: Add AV1 uAPI")
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
Assisted-by: Claude:claude-opus-4-8
---
 drivers/media/v4l2-core/v4l2-ctrls-core.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 6b375720e395c..58e2eb7002a19 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -790,10 +790,25 @@ static int validate_av1_film_grain(struct v4l2_ctrl_av1_film_grain *fg)
 	return 0;
 }
 
+static int validate_av1_tile_info(struct v4l2_av1_tile_info *t)
+{
+	/* Loop bounds in the stateless AV1 drivers. */
+	if (t->tile_cols > V4L2_AV1_MAX_TILE_COLS)
+		return -EINVAL;
+
+	if (t->tile_rows > V4L2_AV1_MAX_TILE_ROWS)
+		return -EINVAL;
+
+	return 0;
+}
+
 static int validate_av1_frame(struct v4l2_ctrl_av1_frame *f)
 {
 	int ret = 0;
 
+	ret = validate_av1_tile_info(&f->tile_info);
+	if (ret)
+		return ret;
 	ret = validate_av1_quantization(&f->quantization);
 	if (ret)
 		return ret;
@@ -1242,6 +1257,14 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 
 			p_hevc_pps->flags &=
 				~V4L2_HEVC_PPS_FLAG_LOOP_FILTER_ACROSS_TILES_ENABLED;
+		} else {
+			/* Loop bounds in the stateless HEVC drivers. */
+			if (p_hevc_pps->num_tile_columns_minus1 >=
+			    ARRAY_SIZE(p_hevc_pps->column_width_minus1))
+				return -EINVAL;
+			if (p_hevc_pps->num_tile_rows_minus1 >=
+			    ARRAY_SIZE(p_hevc_pps->row_height_minus1))
+				return -EINVAL;
 		}
 
 		if (p_hevc_pps->flags &
-- 
2.53.0


