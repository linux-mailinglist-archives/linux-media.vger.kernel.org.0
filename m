Return-Path: <linux-media+bounces-26920-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E96D5A43A0A
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 10:46:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C9FF167C99
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 09:43:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8232526561A;
	Tue, 25 Feb 2025 09:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="FjytpZCG"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDDE2627E9;
	Tue, 25 Feb 2025 09:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740476506; cv=pass; b=caMMjEPVWVlcoZlFoT91JceypAQ9UxXPXGGeTKidsmQdLBbdM74xADkJJdpzoMzUEfNIBEm5a0XhfnaouPi0BC1XlbxvFFCKE5LakMaJVEi52w4QUP/719mXvj2VbFQlK3CfO9aER+trAkZkIULwsE4HrPBiKbxMGVOyHSUi2yA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740476506; c=relaxed/simple;
	bh=vZriED9Fp3nlM81wvXcPSkXsPrSVPE/tj+vNK999p0U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iTV9wQDPm9XsQbWDsTEpXDAWh/mUum1Q32oSyZsbcMBvBMk3dQO2RURrssSuybNhUaLPIUDKAj32eGGkM+MesRD+Uq269o51VwGU3DhpiYOB611FGFWPF3rWrduBwfiCUyzIusiIAwF/6IuEf3KUaz+xi8V1gmINijDMq2YnVnE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=FjytpZCG; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1740476480; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FpIAXatxbkP6A6pNhrKSgWAyx7jisDzhS271q3zEfE2c0MrVbbH3dOki0MepARwXWRwOfzj3ijm0om/Pd6EvieT+/gv0JJ6vBHWISZXDzJrBVdSNdzT7Niuf1MozohhAWf7fDevsJB9NOpgMgzYmA+eigQoQAcC3pA+ojkZcoA4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1740476480; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=hxN3jzC16EMS8sC831bVLnOP4XuP4WpSvwKW+swAeco=; 
	b=FvoSTEalzaqDz42jKY6zVXlgTAQiJWN2sjtKXjiIPinUvU7L3OuGXInX0Ir7T9BHHCj8cjZlrpCe7kIU8mOIu6BVFPQoQ79sWedaV6bowkB9GPZITlsFTDzQ1Fm6/YA2HIaCp5vUPirFmIFZApLzWcvcsMvB5mPXbPscFOj30kM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740476480;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=hxN3jzC16EMS8sC831bVLnOP4XuP4WpSvwKW+swAeco=;
	b=FjytpZCGsif3QEOHQ1KASwaCleYZdav6scWUhWRD+yPE1noWyGQLDrShlahM4A0b
	OaC4qhMQR8THggrduhzeu2bMctboZ+dCr04saTCOyQGicYqNdUB7OQSekF0qM+tULHr
	52q+RqJ+Sck52423LxGh6dkpAHc/iXGONdTEfYFE=
Received: by mx.zohomail.com with SMTPS id 1740476475018610.7472651019332;
	Tue, 25 Feb 2025 01:41:15 -0800 (PST)
From: Sebastian Fricke <sebastian.fricke@collabora.com>
Date: Tue, 25 Feb 2025 10:40:25 +0100
Subject: [PATCH v7 04/12] media: rkvdec: h264: Don't hardcode SPS/PPS
 parameters
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-rkvdec_h264_high10_and_422_support-v7-4-7992a68a4910@collabora.com>
References: <20250225-rkvdec_h264_high10_and_422_support-v7-0-7992a68a4910@collabora.com>
In-Reply-To: <20250225-rkvdec_h264_high10_and_422_support-v7-0-7992a68a4910@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, 
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Alex Bee <knaerzche@gmail.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>, Jonas Karlman <jonas@kwiboo.se>, 
 Christopher Obbard <christopher.obbard@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740476426; l=2525;
 i=sebastian.fricke@collabora.com; s=linux-media; h=from:subject:message-id;
 bh=VqNk0668C4194kJOyR2Z8yV5w4cuXj1PlaUvbKsk8pY=;
 b=m1UyqA38qOz+K7beTtpG/BBwcRC3/ZrfgZq7IzC2iRe/7+kLH5bN57ni0aT6Y07PnuvxdkmHZzSx
 00c1GEF0A1IKqsVEKSIqDJzcejgqo6gWgS5HCbrQYQXWp3/Mg32y
