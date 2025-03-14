Return-Path: <linux-media+bounces-28228-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CEDA6129E
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 14:28:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E4B03B5CCC
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 13:28:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B82C1FFC6F;
	Fri, 14 Mar 2025 13:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="AzLZgyEo"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5239B1FFC59;
	Fri, 14 Mar 2025 13:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741958866; cv=pass; b=ZQzqGkzsvUWAUgQm1CM2S5Tn5JbVan7aNsefl3S9+a13yKrDjav8+CNypENmyjOUrZ/cwEjQeoWpU17PmpMYE/Z8wsItQx1ohxRUnw/OSeYT6huxgRPjoKZ6xZlyGIgb4B11e1gWZDSOZe3UpsyHGGnNoJ5DtPISKpifhmzxQQM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741958866; c=relaxed/simple;
	bh=41uAuDBAdwDURpr00ZnHEdCpyfUzB/9vnikmEpd4glM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=txnmYzxB5TOfEEBhyG1MR3lElNI/o2rXNhytidHaSetckKBUIQ388AXxAlrx6kscfVJHDRoM/KkuPVEvPTvLxiru1RmqIO6KQw9DarGlJnDDRQXYgyDI3kD1+uJmowlMOvo/Y3wSMJGHIws1BnsgaZaGK2VwVo/jWiGZ18K+i1w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=AzLZgyEo; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1741958834; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NsS4F1K90WlNKnGrraMnXP8XW5Y09jO/+BORJJ/hXkN31ua4XWH/RKftru+7EEzjC+F7HY9AWte1a9XuK1I2MfwvY2FliqOqcWLDQjGNAiPbCwak5PbuGLZbOH64dYa1M+MnmPDkPel9g3zgJqkHmwi9O12x1iFfmt1EsWjEuek=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741958834; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=uCoDkNxle5kYQxEYElD69IYy2zg+RTAZoMqICiRmeUE=; 
	b=dnDjZQFKOG7k/KbiuZUiIiVSMTxgB+oKf66bO0JbxU6isK/TJhs0NPODkf63CnCyse/WR/Nq6MT7s03RkGPd+GqOvPikdra40TXSQRPCg2DGTlvTPE+EzyN3ArTSf/MeoyIVAwlj9F4qLj9EXaV+HGj+qBmBi4FNStcTHQ+lopo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741958834;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=uCoDkNxle5kYQxEYElD69IYy2zg+RTAZoMqICiRmeUE=;
	b=AzLZgyEoRHU2ZMpk6ReS0fi31DtyDvOCHBnCOaQGxESo8INRr8lrr9Bl/rCKhYTd
	78kkeLeO6zBJIp8PFLK1NNGGAFA7HAwztquhc53d7CM32iUKSfYJUWO50azwBShvaS1
	9OMKrHoCqppyJggRmwjTEzY2F3t+y7lUOei7jXi4=
Received: by mx.zohomail.com with SMTPS id 1741958831940301.9413422942897;
	Fri, 14 Mar 2025 06:27:11 -0700 (PDT)
From: Sebastian Fricke <sebastian.fricke@collabora.com>
Date: Fri, 14 Mar 2025 14:26:30 +0100
Subject: [PATCH 5/5] media: mtk-vcodec: Don't try to decode 422/444 VP9
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v1-5-5e277a3d695b@collabora.com>
References: <20250314-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v1-0-5e277a3d695b@collabora.com>
In-Reply-To: <20250314-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v1-0-5e277a3d695b@collabora.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 kernel@collabora.com, Sebastian Fricke <sebastian.fricke@collabora.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741958789; l=1233;
 i=sebastian.fricke@collabora.com; s=linux-media; h=from:subject:message-id;
 bh=emJE1X62MuP0DezjydZOlvtEYLKSLG8mtfx8cJ7l/Ak=;
 b=8osgM6j4VT/PtVsmE7tkbG8dQ7JBOV2MAMNuNrQGJk5n2F7j6aPuW/gs9ohRwuBFlnr3mskub
 7aWEdfocOPcDm1ourg2ImJ9zqwCQiJegWK3m+BOYhhMj0jR6xd3YVrj
X-Developer-Key: i=sebastian.fricke@collabora.com; a=ed25519;
 pk=pYXedPwrTtErcj7ERYeo/IpTrpe4QbJuEzSB52fslBg=
X-ZohoMailClient: External

From: Nicolas Dufresne <nicolas.dufresne@collabora.com>

This is not supported by the hardware and trying to decode
these leads to LAT timeout errors.

Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c     | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index 9187d7bcfc8aea17f3fc98d94419777d8026db51..3dbd251034b85e521c3c93538d9ecf9078ef3820 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
@@ -496,6 +496,12 @@ static int mtk_vdec_s_ctrl(struct v4l2_ctrl *ctrl)
 			mtk_v4l2_vdec_err(ctx, "VP9: bit_depth:%d", frame->bit_depth);
 			return -EINVAL;
 		}
+
+		if (!(frame->flags & V4L2_VP9_FRAME_FLAG_X_SUBSAMPLING) ||
+		    !(frame->flags & V4L2_VP9_FRAME_FLAG_Y_SUBSAMPLING)) {
+			mtk_v4l2_vdec_err(ctx, "VP9: only 420 subsampling is supported");
+			return -EINVAL;
+		}
 		break;
 	case V4L2_CID_STATELESS_AV1_SEQUENCE:
 		seq = (struct v4l2_ctrl_av1_sequence *)hdr_ctrl->p_new.p;

-- 
2.34.1


