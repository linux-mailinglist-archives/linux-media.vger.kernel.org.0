Return-Path: <linux-media+bounces-64787-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XRqwFzuoLmqN1gQAu9opvQ
	(envelope-from <linux-media+bounces-64787-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 15:10:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EC8681170
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 15:10:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="RwpQy/MB";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64787-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64787-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 060D3300A115
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 13:10:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEAC13A6B8D;
	Sun, 14 Jun 2026 13:10:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E106D39FCBF
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 13:10:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781442611; cv=none; b=fvPf0VGn35AHh2SDGyyFhJGJlB88wS2BVHnyyFjFUprkldOhQGyWTeZwYx4MTc21Fs3bYjb3ARZdzI3JT4sVVD9jcfWJGKPV36Qd4SzU6CEzoIyQOfsW6arcHTOpywNDtPr8js0p3X8g+Of7vPoIebnozqInpyLf2sv/g2WzyQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781442611; c=relaxed/simple;
	bh=IaCKE9TFkRSEZedHrVCyGACR9LVtAD879xyD9cppusA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fcH3WgYgPVo2AbqfrImFr06gYC4LmFlyTKpnrrrp2XbT42lucZem354vqxb2XcPtLQRZPx4itFe/h98tTwjlRia8Gf5JbNVfrebh/1s+BcOjXlZwIvpuyTWKVQWhUupZiNpImSb5GKhHtv3jyigGW0UFWJxrkQfYXpVLrN4px/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RwpQy/MB; arc=none smtp.client-ip=209.85.222.181
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-9157b94a07aso270628085a.0
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 06:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781442609; x=1782047409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9R3ZKgrKDL3TDyGuDg2FO0n6HFt0EmJKubv/kONUNuQ=;
        b=RwpQy/MBc32TNufYB/dy//jqlFa8qwVP4p84NjFKqGlDS0tMuJ+x8EhsjOUsHmZCWS
         9DgblSkfr6ZyhKZY0FZSqJoK0RXSD0VjzFbKRew67jX+ogfJWpMo4ul12YbvVYatMuYP
         uevZwbn32prpS3nN91YTAh7KGJC4mJO+TofBQ3KEGtGSUnX70ZXsvzyNozEeeEmcUmw8
         Eo8tFIbgLqx2vYcA66CG6wPTVLahnP8ZODcOP6plhEID4au69CKRp3a9s9HpJCuNNV8b
         Og9D9+ncmcukIISxtAuUINK//vPzBA70S9C0YaxgnVZzgIcie3noArFvlt6XHKFMmXXm
         BjIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781442609; x=1782047409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9R3ZKgrKDL3TDyGuDg2FO0n6HFt0EmJKubv/kONUNuQ=;
        b=sNj1dWg3Pbq6m9sKcI2kHnFU1BEYfTaOYEFDNzmtQzRmX1kA/PnUrLFH+TsQUNF6EK
         851jj9mmgEqaLNccfFWlSmwCwaJ50+Tw6kNUJFQgv9Etc+kYklbchv4Plg70eBaWEILB
         6JMUBuC/p+kewC49U4N1WYHefkS+Gto17E7JKyytpoNfx1wmk+8O0wn+vaBBn0N0rcSZ
         phlY8ucWQx6VUieY2nUIWcOHEGgr014C9W+II54iYMrpjSbYHHYUlP7RebPwyphABZhO
         Jks5sHvc02LUOlJ9IqjQpGtEupZTz6fxHBXzBAmg29jM+BShLbn0ktE0wM9RKGuE/NRT
         CcEQ==
X-Forwarded-Encrypted: i=1; AFNElJ87L6Pb84uHnffHDE08n8VmW9J7rJ6t4/bLUr+4pFC0KBFqv7XhAOFR7ZvTh1AHCuIzkPZrD6Iy30y22w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjHepI+dsq19Pube/yB7FbqATiBjUxf1W4iTujOs+xQOpPUXrB
	aXWnGNPRY0oCj6yANCTPfK85179GeZkEOiQEdLmzyGYUyWch7dzfBBus
X-Gm-Gg: Acq92OGlpFQH3fmEvrDCo/9BPoqgBDkypB23WUJdSnZ50w/rD/nAeslDZhTYiK0u4sm
	jLBm3c1alEHSrZS7ith2Cmygm+B6d4T6temyjbHMJsQ/D5ZicySNgXW8GyocUkhGk6jd0ZziMXt
	kKHPcwU9ARU17ZcqRzvAdKPM5mYsTgD7ewlcOMbWaDBqZ1ZXiZYHPxSyfjq8cEJbXWIwcTbclpC
	pR07BgFpdwgBw97GV5CXFXL7WF7h2wWIGWqsxKSAyno8jvVLxxrlNPyRdYGau1j/Xk0rjbwk8W2
	bVFMmND/p5I7eawYFswew/cXKSxznHaKKxHpLB8x2dN5fsAGlwlKnBGndfBo1/dEYlOxfW8LnP9
	F62qpc90LG1FU6TeP9hIAxAFB5Whx5Q6sjB5O+gykWUuTWZTsA0kmCqwSoqDO88yeA4Vkny6LQ4
	YpOAg+i+MYMpWVuDApVW7ehjFcBN0Etqx+EpvE+6WrxjMP1z7cpT1Sq2SNRUF0efpHJj/nK6L02
	18oqRcFx/Kj1HQp7Gx/IF34JHR5YWCH+tcTNdwFmnc=
X-Received: by 2002:a05:620a:2992:b0:915:a82b:3e9d with SMTP id af79cd13be357-9161baf526cmr1594376285a.12.1781442608799;
        Sun, 14 Jun 2026 06:10:08 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-91619f1b400sm752878985a.15.2026.06.14.06.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 06:10:08 -0700 (PDT)
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
Subject: [PATCH 1/6] media: v4l2-ctrls: validate HEVC and AV1 tile counts
Date: Sun, 14 Jun 2026 09:09:58 -0400
Message-ID: <20260614131003.2524025-2-michael.bommarito@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64787-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:hverkuil@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:nicolas.dufresne@collabora.com,m:sebastian.fricke@collabora.com,m:laurent.pinchart@ideasonboard.com,m:benjamin.gaignard@collabora.com,m:detlev.casanova@collabora.com,m:ezequiel@vanguardiasur.com.ar,m:yunfei.dong@mediatek.com,m:jonas@kwiboo.se,m:heiko@sntech.de,m:kees@kernel.org,m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[michaelbommarito@gmail.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E7EC8681170

The stateless HEVC and AV1 controls carry tile counts that several SoC
decoder drivers consume as loop bounds when laying out fixed-size hardware
descriptor buffers, but std_validate_compound() does not bound them.

For V4L2_CTRL_TYPE_HEVC_PPS with tiling enabled, num_tile_columns_minus1
and num_tile_rows_minus1 (u8) drive loops over column_width_minus1[20] and
row_height_minus1[22]. For V4L2_CTRL_TYPE_AV1_FRAME, tile_info.tile_cols
and tile_rows (u8) bound loops over the mi_*_starts[] / *_in_sbs_minus_1[]
arrays and a zero tile_cols divides by zero. Cap both to the uAPI array
capacity and reject out-of-range values with -EINVAL.

These are active-count fields (loop bounds), so bounding them here mirrors
the existing num_active_dpb_entries check. Driver-interpreted index values
(HEVC pic_parameter_set_id, AV1 context_update_tile_id) are bounded in the
consuming drivers instead (patches 2 and 4).

Fixes: 256fa3920874 ("media: v4l: Add definitions for HEVC stateless decoding")
Fixes: 9de30f579980 ("media: Add AV1 uAPI")
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
Assisted-by: Claude:claude-opus-4-8
---
These are loop-bound counts, not per-entry index values, so bounding them
in the common path mirrors the existing num_active_dpb_entries check.

Tested with the KUnit suite in patch 6: under KASAN on x86_64 the new
checks reject the over-range HEVC/AV1 tile counts and the zero AV1
tile_cols with -EINVAL while the in-range cases still pass, on stock and
patched.

 drivers/media/v4l2-core/v4l2-ctrls-core.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 6b37572..25227d9 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -790,10 +790,25 @@ static int validate_av1_film_grain(struct v4l2_ctrl_av1_film_grain *fg)
 	return 0;
 }
 
+static int validate_av1_tile_info(struct v4l2_av1_tile_info *t)
+{
+	/* Loop bounds and a divisor in the stateless AV1 drivers. */
+	if (t->tile_cols < 1 || t->tile_cols > V4L2_AV1_MAX_TILE_COLS)
+		return -EINVAL;
+
+	if (t->tile_rows < 1 || t->tile_rows > V4L2_AV1_MAX_TILE_ROWS)
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


