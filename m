Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56FC0488775
	for <lists+linux-media@lfdr.de>; Sun,  9 Jan 2022 03:47:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235107AbiAICrM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 8 Jan 2022 21:47:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235120AbiAICrJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 8 Jan 2022 21:47:09 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34348C06173F
        for <linux-media@vger.kernel.org>; Sat,  8 Jan 2022 18:47:09 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id r9so17737746wrg.0
        for <linux-media@vger.kernel.org>; Sat, 08 Jan 2022 18:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ewneygIu5sp2ry7vV6FPAxx3wUrO69utitNS/lJDT2c=;
        b=XwPUFVcKQ1NASqWB0Bn3woZ4zesJMLYCACuUXhrQpDcOP//z1DYL2BKV3AXHDGOEMV
         rfJ70lKaSFvZebe/xBicE608x++5O6+rMmPhWl7AC6Af/McHcn5Pz71OuWt/fz+0g8Tm
         LvpRpG/vINnbYm+dvN9d9yTrie8Pa94HlEc5Wj3NyRnqp7JfKJ2hmx8yU6451cjk89AA
         NBigilRMBSclkXVOggzv8e9oEYJXAlPvtGdggGc1f0Ym8dw17jBNrrDlUHZQKXcjmhH7
         dw0/Ff8MmJZ2VbDQ4bvd1CilbgbzNOWhFtA9RhDgedDr+KTcqbvzD5xQmGWWqTqqclIW
         X11g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ewneygIu5sp2ry7vV6FPAxx3wUrO69utitNS/lJDT2c=;
        b=uOlgbhvmN+kp0v8G+uPTcHrPPtIPPtC9FtIyW3CplKIDhYrBhrDFDLHP/c1CByWA/v
         FSJgRH/LZUZpoOHqUrIqs+FjQbLD3Y0ZD85MdLQzwIhb9E7C1iZ+Uy6RxYL02xaAUix2
         BMsq/yy7zBcXh9X0/5vq3I+wESRnL0o7yxI0Ehre2V8Ns8UDt7IDfPu8NWv4d25l0h/w
         Nfh01bsc/o5uPFxGLHuuLI0b5l3gpo9OvECFdTnwDAZ0dyu9cyzk5SIOYL777DjbC7XH
         5XWhzLlRw5oSxNwObIiewZDjD0gXiG+qg8fMIXYolBYnuw4laTWMqcPWhf0VEwqhzCYA
         pKeg==
X-Gm-Message-State: AOAM531TSpVoQaAcJZGtuB32gZ7T2V8m+B7DFTEdERBMRAE0RUHJ+ROo
        DuOm6SFTOdrtIk6/UEpjTefMxw==
X-Google-Smtp-Source: ABdhPJzXbQ0WT960nsBurf6gsBUDg/DdE3QIVK1jUveXzFNK/nvFA5vZsKAo/iTcl7p23FAfMR894A==
X-Received: by 2002:a05:6000:2a3:: with SMTP id l3mr57994061wry.289.1641696427838;
        Sat, 08 Jan 2022 18:47:07 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id l13sm3341748wrs.73.2022.01.08.18.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jan 2022 18:47:07 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, hverkuil@xs4all.nl, robert.foss@linaro.org
Cc:     jonathan@marek.ca, andrey.konovalov@linaro.org,
        todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        jgrahsl@snap.com, hfink@snap.com, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org
Subject: [PATCH v2 6/8] media: camss: Set unused regulators to the empty set
Date:   Sun,  9 Jan 2022 02:49:08 +0000
Message-Id: <20220109024910.2041763-7-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220109024910.2041763-1-bryan.odonoghue@linaro.org>
References: <20220109024910.2041763-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If a CAMSS block has no regulator set the regulator array to the empty set
as opposed to setting the first element of the array to NULL.

