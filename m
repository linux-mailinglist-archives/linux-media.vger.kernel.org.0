Return-Path: <linux-media+bounces-60490-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIt7Hktl+mmaOgMAu9opvQ
	(envelope-from <linux-media+bounces-60490-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 23:46:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 581E34D4028
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 23:46:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A4FF63025DAE
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 21:46:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB7E54A13BE;
	Tue,  5 May 2026 21:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iiDf6cUF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5554A138E
	for <linux-media@vger.kernel.org>; Tue,  5 May 2026 21:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778017591; cv=none; b=tca8UnDeYGLJ9S3/X8K+75WHgx7PiuT4MXKSppNYfrM2gNnCYloSF5sPHYvllc3Et3CqbHv1fIGr5fdW7X2x+H0DkSAUw4AXbyto126PRMRlwr/LkfnLC2lBl02P8Kvn4xRZXrC8StWAVCUfK+SS8c7mqz51gC9qZ8lZcdIy6kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778017591; c=relaxed/simple;
	bh=Y3ohJ1oOQhONh2Boqz1nsKxlnH05B9SJoydn8ICKThM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RJOyyyeBpdQpIABEDCT46+sISrrnkLD/Ejnp5hh+e0bVvY9hAFv5Oq5Y2KrOPCVnluu7gU+xcYurWweEMlfhPq5c1OJ+9Acx3n3u9L+5V5V0gp3IQmKugjURcR9z2aQMgtwXqUn3WBsIvrEzhOiFFGmXSUDlP/8+AJCnYN2U/mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iiDf6cUF; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7bd5dde63dbso59302997b3.3
        for <linux-media@vger.kernel.org>; Tue, 05 May 2026 14:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778017589; x=1778622389; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3GemZJIkLJf1bCVrVzeTpeAfgV/EiAoljEyPbaTRdNw=;
        b=iiDf6cUFle/L8+TsbbPzd+HaRUbEaqWOswdiJgi6VIVywOvRJKTKEFNIlNcShXEoGn
         F91v3Ejq2icMUkidgk5OzFOg9TJK/ws2gXzQbR/39/TBJxxIMpKaju0Jx7rWhV+DISGW
         kQMWdocGG5r5uYFMhFBaNpFK4nCXFUiB+GauXz0zRU+sczy6JNJRD1JGgRLHy+3RV4Yx
         2hrQSHPXvCvW/PGgAReAH8C4qaZbLeCN8Vzkq1JFG5Xv++xE3/YxB7D9oTwL4XMdQGrV
         ElhAavdrwf1RW+PgvoradxnbQEyiEdFfIBqN7V6NY4hQ1c3GVtLtR3yLCpfDK4kgBY8D
         H9wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778017589; x=1778622389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3GemZJIkLJf1bCVrVzeTpeAfgV/EiAoljEyPbaTRdNw=;
        b=ZFUFA+M4OUguZjLySsqsOMRc9Zy4zBinq5OpqAf8dSu8RK9TwXdVNJ+8qPakW06mg3
         0tDOKVNyYnnO0JDeM6+Id0XJYRDF5gbCEby6s/A3Lji7Hz1k1Q3mS+iFYJlsUj5t4to4
         3wznZSK8klG481+fFyhuf/TDUMln6z1KPjA5czUy8Uoj9lxqq4BEfDMaXoxxZd8Qy+sb
         njjr/u9HCggG9V8EZGzKumhWY+SZdZ76V/Kq3XpU7FGEAg57vVjLS2K3pyJuRCZQ4uvK
         vAmz3c1uPoz+EgzAPIMH3b8TVrH0wQZwViJxONRgGegx9BOGAEH2eTXWHD5KFHYS7Elu
         arUw==
X-Gm-Message-State: AOJu0Yw2gHaFury8ZuUynySEkXa75zMVwuREIpxtfQ8Vrl6SBAcw2bgj
	MNbl4D9yg5EVLELuVDlhhoWNh9czFMHLJuwe3AO0PdwY2RIU8gxRxCJY
X-Gm-Gg: AeBDievZLp2qIGHY1+zbtVI2WNpUacclKNWbdRW9Ik3anUqhGqZ0nkZ9DFm54loVX7T
	/VJOFeakrNVbsBRMCVzXDaPVAwMCxttnZcKFYT4t6Xa2SGsq3cf9qK1Og8TO/tLoM69zit+C45U
	qDhUrrS1qoVKhsi+/a0g3ZbKwK4hHtjhjp7ryK3TWe2dadPjA+3QKz189Y+OtBcUs0hS8chaHRd
	SyB/5ZmG0ahBbvQeT2H4yTBAIX8ofR9sfIRHt1Nikqdvl/8WvdkpuE/8BojVtPU+g1rYmRGj61g
	pN3zoNq6dt3l2gUNGE2QFyVh4o6u9SEQ7GBHy9yePKsIJ0jIF0wnJmWs4Kn2wDA3961ZZ/EBJZ9
	ivHaTBZuB7Wj4Uo1WaE5U1dXWFFXKuYJR9rK0kA6/4ky2X2LSaxRhb9uKqdm//gHuLcumII2kS7
	bLjsYDRfJ+wQ0bRrSe5yjwMOfUblT0t838D6X0
X-Received: by 2002:a05:690c:d8b:b0:7ba:ded4:df5d with SMTP id 00721157ae682-7bdf5eb937fmr13916837b3.34.1778017588910;
        Tue, 05 May 2026 14:46:28 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6656542bsm70158767b3.20.2026.05.05.14.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 14:46:28 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Wed, 06 May 2026 00:44:45 +0300
Subject: [PATCH v4 8/9] media: qcom: venus: add power domain enable logic
 for Venus cores
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-msm8939-venus-rfc-v4-8-994f5eb22acb@gmail.com>
References: <20260506-msm8939-venus-rfc-v4-0-994f5eb22acb@gmail.com>
In-Reply-To: <20260506-msm8939-venus-rfc-v4-0-994f5eb22acb@gmail.com>
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
X-Rspamd-Queue-Id: 581E34D4028
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60490-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

Attach power domains for vdec and venc cores and power them up if a vdec
or venc session is started.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/pm_helpers.c | 80 +++++++++++++++++++++++++-
 1 file changed, 78 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index f0269524ac70..c8f7f220c713 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -299,8 +299,22 @@ static int load_scale_v1(struct venus_inst *inst)
 
 static int core_get_v1(struct venus_core *core)
 {
+	struct device *dev = core->dev;
+	const struct venus_resources *res = core->res;
+	const struct dev_pm_domain_attach_data vcodec_data = {
+		.pd_names = res->vcodec_pmdomains,
+		.num_pd_names = res->vcodec_pmdomains_num,
+		.pd_flags = PD_FLAG_NO_DEV_LINK,
+	};
 	int ret;
 
+	if (res->vcodec_pmdomains) {
+		ret = dev_pm_domain_attach_list(dev, &vcodec_data,
+						&core->pmdomains);
+		if (ret < 0)
+			return ret;
+	}
+
 	ret = core_clks_get(core);
 	if (ret)
 		return ret;
@@ -319,12 +333,70 @@ static void core_put_v1(struct venus_core *core)
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
 
+	return 0;
+}
+
+static int vcodec_get_v1(struct device *dev)
+{
+	struct venus_core *core = dev_get_drvdata(dev);
+
+	return vcodec_clks_get(core, core->dev, core->vcodec_clks,
+			       core->res->vcodec_clks);
+}
+
+static int vcodec_power_v1(struct device *dev, int on)
+{
+	struct venus_core *core = dev_get_drvdata(dev);
+	const struct venus_resources *res = core->res;
+	struct device *pd_dev;
+	int i = 1, ret;
+
+	if (on == POWER_ON) {
+		if (res->vcodec_pmdomains) {
+			for (; i < res->vcodec_pmdomains_num; i++) {
+				pd_dev = core->pmdomains->pd_devs[i];
+				ret = pm_runtime_resume_and_get(pd_dev);
+				if (ret)
+					goto err;
+			}
+		}
+
+		ret = vcodec_clks_enable(core, core->vcodec_clks);
+		if (ret)
+			goto err;
+	} else {
+		if (res->vcodec_pmdomains)
+			for (; i < res->vcodec_pmdomains_num; i++) {
+				pd_dev = core->pmdomains->pd_devs[i];
+				pm_runtime_put_sync(pd_dev);
+			}
+		vcodec_clks_disable(core, core->vcodec_clks);
+	}
+
+	return 0;
+err:
+	while (i-- > 1)
+		pm_runtime_put_sync(core->pmdomains->pd_devs[i]);
 	return ret;
 }
 
@@ -332,6 +404,10 @@ static const struct venus_pm_ops pm_ops_v1 = {
 	.core_get = core_get_v1,
 	.core_put = core_put_v1,
 	.core_power = core_power_v1,
+	.vdec_get = vcodec_get_v1,
+	.vdec_power = vcodec_power_v1,
+	.venc_get = vcodec_get_v1,
+	.venc_power = vcodec_power_v1,
 	.load_scale = load_scale_v1,
 };
 

-- 
2.54.0


