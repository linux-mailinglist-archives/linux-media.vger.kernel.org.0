Return-Path: <linux-media+bounces-59670-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFBZGvJa72llAgEAu9opvQ
	(envelope-from <linux-media+bounces-59670-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 14:47:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D7769472B7C
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 14:47:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 103AD3028C29
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 12:46:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C9B03BAD81;
	Mon, 27 Apr 2026 12:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X1uPdLIG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bzkQREdo"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606AB3033C6
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 12:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777294003; cv=none; b=pZoP0BDyWgGtMkRk2GuGH2xx85kdbd00rwxwfD4di+8c/B+Eaqrfjcr+g24CijXGoTmV4sdSpk4a2SDmVRY7Jk6fHjgjSeaOU8hCztOyZxOacKW4s/8yw40kJ5LlQxhWuRPrbwiI3PbmJBhMWLqmTkgG93TDdwnEMngRlNSS2hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777294003; c=relaxed/simple;
	bh=U/xIWfIVyxF2mQ02rx0FKseSqm13qZ1XiNmxrWwriB8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r9WBVxOlylLL96HPpXvuNNu/3LrkJB5d5D8cXi8GC9UhvQBrC/gfLW44qzq6D6ePPFO+aDPAmUz1SO8NctqViVvhs48yg/zN+gw6TMKXv8KK0lp40GZXHRDX8w9TZBUvTROXVU1U/jbHYRr4TWDa6sN7/1QsgQpNkJbo72Jjs0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X1uPdLIG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bzkQREdo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8T8fR1761960
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 12:46:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S4kiIupbbdzP1AaB54zj5uEJPC21c2MwWBaLlQ5wgiU=; b=X1uPdLIGlNZRxzwR
	/7qKi6EbNQ10JMyLzWgqarhhPJB6jpuCwCq6dUInbebyfQxxVR45i9Zh+6WnaWe8
	buVESTnNACxCrhJ360/QEVLLoCAQiNObjtvn95RAVJNB/JHQD01D6Svg4QJGkjSn
	zmdg0WVGe9BtQDbRIWE8W4QZ2uGof6Gmmkj9jRoxeH5JV8EKYyrlLneRvBB6Yenv
	na8hoh2eAzO5nPjBOQrOU43sgWVC8/KZO3sKviNMv/EsSV0Ajz3nlsptD91M5Yad
	3NOsazrLiaEWOPeXnVwGaKQAC5PayTXPpfpDnqOzfJwENY+afWbm0MfDIthQ5FJS
	+J1SUA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drpw9e3ch-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 12:46:40 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6100b5a0757so16104368137.1
        for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 05:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777293999; x=1777898799; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S4kiIupbbdzP1AaB54zj5uEJPC21c2MwWBaLlQ5wgiU=;
        b=bzkQREdohcoh3eE6JVy9aJV+4+0Ls6pyw+ExBe/rypz2J3G8wg4cnQZNJkHWwhhS7+
         s70zZVIBI7sWy+/AzXcQOimWFwBQmTjNFy9UxUrlOvwy0dMfBKPmolOBfUkdNIBTDZ26
         4CIOu8ieNRyAyqTaqAxFjrzCRxZsGPd8nQGACy5TZ8F4G+AMc6L97G/4IqxTH8IqWxmc
         7FjKjetZh/8BdG4P3PHg95rHHSJPNCN6DUVmhX+kBcMrL5leQ7R+Nluu2XiBhE9gN21k
         iLSKEx3uttx1glvRdlbrMbmzMvWGcCvIRNzdY/+8oYv7GF71xK193CNV7yBRJ83FKRg6
         tSXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777293999; x=1777898799;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S4kiIupbbdzP1AaB54zj5uEJPC21c2MwWBaLlQ5wgiU=;
        b=C1scb8GFOKE1k2ESRpB6kLCMS7KNMvSJwBHoL+sWgxlnXeohAp08oV1Tx0ckZXGeL7
         jYdTf6mlz0O8G4V5SRLsRfe7mXBXQhJ5lgNedjnBeEkRc5pYn9pLzucpHQX3qYngR6/E
         I1ZxQE2Zzb3sT0zFKVEFwD6hQeryZ2V+GGlfff/hua0T5i7VPmnQmL55/fG9KDr/qaTI
         xDVyd1f3YTBcYjWBtonlLGML4E3mmRmFL+gUHPeAw6SJC2JzoVI99ItLJo42hmVKkcQa
         kBaWVYTQh7lmDUbHfInAw1J9u8ugqAgtsENnbdpZt0wk0EcC/fArgs6U+X4zE6tdr95T
         lhFw==
X-Gm-Message-State: AOJu0YzNwMLnAaeihTiSdJVZ6EBEDLiyjWBhlQWH4FgCSvi23oRwo3Tp
	kM5zvGhB7XcM2D4NiWAdpP0rK8ge5rFDzFnU6KSSG7MYCg2EmDgYafS5t29SNunw2CxqEyCUwk5
	e2mD8ssKfjhlZTO0M7ceUIhW1NLGG4j7Qs/GYjmKPP8XcAdUTh6uyuaHleqQAP4mt3g==
X-Gm-Gg: AeBDietMtQfS/dkvOXb3sOPCnT6NsR26OB8yKT9hdKz4+OzsFwgp0BoOSYACjc7FH6c
	H6tR3mIUYWn80z4LA5f3I2Py7j7+zIZJnRs1+WAUQigwr3zS8fGNefzfT/5IYtebS1B7F3jRebV
	gf+xRtGYfnoZiTdUt2w6SFbLGDXTPLFAOj2ah7WnNQXUXpXKYSUgut6N5X+toNPMFtpQ0C5m9Yr
	XVVHxc45iJ95M6Z475qeHAl+kQ6XgCwSI83GHYWW64WBxShXmQUKMaSe44IALEEwz4DjqbQKqky
	rahYFsZGYaEIM17pJ/Nx0V+ra5E+Z8bq+uZc4yHZ5WhMqUzbgZRsTn43k4+M+Twh4k5J+H6Y7VR
	1xHPpHoERtwGWXFrKeAvDLCN7Jm8n69IU/8RepYvreWHWe95xDWWhO3/ahKOchTDIFq5cLh56jU
	Pp24rnIQTwfkYKPaoamATy9aYEGZk=
X-Received: by 2002:a05:6102:4e:b0:617:9372:dd24 with SMTP id ada2fe7eead31-6179372e22amr15468854137.20.1777293999113;
        Mon, 27 Apr 2026 05:46:39 -0700 (PDT)
X-Received: by 2002:a05:6102:4e:b0:617:9372:dd24 with SMTP id ada2fe7eead31-6179372e22amr15468817137.20.1777293998705;
        Mon, 27 Apr 2026 05:46:38 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:653f:4d28:6a78:a6ca])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1bd19sm1091496866b.37.2026.04.27.05.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 05:46:37 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 14:43:29 +0200
