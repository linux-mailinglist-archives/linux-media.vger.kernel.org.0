Return-Path: <linux-media+bounces-3256-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5782982578C
	for <lists+linux-media@lfdr.de>; Fri,  5 Jan 2024 17:03:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA8A81F24904
	for <lists+linux-media@lfdr.de>; Fri,  5 Jan 2024 16:03:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C40DC35EE4;
	Fri,  5 Jan 2024 16:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ycxnnd62"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FA035EE7
	for <linux-media@vger.kernel.org>; Fri,  5 Jan 2024 16:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-50e80d40a41so2080477e87.1
        for <linux-media@vger.kernel.org>; Fri, 05 Jan 2024 08:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704470482; x=1705075282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8L0r+j4QHpjBNKOc8LHPOJeBJ7cd09qGloI5UK65eK8=;
        b=Ycxnnd62LwjllLHMqhoOBI5hoM/2xeVT3AFSW83rg/VGWlTtX08peVZobmX6w3SuPF
         qWZmPTvQNXIsPxXMOHWNDex5nt/ncjJJG8GHjY4uQsxFFrzxmxJzV0gM74V6gwVRiPpr
         0G6GV6nLvx2zuYHU2O92cZ08N7agdXS5BYkCQFIXBVA9Ohy+Kg6qPfYY5cZF8cMNAcdq
         B7iU+wmavt6x1uNFOuMpFVfGWYCIHTIwmlMNcPBeVNYOGVrA3rOsG9uZb4iLQ4t9qqge
         kSkIJzRSaU1jvtQE+30KA2YP0oLyEeC2jS4A8Fm/rvpyiACij1PA/yRva01ZCAzc2YvM
         KZ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704470482; x=1705075282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8L0r+j4QHpjBNKOc8LHPOJeBJ7cd09qGloI5UK65eK8=;
        b=qot+3wkdNZC+p7YxMPd7HVWG4pR5gZo/sly2OuB9AKGvSnVlPihpZXISC4YMD/zuFl
         vZnDKeds0l4/FVB6jnv+4+4NEXZjAdGFyHZG0vD3AuhxGLfZDbTxqlqZiiQjAHDeRsI4
         vdMUkWl+agVUHpp4ow8SqzeiZFvpnulMqEIBmxhRWsb5cZt28Cb+vUdWSIoCLzB0kTae
         0pBh3yeWVBwiyxMWMsDUpq4kfpZaQH8/bgNvwIUQCggEp1uoCb6us8GlSqA9ZJOj6MEh
         CadZP1MxdgMsQDir8rZcFkCYk5cKtVg1JUnqfhkbjAYk0NYj+1T0cDcraM+plEMaV+oR
         28qQ==
X-Gm-Message-State: AOJu0Yzka82jB+5vgxqCUOWq9deC+wt4tQoJeWB/hkpcXSjV+DV8666R
	4UrWiNaGWuy6eEEHaqbKBqZWJN0NIIh9CQ==
X-Google-Smtp-Source: AGHT+IFY8QPFwT3PY8M0RvC5lrijiDKhxLr7OdAEz9xvV4euoz5pxeW0sYQSK/KqUIzreBJFVWCGVQ==
X-Received: by 2002:ac2:58c1:0:b0:50e:7b4e:f7e8 with SMTP id u1-20020ac258c1000000b0050e7b4ef7e8mr1019442lfo.6.1704470482505;
        Fri, 05 Jan 2024 08:01:22 -0800 (PST)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id n5-20020a056512310500b0050e76978861sm262094lfb.277.2024.01.05.08.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 08:01:19 -0800 (PST)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	linux-pm@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Kevin Hilman <khilman@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Nikunj Kela <nkela@quicinc.com>,
	Prasad Sodagudi <psodagud@quicinc.com>,
	Stephan Gerhold <stephan@gerhold.net>,
	Ben Horgan <Ben.Horgan@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org,
	linux-media@vger.kernel.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [PATCH v2 4/5] remoteproc: qcom_q6v5_adsp: Convert to dev_pm_domain_attach|detach_list()
