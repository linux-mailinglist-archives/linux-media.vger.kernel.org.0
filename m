Return-Path: <linux-media+bounces-32395-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB31AB56F6
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 16:24:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 377411899800
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 14:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CD9A2BD009;
	Tue, 13 May 2025 14:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vs5/NShG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEAE02BD017
	for <linux-media@vger.kernel.org>; Tue, 13 May 2025 14:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747146247; cv=none; b=lL+kbaCHy5KkXEjn4hlFHDdh4rrQOuVFM2AzcCLY3iVAU2ba3LS3Z8TiaDBgjvVQBtmI8a8z4e2IsTyxUZE4XBfIrM/rsco/s4ITnQsno9MSg28EK7pts+s5ARwm3BPOq9yKp9CRUtN50NS76Tf+hFzwbphWiH1Aq9pbOc3Kouk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747146247; c=relaxed/simple;
	bh=1dbZKTa/g+MzsnzTQFCT1jdM3evL1vIx93omGHH0mS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JMw9GtT1a3Twmc5SH2dE01RgE8+cPnLnoWkLMFmjT40RjvP6LnqKAvpMq2KvkSoj/PLPChN9NvWURY51erBbQLjOH+ANTigHP2LeeTdnaWNu6Zvc/amqLz3uoXDTUg71Ohb92Z8eYvPsJXwJpaEQw4+YxXRr2i7mvv5ZRxCYqeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vs5/NShG; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54acb0a5444so711606e87.1
        for <linux-media@vger.kernel.org>; Tue, 13 May 2025 07:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747146244; x=1747751044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FLyQNl/IfprA8mrvUU0qzCD9YVX1jlfRaaDTODi+QbM=;
        b=Vs5/NShGV04HpSXCK/5zy/JjMa9blTs5UiwgGyiEK1kvBWF/aTzhATN5kAGKAy5H7V
         bkGZVDaoz0zKMABDVh43J4iQiKbee1mKP/+XNbsv2dtmgCV4xLSdiTo+uLQi6J1Cq8Kt
         88xNudE8lFtgC6163eAFf/Diblf/r0zyz6Ll1YYaLwk5mGfBjzxiLizcPZOy60zyDLgL
         r6/+AsJ0gHTxd47sqHEy8ReEEuSXEbTC6C6tK5ymH0o0Xe68Q1gnhiv57ZcJVzzMClYQ
         R4cJlwbtthIJj8qUUdjdsWwTHPi1XN5Md93CARSX3bl1x124R8RZHZIbm6wHLylWUkoE
         Huqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747146244; x=1747751044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FLyQNl/IfprA8mrvUU0qzCD9YVX1jlfRaaDTODi+QbM=;
        b=bASycW5GmoUAbmrr/16SWbUBrg6Adnf2j4EijrGQMoM3+SN4i4s8LTFZU3SPF6HAE3
         aTLQTbDx6IlHJATs/DKeoF0onxpMQuX7sTHopi/oy1+J4A5TakT0D/gMNWhIUiAuggL5
         ZolpVk1I6I2CLcnWsxjpTdzvnrwlU0BMo2Lo+gQ1bCG9GlyAuAUjOThK+iuKhUnn+hMc
         nd/MRs2XvlR3thz8ZoFo2wgkrul9QRQG+639d3zcL/SldwLYOGvGoVL+U3c0kj3Dml9D
         j4pK9HoKXMmXcW6zKb3mj0SF+6+XaMCDjB+dWLfqZSiBjz3q4zrwzZeLBoLRhjasMLxD
         oOXQ==
X-Gm-Message-State: AOJu0YyvfrBd+uiYUddT8nFq3gbDLzQ0d2w7ZTTiXwFsb7lSXom/zgAT
	jWDSckWKYVMJol4tmkNAQc4+2sdMv6MFeFZjKk4/riuXU7s+615HsuSyjkTSniI=
X-Gm-Gg: ASbGncsfBOG3qhFO6S7SMq8VJVHnSe4smBVy+ezU368qdLnbEAmFWiDvQV0k2vYoCJ8
	LxswfmIoMrpRdFcWjuT5DEyyd+LTpmBc2T3X9RLCHebL7nxboQbCK5C8L0Ze2DNjg0tC7qTfidz
	a+ateh9rxnnZ45lmBqvzNjFJnNeW/OeQchpL04oGIbVfkkFMCfSzUf04imzCu5W/qXJloL0UbdI
	hBPW/4ulF33KW/t+fCWG51v8dQyNKG1CGVphgH7y07Ay1NgbW0sfRzM5QCPlArjnZQCyJjwcFlF
	qgjq+AWTIy7myA/tWvzlSfYNcqdr/JZby0ZpVYXqBgfBXb7Jpg1RSb1mxJP2TUCFOQDsrdAmKMV
	8l1ucqSLxe2w/SiqPx6LMPFvsMUN1SWg6h/VZheqi
