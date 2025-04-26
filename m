Return-Path: <linux-media+bounces-31100-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECF6A9DDB3
	for <lists+linux-media@lfdr.de>; Sun, 27 Apr 2025 00:53:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 766EF17D76D
	for <lists+linux-media@lfdr.de>; Sat, 26 Apr 2025 22:53:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB5A02054E6;
	Sat, 26 Apr 2025 22:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p9H++tqx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F0520298C
	for <linux-media@vger.kernel.org>; Sat, 26 Apr 2025 22:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745707979; cv=none; b=h2zFYom7k4FT5bmvQYiZ98x+FQMRnnhEt6W4a/qizVXN0DMptA8VXxI4u+EBu6pykHBw8Dy1DP/LDkE3AbidCqeacSIzoyk30qRpsLX2lZNgrjcTkN1toJKs7qfYS3zLS7EHKRAdnXWVryLMcAmwEWttYU1KPyNQqto3hUTzk2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745707979; c=relaxed/simple;
	bh=oYplL3jPobyyiniSSfTJjwQu1XLn0TNVmd7ruWaqOYM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hVo4kcb6rDg5XSDlMKSQzDoDGsx9aNR+QHL5RgXVJBNry3QtpcupSYP6bzhtVcLl7L4LXQ22F+Isz1v1TDgPeJX4MLapVuzqra/wTJPiJDc9A41wdg6xBH0bzF/N+ljpP2zUyKe4IX7sESW4WegzRD9P8Z+HGkcPXRrPDm1y93s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p9H++tqx; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso32923155e9.3
        for <linux-media@vger.kernel.org>; Sat, 26 Apr 2025 15:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745707975; x=1746312775; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N6LtKoNqmDs4Z+HIuoUk2f/x6h6kSVKGtc+/GFYbvUk=;
        b=p9H++tqxFL9m9whM08V+6a4k4KREjO2+zZN4NlFWR8bwPTWXPrxuAj80TRyRieJxT1
         50XenNH+W+6+BIYUflT2379aU7V3t6eRwhC3cnEVjvy9CSUlpEcs9eSLFeVQhy5/uGQt
         KS5RKYu40mj1ZqA0FNnA2EVjQkNOu4N1wko/9+vgWDLkM+Foaz80MFbz1q31CFSICrfX
         Xzba7e8XAHwMnIKAWBtskl5xIGPAoTlyfEPGrAuz0Q9AqdQ2ksRiJC6SQpyiXd/p2FDq
         mNrUywlXlNydjz8/JVDlOvHrsvQOyt1VZLxFLqVzEQNWLLp5KSJZbhr84ICY/+eGGURA
         fN8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745707975; x=1746312775;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N6LtKoNqmDs4Z+HIuoUk2f/x6h6kSVKGtc+/GFYbvUk=;
        b=gO1t8ub3DUX4Ik+8xjuXRJJxS2efwnd45txdW5c7qTNezTH6keqyY3sFbJIy1U3Dxr
         PxZAY3md03eGaWvRGUeh1icE4OC36fy5Kwm07bTfRqBcTygsL0rlTfBKFo4RvTdmxbw2
         QxNNMBUNu11MHOd+vFi2IjfZi2gzRFniSeWeHWWKO+lCtvGPncAwL0eOzq058zpgBWxI
         6DFbaj/td2rxOXmH8k9I+ct8pTUv5qS2GCGK/+N3PROK1WDGvGuunWIvXTm0hmpt38xW
         Jxj/6OWFRmSlhEN1zS+nHOR/aApUS5D9LbQNO7joZFrRO3uU3TF4TPVXh3TbFV0+NUMP
         ylKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJFnVDd/D6+cgYBdX3HCZdjYccwmVDRQ/qHsPaoHbzNeLUbc7J7qFkFOQdIlK1VpjsUKlAX855VyA26w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1D0DcQrtbeIMEeM4LlpNX6fdqAs4Aic3be3ciu0KXef+sRLh0
	KkKxtLM4Q9HHYsFVn+LsU4tFV9LtBTIdm2amO76I/xvaCkAtMLPJXedd+b5gGZE=
X-Gm-Gg: ASbGncsRXtmsQiLvLHe1soqbVi987uLC0SEqXgENwGSof3dVsqRTjVIT8L3ZPGf0rMm
	4dU9FarDD8KQCt70jHz2mJM5rG2FFtbk094nL2pY+atZ3i2BqrqtndOi+DSEITeTXQOddYcR9w4
	+av7fxX+UeDPhMmzeqKqE59BRRpXVz8hS1AdCxY1DtTsi/Md9u5EFvuR6IZRFoXfTHgY+izDXvm
	773cfapznJrtnAj+XipgumYPOC77dq4boEGnGOPum4e+jvr7O0N8YPkp6vR3b95txNzuITj7c7l
	BM9lPvsd3TbmSZpXbTrqmgzwciAspNocqu48zTMRMVxtvP4VXqw8I40VPPBNU5uMi4xeuYYTEOi
	Kko1xNA==
X-Google-Smtp-Source: AGHT+IE0j8mPv59AzBlf2kAxr5g0Q4MWOONuW8h2Cclj9zghBul8Dp1QEHNZtY7j+qJgyMhYPjBBMg==
X-Received: by 2002:a05:600c:1c0a:b0:43c:f64c:44a4 with SMTP id 5b1f17b1804b1-440a65d8130mr60064745e9.8.1745707974767;
        Sat, 26 Apr 2025 15:52:54 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a53044besm75268915e9.14.2025.04.26.15.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 15:52:53 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Sat, 26 Apr 2025 23:52:49 +0100
