Return-Path: <linux-media+bounces-42964-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBA8B92A1A
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 20:44:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B80861906406
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 18:45:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32E7231B800;
	Mon, 22 Sep 2025 18:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="plp022LW"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD4031A7EF;
	Mon, 22 Sep 2025 18:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758566650; cv=none; b=VO8qJoJZCBfRef3HLoaAmT00eh+pLdGu9l6FtKG5qFA5mBQrHq6ymC/oOfkNbKr5BzZBjwTDOoMHRFfgTn3md5g0R+j7nxa/1u5RwLCgletf/J8dSP7JjToFxmXOtlnDS/DCeQVr6wqIN2ftKTNdHIJyWbSV+oQwsDIQm7BdtaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758566650; c=relaxed/simple;
	bh=8Ru1gA/+Xt6RT6Vd2L59iOnO4RdALnmEprB5wUxa7JY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n+uOfkwLTvAY3DonLXKGjZW0TWOTo7RiJEBBFdA6Go3NjCKwJCAuo0q8B/h9JqyN6k1dVB9meYGLM6ApCphKGnZbNFpnZhEtpCZXDenmTIabuZXhS9yBzIuFJs/VWos/JeJndOakl36kbqfW3ykJ08qj2mRXWZe87abvUKYckEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=plp022LW; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758566647;
	bh=8Ru1gA/+Xt6RT6Vd2L59iOnO4RdALnmEprB5wUxa7JY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=plp022LW59l2ZM+CsMjmROE9bdXKb/bIse+CNbTgtd7DRhWEnTaMc1cttDZtGNV7f
	 Czkp+yu3TzL6jGfzLnnoQVzNAbrupXQknXaPwF11Yifh+N2hFV2DKE4SWdvpji2A3P
	 YSRb4FwtPsRO5uORdfz0Vle2TK5eVgk/BueDOM+xi6VnZHYdNpoBPjydt1iAsqfAnX
	 mdYBjoaEjeQJOw4Ag/fMng6MFRbtMhdwqGhbFoilZkBwWRsThAa6HoBT1i8ACxQh+l
	 oE57Sd1EUzcrjDKzn/LY2dFKveX07dHzQCOY/VeK27iKTJxhksfCWjs+6Gql8seVS0
	 8iQWe7Yao5TDQ==
Received: from [192.168.13.179] (unknown [IPv6:2606:6d00:10:aee0::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 498E217E12E1;
	Mon, 22 Sep 2025 20:44:05 +0200 (CEST)
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Date: Mon, 22 Sep 2025 14:43:39 -0400
Subject: [PATCH 2/2] media: verisilicon: Protect G2 HEVC decoder against
 invalid DPB index
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250922-imx8mq-hantro-g2-hang-v1-2-67d00eb6a548@collabora.com>
References: <20250922-imx8mq-hantro-g2-hang-v1-0-67d00eb6a548@collabora.com>
In-Reply-To: <20250922-imx8mq-hantro-g2-hang-v1-0-67d00eb6a548@collabora.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
 Stable@vger.kernel.org, Nicolas Dufresne <nicolas.dufresne@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2133;
 i=nicolas.dufresne@collabora.com; h=from:subject:message-id;
 bh=8Ru1gA/+Xt6RT6Vd2L59iOnO4RdALnmEprB5wUxa7JY=;
 b=owGbwMvMwCV203FKoGZC0RfG02pJDBkXZ3z4se3tjlV9G+164/0/qry8wXJOXOFi5OrHIuUsk
 osXreqM6yhlYRDjYpAVU2R5zxvUKHrk8CEplnwhmDmsTCBDGLg4BWAiOy8y/E/duHUB650DBaku
 h9ju31k5vUa8YN9yydhdxjt58iuEPpxhZPjyYtLXhU+4tOyqP7u2vF14PO0ni8jeqKMt2/UP6Oj
 mHmQDAA==
X-Developer-Key: i=nicolas.dufresne@collabora.com; a=openpgp;
 fpr=EF0D528115C4C3C21A046F12D9419451296072F4

Fix the Hantro G2 HEVC decoder so that we use DPB index 0 whenever a
ninvalid index is received from user space. This protects the hardware
from doing faulty memory access which then leads to bus errors.

To be noted that when a reference is missing, userspace such as GStreamer
passes an invalid DPB index of 255. This issue was found by seeking to a
CRA picture using GStreamer. The framework is currently missing the code
to skip over RASL pictures placed after the CRA. This situation can also
occur while doing live streaming over lossy transport.

Fixes: cb5dd5a0fa518 ("media: hantro: Introduce G2/HEVC decoder")
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c b/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
index f066636e56f98560d9b1c5036691e3c34dd13b1f..e8c2e83379def53ce7fd86d6929ed4f5e0db068e 100644
--- a/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
+++ b/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
@@ -283,6 +283,15 @@ static void set_params(struct hantro_ctx *ctx)
 	hantro_reg_write(vpu, &g2_apf_threshold, 8);
 }
 
+static u32 get_dpb_index(const struct v4l2_ctrl_hevc_decode_params *decode_params,
+			 const u32 index)
+{
+	if (index > decode_params->num_active_dpb_entries)
+		return 0;
+
+	return index;
+}
+
 static void set_ref_pic_list(struct hantro_ctx *ctx)
 {
 	const struct hantro_hevc_dec_ctrls *ctrls = &ctx->hevc_dec.ctrls;
@@ -355,8 +364,10 @@ static void set_ref_pic_list(struct hantro_ctx *ctx)
 		list1[j++] = list1[i++];
 
 	for (i = 0; i < V4L2_HEVC_DPB_ENTRIES_NUM_MAX; i++) {
-		hantro_reg_write(vpu, &ref_pic_regs0[i], list0[i]);
-		hantro_reg_write(vpu, &ref_pic_regs1[i], list1[i]);
+		hantro_reg_write(vpu, &ref_pic_regs0[i],
+				 get_dpb_index(decode_params, list0[i]));
+		hantro_reg_write(vpu, &ref_pic_regs1[i],
+				 get_dpb_index(decode_params, list1[i]));
 	}
 }
 

-- 
2.51.0


