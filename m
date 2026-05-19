Return-Path: <linux-media+bounces-62157-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CMNG5yFDGrIigUAu9opvQ
	(envelope-from <linux-media+bounces-62157-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 17:45:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1784B581AE4
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 17:45:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D178D31632C8
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 15:14:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07F03400DFA;
	Tue, 19 May 2026 15:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oz8shUh3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6754F7999
	for <linux-media@vger.kernel.org>; Tue, 19 May 2026 15:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779203612; cv=none; b=A+CDPwDbBuejFctLdFMjbCf6jCQgnkXav+jhVP6xWIPXICuuHJl7nC720dXHhcs17BZqTmayLV6dr470MY9HSDWvRzCvgGfVoygP1ka22ZXt0FRmz/no/DreC3M/pyzp1rJ4dayCSzURX4HdORA/m2vksQBiBYevsBdNzUqagJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779203612; c=relaxed/simple;
	bh=lC1eXNo8nXdqtGecajxttKwFEKsEp/pJGrr+0jPeGWk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rTxGD24Uqo2XdnqnSlg5DZwpqzALD6f3wHDFGz7QuiPjSsgjNnH1+PN+DpkYkJFkUS5gtbGQg9CSg5LucLADlUNY48xAsfW/cfgDjNguQFK5fS4PsYLiH0nSNefjR6zXa/XtnhlGs3RCXLbXzPF9b9onI4YdZh+MhzoPQKDGjQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oz8shUh3; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-67bb5ad91bfso8385753a12.0
        for <linux-media@vger.kernel.org>; Tue, 19 May 2026 08:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779203609; x=1779808409; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lBuI6uIVySCfaA8WGdHyLuyoU4BibZti3IKN8m8riaQ=;
        b=oz8shUh3Ld8c4D6w0wbNyp1EAUueA6KoXJp/hO65v23Ve3GrR0evXaiorLfXwzepIq
         FUwLoQLb4Hj3TZQaWNYio1qmRPW1ASHNUsUOqCB33cYe3X25QlhookVPr9KJ3FSMNC9n
         7D1MCtlHUv5/AJYuDoEhvXlUJuTfZAQtY/6VL4dl5HDqDtTHmI4rPVJMP3T1lvTtzSoV
         e1HEa5knagzvaAPb2gD3XIiOpPhrsFqfsyqvnRjnjHMwdMG6mi5YWLhSP0O1zeXdaLG1
         A2L6LzBKytmIBWgKbpAPz5XoHw0yhpmdn90WRGPBFsCjL7XNFKSP9zb51hL7zTpyvr3/
         y7SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779203609; x=1779808409;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lBuI6uIVySCfaA8WGdHyLuyoU4BibZti3IKN8m8riaQ=;
        b=fWSsmZaH2pV822tb0lkc88cRTQ7Yne0JAEdEqOCzmXuXFcPM+oFQl6oAmzDxMQzNds
         x4IorZhhS+m1Uv1EHioNsBhoJseMyjmDWd5cvqyUNCK4OOitGevJzHol2wEu3lfhNHLn
         s4BXAcv8ypYPgpfDUbCVF+d1uZtTINOLtHPW4m3PNpbE5YFXMQmq6FWQ2hEdmOwnOvsB
         e0M+9MlfG7Yb01VgdZFDFttCu1pNX3d9QDH/9SEQy6PJqN8tvu14iAGxpo7/wDZWsyGR
         a66oB9FRdNulSf0gsUPSJTB7XTm6F0Q8ihzjobjJDnu6E4LUwvdaTgltwMIl1jcje1ZL
         VyQw==
X-Gm-Message-State: AOJu0Yy3YH7d9mvv/nH0xH664udInmiUwM95d2NCQrE9L/YawcMGrOLn
	f91Ly8IMiuzycPLxEYE3H93Iz5KaDcltSsw/TQ+xX7tAYSDF/IyV/w0v
X-Gm-Gg: Acq92OFf/nLOUo7YS+wo31CF5qP4oVIvWT7ekqRqd4td16VG1gSXWEoglrLRwTNlPjD
	EgFsxGqYThXX8xAs/KVspM708mcyb7d3edi51ijahQm8zM7M8cZ1nNQLbGCCSk75PgMMFRJxCig
	EQB/gUQZP7fDXBL8VqiSMtdsaBLK9b/OPk7ML67rPhE7SEi0alf3RCvUReA6tTTREMLGJ+VXA6/
	pAZqa6nsW7yrPs1MVPgJ9uLKzW/0UHq6MNIXJNTjVsSYC1p3ZLBtnU8JRxxnIEOskoPLLU0dvUq
	7sngaEBNbjNtVGJbLA8Bb8rhZ6lvUi5AF4YDKEGy8D/7K/331f+tfWQyNkuF+wmVbacO2zo/iOL
	2YmO8BEK+CiGWrw6kSiygPPmiw9jDDMWR04XYOil+VbLd5e1VMfFsnHmNrRlEuJ7ZdV3NDi/G+v
	c8QABWsmSAsedZcaXb52Gkwn/IzfepVUS5dPz+
X-Received: by 2002:a05:6402:234c:b0:67d:afe0:da6b with SMTP id 4fb4d7f45d1cf-683bdb98490mr10996326a12.22.1779203608690;
        Tue, 19 May 2026 08:13:28 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310b52675sm6697700a12.8.2026.05.19.08.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 08:13:26 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Tue, 19 May 2026 18:10:48 +0300
Subject: [PATCH v8 3/9] media: qcom: venus: add power domain enable logic
 for Venus cores
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-msm8939-venus-rfc-v8-3-542ec7557ebc@gmail.com>
References: <20260519-msm8939-venus-rfc-v8-0-542ec7557ebc@gmail.com>
In-Reply-To: <20260519-msm8939-venus-rfc-v8-0-542ec7557ebc@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15.2
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62157-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com,linaro.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[22];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:email]
X-Rspamd-Queue-Id: 1784B581AE4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Attach power domains for vdec and venc cores and power them up if a vdec
or venc session is started.

