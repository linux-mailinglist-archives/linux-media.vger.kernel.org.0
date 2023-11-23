Return-Path: <linux-media+bounces-925-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2737F64BE
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 18:03:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECDCA1C20D3E
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 17:03:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F60F3FE37;
	Thu, 23 Nov 2023 17:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X7pzJpLE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC41910C0
	for <linux-media@vger.kernel.org>; Thu, 23 Nov 2023 09:03:11 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3316bb1303bso613222f8f.0
        for <linux-media@vger.kernel.org>; Thu, 23 Nov 2023 09:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700758990; x=1701363790; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KYgDwoAJq7y7oFUTHWIIkWneJ3qvbnWcKjXymT7sa6E=;
        b=X7pzJpLEqM+a7Ts7CN5/iomE6U46vZkxkqhgAPxtz/h9eTBPBlHut/VBhXjXbnipKA
         FvajjMCenS02klFjJzlG1d9bvylUrnQ6/ynEaJs8L++fcoP227etxu7xSz3i3S3RhcS3
         HEF+02E4dKiXCrTF5Yp5YT6/Vduhey4pbWCFfcqWvw5YynWIpXwtKPt+PwxYgU1ebSf2
         1jpVnGe8+0s0In+ceclgEIP3nykOelQXGEW9SoxZG1/+bppVnK6bIimsotiJ+tWyeSkF
         l5TKJQhr+AA3lvHEworxQojLvOL0N6qbdtyr3DeHFJt5Ajuz0n/obPqIgqtALZjAaaXn
         ++dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700758990; x=1701363790;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KYgDwoAJq7y7oFUTHWIIkWneJ3qvbnWcKjXymT7sa6E=;
        b=dnwYcUk8geZSGFckdkSbJnT/W+uiVijSnDrcCjz4feOcmFux6fNQgXD/K5Ro3AREq4
         egJ2xo/HXHwgmI2JDergpbqy3Wp6IQ9gravr5/8zVeoXIEWGejh9joHoK3wVCm6JqQzA
         XR6M1k+MoWTLaBCqPQmNAYhDbrSpNk6NkuiBT1tE+8+uj20w8/RI4Chol+aTz4gvu6ZX
         ZPsBrKffWQ857+vKCOlVYCSATVD93SYKEuEVJ7JooO2jvcWbThL/mEnBA1hhnXi9cbT2
         3Nw4GbhAkk6GTPxozBusOGnVdWVkKTPOvplE2wo4b02qkUF0ZfHKfsOxOcyAgNpA+kyw
         Cfrg==
X-Gm-Message-State: AOJu0YwcG+jLHoU3/NPKZK4SzfNUvf1M5O4iTmLewD//vLY+U2ffnNYJ
	4bmsMcIZFLZwwp+ZTGLBagkp4w==
X-Google-Smtp-Source: AGHT+IH1Vkw86Iv7kW71SUH5fgOm1NS7o8ehGiAsdoxdu0GDNgio32qmgxpH6qq9CWdpIqhiH9krlA==
X-Received: by 2002:adf:f64b:0:b0:331:8e29:44e3 with SMTP id x11-20020adff64b000000b003318e2944e3mr43348wrp.58.1700758990247;
        Thu, 23 Nov 2023 09:03:10 -0800 (PST)
Received: from [127.0.0.1] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id f9-20020a0560001b0900b0032196c508e3sm2172585wrz.53.2023.11.23.09.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 09:03:09 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 23 Nov 2023 17:03:04 +0000
Subject: [PATCH v6 5/8] media: qcom: camss: Add support for named
 power-domains
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20231123-b4-camss-named-power-domains-v6-5-3ec2fd9e8e36@linaro.org>
References: <20231123-b4-camss-named-power-domains-v6-0-3ec2fd9e8e36@linaro.org>
In-Reply-To: <20231123-b4-camss-named-power-domains-v6-0-3ec2fd9e8e36@linaro.org>
To: hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com, 
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, matti.lehtimaki@gmail.com, 
 quic_grosikop@quicinc.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.13-dev-26615

