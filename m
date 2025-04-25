Return-Path: <linux-media+bounces-31071-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D37A9CCA2
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 17:18:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A671C1BC161A
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 15:18:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F2E3289341;
	Fri, 25 Apr 2025 15:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C0cJk+u6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1A227BF8A
	for <linux-media@vger.kernel.org>; Fri, 25 Apr 2025 15:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745594261; cv=none; b=MikmLK5uYyuveIC8jcRSZsUua+GG8meViUHxFgwe5ovQVVr+YnKMETvaDSrXL5um+0EShut/fohLE/kRdsljPvBAaH3lTPMmbrdtrszpWSYv0rU8Z5Jot3KKFvn5VbaLT1NeP1jV145r/tI5RVsGvsQIt1K08EU2GwkXXVMKGPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745594261; c=relaxed/simple;
	bh=RCuNB1mWMaNtm6vRmUVv+04+d3pPrJBXIRhX6cDQxkA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y1suCJMAeGPMpHSgBJ7u9pP/JsiKPXYI1ZKR4CqcUG3Ua4Yksi36kRSLg4ZkQeArKAY2sColr7kxLBWRa4st0Lm1M8aFu+OwOkxqFiTuEpYH4HtqIurqEZfRgZ/KVXSixfP93k8BjBE3ylHFGNyQlO1mNIs0Q80iJ8K3t/gdEl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C0cJk+u6; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39ee57c0b8cso2576999f8f.0
        for <linux-media@vger.kernel.org>; Fri, 25 Apr 2025 08:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745594258; x=1746199058; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6kN1pqjjlFC9p10HbXmb8Vy14EP3/K2zpEgAzkFrOXk=;
        b=C0cJk+u6wKgZlij7qW2k+jqesGAdJtTGKxvwSiqbDhvY93GL8JNmV6pdlEPX6EX6mo
         C/bsI6+kuASnlE4yHnqmT+MhOeWRvBiuxTMY3uJydLoLYYOt1vNxd4Ehc5gYHD6dug1+
         S6gTsb2YCPANbeNqDWPUt3dSVQqEJTMkZQ9mXU6PQXA+Xl0VYtOgyA5d6vy8B0P7YJvM
         YMsgDomY5rDybilnF1hXi0WyQSJ48kmS2+ryMtZC7jK8FYpbdlsdJzugB7YCunZ+xwxl
         oxcKGnWLFEWlibiTf2gWCDYIRQyzbEujglgKCCy9v0pkvsM4iMUcLy4hmnZSwp5TjIbs
         y6CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745594258; x=1746199058;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6kN1pqjjlFC9p10HbXmb8Vy14EP3/K2zpEgAzkFrOXk=;
        b=oIjcAIjPOdh/Fga6Q7qIG4s9+lKeW5NW4BsplZ7dm4xajuAIaVx+vsK/RBrNVxnTE6
         A+wTZtB+q9sxuG/UFd9zQk1kygweV3lCssnQQC0kjVfO3Jsebp3YEID6PlDIWjYla62M
         b1eeue8A/Vvp1oYT6WdfRReV388SUY49+r/A8wJfqgSlSeDXfjh/XijI/O0BMJ2IfxVq
         Da8+j+5mwz8BCX6ONXGrVQHBRhPXBevpVB7vG32DhoI/AvPvN466hWvtVZqhm4kL3B1h
         Oa/o6COtK6IYdpODDMAkQVTd4m643yMLyAQ7r/U6X8Klj8aASkQ2pSVcwGf1ZQ8prSSt
         djYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyoDSQkjudktyO1D99Nje1wS1PLUkdZXxy5gsAAUhJj255jq0RX2AsjAt4Rb65faWI4VKoBAC/fgfk5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQQAU1jzoarPyOZo0VBibGlgVjpSw3WBu4B4MaOUk3pTijqXYX
	8MLzatgwjGvZrcRfVnu7cvuskOQu7KvGR0bOhrgHtqmTgKX1ThQswRdvJShTMXY=
