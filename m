Return-Path: <linux-media+bounces-27162-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D78CEA47C7D
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 12:47:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E01A116B5C5
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 11:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C1C122B8D7;
	Thu, 27 Feb 2025 11:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WrfOY8eA"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BA72206BE;
	Thu, 27 Feb 2025 11:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740656850; cv=none; b=akyMUl0r30eshR//fhvqMR1XAwvYHiLwAHttXekUb56ByyfPf42a/Q2igAPooKGsg0UlxGAFs5p1ARjA+geEjhEMXqMHnmJUN6Qcf6sVx4yVZYAyh4ObM12K3yhAwdxn7gLsWDDLdhATE7eEfZ0F8vvezhO+esHug6F4fBvVrH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740656850; c=relaxed/simple;
	bh=ZMtBQPd4FzhfOHdAq6GWMwplFQzrNJIKsTRatQkysMg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jHfmOp0kzfbgQBNeiLuOyAu0yLoYZSEiNBzQlYnE8mUyojyJkZLoe7Wv79EwnzR1zbEDslYiIWS18SUSdu+SctCyzITQTBhDW3oXrfO8qAP8OHiBo8ocPrGR3Upzp6cIQX8aMzRsvxD/PfBalrK+MNVF2XKur2F0wX2qrfVa8Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WrfOY8eA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:a3f5:6799:2ce9:5b66])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 219757F5;
	Thu, 27 Feb 2025 12:45:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740656759;
	bh=ZMtBQPd4FzhfOHdAq6GWMwplFQzrNJIKsTRatQkysMg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WrfOY8eAN6//OTBhu3YmHBaQHHnd6K7fP80Uf5lGh1eAnoiNPebMw8JPai2n30yuf
	 dx3Rpz0+2sNYuDtO573n4+1SnwYUhqdCK19mm6UtYt8vnImVAhHN+UfoC52qwnaG/s
	 cqlHsK8BNx8+TlJNCDyjBIV9gQiy6zZ0qCuVk+38=
From: Stefan Klug <stefan.klug@ideasonboard.com>
To: linux-media@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Stefan Klug <stefan.klug@ideasonboard.com>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] media: rkisp1: Fix the quantization settings of CPROC
Date: Thu, 27 Feb 2025 12:45:00 +0100
Message-ID: <20250227114558.3097101-3-stefan.klug@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250227114558.3097101-1-stefan.klug@ideasonboard.com>
References: <20250227114558.3097101-1-stefan.klug@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the imx8mp the Image Effect module is not supported. In my case the
effect variable had an uninitialized default value of 0x700 leading to
limited YUV range in all cases (effects were never touched from user
space). The effects configuration is as far is I understand completely
independent of CPROC. Completely remove that check. This fixes full
range mode on imx8mp and possibly others.

Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
index b28f4140c8a3..8d61e21ad475 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -764,11 +764,6 @@ static void rkisp1_aec_config_v12(struct rkisp1_params *params,
 static void rkisp1_cproc_config(struct rkisp1_params *params,
 				const struct rkisp1_cif_isp_cproc_config *arg)
 {
-	struct rkisp1_cif_isp_isp_other_cfg *cur_other_cfg =
-		container_of(arg, struct rkisp1_cif_isp_isp_other_cfg, cproc_config);
-	struct rkisp1_cif_isp_ie_config *cur_ie_config =
-						&cur_other_cfg->ie_config;
-	u32 effect = cur_ie_config->effect;
 	u32 quantization = params->quantization;
 
 	rkisp1_write(params->rkisp1, RKISP1_CIF_C_PROC_CONTRAST,
@@ -778,8 +773,7 @@ static void rkisp1_cproc_config(struct rkisp1_params *params,
 	rkisp1_write(params->rkisp1, RKISP1_CIF_C_PROC_BRIGHTNESS,
 		     arg->brightness);
 
-	if (quantization != V4L2_QUANTIZATION_FULL_RANGE ||
-	    effect != V4L2_COLORFX_NONE) {
+	if (quantization != V4L2_QUANTIZATION_FULL_RANGE) {
 		rkisp1_param_clear_bits(params, RKISP1_CIF_C_PROC_CTRL,
 					RKISP1_CIF_C_PROC_YOUT_FULL |
 					RKISP1_CIF_C_PROC_YIN_FULL |
-- 
2.43.0


