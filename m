Return-Path: <linux-media+bounces-61688-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFpXHSMQB2qirAIAu9opvQ
	(envelope-from <linux-media+bounces-61688-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 14:22:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACFC54F64E
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 14:22:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D27A73191D43
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 11:51:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48C8248033F;
	Fri, 15 May 2026 11:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Km2GzmLu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B/rLlpkf"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E74D480330
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778845697; cv=none; b=TYSiNlVPu/kIotUbvVv/gVkPU8qgTGMxNfHuai60DURQCpCtv+gjjzwv3I2YphI7A53lZd4m4tT9zqxakBL9kdZIiGhTkA7VYxmtEylrX8Sk1+6AlTI27l9GWs4EueXCT+PG3f7GBICjMmF+JotPQqooeSooKj6ju9U31j754w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778845697; c=relaxed/simple;
	bh=aFCxwN+s0nObB9dYmcqshZUCs9EjeMcuhwbHJaldKhc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VOexZRgHwtZrIDzUMoqkqvg4lAyGd8DmZVGGpfepgCfHfyh/UEpAf2LvRzEaDoPaN0jh9C9ASA7CeSTYsnBpQfac3oqcFgbwayijgmxaIUWor5jvQoKhEyGAd9xlfnkDoIo827KLQ0r0luar9w2EKoXU4D4ZHtFBRootQI3gC6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Km2GzmLu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B/rLlpkf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FBQhIR2676221
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:48:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CUFPN10YozDbbYt5j7NhH44x2aT4ZP340z/Eg0bq1Jk=; b=Km2GzmLupUZxciT/
	3uy+vsBxHJpfUa8Txvx2jz1eZkOZSfu6ff6mIAX2Ljn6Rkg5jlE5JCaNkj9HNRxp
	vJ4tKIbmbmmZIiZsjEvMiqe/xp7NPFVOGj7upo2IxtKnwXsgwEVicg1VFcJ8pnOu
	a8WGCPsLeNOz29+NGPFRZJjZTWqJ1wOO+mcGlntWbD30bZM4P/AMHFDZYZcyliay
	rFlThivkXDCkSBogBSy7c0gGrsr6OtJ0zC9d5sAWibio2GV6uuBQf5VPiwTwBjcC
	pS8S0xWZUq4KnNtpA9Pg9Nr1Uk7idta9dn3BD54xQiF0AWAqP6OMI7+qItLRumYL
	sNWQzQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1vu43r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:48:11 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51494d74d4bso23692391cf.1
        for <linux-media@vger.kernel.org>; Fri, 15 May 2026 04:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778845690; x=1779450490; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CUFPN10YozDbbYt5j7NhH44x2aT4ZP340z/Eg0bq1Jk=;
        b=B/rLlpkf22XCrT/mTKnzPFB7uk48sJBp1vn500i3iMhdGBfuZxBcUi7asmDu7ksRn7
         tVZPdj8IFeal0cComOQS8ZrytO3s9/MSXqHe9IffSYSezb+GXe4sk8UL4EwpPJ7/t0MX
         lhoOAyEyWS5wdf6uE3x4ZyrSVFvx9JbnQ5qCJUMcGSsbqZikSpk8S7MSpU8RpvisEUdy
         JPpQnrLG97bZvxDF5kZS/xMdg27nJeMGlu3YokzA93Z/y42djsuVC8sDJ2iPUf+9MxYO
         Qnkq1wsUdliBRaNUa/mwjl5UVb0T9o7wAan9TdggKk81qMO0MSz4eXOc+c/3Kb1B7zzq
         htNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778845690; x=1779450490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CUFPN10YozDbbYt5j7NhH44x2aT4ZP340z/Eg0bq1Jk=;
        b=iICeMStpZWyOni70h25KChXcKYTcfmotqpyj8dpH+gYH9wroXpkGmmWfXw4eXHUZW2
         tKX2ilSLNQGAHhQDywXoSW/JWXKWUEbxAwJva4PeElypRnlksb0yifptYWjlT3T8GWT/
         fwBRRp+3vosxl9Gro7EYydEquDCVydRyPP8CkxXgY/XH9ihYfEDvTg8HNm9fRbA7X/nn
         utB21+JBsKO6RK8skGvHx9keT3wGbYYKjx3vUvqrcs1lVZ5EKj/DdRze1sm5QV0y2XTw
         m6lYxsw/EpaKSOQxI6HDwVMICZepMU9BjUfHuZAP42LuuOhfZzLrDyN1pqFWxPHAwzoW
         KeNw==
X-Gm-Message-State: AOJu0YzO19ryGYzQkVhusvTzFb7WED+jJECKDfhMIDqm+CinfcuvcXuc
	GqrZQKQmPjDMO0wMYrNDJeWApW6p8Ki6MbRxXt3cp5xLHUYAp5mBMghSPetnW4VYiip9xdmZicT
	j5Om/AIx06LH25fa5aw4HDLOd8fZS0yVY9nT0HSQYKz3DIHQ9pj2wSR2tSID2OQbE1w==
X-Gm-Gg: Acq92OH8dVpZzOrqNtF4iMBgej4UOI+K67xYMZ4/ziPPIu856zzBotxXrSJDPe6E0NY
	YT/HNKeMisAb80wYSMwjtVgVNvA49MZyzcwZvtIESWnwxHT6tb8GT/QQfGpCN2tiAkwsk7KCnZP
	83/mAqnoFU9iXAVXbLlzbtbHhbNMpkvlFqS8MsJ42w8sKSp+PQMfx5fv1s1BC9H5R9linAju/g8
	Prqo3YVJbWdLFrBEtOCjWOmLHYwLfp2Wf1R7iWSYzIgX8XlaJX2RYTD12Bm6lEyKYA6pItUvgec
	H69Hf5U8ovdc43C/4MnBnr4cMj0OolNsJw+T7vYyXFAVNTakeRwoY80qP3WrOt5CnGCw38HkHlc
	7JSsOgg4NcBGetQ1GJRZ2scVmvLbZ79clnTuLJc697HFC9p4tRfWFF7qdIk0+U8jbQqWYWVuPCE
	B5nN8SL3oaqzDiLAbsfxE/68gsZ/6yXQxTT1+JcjAd5Prsig==
X-Received: by 2002:a05:622a:a950:b0:50e:18f9:b5e2 with SMTP id d75a77b69052e-5164155c029mr78223531cf.6.1778845690285;
        Fri, 15 May 2026 04:48:10 -0700 (PDT)
X-Received: by 2002:a05:622a:a950:b0:50e:18f9:b5e2 with SMTP id d75a77b69052e-5164155c029mr78223021cf.6.1778845689662;
        Fri, 15 May 2026 04:48:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a682sm1265079e87.31.2026.05.15.04.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:48:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:48:00 +0300
Subject: [PATCH v3 01/16] media: iris: Skip UBWC configuration when not
 supported
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-iris-ar50lt-v3-1-df3846e74347@oss.qualcomm.com>
References: <20260515-iris-ar50lt-v3-0-df3846e74347@oss.qualcomm.com>
In-Reply-To: <20260515-iris-ar50lt-v3-0-df3846e74347@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1263;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=SkhEj21efbGwh1OhN+7NneptPnsqOcydi7iGjY56ptE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBwf0ddAvQKZ7Qmp9e16WDcQP93Q3AoxnF/5Qu
 cuYRexvWlGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagcH9AAKCRCLPIo+Aiko
 1ULQB/9YTt9SYYmINJ8B/XA+CM6rSmr1pxaqAU5Xm42zA4d5raA1RO7Jantz7vGgmpmRZtJqr06
 dbUdc5FvmqgkHNtbiS9l2S0COcqo6HMwHp9z0pD25acKlpIOyrimjuVyyNMD4tsLBAurhW7vkJF
 Atjt1uCqfqWokwRtoh32FSV+NSkCZ559XL/ng6RlfttzkfM3OGqvBGx/CQbZ3D5xMYwoTPqjlkm
 u3vmsdZH6tCUf4DOACVCy/rUAqH392NndlgyWYHV1EDLdc6tko8X8uftYzGbZ9Ty8IX5WKizxNx
 KvAcN6zJJ5OwSTTKakHFnBK1kOPm8hoQ/lp5rqgvResEWXTF
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=PKE/P/qC c=1 sm=1 tr=0 ts=6a0707fb cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=wrkyJH6U6m0Jdbs6q_kA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExOSBTYWx0ZWRfX9lzv9Ub1TiDE
 3SUpA6rjDQLWZsBTxCB04Ibnz4PmiBup8ZBznzOb7MfprH131YgDwbaVsTEIulqBLrxY0x+htgq
 8tBc5pn1t/zRfN2AunWmYrgyCvFWmdA16YsLH71pJR8wdlPVy4QFjRajixUcfKclMVnIICUrUmQ
 rOAryxVwqj7ZzGFyuiFcetAsIr7LDOxLq5CS0wpiDUCzEtD5h2IIgi9DCC3tqzwpS9ErpAeu+/d
 xsjzTBJCcBKmuNF0jYIXiGJMWxXgPUc9T8wNAatJRsQ9glx/h6GsgKPc1mVTnhc7zPehAJh40bt
 6LyT3L0KwsOF/Wlz0pYFR9GvTTygxOZuUTd95VoWcWB8BGGKZALIye6Q+PH9p1q6H55dXvqgKMw
 Xg3M75SiNraZJI37YcbjTqJVEiKj0LneW4q4jvLkyq06bjtrB3M2WXfYBgGzcDa02uuZmLb93zB
 8RpkHiQUKogl9oo52Fw==
X-Proofpoint-ORIG-GUID: 0uvOzHaj5bqzodiGf-gk0MdVAqOPIcZl
X-Proofpoint-GUID: 0uvOzHaj5bqzodiGf-gk0MdVAqOPIcZl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150119
X-Rspamd-Queue-Id: 9ACFC54F64E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-61688-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

UBWC configuration is not applicable to all SoCs. Add a check to avoid
configuring UBWC during sys init on unsupported platforms.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index 0d05dd2afc07..6e04175eb904 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -140,6 +140,9 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
+	if (!ubwc->ubwc_enc_version)
+		return;
+
 	payload = qcom_ubwc_macrotile_mode(ubwc) ? 8 : 4;
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_MAX_CHANNELS,

-- 
2.47.3