Suggested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 60 +++++++++++------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 419c48c4f1d52..dcb37a739c95b 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -34,7 +34,7 @@
 static const struct resources csiphy_res_8x16[] = {
 	/* CSIPHY0 */
 	{
-		.regulators = { NULL },
+		.regulators = {},
 		.clock = { "top_ahb", "ispif_ahb", "ahb", "csiphy0_timer" },
 		.clock_rate = { { 0 },
 				{ 0 },
@@ -46,7 +46,7 @@ static const struct resources csiphy_res_8x16[] = {
 
 	/* CSIPHY1 */
 	{
-		.regulators = { NULL },
+		.regulators = {},
 		.clock = { "top_ahb", "ispif_ahb", "ahb", "csiphy1_timer" },
 		.clock_rate = { { 0 },
 				{ 0 },
@@ -107,7 +107,7 @@ static const struct resources_ispif ispif_res_8x16 = {
 static const struct resources vfe_res_8x16[] = {
 	/* VFE0 */
 	{
-		.regulators = { NULL },
+		.regulators = {},
 		.clock = { "top_ahb", "vfe0", "csi_vfe0",
 			   "vfe_ahb", "vfe_axi", "ahb" },
 		.clock_rate = { { 0 },
@@ -129,7 +129,7 @@ static const struct resources vfe_res_8x16[] = {
 static const struct resources csiphy_res_8x96[] = {
 	/* CSIPHY0 */
 	{
-		.regulators = { NULL },
+		.regulators = {},
 		.clock = { "top_ahb", "ispif_ahb", "ahb", "csiphy0_timer" },
 		.clock_rate = { { 0 },
 				{ 0 },
@@ -141,7 +141,7 @@ static const struct resources csiphy_res_8x96[] = {
 
 	/* CSIPHY1 */
 	{
-		.regulators = { NULL },
+		.regulators = {},
 		.clock = { "top_ahb", "ispif_ahb", "ahb", "csiphy1_timer" },
 		.clock_rate = { { 0 },
 				{ 0 },
@@ -153,7 +153,7 @@ static const struct resources csiphy_res_8x96[] = {
 
 	/* CSIPHY2 */
 	{
-		.regulators = { NULL },
+		.regulators = {},
 		.clock = { "top_ahb", "ispif_ahb", "ahb", "csiphy2_timer" },
 		.clock_rate = { { 0 },
 				{ 0 },
@@ -249,7 +249,7 @@ static const struct resources_ispif ispif_res_8x96 = {
 static const struct resources vfe_res_8x96[] = {
 	/* VFE0 */
 	{
-		.regulators = { NULL },
+		.regulators = {},
 		.clock = { "top_ahb", "ahb", "vfe0", "csi_vfe0", "vfe_ahb",
 			   "vfe0_ahb", "vfe_axi", "vfe0_stream"},
 		.clock_rate = { { 0 },
@@ -267,7 +267,7 @@ static const struct resources vfe_res_8x96[] = {
 
 	/* VFE1 */
 	{
-		.regulators = { NULL },
+		.regulators = {},
 		.clock = { "top_ahb", "ahb", "vfe1", "csi_vfe1", "vfe_ahb",
 			   "vfe1_ahb", "vfe_axi", "vfe1_stream"},
 		.clock_rate = { { 0 },
@@ -287,7 +287,7 @@ static const struct resources vfe_res_8x96[] = {
 static const struct resources csiphy_res_660[] = {
 	/* CSIPHY0 */
 	{
-		.regulators = { NULL },
+		.regulators = {},
 		.clock = { "top_ahb", "ispif_ahb", "ahb", "csiphy0_timer",
 			   "csi0_phy", "csiphy_ahb2crif" },
 		.clock_rate = { { 0 },
@@ -301,7 +301,7 @@ static const struct resources csiphy_res_660[] = {
 
 	/* CSIPHY1 */
 	{
-		.regulators = { NULL },
+		.regulators = {},
 		.clock = { "top_ahb", "ispif_ahb", "ahb", "csiphy1_timer",
 			   "csi1_phy", "csiphy_ahb2crif" },
 		.clock_rate = { { 0 },
@@ -315,7 +315,7 @@ static const struct resources csiphy_res_660[] = {
 
 	/* CSIPHY2 */
 	{
-		.regulators = { NULL },
+		.regulators = {},
 		.clock = { "top_ahb", "ispif_ahb", "ahb", "csiphy2_timer",
 			   "csi2_phy", "csiphy_ahb2crif" },
 		.clock_rate = { { 0 },
@@ -425,7 +425,7 @@ static const struct resources_ispif ispif_res_660 = {
 static const struct resources vfe_res_660[] = {
 	/* VFE0 */
 	{
-		.regulators = { NULL },
+		.regulators = {},
 		.clock = { "throttle_axi", "top_ahb", "ahb", "vfe0",
 			   "csi_vfe0", "vfe_ahb", "vfe0_ahb", "vfe_axi",
 			   "vfe0_stream"},
@@ -446,7 +446,7 @@ static const struct resources vfe_res_660[] = {
 
 	/* VFE1 */
 	{
-		.regulators = { NULL },
+		.regulators = {},
 		.clock = { "throttle_axi", "top_ahb", "ahb", "vfe1",
 			   "csi_vfe1", "vfe_ahb", "vfe1_ahb", "vfe_axi",
 			   "vfe1_stream"},
@@ -469,7 +469,7 @@ static const struct resources vfe_res_660[] = {
 static const struct resources csiphy_res_845[] = {
 	/* CSIPHY0 */
 	{
-		.regulators = { NULL },
+		.regulators = {},
 		.clock = { "camnoc_axi", "soc_ahb", "slow_ahb_src",
 				"cpas_ahb", "cphy_rx_src", "csiphy0",
 				"csiphy0_timer_src", "csiphy0_timer" },
@@ -487,7 +487,7 @@ static const struct resources csiphy_res_845[] = {
 
 	/* CSIPHY1 */
 	{
-		.regulators = { NULL },
+		.regulators = {},
 		.clock = { "camnoc_axi", "soc_ahb", "slow_ahb_src",
 				"cpas_ahb", "cphy_rx_src", "csiphy1",
 				"csiphy1_timer_src", "csiphy1_timer" },
@@ -505,7 +505,7 @@ static const struct resources csiphy_res_845[] = {
 
 	/* CSIPHY2 */
 	{
-		.regulators = { NULL },
+		.regulators = {},
 		.clock = { "camnoc_axi", "soc_ahb", "slow_ahb_src",
 				"cpas_ahb", "cphy_rx_src", "csiphy2",
 				"csiphy2_timer_src", "csiphy2_timer" },
@@ -523,7 +523,7 @@ static const struct resources csiphy_res_845[] = {
 
 	/* CSIPHY3 */
 	{
-		.regulators = { NULL },
+		.regulators = {},
 		.clock = { "camnoc_axi", "soc_ahb", "slow_ahb_src",
 				"cpas_ahb", "cphy_rx_src", "csiphy3",
 				"csiphy3_timer_src", "csiphy3_timer" },
@@ -605,7 +605,7 @@ static const struct resources csid_res_845[] = {
 static const struct resources vfe_res_845[] = {
 	/* VFE0 */
 	{
-		.regulators = { NULL },
+		.regulators = {},
 		.clock = { "camnoc_axi", "cpas_ahb", "slow_ahb_src",
 				"soc_ahb", "vfe0", "vfe0_axi",
 				"vfe0_src", "csi0",
@@ -625,7 +625,7 @@ static const struct resources vfe_res_845[] = {
 
 	/* VFE1 */
 	{
-		.regulators = { NULL },
+		.regulators = {},
 		.clock = { "camnoc_axi", "cpas_ahb", "slow_ahb_src",
 				"soc_ahb", "vfe1", "vfe1_axi",
 				"vfe1_src", "csi1",
@@ -645,7 +645,7 @@ static const struct resources vfe_res_845[] = {
 
 	/* VFE-lite */
 	{
-		.regulators = { NULL },
+		.regulators = {},
 		.clock = { "camnoc_axi", "cpas_ahb", "slow_ahb_src",
 				"soc_ahb", "vfe_lite",
 				"vfe_lite_src", "csi2",
@@ -666,7 +666,7 @@ static const struct resources vfe_res_845[] = {
 static const struct resources csiphy_res_8250[] = {
 	/* CSIPHY0 */
 	{
-		.regulators = { NULL },
+		.regulators = {},
 		.clock = { "csiphy0", "csiphy0_timer" },
 		.clock_rate = { { 400000000 },
 				{ 300000000 } },
@@ -675,7 +675,7 @@ static const struct resources csiphy_res_8250[] = {
 	},
 	/* CSIPHY1 */
 	{
-		.regulators = { NULL },
+		.regulators = {},
 		.clock = { "csiphy1", "csiphy1_timer" },
 		.clock_rate = { { 400000000 },
 				{ 300000000 } },
@@ -684,7 +684,7 @@ static const struct resources csiphy_res_8250[] = {
 	},
 	/* CSIPHY2 */
 	{
-		.regulators = { NULL },
+		.regulators = {},
 		.clock = { "csiphy2", "csiphy2_timer" },
 		.clock_rate = { { 400000000 },
 				{ 300000000 } },
@@ -693,7 +693,7 @@ static const struct resources csiphy_res_8250[] = {
 	},
 	/* CSIPHY3 */
 	{
-		.regulators = { NULL },
+		.regulators = {},
 		.clock = { "csiphy3", "csiphy3_timer" },
 		.clock_rate = { { 400000000 },
 				{ 300000000 } },
@@ -702,7 +702,7 @@ static const struct resources csiphy_res_8250[] = {
 	},
 	/* CSIPHY4 */
 	{
-		.regulators = { NULL },
+		.regulators = {},
 		.clock = { "csiphy4", "csiphy4_timer" },
 		.clock_rate = { { 400000000 },
 				{ 300000000 } },
@@ -711,7 +711,7 @@ static const struct resources csiphy_res_8250[] = {
 	},
 	/* CSIPHY5 */
 	{
-		.regulators = { NULL },
+		.regulators = {},
 		.clock = { "csiphy5", "csiphy5_timer" },
 		.clock_rate = { { 400000000 },
 				{ 300000000 } },
@@ -772,7 +772,7 @@ static const struct resources csid_res_8250[] = {
 static const struct resources vfe_res_8250[] = {
 	/* VFE0 */
 	{
-		.regulators = { NULL },
+		.regulators = {},
 		.clock = { "camnoc_axi_src", "slow_ahb_src", "cpas_ahb",
 			   "camnoc_axi", "vfe0_ahb", "vfe0_areg", "vfe0",
 			   "vfe0_axi", "cam_hf_axi" },
@@ -790,7 +790,7 @@ static const struct resources vfe_res_8250[] = {
 	},
 	/* VFE1 */
 	{
-		.regulators = { NULL },
+		.regulators = {},
 		.clock = { "camnoc_axi_src", "slow_ahb_src", "cpas_ahb",
 			   "camnoc_axi", "vfe1_ahb", "vfe1_areg", "vfe1",
 			   "vfe1_axi", "cam_hf_axi" },
@@ -808,7 +808,7 @@ static const struct resources vfe_res_8250[] = {
 	},
 	/* VFE2 (lite) */
 	{
-		.regulators = { NULL },
+		.regulators = {},
 		.clock = { "camnoc_axi_src", "slow_ahb_src", "cpas_ahb",
 			   "camnoc_axi", "vfe_lite_ahb", "vfe_lite_axi",
 			   "vfe_lite", "cam_hf_axi" },
@@ -825,7 +825,7 @@ static const struct resources vfe_res_8250[] = {
 	},
 	/* VFE3 (lite) */
 	{
-		.regulators = { NULL },
+		.regulators = {},
 		.clock = { "camnoc_axi_src", "slow_ahb_src", "cpas_ahb",
 			   "camnoc_axi", "vfe_lite_ahb", "vfe_lite_axi",
 			   "vfe_lite", "cam_hf_axi" },
-- 
2.33.0

