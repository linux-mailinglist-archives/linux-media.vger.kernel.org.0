Return-Path: <linux-media+bounces-61660-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLSnGXIDB2okqwIAu9opvQ
	(envelope-from <linux-media+bounces-61660-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 13:28:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDB154E73A
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 13:28:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CC39D30CA254
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 10:57:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A036472769;
	Fri, 15 May 2026 10:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QzHuypwn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fKBwK7qp"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19793D1AB3
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 10:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842616; cv=none; b=rbShMSdOccX0C0XhIurhuWGeV2bqB4cR7jSf7KyMwIvUKXHI221TJDveVTl0cnv5YUItL3NPljCOVhQSZpVcDW80F58W87W5jgFa51kPBwh2wxI8M1R80pZG1gin750ifsDLh0hnIHVoPd4FK6qGrLZP+VdvsuR7LV/wa0YEY9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842616; c=relaxed/simple;
	bh=QYtKt3xVT767f/e8GatW4qi1b551mF4Rul2GLUG2IWg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bow//cf8EnJBEOHLVMYAfL4oibIBEgBcq4syBhPFWP2BZhok6A7UUr+sgqEqyPCochrVq2MjM7S1QnQl7PkXoIm0RzFWdrPdFQITYf7ApKACxR6vbV8eHeYD7y31t8sR7w+vyGNo2oICeyJbJ9GBEI/jFj888fzWVl1KQ/qC6OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QzHuypwn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fKBwK7qp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F51nx33795527
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 10:56:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZkPfJy0UESjSRY5ynRNQIxd5SdMCMpmKmDZo2BYGsVI=; b=QzHuypwnW4Tnb+TV
	3i+wRHhzreroIdtEORdp4PGXjUs/Q5AH/XV7AeqykUKB8t+J8JKDfe2/+CTjk5fo
	3EqbUQTGm2HCdO40VThOHaATFOTZHZF6Upp61jeprFWMdH2pphYTehQfkIMKyY0I
	iDrHknZy4p9BVwBuY6WHaJAWOl9jGordNYsaEOX2vocFXsZTZKxzPvLQnygtL7Tc
	61F4qY9kArEeRtfYcx9Y7Feh+gl4n2oUzqqWFSEbVNKo+czZ3IPvTNVTJwLeGxsp
	RGRy4Xn6mN9kawKTuHfhCjKanMns3yOStOI7onnPvcLF8XrpjQrcuYWMHqvhubyT
	fiop+g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1stvsg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 10:56:53 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d8e8c47a3so60496951cf.0
        for <linux-media@vger.kernel.org>; Fri, 15 May 2026 03:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778842613; x=1779447413; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZkPfJy0UESjSRY5ynRNQIxd5SdMCMpmKmDZo2BYGsVI=;
        b=fKBwK7qplnwqDlPwYjr2Ztt791Da54GnEwdEnddN2KDM5OusiSuWvNraIrJxQ6CbI4
         3az3gSLMCVWipBmK9lNFiEbqHzK3WQYaJjQx20O4P6NRo7BoNKHlZwxA2EB/55DE224t
         +wAEFhfuUDTRZpMUufU2ozSGx4lfXedD2t2x/dwS/U4UaZOOJQpw5S496KLMWpAQpT73
         CEoNKDBwowmpbhwHfmZ0+F2JXa4pgmnuhw42WwFEIAKAIbZbwu3zpPhDUIu5W1sAnipL
         kOVAJaHYOx4sbnaQGzAOXNZUEmUgsv8whLv4X6DGJqhgsiP5Eh6PiWF7IOUnyz+PtAtX
         +Wlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842613; x=1779447413;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZkPfJy0UESjSRY5ynRNQIxd5SdMCMpmKmDZo2BYGsVI=;
        b=cUZxQE2p9mwlWxzBp2Xp3g4PDq2v024vVTSG7tpbCojpR7SWtT2nVDiX7u8HaR6715
         3M2/k8i/bkguvx1ha3V8g+bHeXl5su6Qg+3jRoWvPTBDveLkeY4La3zmLbSYesO4tgBJ
         MD0FFwlXbv6zBywYW8888NtpabPu9byEt3AKfP5o3NaDpAXwghqz377ADsO3xxg0VleV
         9gWpR8y14LTx2wI23ORw2sfP0JUAWYZc5chnIFOU02uRdbRpNqSD39ZGM5TXE5abO8rN
         yaQ+BnnURm6hz83E/d/V6/6j9nbIJ76uVVZibxoggHjudj2lI9u/cmiFbz0nLJV9rBqF
         aeOw==
X-Gm-Message-State: AOJu0YwFwXwHbpM9I9z/TEncLGv+lt8FHEZYS9XuOcskic3/iW+WRnmm
	6ajyqMerQWIv7FDoPJXiPkoP5xeBk48/iPG2GCYaFB8KViIiAINOt/XlA9LUT6YVHKh5MmiX8zW
	GeGOex8Qx0+GpjPdCnfAcIy3tG41xVxSjCIMfsfHDb5G0r3XnExZ0PLxLG4dVCtvvjw==
X-Gm-Gg: Acq92OGN7beuR7em9Qv8aJVt5M0o3NouOQdZgepyKE14pqzU9uL10Pb9q9nOy/B2ujI
	L09zajG/0WLR5SmW42VAduaVkSq5kKHVSgd8kIX1Sd1DRLgrGAZCbWbxB1hbQR7OApywhp+A5aX
	9kl2yQSBji6cVI5RDvfJDKt01PvQFXe0FkLsSiRJM2nf5D+7J7qFT5tcH1WE3cY62uxq+HM049S
	zyMKMAgnLgd9u+sUtPcbdzALGFmWQTUnRSm6adQBIlRVMdePiZDGwwGEQRfcsZcg0Nxc1zB6q49
	4dUZvu7da9hW2Zsi/NMSeAryh9ei/UIvKvh5iYhDnMjqTRtyQMVzQPFhmhR0GnrdvM+sk2aZ4nF
	4mCZiPdbYfwBsRe9YYW2GYh5BpMURJmv1ZdX/btXfvvjsduzVrvv+UEGsQ7fJ76Fngp9vqXIjgW
	28NCdRTX0TNAABMZUXKoEe6vlP2/NVGIVy1MQX76gXhHAjRw==
X-Received: by 2002:a05:622a:17c7:b0:516:508b:bf55 with SMTP id d75a77b69052e-5165a276f8cmr43698411cf.55.1778842613064;
        Fri, 15 May 2026 03:56:53 -0700 (PDT)
X-Received: by 2002:a05:622a:17c7:b0:516:508b:bf55 with SMTP id d75a77b69052e-5165a276f8cmr43698061cf.55.1778842612582;
        Fri, 15 May 2026 03:56:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a91e2b6db9sm1240195e87.84.2026.05.15.03.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:56:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 15 May 2026 13:56:35 +0300
Subject: [PATCH v7 1/6] media: dt-bindings: Document SC8280XP/SM8350 Iris
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-iris-sc8280xp-v7-1-2e21f6db1897@oss.qualcomm.com>
References: <20260515-iris-sc8280xp-v7-0-2e21f6db1897@oss.qualcomm.com>
In-Reply-To: <20260515-iris-sc8280xp-v7-0-2e21f6db1897@oss.qualcomm.com>
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
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1439;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=QYtKt3xVT767f/e8GatW4qi1b551mF4Rul2GLUG2IWg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBvvwLWCZB+oe3e5CSx9Vt9pT8JGtQDQ1/Bmn+
 dvxqQY6mPuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagb78AAKCRCLPIo+Aiko
 1f1oB/9dl8rcVYlxGenpqJJ2qI0jLaM4OJyYbgfr3Tev2ZfXNlsumTgYL+2OrDhvM4fT9qY/iwP
 DtqNtuiHhsZFp0dwXdt7um0kwpPoQs8HDKgbIqFSsIdDV5XZ7F2ERPgoOzkqfXG3RDS2G7DN5ak
 5AlZ9K3gDj0dkUP7GNCcYirN9TzYiTKV7yyewjvvyAk1954iQYoCfBsBEyGlzviPZLyUj6AOE4t
 ZbbXOZxCDXcRFR9Ixew40HX/iPf+vLtRs/dxKa1alolYa4SLCUTcjzrvpp2sh8tqc7iuQOm42tS
 9QCIMD67pthPQKubFj4YBxxfvNiPx21na80A9bEW8JQiGsur
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExMCBTYWx0ZWRfX4fhYliVbuWHf
 MbdDWNQhRqMr7ZHOPnrdhSrwW/0R5rYJhkNEVRucgN/XM+y6CiXHVaA0jymvcX2S61hvs066scV
 1GHlLaBt65Mf1YeCDCUT29kSU/q31Tkw3HZN+yj+MltXCw7y7bVFT/5ED2pblcmfX5zIpfJBR+b
 IAF6+Cl15hm2kKv09Ayv9ZVDyUzLt1wL+k3a1RRTR62srr4XuFAkDhaX/AM39902dSEq+9wk24J
 DERGQ1bytY1bir2upU60d6vUpxZIt+SakLjRj1m87fzhYQwFT9mWSXth+uJ1fTtgB/ZzV/K03j/
 2tyKNjbMCIyCU3Pcv5tTpqWXvadgpUpnx+beQurWKO/Ob8srsXTL/PQkpB7XrxDKHtGtfTc5NaK
 T8Xe1STL5ModBUwTIppCNING1wBiBE5VF+42iUOs/QVVqbl3++tATE2UmJcPIm/xxA2oOOFivjO
 VpUEf68Wbvo0nUmkBwg==
X-Authority-Analysis: v=2.4 cv=cZXiaHDM c=1 sm=1 tr=0 ts=6a06fbf5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=DuJnIZi-_EB7d9bgGRcA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: ykfPL6sVp83iV2uDh_Hy7DJcuRODr4bj
X-Proofpoint-ORIG-GUID: ykfPL6sVp83iV2uDh_Hy7DJcuRODr4bj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150110
X-Rspamd-Queue-Id: 0FDB154E73A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61660-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The Iris block on SM8350 and SC8280XP is compatible with the Iris
(Venus) on SM8250. Describing in the bindings that the block is Iris v2
and not Venus. Document SM8350 and SC8280XP IP cores, using
qcom,sm8250-venus as a fallback compatible.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,sm8250-venus.yaml         | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
index 43a10d9f664e..aca748e42aca 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
@@ -10,15 +10,21 @@ maintainers:
   - Stanimir Varbanov <stanimir.varbanov@linaro.org>
 
 description: |
-  The Venus IP is a video encode and decode accelerator present
-  on Qualcomm platforms
+  The Iris v2.xx IP is a video encode and decode accelerator present on
+  Qualcomm platforms
 
 allOf:
   - $ref: qcom,venus-common.yaml#
 
 properties:
   compatible:
-    const: qcom,sm8250-venus
+    oneOf:
+      - const: qcom,sm8250-venus
+      - items:
+          - enum:
+              - qcom,sc8280xp-iris
+              - qcom,sm8350-iris
+          - const: qcom,sm8250-venus
 
   power-domains:
     minItems: 2

-- 
2.47.3


