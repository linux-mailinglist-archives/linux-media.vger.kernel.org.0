Return-Path: <linux-media+bounces-60755-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4NEdCNJR/GlOOAAAu9opvQ
	(envelope-from <linux-media+bounces-60755-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 10:48:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2CA4E51A6
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 10:48:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE05C310E070
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 08:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20EA936A02F;
	Thu,  7 May 2026 08:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X3qBq5hc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998D036D9E6
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 08:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778142857; cv=none; b=ZHsnhnXLStcYiVu5ZENSkeS9Gc/4i94LHOdqZHcu3zHi7Sz+phD55R6iIKfpk78C0k/DpKUeERlBiUH812sXYqDm9MlGS+/M4vaeJ5ZLFtwLXqk0Y1L4gRfD4uaIkF6S1lH+m2NdTfAn4TpEcEG3rrhsXGEg2VgZTYopPPC1PXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778142857; c=relaxed/simple;
	bh=vTU3Z89HA99bN3j6sKV+bw2kMvuJDfIovWMl+GhVzkU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c2DKO6XV//7+BNnA1gI7O+1lSE8Ap+9nkLqEtszKN9ZoaU9m0tTRXs1pUD5U7QbbcWNL9G7plkfINoFucY07xRRjmxMcYb+8XZlxWdChDSueLg1qhZJcu80YSEPQWClgsduWUOlyzSYx8AWOi4LrVMwIAYP1Hc/YXvAdAU2G0DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X3qBq5hc; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-794719afcd4so4897927b3.1
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 01:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778142851; x=1778747651; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4uAlkVZEBZAqm8F3pW/2Zom25vwxBzMU/2m2hGNPbhw=;
        b=X3qBq5hcMy3JxJaxDz605ax93ByTCCh6fE6rUQM/fuNy2k+xsqjXkK3+bczf0W/LBI
         KSBRkloYYxYw7LUp8hPpfQ8R0X3ZrJdTHLvXQyvXfhJTNYGJWBQK8rG2Vk9jC9TZHqo4
         iv+bN4AlbMs3S1IlzQOcJcrlQgMePuxgqg6tW/ZoRcgBbpp2+mPYXzM2PpCIH+iKgvnr
         RRYLKVzn+LtCTRhwoFc0YyfleoNsn6qXMIeTAyFRCKdFtNfZSsIPATyhu1XSJrrd0boP
         Vbk6rZo611HEbmdzmxNODUrrwab8Rq0tdq2Bs98N/73b/jeW9PxnoY6QDLs7K2aWuib0
         fXbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778142851; x=1778747651;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4uAlkVZEBZAqm8F3pW/2Zom25vwxBzMU/2m2hGNPbhw=;
        b=qnRhCoGEfI+CVDmnQzU261f8tpOhhSCqRw1I4uGwvS19bqwiNjTVbaxRAJp0fCCiKz
         vuc8ck00ZfdfNJmRR+BUK7VMs2lAOvQL7ZcGu+QdTLblLI5x++fF9q3EA5Msza8BDUuT
         epG/9Pczi89EpcWBGM5onxfDWJqa7ysEAUJzZiLb7BxCvlvXwN2/3pt56lt5O1RHkWAr
         NMPBAgK+6fITZk+S1mFh35idmb7/dHy1FQN11LaQA6y5uIj145nn6R/PgHmRTvNCqbZD
         uaULRc+REAhDo/uX18ffk1Ryafpu5XzjPJr47/s5Q8HyLAj6KU9QU/iHkf7VrPUNOqYN
         BT8g==
X-Gm-Message-State: AOJu0YxxnNcOkrZiOYO3sZFn9ni37737UmpM8ipYux2j94lOGDxtrg4v
	Zh+Yw69jbtiGEX1ZOVkuu2M/eJj0Hw66WgwIr7BOIe5cUdfBvmJRgIy/
X-Gm-Gg: AeBDietcN2/1XkAz3tinT2xrQ7S+VpCDJ1s40/mqjMmAj7bvff+PMloCERmk/LzDzbk
	rJweUrnU6rTk6oQHKz9ZxErHDFv0gKVwI++ZwoFBk8zaKMHF1lFWW0j2f2B1ysz4dOW7I9YmxnG
	foyUXXrndN/qPHOB9SmRtta0sX1ub2xk8CyIUcHZMmtirRmO9KXpeDc2DAfWMn0/+85buaqfkyb
	2m1NikdAh4/h5cQUn3ryvhH0nwlzMWZ9K+h/JmE0ZSk+WsLSZ5L2pQJ8ToQOglOZJ5iUG1BG+/6
	MIboTx5bYOO9rtc5aSywuBe6zHseo9dDNLAdUIKpLM4tQL1tEHsfYL2/dtWKEOAufQlzQShiyuQ
	0VKDGb6EsB71BO8HKpmSJVg2XV1xygM61fQCKA0HbtuVX6v1UBoOAc3GOIYX7btM+UJfFj+yu5S
	ZuhwlQ0Rfl8H+RScqi94T0IOUwL4JxwQ2GSfny
X-Received: by 2002:a05:690c:6d81:b0:7bd:5cc4:1961 with SMTP id 00721157ae682-7bdf5eac2c6mr67476427b3.37.1778142851217;
        Thu, 07 May 2026 01:34:11 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6683794dsm91692297b3.27.2026.05.07.01.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 01:34:09 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 07 May 2026 11:32:21 +0300
Subject: [PATCH v5 6/8] media: qcom: venus: add power domain enable logic
 for Venus cores
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-msm8939-venus-rfc-v5-6-d7b5ea2ce591@gmail.com>
References: <20260507-msm8939-venus-rfc-v5-0-d7b5ea2ce591@gmail.com>
In-Reply-To: <20260507-msm8939-venus-rfc-v5-0-d7b5ea2ce591@gmail.com>
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
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: BD2CA4E51A6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60755-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Attach power domains for vdec and venc cores and power them up if a vdec
or venc session is started.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/pm_helpers.c | 149 ++++++++++++++++++++++++-
 1 file changed, 145 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index f0269524ac70..5ed7cbef8149 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -297,10 +297,31 @@ static int load_scale_v1(struct venus_inst *inst)
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
+	return dev_pm_domain_attach_list(dev, &vcodec_data,
+					 &core->pmdomains);
+}
+
 static int core_get_v1(struct venus_core *core)
 {
 	int ret;
 
+	ret = vcodec_domains_get_v1(core);
+	if (ret < 0)
+		return ret;
+
 	ret = core_clks_get(core);
 	if (ret)
 		return ret;
@@ -319,12 +340,128 @@ static void core_put_v1(struct venus_core *core)
 static int core_power_v1(struct venus_core *core, int on)
 {
 	int ret = 0;
+	struct device *pd_dev = core->res->vcodec_pmdomains ?
+		core->pmdomains->pd_devs[0] : NULL;
 
-	if (on == POWER_ON)
+	if (on == POWER_ON) {
+		if (pd_dev) {
+			ret = pm_runtime_resume_and_get(pd_dev);
+			if (ret)
+				return ret;
+		}
 		ret = core_clks_enable(core);
-	else
+		if (ret) {
+			pm_runtime_put_sync(pd_dev);
+			return ret;
+		}
+	} else {
+		if (pd_dev)
+			pm_runtime_put_sync(pd_dev);
 		core_clks_disable(core);
+	}
+
+	return 0;
+}
+
+static int vcodec_domains_enable(struct venus_core *core)
+{
+	const struct venus_resources *res = core->res;
+	struct device *pd_dev;
+	int i = 1, ret;
+
+	if (!res->vcodec_pmdomains)
+		return 0;
+
+	for (; i < res->vcodec_pmdomains_num; i++) {
+		pd_dev = core->pmdomains->pd_devs[i];
+		ret = pm_runtime_resume_and_get(pd_dev);
+		if (ret)
+			goto err;
+	}
+
+	return 0;
+err:
+	while (i-- > 1)
+		pm_runtime_put_sync(core->pmdomains->pd_devs[i]);
+	return ret;
+}
+
+static void vcodec_domains_disable(struct venus_core *core)
+{
+	const struct venus_resources *res = core->res;
+	struct device *pd_dev;
+	int i = 1;
+
+	if (!res->vcodec_pmdomains)
+		return;
+
+	for (; i < res->vcodec_pmdomains_num; i++) {
+		pd_dev = core->pmdomains->pd_devs[i];
+		pm_runtime_put_sync(pd_dev);
+	}
+}
+
+static int vdec_get_v1(struct device *dev)
+{
+	struct venus_core *core = dev_get_drvdata(dev);
+
+	return vcodec_clks_get(core, core->dev, core->vcodec0_clks,
+			       core->res->vcodec0_clks);
+}
+
+static int vdec_power_v1(struct device *dev, int on)
+{
+	struct venus_core *core = dev_get_drvdata(dev);
+	int ret;
+
+	if (on == POWER_ON) {
+		ret = vcodec_domains_enable(core);
+		if (ret)
+			return ret;
+
+		ret = vcodec_clks_enable(core, core->vcodec0_clks);
+		if (ret)
+			goto err;
+	} else {
+		vcodec_domains_disable(core);
+		vcodec_clks_disable(core, core->vcodec0_clks);
+	}
+
+	return 0;
+err:
+	vcodec_domains_disable(core);
+	return ret;
+}
 
+static int venc_get_v1(struct device *dev)
+{
+	struct venus_core *core = dev_get_drvdata(dev);
+
+	return vcodec_clks_get(core, core->dev, core->vcodec1_clks,
+			       core->res->vcodec1_clks);
+}
+
+static int venc_power_v1(struct device *dev, int on)
+{
+	struct venus_core *core = dev_get_drvdata(dev);
+	int ret;
+
+	if (on == POWER_ON) {
+		ret = vcodec_domains_enable(core);
+		if (ret)
+			return ret;
+
+		ret = vcodec_clks_enable(core, core->vcodec1_clks);
+		if (ret)
+			goto err;
+	} else {
+		vcodec_domains_disable(core);
+		vcodec_clks_disable(core, core->vcodec1_clks);
+	}
+
+	return 0;
+err:
+	vcodec_domains_disable(core);
 	return ret;
 }
 
@@ -332,6 +469,10 @@ static const struct venus_pm_ops pm_ops_v1 = {
 	.core_get = core_get_v1,
 	.core_put = core_put_v1,
 	.core_power = core_power_v1,
+	.vdec_get = vdec_get_v1,
+	.vdec_power = vdec_power_v1,
+	.venc_get = venc_get_v1,
+	.venc_power = venc_power_v1,
 	.load_scale = load_scale_v1,
 };
 
@@ -875,7 +1016,7 @@ static int venc_power_v4(struct device *dev, int on)
 	return ret;
 }
 
-static int vcodec_domains_get(struct venus_core *core)
+static int vcodec_domains_get_v4(struct venus_core *core)
 {
 	int ret;
 	struct device *dev = core->dev;
@@ -993,7 +1134,7 @@ static int core_get_v4(struct venus_core *core)
 	if (ret)
 		return ret;
 
-	ret = vcodec_domains_get(core);
+	ret = vcodec_domains_get_v4(core);
 	if (ret)
 		return ret;
 

-- 
2.54.0