Date: Fri,  5 Jan 2024 17:01:02 +0100
Message-Id: <20240105160103.183092-5-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240105160103.183092-1-ulf.hansson@linaro.org>
References: <20240105160103.183092-1-ulf.hansson@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Let's avoid some of the boilerplate code to manage the various PM domain
cases, by converting into using dev_pm_domain_attach|detach_list().

As a part of the conversion, we are moving over to use device_links, which
simplifies the runtime PM support too. Moreover, while attaching let's
trust that an already attached single PM domain is the correct one.

Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: <linux-remoteproc@vger.kernel.org>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---

Changes in v2:
	- None.

Kind regards
Ulf Hansson
---
 drivers/remoteproc/qcom_q6v5_adsp.c | 160 +++++++++++++---------------
 1 file changed, 73 insertions(+), 87 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
index 6c67514cc493..93f9a1537ec6 100644
--- a/drivers/remoteproc/qcom_q6v5_adsp.c
+++ b/drivers/remoteproc/qcom_q6v5_adsp.c
@@ -55,8 +55,6 @@
 #define QDSP6SS_CORE_CBCR	0x20
 #define QDSP6SS_SLEEP_CBCR	0x3c
 
-#define QCOM_Q6V5_RPROC_PROXY_PD_MAX	3
-
 #define LPASS_BOOT_CORE_START	BIT(0)
 #define LPASS_BOOT_CMD_START	BIT(0)
 #define LPASS_EFUSE_Q6SS_EVB_SEL 0x0
@@ -74,7 +72,8 @@ struct adsp_pil_data {
 
 	const char **clk_ids;
 	int num_clks;
-	const char **proxy_pd_names;
+	const char **pd_names;
+	unsigned int num_pds;
 	const char *load_state;
 };
 
