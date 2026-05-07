Return-Path: <linux-media+bounces-60873-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAS8DlEY/WlLXgAAu9opvQ
	(envelope-from <linux-media+bounces-60873-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 00:55:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1744EFFE5
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 00:55:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2FADE30AAFD8
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 22:51:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6639139478B;
	Thu,  7 May 2026 22:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LihrcusZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TBU+4Uj/"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4185F3D4117
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 22:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778194238; cv=none; b=VCMYhThht3PLj1KZsJmrjS7DQwbvAz2far3exvRHsYis5x3Fce0njg+WQjzWWDN3cM24TcOBR8OlMH1cS94Xf5v0HmyeYhdj+ybT6wQdsPLaC7zi91MJ/d8Yzey21fv5EW/68vM1+sOANfUyBPrxagxzO5lnC3eGW0DW7/XrJdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778194238; c=relaxed/simple;
	bh=y/+a20YL+ysQIFGE4+AK114lY8/mBSFRbp2rnNsk+9o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gmwn3qJX65jGeVYigGWfsuIEW1L5SsZR8si9n80qqSFawOAFMCch6aThuui5Onmk1hGiyY59u4+fmxEFSTpQV+QXpLPpnA3KpukzH916TaWI3iGlfoXGAljiuGB7cp9v2s+YGm7BqsSMx393ab9BMX/BZuLn4fLztZnqG905YRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LihrcusZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TBU+4Uj/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647IAJaf1971617
	for <linux-media@vger.kernel.org>; Thu, 7 May 2026 22:50:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fWBniTwp1rVPBTuTnmxciCl5iow63nGmhGyjthKvyds=; b=LihrcusZCPNaVV8G
	/hcNguhVavhDf3AN2SifQLSR7abJ7MknEWJyaSPOQ54/J7nV2i3nbNXDy0sbMx7b
	TGJ2FYEFkO1HIqciqVsVVyJJc2j7ExC5M/1TxuwMtBYv+yhstnBx0xq9IBN8WtsD
	l9W6KeVz2M9tBSLWBh6Z5EI9dhpObyszrtiPGU8EW+n8QR+7yinUg9UaazD8AAfn
	qNjuafvaImrtgS8ZCQPeViu3nyTi0w4Cp8ut2ktZRhWMVkkwgZsesf63VcYwhu3v
	yweuedmyEbfgTvjQ5jkZ9n8TBqILvjtUFkNr/If2DoOo8aPGWB0B3yarBmBjJKvw
	MXJtKw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0tejacfn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 07 May 2026 22:50:36 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6312af106fcso1648680137.3
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 15:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778194236; x=1778799036; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fWBniTwp1rVPBTuTnmxciCl5iow63nGmhGyjthKvyds=;
        b=TBU+4Uj/UoaKu+Gjxjb3mU0QSsRrG+pT+zcKgmlqKxPiCcgbAMTekVI7zlkUO8j6kJ
         aHGtCIhKcLhejN/jg6EpdpLGQQvXVHeFJRSbNVDc+5ABvre4m2QC+41Hehxps7joaBJg
         Cqw8eHTVO8thp7okVgFncfTxwV8BLl5rXLSklMe282oN2WITs4NX4830XifNWGHpV9ch
         ATln4qWi4cpV5sjqOfYoXYzzZhkk9bZawqVc0SyUOYHteHSwXsA4ma4bqIqV+ZrxDsRQ
         sBeqO65dj2dQYXx/5ob9U0LO9rJBsUx1mO2GmXSnXTFXPpk05bBJNfTAKmcIY0mbbFY0
         to4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778194236; x=1778799036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fWBniTwp1rVPBTuTnmxciCl5iow63nGmhGyjthKvyds=;
        b=rWjlUQyBZlEqDoBsVana6hiSWB1u0FE4iLclgqu7ZEPKLTfaSCTxtZTAM1/LZ8R2Tj
         3gBKYTZjqmvD7jUpVrv2Q4MwLLQK14cZIh042f0KbtdjRZhwrHP69QrrgxQ1044ON8lE
         agxRO78LEUsZGuprO7FZiehdrwG+z/xHms38QrVyWkUagFj9CBbW1bYVgUL1XIdtNAG+
         l/MQWk1552VWUixRNHKSITBsJE+YiLkxj/2wPTclmveQpMUWHZgBMSxKM4gPHxvP5734
         NHfj8Pgm23t2xWqxKJqyNT5iq4z98mTa5CmBEHlH7ic76SGGvBbQOfnHF9dXyDTTBMhs
         6rzg==
X-Gm-Message-State: AOJu0YwPG96MBTCKX5Z7D1kBV0oPeW7F1pxaIBG6L5GyFKoRT4RsLMhw
	TTunF1wWXhrgJ7u3aa07LynNN0s9gP4z+gpAi1aQ/tFyE4tMEeia55HEMF8HVZHTFfyFRvXu7xi
	O9FsRnEjBNahhiABJCIUAxlrlvRYk+/H7XzOCqvo9XWrisDjazvb8e/1za3ft+13iWg==
X-Gm-Gg: AeBDieuxcqE7O/3AuhFPf+69LZLqAeK+W4UDyZRip4gHpXOqtDh36gKL3Up7pigLCDZ
	ZmxW8KA0/njh3QRzSjww+lWv4URPFpIkbvxa7oezK+N+pLfs+oSwB7zE770ebxj+av90Vbab2on
	HBejPeR9fBqjmnMHZMghmgMHDfC1VvwkrTFErPwCFJRhtAly2mivb60q78Dbd65zLXiK6eG2h5g
	HRVoDkuxznnQDBC4GoK4TFTXO35YtGJlW7CnSw6o1JOaaByHiNbjRKDHV+43Z8Wy8kO76h+zMs7
	N8MkAgXFG/a9j7SS+w2GoDy2jqGmtV8QsWLlJjUawtELFhwn7hfDckmQkRAo27YJJP3aFCQ46+d
	bsGS1mf+O2KscTbGGLffcYaBde6QFnbBDcp4yzTgDoHIVNW/exPL1BhRVLdJnTQFhuUcGo4FOHY
	oG3vfBpJdrvBb8+p3J
X-Received: by 2002:a05:6102:8515:10b0:631:2973:5c2c with SMTP id ada2fe7eead31-63129736518mr1766702137.21.1778194235693;
        Thu, 07 May 2026 15:50:35 -0700 (PDT)
X-Received: by 2002:a05:6102:8515:10b0:631:2973:5c2c with SMTP id ada2fe7eead31-63129736518mr1766690137.21.1778194235272;
        Thu, 07 May 2026 15:50:35 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:b16a:3475:ec42:bcfa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac4359dbesm102466b.48.2026.05.07.15.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 15:50:33 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 08 May 2026 00:49:25 +0200
Subject: [PATCH v3 10/15] dt-bindings: media: qcom,qcm2290-camss: Add OPE
 ISP subnode
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-camss-isp-ope-v3-10-bb1055274603@oss.qualcomm.com>
References: <20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com>
In-Reply-To: <20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com>
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
        kieran.bingham@ideasonboard.com, johannes.goede@oss.qualcomm.com
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDIzMiBTYWx0ZWRfXx1fqHCOzx/AF
 /zwaRr3Ko3TWhSz2eXbESGuejbvjibluwp0YBfg4pEIAuXnRIQRmCfDTwsZLTr7gb7wgCnxYqZ0
 DtAFcxm0g8DM3leM0i6blgd7MYuKZeya3Q/SHXCHQzZhLYnkG7T6XTJY6W5FrFvJnfgL82SWjfy
 8FIhLVfWPgB4LxwbuSBqU6LPn5YeCyV3DZO9aNmkyqT2TSDKp/wnz6teDZ8frPy+9Xw7dKiOk9u
 UeefdFV7exUVlZcVLeBtAF8sYgj9Sc8I6y1IOPforbI0Ty/Y6QY7UanIhrGBDxK6h68iBBf8/gN
 XiAN37kChRg0juQdR3yG92N7/fbBKIMJCdkpB7PJrZR+Kti4w+2eDbQJyd2+Y78uRlIXksXi9oY
 KTPn4Udo9mQQgusWFupEZ7L5wF7e2LHKV/MWaMgUiBhxtox32cAirhMveGO0iTu/raCe5rjj04s
 +ie2gz1HNsAUDvaYiIg==
X-Proofpoint-GUID: ec3oEgraPQfKfMb0IRpoP2f8XAqokhDN
X-Authority-Analysis: v=2.4 cv=VNbtWdPX c=1 sm=1 tr=0 ts=69fd173c cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=M8sXMW5dAYDte-7YvdsA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: ec3oEgraPQfKfMb0IRpoP2f8XAqokhDN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070232
X-Rspamd-Queue-Id: AB1744EFFE5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60873-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Extend the qcm2290 CAMSS binding to describe CAMSS as a simple bus by
allowing child ISP nodes. Add the required address and size cells, as
well as ranges, and validate ISP subnodes against the existing
qcom,qcm2290-camss-ope schema.

On qcm2290 the OPE (Offline Processing Engine) is a memory-to-memory
ISP (Image Signal Processor).

The address-cells for the CAMSS bus is <2> (64-bit) as related
DMA/IOMMUs offer 36-bit addressing support.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,qcm2290-camss.yaml       | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
index 391d0f6f67ef5fdfea31dd3683477561516b1556..e70f4cd1348b8065ee9f0e4448185cfd8a8fb7de 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
@@ -52,6 +52,14 @@ properties:
       - const: vfe1
       - const: vfe1_cphy_rx
 
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 2
+
+  ranges: true
+
   interrupts:
     maxItems: 8
 
@@ -117,6 +125,11 @@ properties:
             required:
               - data-lanes
 
+patternProperties:
+  "^isp@[0-9a-f]+$":
+    $ref: /schemas/media/qcom,qcm2290-camss-ope.yaml
+    unevaluatedProperties: false
+
 required:
   - compatible
   - reg

-- 
2.34.1


