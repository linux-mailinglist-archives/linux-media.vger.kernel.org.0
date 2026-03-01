Return-Path: <linux-media+bounces-53877-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SF1sNH6Vo2l7HQUAu9opvQ
	(envelope-from <linux-media+bounces-53877-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:25:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF161CA816
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:25:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6BD7C30BAEC3
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 01:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B26F25F98A;
	Sun,  1 Mar 2026 01:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mcEg4D75"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B4718E02A;
	Sun,  1 Mar 2026 01:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772327950; cv=none; b=eZVGv3P+V+VjvddQNNZO/UgsN1DoEghdxXvQctVyuWFPSM3GYTALD63iOYH6jz49GRcZoUzJ9zW9oBUR2BDNc7EApOJgs4Sm38/E6MHoRx+1adBb8yr/a1OckLNmracxDCl+EI9DMH8XQuiU8Oi1bJmklCWE1zRxzGY+DSmdo+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772327950; c=relaxed/simple;
	bh=6Q2k0VkWDP09CJ3dNoRJSfIB+gFGrjgsHsSzV4bQdA4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KTXrIN3+FCtbWvg0cCoPMLmLV5yoUmgfCVaABnH3sxLTm/3p7eA2JQaGA2KxntDeKk32PtZNSK/l5FmQOtvrd78hL+YY71EgJWWiFNQvI461PGFdxBX6u7oLXvkooIBs6tJvC1FjqU9gDJgQ8azWN31xKZ3YEBleSDFKNcQXeXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mcEg4D75; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19E29C19424;
	Sun,  1 Mar 2026 01:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772327949;
	bh=6Q2k0VkWDP09CJ3dNoRJSfIB+gFGrjgsHsSzV4bQdA4=;
	h=From:To:Cc:Subject:Date:From;
	b=mcEg4D75HROXAAKfHenSKt6j/n3MuOZHAod7A1fj0EMLiHy9/Z4a3jgv1jit+gEE6
	 /xxg9vVVtR+huEVtmPuBd4hx9hsSncZ4WqGJzo8EUStkdgvd622nV3qy5xx6HQmlJI
	 9opkRORaYui1307dbtdSy6JVQSBBcF4/7nmYnWC9bSK3AxNXATBQDvBWTgrOxm8DAE
	 2hjcSwVjl5rBc3OvBA3IgKnPB9qkvWs+X+TN9SbhLZug+KZQHwP6p13RLGSy9HJ7+q
	 IuQJMyo8SoT+CK1nTnAUXHBrvfvRn7CEtmZkt6Kw7jKUfckEo4Dg4vB+qTLiEuGTCO
	 I998G2P6KZU9w==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	benjamin.gaignard@collabora.com
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: FAILED: Patch "media: verisilicon: AV1: Fix tx mode bit setting" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:19:07 -0500
Message-ID: <20260301011908.1673777-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53877-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:email]
X-Rspamd-Queue-Id: 4AF161CA816
X-Rspamd-Action: no action

The patch below does not apply to the 6.12-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From cb3f945c012ab152fd2323e0df34c2b640071738 Mon Sep 17 00:00:00 2001
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Date: Tue, 9 Dec 2025 11:34:17 +0100
Subject: [PATCH] media: verisilicon: AV1: Fix tx mode bit setting

AV1 specification describes 3 possibles tx modes: 4x4 only, largest and
select. The hardware allows 5 possibles tx modes: 4x4 only, 8x8, 16x16,
32x32 and select. Since the both aren't exactly matching we need to add
a mapping function to set the correct mode on hardware.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Fixes: 727a400686a2c ("media: verisilicon: Add Rockchip AV1 decoder")
Cc: stable@vger.kernel.org
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 .../verisilicon/rockchip_vpu981_hw_av1_dec.c  | 27 ++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
index f4f7cb45b1f1b..f52b8208e6b93 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
@@ -72,6 +72,14 @@
 		: AV1_DIV_ROUND_UP_POW2((_value_), (_n_)));		\
 })
 
+enum rockchip_av1_tx_mode {
+	ROCKCHIP_AV1_TX_MODE_ONLY_4X4	= 0,
+	ROCKCHIP_AV1_TX_MODE_8X8	= 1,
+	ROCKCHIP_AV1_TX_MODE_16x16	= 2,
+	ROCKCHIP_AV1_TX_MODE_32x32	= 3,
+	ROCKCHIP_AV1_TX_MODE_SELECT	= 4,
+};
+
 struct rockchip_av1_film_grain {
 	u8 scaling_lut_y[256];
 	u8 scaling_lut_cb[256];
@@ -1935,11 +1943,26 @@ static void rockchip_vpu981_av1_dec_set_reference_frames(struct hantro_ctx *ctx)
 	rockchip_vpu981_av1_dec_set_other_frames(ctx);
 }
 
+static int rockchip_vpu981_av1_get_hardware_tx_mode(enum v4l2_av1_tx_mode tx_mode)
+{
+	switch (tx_mode) {
+	case V4L2_AV1_TX_MODE_ONLY_4X4:
+		return ROCKCHIP_AV1_TX_MODE_ONLY_4X4;
+	case V4L2_AV1_TX_MODE_LARGEST:
+		return ROCKCHIP_AV1_TX_MODE_32x32;
+	case V4L2_AV1_TX_MODE_SELECT:
+		return ROCKCHIP_AV1_TX_MODE_SELECT;
+	}
+
+	return ROCKCHIP_AV1_TX_MODE_32x32;
+}
+
 static void rockchip_vpu981_av1_dec_set_parameters(struct hantro_ctx *ctx)
 {
 	struct hantro_dev *vpu = ctx->dev;
 	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
 	struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
+	int tx_mode;
 
 	hantro_reg_write(vpu, &av1_skip_mode,
 			 !!(ctrls->frame->flags & V4L2_AV1_FRAME_FLAG_SKIP_MODE_PRESENT));
@@ -2005,7 +2028,9 @@ static void rockchip_vpu981_av1_dec_set_parameters(struct hantro_ctx *ctx)
 			 !!(ctrls->frame->flags & V4L2_AV1_FRAME_FLAG_ALLOW_HIGH_PRECISION_MV));
 	hantro_reg_write(vpu, &av1_comp_pred_mode,
 			 (ctrls->frame->flags & V4L2_AV1_FRAME_FLAG_REFERENCE_SELECT) ? 2 : 0);
-	hantro_reg_write(vpu, &av1_transform_mode, (ctrls->frame->tx_mode == 1) ? 3 : 4);
+
+	tx_mode = rockchip_vpu981_av1_get_hardware_tx_mode(ctrls->frame->tx_mode);
+	hantro_reg_write(vpu, &av1_transform_mode, tx_mode);
 	hantro_reg_write(vpu, &av1_max_cb_size,
 			 (ctrls->sequence->flags
 			  & V4L2_AV1_SEQUENCE_FLAG_USE_128X128_SUPERBLOCK) ? 7 : 6);
-- 
2.51.0





