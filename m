Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA46948ADDB
	for <lists+linux-media@lfdr.de>; Tue, 11 Jan 2022 13:50:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239892AbiAKMuL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jan 2022 07:50:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239800AbiAKMuK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jan 2022 07:50:10 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00000C06173F
        for <linux-media@vger.kernel.org>; Tue, 11 Jan 2022 04:50:09 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id e5so10932981wmq.1
        for <linux-media@vger.kernel.org>; Tue, 11 Jan 2022 04:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tAzWNekbYoHsPsu5oJ7ts6tuZwyV0TPmJfjJ1FqajL0=;
        b=Mg4p7o61z8QMF9PphbNhiaJWSTMEDhA3Qqgag0Qq7DX/f4vSCOxjR4lGqaP5wLoztw
         NFkIHEqGaaLLfRjIj6fNKAj58DqnpeAqfHMJNH1eqm1Of2RQM/ddPrKIIues+jaURL2E
         YIJuILlNUa6XlP9ly8uw4VxNIo7y01XOpCq56XAJcT6PTwBUsDngErEzJ3E7u7ljbJOV
         zNU1GS8kuvFuNkpFplN8+lxZhBKNVqdlYO9FVDn2h3bLHGNQgwy+TTnl/pJyQXDxFjkR
         fpV5Nj7PSewe6z1gENg3tEwvC6hhHcHrgGeRs8RBTjYqcBS3cKi8Wuhtcd/gqSn5T3Is
         VZ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tAzWNekbYoHsPsu5oJ7ts6tuZwyV0TPmJfjJ1FqajL0=;
        b=TEb/yJYMixbDazvvTvXqCA8VSfR6q5fsges+YH6+poH4m67FGrL28wJ1jirMSEhrXH
         8xzugUfCIItAV7GFQkPFlSwKpVAwj/UOdxH83hESguHncLwOBM/EPsGTF+9AK8dszPvE
         RcQzFKSpqVMoqGAmkGW4IEFJz37AzqkSijdIEZuKe3Rx/AtH6LjS9uyFfPAChu9xMzHf
         9SjjZdLNJDFi/2gAWwR5CtnpZfYwAd0a0lh4y5GxeAkl0pKcgNg0B6StmOIWSiYKIaBo
         I5xDiTbRaynkhSvrQCEyg3K76a7UoGWmtX+EjOlY8vHrj6lXZoYROEVBpoh+O5875/kq
         CqoQ==
X-Gm-Message-State: AOAM532M+Qc+eLWQLgZD6bAwY/xYTqLCHuwuwyStw8XPnVed7PSOqqoa
        yZK08Gmi4Q9lank2SgDXfcLV5Q==
X-Google-Smtp-Source: ABdhPJx1Mz2kAJovssKAGzhb1k/vpJJhLn+Fl6mdbjta0o5BMjChU6VUFPZb6fpt4fTmrJAfSHviRA==
X-Received: by 2002:a7b:cb83:: with SMTP id m3mr2362689wmi.150.1641905408422;
        Tue, 11 Jan 2022 04:50:08 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id bg19sm1915252wmb.47.2022.01.11.04.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 04:50:08 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, hverkuil@xs4all.nl, robert.foss@linaro.org
Cc:     jonathan@marek.ca, andrey.konovalov@linaro.org,
        todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        jgrahsl@snap.com, hfink@snap.com, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org
Subject: [PATCH v3 5/8] media: camss: Add regulator_bulk support
Date:   Tue, 11 Jan 2022 12:52:09 +0000
Message-Id: <20220111125212.2343184-6-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220111125212.2343184-1-bryan.odonoghue@linaro.org>
References: <20220111125212.2343184-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the ability to enable or disable multiple regulators in bulk with
camss. This is useful for sm8250, sdm845 and it looks like sdm660 where we
have more than one CSI regulator to do at once.

It should just work for standalone existing vdda regulators and parts which
don't have an explicitly defined CSI regulator.

