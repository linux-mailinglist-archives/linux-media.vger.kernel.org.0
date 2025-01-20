Return-Path: <linux-media+bounces-24965-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CBBA16D1B
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 14:13:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B15B93A48D0
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 13:12:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29F0C1E0B62;
	Mon, 20 Jan 2025 13:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Gx+e0m21"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041011E2849;
	Mon, 20 Jan 2025 13:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737378701; cv=none; b=kgGUYZFMZXw66hDvwLhzR6QoMnrg5o2yGXJ+EPyvH7F01+CRDqj0ycrYdBEE1/3eKz/eaHrd2Xsf/7mck1+HjzNJ9OR1QxwB5NKAJw9TQLIPEDPt/222Ajn1r7rAVhUjVd0ETW2zq33kOih1OVIZ7Mu+cxXOjTjyh2tUbuxujl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737378701; c=relaxed/simple;
	bh=BjZpjYpEImADkqmU9fCdV5ag2Un9S02MUkMa7EiNmvY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HYjWsrmhVUZHxmlySEpkjJsXqnGk2vdrdVQiEbkSZxypaxkMs5sQpHI+EJzAdyej2AJd0KX92jatjzgwj8Cx36FZe8U0LC9DgFIgu12Y0WSdBp+oi59YDQO+Loe6aGM++CTjf7MQuHvC1IDYY2TwlJ2dKK4We5KL/fNxUjFX//8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Gx+e0m21; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 21EC811B3;
	Mon, 20 Jan 2025 14:10:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737378625;
	bh=BjZpjYpEImADkqmU9fCdV5ag2Un9S02MUkMa7EiNmvY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Gx+e0m21L0kMw7EXFAKTpDXTKO9gBDBknoDJqCeNiGlxqoaBuG5V6ZWMiW17PFiW0
	 FZXZnI+t7y/3/5SRqcv8N3BLurW7gHTx9E3ZqZaixFxlmBM7yD/9ZdFaKoqjaOuXyh
	 Jy9HYvAiW6z1WD98Nk+mk/WL+dwWXF6Q/P2VedXU=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Mon, 20 Jan 2025 15:10:38 +0200
Subject: [PATCH 05/10] media: rcar-vin: Use
 v4l2_subdev_{enable|disable}_streams()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250120-rcar-media-impro-v1-5-043823c3893e@ideasonboard.com>
References: <20250120-rcar-media-impro-v1-0-043823c3893e@ideasonboard.com>
In-Reply-To: <20250120-rcar-media-impro-v1-0-043823c3893e@ideasonboard.com>
To: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1231;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=BjZpjYpEImADkqmU9fCdV5ag2Un9S02MUkMa7EiNmvY=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnjkt5mZUbGiVDLMYkk52gAT41iQG2L1ylu5z1y
 b5lJReNAfKJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ45LeQAKCRD6PaqMvJYe
 9fNyEACHxvjAUoK9xoJvdPB6YJziJqb1iyiJt61cXSzck/nP5gi45CxlmGamL38t/HJ7rl+xSkZ
 KM0JNwuZ6ZnAbgvHzNOAUxx1MbTwGRg44G3t97I3QFheCn6aNWkrLXNlwW79xYyJKgGKlmYTmpY
 q6yENDtQdPUyw3i9HXs4Rvoy8QbVh4JB80ogYxXxeBwm9utQQ7e9EvOBkc+jFb7JjNHN4oOb6EI
 6SIVgtVbJKC2IV7ld9LJqoGmsOky9m6p6WxDHATl2YNoztWVCxjUEcjzBIWBVzv8tYaU0DE8k2I
 mnUXFScqAAfXLufjGUyoA7PPyju0H0iRKilShrIW10NJNfgVuH962WLr/1ns5/aFozZNJ6Zvcm2
 fToTMISAohTdst4tiqDdSiZ8jtBLChCuBWu4hYhrE5UyjBAl6GDtrEAOjtbX+dK1xFi/gNnBQ2n
 zoH1x1GMKuvy3N0mJKU8h1T0IfzqZF1Szs4j3g41fZkGwZ5pY6U+pm0FqbMPoPLgWNlstsanwMn
 BRQZZLGnfI0kC18fQZK7xt+R0kN5pfeh3rg1eV41LYxGALKhNF82bem/Ox+HsgTksUtg6itJMJn
 El4NIWE+YSSxV+oLPtp5m9epyQ1lgSZA4EY5jvTVBCkZt2tc68c+sC/Zu+FHyMyoR94T3my02X0
 nRHP9+aWcDQKpyg==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Use v4l2_subdev_{enable|disable}_streams() instead of calling s_stream
op directly. This allows the called subdev to drop the legacy s_stream
op.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-vin/rcar-dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
index 8773998101ff..8de871240440 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
@@ -1397,7 +1397,7 @@ static int rvin_set_stream(struct rvin_dev *vin, int on)
 
 	if (!on) {
 		video_device_pipeline_stop(&vin->vdev);
-		return v4l2_subdev_call(sd, video, s_stream, 0);
+		return v4l2_subdev_disable_streams(sd, pad->index, BIT_ULL(0));
 	}
 
 	ret = rvin_mc_validate_format(vin, sd, pad);
@@ -1408,7 +1408,7 @@ static int rvin_set_stream(struct rvin_dev *vin, int on)
 	if (ret)
 		return ret;
 
-	ret = v4l2_subdev_call(sd, video, s_stream, 1);
+	ret = v4l2_subdev_enable_streams(sd, pad->index, BIT_ULL(0));
 	if (ret == -ENOIOCTLCMD)
 		ret = 0;
 	if (ret)

-- 
2.43.0


