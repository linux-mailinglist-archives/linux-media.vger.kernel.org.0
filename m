Return-Path: <linux-media+bounces-66509-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sVYCE7LaR2pagQAAu9opvQ
	(envelope-from <linux-media+bounces-66509-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:52:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C0C704060
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:52:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=yjiNcwQo;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66509-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66509-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5F99F30315C8
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 15:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB21F2C21C4;
	Fri,  3 Jul 2026 15:51:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542582C21D8
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 15:51:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783093916; cv=none; b=mG+cTU+Aldgyn7NHVhlEjGyGCW4GX+KmKoBQVfqQU3LoGknkeExr3cmHHr+w4/BOi2jT4c55u0Wy5QnGKC0vOo2eYV8uAN6PWu0oX3/bFydhisoIKbHZfZPVExp0VV0nRNymJ5ilDG0j/HZtQphOviROuJt5RJH4d2dsUafHCSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783093916; c=relaxed/simple;
	bh=AWNdcWNoO0K/4Dz81ubcB66iaZ7bQRNg/Xv4aHd0AIU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WavOiwcTOJFc/J/+ol1sBGHtKbajB3HzKT1ohBvdR7djZqs2TOE4mYj7+J4cU5kZ6+Movfqc8oijrpAUKyR0XWFexwSwQV6O5cCYVyoVJsSVmxvGLrQDNCYzWB9xiiyzBILoe/oxolfX2RMokd+u9XbT1+iKInT0DYzpRzzugkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yjiNcwQo; arc=none smtp.client-ip=209.85.128.50
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493c55d5c7aso6390955e9.1
        for <linux-media@vger.kernel.org>; Fri, 03 Jul 2026 08:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783093913; x=1783698713; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VTtyezqOtvqZjLO782drXUWeSl+rKs7UQO/GpaFditA=;
        b=yjiNcwQo/yMGQfecmtvWh6EAICn8WMfINjA0fsIhMh1F0UxNTBH1WOcztDN9NGdcEz
         uM/YnacFtxM6vws1JSCP9keRrQ2O4gogKRXKe/4KsYilUO+X7kcl941+hjL95euo90xa
         VR2zm+nO5hhTgpNYqDYgWzlVUr/3/CQy8GWUANlYDfiyTgtU3y3/TPW4OjyRf/ssGOPZ
         FfYhDzaH3Tw3Ht0mxMyB3GNq9g3CplKTcj0fayP8yu+fpW1wxCUulXg3+2D1WJ8nmq/C
         PBduil88C3xaCtZh++G3f5DD+W8wnezaNGW6Y9k8IBccq9qOO3BgwITV4604zCAT0EoU
         +xPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783093913; x=1783698713;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VTtyezqOtvqZjLO782drXUWeSl+rKs7UQO/GpaFditA=;
        b=pcNE0vPKo8KNjDFAMJCP8UejkkUfodOQhwWecUZzEaqNQuUYysNx1U7ENs582gigyO
         UibqXIpL4ZulfEdE43ED2tRAkkdUsglMIBNj9J0dttLEh4Yt4VrkQHvkIkPSrvxpyRxT
         JFE8EoPl2lLLRO7Zl9Rxzg4oa8Dudj4ltnNZn5rP4t1aW8fvT7R0lrG2LeUpHp/v8iJ6
         higtcQCd5IdWs2740QhykUJWgwzJSbIWwWBtaanetNaFnQHgYB0KITQmBMKSMAVa6PDW
         ErNtvasAkd+evxU/MJXgfaMejU1xYUC6BGaoOzCTalAwnFVLviYdjcWwldIDdcA4PdYD
         vh9w==
X-Forwarded-Encrypted: i=1; AFNElJ/yh8QomOAH9jcY7F9BEVrI+jQJGqrMM1J335hUTTDFZ2MWUjMkomNbSVYIArjPJDYC6Qglo+HegCGiIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMiSmy/ODe9t5/5x3LdVWm6Sg6D1cl5Snbh2AzlG0UaM2VL7hu
	et4UfrHJ5YNoY1vzSb7Z3nP5mI1VHIykWXe4pqgn0KVq7i7Dwgn90cgSJfmnzTwkt4Y=
X-Gm-Gg: AfdE7cn78wi4oA3NIpV0FFI7vOZEylujIvz2AHDaJUbag9CRhkFZnlsc8jr/n6Ht8An
	WzqIp9EW18LZ81yQWBOKpmje76g34EQbJMPFM8qSMtwVDwHzVCCyfr1e3PuTuxTh0F4BOKJWPnV
	8MCfwXXc6GgHtGCQ8FySoqj2ewSP8jhdeM5BByzhDD+C5+Xv+PnZ4TllJxTf8dmZxt7fxDPObFz
	NHapV1seMGGbLPoI5PWyYAnLjK1MAAEdKpn1/hGPWB/VX5KN2D94LY4SvBpPqYlG6vi7sli8n32
	LC46ybx4U71gwGHGctCUkPtr5GtAwUNdYHeUYUxXGtqRis8Mzh9WnfSBQGU77gVpR9PO6fp6w00
	rvmRvr+8RPyX7mqshs47bjpkQFhORAM3NPYWkaLpBkbxdwWP8Jr9ttGuUHs4M7gg5F7HyK1YAKa
	MVWxIHKA==
X-Received: by 2002:a05:600c:4c97:b0:490:52fb:12dd with SMTP id 5b1f17b1804b1-493d0f0f406mr3259965e9.10.1783093912871;
        Fri, 03 Jul 2026 08:51:52 -0700 (PDT)
Received: from [127.0.0.1] ([78.152.220.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba97csm141294655e9.12.2026.07.03.08.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 08:51:52 -0700 (PDT)
From: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
X-Google-Original-From: Bryan O'Donoghue <bod@kernel.org>
Date: Fri, 03 Jul 2026 16:51:46 +0100
Subject: [PATCH 2/7] media: qcom: camss: Launch ICP from CAMSS
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-qcom-laptops-v6-18-rc4-camss-icp-bps-ipe-icp-boots-stats-b4-v1-2-595df9e67790@kernel.org>
References: <20260703-qcom-laptops-v6-18-rc4-camss-icp-bps-ipe-icp-boots-stats-b4-v1-0-595df9e67790@kernel.org>
In-Reply-To: <20260703-qcom-laptops-v6-18-rc4-camss-icp-bps-ipe-icp-boots-stats-b4-v1-0-595df9e67790@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2301; i=bod@kernel.org;
 h=from:subject:message-id; bh=AWNdcWNoO0K/4Dz81ubcB66iaZ7bQRNg/Xv4aHd0AIU=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqR9qTLhQZXtVwPg5ioGs5M+J83wpyvYvCSE79J
 tuIY5NO/gqJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCakfakwAKCRAicTuzoY3I
 Opa+D/9PRXVkg+cgf4LLsRa0XMrBKj6AU3EA9ubS9ReF3r59bMcKWaOJD12W40yC1M6Mwh0EuhL
 FbIT5RT0fRsZFZDf5Mn1/uDmrbGsKjXeInLVBE5UK12Q/B/g8urS4rQkLAK0WeKZDi8AdcHUk0i
 5W/aDtHQi+MkeDgcFTFNOgx4FgzFQRmMQvyW/noecLz7EFIxL6V3S8t2AFyD0K/qagP+FttZPPn
 TkkutgWeIJHVaDUN/g62f/EReaqnbRyaZ3gyD4IUpGw0BN2sjykEoyU0IZbnFdFLmczqdMEHJzA
 n/lQjWVwCsOJX7uHEJp1LX1HrIM5mK8ypXP/ddQk1mQVj54EDEFqk6hEOdh/m8NWGgQGw/L41/R
 RhsoYrouIJ9fNDqOW5kY2TFhT0Fo7e3soTlJa6gXKcE0otN04oaK94qkIcuugLLdW9mqnR/Oy0v
 vk5laIa3wUIpuuJWcDdMRQ9NO514oSD+aDmLGxQAoxFVCa11RCdDsF0Ce295hSINf+aJT2pTkxs
 aWPqPBY7zoKrOTG8xGX02CckCrcijV+73xcbWwdwugeOHcKKZ2Rs5YeIBeDj2eR+yOEU0JFncUE
 s1M/oBLTXn1fk9meoEndd7E2OYGNYcTtvQ66XuTVLah9HEt4+RST0YxxMTExguNz4C/fwAomGt8
 20Gi3U4Rl5toIUQ==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_RHS_MATCH_TO(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:todor.too@gmail.com,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:mchehab@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:bod@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:todortoo@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-66509-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:from_mime,linaro.org:dkim,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 09C0C704060

Launch ICP from CAMSS.

Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 drivers/media/platform/qcom/camss/camss.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 499e349aa4929..eafa8a1eaaa36 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -16,6 +16,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/of_graph.h>
+#include <linux/of_platform.h>
 #include <linux/pm_runtime.h>
 #include <linux/pm_domain.h>
 #include <linux/slab.h>
@@ -4962,6 +4963,15 @@ static void camss_genpd_cleanup(struct camss *camss)
 	dev_pm_domain_detach(camss->genpd, true);
 }
 
+/*
+ * Match table for child nodes that camss.c registers as platform devices.
+ * This includes existing nodes (csiphy, csid, vfe) plus the new ICP node.
+ */
+static const struct of_device_id camss_child_match[] = {
+	{ .compatible = "qcom,x1e80100-camss-icp" },	/* NEW: ICP node */
+	{ }
+};
+
 /*
  * camss_probe - Probe CAMSS platform device
  * @pdev: Pointer to CAMSS platform device
@@ -5043,6 +5053,23 @@ static int camss_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(dev);
 
+	/*
+	 * Register child nodes as platform devices.
+	 *
+	 * This includes:
+	 * - Existing: csiphy, csid, vfe
+	 * - New: icp
+	 *
+	 * Note: IPE and BPS are NOT registered here. They are siblings
+	 * of ICP in the device tree, but are registered by the ICP
+	 * driver since ICP needs to probe first to provide HFI.
+	 */
+	ret = of_platform_populate(dev->of_node, camss_child_match, NULL, dev);
+	if (ret) {
+		dev_err(dev, "Failed to populate child devices: %d\n", ret);
+		goto err_of_platform_depopulate;
+	}
+
 	ret = camss_parse_ports(camss);
 	if (ret < 0)
 		goto err_v4l2_device_unregister;
@@ -5079,6 +5106,8 @@ static int camss_probe(struct platform_device *pdev)
 	v4l2_device_unregister(&camss->v4l2_dev);
 	v4l2_async_nf_cleanup(&camss->notifier);
 	pm_runtime_disable(dev);
+err_of_platform_depopulate:
+	of_platform_depopulate(&pdev->dev);
 err_media_device_cleanup:
 	media_device_cleanup(&camss->media_dev);
 err_genpd_cleanup:

-- 
2.54.0