@@ -110,8 +109,7 @@ struct qcom_adsp {
 	size_t mem_size;
 	bool has_iommu;
 
-	struct device *proxy_pds[QCOM_Q6V5_RPROC_PROXY_PD_MAX];
-	size_t proxy_pd_count;
+	struct dev_pm_domain_list *pd_list;
 
 	struct qcom_rproc_glink glink_subdev;
 	struct qcom_rproc_ssr ssr_subdev;
@@ -120,98 +118,92 @@ struct qcom_adsp {
 	int (*shutdown)(struct qcom_adsp *adsp);
 };
 
-static int qcom_rproc_pds_attach(struct device *dev, struct qcom_adsp *adsp,
-				 const char **pd_names)
+static int qcom_rproc_pds_attach(struct qcom_adsp *adsp, const char **pd_names,
+				 unsigned int num_pds)
 {
-	struct device **devs = adsp->proxy_pds;
-	size_t num_pds = 0;
+	struct device *dev = adsp->dev;
+	struct dev_pm_domain_attach_data pd_data = {
+		.pd_names = pd_names,
+		.num_pd_names = num_pds,
+	};
 	int ret;
-	int i;
-
-	if (!pd_names)
-		return 0;
 
 	/* Handle single power domain */
-	if (dev->pm_domain) {
-		devs[0] = dev;
-		pm_runtime_enable(dev);
-		return 1;
-	}
+	if (dev->pm_domain)
+		goto out;
 
-	while (pd_names[num_pds])
-		num_pds++;
+	if (!pd_names)
+		return 0;
 
-	if (num_pds > ARRAY_SIZE(adsp->proxy_pds))
-		return -E2BIG;
+	ret = dev_pm_domain_attach_list(dev, &pd_data, &adsp->pd_list);
+	if (ret < 0)
+		return ret;
 
-	for (i = 0; i < num_pds; i++) {
-		devs[i] = dev_pm_domain_attach_by_name(dev, pd_names[i]);
-		if (IS_ERR_OR_NULL(devs[i])) {
-			ret = PTR_ERR(devs[i]) ? : -ENODATA;
-			goto unroll_attach;
-		}
-	}
+out:
+	pm_runtime_enable(dev);
+	return 0;
+}
 
-	return num_pds;
+static void qcom_rproc_pds_detach(struct qcom_adsp *adsp)
+{
+	struct device *dev = adsp->dev;
+	struct dev_pm_domain_list *pds = adsp->pd_list;
 
-unroll_attach:
-	for (i--; i >= 0; i--)
-		dev_pm_domain_detach(devs[i], false);
+	dev_pm_domain_detach_list(pds);
 
-	return ret;
+	if (dev->pm_domain || pds)
+		pm_runtime_disable(adsp->dev);
 }
 
-static void qcom_rproc_pds_detach(struct qcom_adsp *adsp, struct device **pds,
-				  size_t pd_count)
+static int qcom_rproc_pds_enable(struct qcom_adsp *adsp)
 {
 	struct device *dev = adsp->dev;
-	int i;
+	struct dev_pm_domain_list *pds = adsp->pd_list;
+	int ret, i = 0;
 
-	/* Handle single power domain */
-	if (dev->pm_domain && pd_count) {
-		pm_runtime_disable(dev);
-		return;
-	}
+	if (!dev->pm_domain && !pds)
+		return 0;
 
-	for (i = 0; i < pd_count; i++)
-		dev_pm_domain_detach(pds[i], false);
-}
+	if (dev->pm_domain)
+		dev_pm_genpd_set_performance_state(dev, INT_MAX);
 
-static int qcom_rproc_pds_enable(struct qcom_adsp *adsp, struct device **pds,
-				 size_t pd_count)
-{
-	int ret;
-	int i;
-
-	for (i = 0; i < pd_count; i++) {
-		dev_pm_genpd_set_performance_state(pds[i], INT_MAX);
-		ret = pm_runtime_resume_and_get(pds[i]);
-		if (ret < 0) {
-			dev_pm_genpd_set_performance_state(pds[i], 0);
-			goto unroll_pd_votes;
-		}
+	while (pds && i < pds->num_pds) {
+		dev_pm_genpd_set_performance_state(pds->pd_devs[i], INT_MAX);
+		i++;
 	}
 
-	return 0;
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0) {
+		while (pds && i > 0) {
+			i--;
+			dev_pm_genpd_set_performance_state(pds->pd_devs[i], 0);
+		}
 
-unroll_pd_votes:
-	for (i--; i >= 0; i--) {
-		dev_pm_genpd_set_performance_state(pds[i], 0);
-		pm_runtime_put(pds[i]);
+		if (dev->pm_domain)
+			dev_pm_genpd_set_performance_state(dev, 0);
 	}
 
 	return ret;
 }
 
-static void qcom_rproc_pds_disable(struct qcom_adsp *adsp, struct device **pds,
-				   size_t pd_count)
+static void qcom_rproc_pds_disable(struct qcom_adsp *adsp)
 {
-	int i;
+	struct device *dev = adsp->dev;
+	struct dev_pm_domain_list *pds = adsp->pd_list;
+	int i = 0;
+
+	if (!dev->pm_domain && !pds)
+		return;
+
+	if (dev->pm_domain)
+		dev_pm_genpd_set_performance_state(dev, 0);
 
-	for (i = 0; i < pd_count; i++) {
-		dev_pm_genpd_set_performance_state(pds[i], 0);
-		pm_runtime_put(pds[i]);
+	while (pds && i < pds->num_pds) {
+		dev_pm_genpd_set_performance_state(pds->pd_devs[i], 0);
+		i++;
 	}
+
+	pm_runtime_put(dev);
 }
 
 static int qcom_wpss_shutdown(struct qcom_adsp *adsp)
@@ -397,8 +389,7 @@ static int adsp_start(struct rproc *rproc)
 	if (ret)
 		goto adsp_smmu_unmap;
 
-	ret = qcom_rproc_pds_enable(adsp, adsp->proxy_pds,
-				    adsp->proxy_pd_count);
+	ret = qcom_rproc_pds_enable(adsp);
 	if (ret < 0)
 		goto disable_xo_clk;
 
@@ -448,7 +439,7 @@ static int adsp_start(struct rproc *rproc)
 disable_adsp_clks:
 	clk_bulk_disable_unprepare(adsp->num_clks, adsp->clks);
 disable_power_domain:
-	qcom_rproc_pds_disable(adsp, adsp->proxy_pds, adsp->proxy_pd_count);
+	qcom_rproc_pds_disable(adsp);
 disable_xo_clk:
 	clk_disable_unprepare(adsp->xo);
 adsp_smmu_unmap:
@@ -464,7 +455,7 @@ static void qcom_adsp_pil_handover(struct qcom_q6v5 *q6v5)
 	struct qcom_adsp *adsp = container_of(q6v5, struct qcom_adsp, q6v5);
 
 	clk_disable_unprepare(adsp->xo);
-	qcom_rproc_pds_disable(adsp, adsp->proxy_pds, adsp->proxy_pd_count);
+	qcom_rproc_pds_disable(adsp);
 }
 
 static int adsp_stop(struct rproc *rproc)
@@ -715,13 +706,11 @@ static int adsp_probe(struct platform_device *pdev)
 	if (ret)
 		goto free_rproc;
 
-	ret = qcom_rproc_pds_attach(adsp->dev, adsp,
-				    desc->proxy_pd_names);
+	ret = qcom_rproc_pds_attach(adsp, desc->pd_names, desc->num_pds);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Failed to attach proxy power domains\n");
 		goto free_rproc;
 	}
-	adsp->proxy_pd_count = ret;
 
 	ret = adsp_init_reset(adsp);
 	if (ret)
@@ -753,7 +742,7 @@ static int adsp_probe(struct platform_device *pdev)
 	return 0;
 
 disable_pm:
-	qcom_rproc_pds_detach(adsp, adsp->proxy_pds, adsp->proxy_pd_count);
+	qcom_rproc_pds_detach(adsp);
 
 free_rproc:
 	rproc_free(rproc);
@@ -771,7 +760,7 @@ static void adsp_remove(struct platform_device *pdev)
 	qcom_remove_glink_subdev(adsp->rproc, &adsp->glink_subdev);
 	qcom_remove_sysmon_subdev(adsp->sysmon);
 	qcom_remove_ssr_subdev(adsp->rproc, &adsp->ssr_subdev);
-	qcom_rproc_pds_detach(adsp, adsp->proxy_pds, adsp->proxy_pd_count);
+	qcom_rproc_pds_detach(adsp);
 	rproc_free(adsp->rproc);
 }
 
