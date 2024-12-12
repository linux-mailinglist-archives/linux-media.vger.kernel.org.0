Return-Path: <linux-media+bounces-23336-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E5B9EED48
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 16:44:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E5492862DF
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 15:44:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BD49223C42;
	Thu, 12 Dec 2024 15:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="B/+IYlGn";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="Eq3LaYzv"
X-Original-To: linux-media@vger.kernel.org
Received: from a7-49.smtp-out.eu-west-1.amazonses.com (a7-49.smtp-out.eu-west-1.amazonses.com [54.240.7.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47357223324;
	Thu, 12 Dec 2024 15:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.7.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734018218; cv=none; b=ANak3+dIfVJYI6rDiwiNX2QNxNNhI+6+w/Bb263Qgfo11kjHNShj/w4Z2u8dQ5xgqLUlTKFq0FA7h5Z1RSsIX8zDIcJ/5AwsIofTBX5QDyAfVYvKmTOm5FNn71hMj/nGDqdAU3Y9wXaCs/KMXuTz+CooAi9rfAPjPBOCypvuAV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734018218; c=relaxed/simple;
	bh=8Fq/subTP6OO1nFEyLaHcjH8Zxi3BDFslEuxKeQeGq0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fYovOTp6SQigkKUX4hWUBj+3CUB+VEQUJlhIzvLq+wou3XCfHqEfY8UvA8HwzJzy/kqVI40MtukxD6wHLh/hev/iqADjcdfolWf9JzkjWO9Lj+p40UepBXJ2t0Ws7LbO4QtHVCxObOx7PiH6Me0PRdBZlIyNqh1LIUgtGtonxdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=amazonses.collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=B/+IYlGn; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=Eq3LaYzv; arc=none smtp.client-ip=54.240.7.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazonses.collabora.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=bc7lryepznv65m6r2ewkpoafjt4fiq42; d=collabora.com; t=1734018214;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=8Fq/subTP6OO1nFEyLaHcjH8Zxi3BDFslEuxKeQeGq0=;
	b=B/+IYlGnJhURtz3JPDeBTka7Cxs3rRki0gGIaIzudp2gjGEM9QWMJsxHb02Ry4SA
	7LfLRq/T+JQQxuIFE0ezp7dpcua0cZd8ub7LZDHP7uCmoNBvbfmS03Sh6B3D7hh5/DB
	6tjh2c/ggnePRZgzstTrZOmoPowUaRe0XDFWbr07Pwy2w5vtEQC7cIV5ZFm6ZuAYOJB
	vf/kzZ5MYJpha7BJKgjT+CcZABoqQieXrm3uZdYMkxT7Mf8wDv+hcV2IY7Q0iVU9nwP
	dy79eJ/QrbawymfuLNkFlA6obl3ADM1WdWmh89UhIZj/9mG6RMDhplmnIQve/VQQFcs
	cPFlA3LBjg==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1734018214;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
	bh=8Fq/subTP6OO1nFEyLaHcjH8Zxi3BDFslEuxKeQeGq0=;
	b=Eq3LaYzvFoIM64DX1TWSZJ0EOfs7ITOhb8i6u1H1FTCrK0MniEqjNuaXXRCUXvck
	U1bvve0DQ29Tjwdz+WOX/UMxMrwdOFsSIx60sGGxocqmpeDIR9JfvKqYQd3vwqoxohp
	ny2LCm1PF/FTo48xUgevyLBq5VRc/vf4X3LQewEk=
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: p.zabel@pengutronix.de, mchehab@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH v2 2/2] media: verisilicon: Fix IMX8 native pixels format steps values
Date: Thu, 12 Dec 2024 15:43:34 +0000
Message-ID: <01020193bb8a2955-5c7c8665-b689-44bb-9119-b0e636e20840-000000@eu-west-1.amazonses.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241212154328.84904-1-benjamin.gaignard@collabora.com>
References: <20241212154328.84904-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.12.12-54.240.7.49

Hantro decoder non post-processed pixels formats steps are different
from post-processed ones.
Fix the steps according to hardware limitation.
Since reference frame pixels format issue has been fix, it is possible
to use V4L2_PIX_FMT_NV15_4L4 rather V4L2_PIX_FMT_P010_4L4 for 10bits
streams.

Fluster VP9 score goes up to 207/305.
HEVC score is still 141/147.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
Version 2:
- rebased on top of media-commiter/next
- Add reviewed-by tags

 drivers/media/platform/verisilicon/imx8m_vpu_hw.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/verisilicon/imx8m_vpu_hw.c b/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
index f850d8bddef6..35799da534ed 100644
--- a/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
+++ b/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
@@ -187,23 +187,23 @@ static const struct hantro_fmt imx8m_vpu_g2_dec_fmts[] = {
 		.frmsize = {
 			.min_width = FMT_MIN_WIDTH,
 			.max_width = FMT_UHD_WIDTH,
-			.step_width = TILE_MB_DIM,
+			.step_width = 8,
 			.min_height = FMT_MIN_HEIGHT,
 			.max_height = FMT_UHD_HEIGHT,
-			.step_height = TILE_MB_DIM,
+			.step_height = 32,
 		},
 	},
 	{
-		.fourcc = V4L2_PIX_FMT_P010_4L4,
+		.fourcc = V4L2_PIX_FMT_NV15_4L4,
 		.codec_mode = HANTRO_MODE_NONE,
 		.match_depth = true,
 		.frmsize = {
 			.min_width = FMT_MIN_WIDTH,
 			.max_width = FMT_UHD_WIDTH,
-			.step_width = TILE_MB_DIM,
+			.step_width = 8,
 			.min_height = FMT_MIN_HEIGHT,
 			.max_height = FMT_UHD_HEIGHT,
-			.step_height = TILE_MB_DIM,
+			.step_height = 32,
 		},
 	},
 	{
-- 
2.43.0