X-Google-Smtp-Source: AGHT+IHtk921lEO/dQfipJFfEuJ1GeNiLuhJwnGHgJR1JF/11YYx8N67y8WnOW6vPy9eWziLe0e9eQ==
X-Received: by 2002:a05:6512:3da6:b0:54f:c10b:7286 with SMTP id 2adb3069b0e04-54fc67ad7f5mr2070039e87.3.1747146243820;
        Tue, 13 May 2025 07:24:03 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc644fba0sm1871813e87.23.2025.05.13.07.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 07:24:03 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/9] media: qcom: camss: remove duplicated csiphy_formats_sc7280 data
Date: Tue, 13 May 2025 17:23:46 +0300
Message-ID: <20250513142353.2572563-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250513142353.2572563-1-vladimir.zapolskiy@linaro.org>
References: <20250513142353.2572563-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It's sufficient to have just one previously set csiphy_formats_sdm845 data.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csiphy.c |  5 -----
 drivers/media/platform/qcom/camss/camss-csiphy.h |  1 -
 drivers/media/platform/qcom/camss/camss.c        | 10 +++++-----
 3 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index c622efcc92ff..2de97f58f9ae 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -103,11 +103,6 @@ const struct csiphy_formats csiphy_formats_8x96 = {
 	.formats = formats_8x96
 };
 
-const struct csiphy_formats csiphy_formats_sc7280 = {
-	.nformats = ARRAY_SIZE(formats_sdm845),
-	.formats = formats_sdm845
-};
-
 const struct csiphy_formats csiphy_formats_sdm845 = {
 	.nformats = ARRAY_SIZE(formats_sdm845),
 	.formats = formats_sdm845
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
index ab91273303b9..895f80003c44 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.h
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
@@ -126,7 +126,6 @@ void msm_csiphy_unregister_entity(struct csiphy_device *csiphy);
 
 extern const struct csiphy_formats csiphy_formats_8x16;
 extern const struct csiphy_formats csiphy_formats_8x96;
-extern const struct csiphy_formats csiphy_formats_sc7280;
 extern const struct csiphy_formats csiphy_formats_sdm845;
 
 extern const struct csiphy_hw_ops csiphy_ops_2ph_1_0;
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index f76773dbd296..8c844ebf9cb6 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -1481,7 +1481,7 @@ static const struct camss_subdev_resources csiphy_res_7280[] = {
 		.csiphy = {
 			.id = 0,
 			.hw_ops = &csiphy_ops_3ph_1_0,
-			.formats = &csiphy_formats_sc7280
+			.formats = &csiphy_formats_sdm845,
 		}
 	},
 	/* CSIPHY1 */
@@ -1496,7 +1496,7 @@ static const struct camss_subdev_resources csiphy_res_7280[] = {
 		.csiphy = {
 			.id = 1,
 			.hw_ops = &csiphy_ops_3ph_1_0,
-			.formats = &csiphy_formats_sc7280
+			.formats = &csiphy_formats_sdm845,
 		}
 	},
 	/* CSIPHY2 */
@@ -1511,7 +1511,7 @@ static const struct camss_subdev_resources csiphy_res_7280[] = {
 		.csiphy = {
 			.id = 2,
 			.hw_ops = &csiphy_ops_3ph_1_0,
-			.formats = &csiphy_formats_sc7280
+			.formats = &csiphy_formats_sdm845,
 		}
 	},
 	/* CSIPHY3 */
@@ -1526,7 +1526,7 @@ static const struct camss_subdev_resources csiphy_res_7280[] = {
 		.csiphy = {
 			.id = 3,
 			.hw_ops = &csiphy_ops_3ph_1_0,
-			.formats = &csiphy_formats_sc7280
+			.formats = &csiphy_formats_sdm845,
 		}
 	},
 	/* CSIPHY4 */
@@ -1541,7 +1541,7 @@ static const struct camss_subdev_resources csiphy_res_7280[] = {
 		.csiphy = {
 			.id = 4,
 			.hw_ops = &csiphy_ops_3ph_1_0,
-			.formats = &csiphy_formats_sc7280
+			.formats = &csiphy_formats_sdm845,
 		}
 	},
 };
-- 
2.45.2


