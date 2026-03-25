Return-Path: <linux-media+bounces-57087-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SH4oNMctxGmZwgQAu9opvQ
	(envelope-from <linux-media+bounces-57087-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 19:47:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D230732AC69
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 19:47:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 16BCB3048985
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 18:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B337733BBBA;
	Wed, 25 Mar 2026 18:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="cShJJO2o"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFEA1334C28;
	Wed, 25 Mar 2026 18:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774464172; cv=none; b=LgZ4pKW1nUHVCLaV5HKKXXQk6VSR/vuLA/ERlyMso2K6aWK2P59CnDTLvwhX+9hfFQDfnGLdJC6UZTaC5JewieNquf1/pvpjq20/mrgGTr3DCaAaq5mFpGb2UvYXM8lG/r67f255d5jkK2f++1KbQ35XpGmX2YR4pzMcgnJGJlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774464172; c=relaxed/simple;
	bh=R3cSGkJi458zaKPdqMjU7ki5A1nnhTi1TmYmkBduVQo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YXunUsHHeyyzD0T4RbV7bZmfqYpfim+X+GKNJnkf+Ck4zq7foRfZXL4VsDPw9CH0oTDAOomjjXbykGDTx5Hp/qloUX5IDRDvNnrVM0Ngl53v5Gafv/jVqW2b/OVGs/731/uwnJRltz8Zat+c3cGTtBZJEemt3Y9d3jlfY8PP0iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=cShJJO2o; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774464169;
	bh=R3cSGkJi458zaKPdqMjU7ki5A1nnhTi1TmYmkBduVQo=;
	h=From:Date:Subject:To:Cc:From;
	b=cShJJO2olfA1NwFkNb+dLaPXdZ82NIyE86qW8hfi8Kqtufq5RNgYll2fRGds9GHyE
	 Ko8kY7TM5Avn7hmv+82Irs9rswcbDSTAaMuiv96/clkhT2tutwG7fbDoeuzAE9qcce
	 NkJyq9ckh/C8NIp56kaky71G+h1bZixKWCZTJ6+BdmK5woPFXlOzYUZCCpMYmN2eit
	 LGhR9hn05DEUXAGz94LcanVOysc+GVILFmVL2VuIHLEelKoX43+hHYWvV9u2zWvSeS
	 eU7XZTqO3OINSbM9UZchlDX76RQKVfaVvcHUuwdM/kBmekNU7QOoAF+NNkcZLLEl4/
	 O28p2VnuMT9OA==
Received: from [192.168.13.179] (unknown [IPv6:2606:6d00:15:e06b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2E00B17E5CAE;
	Wed, 25 Mar 2026 19:42:48 +0100 (CET)
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Date: Wed, 25 Mar 2026 14:42:30 -0400
Subject: [PATCH] v4l2: common: Fix P010 format definition
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-v4l2-common-p010-v1-1-4427779dda56@collabora.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYyNT3TKTHCPd5Pzc3Pw83QIDQwNdyyRjM5NEC/NEM3NLJaC2gqLUtMw
 KsJHRsbW1AOWs989iAAAA
X-Change-ID: 20260325-v4l2-common-p010-9b364a87a679
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2244;
 i=nicolas.dufresne@collabora.com; h=from:subject:message-id;
 bh=R3cSGkJi458zaKPdqMjU7ki5A1nnhTi1TmYmkBduVQo=;
 b=owGbwMvMwCV203FKoGZC0RfG02pJDJlHdJbfa1kq92mzuBHv0pUelZcf6lnpP95pO//d0kPHZ
 7JOU9ey6ShlYRDjYpAVU2R5zxvUKHrk8CEplnwhmDmsTCBDGLg4BWAi3oyMDCdfcD/au1hy41qD
 yEcXfbL3Jcru3ZPSev0ql862CvdPRnaMDN//C28ukQ26lbl1xY3PqRyaO77MbvGvSt3EMG8X/x3
 jFAYA
X-Developer-Key: i=nicolas.dufresne@collabora.com; a=openpgp;
 fpr=EF0D528115C4C3C21A046F12D9419451296072F4
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TAGGED_FROM(0.00)[bounces-57087-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: D230732AC69
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Correct the subsampling divider and unpack the bytes per pixel values. P010
is a 4:2:0 subsampled format but was previously encoded as 4:2:2, and the
bytes per pixel value was being hacked to compensate.

Fixes: 5374d8fb75f3132 ("media: Add P010 video format")
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 drivers/media/v4l2-core/v4l2-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 554c591e1113310fd8926ebc2cbc4e124bd9f109..1764502cbcb2072c91e0dd0020c4a844281f092e 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -295,7 +295,7 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
 		{ .format = V4L2_PIX_FMT_NV20,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 5, 10, 0, 0 }, .bpp_div = { 4, 4, 1, 1 }, .hdiv = 2, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_NV24,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_NV42,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
-		{ .format = V4L2_PIX_FMT_P010,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 2, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_P010,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 2, 4, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 2 },
 		{ .format = V4L2_PIX_FMT_P012,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 2, 4, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 2 },
 
 		{ .format = V4L2_PIX_FMT_YUV410,  .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 4, .vdiv = 4 },

---
base-commit: ebeec2b000a90cd8aae86d1931ff5ef23af8284e
change-id: 20260325-v4l2-common-p010-9b364a87a679

Best regards,
-- 
Nicolas Dufresne <nicolas.dufresne@collabora.com>


