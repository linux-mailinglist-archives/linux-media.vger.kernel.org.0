Return-Path: <linux-media+bounces-26375-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EBFA3C08A
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 14:51:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 081791893221
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 13:51:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F11391F3D55;
	Wed, 19 Feb 2025 13:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BabW0SCV"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C711B1F3B96;
	Wed, 19 Feb 2025 13:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739972994; cv=none; b=JVJwszgNrI8+RI1dsonefHzJtwc0QBNiYuHMi8QV9N4P1Jylxk2vGP0MBXKBaZpg8bmwAtlGWIEqgI+xT1kD9FVFA/SP5XEfHwHSe8JtCSNFB3pM/73f0QxGDJB/P7RxFwes/MRM++b13ekKjm8ZLU3YmXlCSWB3s+pKC3CsB10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739972994; c=relaxed/simple;
	bh=bAh1et3ubU3RR5o1IhFws7s0RctF///TjTdS3EPINR8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oLwJ+W22DDclWZotiBMiCwaoz1+ZSEH/xr1BfjwUPO9ZSKqaROFXZo4nPpnsBPuoCBqHZv8tswGMNWo9viJa9IHjoWbW1K5gSo7Y8OQ0pirtf8uKf+HPThu2hqnSng4n/wN+niLx8iCaQqhWd2PzRedCxinjv5NLG4/4+uUCEOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BabW0SCV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F23FCD21;
	Wed, 19 Feb 2025 14:48:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739972904;
	bh=bAh1et3ubU3RR5o1IhFws7s0RctF///TjTdS3EPINR8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BabW0SCVyQOFe4TQwfYsMFxOfkFFa2w8Ts2Fkt/wDMzAKQ5wzU7DhbE3LXjx7hw2M
	 mivonXIQOKVWv7JObJJvjWBxOnV/yRZGIjL+KY25Dbeh7o4BvgF1GHotQtvHWagLs1
	 u18BHUK2eMRrqQw6IfAvjhGZdh8fVnN+Ot6gM468=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Wed, 19 Feb 2025 15:48:59 +0200
Subject: [PATCH 05/18] media: rcar-isp: Move {enable|disable}_streams()
 calls
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-rcar-streams-v1-5-f1b93e370aab@ideasonboard.com>
References: <20250219-rcar-streams-v1-0-f1b93e370aab@ideasonboard.com>
In-Reply-To: <20250219-rcar-streams-v1-0-f1b93e370aab@ideasonboard.com>
To: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-42535
X-Developer-Signature: v=1; a=openpgp-sha256; l=1795;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=bAh1et3ubU3RR5o1IhFws7s0RctF///TjTdS3EPINR8=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnteFx4eXYetGbYwLQyFQy/GbZOOCC92+Js0WUL
 tB2dgK7Td6JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ7XhcQAKCRD6PaqMvJYe
 9UQKD/0VuzwdREumypkCBpxCGGsk960IvdU3uEEB9G/Uq8pGiyZOpKuGFairOvZP95PfMpa+qV8
 CA1AFb36LUzYnEG/ecxok6G5qIv3nP7G2Qjmbs7TVULV9xvsyF9UDpTjdJN0AfbIcgX5W1/rG+s
 3RND8PFIttALGGo7kLdcjI1ndN6rbPTH7d7/xF+opvzud52A+xHtNcGuYjkLsWJCIgqQgvZlQaK
 TL7gX3l/SXqB+Bw3m1wAMleqcyRQjE/RuMT5Jpc1GUSLz62voKC0io4ypFzTKlxszPtymAUA6yc
 vHeope2SCFW5pwvqkyRCRocG/XUATNXDzSp1DJ+H8FcoZpumG/RncY7fAG04+Nh1kK+W2qV2+Ut
 auWXrAAd/zi1BhjGhWf/EDDg0msi3qU256dayKGdGjUhlhBbt6d5FmkgtLe2T2k1e6QZ2j3jdBD
 6dRIDTyvyChB+pZtaqb6g+N53ewNa+dc/UzT+61tGJzi8bmJN3MFzi+N9nByol63WGToVgtZ3P6
 GM8mh2nmz7Au5J/oZWcPOOySrKmuNkcyQ1HeKCEwefi/N/5GErumKStIQwoqjGZBdthaAIlgBNb
 dCrkLKhUKv24cs0hi6qfVM14xjmurPA/21+zhxosZJxC2tHnTgtIasz7FGTO+d0ML3MbwLk2IIw
 E6nHdA19hV1utYw==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

With multiple streams the operation to enable the ISP hardware and to
call {enable|disable}_streams() on upstream subdev will need to be
handled separately.

Prepare for that by moving {enable|disable}_streams() calls out from
risp_start() and risp_stop().

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-isp.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-isp.c b/drivers/media/platform/renesas/rcar-isp.c
index 46534a479201..8e222c9ec604 100644
--- a/drivers/media/platform/renesas/rcar-isp.c
+++ b/drivers/media/platform/renesas/rcar-isp.c
@@ -268,18 +268,11 @@ static int risp_start(struct rcar_isp *isp, struct v4l2_subdev_state *state)
 	/* Start ISP. */
 	risp_write(isp, ISPSTART_REG, ISPSTART_START);
 
-	ret = v4l2_subdev_enable_streams(isp->remote, isp->remote_pad,
-					 BIT_ULL(0));
-	if (ret)
-		risp_power_off(isp);
-
-	return ret;
+	return 0;
 }
 
 static void risp_stop(struct rcar_isp *isp)
 {
-	v4l2_subdev_disable_streams(isp->remote, isp->remote_pad, BIT_ULL(0));
-
 	/* Stop ISP. */
 	risp_write(isp, ISPSTART_REG, ISPSTART_STOP);
 
@@ -305,6 +298,13 @@ static int risp_enable_streams(struct v4l2_subdev *sd,
 			return ret;
 	}
 
+	ret = v4l2_subdev_enable_streams(isp->remote, isp->remote_pad,
+					 BIT_ULL(0));
+	if (ret) {
+		risp_stop(isp);
+		return ret;
+	}
+
 	isp->stream_count += 1;
 
 	return ret;
@@ -322,6 +322,8 @@ static int risp_disable_streams(struct v4l2_subdev *sd,
 	if (!isp->remote)
 		return -ENODEV;
 
+	v4l2_subdev_disable_streams(isp->remote, isp->remote_pad, BIT_ULL(0));
+
 	if (isp->stream_count == 1)
 		risp_stop(isp);
 

-- 
2.43.0


