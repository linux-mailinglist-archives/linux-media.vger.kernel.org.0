Return-Path: <linux-media+bounces-61420-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHnPCQZwBGprIQIAu9opvQ
	(envelope-from <linux-media+bounces-61420-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 14:35:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FE0533170
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 14:35:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 31AEC306488C
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01F33421A09;
	Wed, 13 May 2026 12:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jgToGkR1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hM/vAFv8"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DFC41C2F2
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 12:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778675695; cv=none; b=cl+M0tbTZqAwugxBc3CAZuQwEeIRdKQM+PJg60ZXLuma7yWOp80+WagIXPp5IdznTr0VV6JsMxbXjCqteFahZrzBzyQG9o/awHcJcweiTYd+eYg/LXlpmGHG9R2Ob+wVJ4i9GSEDax9Jclruu/K3jiwHF7LctgNQgd66wRj2Ubw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778675695; c=relaxed/simple;
	bh=aebLYbRcchyj2DpGs2D0Vi4WsjillqsL9nVCS+SsX7c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WkVT5WyVH7uwQt+3at3smxjA+LYHAhRRNNS0rZy70SILweONZCK4hSY8Hfp9l2FIY+hpl6NH67rWFNzrHxw5pvMIsHldhF910AdVLhen08mUzfk4zgt4BWVBx8c36ZbqiV65cpsSM2UR7Wde7PVEYJIZK+LOsmc9CozPoh0JMdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jgToGkR1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hM/vAFv8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DBt9JQ3324713
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 12:34:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	khQXf2QmPJPS6U1LINJFjANgUjvY0G6V+26gokibeA8=; b=jgToGkR1uxBTw7Qt
	icSee9ZfHJJYcFz71Ue9W4Odp1FgnDx/fhUR0hx9iCw86eQvaaLWJD9mi+7fHYeP
	tvxD3hIbHWUT/pJW38hJbxzmJUxVm8eKj1DI+MvZskmCe7AnC7T8nYRiMPjuUIfg
	/Sl0v2orlhuJrtrOxhjNM7rAiApHNHRvZ0w8LbuAhRifrIdLqqNtaD2cM6skX4Su
	Iy+3iRyVjjC6fKusfOY4mH1wG3psmSOP18W/ls2VBmRZCeCi4j4jl5FwqCI4Q4uL
	y06adyW9XcJUBTOUxBeXZgOaj2PJQ69j8bywCJveWS54iyIyTWNbP9DtGrgB3EWZ
	39/tkw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4kvd9du5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 12:34:52 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6329c1a6710so2240204137.2
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 05:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778675691; x=1779280491; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=khQXf2QmPJPS6U1LINJFjANgUjvY0G6V+26gokibeA8=;
        b=hM/vAFv8n2qZpkaMXu4B/d7TAOAs4CuiLwGlIW1wKvB1HulzeEgbv/WI905SoYdKy6
         o3rstVzs02mR6pmJGgAgddt7hoWfrYMiwI/gvNRa6hwfVjHFtnhSs40eo3HxL9ecZdrN
         TO4iics8dy0m7E4vduy84IW0zzAujb4NC138+P0EZLKr7HasG/7ZzWdtDp1TwfCsy64a
         wjmhuO/mHeQoxmCsunMpQWnUdn8zukX4J/eb5q2XjaLDd8/Qd1n33USGQTAp2uzobtng
         9GL09r2L2JAtChhtaw1p+0ABBD+1RmgEOzzeWf7lUfTm3I5zJ4RxCXoRK7u78CdTHh2+
         ioBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778675691; x=1779280491;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=khQXf2QmPJPS6U1LINJFjANgUjvY0G6V+26gokibeA8=;
        b=K8tHtBu+ZnQqUGL/Iz8OWKhW35TlbQZn3dZcad0q5JPhHASap1yMLjLRpXGn3mPdhQ
         U+g5Zai4UmlJYnd8TEXkQP58OyU7S5QNVxlEgf+iGP/Lm6/VkMUNcvq+e5sh8xw+24so
         kIQosanJSi6EIpHNBPlwJyoLLa4A3662nBgL30W8Ysat5UrbFrAhEhhNnl5EV7Qt+7/P
         1O8eQHK3mOKWFd0ZYqjmXsIp0bRcg7eOih8YoiTP/wgi+cg9mSiMT9ToCXBZA3Rxn9jm
         gO9lO9J3tY4YO1ewmi3n2L8HFbwAkkxORuEVk4kQBLsYB7OIlL1yeWVZa0vvR0Wy61bD
         z5/w==
X-Gm-Message-State: AOJu0YwwbtzQG6mqXW46wZza8BV6JMSOotH3cz7wy1svwpiE7MMuKR07
	OIbaG1BoEY8XR1iOfwa3keQ2idjY74NViZm7tU8AwDtkWbfPx7dnxzFWiQrYpkWTd9FAnk9JBkz
	VVGBeyvpU83Ri+RpHEvj4iQVgeZZfs0OiBwClmeM75Ijw7ueBUI3b505pPgGC9yludg==
X-Gm-Gg: Acq92OGbLJNANitOLO81XYGKWbtrDSqY48OfgxQdELtdcDcyGu5bssk/BqJiXBbuEp2
	nnGBb/4UgV4eDJs62SBySuE6epzMiidIv20hXUV7GDqZpRD9NwsYZfe/3FkFO7Xlb1Xrme62OLC
	3Tz/zcw8VKVsEDdyBQevBlpnjT0pdZ4+4CRn3zyHHKRv4S8HlhOMxKdKfE56V7OrJOZUZ0OCnwO
	gN0nQZYt0bJ7CuFOUB1IUqxkI2ucTt6yDtcM46ZmLo/v8m044d9EeopH20Wfurnm/HKvPQysfcQ
	a6tjxDTLPgR9rHRiFSUaeN9hywqgzBAjoNecYP2L4zwAz7IiPfT7d/W7OchLlK7jXg5IaoOPTmL
	evKFVNHJcMHVkyCI6/9VKWKOTxgcpVVla3Z3s+PmuU8hRkEZUmoNt/5KRz0hXfTuRuu5bO4hUdg
	QBPa2p/lQvY3BlmggNQWpVeNxVSJ5jThI7fFU=
X-Received: by 2002:a05:6102:800c:b0:632:8eb6:7a1d with SMTP id ada2fe7eead31-637728c92d7mr1283542137.9.1778675691276;
        Wed, 13 May 2026 05:34:51 -0700 (PDT)
X-Received: by 2002:a05:6102:800c:b0:632:8eb6:7a1d with SMTP id ada2fe7eead31-637728c92d7mr1283527137.9.1778675690780;
        Wed, 13 May 2026 05:34:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a95660c1sm4132610e87.66.2026.05.13.05.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:34:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 13 May 2026 15:34:44 +0300
Subject: [PATCH v6 2/6] arm64: dts: qcom: sc8280xp: sort reserved memory
 regions
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-iris-sc8280xp-v6-2-0d11d90d3e26@oss.qualcomm.com>
References: <20260513-iris-sc8280xp-v6-0-0d11d90d3e26@oss.qualcomm.com>
In-Reply-To: <20260513-iris-sc8280xp-v6-0-0d11d90d3e26@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBG/lPD3Y//I4GA6DSdQKuvErsNTOjl9GPDKv3
 Np65rF8f1CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagRv5QAKCRCLPIo+Aiko
 1b7LCACv6OIOB5nZjGrKmvmPlr8EJIOcq1UoMTQDlJnQ9u1GQis2ECv10Nf9FeDTfttwvQtpM19
 0/f2QH4aqBjT1ugBJNpfklVkfShtMsb+DhOB9qV2QGElensVZ+W9xS8Js4badc1czOpCINnZYYt
 c+PLK7C2DaHlLCx0w45AwqpJuaNJune0/uqDOyddd04NCR9PNnqBJP9yb49XiiO2T/ZgdFHAfYt
 hzOvWkoHvDu2qYlcRqWtgInOnxH2da26Kc7z4ysyAz0AsQo5keceS7XA3SevXuZTnQq+UQ8PPLk
 aLJxIZdhTmq1jqy9YzhmTJQqknys5f+svqfeo9mm5R9oQW8y
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 4oAK3IkiECeoXfU-9Z20gwZvEo90fKpU
X-Proofpoint-ORIG-GUID: 4oAK3IkiECeoXfU-9Z20gwZvEo90fKpU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEzMSBTYWx0ZWRfX6eLp3deFCqh8
 PZHs0p5Wu1qAo6J+5Cx8Xg6+ddTbQJ5X6mROzdSx85pvqNhc1g2Bo3oTyi5OrPeTZzOgFkJKAuL
 8Ei65dryf56/YcMZRHahu9OJAmOFvVu7Wua5omZrk92JlpsZQmIJ6by9My4pbd7rhtR8k7vEZXP
 lPwrZvjMjbOYojOGN8YRxTUq5ehuwPbt7bQHe+sR+TDQC7nFpvrWIxGoeVXPAJtGq1B2CEA8KVH
 CYSAomyNCiRr2y4azSk1rN2Eo81kw8rzoqeg7VJHkXut6jmZTnCOukFdJSpHcOxWkMIdCIazDdp
 j0TttNxhM/vG8x/EDCDl+MkY7+9kKtbClMZhLj/YssOPzHrH1C0VNO9I5l7n8VjurLGmh7HqwOx
 VQj37+4yAotM7buo4jq7gquovxWMXvynYXcy0q7wnqq2Cu/YlkVIwWc+r3xTtNuS4HRpCb1vbRI
 XMwsDjEv9DCWI/CFLxg==
X-Authority-Analysis: v=2.4 cv=Iu0utr/g c=1 sm=1 tr=0 ts=6a046fec cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=dWPP9-k4-ZVWm8qm6WgA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130131
X-Rspamd-Queue-Id: 98FE0533170
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61420-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,86c00000:email,8bf00000:email,8c600000:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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