Subject: [PATCH v2 02/14] media: qcom: camss: Add PM clock support and
 integrate with runtime PM
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-camss-isp-ope-v2-2-f430e7485009@oss.qualcomm.com>
References: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
In-Reply-To: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: 7LKyw6OupHpHET8Wb1U_yjllC3HCA0EB
X-Authority-Analysis: v=2.4 cv=H67rBeYi c=1 sm=1 tr=0 ts=69ef5ab0 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=yohlUIewGNSudplHeboA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEzNSBTYWx0ZWRfX+2pzDKDMGGth
 LeQNjnWgBHGfN+JyfGeUoDS7utL9fKz4vDEN/58WOH2Iz8lF6980spCZi1UKMCzvt6c3nb2Mx/9
 Foze8HPyXLOmDZ/M+uWYX+3J11l39+oRtpmEuXIZuS50FcqmXR2Vo/65dqTdNZHt+/vZ6YRGVkc
 sktLVMihp2+BkKYHn8bWztvN/Jy4e0TJ3oWGzHnQLkKgoiVvBgVLsAX4gsiPDmflnouCS/MrE6S
 l8slkV5zleLgUYRIcu5XSf0YpBDP2xm0JuFHoL4d9P9JGY0FtDQWsFaJpQjrOA7cudfDrIaaMDt
 Mdvten8uYAF5afXZcl78vnE8F7IZ1R9ohKWbY81CYxgrzQ58c0rsxsDdaE/GmLNmO0VCer1OMS9
 SZqoLP4YyjiBuIGDT0baK7Tminl4ekT2+tvwDOsD6ddSJ0gi0kfkUzQpDmcIc+kEo5V6C6LAXlo
 h/vwMIj4cVqMQqIpCkg==
X-Proofpoint-ORIG-GUID: 7LKyw6OupHpHET8Wb1U_yjllC3HCA0EB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270135
X-Rspamd-Queue-Id: D7769472B7C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-59670-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Add optional PM clock support to the CAMSS driver using the PM clock
framework. This allows CAMSS clocks to be registered once and
automatically managed during runtime suspend and resume.

