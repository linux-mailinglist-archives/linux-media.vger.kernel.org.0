Return-Path: <linux-media+bounces-51656-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNVBOiuveGlasAEAu9opvQ
	(envelope-from <linux-media+bounces-51656-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 13:27:23 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4400B94542
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 13:27:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C573430B020A
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 12:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A1EA34D384;
	Tue, 27 Jan 2026 12:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ERYD639x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QYJ/i3Sb"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C294B34D938
	for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 12:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769516594; cv=none; b=ogespCT9KOku1cmCMH3YUzNpf6XbExkDPlN5TsNcniwAHaL1k323DIX4Z8A1L6vUJX6l85QP8wnR2lfGNZXF9OWHFy6VbrOD5dLGJ5M6IZLl82CMJe19gyz7DHnrkAtav40yPxJ6j4/T9RuM3I7+wXohqRuqhDzTlJLc4y88Sic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769516594; c=relaxed/simple;
	bh=d0mivciHY9AxCx6/jQ9UUdYzV7StCQnyxCBFMqtokCM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FJUM8q9aM+BfQzUoB5ZVTBIlI5rwq1/SrP/ODjq2weffT+62rSjU3WIgRUVjTfcWnHWJ6Lb5wUxS5EIPw88D80QZRtGsBf9inVX2lf6WPAIdINKmLJCDNkC4JR72eVBNuKkiEjc7XEE/Zokpr80MJNGyzjeHEaiJUuUnRmtYDCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ERYD639x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QYJ/i3Sb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RBxigk1137473
	for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 12:23:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3XXLH2/gt1UFb03g8YATYc4EauWQ9zsYRjVX1F1y4ss=; b=ERYD639x8juQXj9Q
	DfN2Q7wXk0Bv3gZuvNvqh/k3BfLi6eLboyWlxRSDmrYO7xpWoxeSZZRYrOJfwmCI
	d3beY/DOvRjs89X5qZoXNeX5qUfrGl490bkW+L0/HShRiKMr79kU7YnGgwk8hcr6
	izs32exdnhn7RbS08r1S5LKgAAry0r+87xJ557Y0X032xq3mqRnsBFK5frroi16f
	24Kuy1+fjmcOHrx7EWXikExAJLAWhEZaWuDugAtS3SRjO3WQVp1xlxl1bI/ruu4Q
	AOroJmTHo9SAdkQ2QruQjeX9WAgWbbg4j7OMvdghA2m6sjIXf1x/ciObMZRSJwAt
	rqYL9Q==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxsjegsq4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 12:23:10 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9412e67d171so20699646241.1
        for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 04:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769516590; x=1770121390; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3XXLH2/gt1UFb03g8YATYc4EauWQ9zsYRjVX1F1y4ss=;
        b=QYJ/i3SbbNh6d3hlrSm3BQDwOsAKQJb62FPLrBLgg6WpCbUHMvmGm/pPcZ/L28AAsM
         AdYr0UUsN9M/NDFTd1VKcJNt57gElnk3aTeHP83oDkbA27vdysAlr5ciiBF2HOFw661B
         kjCswpDO3Y0HbQHTbcKg1GijXOzBNn5ur+xCMZRphpUoEhqVVDBBJj3D6df9Jf1h+WbL
         Ju6uv9B6qlWNKccstFIxyYTH0oAPz1j7j0ispYnoknX9dRQ9EWVJtWC3m3hyCe048rYn
         8GocGBw9Cny6sWXGmEgMDPE1jByuldT3pdpuphQXZTG8I2DtLk5NZ6+yTXcvVvYfBYpQ
         vztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769516590; x=1770121390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3XXLH2/gt1UFb03g8YATYc4EauWQ9zsYRjVX1F1y4ss=;
        b=o3/5XpagoWzJQVZ27FlSA5IiufifQeBvhRDz/dN6K78ZLJX36+OBv2XTABqnN+OJNm
         AOF/nv52XCF4/Vg9MK+0c8YIKvVuHYK1g+UusiMXiqbb1rmwU1HTWEc0uQsfhvBs1VDi
         iSX4xrQep742ck0Hk7moQ6E8TKahA/xiuHuojclBketsDI0aa6m7tRalBtAaFkjuA8GS
         LePlQ9EROzZPr1rR/6TQbpaqfNFbEIJaFPd/yrnyVGI6p62B3FiB8n3K2gtcC2LcTMqq
         F6RA6paKKXkZTnKKo2IRUyr6eUmu3Zq7pnRbBaTxsDDAFNufgoykNI119I1WKH6m2Ghc
         UA1w==
X-Gm-Message-State: AOJu0YysCu+afNXO/wxcPlY7EQJ0dAhxPZmjWxcywFuoTf9xmHFQAN4T
	RgrxwIN511FbByl63mtmbbpv0dbfLsOP93BlOQIMUJSFj/A+dRYR8EnDhY7BOdn1thIkoCeGrzK
	+sQj+lMuKIF5YIuVQ2KE2wFF7hGRWYzQ6xUfm7DX6pa9Xz4QBJ+ndW5U8j8LVRKN/mQ==
X-Gm-Gg: AZuq6aK77x2sStTj3zpxBpudFjT9JqpbEq2PD/+lhjB4LiEkhzK+gxwNH/qV3QaWOYw
	0CyAyqZ7vKqpTz1QjrohuQw5h4A/lnq3uazRinnh+AUKOup+mjR2D+G6qQPjz/Xyb5MVhol/5pf
	7CGoIG6XUeEH7XNcIwaGIP7bC8jwGKn4cKWk74+rEOmEdpjVjjibqw5icn0Oyne73Q4TM1D9e3s
	rczHMk5Z0oQBYljqREblsFdw9GxKvF0C7qJnBi3BkovN/c6qXniyeD88cl0IeIt4aDJNSgU6ChU
	sJOiz7eIA4Qo+9sQOjrGGA6qZlbyZBow1miFw9x6XdQZYAFs9XizdXw7lCNquLbf65b9gEBCUjD
	Qmn7loJeF87Dm+omFEbNXbEuPlym9GMb+LC60pUa/KIH1DugEK/CPGR8DGg/+QYqqVAz3Cq3okU
	xIJnY43WAEg9foSwrzcFybYNs=
X-Received: by 2002:a05:6102:a47:b0:5ef:233e:6b25 with SMTP id ada2fe7eead31-5f7237dff87mr699937137.13.1769516589963;
        Tue, 27 Jan 2026 04:23:09 -0800 (PST)
X-Received: by 2002:a05:6102:a47:b0:5ef:233e:6b25 with SMTP id ada2fe7eead31-5f7237dff87mr699920137.13.1769516589478;
        Tue, 27 Jan 2026 04:23:09 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59de492cc4asm3375442e87.101.2026.01.27.04.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 04:23:07 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 14:23:02 +0200
Subject: [PATCH v3 3/4] media: dt-bindings: qcom-sc7180-venus: move
 video-firmware here
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-venus-iris-flip-switch-v3-3-7f37689f4b39@oss.qualcomm.com>
References: <20260127-venus-iris-flip-switch-v3-0-7f37689f4b39@oss.qualcomm.com>
In-Reply-To: <20260127-venus-iris-flip-switch-v3-0-7f37689f4b39@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2150;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=d0mivciHY9AxCx6/jQ9UUdYzV7StCQnyxCBFMqtokCM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpeK4mQ4BC+9XHFrK2cB3Pmp/vlistwOWiV0NB7
 Ki02qFZMnKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXiuJgAKCRCLPIo+Aiko
 1TF8B/wMn7ddnz9WuVh3rs4q+ecLjjo9VGghK73huibFP3NkTX2uKUEr2YUj/bXGcPA7CAgMpfP
 MBB1gOi4D9tk8jlMXhLq21JCcJo7bZOmTBUHjWr6tMZvvl3i5Tpkfs6Oqti0aoISvA07k0g0lmg
 JCEfBWm6zb3Ed3Y/3sOCqKV4A4Msw19qBRtZPJibNv2+iPDakBYXJ/NZUKWq3ZLTYEOEj2rFqZ4
 6R6NX5ZTV1tL/4U1enxPFgP7+4Gu64xDJ+dfBcvRTadIo/5gK4iakzXxE1jhjW1he17MHmS/KCZ
 hc/RP+QSMLBhPzDGtYWV7xwGzPeq32CEq2mha7iN/1axrtpN
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEwMSBTYWx0ZWRfXzSK1+i5DMcAU
 VlXD2XoBmppRCQxYy/UGzjRMbHNc1+plYD6p+cosxRg7qje92VF1+ftSdtUGRokLrvBXLLSPOI2
 Jr+XtAQ/Ki2fHgFr23hflsc3YfbgomMC2BHx747/rSslbViXNRjdimpSiyD2+4fXynxb4cYWblg
 ubWAvJos5glZlj3uX547Q/TU9lG0k9F5gCHG9G5kSEK9W/rmuE0idfbxSvXdpOc/SvEBoiImCeK
 57LyiCyuS+ykXiEnlV3m6yTRPP7scVffLdomviiYyMSOWo0bOazWVVytr+znTRdcRkfGwc1Q0wM
 SIva/x/DCFAZF9Pbwby2uPRFWLkEvcazHV/ooUggVYnoDZFmaQu5z1Tnh+UGOlCEIsan40NyqpA
 0sWOAPyKjFsk8U+ra4BrzMlLQaxPnf9FPpp45ZCPoqpdVW6A0yzq7pog9pT+c7oPjhTvygIBnKi
 zhaA0tAJp0pJKhJuf1g==
X-Authority-Analysis: v=2.4 cv=Qelrf8bv c=1 sm=1 tr=0 ts=6978ae2e cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=0e9ukYqe-uxmdYkeUVMA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: IHIQyXQgz8mRRSamXeKaGWLTvjOhcmnn
X-Proofpoint-GUID: IHIQyXQgz8mRRSamXeKaGWLTvjOhcmnn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270101
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51656-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4400B94542
X-Rspamd-Action: no action

As SC7180 is the only remaining user of the non-TZ / non-PAS setup which
uses the video-firmware subnode, move its definition from the common
schema to the SC7180-specific one.

These properties do not accurately describe the hardware.  Future
platforms that are going to support non-TZ setup will use different
semantics and different DT ABI (using the iommu-map property).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,sc7180-venus.yaml      | 15 +++++++++++++++
 .../devicetree/bindings/media/qcom,venus-common.yaml      | 15 ---------------
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
index bfd8b1ad4731..b21bed314848 100644
--- a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
@@ -91,6 +91,21 @@ properties:
     deprecated: true
     additionalProperties: false
 
+  video-firmware:
+    type: object
+    additionalProperties: false
+
+    description: |
+      Firmware subnode is needed when the platform does not
+      have TrustZone.
+
+    properties:
+      iommus:
+        maxItems: 1
+
+    required:
+      - iommus
+
 required:
   - compatible
   - power-domain-names
diff --git a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
index 3153d91f9d18..59a3fde846d2 100644
--- a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
@@ -47,21 +47,6 @@ properties:
     minItems: 1
     maxItems: 4
 
-  video-firmware:
-    type: object
-    additionalProperties: false
-
-    description: |
-      Firmware subnode is needed when the platform does not
-      have TrustZone.
-
-    properties:
-      iommus:
-        maxItems: 1
-
-    required:
-      - iommus
-
 required:
   - reg
   - clocks

-- 
2.47.3


