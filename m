Return-Path: <linux-media+bounces-34558-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AB9AD64F4
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 03:15:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF7D32C0172
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 01:15:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9C5913C8E8;
	Thu, 12 Jun 2025 01:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GwSfncPl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70CF313B797
	for <linux-media@vger.kernel.org>; Thu, 12 Jun 2025 01:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749690942; cv=none; b=pLetA1c4QazNz0gATWnm//knEdlGPtrLgsTIwWA6Owfk1NeXzXJwQC0FypaM7hCD9vJOl3cUgKBlkFM6gHBGzqCQ3F0e7YJjZpE8yszBHEgB/plqa19uAvIQR5ndL3pixV1mvUcbWgSEz17TRWvqRNP3wCmjDrv9vtOdZQFivKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749690942; c=relaxed/simple;
	bh=cTiCvc3M5D7VQS/RPNZMBcUtmTqxxVJOMqLiNgpATFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bseuF4rgTwYyc3vu3q1KpLvjPpbMkYFIf9P7Mj3R4/FmLlkfEUbDrEBaScdp5m4Nqa/EtpyyINxyQXfWJY/9BUn3nZzuvgzUpqHPvgZLX9WTTGUJDy020LLRcN1AZ+G5TlMfPRK2+gG/5dlhVrgofeYDUcmNV91XaRgCq5YaanQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GwSfncPl; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-553645133f0so10926e87.0
        for <linux-media@vger.kernel.org>; Wed, 11 Jun 2025 18:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749690938; x=1750295738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MytdYQLPTBH+sqpGAkv07c7VyYUNYJf1+SknQylnEzo=;
        b=GwSfncPllO4TAQ5uNloUvjMaA3mS2eg8DKsjxYl058P5/p6Im6ZIOtBGo9qCLJIINZ
         /3lT+zApHwg+O36n8d/YDvCWUE2eIZ0VktH52OOHGcxmmasUsRzRLvj4xpzNAeitZzgz
         jEnIH68sb7cvID4bvEodXljSCKumGbhIQLViQLDYXaywVGPzRzLPEEjvStcqSLMcGYnT
         OYHx9WW2DdsmFQkSV+DedYpqtJ6+eMbHUw+24HP30PR+m7eef2gsAVnElIPhlu4HA8Ey
         obus20cBLOVKd6uf/1oOa+vjivHYXJemiAgKBKjqMTOz5QgiZbgmYK6cnzUPfjwVyYTR
         y96w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749690938; x=1750295738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MytdYQLPTBH+sqpGAkv07c7VyYUNYJf1+SknQylnEzo=;
        b=uzvVs33y8pfyWbXB/lS1dP0ZYF8Lz83oP5M++I6gW7dYQgGcb3SjHNHoa4UOyKf2/H
         bR3Qkw5mL4q3RW1W/0Vpp8Y5QcWkd/V30dagSJHKEGz4PFIECTBXgJdix+2/iXacJDVI
         LSYIhM75vonUpZdONuUBl2u/zbm6pn4ucORKS1ZITN7xTnqBuuwkXn/2H2DjYiTAy3oa
         D+mwRY9krUEnoG2OjW7Rptgv9utU52u3TEPfBEmti9Jwe5ThLYYrgaSa9sV7vtyTJEi+
         4AbCanP+UGRjWfUvdNLEXVppPPsTB7CIM1DrowjMff4zQdiL47ZLnI+9fsPg5XQ0NhdO
         Vmqw==
X-Forwarded-Encrypted: i=1; AJvYcCWROHYaNIu2+zC8rGU+Fr6TmYZ4GBujfhyY0q1+hG6BR7P596hBHFo00o2oi5PapxQTIRXrsyTlCx7P5g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4QAUYyzfxcCtP3DXyVS/5XUrWuEdeLw2QWRh59cQ/T0BbopEH
	xZ0osjyUjuxF3F8g0bKTp0yBPwsiwwlZ7NkytXH+MDhGiENVg7T+xxUnQStjBm+DpA0=
X-Gm-Gg: ASbGncv4pqKJ6MXS7qW6MnLIBNasp4cEzjXBTAso76NPXnPxR6whwbV05wcIXho68TN
	/yvqlwfUOmnieIYNnKTL3rkQaNIqoW/H6dlcSSY4bafLdHuGgv43Y/qBe3VB1EHLC2CSFUWBpvH
	UmLrkuING4Oxi9azRtv9fdAtYWBheurUnKsnPFHm7ycE42HZ96PJKvht4OaQDePaQBftZdLzdoh
	vmwExPeVFGSx6LotN1nlAOnt1xDOakiUTx5xYs571n7Hzza8DpDSJFOO6SIHZLOIRTe+gxdiUS4
	6M8WL+AkJtU5PXFTIjEqWZhF0r2YCqbJptYHCNl5EqhsgAU3+ErkobFazoOtZCJsPHLoujtWu1r
	Fxyx8kQBlNGmZfDb+wfw7/qr8YlLa8vxbKuGZ9wkxIObddfULErM=
X-Google-Smtp-Source: AGHT+IHoUp0rBCvyGGy7XmIPKelgT4UaUs9romhC0d9m5fZfQ3Q0Ot+dNcpGlYOwVncG8cNIP4xyaQ==
X-Received: by 2002:a05:6512:68f:b0:553:1fee:4aaa with SMTP id 2adb3069b0e04-5539c247d66mr533854e87.16.1749690938552;
        Wed, 11 Jun 2025 18:15:38 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553a7018069sm62808e87.157.2025.06.11.18.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 18:15:37 -0700 (PDT)
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
Subject: [PATCH 01/10] media: qcom: camss: remove never used camss_vfe_get()/camss_vfe_put()
Date: Thu, 12 Jun 2025 04:15:22 +0300
Message-ID: <20250612011531.2923701-2-vladimir.zapolskiy@linaro.org>
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

Two intended to be helpers camss_vfe_get()/camss_vfe_put() got their
declarations in commit b1e6eef535df ("media: qcom: camss: Decouple VFE
from CSID"), but the correspondent functions haven't beed even added.

Remove the unused declarations.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 1d0f83e4a2c9..99831846ebb5 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -160,8 +160,6 @@ s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
 int camss_get_pixel_clock(struct media_entity *entity, u64 *pixel_clock);
 int camss_pm_domain_on(struct camss *camss, int id);
 void camss_pm_domain_off(struct camss *camss, int id);
-int camss_vfe_get(struct camss *camss, int id);
-void camss_vfe_put(struct camss *camss, int id);
 void camss_delete(struct camss *camss);
 void camss_buf_done(struct camss *camss, int hw_id, int port_id);
 void camss_reg_update(struct camss *camss, int hw_id,
-- 
2.49.0


