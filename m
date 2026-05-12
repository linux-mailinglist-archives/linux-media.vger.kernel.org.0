Return-Path: <linux-media+bounces-61257-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAvlOe4rA2oR1QEAu9opvQ
	(envelope-from <linux-media+bounces-61257-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 15:32:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BF45213D9
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 15:32:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B244934932B4
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 13:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C573139A4C6;
	Tue, 12 May 2026 13:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vdv1IfKj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QK/yrqn2"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8629C3911A3
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 13:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778591389; cv=none; b=i7vBDUD/ZeiGSsPX5haugMJF2G91MuzPrd7c7N6Kz0nnpnb3dB6mQ6O1D0KbmtMPeXwyGD7ZesilIN+G8OFbu0xAY2wEKN1y5whcLo989+6sc+18FnvCvsAUHPnfxjQZXx5GmYQFkRZVrb0+hMSm1986exLrHfpA27XhR5grz4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778591389; c=relaxed/simple;
	bh=aebLYbRcchyj2DpGs2D0Vi4WsjillqsL9nVCS+SsX7c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F1NRMGM7uZrwUTO5+6q50OPSGeXbIAndlDhqiRBC3gY3S43LlenJc9osrrRxfiOmCtRmhYo0NOVXPToYfpRJZjjFTgZz4KLXEprW+YYjcD7eApDOFXVeE5/ELASaYGKakHtAEeB38FK6pJMaY6ZrT3Wk5NWKY3klC+uWsBrrV74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vdv1IfKj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QK/yrqn2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CCgs9I1409947
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 13:09:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	khQXf2QmPJPS6U1LINJFjANgUjvY0G6V+26gokibeA8=; b=Vdv1IfKjkEG+FIQp
	cqNHkAKasKgqWsC7c7LavDHY+tcDxNoR59s9DcCXJLI49BTBC5OuYkSTCzdBZ4ja
	Jo0INvr452xB9kKxKst20HCZxN3bTbYwbsvgX986MqwFIBI69wUMhcikvnhsFlMo
	4xwnJ2gKM7fAPPNirYOOs5OcN56CjhKov7peX/0KDKRalOeezsi55fVGaSLdW3D+
	tbxjNLKN3CxPvZtgmAx/s9dTePsnlXEYoO+gYIObIRddhMHHlEV7l499PHjt+f1+
	gehQYnpdBCHTNG4w5WGCpt1hhsUrlffNla1O6W7CzAzN8cug9NqjvhUZmmP4snJQ
	JDCThg==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e44f302ts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 13:09:46 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7dbe76e3abcso12974705a34.0
        for <linux-media@vger.kernel.org>; Tue, 12 May 2026 06:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778591386; x=1779196186; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=khQXf2QmPJPS6U1LINJFjANgUjvY0G6V+26gokibeA8=;
        b=QK/yrqn2W1K2pMxjSHlN0IFEqXUbJ2FFIkXZ9t8xtyv0zfxrxx2vMygSsbScsb2hSr
         ysyVL5I7I5/zor5NE3PPm+rJ+vXtDv3cuYkSDWbuIzxNxek4OlisaXXWBh4HtKQvXULL
         GGNljyWvNvNS6qUwDJnxrG3jDXkjr+e/8TBnq0bmD9VL5LJt/IhQPLTjUEkAfozsIKSj
         3ln+OCHEmogyA8k6adnndv9zBUltcMghP5xf01B5PiGYGGDV9LltOZQIoWB8TdTP1chF
         DH7oOzkjLlrC2EfjIveLCUn7Oesx4RLwekROxEX3r94y2aRHRPiXFyk/PXGe1KlYYs86
         TSLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778591386; x=1779196186;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=khQXf2QmPJPS6U1LINJFjANgUjvY0G6V+26gokibeA8=;
        b=SKWRUZvjGrLUkxX9y5Ru0BMngU9az7wy977d+OQsycJxIgJI9lSv3bV/7hiiF3Cy7a
         1HWTuZqPFdxxBBL+IELzMmJApZhYeEY//hf4o1DcBI343LLT42pO/dF1uq/JyJAi5DUl
         9jWfaZ2hvJKo7Xo8FJ1ukRAfQ9pdYrITm65RcWx6qKlg824g0GzWnippNhd8scaUBjB8
         Y2X7ZIFfrRpvXnESZT2eGj9emFFR2ukGbFZn3nujEYDb5mQaKL2qhz5RLLFsg6ruV3IV
         N7PPbsTziM9nEGNcfapNYANlojL1kAC7fdwTeMHYtVfl9MrwJiqlsOWFzS5NfeV2IXtM
         gs+g==
X-Gm-Message-State: AOJu0YyxOO/lCA99iK+EUwtgc2aKWdDMKFlEDiXYp5TrYzPUMpbJFote
	I2sL7z7y8v7XF5OmGY7Pe3y6YyAwoF4XPhNGfBlyZkbfdGWiBamx5ZwgCbacXawkL29l7i+/15Q
	Pb2DelBf2mEPMqaPynTxDJcgkwF0oT9clLDNu2LJoLZONQqVpka75kVKSg2pWOjiJUA==
X-Gm-Gg: Acq92OEgAm3A4LRIbnGhN8sG0puG8n/q4wHIzRLLJ3cCl9Wahi06iWT0uJwMpfLWN3G
	tXDxWfWbWX0vIxjnK3WfLbfBG2i4koIF0YE/i2olJAYefsFkciuUEMYVZ4AMsAKa3NoXQ4IO/hD
	jFstzCjVW9hAPTDdK1TrnrLzvwqcPCrpzio1Wh5Tw5m3TXIoOwj/VfB9BvmX1uoHjglhw0dxhpv
	QGRsSvvO9FmBU6ogfcn/Xyxu1nbM3rGczKb/zV5E3uMjvuHM2EYbO2a8MQSYLOQzcG0u7zlNsmZ
	h0NqM2wVoacU4M9yWXxCBuexHFEND/L+qfD368YLVVog7J9pYTqo/8hKjKgEHVI50FNlFNpBET6
	aMks5GQ7u2PPkwkV0DKjdC/vjRh4L2k2VrqHgpyOrMjIFwZ6Er85GzrfNRHr6ftQDZLvIygqLa6
	B+GHOCV87T3xRJ/AytuZVAGGZHfnQbsjHOa9M=
X-Received: by 2002:a05:6820:83dc:10b0:69b:3a3c:1e4c with SMTP id 006d021491bc7-69b3a3c25b7mr5107809eaf.50.1778591386019;
        Tue, 12 May 2026 06:09:46 -0700 (PDT)
X-Received: by 2002:a05:6820:83dc:10b0:69b:3a3c:1e4c with SMTP id 006d021491bc7-69b3a3c25b7mr5107770eaf.50.1778591385529;
        Tue, 12 May 2026 06:09:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f3a8e1sm33739451fa.15.2026.05.12.06.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 06:09:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 12 May 2026 16:09:30 +0300
Subject: [PATCH v5 2/6] arm64: dts: qcom: sc8280xp: sort reserved memory
 regions
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-iris-sc8280xp-v5-2-8cc251e83b58@oss.qualcomm.com>
References: <20260512-iris-sc8280xp-v5-0-8cc251e83b58@oss.qualcomm.com>
In-Reply-To: <20260512-iris-sc8280xp-v5-0-8cc251e83b58@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqAyaTAmMYVOLPcjInsey+YNrJPpS5uKJ2xSGTY
 xanEcUSiwGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagMmkwAKCRCLPIo+Aiko
 1e59B/4v1AQ7YHmgmfDoc8ZtQAXk9r4mQAIyXqtLShCQt+UYyZR1d1MxfAWo4B+gAgl5CtDnL4F
 8G44Cc2Ot+vSsl1FZN0g6yXPkYwVzWqY4Y16PWnHp5lu6zMO8eajqGEBkL24m74we8BcTR/F2G/
 yintbmsKgFSEnWFEmT454xQLRNzliF0vouvLGIPvUSSlO/5YAyiUNorg0MCZf2BmcEWhFvkQ/5R
 kiZ9J+BiVG3SQwUypfa+9ut0/CSfcunyKBwgIc9p+/lBpqjMaB9TB8QZqbzSxB5jduYJ15/qfkw
 Ya237XQbSTiMUDrFMuwJ2Bza1YUenKRf+nVUAjQPeiAgiQUY
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: mDFFtjYk5s5X0_tKEogzA3ZjRUDX5MG1
X-Authority-Analysis: v=2.4 cv=SpSgLvO0 c=1 sm=1 tr=0 ts=6a03269a cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=dWPP9-k4-ZVWm8qm6WgA:9 a=QEXdDO2ut3YA:10 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEzNiBTYWx0ZWRfX64SjSox85r/o
 Dh/BuyCHsQ0brE0hkz0DgtT6qft4MXiIWfjcy6NQXrWEKu51REhNt0rwuhR+0tSd51NCPe3IWON
 M3FgOv0J3wi2sxWag1u7PLoKyWwgBE9uU+vD6iKNqfC0rGFCTL5ITGPTULToZCJtQ8X8DowDQNb
 ERB20opDoTSc2i9U9NXqc8GFk3U0PN1TTaHrRxa3cV0vx0r4jj+YUoFAY0xrPq/8JfsINTWCw9Y
 rMozLT1BRTZDc9BLNEvbAMOinqeSNA406fIrsXjbvVJgkPPjRb/N/KmsjB6an02Mr2K6I9pWuvv
 18U+5oKl/6cQk4mFOUHGpEhx6tPTNm5RiuZWj0HoHQqt54Yc9Rm62yKvFJKVVKld+FvHaNwvgaY
 AkHNa17MV9lzEC8H22d8VEx/RGfcOt2M7E5PXZiLQIoT7SD4z4YAGiBGhy65iJXr8QmfAo6d+ry
 Ho9OncxmYuAAYXPQdVg==
X-Proofpoint-GUID: mDFFtjYk5s5X0_tKEogzA3ZjRUDX5MG1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120136
X-Rspamd-Queue-Id: 81BF45213D9
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
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61257-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[8a100000:email,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,8c600000:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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


