Return-Path: <linux-media+bounces-39744-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1076FB2428E
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 09:24:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 760427B6E5C
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 07:21:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1470F2D978B;
	Wed, 13 Aug 2025 07:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WFuj2sPg"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89D92EA149;
	Wed, 13 Aug 2025 07:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755069688; cv=none; b=DGlzNR3bcK+3L39BCRZoXzXHmspOmHiDgjk4tyiX4w1BIC3mK3HCPMNFL0R8c4FXxIsaMUBlpiwJQVcvnKZB/I+K9xbUtOGrThl6xtJS5lDgZE5Y2h6Mkw+bjQuUfepOss/XG34JNWtqUiaWR+TOUPEJV9UEWyLRBh2H9Htk5Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755069688; c=relaxed/simple;
	bh=z2tpeqsxhyoVQjGXPJFWvDTUNx8Ap3EwlbioBfoZZpc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cRzuZpSOPR/MR4LbhnrDSnqwiwGHORefwk9NGQ2svtUhfn5U//KPXeVzT+jJclZwwhNDQ1yWdcIFTOJ+8pNWzspqiZeFAsrvba65Q6ETsTF8AFL4gh4IwwjNUzzhS2N9RD8JZHKtwl1j0frlf0CeRQE54aUlabhm2EEFF8EDY/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WFuj2sPg; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:bd1a:669e:3dcb:5a6b:a905])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 07946351;
	Wed, 13 Aug 2025 09:20:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755069632;
	bh=z2tpeqsxhyoVQjGXPJFWvDTUNx8Ap3EwlbioBfoZZpc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WFuj2sPgXjVoq9j7Tkgkdam4TS4LdJt/iHB5xf8dtm7nIqHpTvzL+5EGBW3OjGiN+
	 ixfnBy0jYYyW3Q6jva1Ette0/olgxNbVTlNBKFA6uhvaQqxdcoy8FqBtfD+g4OJWnx
	 oHfVXAd09tS4uHVFKqk0CSAFkKyvYbpyFzfl8Be4=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Wed, 13 Aug 2025 12:50:35 +0530
Subject: [PATCH 4/6] media: imx335: Update HBLANK range on mode change
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-imx335_binning-v1-4-a42b687d8541@ideasonboard.com>
References: <20250813-imx335_binning-v1-0-a42b687d8541@ideasonboard.com>
In-Reply-To: <20250813-imx335_binning-v1-0-a42b687d8541@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1103;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=z2tpeqsxhyoVQjGXPJFWvDTUNx8Ap3EwlbioBfoZZpc=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBonDzY91XLhzok2sxV8VpmN7XgPUmmvW9mpwKC+
 mUll7FZlLmJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaJw82AAKCRBD3pH5JJpx
 RXilEADCQUtgSyomtpkUPeCB1vTrbfEKgLJPjSwd5U4coNSseWyKX33w93lL4XAVX06/huifBj/
 +gtbh8f8S27ORxItm/0Q0z+Wj3WPcdXV3zs9OiotOqeb5UrdGLW0pKAp8WMPMqGOHl42DcSIXt5
 qwiGpq7xgS5zCVgW+XyHtlCe0FWBqW26vjKfQ3r0di071ElvWS7mWBdhXj9DKYAZmCUWlZLO3FN
 FgJSzdwg1SCWSfM6H2T+ZdDcn349FcT96U4jtlVvJ01uTp7MCVqBG+K6MX5d2UFco5JmSpAXHJv
 sQnt/CPPruec+Ps8ByiD/Bl0vnreWCSPDEBXdLnZRpcEKg3qh0cZVbSHy2Tr9Wmw8yJxX6wBtJ+
 58yFEuJ6QSaa2zoUls/ZelgaoWHBEYNIsWgYQOZz+OlpaDcT3b5wiUJqWJe7gSkzxZh9shtA+mX
 Yl9SGAHYLk385iLETsFSwTCROFR/aXvcQ5oiD8oLqX2e1QOCa7R7vdfYAkJBdqeEOyhZSfeivi6
 7aY5Z10LK1ScuwTx391pau6tP32xJwax8UMKrwyi3F7r6sjkF6VaHU+1gleRfnmy7QCOqTJrtwX
 951BQUZoB5SQH1uzSp+dEHLibJ09zQdYA7TpOvHVDnKxkM0wpNHrt3ydSRumKxxLI8fO4hbsEGD
 znnzwtX9xi6bMLA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

While switching modes, updating to a different value of HBLANK isn't
sufficient, as this is a read-only control with a single allowed value,
and thus hblank_min == hblank_max == hblank of the default mode.

So to correctly update the user-facing value of the HBLANK parameter,
which is necessary for correct framerate calculation, update the whole
range when switching modes.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/imx335.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
index dbf2db4bf9cbfd792ff5865264c6f465eb79a43b..c61a6952f828fd8b945746ae2f53f5517e98c410 100644
--- a/drivers/media/i2c/imx335.c
+++ b/drivers/media/i2c/imx335.c
@@ -485,7 +485,8 @@ static int imx335_update_controls(struct imx335 *imx335,
 	if (ret)
 		return ret;
 
-	ret = __v4l2_ctrl_s_ctrl(imx335->hblank_ctrl, mode->hblank);
+	ret = __v4l2_ctrl_modify_range(imx335->hblank_ctrl, mode->hblank,
+				       mode->hblank, 1, mode->hblank);
 	if (ret)
 		return ret;
 

-- 
2.50.1


