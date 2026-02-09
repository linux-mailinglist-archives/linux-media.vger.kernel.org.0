Return-Path: <linux-media+bounces-52375-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICpYHGmPiWln+wQAu9opvQ
	(envelope-from <linux-media+bounces-52375-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 08:40:25 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 028FE10C858
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 08:40:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7BD6E3007F49
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 07:39:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C67B3346B6;
	Mon,  9 Feb 2026 07:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GO6Cwsl0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NdD4iC/C"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0D0330B0C
	for <linux-media@vger.kernel.org>; Mon,  9 Feb 2026 07:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770622756; cv=none; b=EsojY6RTF+4sHeHPesG/u+8eIT8wEe9Rl2lpeYBWe1gCVubi5JQ0ABddr8cIpXmL9C4GFBqLdPgNQCxfCJ+O0FxfKyJrAM8niIVznDlQlKEdWHaX7klq5ys1/bQzhP86o1w3Tp+rOdbYXg7PDFha3obzRusnlUDzcqfQjhBsmT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770622756; c=relaxed/simple;
	bh=ScRWrO3rgQmNeQhkYeLJt6KoGs+1cGt+V+zo+7R5y3s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RSN+okMHJYGJwQ4aSTt5AtgFAwNiKXvcOIDa/ALtyRqr8IrY+DmjwBKuNUeFcZWgUW1B5Txediccyimv1hbSuY0nYsXOnz2NVDj2Tx/7NdurWLD0icju1A/7SA6IpMJEYTSx5GVpStsgSzWFCOskArd0mwHC0WRZ1ZAGsugFN/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GO6Cwsl0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NdD4iC/C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6194NEPa2383335
	for <linux-media@vger.kernel.org>; Mon, 9 Feb 2026 07:39:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xR7Us23ZTaMeSfzmZjBEgCbX0fEqA6hUYUWqOleM+gA=; b=GO6Cwsl0pVxDcUUC
	tUv6FLRV68pMVxlb+dd9F8oa6DwqwS1nVqJ4r152ClRaVEt+qA9S/+K0BCDdsjhf
	cMPtsv6jsf6f7Ap5rNiWW0zPx/CAugE/fNuL28bIK6a5OHgCqMv74Set64bKbfny
	Lq84JwA0EH0BUiKQfoDnW2iq1g14zGmkwFA0qFLucx/bo15HjmsJAbEOBrb7hr8F
	wnVFvOJVueQLyEmBJgcLKWug1VDPKDTAXRGtqb6QIFbZe/g0ZNnxiMYbMnI1TS4B
	3p36wKxjEtdpDythrB8ifuFMgMpp0XY68CCL/ioBThaXj8+DB65s4qcGyX161J8q
	x/0gYA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c78gdrjv1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 09 Feb 2026 07:39:15 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2aadeb3dee4so38535435ad.2
        for <linux-media@vger.kernel.org>; Sun, 08 Feb 2026 23:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770622755; x=1771227555; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xR7Us23ZTaMeSfzmZjBEgCbX0fEqA6hUYUWqOleM+gA=;
        b=NdD4iC/C5kMDgwR1OfPSx6Oogf2pORwWwfzayiVJ87Wi03rlGWFPaSmJeLPmUmlCSz
         dPNW40rP9hVnwv9tuRrvkIeYypHpoY8aMFtvUnpj1FlKDyWy43h2hpbBfs51tqd+lh8h
         NnImvHo3Gs9qaCFeHzdMCzQFfb0QxdpKGXsSeSWbttZYJXK40Sqfix5r3YGjktUVfh41
         HyrouKFmWQbivwGfFcnRImpreT6DIcfNpqsro8SygXuVH1fP44ajAwWdcLi9cMgir2a3
         hfXLiZ1ub3bUc8/qZ0px98ZhCcAV+b/wnnFyDWXNTspdecUSlnK1WOnkJ6uxmp4tBBxP
         7vaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770622755; x=1771227555;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xR7Us23ZTaMeSfzmZjBEgCbX0fEqA6hUYUWqOleM+gA=;
        b=qqSgRSiBMnnR63ZRwUEtgyV5REmgd24tScWUcXibxevIJXclTJHaREygYv70gps4b/
         zX5ggioy6FEnVo0T9Wjg5ChekbxmTLXm3IwqLD1SMwZ6Zvdji9T6NyZ3MUOgJkWfJbw4
         9OJpCGPtJ9TOENbFT6qreO5TyEyX78vIzCH/ibYfhrfQFippr/LvWyME1mUI7qlHP35q
         Ty+jSAkVYmgCfVsmNfBZGlM1cfGVkcrLw4COb1Zt2w8hpE8sIgxw10Ak/IpGTSSrwuIj
         v4Zk/3lu5z9qmSz4T4dd/Olvp9WTYvEfOYzVdobQZVuKitnbvAef/diBn2lJWGVQYjqd
         XRTw==
X-Gm-Message-State: AOJu0YyA5OjAdTZcPxdPq74JSzvqjJyvO77RC9IPne7PXMP0STwwlX2M
	ZCb5AqPKNvpH/3EKoGMba9MrdNWdN8tmyJbuZkNTHbrOzlj4Hs9MdeOyl2TOyMJHzy0LwEXDI59
	VZGxmFgEl+mVTBzdbdkC5BPebb1i7wScw8wZqZmR5DEdaBOHYqFWmAdHA1xN8P1e9Xg==
X-Gm-Gg: AZuq6aK5clF3ir+HiGZEIugIaR8VHD245W842TceCJ7xPXzrDb3LuuVk8vgTNfYSfTL
	iKXeXe9feqDyS4VeBaIPo+twKaPbyLWP9vx3IAKjpn3Bn4Gtfut/sOmLSW7H3pM2yfQeFFWi4J+
	JKPIdgWoEG4Fx8+bJjpcF7uKUkkHye/9IILZDJtNWkHxIHtzkI5fjXtPq+jOqZUH1q7HtU7H+wi
	Y8Qnx713ljdbovGSeBKe2/xq9s+4ihoBV58mHVsXz4xiMNGrPr7VbOOI2KNyH7RCcy+ZR6nnlzy
	9qUTgAs3pcYjkGigzqbWuVBwVu0GM7srgAZBUl4pv5JdB9zvT4UfZx6KOcQiogewCIZ2pwmIrGu
	UwWYiEQi9LvNb2ts2h5LbqD3MtvB1E3BkL2gRGw7y20EJGz/07uPkfyu1CbvxPK80VGmodlwIHs
	AlJr9mGU/L
X-Received: by 2002:a17:903:3bc8:b0:2aa:d04b:73af with SMTP id d9443c01a7336-2aad04b766bmr61908455ad.30.1770622754990;
        Sun, 08 Feb 2026 23:39:14 -0800 (PST)
X-Received: by 2002:a17:903:3bc8:b0:2aa:d04b:73af with SMTP id d9443c01a7336-2aad04b766bmr61908115ad.30.1770622754454;
        Sun, 08 Feb 2026 23:39:14 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951c9746esm99023545ad.39.2026.02.08.23.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 23:39:13 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Mon, 09 Feb 2026 15:39:03 +0800
Subject: [PATCH 1/5] dt-bindings: media: qcom,sm8550-iris: Add X1P42100
 compatible
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260209-enable_iris_on_purwa-v1-1-537c410f604f@oss.qualcomm.com>
References: <20260209-enable_iris_on_purwa-v1-0-537c410f604f@oss.qualcomm.com>
In-Reply-To: <20260209-enable_iris_on_purwa-v1-0-537c410f604f@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770622746; l=1724;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=ScRWrO3rgQmNeQhkYeLJt6KoGs+1cGt+V+zo+7R5y3s=;
 b=59xVkCcY2M2cpFFdD1cChlsG2mi73HbPuVmdpj31pUZasZWuCp6GjNncRTBXxM8TWEf263WWm
 c3nOBKuYW/oCZV0csfg0SEyGZjdKvIwujB1xNmegC8StYGVDEzuaB0W
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDA2MiBTYWx0ZWRfXxx7XatS/cdx5
 yHKTg+6ghIzLqr4tF/eo0VekYoGCiD0/j2vuQAimKqLUmh5M6BUlRKXMfQoMYGXk2m6tAj+mRSe
 q1+HbPCGJmSrUjecpV3oBGmjRuwr0g1trHxx9/ZBnzN4IlzQAB4R/t8gQVoV1Y3Lf/JrMo3nXc9
 Y3j/BJm/WEsNtctgz9xxZEacY5c0FZIDNyNEMXj3Lakr96RB8v/vp8NnxkBI1DUoanQNMMHsmcv
 XS9+RGngT5l5vdjCcBNCaLHUOKtGvmyLf4X1w/Lobm5+qudtb13hGEtn1AzYBlJkv4wWLKTvhZY
 wGS82ADTla685GZ8shYSQ3KvphcgTzSl6FYaLXz77OL6wI4iDJpwqPVVOSq4OeMLvLzFxqEQUCX
 gbKjXbxHK7ER17mOdcPkvHfaAw+rx6JA0iJMDmx5iOYkdXqeLUA32Y6Mu2KAFSdmQ5H4fBFocKN
 bXeemKuZCfoO7jIFDoQ==
X-Authority-Analysis: v=2.4 cv=Fv0IPmrq c=1 sm=1 tr=0 ts=69898f23 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=vC-UN__QzGoswCBVfaAA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: j0LwHWkp_RBJ4fBNFPbTkt_F77Vw8T2A
X-Proofpoint-GUID: j0LwHWkp_RBJ4fBNFPbTkt_F77Vw8T2A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090062
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-52375-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 028FE10C858
X-Rspamd-Action: no action

Document the new compatible "qcom,x1p42100-iris", which uses a different
set of clocks and OPP configuration compared to SM8550 and X1E80100.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 .../bindings/media/qcom,sm8550-iris.yaml           | 23 +++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
index 9c4b760508b50251ac467ad44a366689260bfc0d..0400ca1bff05dcef6b742c3fbf77e38adca9f280 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
@@ -26,6 +26,7 @@ properties:
           - qcom,qcs8300-iris
           - qcom,sm8550-iris
           - qcom,sm8650-iris
+          - qcom,x1p42100-iris
 
   reg:
     maxItems: 1
@@ -41,13 +42,16 @@ properties:
       - const: mmcx
 
   clocks:
-    maxItems: 3
+    minItems: 3
+    maxItems: 4
 
   clock-names:
+    minItems: 3
     items:
       - const: iface
       - const: core
       - const: vcodec0_core
+      - const: vcodec0_bse
 
   firmware-name:
     maxItems: 1
@@ -115,6 +119,23 @@ allOf:
           maxItems: 1
         reset-names:
           maxItems: 1
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,x1p42100-iris
+    then:
+      properties:
+        clocks:
+          minItems: 4
+        clock-names:
+          minItems: 4
+    else:
+      properties:
+        clocks:
+          maxItems: 3
+        clock-names:
+          maxItems: 3
 
 unevaluatedProperties: false
 

-- 
2.43.0


