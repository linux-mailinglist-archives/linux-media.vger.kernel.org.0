Return-Path: <linux-media+bounces-55505-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eP/CGiDZsmlDQAAAu9opvQ
	(envelope-from <linux-media+bounces-55505-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 16:17:52 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA34274213
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 16:17:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 15D75306CE34
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 15:14:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53BE73C871A;
	Thu, 12 Mar 2026 15:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="neVENLHv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L3MVS5sD"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F0C3C73E3
	for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 15:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773328473; cv=none; b=l8AC6HFkvRgWf15faiHcabTUg+uCJp2VLzy2IOLmpmx9G+v8uJ7rgEDXV9j2NNYFRYivNTf1dbDtfU4u6Lxua2ePMbyB8CJ1EkzluPmboElnNMD3Zp1Ov99IdvjN01YcQBtUM+nqnnWzmalBDZGa9T8XmpGF0cYrPqYVfuBYJnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773328473; c=relaxed/simple;
	bh=4n+ezeOsiG6jQ/rP0xYQ+auI6P//RAr4Bw4iQYpjjmM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HU2GoE4c3sRvVS9hpSry+R1sXVCZo1s1OUBmrN3uiJE/RgOUqEIQX9huDVU0Hkzp7dwIGHuvOkA7SHGo0zl6pC60+etJgCMshaCAykLUL/VL4UoZq94d8Hp5I6rBX1BjOfX8q6hmNDotMI9ymW/r+HjxLFxmRP97tx476JM9yFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=neVENLHv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L3MVS5sD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CCPumb1594167
	for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 15:14:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MXuXiqLICsx00TbPqwOiMD8zMxqcG0nuNwwmGa/0IMw=; b=neVENLHveH3Vocdv
	DjmdLi032VsRdBCpoCp3dk3+mxkpmeWEqTa7cPaccX6aK7I6HqWU+HpVYnNJh53a
	NWZmwCMmgAt2MEA4QkL8KS6wbaxigVsOJDznMn5frLwvgvH/EecVE2MC+dvq8+j1
	GLtEc3fCxnUd8bAsBB7ui1SkBX6MJFv+GvrjRMr0WN8hJRuLt85ObK9w4xo5SJ7m
	uXa+S8eJ1J58/ifhOCzlNQ8PAVtYxHVSI4IlPlLS3QglJKG8XDnRQlMdTgHBXc2A
	dmJYH1c25dt38H2XGKl1l9O+duyONTWMgPOqGhGqFiG33fHavrHzImg4VpFB2BDE
	jRU2lg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cumvq9x6t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 15:14:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd81c571a5so692725885a.0
        for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 08:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773328469; x=1773933269; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MXuXiqLICsx00TbPqwOiMD8zMxqcG0nuNwwmGa/0IMw=;
        b=L3MVS5sDttgWf+r+LKRBQ5KCRWVT1+U5SlJyoTVmrJETwg7S3bonel4MINtrM3oEc5
         LIqzSnr9fmubau3LUijhCsGfYUCpapr/9vIMOUVRCNccROJPozb1A0EVQQgwT90NEXQA
         zB/qGstpyxlf5TDMfKeRzKtJClq97bl8WaFR8AOnAZVTxk21q1Hz26tz0B9isPJ3Kzw1
         G7UqRuOVxlLzMHB16JBgtGzCS0/moIV8/HeNXpDJeUfzV9TOQ6057L4YUrm7728CpSU4
         Qtq0I3fdIjlNhobuauZt0FMmF9u7g9J83N6afxtU52oEWSwdof6W74HxbeTbnrci6y26
         lq1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773328469; x=1773933269;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MXuXiqLICsx00TbPqwOiMD8zMxqcG0nuNwwmGa/0IMw=;
        b=sjxkrnlTAuD0tFYySSmOZ3OmY05vuPLUXhPRwBAP3TQ7qZ71w67yJPw+daYpjXNc40
         BHroWRmp9/G8uVNhg+BGAWgFUuiBvq7XbepWtpHkj8F+llmfQJFlc1/jTUiMDu6KNl6m
         4anBlf/KQNEieJtVI8NUFpC7UgXhQup8ayT2dDMNtzFVbY80LydbE1yaBjwF5O1hkmJT
         AnrtUt7fkhjtjkfwY+w3IgY7Cgk4GL4l61LT0Y39HUgPm9mES29CDalmijqFRDcCMmZc
         /2hYqOrsjsFvr4NcBk6m9tSsGXBBlkoM0s6d+USz2bHXpxXPq540xYT4MSk/Q2Tjm1NL
         23bw==
X-Gm-Message-State: AOJu0Yxwok/oFMI35FWUZ5GXqvT4LIz98N9Eg/lCtrhcpBz7rlls/jLD
	Qg/z5OFC6zgs85YElBhu/KY0YYoEJy2dbW2z1e6jA34vOJHTEDsWttRNN8CXGXjIYuyJzldldM4
	U719Yw+vS2MgUzWGd75bZvU4ADlMixvHJ4tc7S9cnqemJkdPGP+SZ1Vxg7Xmy/GPXLw==
X-Gm-Gg: ATEYQzz1DutnJaNd67UX8jtRi5DDcNA3eqHpBREgTn2CvOlCIidjfQDP4UhFE4NtlNL
	tPJV2Ep9bnuBrTkIfPN3k86VlXpWx9EGjyyInsmkaIZAeCyaOsmNSkDnSjkherj/2dJSQ44O+mG
	0v7pImbb9ByfKBnIzZ9romavVFlZPG6IEafZ3v9w75Q9bY9qvPOgAdu0C0lq2D9/gyXuGyjPVMJ
	Pl3j+gdyLfIwdpvDh2wX++g8wTmc9t6BlWi7/5f1T4xth7Pq5uAi7tjVNB/0Rw6nAJZiOV0sU2M
	+zB6KNl88iCEwhPAqY12apQTMBw60PVehGb0C4ohgQA4McVNy/UymcJCDB56E//N2+RkbCDtiyw
	EGq23RAeTiO/Reh8YBwNbSj7O8k608UyRaR64jGwzPkEmhujzdz5kMRdmC56CO77K4L9jJDiBZJ
	vz5eikQkW71fgFQzgZ3OPZMe2hYOqtg1+7uGo=
X-Received: by 2002:a05:620a:3193:b0:8cd:8785:eff4 with SMTP id af79cd13be357-8cdb5a3fa29mr10087785a.15.1773328469265;
        Thu, 12 Mar 2026 08:14:29 -0700 (PDT)
X-Received: by 2002:a05:620a:3193:b0:8cd:8785:eff4 with SMTP id af79cd13be357-8cdb5a3fa29mr10082085a.15.1773328468749;
        Thu, 12 Mar 2026 08:14:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15635786bsm972822e87.61.2026.03.12.08.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 08:14:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 17:14:22 +0200
Subject: [PATCH v4 1/6] media: dt-bindings: Document SC8280XP/SM8350 Iris
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-iris-sc8280xp-v4-1-a047ef1e3c7d@oss.qualcomm.com>
References: <20260312-iris-sc8280xp-v4-0-a047ef1e3c7d@oss.qualcomm.com>
In-Reply-To: <20260312-iris-sc8280xp-v4-0-a047ef1e3c7d@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1310;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4n+ezeOsiG6jQ/rP0xYQ+auI6P//RAr4Bw4iQYpjjmM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpsthQvfr9gHJIu/Mkgc/jIphCnUKy3xyHBrAts
 camYccWh8uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabLYUAAKCRCLPIo+Aiko
 1R/AB/45dWMySGjoQ/Uo3aboOrOiFFBNOoZQlEkXdwF7SvCbzIHpVSb09nOIpow1Xg5m9xy1tV/
 b9WspjWN1rGdpNQiC0A3CFIjuqYkLVXfhbvapLv9cfWiuCGPLQzg2uCGmJ2qIGaMBY5xdv6Osul
 /QRRMIUFyZE5YnYO40TOPBjZ9Ldq1yk1HBF8fkYSLY1VJJhG/CFCpdu/cKmrh/uJxa970VDNEBV
 fNGyQlYGt9PV12l0ePQXRPTDP6qnt+vkfXvqK+KKcsx27V4R/QnJSGabJsF5179jN04WKIQ9hgz
 PyK3aXdfMwPBTBpuK5sF+INC9fD+tDek8F6GjpYldZHd/17V
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: X6gcuSDnlwIh3uJKZfkZTW7vOAgUAZhH
X-Proofpoint-GUID: X6gcuSDnlwIh3uJKZfkZTW7vOAgUAZhH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEyMSBTYWx0ZWRfXw79cWtoZtQsW
 OkaDcWA/iQnHJ5inja5TM12bF593x3Skj61x9SW3P0tk0T8edg+rN2joklerfqmAOl0eQW/4bfN
 umbKsEOAu5SrwJfsCOr3e/GTZOy+Dp5ebBoKezp0LEkSB1Grin/InFxUCmLbsRWa65sU9wKufuf
 NNuy3hzDe+nQKKjAqFwBDVHbU77u5FKw0300D7uhBExScSW6zI69gbpsZKt7dlIFk6wEzlbFMHw
 KbRSg6nKazIGrBINCh2pyQo8raudyse+7EP1cDRRkmqSnHjjqBuwPikeX/wAJtAk5l9xIkq6fqV
 UhWbUFE8CzMLU66iEzGWPxr3KofiIKN+iHC9YrMgEbCiXrt5UEwWmOS3/3tzeN5Jw7hPXbMRasJ
 gif5zJHPZJFahphby+fmDvw9lq2MQcJibb6ByXNqAWW6rB84plQKN+nQ/r04jxSoAqwmpyJerzj
 ZkqrZumOiIRqZTSpeXA==
X-Authority-Analysis: v=2.4 cv=ccHfb3DM c=1 sm=1 tr=0 ts=69b2d857 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=5xS6gZYSRwgnaRfeS_sA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120121
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55505-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2BA34274213
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Iris block on SM8350 and SC8280XP is compatible with the Iris
(Venus) on SM8250. Document those two IP cores, using qcom,sm8250-venus
as a fallback compatible.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
index 43a10d9f664e..3700f8fe91cc 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Stanimir Varbanov <stanimir.varbanov@linaro.org>
 
 description: |
-  The Venus IP is a video encode and decode accelerator present
+  The Iris2 IP is a video encode and decode accelerator present
   on Qualcomm platforms
 
 allOf:
@@ -18,7 +18,13 @@ allOf:
 
 properties:
   compatible:
-    const: qcom,sm8250-venus
+    oneOf:
+      - const: qcom,sm8250-venus
+      - items:
+        - enum:
+            - qcom,sc8280xp-iris
+            - qcom,sm8350-iris
+        - const: qcom,sm8250-venus
 
   power-domains:
     minItems: 2

-- 
2.47.3