Reported-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../media/platform/qcom/camss/camss-csid.c    | 43 ++++++---
 .../media/platform/qcom/camss/camss-csid.h    |  3 +-
 drivers/media/platform/qcom/camss/camss.c     | 94 +++++++++----------
 drivers/media/platform/qcom/camss/camss.h     |  2 +-
 4 files changed, 79 insertions(+), 63 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 32f82e471bae1..00ef35e7786d4 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -173,7 +173,8 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 		if (ret < 0)
 			return ret;
 
-		ret = csid->vdda ? regulator_enable(csid->vdda) : 0;
+		ret = regulator_bulk_enable(csid->num_supplies,
+					    csid->supplies);
 		if (ret < 0) {
 			pm_runtime_put_sync(dev);
 			return ret;
@@ -181,16 +182,16 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 
 		ret = csid_set_clock_rates(csid);
 		if (ret < 0) {
-			if (csid->vdda)
-				regulator_disable(csid->vdda);
+			regulator_bulk_disable(csid->num_supplies,
+					       csid->supplies);
 			pm_runtime_put_sync(dev);
 			return ret;
 		}
 
 		ret = camss_enable_clocks(csid->nclocks, csid->clock, dev);
 		if (ret < 0) {
-			if (csid->vdda)
-				regulator_disable(csid->vdda);
+			regulator_bulk_disable(csid->num_supplies,
+					       csid->supplies);
 			pm_runtime_put_sync(dev);
 			return ret;
 		}
@@ -201,8 +202,8 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 		if (ret < 0) {
 			disable_irq(csid->irq);
 			camss_disable_clocks(csid->nclocks, csid->clock);
-			if (csid->vdda)
-				regulator_disable(csid->vdda);
+			regulator_bulk_disable(csid->num_supplies,
+					       csid->supplies);
 			pm_runtime_put_sync(dev);
 			return ret;
 		}
@@ -211,7 +212,8 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 	} else {
 		disable_irq(csid->irq);
 		camss_disable_clocks(csid->nclocks, csid->clock);
-		ret = csid->vdda ? regulator_disable(csid->vdda) : 0;
+		regulator_bulk_disable(csid->num_supplies,
+				       csid->supplies);
 		pm_runtime_put_sync(dev);
 		if (version == CAMSS_8250 || version == CAMSS_845)
 			vfe_put(vfe);
@@ -660,15 +662,28 @@ int msm_csid_subdev_init(struct camss *camss, struct csid_device *csid,
 	}
 
 	/* Regulator */
+	for (i = 0; i < ARRAY_SIZE(res->regulators); i++) {
+		if (res->regulators[i])
+			csid->num_supplies++;
+	}
 
-	csid->vdda = NULL;
-	if (res->regulator[0])
-		csid->vdda = devm_regulator_get(dev, res->regulator[0]);
-	if (IS_ERR(csid->vdda)) {
-		dev_err(dev, "could not get regulator\n");
-		return PTR_ERR(csid->vdda);
+	if (csid->num_supplies) {
+		csid->supplies = devm_kmalloc_array(camss->dev,
+						    csid->num_supplies,
+						    sizeof(csid->supplies),
+						    GFP_KERNEL);
+		if (!csid->supplies)
+			return -ENOMEM;
 	}
 
+	for (i = 0; i < csid->num_supplies; i++)
+		csid->supplies[i].supply = res->regulators[i];
+
+	ret = devm_regulator_bulk_get(camss->dev, csid->num_supplies,
+				      csid->supplies);
+	if (ret)
+		return ret;
+
 	init_completion(&csid->reset_complete);
 
 	return 0;
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index 17a50fa426be1..f06040e44c515 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -152,7 +152,8 @@ struct csid_device {
 	char irq_name[30];
 	struct camss_clock *clock;
 	int nclocks;
-	struct regulator *vdda;
+	struct regulator_bulk_data *supplies;
+	int num_supplies;
 	struct completion reset_complete;
 	struct csid_testgen_config testgen;
 	struct csid_phy_config phy;
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index d9905e737d88d..419c48c4f1d52 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -34,7 +34,7 @@
 static const struct resources csiphy_res_8x16[] = {
 	/* CSIPHY0 */
 	{
-		.regulator = { NULL },
+		.regulators = { NULL },
 		.clock = { "top_ahb", "ispif_ahb", "ahb", "csiphy0_timer" },
 		.clock_rate = { { 0 },
 				{ 0 },
@@ -46,7 +46,7 @@ static const struct resources csiphy_res_8x16[] = {
 
 	/* CSIPHY1 */
 	{
-		.regulator = { NULL },
+		.regulators = { NULL },
 		.clock = { "top_ahb", "ispif_ahb", "ahb", "csiphy1_timer" },
 		.clock_rate = { { 0 },
 				{ 0 },
@@ -60,7 +60,7 @@ static const struct resources csiphy_res_8x16[] = {
 static const struct resources csid_res_8x16[] = {
 	/* CSID0 */
 	{
-		.regulator = { "vdda" },
+		.regulators = { "vdda" },
 		.clock = { "top_ahb", "ispif_ahb", "csi0_ahb", "ahb",
 			   "csi0", "csi0_phy", "csi0_pix", "csi0_rdi" },
 		.clock_rate = { { 0 },
@@ -77,7 +77,7 @@ static const struct resources csid_res_8x16[] = {
 
 	/* CSID1 */
 	{
-		.regulator = { "vdda" },
+		.regulators = { "vdda" },
 		.clock = { "top_ahb", "ispif_ahb", "csi1_ahb", "ahb",
 			   "csi1", "csi1_phy", "csi1_pix", "csi1_rdi" },
 		.clock_rate = { { 0 },
@@ -107,7 +107,7 @@ static const struct resources_ispif ispif_res_8x16 = {
 static const struct resources vfe_res_8x16[] = {
 	/* VFE0 */
 	{
-		.regulator = { NULL },
+		.regulators = { NULL },
 		.clock = { "top_ahb", "vfe0", "csi_vfe0",
 			   "vfe_ahb", "vfe_axi", "ahb" },
 		.clock_rate = { { 0 },
@@ -129,7 +129,7 @@ static const struct resources vfe_res_8x16[] = {
 static const struct resources csiphy_res_8x96[] = {
 	/* CSIPHY0 */
 	{
-		.regulator = { NULL },
+		.regulators = { NULL },
 		.clock = { "top_ahb", "ispif_ahb", "ahb", "csiphy0_timer" },
 		.clock_rate = { { 0 },
 				{ 0 },
@@ -141,7 +141,7 @@ static const struct resources csiphy_res_8x96[] = {
 
 	/* CSIPHY1 */
 	{
-		.regulator = { NULL },
+		.regulators = { NULL },
 		.clock = { "top_ahb", "ispif_ahb", "ahb", "csiphy1_timer" },
 		.clock_rate = { { 0 },
 				{ 0 },
@@ -153,7 +153,7 @@ static const struct resources csiphy_res_8x96[] = {
 
 	/* CSIPHY2 */
 	{
-		.regulator = { NULL },
+		.regulators = { NULL },
 		.clock = { "top_ahb", "ispif_ahb", "ahb", "csiphy2_timer" },
 		.clock_rate = { { 0 },
 				{ 0 },
@@ -167,7 +167,7 @@ static const struct resources csiphy_res_8x96[] = {
 static const struct resources csid_res_8x96[] = {
 	/* CSID0 */
 	{
-		.regulator = { "vdda" },
+		.regulators = { "vdda" },
 		.clock = { "top_ahb", "ispif_ahb", "csi0_ahb", "ahb",
 			   "csi0", "csi0_phy", "csi0_pix", "csi0_rdi" },
 		.clock_rate = { { 0 },
@@ -184,7 +184,7 @@ static const struct resources csid_res_8x96[] = {
 
 	/* CSID1 */
 	{
-		.regulator = { "vdda" },
+		.regulators = { "vdda" },
 		.clock = { "top_ahb", "ispif_ahb", "csi1_ahb", "ahb",
 			   "csi1", "csi1_phy", "csi1_pix", "csi1_rdi" },
 		.clock_rate = { { 0 },
@@ -201,7 +201,7 @@ static const struct resources csid_res_8x96[] = {
 
 	/* CSID2 */
 	{
-		.regulator = { "vdda" },
+		.regulators = { "vdda" },
 		.clock = { "top_ahb", "ispif_ahb", "csi2_ahb", "ahb",
 			   "csi2", "csi2_phy", "csi2_pix", "csi2_rdi" },
 		.clock_rate = { { 0 },
@@ -218,7 +218,7 @@ static const struct resources csid_res_8x96[] = {
 
 	/* CSID3 */
 	{
-		.regulator = { "vdda" },
+		.regulators = { "vdda" },
 		.clock = { "top_ahb", "ispif_ahb", "csi3_ahb", "ahb",
 			   "csi3", "csi3_phy", "csi3_pix", "csi3_rdi" },
 		.clock_rate = { { 0 },
@@ -249,7 +249,7 @@ static const struct resources_ispif ispif_res_8x96 = {
 static const struct resources vfe_res_8x96[] = {
 	/* VFE0 */
 	{
-		.regulator = { NULL },
+		.regulators = { NULL },
 		.clock = { "top_ahb", "ahb", "vfe0", "csi_vfe0", "vfe_ahb",
 			   "vfe0_ahb", "vfe_axi", "vfe0_stream"},
 		.clock_rate = { { 0 },
@@ -267,7 +267,7 @@ static const struct resources vfe_res_8x96[] = {
 
 	/* VFE1 */
 	{
-		.regulator = { NULL },
+		.regulators = { NULL },
 		.clock = { "top_ahb", "ahb", "vfe1", "csi_vfe1", "vfe_ahb",
 			   "vfe1_ahb", "vfe_axi", "vfe1_stream"},
 		.clock_rate = { { 0 },
@@ -287,7 +287,7 @@ static const struct resources vfe_res_8x96[] = {
 static const struct resources csiphy_res_660[] = {
 	/* CSIPHY0 */
 	{
-		.regulator = { NULL },
+		.regulators = { NULL },
 		.clock = { "top_ahb", "ispif_ahb", "ahb", "csiphy0_timer",
 			   "csi0_phy", "csiphy_ahb2crif" },
 		.clock_rate = { { 0 },
@@ -301,7 +301,7 @@ static const struct resources csiphy_res_660[] = {
 
 	/* CSIPHY1 */
 	{
-		.regulator = { NULL },
+		.regulators = { NULL },
 		.clock = { "top_ahb", "ispif_ahb", "ahb", "csiphy1_timer",
 			   "csi1_phy", "csiphy_ahb2crif" },
 		.clock_rate = { { 0 },
@@ -315,7 +315,7 @@ static const struct resources csiphy_res_660[] = {
 
 	/* CSIPHY2 */
 	{
-		.regulator = { NULL },
+		.regulators = { NULL },
 		.clock = { "top_ahb", "ispif_ahb", "ahb", "csiphy2_timer",
 			   "csi2_phy", "csiphy_ahb2crif" },
 		.clock_rate = { { 0 },
@@ -331,7 +331,7 @@ static const struct resources csiphy_res_660[] = {
 static const struct resources csid_res_660[] = {
 	/* CSID0 */
 	{
-		.regulator = { "vdda", "vdd_sec" },
+		.regulators = { "vdda", "vdd_sec" },
 		.clock = { "top_ahb", "ispif_ahb", "csi0_ahb", "ahb",
 			   "csi0", "csi0_phy", "csi0_pix", "csi0_rdi",
 			   "cphy_csid0" },
@@ -351,7 +351,7 @@ static const struct resources csid_res_660[] = {
 
 	/* CSID1 */
 	{
-		.regulator = { "vdda", "vdd_sec" },
+		.regulators = { "vdda", "vdd_sec" },
 		.clock = { "top_ahb", "ispif_ahb", "csi1_ahb", "ahb",
 			   "csi1", "csi1_phy", "csi1_pix", "csi1_rdi",
 			   "cphy_csid1" },
@@ -371,7 +371,7 @@ static const struct resources csid_res_660[] = {
 
 	/* CSID2 */
 	{
-		.regulator = { "vdda", "vdd_sec" },
+		.regulators = { "vdda", "vdd_sec" },
 		.clock = { "top_ahb", "ispif_ahb", "csi2_ahb", "ahb",
 			   "csi2", "csi2_phy", "csi2_pix", "csi2_rdi",
 			   "cphy_csid2" },
@@ -391,7 +391,7 @@ static const struct resources csid_res_660[] = {
 
 	/* CSID3 */
 	{
-		.regulator = { "vdda", "vdd_sec" },
+		.regulators = { "vdda", "vdd_sec" },
 		.clock = { "top_ahb", "ispif_ahb", "csi3_ahb", "ahb",
 			   "csi3", "csi3_phy", "csi3_pix", "csi3_rdi",
 			   "cphy_csid3" },
@@ -425,7 +425,7 @@ static const struct resources_ispif ispif_res_660 = {
 static const struct resources vfe_res_660[] = {
 	/* VFE0 */
 	{
-		.regulator = { NULL },
+		.regulators = { NULL },
 		.clock = { "throttle_axi", "top_ahb", "ahb", "vfe0",
 			   "csi_vfe0", "vfe_ahb", "vfe0_ahb", "vfe_axi",
 			   "vfe0_stream"},
@@ -446,7 +446,7 @@ static const struct resources vfe_res_660[] = {
 
 	/* VFE1 */
 	{
-		.regulator = { NULL },
+		.regulators = { NULL },
 		.clock = { "throttle_axi", "top_ahb", "ahb", "vfe1",
 			   "csi_vfe1", "vfe_ahb", "vfe1_ahb", "vfe_axi",
 			   "vfe1_stream"},
@@ -469,7 +469,7 @@ static const struct resources vfe_res_660[] = {
 static const struct resources csiphy_res_845[] = {
 	/* CSIPHY0 */
 	{
-		.regulator = { NULL },
+		.regulators = { NULL },
 		.clock = { "camnoc_axi", "soc_ahb", "slow_ahb_src",
 				"cpas_ahb", "cphy_rx_src", "csiphy0",
 				"csiphy0_timer_src", "csiphy0_timer" },
@@ -487,7 +487,7 @@ static const struct resources csiphy_res_845[] = {
 
 	/* CSIPHY1 */
 	{
-		.regulator = { NULL },
+		.regulators = { NULL },
 		.clock = { "camnoc_axi", "soc_ahb", "slow_ahb_src",
 				"cpas_ahb", "cphy_rx_src", "csiphy1",
 				"csiphy1_timer_src", "csiphy1_timer" },
@@ -505,7 +505,7 @@ static const struct resources csiphy_res_845[] = {
 
 	/* CSIPHY2 */
 	{
-		.regulator = { NULL },
+		.regulators = { NULL },
 		.clock = { "camnoc_axi", "soc_ahb", "slow_ahb_src",
 				"cpas_ahb", "cphy_rx_src", "csiphy2",
 				"csiphy2_timer_src", "csiphy2_timer" },
@@ -523,7 +523,7 @@ static const struct resources csiphy_res_845[] = {
 
 	/* CSIPHY3 */
 	{
-		.regulator = { NULL },
+		.regulators = { NULL },
 		.clock = { "camnoc_axi", "soc_ahb", "slow_ahb_src",
 				"cpas_ahb", "cphy_rx_src", "csiphy3",
 				"csiphy3_timer_src", "csiphy3_timer" },
@@ -543,7 +543,7 @@ static const struct resources csiphy_res_845[] = {
 static const struct resources csid_res_845[] = {
 	/* CSID0 */
 	{
-		.regulator = { NULL },
+		.regulators = { NULL },
 		.clock = { "cpas_ahb", "cphy_rx_src", "slow_ahb_src",
 				"soc_ahb", "vfe0", "vfe0_src",
 				"vfe0_cphy_rx", "csi0",
@@ -563,7 +563,7 @@ static const struct resources csid_res_845[] = {
 
 	/* CSID1 */
 	{
-		.regulator = { NULL },
+		.regulators = { NULL },
 		.clock = { "cpas_ahb", "cphy_rx_src", "slow_ahb_src",
 				"soc_ahb", "vfe1", "vfe1_src",
 				"vfe1_cphy_rx", "csi1",
@@ -583,7 +583,7 @@ static const struct resources csid_res_845[] = {
 
 	/* CSID2 */
 	{
-		.regulator = { NULL },
+		.regulators = { NULL },
 		.clock = { "cpas_ahb", "cphy_rx_src", "slow_ahb_src",
 				"soc_ahb", "vfe_lite", "vfe_lite_src",
 				"vfe_lite_cphy_rx", "csi2",
@@ -605,7 +605,7 @@ static const struct resources csid_res_845[] = {
 static const struct resources vfe_res_845[] = {
 	/* VFE0 */
 	{
-		.regulator = { NULL },
+		.regulators = { NULL },
 		.clock = { "camnoc_axi", "cpas_ahb", "slow_ahb_src",
 				"soc_ahb", "vfe0", "vfe0_axi",
 				"vfe0_src", "csi0",
@@ -625,7 +625,7 @@ static const struct resources vfe_res_845[] = {
 
 	/* VFE1 */
 	{
-		.regulator = { NULL },
+		.regulators = { NULL },
 		.clock = { "camnoc_axi", "cpas_ahb", "slow_ahb_src",
 				"soc_ahb", "vfe1", "vfe1_axi",
 				"vfe1_src", "csi1",
@@ -645,7 +645,7 @@ static const struct resources vfe_res_845[] = {
 
 	/* VFE-lite */
 	{
-		.regulator = { NULL },
+		.regulators = { NULL },
 		.clock = { "camnoc_axi", "cpas_ahb", "slow_ahb_src",
 				"soc_ahb", "vfe_lite",
 				"vfe_lite_src", "csi2",
@@ -666,7 +666,7 @@ static const struct resources vfe_res_845[] = {
 static const struct resources csiphy_res_8250[] = {
 	/* CSIPHY0 */
 	{
-		.regulator = { NULL },
+		.regulators = { NULL },
 		.clock = { "csiphy0", "csiphy0_timer" },
 		.clock_rate = { { 400000000 },
 				{ 300000000 } },
@@ -675,7 +675,7 @@ static const struct resources csiphy_res_8250[] = {
 	},
 	/* CSIPHY1 */
 	{
-		.regulator = { NULL },
+		.regulators = { NULL },
 		.clock = { "csiphy1", "csiphy1_timer" },
 		.clock_rate = { { 400000000 },
 				{ 300000000 } },
@@ -684,7 +684,7 @@ static const struct resources csiphy_res_8250[] = {
 	},
 	/* CSIPHY2 */
 	{
-		.regulator = { NULL },
+		.regulators = { NULL },
 		.clock = { "csiphy2", "csiphy2_timer" },
 		.clock_rate = { { 400000000 },
 				{ 300000000 } },
@@ -693,7 +693,7 @@ static const struct resources csiphy_res_8250[] = {
 	},
 	/* CSIPHY3 */
 	{
-		.regulator = { NULL },
+		.regulators = { NULL },
 		.clock = { "csiphy3", "csiphy3_timer" },
 		.clock_rate = { { 400000000 },
 				{ 300000000 } },
@@ -702,7 +702,7 @@ static const struct resources csiphy_res_8250[] = {
 	},
 	/* CSIPHY4 */
 	{
-		.regulator = { NULL },
+		.regulators = { NULL },
 		.clock = { "csiphy4", "csiphy4_timer" },
 		.clock_rate = { { 400000000 },
 				{ 300000000 } },
@@ -711,7 +711,7 @@ static const struct resources csiphy_res_8250[] = {
 	},
 	/* CSIPHY5 */
 	{
-		.regulator = { NULL },
+		.regulators = { NULL },
 		.clock = { "csiphy5", "csiphy5_timer" },
 		.clock_rate = { { 400000000 },
 				{ 300000000 } },
@@ -723,7 +723,7 @@ static const struct resources csiphy_res_8250[] = {
 static const struct resources csid_res_8250[] = {
 	/* CSID0 */
 	{
-		.regulator = { NULL },
+		.regulators = { NULL },
 		.clock = { "vfe0_csid", "vfe0_cphy_rx", "vfe0", "vfe0_areg", "vfe0_ahb" },
 		.clock_rate = { { 400000000 },
 				{ 400000000 },
@@ -735,7 +735,7 @@ static const struct resources csid_res_8250[] = {
 	},
 	/* CSID1 */
 	{
-		.regulator = { NULL },
+		.regulators = { NULL },
 		.clock = { "vfe1_csid", "vfe1_cphy_rx", "vfe1", "vfe1_areg", "vfe1_ahb" },
 		.clock_rate = { { 400000000 },
 				{ 400000000 },
@@ -747,7 +747,7 @@ static const struct resources csid_res_8250[] = {
 	},
 	/* CSID2 */
 	{
-		.regulator = { NULL },
+		.regulators = { NULL },
 		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx", "vfe_lite",  "vfe_lite_ahb" },
 		.clock_rate = { { 400000000 },
 				{ 400000000 },
@@ -758,7 +758,7 @@ static const struct resources csid_res_8250[] = {
 	},
 	/* CSID3 */
 	{
-		.regulator = { NULL },
+		.regulators = { NULL },
 		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx", "vfe_lite",  "vfe_lite_ahb" },
 		.clock_rate = { { 400000000 },
 				{ 400000000 },
@@ -772,7 +772,7 @@ static const struct resources csid_res_8250[] = {
 static const struct resources vfe_res_8250[] = {
 	/* VFE0 */
 	{
-		.regulator = { NULL },
+		.regulators = { NULL },
 		.clock = { "camnoc_axi_src", "slow_ahb_src", "cpas_ahb",
 			   "camnoc_axi", "vfe0_ahb", "vfe0_areg", "vfe0",
 			   "vfe0_axi", "cam_hf_axi" },
@@ -790,7 +790,7 @@ static const struct resources vfe_res_8250[] = {
 	},
 	/* VFE1 */
 	{
-		.regulator = { NULL },
+		.regulators = { NULL },
 		.clock = { "camnoc_axi_src", "slow_ahb_src", "cpas_ahb",
 			   "camnoc_axi", "vfe1_ahb", "vfe1_areg", "vfe1",
 			   "vfe1_axi", "cam_hf_axi" },
@@ -808,7 +808,7 @@ static const struct resources vfe_res_8250[] = {
 	},
 	/* VFE2 (lite) */
 	{
-		.regulator = { NULL },
+		.regulators = { NULL },
 		.clock = { "camnoc_axi_src", "slow_ahb_src", "cpas_ahb",
 			   "camnoc_axi", "vfe_lite_ahb", "vfe_lite_axi",
 			   "vfe_lite", "cam_hf_axi" },
@@ -825,7 +825,7 @@ static const struct resources vfe_res_8250[] = {
 	},
 	/* VFE3 (lite) */
 	{
-		.regulator = { NULL },
+		.regulators = { NULL },
 		.clock = { "camnoc_axi_src", "slow_ahb_src", "cpas_ahb",
 			   "camnoc_axi", "vfe_lite_ahb", "vfe_lite_axi",
 			   "vfe_lite", "cam_hf_axi" },
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 9c644e638a948..c9b3e0df5be8f 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -42,7 +42,7 @@
 #define CAMSS_RES_MAX 17
 
 struct resources {
-	char *regulator[CAMSS_RES_MAX];
+	char *regulators[CAMSS_RES_MAX];
 	char *clock[CAMSS_RES_MAX];
 	u32 clock_rate[CAMSS_RES_MAX][CAMSS_RES_MAX];
 	char *reg[CAMSS_RES_MAX];
-- 
2.33.0

