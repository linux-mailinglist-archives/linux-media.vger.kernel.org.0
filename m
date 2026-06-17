Return-Path: <linux-media+bounces-65077-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mE4EKGcEMmoctwUAu9opvQ
	(envelope-from <linux-media+bounces-65077-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 04:20:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6BF69616E
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 04:20:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Oz3zpsm3;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65077-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65077-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BADEA302A4CD
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 02:20:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 256213033E8;
	Wed, 17 Jun 2026 02:19:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94122311C1D
	for <linux-media@vger.kernel.org>; Wed, 17 Jun 2026 02:19:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781662779; cv=none; b=OrbDtq+dfZldZE4ttGxHRIkb5eK2F2TPtPy+lESiR/EDkPjoX139uWl61361icVLIElVptHcULhq2qUZlJYEAicOdZ8EpbMOq/6IsBWVBiHGQ82SiWkzfSmCY5j+5VbcZnIeaPU4DZwAKC7DCN38CQTpr1A7UD0aDL0WPy4HlOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781662779; c=relaxed/simple;
	bh=4U6WPsMzlM6SIn0yw6dtH3bu4VGHKh0G5LBtys4d550=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R6UjGZPl+LGP8SncKTzXdQemUryAXqktTCBfQkaS4TRGfKf002BhOw4Qpnd0ivJXx2txSUVKn7KWAfV7RyQiYNYS+L+IKv+WduT0gUIAufToCTrFyY7kk0EbI2H/VBa/rgSB95jJUR/5sx4dNJqgyXo0fVvnnsXAPskcszViWSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oz3zpsm3; arc=none smtp.client-ip=209.85.222.181
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-915c48e6ae2so427801885a.2
        for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 19:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781662776; x=1782267576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UuBm79rRC3GqReCC3VjX/W1uFvcufiVMiTRTGLknay4=;
        b=Oz3zpsm3KbGfPDR+600hmEX2zFX9wIHgCJ4yo8IuUW3anP1+qF7shb1CnytYO1ufmK
         NRqi6nGRFFQsIMkbWxrVedS3X8jrkGU8LGH4dEQxat6f925EnVbCdP8bnqG8m9exVet9
         r2LhDxy6jNy9ls2eNL66LajZwcXucsvKN1oT38q7+r7OJB+hPc9Tx5ZUgjxnjOlORySI
         75ZKGvsPHS1LTwyJTNaLNgx052L6Qg1ER/nq7jrmtXtj0IqGk6SKZMuas+yHhFKS32dG
         mQBpr1yU1AAvohp7zjUQ08yMaZksceRKtqKy7MO3pa7KSW5rBBxSomFj4Y53a0Pkpx1K
         /DHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781662776; x=1782267576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UuBm79rRC3GqReCC3VjX/W1uFvcufiVMiTRTGLknay4=;
        b=O5iPLNVSjgTpeMSLcv3jO0nguaHIoGXqf7HNuEQALCfPZUWuRrI/dRsbOVa808S3A1
         VBadOFCEv5s/VfQ/aauT2nyWOoxU2NSOMkhm7QqEAzALzMjOWtnTgSHucl3RO/ia36lx
         CEymSyWlzpPwqMAV//ai5UgPeGkAhPJ+XlyzgXuj6vd8WcyCOQ8TAUWthmJVCbkJy46s
         8cj4yfXp5dAuC+moABWAjuDoVtyYYX7wBf9U1rIqKtsDQLWncUEHQTHqsh5RYdEKUb7V
         Schqs1SxEc7COZoiJ/jbj2SfCim6WINmijmhoUjA6aXH7CJ+suQLmCjawNXphLFaw6ey
         nxUQ==
X-Forwarded-Encrypted: i=1; AFNElJ/iiyise2TPJxV9zy15J7en1r9ZxxUnfRo+M1pfbUa3MA+S+1D3b4vsl889TuPSystLVeAyYE65hwmqQg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfR2z9/tA7lUwFB25eJOOvaylGM8ywePoXKPcVFv346vDxBBZz
	oVKle0+cuawAoL0RW5xuLOyDw5NtpqI9LCCeXGocbMIAMP31UxjViVA5
X-Gm-Gg: Acq92OFIKBXtr1xMpPutpQyjxSHva3cCJzH9TJ1Scrav1N4XTJa4zUNkOjd1BhogA3I
	LNGJrmf36a/D33+vNRmNiDzi7JwpUlHl5na3h/TUHIJlpDaPPsNTSYICIljNjgyAsiAhMDE12ch
	7HyroqpAnGorifLlBVbGP7GprklJ5z/kACsh826umX3c5LSpVdfXbEKwhemwCtow/SqjaZM51Ng
	MMFhzh1NMSc+jRjkIf7mML0RKysw1MWH60JHFVg9TMJZhQOia6L1Uoo3zzaNVDmq+AYfWqLyT5g
	DyLUxQgW+Cw4Z1nMnz2ijJOv+mdOGTbe7ngdOvKJwlA1KRiAX7GWomMyYvsHv0YVhj+xW8LIorC
	1+KZS0yLdSYJclaqnsM8RG477iQ0aoJrO2/YLtrHZiHcmEEJ+u5YqLToV3T78Gfl2WPhWtjDNk4
	pFkXVpoQ0fqr8Rqh+vS+K25+iI4v8Kl7AcNQ6Bu/Ro9Xoobg0YWoH/qrK9+tfPfieGRzH3nHv2Z
	Xa7qJWGi9OFKq9g2jzVLOq50rX/0mNr
X-Received: by 2002:a05:620a:17a6:b0:915:9125:e649 with SMTP id af79cd13be357-91d8dcae125mr414112385a.44.1781662776545;
        Tue, 16 Jun 2026 19:19:36 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9161a006e35sm1657646285a.28.2026.06.16.19.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 19:19:36 -0700 (PDT)
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
Subject: [PATCH v3 6/9] media: verisilicon: rockchip: guard VPU981 AV1 divisor and tile buffer
Date: Tue, 16 Jun 2026 22:19:03 -0400
Message-ID: <20260617021906.2746743-7-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260617021906.2746743-1-michael.bommarito@gmail.com>
References: <20260617021906.2746743-1-michael.bommarito@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65077-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:hverkuil@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:nicolas.dufresne@collabora.com,m:laurent.pinchart@ideasonboard.com,m:benjamin.gaignard@collabora.com,m:detlev.casanova@collabora.com,m:ezequiel@vanguardiasur.com.ar,m:yunfei.dong@mediatek.com,m:jonas@kwiboo.se,m:heiko@sntech.de,m:kees@kernel.org,m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[michaelbommarito@gmail.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5B6BF69616E

rockchip_vpu981_av1_dec_set_tile_info() divides context_update_tile_id by
tile_info->tile_cols and writes one descriptor per tile into the tile_info
DMA buffer, which holds AV1_MAX_TILES entries; tile_cols and tile_rows
come from the bitstream. Guard the division against a zero tile_cols by
initialising the context-update values to zero and computing them only
when tile_cols is non-zero, and stop the descriptor writes once the
tile_info buffer is full. The tile geometry written to the hardware
registers is left unmodified; the per-dimension and total tile bounds are
enforced by the control validation.

Fixes: 727a400686a2 ("media: verisilicon: Add Rockchip AV1 decoder")
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
---
 .../verisilicon/rockchip_vpu981_hw_av1_dec.c  | 32 +++++++++++++++----
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
index e4e21ad373233..fd00dbd79fe46 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
@@ -578,16 +578,30 @@ static void rockchip_vpu981_av1_dec_set_tile_info(struct hantro_ctx *ctx)
 	const struct v4l2_av1_tile_info *tile_info = &ctrls->frame->tile_info;
 	const struct v4l2_ctrl_av1_tile_group_entry *group_entry =
 	    ctrls->tile_group_entry;
-	int context_update_y =
-	    tile_info->context_update_tile_id / tile_info->tile_cols;
-	int context_update_x =
-	    tile_info->context_update_tile_id % tile_info->tile_cols;
-	int context_update_tile_id =
-	    context_update_x * tile_info->tile_rows + context_update_y;
+	int context_update_y = 0;
+	int context_update_x = 0;
+	int context_update_tile_id = 0;
 	u8 *dst = av1_dec->tile_info.cpu;
+	u8 *dst_end = dst + av1_dec->tile_info.size;
 	struct hantro_dev *vpu = ctx->dev;
 	int tile0, tile1;
 
+	/*
+	 * tile_cols and tile_rows are bounded by the V4L2 control validation
+	 * (V4L2_AV1_MAX_TILE_{COLS,ROWS} and V4L2_AV1_MAX_TILE_COUNT). Guard
+	 * the divisor here, and keep the descriptor writes within the
+	 * AV1_MAX_TILES tile_info buffer below; the register values use the
+	 * unmodified tile geometry.
+	 */
+	if (tile_info->tile_cols) {
+		context_update_y =
+		    tile_info->context_update_tile_id / tile_info->tile_cols;
+		context_update_x =
+		    tile_info->context_update_tile_id % tile_info->tile_cols;
+		context_update_tile_id =
+		    context_update_x * tile_info->tile_rows + context_update_y;
+	}
+
 	memset(dst, 0, av1_dec->tile_info.size);
 
 	for (tile0 = 0; tile0 < tile_info->tile_cols; tile0++) {
@@ -598,6 +612,10 @@ static void rockchip_vpu981_av1_dec_set_tile_info(struct hantro_ctx *ctx)
 			    tile_info->height_in_sbs_minus_1[tile1] + 1;
 			u32 x0 = tile_info->width_in_sbs_minus_1[tile0] + 1;
 
+			/* Stop once the tile_info descriptor buffer is full. */
+			if (dst + 16 > dst_end)
+				break;
+
 			/* tile size in SB units (width,height) */
 			*dst++ = x0;
 			*dst++ = 0;
@@ -622,6 +640,8 @@ static void rockchip_vpu981_av1_dec_set_tile_info(struct hantro_ctx *ctx)
 			*dst++ = (end >> 16) & 255;
 			*dst++ = (end >> 24) & 255;
 		}
+		if (dst + 16 > dst_end)
+			break;
 	}
 
 	hantro_reg_write(vpu, &av1_multicore_expect_context_update, !!(context_update_x == 0));
-- 
2.53.0


