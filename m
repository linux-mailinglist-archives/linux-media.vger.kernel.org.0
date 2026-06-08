Return-Path: <linux-media+bounces-64191-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aARlIibPJmqokwIAu9opvQ
	(envelope-from <linux-media+bounces-64191-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 16:18:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF58D657110
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 16:18:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=U1ITahX4;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="QhsBg2/t";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64191-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64191-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EA6BB30A52C0
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 14:08:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ECE73C9ED5;
	Mon,  8 Jun 2026 14:07:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C32E3C584E
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 14:07:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780927647; cv=none; b=WK7jNxMnQlD8fWRg2pOl59GNfWOfZL0n3hFikT7QXm8zTtfHSxARRr0thCdaywkKqRQZ8oJo2KMd36G3PBPxl1gqkJN5wDqcXOsTji0I6F0vt4XDnqFH6XwoTb10pvTg7zTs1AW9o5g8PtGyXVu8XpeNNgR8oBr9ZkaG/zOu6Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780927647; c=relaxed/simple;
	bh=nnNj0bPf4Tyt7UYYDgU1GYFk9/w1Us7QvO4PuiTMSA8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X5VTVmQIeYBuMl0Epz25y5+W7JEE6gibA8lOD+POqnTNW9qy5C3FRgMwcyxj8aWRY5G2mr/2N+jjMe3w9fi8HcT7xyS/GktYlGdjUdbmn7b5uiFEDx1M4zAodeTK6t4GLbJZGDDvXqvQe00Ziso8rlO17ifjO275lF4h1gOMg6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U1ITahX4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QhsBg2/t; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658DRBtX3340161
	for <linux-media@vger.kernel.org>; Mon, 8 Jun 2026 14:07:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z1qr/cFnfW8NLplO047lZkMdrYxmX1NQnYYSVJUNuS8=; b=U1ITahX43xJI2zRs
	knCa6eHfuHe2RTrvmKI5svU2mVVOTq8CTExtI+5GtW7OjY7i4a7A0Bf7fALIK9k8
	9LtBPmJPFJOEKiE3lYOKtZSDWy65diZcRLSulWLFu4HAoieJnm2uxzowdUqTWR4V
	1fQea++iqKcGbPGsOxWoHVG3x0JY04uJM4V/aMnnft2Po2KdAuZjroasKDSD6Sb/
	SR1QtTpB3G7nQrW0ThAHdhS7/+K/oa8nYRVDPV90uwxHJWCFD/cwalpCI5bDST1n
	KENpfIZKMjmgd9cr/lRthRduDp+6raOBnBhm/L4c+KmQvK5odTWjPJfu9aU9agMu
	g3qzEQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enw5m0m6m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 08 Jun 2026 14:07:25 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0b35fa876so55035235ad.1
        for <linux-media@vger.kernel.org>; Mon, 08 Jun 2026 07:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780927645; x=1781532445; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z1qr/cFnfW8NLplO047lZkMdrYxmX1NQnYYSVJUNuS8=;
        b=QhsBg2/tHAUvRtUIs5HbpNIFL22IdA0z+LOYgiljCAUFgWswbLUiKbTJGl2i3m662/
         d+DDiOTlzlFUTW9uEMf1ouPQ+yOINpaUc0wPBOgWrlWUjmZMz3oy74oS5UlzBoIBAgUb
         6NS+biJL6IMa+MsMBbijlMiXT8il8GiGW891gw3G9yNLqOEVsTWu/adiENfSFF2RNJXi
         BkcK2G8pE8zz8/jjVg1glJ9EapRwzwd3zphYShGGsZ2fwek/EMt/ut5rpkkJG3B9l5ds
         XdKI+pGjiXLJXAiPC1L4qLu877lCIfUDdyfdBDQvNRSxzNjSDciIP7eqcJjVre1KjKgO
         9Xqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780927645; x=1781532445;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z1qr/cFnfW8NLplO047lZkMdrYxmX1NQnYYSVJUNuS8=;
        b=mXGp6HlzEtZ4r+181XRl9rp+8TzPF/kMAImaU2cbv7AX9uHPRTi+Gltq0WsXpny8MS
         6esDofQCco0mBnovFQ2pJGvM3QXsObOA2iMx+3Az0j+i6835fee9IjAw7B/Br3/UTv2z
         duVSdP+0tWL22GElfsfbgBt2cP1/1O1SGUnro5xrV7oPEIr5F4jKtvYCBPINP8xO6UR1
         wRHwQPD7M9vpnK0pm3ckSw9QL2LfUmH5oThfywhbW6Xe0pd2s93lHgoIXv8dRrdJEEQ6
         aSW64svQ5wazATfM22IFTXU+tGCL2tUAhvTdtPlNTki4qMyTlrbV41WbjiJ7y7z+xZvK
         Zl8g==
X-Forwarded-Encrypted: i=1; AFNElJ9zCqVz8hTpqZiGOHT47k38lV/G8ulMla8Js8FpGRvJDZa+M08POWjz4B3N9jQB8HWYsGV/2nylJ1/y1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywcr8qTkZ0/XsHbzElVeoANawWKXqnlyMX9X+fGaEOtFG4KiRlC
	lgh4/Mjwlp+5Z9D+kQUJb/qpsTs7MStGBgBYjHgWOE0qOHYqYbDYjdjVjoQwEK+V2e2hj1YBPLj
	BqxIrNrWFAXZErRX2+dJc66xlQ0GYiRxmjMSUcDa0UJkJZF8BZNsOYZugIAGqV/GbKA==
X-Gm-Gg: Acq92OE5YeQu5b9qbBH/xeUX+U9vxVb6BvACp71FWSsOrYkb2Tc9aKRKIlVJNBjdaGy
	ZW/ptiXhBCwya8J3WQ2KJGwnVQd/gYiOR84i0xbdTBdY66S+Ip1km5Y5ZLjtSQ4L4nJPLZmXyO3
	wpZLMRLyNnkjDfvmzNKnDIfeDcwmIn7be8bdyiIHNpU4sgF8UW2WiV6I54hqrUrrNdUQhLBJa+a
	POXKNcsqNTx3iUPn2qc/IozRPtpCaqdMEr/M7a4VVPrhGB2syma83wNUgqQm0xGFY6FBmgkrs+C
	EwK44RSx3WBcYkKMaYKYX4GBdHT5OeePV1gjckzkWgQfmpAMGT0tRAt+IFa7/5PFAJY3qlCvD2S
	c8jxl3jtRvDUsr0tRlt++Huzogw0y41XOgYQg2dtea8xQzx5POeavjs3HN3ZRqZk=
X-Received: by 2002:a17:903:8ce:b0:2c0:cb0e:ac3a with SMTP id d9443c01a7336-2c1e7f91985mr175034795ad.23.1780927644952;
        Mon, 08 Jun 2026 07:07:24 -0700 (PDT)
X-Received: by 2002:a17:903:8ce:b0:2c0:cb0e:ac3a with SMTP id d9443c01a7336-2c1e7f91985mr175034185ad.23.1780927644353;
        Mon, 08 Jun 2026 07:07:24 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1646e5c51sm183935955ad.0.2026.06.08.07.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:07:24 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 19:36:41 +0530
Subject: [PATCH v2 4/7] arm64: dts: qcom: shikra: Add CCI definitions
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-shikra-camss-review-v2-4-ca1936bf1219@oss.qualcomm.com>
References: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
In-Reply-To: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780927607; l=2602;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=nnNj0bPf4Tyt7UYYDgU1GYFk9/w1Us7QvO4PuiTMSA8=;
 b=GkKVdIkUath/EME51kNESPjACacVq1UXhwANX5S9tPyhbsD/owBuVfNn8TH4OgLNMENiKNnqS
 2DYOfqWUXPTCvifXMUIYSzyhpRC6ya1Falw/4liQ3P/FpHBJF4mUXYk
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEzMyBTYWx0ZWRfX5oByGHU0HDsF
 r6j2oVrr8Ii7SULQpjSBKsURgsmwpZx/5KV9xmhZN1kXQCz03N9l23HxeHj0ds47mGK/okhTEqt
 jUQ5e5aT00iIt5wMxMEQ3mknysi4qMbm4uWV/ttut5riQooe859pnwuLrlLvrIMHDR557UD/qYE
 +I7sZ4SIYGQ3U4WbVSGn0q2Lc6V6dDjYQMiKN/kVOP5D420HoYb0DQB3ii+3gwspFcJGxIH7na5
 GM6GBLqiy3DQr1NbOxvTSeL/CBHJqp4dk3p7sqTemKSKO1lv+e9BHQkCVoPymLaZFxj2hJBacie
 3ArpM85zmIGadFrFWyBWIM+Ax3R9Ol1eDFojDzqmQQQDYL0ul4EdIh/YTmFJtu5vHUDZSYuCbw7
 X4q7u0nVnJpCmHTogOGmCcYTuJXkpU34X21PUIyRlLGJNXYq02HmKYn8u8WgsDOKFlLLRlGFDhJ
 Jl2394HfblQhS/IaYLw==
X-Proofpoint-ORIG-GUID: 1foj1-QpDpIVkDacYzqke2TvV_EVyRUe
X-Authority-Analysis: v=2.4 cv=UptT8ewB c=1 sm=1 tr=0 ts=6a26cc9d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=XuEftVTFR-VjiOTT8WQA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 1foj1-QpDpIVkDacYzqke2TvV_EVyRUe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080133
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64191-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,oss.qualcomm.com,nxp.com,pengutronix.de,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:andi.shyti@kernel.org,m:bryan.odonoghue@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:quic_svankada@quicinc.com,m:vikram.sharma@oss.qualcomm.com,m:nihal.gupta@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nihal.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nihal.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EF58D657110

Qualcomm Shikra SoC has one Camera Control Interface (CCI)
containing two I2C hosts.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 70 ++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index b93ce4a92a998ea5d9d4268d2fd46030fafc4084..fed71131491ebf6e261bfcd14b5d4a2624837878 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -348,6 +348,38 @@ tlmm: pinctrl@500000 {
 			gpio-ranges = <&tlmm 0 0 165>;
 			wakeup-parent = <&mpm>;
 
+			cci_i2c0_default: cci-i2c0-default-state {
+				/* SDA, SCL */
+				pins = "gpio36", "gpio37";
+				function = "cci_i2c0";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci_i2c0_sleep: cci-i2c0-sleep-state {
+				/* SDA, SCL */
+				pins = "gpio36", "gpio37";
+				function = "cci_i2c0";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cci_i2c1_default: cci-i2c1-default-state {
+				/* SDA, SCL */
+				pins = "gpio41", "gpio42";
+				function = "cci_i2c1";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci_i2c1_sleep: cci-i2c1-sleep-state {
+				/* SDA, SCL */
+				pins = "gpio41", "gpio42";
+				function = "cci_i2c1";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
 			qup_uart0_default: qup-uart0-default-state {
 				pins = "gpio0", "gpio1";
 				function = "qup0_se0";
@@ -701,6 +733,44 @@ port@1 {
 					reg = <1>;
 				};
 			};
+
+		};
+
+		cci: cci@5c1b000 {
+			compatible = "qcom,shikra-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x05c1b000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 206 IRQ_TYPE_EDGE_RISING 0>;
+
+			clocks = <&gcc GCC_CAMSS_TOP_AHB_CLK>,
+				 <&gcc GCC_CAMSS_CCI_0_CLK>;
+			clock-names = "ahb",
+				      "cci";
+
+			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>;
+
+			pinctrl-0 = <&cci_i2c0_default &cci_i2c1_default>;
+			pinctrl-1 = <&cci_i2c0_sleep &cci_i2c1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
 		};
 
 		qupv3_0: geniqup@4ac0000 {

-- 
2.34.1