X-Gm-Gg: ASbGncu+SH+JYkzXSimmMNTzP1afVAkHb6BmDJnGRFYIC8aXv5NZ3OjyhAY8uVupb/E
	Za2wo0HSK+EcqtY8P7K0wcg9lilGRwEI/TPRtyFFFLjYndvJofF0O4dz0cT+fhCjqk0745wUvKy
	Pko0ppnQE1gDKAB4OhiWauBhU1I+JAsRg1iW3y2HrokmhXmMI63Mb18YNGkMzTyoUbngtQdTKQx
	TN7q0px3EkGEN2HgyxUtxrM/Zlx9GiP3zDrpzKEiMLLY+PeiI34+BKkRlhOqBOtPW2XHZSWhr7a
	OKPzikvE2Ky+zoIA61gCZ2cKKInkW2GNfNv0rh+ADSFxABHWyCVR1nCtnkmsBioK8DMPPTl55ew
	jNAieHtdC4QPQj+tj
X-Google-Smtp-Source: AGHT+IGN+RHDl7/BuFfdgLAHL0b7Am5qHQ0n0MgkovWjVE1OQ+agiU9w6gC8KIXtJWW6FmzpaJuGpA==
X-Received: by 2002:a05:6000:2512:b0:39c:12ce:6a0 with SMTP id ffacd0b85a97d-3a074e2f343mr2335229f8f.21.1745594258028;
        Fri, 25 Apr 2025 08:17:38 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ccf44csm2684738f8f.60.2025.04.25.08.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 08:17:37 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 25 Apr 2025 16:17:34 +0100
Subject: [PATCH v2 2/2] media: qcom: camss: x1e80100: Fixup x1e csiphy
 supply names
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-b4-media-committers-25-04-25-camss-supplies-v2-2-8c12450b2934@linaro.org>
References: <20250425-b4-media-committers-25-04-25-camss-supplies-v2-0-8c12450b2934@linaro.org>
In-Reply-To: <20250425-b4-media-committers-25-04-25-camss-supplies-v2-0-8c12450b2934@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2290;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=RCuNB1mWMaNtm6vRmUVv+04+d3pPrJBXIRhX6cDQxkA=;
 b=owEBbQKS/ZANAwAIASJxO7Ohjcg6AcsmYgBoC6eOwOXeH0lYKHhF+lTvDG4t6nhCl0QYy0oAV
 bCggMDBR7uJAjMEAAEIAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaAunjgAKCRAicTuzoY3I
 Ou6vD/41SGFd4ePXcaWOmJgrpYHmL7CV7qsQ7IfQ+COvqTsQebM5Tm+69Ap+HXB10W9MN+yaRGm
 1dy7DhXLNgTdtB2/+fPSBoTsAjz9wSjOrAu1DnU72xd2JguWgChlZrJ4Z16A+HEccH2u1XDCWKx
 L/E3mXiB0g/1P8QaIZhaMPDwmanNeE7QFc0BK+dLqgVrYj5HTugxVe7Un/3r4i4fsDyVrSdh2VH
 +my/nfECy2zpMu4re9/RSdm9KrShlx3qxUyywJ+vuFWkNyBuxLnqW5r3ixkA55aifYhGHwtjhs1
 xBNvLK0F0OGFoiq/XyM5bCLBR5bHY6sGmr2t500AgYTGWC33x5CiY1FALzeaf20BbKULoM0oDu7
 6yQknBXDZmE4HrM2YYbJ+e9NMRi/Qx5TfKyxGRT23pxi7QsbFb88aXLRNnfrrCTbBrVhvwXLDRE
 /4elajNQTirYrnKzq6G1SLLRjc7zP9UF/pAuyeJoaWit/36F6Pr/oISYkaTbNFGz1V/0S0kLl2d
 0unOPHUA/SPwjNzH38bdTuQ/vImBF61Y3t4SUUw/dAU6KGBepTXclneovlPcZ4NGpGIkApnZvRE
 dnyB6oa85SQnAqg4jO33CVk4lUc4h8WC9FVIpiIQ0/VtnhKfHsE8SGVhB2dHJVXYmiH/8sMzIVY
 /iaBLFjLPMxZ7MQ==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Amend the names of the csiphy supplies to be specific to each CSIPHY thus
allowing for the case where PHYs have individual or shared rails.

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