@@ -788,9 +777,8 @@ static const struct adsp_pil_data adsp_resource_init = {
 		"qdsp6ss_xo", "qdsp6ss_sleep", "qdsp6ss_core", NULL
 	},
 	.num_clks = 7,
-	.proxy_pd_names = (const char*[]) {
-		"cx", NULL
-	},
+	.pd_names = (const char*[]) { "cx" },
+	.num_pds = 1,
 };
 
 static const struct adsp_pil_data adsp_sc7280_resource_init = {
@@ -821,9 +809,8 @@ static const struct adsp_pil_data cdsp_resource_init = {
 		"q6_axim", NULL
 	},
 	.num_clks = 7,
-	.proxy_pd_names = (const char*[]) {
-		"cx", NULL
-	},
+	.pd_names = (const char*[]) { "cx" },
+	.num_pds = 1,
 };
 
 static const struct adsp_pil_data wpss_resource_init = {
@@ -839,9 +826,8 @@ static const struct adsp_pil_data wpss_resource_init = {
 		"ahb_bdg", "ahb", "rscp", NULL
 	},
 	.num_clks = 3,
-	.proxy_pd_names = (const char*[]) {
-		"cx", "mx", NULL
-	},
+	.pd_names = (const char*[]) { "cx", "mx" },
+	.num_pds = 2,
 };
 
 static const struct of_device_id adsp_of_match[] = {
-- 
2.34.1