This is especially useful for global CAMSS clocks that are shared across
multiple CAMSS subnodes. Now that CAMSS is modeled as a simple-bus,
these clocks are automatically enabled whenever a child node becomes
active.

This avoids the need for each subdevice to reference and manage the
shared clocks individually. A typical example is the set of clocks in
the top_group, which may be used by CSID, PHY, CCI, OPE, and other
CAMSS blocks.

Introduce a small PM clock descriptor table in the CAMSS resources
structure to describe clocks and their optional rates. Initialize
these clocks at probe time and delegate clock ownership to the PM
core.

Hook PM clock handling into the runtime PM callbacks to ensure clocks
are properly suspended and resumed alongside power domains and ICC
paths.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 54 ++++++++++++++++++++++++++++++-
 drivers/media/platform/qcom/camss/camss.h |  6 ++++
 2 files changed, 59 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 8f2b1d3cd9f289895aa439443d2a18bb036fccde..ca68ad7fc9ff30eae23d3baf34cf1ca642acf9d7 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -19,6 +19,7 @@
 #include <linux/of_platform.h>
 #include <linux/pm_runtime.h>
 #include <linux/pm_domain.h>
+#include <linux/pm_clock.h>
 #include <linux/slab.h>
 #include <linux/videodev2.h>
 
@@ -4593,6 +4594,49 @@ static void camss_genpd_cleanup(struct camss *camss)
 	dev_pm_domain_detach(camss->genpd, true);
 }
 
+static int camss_init_pm_clks(struct camss *camss)
+{
+	struct device *dev = camss->dev;
+	unsigned int i;
+	int ret;
+
+	if (!camss->res->pm_clks[0].name)
+		return 0;
+
+	ret = devm_pm_clk_create(dev);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < CAMSS_RES_MAX && camss->res->pm_clks[i].name; i++) {
+		const struct camss_pm_clk *entry = &camss->res->pm_clks[i];
+		struct clk *clk;
+
+		clk = clk_get(dev, entry->name);
+		if (IS_ERR(clk)) {
+			dev_warn(dev, "failed to get pm_clk %s: %pe\n",
+				 entry->name, clk);
+			continue;
+		}
+
+		if (entry->rate) {
+			ret = clk_set_rate(clk, entry->rate);
+			if (ret)
+				dev_warn(dev, "failed to set rate for pm_clk %s: %d\n",
+					 entry->name, ret);
+		}
+
+		/* PM takes ownership of the clock, no explicit clk_put() is required. */
+		ret = pm_clk_add_clk(dev, clk);
+		if (ret) {
+			dev_warn(dev, "failed to add pm_clk %s: %d\n",
+				 entry->name, ret);
+			clk_put(clk);
+		}
+	}
+
+	return 0;
+}
+
 /*
  * camss_probe - Probe CAMSS platform device
  * @pdev: Pointer to CAMSS platform device
@@ -4677,6 +4721,10 @@ static int camss_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(dev);
 
+	ret = camss_init_pm_clks(camss);
+	if (ret)
+		goto err_v4l2_device_unregister;
+
 	ret = camss_of_parse_ports(camss);
 	if (ret < 0)
 		goto err_v4l2_device_unregister;
@@ -4984,7 +5032,7 @@ static int __maybe_unused camss_runtime_suspend(struct device *dev)
 			return ret;
 	}
 
-	return 0;
+	return pm_clk_suspend(dev);
 }
 
 static int __maybe_unused camss_runtime_resume(struct device *dev)
@@ -4994,6 +5042,10 @@ static int __maybe_unused camss_runtime_resume(struct device *dev)
 	int i;
 	int ret;
 
+	ret = pm_clk_resume(dev);
+	if (ret)
+		return ret;
+
 	for (i = 0; i < camss->res->icc_path_num; i++) {
 		ret = icc_set_bw(camss->icc_path[i],
 				 icc_res[i].icc_bw_tbl.avg,
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 9d9a62640e25dce0e8d45af9df01bbfd64b9bb4b..bd5e572f0a0a7daa1668831b7d2fc60e0498200d 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -100,9 +100,15 @@ enum icc_count {
 	ICC_SM8250_COUNT = 4,
 };
 
+struct camss_pm_clk {
+	const char *name;
+	unsigned long rate;	/* 0 = do not set rate */
+};
+
 struct camss_resources {
 	enum camss_version version;
 	const char *pd_name;
+	struct camss_pm_clk pm_clks[CAMSS_RES_MAX];
 	const struct camss_subdev_resources *csiphy_res;
 	const struct camss_subdev_resources *csid_res;
 	const struct camss_subdev_resources *ispif_res;

-- 
2.34.1


