Return-Path: <linux-media+bounces-19101-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC469906CD
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2024 16:55:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3DA51B27B4A
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2024 14:55:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3FF01C8766;
	Fri,  4 Oct 2024 14:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="upnEP8i6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B150A1C7607;
	Fri,  4 Oct 2024 14:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728053256; cv=none; b=pqspuZ8syBX7xkvm0IQQsTKxzQB5yBBjlon6OYQ6MgLBHFfLDjkllzUq+wILKQh9C153cU+VYwPphOZB8Dyzqj2rhsPVkVM54/F282ZNKUo2vEXCUtxdX4LdBZBLvWAQEAFJqcQ5J0qKFdte9y9LyrigQnHtIqXwgZZqrLFJH88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728053256; c=relaxed/simple;
	bh=fYfSSOrKZmAiaAi47MtEcgYXH+Y8u5Bkiv3Y38PojcE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T882NLY7ZclP6viS60uVOYOXhc9lKsf+dBk8j06CvRKEAKYpDqQC8OcDZEmt54yrbBX5aw75PRH5JGCm+FEMwPW+bewrBy+Ga88ETgh1SbD5mmhkZ0XS4RK2ieysoSxzyWiRDSFLgCYvLEdLry8y7VgH6sRYLmgRd7QsMCRprqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=upnEP8i6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-156-87-48.elisa-laajakaista.fi [91.156.87.48])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D076415E9;
	Fri,  4 Oct 2024 16:45:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1728053146;
	bh=fYfSSOrKZmAiaAi47MtEcgYXH+Y8u5Bkiv3Y38PojcE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=upnEP8i6jIXLN2T99tOtnY54Xz46ijnV8KZvyXm8cANwh86xWcrtDgums5qHI41w5
	 x+v8kFCFx67Q22vg/JJbsRQxWHxfC0xQCySL+zyFwqZl+Ahpbcmkao7BgDyi8L7qPA
	 9FCB6p1R1GKGmwZTyJ77SQyeejy74t80HZYLcDbw=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 04 Oct 2024 17:46:42 +0300
Subject: [PATCH 11/13] media: i2c: ds90ub960: Handle errors in
 ub960_log_status_ub960_sp_eq()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241004-ub9xx-fixes-v1-11-e30a4633c786@ideasonboard.com>
References: <20241004-ub9xx-fixes-v1-0-e30a4633c786@ideasonboard.com>
In-Reply-To: <20241004-ub9xx-fixes-v1-0-e30a4633c786@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2061;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=fYfSSOrKZmAiaAi47MtEcgYXH+Y8u5Bkiv3Y38PojcE=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBm///vVbwmJr3aIzxht4ncPEG/GKFXkdOe3CaHg
 5ifB/ASQ4CJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZv//7wAKCRD6PaqMvJYe
 9dXFEACFziU37fwoItBA1M0f/fY6uIkX/y0O6HN6bUNT8aXjb/Cu7v4ExRNgjrgQMdOcQANRscb
 hFyNkNPp4ne7g+PRe9MVw5MkUidEZNdHKUp2MYfF6Ben32o2NPJJOXP4yilVzYlr3jCvN6KnmKD
 s/f7wgJCmkozibs8vaY/nmZgwTm+D0eXTLxnu8/QyrX5GYPMnbtJTkn+48HEQVCT+pi1aJMDZ7k
 L5uznwg7uwd1IubvsCgKB8djD51qtZ0ivx4DFHC/jnY1Yo2arQVc9qsRQPNF3Ya3xlf/wj7S9g5
 2XkQU0thYw8yX7Qkp3V0hSzBe6gpFhMzPMDFEyU7d70NColZ0oRZIUCg1TMjtFUAxxbsbgPuxww
 ZdCqva2pZfEISb9sy7qKCf2TWuh3LIRvxC4aNEvGSX46LTOySvLFpXxETGzJsFvL72IaRUR6I5a
 yai0ErcwYiB2V8aawdAjTRwLF9l5ft6PzsYE/Cm3waaLh8QCEqvrt6eSP0B/Vpe42Jmo5UpvSgq
 9UKw8Oy6EcasNO/4fl2lli3BMUnM+530mVLbnGBqv3ySr/yD7u/72Uefn7E/lL2wS2bL5A+ZPAG
 CuksTzjmtc69YFMTQwV8PGeL2vgZGSgpg7bzbr6kWAnC7PzZYGhCssOATfcK9BW+dNxOOYs2PB3
 kOW3kBaOHZjlfXA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Add error handling for i2c read/write calls to
ub960_log_status_ub960_sp_eq()

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ds90ub960.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index ab5330db4162..47990aa1f007 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -2977,17 +2977,22 @@ static void ub960_log_status_ub960_sp_eq(struct ub960_data *priv,
 	u8 eq_level;
 	s8 strobe_pos;
 	u8 v = 0;
+	int ret;
 
 	/* Strobe */
 
-	ub960_read(priv, UB960_XR_AEQ_CTL1, &v);
+	ret = ub960_read(priv, UB960_XR_AEQ_CTL1, &v);
+	if (ret)
+		return;
 
 	dev_info(dev, "\t%s strobe\n",
 		 (v & UB960_XR_AEQ_CTL1_AEQ_SFILTER_EN) ? "Adaptive" :
 							  "Manual");
 
 	if (v & UB960_XR_AEQ_CTL1_AEQ_SFILTER_EN) {
-		ub960_read(priv, UB960_XR_SFILTER_CFG, &v);
+		ret = ub960_read(priv, UB960_XR_SFILTER_CFG, &v);
+		if (ret)
+			return;
 
 		dev_info(dev, "\tStrobe range [%d, %d]\n",
 			 ((v >> UB960_XR_SFILTER_CFG_SFILTER_MIN_SHIFT) & 0xf) -
@@ -2996,20 +3001,26 @@ static void ub960_log_status_ub960_sp_eq(struct ub960_data *priv,
 				 7);
 	}
 
-	ub960_rxport_get_strobe_pos(priv, nport, &strobe_pos);
+	ret = ub960_rxport_get_strobe_pos(priv, nport, &strobe_pos);
+	if (ret)
+		return;
 
 	dev_info(dev, "\tStrobe pos %d\n", strobe_pos);
 
 	/* EQ */
 
-	ub960_rxport_read(priv, nport, UB960_RR_AEQ_BYPASS, &v);
+	ret = ub960_rxport_read(priv, nport, UB960_RR_AEQ_BYPASS, &v);
+	if (ret)
+		return;
 
 	dev_info(dev, "\t%s EQ\n",
 		 (v & UB960_RR_AEQ_BYPASS_ENABLE) ? "Manual" :
 						    "Adaptive");
 
 	if (!(v & UB960_RR_AEQ_BYPASS_ENABLE)) {
-		ub960_rxport_read(priv, nport, UB960_RR_AEQ_MIN_MAX, &v);
+		ret = ub960_rxport_read(priv, nport, UB960_RR_AEQ_MIN_MAX, &v);
+		if (ret)
+			return;
 
 		dev_info(dev, "\tEQ range [%u, %u]\n",
 			 (v >> UB960_RR_AEQ_MIN_MAX_AEQ_FLOOR_SHIFT) & 0xf,

-- 
2.43.0


