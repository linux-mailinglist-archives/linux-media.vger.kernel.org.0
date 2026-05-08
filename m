Return-Path: <linux-media+bounces-60919-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKARMgrM/Wk9jQAAu9opvQ
	(envelope-from <linux-media+bounces-60919-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 13:42:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7614F5E4A
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 13:42:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96D68303CFB0
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2026 11:41:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 311963DA7C3;
	Fri,  8 May 2026 11:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WM8N0uOx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X9blZh5J"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A9538424F
	for <linux-media@vger.kernel.org>; Fri,  8 May 2026 11:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778240469; cv=none; b=NMcyIXNKZISbMR/8uyLoqki7zgCcfFCTmIZaKthZr9Sl4YY080w7ETqO5FdSkobrCh3mTbWNPx1H6n9SVmf+4skTn5kyaQSswpMcOj2czZAemws53LvqWXAxkntqyszrP69JB7Xq+f6AMoC9+oLlMw4xI/wXyEsIaxxkaDE5PtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778240469; c=relaxed/simple;
	bh=wL+PFPuEZjGfoGr6iw7QtFmEgPFcLQXjULTTfexQiWc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KEVfMjFMZr5ujiY/OBhtYx/B356sNooaWekkQqJYi7fM+u58dvEB9LvA46kw69XWGJaoTgKCxDl+XxAFXLowq02ufkCiv5ntF11wykzw5r/9p/aV72d8bxOl/PzyDFonFma3YbxQuwIg0SlzvFzXwuwH47Z62YDz6pULVJSIJZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WM8N0uOx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X9blZh5J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6486jhJ4260579
	for <linux-media@vger.kernel.org>; Fri, 8 May 2026 11:41:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2QMZfo5GvIx279y7myj/MFns4ZF9kvnCOIi7ZALa51o=; b=WM8N0uOxtF7HrAkU
	77MJPHEkWvD5zCcGnwNlz3B7OvgUokhAQXyQHbdJcRXLiTru2CRxt0DxVkLgO+Xu
	KpCiSKGm1hhTUiSa95H8c8OgFTHVLsxSYpl1LHIRVm94OjAUEaOo7RYxBK/Hv9LL
	l0rbTercJYh3aodq2wgawgW6argjLv+DswbeVxdW1Z2oeacOjXnGkH8M6pj+q1MM
	sjXpjd1s0ytLk0RjDxEYIFi/y7xcl/EEDnbxXEqFPlVxRkFqbFmIrIdFMT8HxzLN
	tXBIwvOlZr7CGxrzktnWqMSQbmAA99tyG9NyUJRUt01bxi/hX64nVLF9MWiDC+Vi
	3NlSmw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1aueh3g9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 08 May 2026 11:41:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8ed2c173d3bso362132185a.2
        for <linux-media@vger.kernel.org>; Fri, 08 May 2026 04:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778240467; x=1778845267; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2QMZfo5GvIx279y7myj/MFns4ZF9kvnCOIi7ZALa51o=;
        b=X9blZh5Jxvezq+6jiNZsKGi7MBeHBYKa1VsuQFx909xPigY7bnzb8cvSgUCT1tCMrq
         DK4g3c+bf6k6m4gyX6AEaZSjPMzT9hIGjHkqQn0X69HmZAzPX0hsUjvvJRRlnBoWoMEA
         Se113/OomC7ZzxzWJ5q5Ov/QutJwMfw5tOuwJWqiaqYBaU0mqWjjA8XGVinGe24BqdwU
         r8CuRsqN+URIdMfglrSMtMbJ/T9w4Ps5MgtjVkTqePFQwIOqIKcX0RjfVwM8HI9QyUnR
         QQvXjZnO/a+ZGbeG1IXd+WOc+qjumz57Q1erqbMOwU3Snhry771vYKO8r1xmAJxp8k5c
         SMKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778240467; x=1778845267;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2QMZfo5GvIx279y7myj/MFns4ZF9kvnCOIi7ZALa51o=;
        b=W4IFPQ6Wj3fJKnR/CE8yPMKe4Qqg6iPrHaxGa4Sjzy8uCoZ2eS+5oIpNEhZb0MeGTN
         WUtYxz4jFEH5GJCgqm8sIGMDk0t2Xq92irfqcYhn+UT61+zV29TZ1CM9Zp1wBUSk35mv
         NiV6iKogR30jg64/j95NaWDJQ1xojyyHvJLJFv1P2H8I+RG+EDPcf8caYqQsSKvm6sXI
         cCnD13R3+AHOekY8zfcIqmkLpw/aIlzPO8gNyd9GHm705KOEY2LiqKvdshUAAxb11ejX
         SN1lUg3X6sFMMWpem0LrOEttDcdB1Ck6exzHcdiBe96oyJio9rEmOgq/MZu5gK9ps3G2
         R5eA==
X-Forwarded-Encrypted: i=1; AFNElJ/I9EHPs50QS5hHI+6qKiJEtkW6DvwRZxrwgp5vx6fp1fWoCMe6uO4UMlcRGfZwpUTy8zn39m2m7q2fnw==@vger.kernel.org
X-Gm-Message-State: AOJu0YycM510T6BnjJMlFE+B/NjBynnhrMH0WoODo8xpLshmSzlxXZmU
	uujoY/b0Pja7SI4Pkw7Na/v/p1I2KhtJ4bB6X9PGQqQISy86+LXER+X+pwPz67TjZi8KQ22KVYh
	yJWt5rpvJfMiq2jeL92T/iNHpCHLyOR1kzDSREHxn4IojLhL6XxTtnG0lt/mzg6QmYA==
X-Gm-Gg: AeBDieu6ZohR/TlnjNOZJF9agSQ2mVxIJ8rPiUBKEcon9pKNJ9MpMYoeTcdTb3Le2Pv
	hvG52crLuhCZrQaNr5lu2RWo/jVcih9A+tuETwRwrRY1akXF3V9/lZnWkkbE2sDzB481YbAVsQU
	iUq5M8L8OBUvv5zi+Ft8xoDMOBNBSVwXL2chHxAmT2DWj6HxxXmiRXE9d/h+lLlqTE1w9fSKjcx
	9NA6g5oNmPrAUz1nhRYi2cE/xnm+Tfh6uV40ZT/RxM9YdExKnPgT2xWcDdEkIlyQ5rsN8AxaeAC
	dRgE/xqCQv7X5xb/8jFH3UizpLEays4WFT+0w5kzKLamLtiW/syP7LYqPzsRrBiEvv/tzcYk+yk
	SlV7DYoGgpwwTaX9KHgboxHnxeoL+CjdISpsvUWFhgkW8tYlSaYYNbRVZpZxyKR/aGPSwkMP45V
	dGEvPBpUzWYDs4
X-Received: by 2002:a05:620a:294e:b0:8ee:589d:5dbf with SMTP id af79cd13be357-904d68df456mr1788516485a.46.1778240466857;
        Fri, 08 May 2026 04:41:06 -0700 (PDT)
X-Received: by 2002:a05:620a:294e:b0:8ee:589d:5dbf with SMTP id af79cd13be357-904d68df456mr1788512685a.46.1778240466256;
        Fri, 08 May 2026 04:41:06 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-907b8d9eed0sm179193885a.19.2026.05.08.04.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:41:05 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 08 May 2026 19:39:57 +0800
Subject: [PATCH v2 1/7] dt-bindings: media: qcom,x1e80100-camss: Describe
 iommu entries
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-hamoa_evk-v2-1-3ebdca3e4ae2@oss.qualcomm.com>
References: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
In-Reply-To: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778240451; l=2779;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=EgoG8dYeMOUsaStegKZNiGtsdNqb8ep20lln6yJOD4g=;
 b=gplcoxsXbwOQNprb2mtOphiyAsN4q5dxQl1NJCfFgaExg+NyoXXlMSSE5kuXRYjIG3/OjJ1B0
 BRszlaW/QF2Dwe439yzT1VZJvuEXFAs4f253ypvuNDIAZeusLcrQNx3
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEyMSBTYWx0ZWRfXwJlIYyxKNaev
 q3mpxdV/fzQHL9xSI0HbX7R1jlElxFVUdQn/RRN1RbouTziaeDQItf13LKkK1UDTRHRXnn9IIYi
 vs0A9gyWTY1h9+ouoSV4GWBITF+UooZqMWlfiLBWTTOLNfhQx9OlZG76/uusGzr6x7xhViPCbHV
 OtXZ/BmCDSE91ZGN5HSxFcVGRrSlPrcoRh1mG39h2MHCLco00yyi0yaCm37JJ2VHXZOSOmREFQc
 geAPZoume/jRWUr9bpjt+kxsXPHoH3iq2e6UtpUMwAJ27QneLAO4FaDpmPQKD0zpj4klcW2RuCn
 UqCPqZItlynYM/Pj8vN6oCvGOg3aiARWZKeacB8HAlWKoWhAAlJiQ+ZAWY26YIvdMk6ju2QP3vX
 jl+kQsELOjNWIFxlTncjGybQT8JdY7fplHg4X1bnZe3ieb3jVfTv/SrxK2c6luo5xN3SqzJAkJ0
 RlNyLq+hF6Wgq/tdcpw==
X-Proofpoint-GUID: VrIHg5PHFlLWhBxRAPlUKWga5imO0Jam
X-Proofpoint-ORIG-GUID: VrIHg5PHFlLWhBxRAPlUKWga5imO0Jam
X-Authority-Analysis: v=2.4 cv=fcydDUQF c=1 sm=1 tr=0 ts=69fdcbd3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=DGnd2QOFyrMO3axh9N0A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080121
X-Rspamd-Queue-Id: 4F7614F5E4A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60919-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,nxp.com,pengutronix.de,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

The original iommus list included entries for ICP and BPS/IPE S1
contexts. Only the five S1 HLOS stream IDs are required by the CAMSS
ISP hardware: IFE/IFE_LITE read and write, SFE read and write, and
CDM IFE. The remaining entries serve other hardware blocks which will
be described in their own nodes as support is added.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 .../bindings/media/qcom,x1e80100-camss.yaml        | 26 ++++++++++++++++------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index 2d1662ef522b7b874a3e308e374044255bce5bb8..126400772d028811c9efbb1443144ff4f264fcad 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -104,7 +104,22 @@ properties:
       - const: sf_icp_mnoc
 
   iommus:
-    maxItems: 8
+    oneOf:
+      - items:
+          - description: S1 HLOS IFE and IFE_LITE non-protected read
+          - description: S1 HLOS IFE and IFE_LITE non-protected write
+          - description: S1 HLOS SFE non-protected read
+          - description: S1 HLOS SFE non-protected write
+          - description: S1 HLOS CDM IFE non-protected
+          - description: Legacy slot 0 - do not use
+          - description: Legacy slot 1 - do not use
+          - description: Legacy slot 2 - do not use
+      - items:
+          - description: S1 HLOS IFE and IFE_LITE non-protected read
+          - description: S1 HLOS IFE and IFE_LITE non-protected write
+          - description: S1 HLOS SFE non-protected read
+          - description: S1 HLOS SFE non-protected write
+          - description: S1 HLOS CDM IFE non-protected
 
   power-domains:
     items:
@@ -332,13 +347,10 @@ examples:
                                  "sf_icp_mnoc";
 
             iommus = <&apps_smmu 0x800 0x60>,
+                     <&apps_smmu 0x820 0x60>,
+                     <&apps_smmu 0x840 0x60>,
                      <&apps_smmu 0x860 0x60>,
-                     <&apps_smmu 0x1800 0x60>,
-                     <&apps_smmu 0x1860 0x60>,
-                     <&apps_smmu 0x18e0 0x00>,
-                     <&apps_smmu 0x1980 0x20>,
-                     <&apps_smmu 0x1900 0x00>,
-                     <&apps_smmu 0x19a0 0x20>;
+                     <&apps_smmu 0x18a0 0x0>;
 
             power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
                             <&camcc CAM_CC_IFE_1_GDSC>,

-- 
2.34.1