Right now we use fixed indexes to assign power-domains, with a
requirement for the TOP GDSC to come last in the list.

Adding support for named power-domains means the declaration in the dtsi
can come in any order.

After this change we continue to support the old indexing - if a SoC
resource declaration or the in-use dtb doesn't declare power-domain names
we fall back to the default legacy indexing.

From this point on though new SoC additions should contain named
power-domains, eventually we will drop support for legacy indexing.

Tested-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 24 +++++++++++++++++++++++-
 drivers/media/platform/qcom/camss/camss.c     | 26 +++++++++++++++++++++-----
 drivers/media/platform/qcom/camss/camss.h     |  2 ++
 3 files changed, 46 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 60c4730e7c9d1..083d1445a6e25 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -1382,7 +1382,29 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
 	if (!res->line_num)
 		return -EINVAL;
 
-	if (res->has_pd) {
+	/* Power domain */
+
+	if (res->pd_name) {
+		vfe->genpd = dev_pm_domain_attach_by_name(camss->dev,
+							  res->pd_name);
+		if (IS_ERR(vfe->genpd)) {
+			ret = PTR_ERR(vfe->genpd);
+			return ret;
+		}
+	}
+
+	if (!vfe->genpd && res->has_pd) {
+		/*
+		 * Legacy magic index.
+		 * Requires
+		 * power-domain = <VFE_X>,
+		 *                <VFE_Y>,
+		 *                <TITAN_TOP>
+		 * id must correspondng to the index of the VFE which must
+		 * come before the TOP GDSC. VFE Lite has no individually
+		 * collapasible domain which is why id < vfe_num is a valid
+		 * check.
+		 */
 		vfe->genpd = dev_pm_domain_attach_by_id(camss->dev, id);
 		if (IS_ERR(vfe->genpd))
 			return PTR_ERR(vfe->genpd);
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 35918cf837bdd..f2d2317c38b5b 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -1522,12 +1522,28 @@ static int camss_configure_pd(struct camss *camss)
 		return 0;
 
 	/*
-	 * VFE power domains are in the beginning of the list, and while all
-	 * power domains should be attached, only if TITAN_TOP power domain is
-	 * found in the list, it should be linked over here.
+	 * If a power-domain name is defined try to use it.
+	 * It is possible we are running a new kernel with an old dtb so
+	 * fallback to indexes even if a pd_name is defined but not found.
 	 */
-	camss->genpd = dev_pm_domain_attach_by_id(camss->dev, camss->genpd_num - 1);
-	if (IS_ERR(camss->genpd)) {
+	if (camss->res->pd_name) {
+		camss->genpd = dev_pm_domain_attach_by_name(camss->dev,
+							    camss->res->pd_name);
+		if (IS_ERR(camss->genpd)) {
+			ret = PTR_ERR(camss->genpd);
+			goto fail_pm;
+		}
+	}
+
+	if (!camss->genpd) {
+		/*
+		 * Legacy magic index. TITAN_TOP GDSC must be the last
+		 * item in the power-domain list.
+		 */
+		camss->genpd = dev_pm_domain_attach_by_id(camss->dev,
+							  camss->genpd_num - 1);
+	}
+	if (IS_ERR_OR_NULL(camss->genpd)) {
 		ret = PTR_ERR(camss->genpd);
 		goto fail_pm;
 	}
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 1ba824a2cb76c..cd8186fe1797b 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -48,6 +48,7 @@ struct camss_subdev_resources {
 	u32 clock_rate[CAMSS_RES_MAX][CAMSS_RES_MAX];
 	char *reg[CAMSS_RES_MAX];
 	char *interrupt[CAMSS_RES_MAX];
+	char *pd_name;
 	u8 line_num;
 	bool has_pd;
 	const void *ops;
@@ -84,6 +85,7 @@ enum icc_count {
 
 struct camss_resources {
 	enum camss_version version;
+	const char *pd_name;
 	const struct camss_subdev_resources *csiphy_res;
 	const struct camss_subdev_resources *csid_res;
 	const struct camss_subdev_resources *ispif_res;

-- 
2.42.0


