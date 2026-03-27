Return-Path: <linux-media+bounces-57357-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IP3NFDrpxmloQAUAu9opvQ
	(envelope-from <linux-media+bounces-57357-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 21:31:54 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A631734B020
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 21:31:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 004E230AB8D8
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 20:22:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 222203A6EF7;
	Fri, 27 Mar 2026 20:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ESWKwyAa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B6AGVNGX"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE453A3837
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 20:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774642805; cv=none; b=hjTWct/qooei2WOvlHyJV8U4SDzhnEXcibCZsNllSz6i9e3ldFbvd0rr3VFxhIkk1ZxZ6rmVsI7t/v6F7yalqDQr6AF/jCj6jAIhvXPqzxoBBXpdETH9k+g+BDbO6qNA3LhnhYwD3o3ze/3ej9WBSy60qVyscUxJo4lX6AVHf+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774642805; c=relaxed/simple;
	bh=pvGogtYz3ToyC7AvsbxMd3Op0x0cS14QLEENjtD1YWQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qIT4fZPBsprCSE2T3XAkvZinm4gTia5Gz02bqTpoZI1ZV63lwrx2c5vQdw+7EYnJa4KfywBvEmrf87mP3aoKRsHn4yhaW7P+HB+sYYkkdOe99g5HRmK7VVoSBlINN1YwAHSkrDk6v1qOkeLG51+BHMKsr/Y2pZFHn656jL5JNik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ESWKwyAa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B6AGVNGX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RI38ew1010728
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 20:20:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5sftBoUYRN8krc33OKZxWXSUXoLKwRmpS5072sKzwys=; b=ESWKwyAaen7w7fyP
	XCCojErwL/33jOzVPaPm3niAoGzOc7p07HJ4TXTX9V9/nJqqF1d9jYGEW0iou+3z
	Z48C4sDbXw2AMna3xAl+u+bjPbjtq9RHc/GyJxlnIexdXzOliyrStAxDqnzivFQL
	dfNm2seHP0iGxZ3Lkm7oXLERW6luDjynXPHjgTrdmax0V1pZNo1G2uDHvLxIY73+
	Pw3bS+Wad4smlr7d6ZCRgTj2sxHGsVtzdrZ0TVdmW+BEoP9vF0C7NvWlMl1tTzqB
	6W1WI3+sV3U+b3F3vMOQ+IktKoBTI/jbNTDMUNHSDmTct1dLilurLLJDGLdwWzLR
	yleKBQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5hapummq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 20:20:02 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5091782ab06so120937641cf.0
        for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 13:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774642801; x=1775247601; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5sftBoUYRN8krc33OKZxWXSUXoLKwRmpS5072sKzwys=;
        b=B6AGVNGX6eH4aHvY1ghnBw0JRlPO6AD0S00r9/ceCyl7VUcX2an4XQnNzPzsZNCc+O
         kCP90KLLeKUQ1sXzQOP1sKCUbJVIzxrpFrjdn13PRd83g2+Hy1z6LdVXHzULJRO3GJrq
         j1ZeM1cbaxJNbWurmr5GhE8yg8rvVoOuGuqlR4MumCRLGW91BmS1vHaVr7uu5DPcykDm
         t74bn4Sb86R0edCEyt95Qqdp+81tE/0wIN63w32quYUb1t+OCaVEYRKS7q1h6FaDZ8t8
         nohEYhlqjwKlZJaIh8jLSbSupOjBy1x9l+TPNqlYMeAN3ocvGJLRzcdgFiK72Z+1VTFk
         tCcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774642801; x=1775247601;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5sftBoUYRN8krc33OKZxWXSUXoLKwRmpS5072sKzwys=;
        b=qeFAeLsybVzDJcM+oKb6j8RXOq4ZG3J0FjEib4MBQQ3TRqcEg54wVbHp69sS91JyAE
         ofc/Mr2QV5ESHRFVnJYUD8JwtIrjfYoBYrFiz3Py2Cw0JTz4+4ZY89W74/DnIjlUkKdN
         R2LqdgX7mzMFBeiAh/FyOmX/JmvP6SijyqkzBhef2tK6mFdz/c/nJIOSA+LS6yypmR97
         +ROwH7AbhuqCsFlehap2xBYPsWIpGKpbAcS6W6WwXDkW4vXXIrMpbMVzg5Q6IRq4V8gI
         Cj1rLnPuIyy5dfxIvjdfDR02bYf1N6UNCbdcetT9lMxfMHFt+MlQANr3N0NyEcNqsN1Q
         b+pA==
X-Gm-Message-State: AOJu0YydbpOhk9EaI66M4y+92762aQeJLpIDLGKkWOc26pNMglSrIDyO
	yyWUE1CvHi8qrYIEMTSdOqiZwwNv0BOb+m9ERo65s7SIShv+TtD+Ywz1mnctFbCm0xSvxixtbOT
	FalssRRXybI5LSEkHNiAulcCgognudvJalfcnSJhtmAFTpcEFnnon02n/yXoQ20AduA==
X-Gm-Gg: ATEYQzw7ZN4tSHc+6jSTpjpSKNh8z0sTGjjwYvBQ9sruql+8wMPjJ4ZWbKqyA+4vmCr
	4U9Oa+DUIFvRZgVLxpob49Nnpd/eOmV5j/7NxZAcz91Gli1CFjCNs2XDwoVbcwohVIwOmHNrsfh
	AeKm+7c3TplHDEdTNs1S3EUf2R1w/OhBqh/xdlYvI356rMNF78yDyxIVU8eX+WRzOHXA6z5C1Yg
	vvefkvJCtlpTBzgGTbwajsuekVXmT4Njsrq3n0fQLszDzSnAgAjeLbHpZpEXFVf8FJkRjvBD2E1
	QM+x75rOsUm8Cj9iuNkOSvqa0HyGjEjdSZ+WiULOUe/jC9aNTnNo2wJtYBLGy5Bwvgwvd7Qbthl
	vrNdDOBzn+3c/rIaZPDU/p1u2glvcJYDqu/zOPhfNZKsnGUcD83k6unJWIh2CO2u+/hRdVRmyX/
	sKWpAn4Sq7vaERA1yeN6WmRTP7vojHlaW1HtI=
X-Received: by 2002:a05:622a:1886:b0:50b:2ca1:4d85 with SMTP id d75a77b69052e-50ba390dcb7mr51876601cf.52.1774642801201;
        Fri, 27 Mar 2026 13:20:01 -0700 (PDT)
X-Received: by 2002:a05:622a:1886:b0:50b:2ca1:4d85 with SMTP id d75a77b69052e-50ba390dcb7mr51876101cf.52.1774642800707;
        Fri, 27 Mar 2026 13:20:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c838931acsm506581fa.19.2026.03.27.13.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 13:19:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 22:19:54 +0200
Subject: [PATCH v5 2/4] media: dt-bindings: qcom-sc7180-venus: move
 video-firmware here
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-venus-iris-flip-switch-v5-2-2f4b6c636927@oss.qualcomm.com>
References: <20260327-venus-iris-flip-switch-v5-0-2f4b6c636927@oss.qualcomm.com>
In-Reply-To: <20260327-venus-iris-flip-switch-v5-0-2f4b6c636927@oss.qualcomm.com>
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
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2286;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=pvGogtYz3ToyC7AvsbxMd3Op0x0cS14QLEENjtD1YWQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpxuZrEeRxdm2oFgIKpGcq8XmJigyNmQyJIr2oE
 szumgoILv2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCacbmawAKCRCLPIo+Aiko
 1TAYCACSHejZpuRmFQIxR1d+ocU4SxkFFv9c/A7YB3JfkHaHvPZkLKu3Bw2W3R1xrmXjCIGheYW
 770KS9OuLpEuaWC7dRp90a/+pMtTTmBTNChqGI4BHWNA3FcPwsUFuAbdrYKvfKa0hyeVk6WwqKn
 KhQvKmgty9HKOzw6g8LHGb+k8dypNKn52slDc5uEPYwi3Q+oIxg3mehhVXL5xFKex/gvRVxy2zX
 QyWvhhi5sCJBM0sohsB36BU8q54f2BNtw4hHduB1jAwg/2kIx5tNYgBGAFzgJgq+uM7JDfYhUz/
 O7MVcjR6w0r9wDeAxax5hvyDQqKVgG4Dl8a7kuATAzdZP6/J
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=TqnrRTXh c=1 sm=1 tr=0 ts=69c6e672 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=0e9ukYqe-uxmdYkeUVMA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDE0MSBTYWx0ZWRfX3QICPITj6AR0
 bQwftgStstkq2H8nlOXTXSbBhD4qYlPycNSvxywTS+ftpe026/FwabgkVTW1QYu6Kd6+XCJUOs5
 kKSpg8Xx+0OdCDhVdqSk3amLv459NmY9uN3O0usYVJtl64Hw1murHeMtq9nA44PqnEcDo83/d/s
 kq+J83LDcBRawyXtseSx/dLWC4bNAFiUTX5fRc1ET1EK4sF/m2PqErv1fMNwubcq4Lyr87BkJpD
 9bZzg9tLmyEWIJ2Ok+Hz3Nblffq4MQLn7133NOi43Xv3iwAS5uCYe9j/ynbTO6WRnAo1YPhfKC4
 gWgD6pE4bIBZlrzt39vFFTpFdI7G/gCnCmT7Lkb1Av64UY+QynKEv/d5mwUB97OABIzPAsdcy7k
 AEH/xjSasYokFpWZmFOIF00A8qJOj2Kf19zVzC0o8tbDkVBfC30y7dVO0Fe9xHOU5W64/PINAhP
 h8DnBXq/JG2NthdIjpQ==
X-Proofpoint-GUID: Ajy8JmuH9xIvcnUZKIvYqV4sKKwxORuT
X-Proofpoint-ORIG-GUID: Ajy8JmuH9xIvcnUZKIvYqV4sKKwxORuT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270141
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
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57357-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: A631734B020
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

As SC7180 is the only remaining user of the non-TZ / non-PAS setup which
uses the video-firmware subnode, move its definition from the common
schema to the SC7180-specific one.

These properties do not accurately describe the hardware.  Future
platforms that are going to support non-TZ setup will use different
semantics and different DT ABI (using the iommu-map property).

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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


