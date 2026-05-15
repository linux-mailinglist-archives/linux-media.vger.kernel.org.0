Return-Path: <linux-media+bounces-61661-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLaTHp//BmqVqgIAu9opvQ
	(envelope-from <linux-media+bounces-61661-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 13:12:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D7754E2C9
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 13:12:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7841C3171ABA
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 10:57:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70B75477994;
	Fri, 15 May 2026 10:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GwAdAifD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cGa403rA"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4553447278A
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 10:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842617; cv=none; b=O1hWJbmdIagvkjd1OBBO2BLDnM1H2H2OYT1Kq59kJ5/SCwUGQU/RZXNPm1S3qy8MpShfLvVLTjkzdCCp7resRNU6v6YyLLjch3gwgLEEDp/fVG8mhsZfA3S4P4q+M65SzeVcSq6n+Im3sBG2VQLO6xEV0EbCWgXBZubWwd+eDH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842617; c=relaxed/simple;
	bh=aebLYbRcchyj2DpGs2D0Vi4WsjillqsL9nVCS+SsX7c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YUzBBRvZ7UZIIQjvz0sizk1nbHcgS8O85ihtiT9qubHH+3rtMw2FVn7qi+Ke/XfQOet0xlrBqWvbTCQYGxXRGkoudA3x/eJIW3gB24d/9eKX/5AgQKpz7lvVAwo0JNQBj+MZkCXSEPhH/1TPeqAeGpKGnnvDRQtlCKA4NNIUAYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GwAdAifD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cGa403rA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FAX62o3219657
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 10:56:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	khQXf2QmPJPS6U1LINJFjANgUjvY0G6V+26gokibeA8=; b=GwAdAifD+9bPCWTx
	+Fh3GzdYA1KbFgdnK2XSqJ+nQy3fIl9GAScmzpyKQiHgELlaqdJpCjVQTWF/dB2j
	Y/URTYstjwZqNI7AbAzzpEMWYYXiFXKDtGk1mtjeKEUBY5yP+h3Cf5xIeTgFBc/6
	qASsDZ8HGLZLA9IYrRZVrcRpfih6MuD1wt4pTVglBND4iREAPlrNKldxoPuVYztj
	98pxcXWI+KZM2fnGKyOADNN7nTxYx3cpVUlYxK94hy36teMMc9RJ7HYO/2gjxNuY
	GKaBbo8tBMjQMCyiP8Mz1BgC+QQJ89beu4ajIFDVr2pV3n+Jz+hPtf8JO4MpBqjx
	ze76vw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1s2wrs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 10:56:55 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50da529ff48so214804931cf.3
        for <linux-media@vger.kernel.org>; Fri, 15 May 2026 03:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778842614; x=1779447414; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=khQXf2QmPJPS6U1LINJFjANgUjvY0G6V+26gokibeA8=;
        b=cGa403rAmM2ZBrcz0qTsumVhMZ1kxnT4IQcAzLgGmEaD0UYVgfM+9YeWyX0k0+ru7J
         bWg0qa/Qg4rOHpsh5S9QUj4erWM39Oh+jJVfcHa/eWJaJFZLseRZOoXCSi5gIRP1Auau
         Xf7WAp5LbO8X7AyfvM5xICpikXoTJs2qIPmAbDfbvd0C62KBNwdnlPmiK5Bak3x5YgpI
         RoTFZlNXYZQDVkNkZmYRpYyFoiMvZYX/tbPOSazdCkVczlbKLDxa7KGXR9RClUXStAkT
         MocyalPpsXGbIkR7Nwf8NYSDmlbD/4d+vNVcQfrJ3M8fGkfPtnlDvU8BLoq+QNuZsrnf
         TIdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842614; x=1779447414;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=khQXf2QmPJPS6U1LINJFjANgUjvY0G6V+26gokibeA8=;
        b=JDb+CLvqR0SLD+wQWzdwYJ6mwR7i3vUkKj/ltLKFSuzwmC4Sq7OBsEFzHeXYcvhAxh
         l3IrEwS11J9vLnASUl7dqkKuV49JM51R1MfJqxh3ON0EodIZZ84Sw4v8EInaSN5gL4g2
         gKOzYLaaIwg+X93qc6bqiFIwFVGRedk8trEJKW0ySGsLDzLQ1E5H8zwCmT9jB7Hh43Pi
         msjBjyOleLpEHFlv98rszf1oJcniUjhyCtvBMuKA/S7inVc4ztMDzuO0h4aETSI7xkN5
         s+EIiLv9mj5WL0QMEIq/G9EHhTXxZOyBKchX445jnp1nDno690Lz03HM/Mewzv86bJkH
         b/Qg==
X-Gm-Message-State: AOJu0YyPUCNom70dSjXQ3+0NnFpGfGDfU+is0qDMMyfoX0UheDNaZW1/
	fhGy3Ht51iMEtKQb6+oe6NrVibyxToi6TDYXUgo52ZSgsyR0DYnTtjcZxOsthi70h0Dk+TVfmtW
	WwfzpuvwGqBTW5IxV7T/n1CMHoVOJbfjn6qhoW/gnrv3VeJq5uMOAM3qPqYOc8vfPNLDhrLUubw
	==
X-Gm-Gg: Acq92OFKZcOU82eGfLwCEqYBw+T+6afJfClmN1tpugYxy+F/Bu6C2XuaA550HIHJ83b
	NP1zcOwjWj0mYPqni9F9lwnNoT6YnLW2WpZ3r9xAUbT9n33abkgtxqaMQ2NiRCbhbIp9qJO+QEf
	r/9xjiAuL7sqyK294fMTGabfn+YyhQTQvhDYCkwGjDZIBkKn6+RB/JwtQ9qW21hkfx5uBqf2wVq
	08ZMxqyyV2/YwJvqywxnVIJHx5n6QeOapxUN/46AYZ7diWKspfHkLVv5WuRyiPlNLWfHe1Ja9fY
	mkftWUAgXdcFfK3t0PsWTHl7kgiAcdbIp4v25uBmyMq3uHkgRggl7KxKujbacHsKAaqyYXlKu7Q
	xQL162Iisdn8L15iiZ6KY/TBI6ACEvoppBU/HUuKfYvu77LZFwsXWgejDhjW8Oa3eqGzqEtBLfb
	5jSIoxEvOR8wWPKt8altUWz6eGWLs/X0EEKaA=
X-Received: by 2002:ac8:7d94:0:b0:50d:abc3:eed5 with SMTP id d75a77b69052e-5165a1db10amr42448141cf.29.1778842614558;
        Fri, 15 May 2026 03:56:54 -0700 (PDT)
X-Received: by 2002:ac8:7d94:0:b0:50d:abc3:eed5 with SMTP id d75a77b69052e-5165a1db10amr42447731cf.29.1778842614043;
        Fri, 15 May 2026 03:56:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a91e2b6db9sm1240195e87.84.2026.05.15.03.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:56:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 15 May 2026 13:56:36 +0300
Subject: [PATCH v7 2/6] arm64: dts: qcom: sc8280xp: sort reserved memory
 regions
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-iris-sc8280xp-v7-2-2e21f6db1897@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1171;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=aebLYbRcchyj2DpGs2D0Vi4WsjillqsL9nVCS+SsX7c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBvvw/FX3CuWW0ejlOjtX9H8DE4NiE/wxV8cng
 hLNKiSHMdiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagb78AAKCRCLPIo+Aiko
 1RsrB/92CPB13aS13KB+xx6m6iPMGGvSEltDGHMo/G4iW2GxVZIkHgVIghQzmcrny4Dx6Tp+YHE
 Pl1d+nSP8OrLdb7d0NJ5TqNjHHAJ9oQM2gDxFflthUAdx6iWEFdvt5hxsvN/jTA3MUnhMx85rg2
 fyYZUbiqv7q9jbpavclxzW5orgODzX0TdevQCEe4VP/7pS9bLdsurJ/+sDAPV2tqu1KrzkuBjxl
 nTB//XGovRxKsDSQm/r6KRUG1j/yPfSzQw8CPk4xjoqnLUJ9F8j4JtMx8enfm4dxQrXNaug7J/k
 rYA1KP5yeEMgrlEK/X3RgBNQUz+IeYOuKa8pZcGhRy+v3dNH
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExMCBTYWx0ZWRfX0uygvEUC+0w6
 cttZhswI5H/6vE7NEtA92p6bC6Wjp+UeG5Xb6jYNpMyhwQ1tvT2VUbjLW4HR3uNxPVVjLBvhqQv
 vuquWYtimz144ezljYMB7bZgJTJ4XhDKyM0WA/xTkhwJuAtjsdU5LbdYA1lIKsTUfiBdQnzjQtv
 XKizltcfq/9kalWlSAjgMkP/vsZNjGv3HtYTt/0Afh9hGyElNhLkx8oq77ObDEh+lthTGyo1Nxz
 kycIViebOlbHy5PaiT+3zJDJ/PKJk5TC0JJBPG7y3SUWHUDUxPRPNC0v4cPobREDsbo7xzLvU1T
 IoQS4mAZHfnV8a+Zk1b2md4goONypqUYKsZEglVE8uU8jb2BBp6QssyEGEmweRLKwp3wZGzZY2g
 z+iCAwYLnxeA3xQ7KC2e3wzmDqIfpBjnK66Y6FYCDIywWX2cuEVwsPV2s3n57P83iDpdrc8Gf2f
 i9i7jdeRPCOSi9zRoSg==
X-Proofpoint-GUID: uUa8ssaTFw7-HVxuR3QLaNXoiSyqzwUl
X-Proofpoint-ORIG-GUID: uUa8ssaTFw7-HVxuR3QLaNXoiSyqzwUl
X-Authority-Analysis: v=2.4 cv=HJ7z0Itv c=1 sm=1 tr=0 ts=6a06fbf7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=dWPP9-k4-ZVWm8qm6WgA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150110
X-Rspamd-Queue-Id: C3D7754E2C9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61661-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,8a100000:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Move memory region reserved for the GPU to its proper place in DT.

Fixes: 6e9612ced0c9 ("arm64: dts: qcom: sc8280xp: create common zap-shader node")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 761f229e8f47..b09bc6f3b518 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -692,11 +692,6 @@ reserved-region@85b00000 {
 			no-map;
 		};
 
-		pil_gpu_mem: gpu-mem@8bf00000 {
-			reg = <0 0x8bf00000 0 0x2000>;
-			no-map;
-		};
-
 		pil_adsp_mem: adsp-region@86c00000 {
 			reg = <0 0x86c00000 0 0x2000000>;
 			no-map;
@@ -712,6 +707,11 @@ pil_nsp0_mem: cdsp0-region@8a100000 {
 			no-map;
 		};
 
+		pil_gpu_mem: gpu-mem@8bf00000 {
+			reg = <0 0x8bf00000 0 0x2000>;
+			no-map;
+		};
+
 		pil_nsp1_mem: cdsp1-region@8c600000 {
 			reg = <0 0x8c600000 0 0x1e00000>;
 			no-map;

-- 
2.47.3


