Return-Path: <linux-media+bounces-20812-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F099BBC25
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 18:36:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B84D1F231CA
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 17:36:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F0CC1CACE3;
	Mon,  4 Nov 2024 17:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="CIRF+EHc";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="DH/nCuB3"
X-Original-To: linux-media@vger.kernel.org
Received: from a7-47.smtp-out.eu-west-1.amazonses.com (a7-47.smtp-out.eu-west-1.amazonses.com [54.240.7.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C741BF7FC;
	Mon,  4 Nov 2024 17:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.7.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730741792; cv=none; b=PDxnvYzrKM+kvljEPjXIWy9Xn5WXtva3VTRhY4X5+pRU69ZccmDwSGelqBQ9vfytBz864jgry+NGil+OfGJ+/HJMWLXILRwciZ05CVV1DHFFd9v6mKMhLiDNMw1lyh3T6WcNH19L12FBekoQ/8jeI9BASi6SfU6T/0Tapt+BG1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730741792; c=relaxed/simple;
	bh=94hCjKcduiczE0wvCl6xthLzM/0FYi9pPwSy54aZqTE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bUaUCykZMtsecQPMqK8ctD2+zSZJGrU6RKhORKG8QBwyFWuaU/8z39RUexeTIfqkCpmMy0hacbuGKgeSkZHhkvMER+wTfGxZvlV28GIme+mrxXIgMQEzLNqBAt08GN+X6GgsdxEnQFOcMvVg2LOl07Cip1ipBpWLNbct3sY7C90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=amazonses.collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=CIRF+EHc; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=DH/nCuB3; arc=none smtp.client-ip=54.240.7.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazonses.collabora.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=bc7lryepznv65m6r2ewkpoafjt4fiq42; d=collabora.com; t=1730741788;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=94hCjKcduiczE0wvCl6xthLzM/0FYi9pPwSy54aZqTE=;
	b=CIRF+EHcEwNIw/ANsum1vtxx+H2IDK/YCvNYKDJDrkUQfsTOmUQ8l6dIoLcUJrIJ
	KslMazeP+C+PfURiTYnGbONdOqzDwgIXd8e8aB4FeHkcWwwnX8KDCjL6lxG70T3Dpc2
	mx+1dENZn/COUqKBAehzPeZIkeMV5acyWkUvokW38ks6pyKtNMRIs241S6c7yqsDoeb
	xZNqK3rYNrEjtLRxf6lbT4u6B8f4uwIopux0SMHonL2cey9ipbpXPfGb2oSy89ZDBvN
	ANnw5L1sOqbdWlnQSnV9FCYMG6lN4cQqsj/iix/WTHNiZJJOmlyorlqDhAffnlP0p5y
	clE9b1k65Q==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1730741788;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
	bh=94hCjKcduiczE0wvCl6xthLzM/0FYi9pPwSy54aZqTE=;
	b=DH/nCuB3vwJLFE12/fGQ4WwumN4pripTBf3lniasyiqUkd1ML/u62/haTeHNuMWo
	83R/2dT9Eoz+f3QE/MO35EG0GHiS4gmX2ZVhNtvdMsbHH3W7OyD72U3MxIyNDcoxjT8
	/9UW+VAC4vDjPuBeiURhLte9tiWyUAiUqIiOdYF8=
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de, 
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel@collabora.com, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH 2/2] media: verisilicon: Fix IMX8 native pixels format steps values
Date: Mon, 4 Nov 2024 17:36:28 +0000
Message-ID: <01020192f83fdef5-358ea072-9630-473f-9407-53be13d85864-000000@eu-west-1.amazonses.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241104173623.1058335-1-benjamin.gaignard@collabora.com>
References: <20241104173623.1058335-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.11.04-54.240.7.47

Hantro decoder non post-processed pixels formats steps are different
from post-processed ones.
Fix the steps according to hardware limitation.
Since reference frame pixels format issue has been fix, it is possible
to use V4L2_PIX_FMT_NV15_4L4 rather V4L2_PIX_FMT_P010_4L4 for 10bits
streams.

Fluster VP9 score goes up to 207/305.
HEVC score is still 141/147.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
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


