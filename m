Return-Path: <linux-media+bounces-16231-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA2F950E49
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 23:03:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DB22284624
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 21:03:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C21F51A7065;
	Tue, 13 Aug 2024 21:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZNq7vPR3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C664F881
	for <linux-media@vger.kernel.org>; Tue, 13 Aug 2024 21:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723583029; cv=none; b=IwI94Y/5DHIBFIVOAiOK9kIRc4Pe5srGauIC1XnPhRSWTg7U5tCfAcFsAtT3HzgrhZTH09MqUzwztO1uvKIDyUrsox1/UryYMVm8HsY5ZzmZP6msA/5KNaqazJYT+1fjSgLqGBlYZSJ/qyHxARRpu/30ifBgjbu2ko1kl7dnaDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723583029; c=relaxed/simple;
	bh=VOweK8PQ/gAkRKbFxvY7for42INZkO4QySgiYbu6c1o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=vBQyNsITr98rRdq6iUUDALD2crOh4F+lckFhv6bpP7lAqMU3DlXMmsoCZt7Df5RX1IrmuqPQ5+j69eIGl9z3jJ51sP4bag8iXoBTFHQYdkon3dywQ+fene0qrSV9My4CABZzM3LY4RKrs+htG9kp8cEDGU78ieHh3L6hDeLAIcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZNq7vPR3; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2f3abc11aebso29001fa.2
        for <linux-media@vger.kernel.org>; Tue, 13 Aug 2024 14:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723583025; x=1724187825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IM45oK3YCR2mok7TNdngSg3shVd3/oRyHb9pehRWI4s=;
        b=ZNq7vPR3tELOHZumQNSnKBox2/A+UMXDCEZpPMC0M1w+M40XvcGghMJwzcn3xzstsx
         tuny2rCagjoaNMtOcesQtynPZGPHNUjsvn5dV5DL2sV0qkMJESAzBmAQ9LHaHfYxuOrK
         RDbBvSdAKcxzrZs5vPnkVOBlI20Rj4yylIQkgBV/hvv23QMJiDxlZlWNP+b724IuxNbG
         aT4Ot8DjOlg/frW+nksbMKhpOTvV7ScbbjAR9nQPtIVy5kiuq7UwsHa4idMmn8woTvj6
         JQBA3kkFGh1IGdHc63KtP3f/GUZ9JFEXYustTULxZR0b/AiFT8TX7ke5m00dgzD69ocX
         zHFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723583025; x=1724187825;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IM45oK3YCR2mok7TNdngSg3shVd3/oRyHb9pehRWI4s=;
        b=U2jsEAcwVkTUtoY0ZVx+XCinKN5SieYa0LzH1MQOTf3KtxV+tQSATWCEIZove2kA7l
         Z9WoV7gyqNPZdGYt29ijxZqkH8uP6eMORQg+WEddT7GHCPdLG2zZUyjpU8H27gAULWup
         g+pwFn8h34M2wj4yvTsRXonzkPqiJYPxMKBwT7yHUz8YiAQOn13YVp8NmDjWuzqwY14n
         wuwDFLl5tto9VGkRKeX8mwrppjyNeBcTnDcvu7HTFHLcUc9NdasJgOaZwQ6PIGzM1bbv
         /Vw1+6uQrPN4nkyhN+ZLKOmvyNn+ijxs/bGSiZyCLf63iDQiz/eeTUHQ9PkVql7CMP95
         VtIg==
X-Forwarded-Encrypted: i=1; AJvYcCXoI4F508fPQjC8kjDASITlGYa6fpXzW7ieUsQHTqe9HljbN2y0RcIoKPCFZ419vJSXbugR1Isi8VMTFtH1yS2V1/bpUQ5A57z1ihU=
X-Gm-Message-State: AOJu0Yy+jpaNJL15uBhQclhy4p8wmyAGGeo5LxUZdRH2H9/obY3dOeZ/
	csBnYMLSdAQRNiHR1WewerBMh2fhmxybjbjowWpTsFUXEKl2HgA8eCqIScHdjxE=
