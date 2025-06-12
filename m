Return-Path: <linux-media+bounces-34563-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AE6AD6503
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 03:16:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CA702C05B9
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 01:16:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B94B81586C8;
	Thu, 12 Jun 2025 01:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WubHWjMc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7937F14D283
	for <linux-media@vger.kernel.org>; Thu, 12 Jun 2025 01:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749690954; cv=none; b=dYdZ2fu57Xhg/uULGw2sRNuq3N86VdbUVFyxcjw1FRbOSPbP1HLfI0EfCBpsng/SqUu4rdZnUdPtcVFE5HMyEKOAr/aU4qAxTtEl4uMyD+QPSTeCPrc9EeINrEAnsboeXF9ySUaJA28xPO/pH5AMZGXI6GxbMeFrEMLz5iicHB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749690954; c=relaxed/simple;
	bh=LqRPAqNQlNO3zu9aKoKgeHnMk4rQEK/l7ENgXrCUZAI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IX6pFikU5xhyIq+hhPe56YAsfZ865a6HV63BZNhLImbacIXapsKEciBzQj+8z+6U4jCRM16G3o/4mIHi1DccIjJarVn6tfZE51fR5wcpoDLfMJugfQzM1sAOa3a9MIpu1WSPg6UQL8X2AgtYdlWOw7BogAlhTxzIN45SpZQ0kGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WubHWjMc; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-32b2f369031so546401fa.2
        for <linux-media@vger.kernel.org>; Wed, 11 Jun 2025 18:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749690951; x=1750295751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TGXO7XE6Zd1Vk08ChbQh+PqLJC+OLbKRi30oxb1Svek=;
        b=WubHWjMcdRXHWWKVCKOkjUI9SRv/lW6N1KGO85u30YHbhzoODvdJH7BFlrEYzbvB4U
         G7YGEQZp+azNp6ZXMNtdj4tvXmKNYCeT6cDgNPbv0VmmYn71/tusVC2r2X3lwbebRMQr
         J2w75gqIquc0E/ktDaOxSliwqYU3V+8OP8+5/7EaZ/7vvaWI9NS252GaHkJpcaJMzGG1
         Az8jSBXRttrLgkWd/yfSsTCI6YeOoyBOvkiyJ7GGQND9ZdwvsJ0vXfhN5ejtuWzbti2X
         QfoF730eWa9M/4GdndiSw9zHd/UDD/E0kVJQSOc6QDoXLl9F7URI/fqYqKapOC6wdS9O
         D2Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749690951; x=1750295751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TGXO7XE6Zd1Vk08ChbQh+PqLJC+OLbKRi30oxb1Svek=;
        b=Ms328yMboUyiPxeoinFPGAfQ5LDRkiDY40r+Rb6/ICbMT9Nk/DQDVZFuSRSLc6+OBk
         w+EbvdkDB8yhgEMk+cgQ6xfOgfvepqaeV5VD/dWao/B9YEo7ddIJrPmFX4sc/d+MmF3M
         q+5ksrVZ9mNMQ9XzDgUJUuOqlLmjgMFl/67MSa31PSFCZ3vpZX3wnqUvaE7XbM3YuYxS
         uPsDWTA9UlhJCvzK9t8olfNIpK0OLj3I4eWu6vaIV9nFAdiz/JEOw8LRY97+t07A6tnb
         CNsFk1DNZIcGAK8vG6s/gftI23MZ1Nc4+A2R8e7MGqXF8bGpWNxFoj/y3eCOq5/pab5u
         SSvg==
X-Forwarded-Encrypted: i=1; AJvYcCUd8isVLBMDPsEO//zZaZVk+SC46urXeU0Shd1GEXpQXYKbI1Jf6fS62IfNaCVKRMk+Rpoe7wKlL8ocgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgnvSULuAVj33GZ/JiX46APfYHNMNb/U5E3IftOIZfzJ03vB+6
	2zEpjutp+CnQzNV9EG1FEN+I+9rSwKEnvHlPnEMlqYTawpCc+9JwYpwS5Bs3CcuVCJI=
X-Gm-Gg: ASbGncubh22RxFUQKKKqrW82UFiBaqtyOCuTwMwxKIeT5BXOaeKjlvDasQk9GS20MjR
	EVAuieKJLBuFS2LLUCcFNYE0ydE1HJm+PKuT04i6YENLbqmpuxSlB/NEKcrsxGMqj9fETypH/uI
	U7WRA1sfjZlrbY7cervtnAgzQ74uIHsBF/tnu2EaRTafsEg0CXnOgeeN3QNUBgVwk4XAZsa6b/t
	ZQt5JIohI53lEWgZUkZcJ5Pvzpm8BBkNODKmcRp1iVb2vbdh4AqywgUCfZSJFfawRc9yfo9mlB6
	BTgSs8dq2AoOBfghhy3BLWS+cSxvOJF1JqRaLUMwJN4ASej8f5yVVNFUHPT3+1Ml+KHQMuUGKUM
	o+00q1sR39lzm/KnkHo4XcgNDj0aX70OqdWFWCMXzhMHZKh00J8Y=
X-Google-Smtp-Source: AGHT+IF6li0/wsba5vOcpZ+7hE86fPFgQ1nbQpeMNRGYiv+YLYSCoO8kXCjs4MSZkmCv4t6gWdR79A==
X-Received: by 2002:a05:6512:acf:b0:553:34fc:3bd5 with SMTP id 2adb3069b0e04-5539c2004a5mr587329e87.8.1749690950543;
        Wed, 11 Jun 2025 18:15:50 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553a7018069sm62808e87.157.2025.06.11.18.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 18:15:50 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 06/10] media: qcom: camss: export camss_parse_endpoint_node() to csiphy
Date: Thu, 12 Jun 2025 04:15:27 +0300
Message-ID: <20250612011531.2923701-7-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612011531.2923701-1-vladimir.zapolskiy@linaro.org>
References: <20250612011531.2923701-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Export the function to reuse the remote endpoint node helper function
from a CSIPHY driver.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 6 +++---
 drivers/media/platform/qcom/camss/camss.h | 4 ++++
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index e03308d7a366..40bb20bbe8b4 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2981,9 +2981,9 @@ static const struct parent_dev_ops vfe_parent_dev_ops = {
  *
  * Return 0 on success or a negative error code on failure
  */
-static int camss_parse_endpoint_node(struct device *dev,
-				     struct fwnode_handle *ep,
-				     struct camss_async_subdev *csd)
+int camss_parse_endpoint_node(struct device *dev,
+			      struct fwnode_handle *ep,
+			      struct camss_async_subdev *csd)
 {
 	struct csiphy_lanes_cfg *lncfg = &csd->interface.csi2.lane_cfg;
 	struct v4l2_mbus_config_mipi_csi2 *mipi_csi2;
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 99831846ebb5..c3eedeb87ddc 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -14,6 +14,7 @@
 #include <linux/types.h>
 #include <media/v4l2-async.h>
 #include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
 #include <media/media-device.h>
 #include <media/media-entity.h>
@@ -150,6 +151,9 @@ struct parent_dev_ops {
 	void __iomem *(*get_base_address)(struct camss *camss, int id);
 };
 
+int camss_parse_endpoint_node(struct device *dev,
+			      struct fwnode_handle *ep,
+			      struct camss_async_subdev *csd);
 void camss_add_clock_margin(u64 *rate);
 int camss_enable_clocks(int nclocks, struct camss_clock *clock,
 			struct device *dev);
-- 
2.49.0


