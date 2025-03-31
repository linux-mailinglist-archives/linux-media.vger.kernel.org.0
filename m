Return-Path: <linux-media+bounces-29066-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD54A769B4
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 17:16:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5BCDC18901E3
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 15:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B142F1DF75A;
	Mon, 31 Mar 2025 14:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uEo3XeCZ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199872309B3;
	Mon, 31 Mar 2025 14:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743432899; cv=none; b=PKy3p8Mn18SOdKHhxC8u1xmJ7unwpxBC1h/9L89m8DpQOjnIHFYVqnOdQLZnfQb8ooo9hvpUkdRTgCExK5TqqqtAyLaM+Af8DY7zLZ2ryaHIAJovw7P2Dn1AYQu7xcxW1/sNLhODbZ7Qunjx/dz6ymLy9TALFXO2DtkNk35mZeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743432899; c=relaxed/simple;
	bh=uQFa8VPa77pMARASFQnw4YhBH/IrNw7QrbHmXyIPycs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=E43ewS6kEddrtop0aHSLaVHqyqNY8/QlcCaMAnxZXHxbWjQA1jERNOU2NblR8GMs1THQefAWA4ZEiK/Fiq+Jv93M4+SlLJHZgYN/hj59rbcBplJ+OTEhT6O8q2JGOL+iZDRQ8xvuDEJ8QLvFm44jEj/31vRcdmjW4M3kEPxG16g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uEo3XeCZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B59C7C4CEE4;
	Mon, 31 Mar 2025 14:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743432899;
	bh=uQFa8VPa77pMARASFQnw4YhBH/IrNw7QrbHmXyIPycs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uEo3XeCZJoH02rQfCwc4vZMxEMa+/2M9AOP1vOrnVtVxUEDZbVTrYLN+xlT6n5peQ
	 c2laTtrcvtfbDg9B79pNeM/HZAOkzTwCTSTy5DYqjBWmQPWJlSq1BelP2Xw69i1VW/
	 x92454ZBZvMopaa/PB9YJw50PAD5DL/yAnvUQizTT00PdM7rjBDmDz4vMSjH26j54a
	 WM/pc7bdAiFbirpw/QI4YHbeF62H7/jrDLpIkR+flvECYHBPNwDU3zYSBAYckVp2XA
	 4WtmTbnMNc8WBJZoWxSw+gWFCHDikpVkqPWUDrP+TRNb3EnNuEH33Dhp0E4bsrWsLZ
	 sr+CJG891X8+w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Aakarsh Jain <aakarsh.jain@samsung.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sasha Levin <sashal@kernel.org>,
	andrzej.hajda@intel.com,
	mchehab@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.13 19/24] media: s5p-mfc: Corrected NV12M/NV21M plane-sizes
Date: Mon, 31 Mar 2025 10:53:59 -0400
Message-Id: <20250331145404.1705141-19-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250331145404.1705141-1-sashal@kernel.org>
References: <20250331145404.1705141-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13.9
Content-Transfer-Encoding: 8bit

From: Aakarsh Jain <aakarsh.jain@samsung.com>

[ Upstream commit 7d0d0b2342bebc47a46499cdf21257ed1e58c4aa ]

There is a possibility of getting page fault if the overall
buffer size is not aligned to 256bytes. Since MFC does read
operation only and it won't corrupt the data values even if
it reads the extra bytes.
Corrected luma and chroma plane sizes for V4L2_PIX_FMT_NV12M
and V4L2_PIX_FMT_NV21M pixel format.

Suggested-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Aakarsh Jain <aakarsh.jain@samsung.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c
index 73f7af674c01b..0c636090d723d 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c
@@ -549,8 +549,9 @@ static void s5p_mfc_enc_calc_src_size_v6(struct s5p_mfc_ctx *ctx)
 		case V4L2_PIX_FMT_NV21M:
 			ctx->stride[0] = ALIGN(ctx->img_width, S5P_FIMV_NV12M_HALIGN_V6);
 			ctx->stride[1] = ALIGN(ctx->img_width, S5P_FIMV_NV12M_HALIGN_V6);
-			ctx->luma_size = ctx->stride[0] * ALIGN(ctx->img_height, 16);
-			ctx->chroma_size =  ctx->stride[0] * ALIGN(ctx->img_height / 2, 16);
+			ctx->luma_size = ALIGN(ctx->stride[0] * ALIGN(ctx->img_height, 16), 256);
+			ctx->chroma_size = ALIGN(ctx->stride[0] * ALIGN(ctx->img_height / 2, 16),
+					256);
 			break;
 		case V4L2_PIX_FMT_YUV420M:
 		case V4L2_PIX_FMT_YVU420M:
-- 
2.39.5


