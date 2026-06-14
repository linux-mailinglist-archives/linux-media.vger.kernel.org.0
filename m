Return-Path: <linux-media+bounces-64791-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 44BsD1eoLmqT1gQAu9opvQ
	(envelope-from <linux-media+bounces-64791-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 15:10:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AD651681180
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 15:10:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="qiSQBX/K";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64791-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64791-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B61BD3012CE3
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 13:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 476983A75AC;
	Sun, 14 Jun 2026 13:10:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32EAC3A5431
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 13:10:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781442617; cv=none; b=htDI1yzksEpDU2SSmjrJr3ohw2SHAoYA8Jg9bFEl20Z3m1k7q/k/4yDnArGIHfWnUrZ14/Bfm45kJjsplCsJGKoI4Zyfrmp7dEu3G5oT8XccalFHjwd44SrYyjL/3IX3aAdpDm1tI+DIodTTg5iTHPoIO2124bqykHqgCy4JvNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781442617; c=relaxed/simple;
	bh=l1YrhJKSwtxthDenZdIjKLY4VixfDd+J7xq/PKf9pdM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C8HjBtxMrhdAS/7mAmbUbu/aNPTmblnaj8iAXpwEo20nPhx9vLGToN49cKPv++royVc6QJBiKkGNOENCbcWy+G/2upIGUH9i0KWXhBbhyXckCqjPfJHB/fahQfKCwvzfhGq7rnyAE39JelWwE3xcuhXnNy3OfZ92P65Al50ZCmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qiSQBX/K; arc=none smtp.client-ip=209.85.219.49
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8ccf01ba514so26601416d6.0
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 06:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781442615; x=1782047415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CKd9oqWR4qF+iy/wwQJEAglTquC/gKwfzimhVuiNy9E=;
        b=qiSQBX/KEskzjMa4YHZI0AgltEF1gTJ5Ja7Tj15s7Us40853L/PXXS8Atvv/nn27kY
         gskKkzTuywUh105Tch+t5lzu1XZF0Bif5P5/sIkG807oDoqBI95w0ZEvIPIEq+V0S6Qo
         0kmggVCnog6ujWjpB0zbi27888MVolh0/vSrGWaUrTOaBaqGJFt+k6Qd8YChcs5DHrs1
         QBA+lqBGdzP8EGVCjCImmDvWIZKuST5ApSknNZ8gG6uxY3JTlU5ATgpA1Vbya+IFnv9T
         HwGsU7GtX8q22Iire1lYEVG5nW/Lm22p6SW3AlWyKnR2O/NhU9wA7gLoQs5Gwb/AyO6+
         Helg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781442615; x=1782047415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CKd9oqWR4qF+iy/wwQJEAglTquC/gKwfzimhVuiNy9E=;
        b=XCLrlwLRNcw1yTK8avkZcIHf1Ll3EiHKqm/5jdRZ/UywhBMTr3t29Z8bZ9uSAmyVAc
         Kc1O6vaJNoqBJpi6OolnFcXz3xG4d1BuI8+rWOpW0x80WXQvKHYREgiJIu8mWxst8YcK
         JalFNXQ2GD0ol6I+0+2CmJ9cqI7xiDYNd/g0MkEEi6qh0hH1EtaJVBuITeMUjLbfO66N
         GjEdat4MJpQM+0KneUF/Pv5iAiDWBwXRVhZqvotH/Ioj5yvL8Mc9JZ1m8BBIgWfqCQFX
         Q+p2/TinXL7nE1CXb8+O9NsiiHzbn6UdyRYBXbJ1hfYqHfaOBznh63F+R+bgnYeWpUgs
         clRw==
X-Forwarded-Encrypted: i=1; AFNElJ9aZySXhgslQvx0tSJykAJ1LKEGS01sQiNHGE3c6hR4FX+MIf9ed+eK4bv+fwL3aPYXlcfhDDcQHS4+Gw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHEY/M2+I1PDPCXD8ASLN1zgAXfP/mXzN+UrYrwgzZcp/dz6Nt
	/kQigjqu51slTW7i3spGdUraNXMCfSJN8Ue9s6iThryNsiAZ2v70MMxM
X-Gm-Gg: Acq92OGgBRsvQ51E8/B865a2rKt9NJe4mhorwRKLyWydbb22Nz0iTail7beUTptQC9/
	cBoZ7LLFB0nDg53a5UdqPTi9K8dax2DCRpSKF/ymQiHHeAuce3DPDCysL4a2t4edWC61vHmmKsZ
	uAV5BcbfAIv3MhzSbWCq4zD0hLx3Ht2U1fqH0M0bK2YJ1oe06cKRloi0VppClSEI4Y8gMeCB94F
	8Vq86iIB1dBXLc82cyV7Wl8NrluvQNpWnaqtrtvtUvzoo02C39Ax4aD2ccdEUVBZ6x4OgPYQI5l
	I8Ip+g2l8fgujJ8Gj5eVgh7vwguWb3sLJDC+U5laylonMetcJru9unLe4+dPK3unQpD6aIMlBZh
	FAyTK3bqnRq6a1PUSXTtUcZU69YzO8ecn+umLjxUCpRXrl2duSpWBU9Bfd3hlNUFn24tAb2RH4e
	J2CsYNvMDJksE9brjzyjpWltwSzB8uWlhaFtnOFdMesOdwmFm42bMRtgPzGtDk3avN4d4LpqVXC
	LYyjAE/Tengsx2DqesH/Aaz2AMo8YD3wNSyK+GlzbI=
X-Received: by 2002:a05:620a:d8e:b0:915:9273:9242 with SMTP id af79cd13be357-9161bac4a68mr1535377285a.3.1781442615118;
        Sun, 14 Jun 2026 06:10:15 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-91619f1b400sm752878985a.15.2026.06.14.06.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 06:10:14 -0700 (PDT)
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
Subject: [PATCH 5/6] media: mediatek: vcodec: bound AV1 tile-start copy to the array capacity
Date: Sun, 14 Jun 2026 09:10:02 -0400
Message-ID: <20260614131003.2524025-6-michael.bommarito@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-64791-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: AD651681180

vdec_av1_slice_setup_tile() copies tile_cols + 1 / tile_rows + 1 start
positions into mi_col_starts[] / mi_row_starts[], which hold
V4L2_AV1_MAX_TILE_COLS + 1 / V4L2_AV1_MAX_TILE_ROWS + 1 entries. tile_cols
and tile_rows come straight from the bitstream; bound the copy to the array
capacity so the accesses stay in range.

Fixes: 0934d3759615 ("media: mediatek: vcodec: separate decoder and encoder")
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
Assisted-by: Claude:claude-opus-4-8
---
This is an MT8195-class SoC block not reachable on the x86 KUnit host, so
the driver-side out-of-bounds access is not reproduced here.

 .../mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c       | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
index 2d622e8..49d9b4a 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
@@ -1299,11 +1299,12 @@ static void vdec_av1_slice_setup_tile(struct vdec_av1_slice_frame *frame,
 	tile->uniform_tile_spacing_flag =
 		BIT_FLAG(ctrl_tile, V4L2_AV1_TILE_INFO_FLAG_UNIFORM_TILE_SPACING);
 
-	for (i = 0; i < tile->tile_cols + 1; i++)
+	/* Bound the copy to the mi_col_starts[]/mi_row_starts[] capacity. */
+	for (i = 0; i < tile->tile_cols + 1 && i < V4L2_AV1_MAX_TILE_COLS + 1; i++)
 		tile->mi_col_starts[i] =
 			ALIGN(ctrl_tile->mi_col_starts[i], BIT(mib_size_log2)) >> mib_size_log2;
 
-	for (i = 0; i < tile->tile_rows + 1; i++)
+	for (i = 0; i < tile->tile_rows + 1 && i < V4L2_AV1_MAX_TILE_ROWS + 1; i++)
 		tile->mi_row_starts[i] =
 			ALIGN(ctrl_tile->mi_row_starts[i], BIT(mib_size_log2)) >> mib_size_log2;
 }
-- 
2.53.0