X-Developer-Key: i=sebastian.fricke@collabora.com; a=ed25519;
 pk=pYXedPwrTtErcj7ERYeo/IpTrpe4QbJuEzSB52fslBg=
X-ZohoMailClient: External

From: Alex Bee <knaerzche@gmail.com>

Some SPS/PPS parameters are currently hardcoded in the driver even
though they exist in the stable uapi controls.

Use values from SPS/PPS controls instead of hardcoding them.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
[jonas@kwiboo.se: constraint_set_flags condition, commit message]
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Tested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Tested-by: Christopher Obbard <chris.obbard@collabora.com>
---
 drivers/staging/media/rkvdec/rkvdec-h264.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec-h264.c b/drivers/staging/media/rkvdec/rkvdec-h264.c
index 7a1e76d423df55bd01c1ff26ff2c6d1b81ee7169..8bce8902b8dda39bb2058c8504bd52ccae6b4204 100644
--- a/drivers/staging/media/rkvdec/rkvdec-h264.c
+++ b/drivers/staging/media/rkvdec/rkvdec-h264.c
@@ -655,13 +655,14 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
 
 #define WRITE_PPS(value, field) set_ps_field(hw_ps->info, field, value)
 	/* write sps */
-	WRITE_PPS(0xf, SEQ_PARAMETER_SET_ID);
-	WRITE_PPS(0xff, PROFILE_IDC);
-	WRITE_PPS(1, CONSTRAINT_SET3_FLAG);
+	WRITE_PPS(sps->seq_parameter_set_id, SEQ_PARAMETER_SET_ID);
+	WRITE_PPS(sps->profile_idc, PROFILE_IDC);
+	WRITE_PPS(!!(sps->constraint_set_flags & (1 << 3)), CONSTRAINT_SET3_FLAG);
 	WRITE_PPS(sps->chroma_format_idc, CHROMA_FORMAT_IDC);
 	WRITE_PPS(sps->bit_depth_luma_minus8, BIT_DEPTH_LUMA);
 	WRITE_PPS(sps->bit_depth_chroma_minus8, BIT_DEPTH_CHROMA);
-	WRITE_PPS(0, QPPRIME_Y_ZERO_TRANSFORM_BYPASS_FLAG);
+	WRITE_PPS(!!(sps->flags & V4L2_H264_SPS_FLAG_QPPRIME_Y_ZERO_TRANSFORM_BYPASS),
+		  QPPRIME_Y_ZERO_TRANSFORM_BYPASS_FLAG);
 	WRITE_PPS(sps->log2_max_frame_num_minus4, LOG2_MAX_FRAME_NUM_MINUS4);
 	WRITE_PPS(sps->max_num_ref_frames, MAX_NUM_REF_FRAMES);
 	WRITE_PPS(sps->pic_order_cnt_type, PIC_ORDER_CNT_TYPE);
@@ -688,8 +689,8 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
 		  DIRECT_8X8_INFERENCE_FLAG);
 
 	/* write pps */
-	WRITE_PPS(0xff, PIC_PARAMETER_SET_ID);
-	WRITE_PPS(0x1f, PPS_SEQ_PARAMETER_SET_ID);
+	WRITE_PPS(pps->pic_parameter_set_id, PIC_PARAMETER_SET_ID);
+	WRITE_PPS(pps->seq_parameter_set_id, PPS_SEQ_PARAMETER_SET_ID);
 	WRITE_PPS(!!(pps->flags & V4L2_H264_PPS_FLAG_ENTROPY_CODING_MODE),
 		  ENTROPY_CODING_MODE_FLAG);
 	WRITE_PPS(!!(pps->flags & V4L2_H264_PPS_FLAG_BOTTOM_FIELD_PIC_ORDER_IN_FRAME_PRESENT),

-- 
2.25.1