Vcodec clocks are added and enabled to the core Venus device both for
vcodec0 and vcodec1. To ensure they are added only once, introduce a new
property "vcodec_clks", which is an array of clocks which are enabled
both during decode and encode and is retrieved from the device tree only
once.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/core.h       |   3 +
 drivers/media/platform/qcom/venus/pm_helpers.c | 124 ++++++++++++++++++++++++-
 2 files changed, 122 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 03804c30808e..c1603eebd757 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -79,6 +79,7 @@ struct venus_resources {
 	const struct hfi_ubwc_config *ubwc_conf;
 	const char * const clks[VIDC_CLKS_NUM_MAX];
 	unsigned int clks_num;
+	const char * const vcodec_clks[VIDC_VCODEC_CLKS_NUM_MAX];
 	const char * const vcodec0_clks[VIDC_VCODEC_CLKS_NUM_MAX];
 	const char * const vcodec1_clks[VIDC_VCODEC_CLKS_NUM_MAX];
 	unsigned int vcodec_clks_num;
@@ -143,6 +144,7 @@ struct venus_format {
  * @aon_base:	AON base address
  * @irq:		Venus irq
  * @clks:	an array of struct clk pointers
+ * @vcodec_clks: an array of vcodec struct clk pointers
  * @vcodec0_clks: an array of vcodec0 struct clk pointers
  * @vcodec1_clks: an array of vcodec1 struct clk pointers
  * @video_path: an interconnect handle to video to/from memory path
@@ -197,6 +199,7 @@ struct venus_core {
 	void __iomem *aon_base;
 	int irq;
 	struct clk *clks[VIDC_CLKS_NUM_MAX];
+	struct clk *vcodec_clks[VIDC_VCODEC_CLKS_NUM_MAX];
 	struct clk *vcodec0_clks[VIDC_VCODEC_CLKS_NUM_MAX];
 	struct clk *vcodec1_clks[VIDC_VCODEC_CLKS_NUM_MAX];
 	struct icc_path *video_path;
diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index 14a4e8311a64..123b4661873a 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -89,12 +89,23 @@ static void core_clks_disable(struct venus_core *core)
 
 static int core_clks_set_rate(struct venus_core *core, unsigned long freq)
 {
-	int ret;
+	const struct venus_resources *res = core->res;
+	int ret, i;
 
 	ret = dev_pm_opp_set_rate(core->dev, freq);
 	if (ret)
 		return ret;
 
+	if (!res->vcodec_clks_num)
+		goto set_rates;
+
+	for (i = 0; i < res->vcodec_clks_num; i++) {
+		ret = clk_set_rate(core->vcodec_clks[i], freq);
+		if (ret)
+			return ret;
+	}
+
+set_rates:
 	ret = clk_set_rate(core->vcodec0_clks[0], freq);
 	if (ret)
 		return ret;
@@ -297,10 +308,33 @@ static int load_scale_v1(struct venus_inst *inst)
 	return ret;
 }
 
+static int vcodec_domains_get_v1(struct venus_core *core)
+{
+	struct device *dev = core->dev;
+	const struct venus_resources *res = core->res;
+	const struct dev_pm_domain_attach_data vcodec_data = {
+		.pd_names = res->vcodec_pmdomains,
+		.num_pd_names = res->vcodec_pmdomains_num,
+		.pd_flags = PD_FLAG_NO_DEV_LINK,
+	};
+
+	if (!res->vcodec_pmdomains)
+		return 0;
+
+	return devm_pm_domain_attach_list(dev, &vcodec_data,
+					  &core->pmdomains);
+}
+
 static int core_get_v1(struct venus_core *core)
 {
+	const struct venus_resources *res = core->res;
+	struct device *dev = core->dev;
 	int ret;
 
+	ret = vcodec_domains_get_v1(core);
+	if (ret < 0)
+		return ret;
+
 	ret = core_clks_get(core);
 	if (ret)
 		return ret;
@@ -309,7 +343,63 @@ static int core_get_v1(struct venus_core *core)
 	if (ret)
 		return ret;
 
+	if (!res->vcodec_pmdomains)
+		return 0;
+
+	ret = vcodec_clks_get(core, dev, core->vcodec_clks,
+			      res->vcodec_clks);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int vcodec_domains_enable(struct venus_core *core)
+{
+	const struct venus_resources *res = core->res;
+	struct device *pd_dev;
+	int i = 0, ret;
+
+	if (!res->vcodec_pmdomains)
+		return 0;
+
+	for (; i < res->vcodec_pmdomains_num; i++) {
+		pd_dev = core->pmdomains->pd_devs[i];
+		ret = pm_runtime_resume_and_get(pd_dev);
+		if (ret)
+			goto err;
+
+		ret = dev_pm_genpd_set_hwmode(pd_dev, true);
+		if (ret && ret != -EOPNOTSUPP) {
+			pm_runtime_put_sync(pd_dev);
+			goto err;
+		}
+	}
+
 	return 0;
+err:
+	while (i--) {
+		pd_dev = core->pmdomains->pd_devs[i];
+		dev_pm_genpd_set_hwmode(pd_dev, false);
+		pm_runtime_put_sync(pd_dev);
+	}
+	return ret;
+}
+
+static void vcodec_domains_disable(struct venus_core *core)
+{
+	const struct venus_resources *res = core->res;
+	struct device *pd_dev;
+	int i = res->vcodec_pmdomains_num;
+
+	if (!res->vcodec_pmdomains)
+		return;
+
+	while (i--) {
+		pd_dev = core->pmdomains->pd_devs[i];
+		dev_pm_genpd_set_hwmode(pd_dev, false);
+		pm_runtime_put_sync(pd_dev);
+	}
 }
 
 static void core_put_v1(struct venus_core *core)
@@ -320,11 +410,35 @@ static int core_power_v1(struct venus_core *core, int on)
 {
 	int ret = 0;
 
-	if (on == POWER_ON)
+	if (on == POWER_ON) {
+		ret = vcodec_domains_enable(core);
+		if (ret)
+			return ret;
+
 		ret = core_clks_enable(core);
-	else
+		if (ret)
+			goto fail_pmdomains;
+
+		if (!core->res->vcodec_pmdomains)
+			return 0;
+
+		ret = vcodec_clks_enable(core, core->vcodec_clks);
+		if (ret)
+			goto fail_core_clks;
+
+	} else {
+		if (core->res->vcodec_pmdomains)
+			vcodec_clks_disable(core, core->vcodec_clks);
 		core_clks_disable(core);
+		vcodec_domains_disable(core);
+	}
+
+	return 0;
 
+fail_core_clks:
+	core_clks_disable(core);
+fail_pmdomains:
+	vcodec_domains_disable(core);
 	return ret;
 }
 
@@ -875,7 +989,7 @@ static int venc_power_v4(struct device *dev, int on)
 	return ret;
 }
 
-static int vcodec_domains_get(struct venus_core *core)
+static int vcodec_domains_get_v4(struct venus_core *core)
 {
 	int ret;
 	struct device *dev = core->dev;
@@ -999,7 +1113,7 @@ static int core_get_v4(struct venus_core *core)
 	if (ret)
 		return ret;
 
-	ret = vcodec_domains_get(core);
+	ret = vcodec_domains_get_v4(core);
 	if (ret)
 		return ret;
 

-- 
2.54.0