Subject: [PATCH v3 2/2] media: qcom: camss: x1e80100: Fixup x1e csiphy
 supply names
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250426-b4-media-committers-25-04-25-camss-supplies-v3-2-19e5e72ffc3e@linaro.org>
References: <20250426-b4-media-committers-25-04-25-camss-supplies-v3-0-19e5e72ffc3e@linaro.org>
In-Reply-To: <20250426-b4-media-committers-25-04-25-camss-supplies-v3-0-19e5e72ffc3e@linaro.org>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dmitry.baryshkov@oss.qualcomm.com, loic.poulain@oss.qualcomm.com, 
 vladimir.zapolskiy@linaro.org, krzk@kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2400;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=oYplL3jPobyyiniSSfTJjwQu1XLn0TNVmd7ruWaqOYM=;
 b=owEBbAKT/ZANAwAIASJxO7Ohjcg6AcsmYgBoDWPBOCxFSreQZrtUEjh7dLM0Rmxby3OV11Taf
 QmclmdvSWOJAjIEAAEIAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaA1jwQAKCRAicTuzoY3I
 OgVID/YhzUaLC/bBcK3virA1DszuXr2fmiAcyqRUYKir4BK4P8sJSFZT7haT8XYKSkJpZKz7I6S
 R5HqXw0tBruvAyv7TQLDmiRkluX94N8fCLBdPHHsM9MMRrMz2uWMf/p3aOL7VQM1wy5yqAEFW1v
 SZ7OgX9XVZP6CLShS34gepIuSJWDBhG67Tqz9BybhudZnLeqYLSka/8xtW44Q/myudcGKX3TZPW
 L9L2SQAA/5H2ctAICPQrNlMCrfYX1oYrQojiQ+7O5+yFSBXWHSULdNRZ5HUSofYK8u5efvp5OAb
 Wz1OLzuRh0it7x9yxL1LOZYXNUT1BD3iQroGZjQeiaebxTLDV/2semhfJEppJ0EnoGilwWHAhsV
 pBU74jZaFp8VtzrU+3QHhhMkaEecPVOh9tTjuMm59zBhqaryq8jyCrLHSAIJzSDoliWVF3CLuCD
 7ZL+4iy1VetYFFbcnriYfWfimFqmcWRfmHdKqssTPFiODHyMHN0uPFx8PHsCAmisAk1ODNJyx/q
 5hVMldX/B30yeItvWeHxCCsLwk4Wir0UzN4ZcTfeA8iUwW+dAc8lK9tcFTQwTFaAfQvwrWRvsm3
 KhpTL9h0FlQAFaeOTp6+aJQxU5MAeNs1ZF2BGk8dZW/LPNMfX1IvRum9Bc/D/UsXfx27+etP50j
 w8Rg0RQAyppUJ
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Amend the names of the csiphy supplies to be specific to each CSIPHY thus
allowing for the case where PHYs have individual or shared rails.

Dropping the extraneous "-supply" postfix is not an ABI break as there is
no upstream dependency on this.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 06f42875702f02f9d8d83d06ddaa972eacb593f8..d63bc7dc951690132e07ee0fb8df7cef9b66927d 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2486,8 +2486,8 @@ static const struct resources_icc icc_res_sm8550[] = {
 static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	/* CSIPHY0 */
 	{
-		.regulators = { "vdd-csiphy-0p8-supply",
-				"vdd-csiphy-1p2-supply" },
+		.regulators = { "vdd-csiphy0-0p8",
+				"vdd-csiphy0-1p2" },
 		.clock = { "csiphy0", "csiphy0_timer" },
 		.clock_rate = { { 300000000, 400000000, 480000000 },
 				{ 266666667, 400000000 } },
@@ -2501,8 +2501,8 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	},
 	/* CSIPHY1 */
 	{
-		.regulators = { "vdd-csiphy-0p8-supply",
-				"vdd-csiphy-1p2-supply" },
+		.regulators = { "vdd-csiphy1-0p8",
+				"vdd-csiphy1-1p2" },
 		.clock = { "csiphy1", "csiphy1_timer" },
 		.clock_rate = { { 300000000, 400000000, 480000000 },
 				{ 266666667, 400000000 } },
@@ -2516,8 +2516,8 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	},
 	/* CSIPHY2 */
 	{
-		.regulators = { "vdd-csiphy-0p8-supply",
-				"vdd-csiphy-1p2-supply" },
+		.regulators = { "vdd-csiphy2-0p8",
+				"vdd-csiphy2-1p2" },
 		.clock = { "csiphy2", "csiphy2_timer" },
 		.clock_rate = { { 300000000, 400000000, 480000000 },
 				{ 266666667, 400000000 } },
@@ -2531,8 +2531,8 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	},
 	/* CSIPHY4 */
 	{
-		.regulators = { "vdd-csiphy-0p8-supply",
-				"vdd-csiphy-1p2-supply" },
+		.regulators = { "vdd-csiphy4-0p8",
+				"vdd-csiphy4-1p2" },
 		.clock = { "csiphy4", "csiphy4_timer" },
 		.clock_rate = { { 300000000, 400000000, 480000000 },
 				{ 266666667, 400000000 } },

-- 
2.49.0


