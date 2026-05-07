Return-Path: <linux-media+bounces-60719-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLrOKXYs/Gn+MQAAu9opvQ
	(envelope-from <linux-media+bounces-60719-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 08:08:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA6F4E3539
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 08:08:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C22E03030D6A
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 06:06:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 672C333D4E1;
	Thu,  7 May 2026 06:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p2LFrs11";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZescNGEi"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9351F33859C
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 06:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778133979; cv=none; b=TyFXCIlp1PKUXk0C95zIIRJYzxAMATebTPiS92Kjg0YX9zHfa8MZm8xJLU2onr+0pfRmnAM18uO5ok5BrLArkxIAUywDEV83SqIscxAhBLYFnoynd1RK9kAnXc2oeeTIJUKefVQvoPeRThEIcwwij7xeD+z+63+GsIj91owAXA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778133979; c=relaxed/simple;
	bh=qscoCSFAgisCe1f4h29FeB3VcT/jr5H2iv1XW6q2vDA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GgF6sJeFe09CNVodMzONUJRLhUJqCt89GFuguMcybax6qAjlBxXyNY8UpuZot69gOBDbETeBwdYyf/dKYDo7Zhv2Y+iUlXCc3SQ0KdOj2E/3w478im7I8s4Vm5EBUeFI3VMhdepyjTdX4kH0Oyg7VH22CIAbojfsTmV9UuD8T+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p2LFrs11; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZescNGEi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6473ebmO026592
	for <linux-media@vger.kernel.org>; Thu, 7 May 2026 06:06:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wKU3mkcAdu5oWFLwon4MUG7vzEY7xSuDI2VpUgR6EjM=; b=p2LFrs11XBtd3dUx
	1n2CFiNwRVA8YZaMXS+WCaPTqo1PhV9OfDDr2mv/SgEUJXe1Zjet+1WJXydvUZBb
	DpQgKI8vDoEjRWIvPU/Uz/oX7yC9GkwZ2OLuxBnBQHhn339DlH526F2nhENfd3mi
	GcIJwChPioJrjH9ELs6PeTWRsQMQPHJqhyDy+wjhL26l06ruOZWfNV5CuSO9ulJD
	Vr5LhFiT2jjAIWLnCmRP+SqdAWF09G4OABS4sihkjNhWHfXhmCO3pbAJUlyBlc1N
	Amf3P0V2FALKn+LT+Q/iWFh0nwEeoeVhmwFEfBI5S5OxBbJSO42Dxfiir5of9kzg
	j5e1cg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0k1t0dpt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 07 May 2026 06:06:17 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c797e31a9b7so529885a12.1
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 23:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778133977; x=1778738777; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wKU3mkcAdu5oWFLwon4MUG7vzEY7xSuDI2VpUgR6EjM=;
        b=ZescNGEiQiAivMf0ioKQsraZglmGPBxJ2CrcJYQda9IFNj3IQtu+pa/oQfLeqYqdMA
         aCtAJ7/ne3iUnneg8st4sz221u32zccl/5X+HZMqED+UCOvqvFn90SME4hG+knzx8ZVY
         zS27wzJIcOlfuyjENwqwAxEADLZDcA76kIkaKQs3e1nlgr87K2n4eQZsoajTfcGYE85X
         FIukXm5J6AD6AC7PIAwQjQw6eP5b5hTpcajcyIz1x7wkzbgPrWpnG4m47aoO2os7jl1U
         VUouk7UYot8JX5eNlf62CDweo37Dvpl/drcarylOnj/chhpk6fu8XF9SM7gPcuaL180P
         hPZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778133977; x=1778738777;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wKU3mkcAdu5oWFLwon4MUG7vzEY7xSuDI2VpUgR6EjM=;
        b=TLsW1BeN9vXWBPUVlfiMTynhKvV3C0I8dwaYr+pDu9jsT5CP1TsrstLgahVbL2U6EM
         5XgRfqqHW55pimxE779yHNrzBggSFZxL0ejJ4+crMgtftVdxUmJSotD6fjufo+JSKfua
         qov0thK+lzUubdQiDiQJMUmolrA9tXsYC9lemZ1U8zsnhCGbIN/Q24p/ZR64OEyaTbrz
         wtUZwAEYLchAUVvpZkpcJPaEZvIjP8T4x5sWMvwUMku3I4NbqAw2A/16mvk7fp/pnPKM
         zDFHNhOnoY2doPCFqCpI5+6ENAqvFbAkWzqhEUkMcocO7Rl8GmiUmUjE2JmdlQB6Lp3D
         2ZLg==
X-Gm-Message-State: AOJu0YzCdjIBdMKEuXxo1utxlK8LL2DX40glDxDFcVvUmUuRKhgT7bRa
	aDHbnzRCouRmpC2AnRoGnxO1VanjbnrrIgF7EytEBLt8VrltpNZQtiGB5eD27MXXBiL+p6qqxrI
	rshjImoyUSBKwQ6dIMeIvNAXeYHMmcf2vgSZw6OqDjuUDTs07m3gp2kKZJO5AEbgJ6w==
X-Gm-Gg: AeBDieuvDFo6zmxdLukCUYYJb+UzG8T85AFdYHOgHYT5ZsMsrVPIkw2As1ecWMnDu4l
	XE0RrNK8dObQqHpeQiyGoN6GVPIP+TFlLNKXSmxlVP1LgN7au24VwTtFX2mLbh8WYb3S+Z3J3kA
	UweHvsI8sibnY3+Ix2viYfYJoqeauvw4c/4UtFLQ6IGXyxKdNTIdo/TrwqN9D644uZee0KqQaby
	ku0TC+/rw6WCC1ZzrsqLpyfV15PimOGpXqcCOWfUNCX0mDyc2JWrYrMl+vf3g35CzaEWHsbDUk1
	ddP9ML1akWM1rh257volFU8XnOB/wkiQXfnWj6m08mZLDU3JkJT7F4g3S7PEkXW4HS1b3seBmQS
	t2uyNL2ycOSeVoOTsiwwN34UhrFtXGtKj/K+5cAWQQki5SuLvgKp/QGBxmvPVGO6JZTZw8VVA3O
	HsERstzKF1CV3MO7SXYChB4KrbzYsisIQ=
X-Received: by 2002:a05:6a00:2386:b0:82a:7aa3:a2fb with SMTP id d2e1a72fcca58-83a5e3545e4mr6355710b3a.37.1778133976639;
        Wed, 06 May 2026 23:06:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:2386:b0:82a:7aa3:a2fb with SMTP id d2e1a72fcca58-83a5e3545e4mr6355661b3a.37.1778133976105;
        Wed, 06 May 2026 23:06:16 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839685a3187sm7566187b3a.60.2026.05.06.23.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 23:06:15 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Thu, 07 May 2026 14:05:48 +0800
Subject: [PATCH v6 5/5] arm64: dts: qcom: purwa-iot-som: enable video
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-enable_iris_on_purwa-v6-5-48da505e23bf@oss.qualcomm.com>
References: <20260507-enable_iris_on_purwa-v6-0-48da505e23bf@oss.qualcomm.com>
In-Reply-To: <20260507-enable_iris_on_purwa-v6-0-48da505e23bf@oss.qualcomm.com>
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
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778133946; l=1004;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=qscoCSFAgisCe1f4h29FeB3VcT/jr5H2iv1XW6q2vDA=;
 b=1/Ja8nQ7u1NL6b8WY5O+6Jfbqpfsv0cb4TCE6kGkLwUc7EKVlDGE/tpoijYSHdo58ECKeWG5y
 X8FijgyTGVFBseAwtvsvjIQjIaudFPD6sTnTyJduQtCaLXnb4VXbkDk
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=EoPiaycA c=1 sm=1 tr=0 ts=69fc2bd9 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=REEBHDwWlCTOHul6J5gA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: ejRJ73V4fWeIifNUcOMjT2zL1UW55N1p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA1NyBTYWx0ZWRfX61TlR+OxXgQo
 W+wVyuNxDnzXQldxaX4erbG9oZGBbaj6l6u0oRVzO4z9Y+5usB2dv0ESMJHX6yfqXYKlD9rNEYh
 PAed5kXsTGN9dNw0ZlWdPms/mgdDtL4hegm5oOPBCeIvtLGHpzbq6REkTR5sh4jHVrK/9uz5NPR
 UA0Wc1nCuymLO1wDctt/tJkExxV1HLQJBWJm3Rvjb8wbAEc/+FF7//Mxpr9gZ/JM8dkdqX6bxu2
 +Y8vUoxTz1zhWE7MSZWTUohc9MilFN42MWu9y0lVyJ1CtLujJ0YT1VRxk5PqOlbn24iatY47WwE
 8D7FQwA3pymEnweYRHUxH+DBUx3mnQCFOeuyDriWPRFCVTamCcBJmrXofSTYPVjA4sKmq/2Dumg
 SQtaAsYbwe1+deeF6Lt/Lb5Lfn3tAwhS3PgF9g5WXCQMk/Spsi2giuyM5Yv3/8aPlm8Fy49BbQS
 lacBPnA81hRtaC7BCrQ==
X-Proofpoint-GUID: ejRJ73V4fWeIifNUcOMjT2zL1UW55N1p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070057
X-Rspamd-Queue-Id: 5AA6F4E3539
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-60719-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Enable video nodes on the purwa-iot-som board.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
index 394e65518ac5037e5c7c50583acefc0dbc8ebb47..ff8621f8750584636ad781467f9c35ace2354e4c 100644
--- a/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
@@ -389,6 +389,10 @@ &gpu_zap_shader {
 	firmware-name = "qcom/x1p42100/gen71500_zap.mbn";
 };
 
+&iris {
+	status = "okay";
+};
+
 &pcie3 {
 	pinctrl-0 = <&pcie3_default>;
 	pinctrl-names = "default";

-- 
2.43.0


