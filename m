Return-Path: <linux-media+bounces-29068-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C96A76A5E
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 17:29:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2CCF73AE639
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 15:17:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAA9223AE7E;
	Mon, 31 Mar 2025 14:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WcJ7K/Bi"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398FF23A9B7;
	Mon, 31 Mar 2025 14:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743432950; cv=none; b=in8rixfJRO6QDz6HzMiGHIzf/wEZXP4v7Nm4fBC72OiGXK/szHZEjxUgDiSlsbQdiOX1P9KJPLrGt3dh/Iw42sXrg3fBzUU9tsl4HmG9c29UONhXhXYyZGZ55fH3Zr9ez9TD8evQnsDQvMc8XaN+xH43r2892l5uX9tVaGY30Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743432950; c=relaxed/simple;
	bh=uQFa8VPa77pMARASFQnw4YhBH/IrNw7QrbHmXyIPycs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RS2lVuY7C9Ok33kuDJZAdgBfRhfsYWcfiK57zB7Yn075r/5Et74GyfoTXT7UHvuQSpqBreQ8QlQreBDRv9BAmZ76QoJa+gOSFtqYLJdjmNREAZVUw2I5iHUI1prtlKA9wuQasseydCEnkvZbRlim0ctkAOVu1hZnwW+7kv1TjBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WcJ7K/Bi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBA57C4CEE4;
	Mon, 31 Mar 2025 14:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743432950;
	bh=uQFa8VPa77pMARASFQnw4YhBH/IrNw7QrbHmXyIPycs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WcJ7K/BiwAJ2Fzjb/RZEMiPpZVxhukRNHLxfik8Iy1dfmqaIC3yEH0zI4kNl/1to5
	 qvaXsAI3OsfqVF/tv55srLdV+6F19uk5a7vR4VzSXGeO15cvlgEM5Jd7UOZbpIkFtG
	 87/GiiObH8Efh4F1mk4Z+3IgRwMbLRZX5ayFvwze/XuXhXrqyesa1C9sEKNdekhmv9
	 EmoojQ0r3QjyrDN7NLUc0N005XiiV3moBzD57ANlMnvyoc4EMreTXquu+taX2KztxZ
	 Z4c/49ez/rTiCyJFkNsgQRSt4XabSipVmqLxcImL4Y9F8EQg/9Bh39rOmOWOmMK6nC
	 40LcvCeykDoSQ==
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
Subject: [PATCH AUTOSEL 6.12 18/23] media: s5p-mfc: Corrected NV12M/NV21M plane-sizes
Date: Mon, 31 Mar 2025 10:55:04 -0400
Message-Id: <20250331145510.1705478-18-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250331145510.1705478-1-sashal@kernel.org>
References: <20250331145510.1705478-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.21
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