X-Google-Smtp-Source: AGHT+IGAmUDDh+yjG4h6miHuvy01WxUdpMT89kii0BGWLUB9xEtioKPmQa16EznSRG4scGxABxLHnQ==
X-Received: by 2002:a05:6512:33ce:b0:52f:c0dd:d168 with SMTP id 2adb3069b0e04-532edbc8153mr218958e87.7.1723583025135;
        Tue, 13 Aug 2024 14:03:45 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53200f4217dsm1075060e87.269.2024.08.13.14.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 14:03:44 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Robert Foss <rfoss@kernel.org>
Cc: Todor Tomov <todor.too@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2] media: qcom: camss: fix error path on configuration of power domains
Date: Wed, 14 Aug 2024 00:03:42 +0300
Message-ID: <20240813210342.1765944-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a chance to meet runtime issues during configuration of CAMSS
power domains, because on the error path dev_pm_domain_detach() is
unexpectedly called with NULL or error pointer.

One of the simplest ways to reproduce the problem is to probe CAMSS
driver before registration of CAMSS power domains, for instance if
a platform CAMCC driver is simply not built.

Warning backtrace example:

    Unable to handle kernel NULL pointer dereference at virtual address 00000000000001a2

    <snip>

    pc : dev_pm_domain_detach+0x8/0x48
    lr : camss_probe+0x374/0x9c0

    <snip>

    Call trace:
     dev_pm_domain_detach+0x8/0x48
     platform_probe+0x70/0xf0
     really_probe+0xc4/0x2a8
     __driver_probe_device+0x80/0x140
     driver_probe_device+0x48/0x170
     __device_attach_driver+0xc0/0x148
     bus_for_each_drv+0x88/0xf0
     __device_attach+0xb0/0x1c0
     device_initial_probe+0x1c/0x30
     bus_probe_device+0xb4/0xc0
     deferred_probe_work_func+0x90/0xd0
     process_one_work+0x164/0x3e0
     worker_thread+0x310/0x420
     kthread+0x120/0x130
     ret_from_fork+0x10/0x20

Fixes: 23aa4f0cd327 ("media: qcom: camss: Move VFE power-domain specifics into vfe.c")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
The first version of the patch and discussion is found over here:

  https://lore.kernel.org/all/20240806221204.1560258-1-vladimir.zapolskiy@linaro.org/

Changes from v1 to v2:
* added an encountered runtime warning to the commit message per ask from Bryan.

I tested this fix in both cases of set and unset "power-domain-names"
property in camss device tree node, and I didn't find any negative side
effects of the fix.

 drivers/media/platform/qcom/camss/camss.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 51b1d3550421..aa894be1461d 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2130,10 +2130,8 @@ static int camss_configure_pd(struct camss *camss)
 	if (camss->res->pd_name) {
 		camss->genpd = dev_pm_domain_attach_by_name(camss->dev,
 							    camss->res->pd_name);
-		if (IS_ERR(camss->genpd)) {
-			ret = PTR_ERR(camss->genpd);
-			goto fail_pm;
-		}
+		if (IS_ERR(camss->genpd))
+			return PTR_ERR(camss->genpd);
 	}
 
 	if (!camss->genpd) {
@@ -2143,14 +2141,13 @@ static int camss_configure_pd(struct camss *camss)
 		 */
 		camss->genpd = dev_pm_domain_attach_by_id(camss->dev,
 							  camss->genpd_num - 1);
+		if (IS_ERR(camss->genpd))
+			return PTR_ERR(camss->genpd);
 	}
-	if (IS_ERR_OR_NULL(camss->genpd)) {
-		if (!camss->genpd)
-			ret = -ENODEV;
-		else
-			ret = PTR_ERR(camss->genpd);
-		goto fail_pm;
-	}
+
+	if (!camss->genpd)
+		return -ENODEV;
+
 	camss->genpd_link = device_link_add(camss->dev, camss->genpd,
 					    DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME |
 					    DL_FLAG_RPM_ACTIVE);
-- 
2.45.2


