Return-Path: <linux-media+bounces-33419-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02216AC46E3
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 05:34:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8B1AC7A5055
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 03:32:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBAA61E8332;
	Tue, 27 May 2025 03:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UQrKK3oI"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDCA1DF749;
	Tue, 27 May 2025 03:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748316805; cv=none; b=rTkpAirdjUXOl6ih9MpiYK6qPeC+g/a5yjsJr6QA5r7fSbkFIEC7GiuwtMVlb43NF3veRTX/K7T403P7FETaVxf+3mTmM1WoSGUysa0qHYTV1EwgHFz3rAO4isg1NzW2Kx3+X5LBy/KZ/yN96H3RUBGzkcxN5u6g/i6LnSBnz4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748316805; c=relaxed/simple;
	bh=5rdIo6YPkp6Eq1WY28OqqHvCyYrJPeFwY8f7Wr4Xfvw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=DnJEl3CX2VbDBuLIPQm5XC3bssZSH93KwipAp0oK69nxTVbAuckwx0kl5DoJ39eIAKuFmMLpTdeDnWckxtUSOb/6IvWjnd4VOq0McvYQQnInIZVCelP/bzFLh6lKjkj99F677+U74Y5WUcntuAAxHELLCtOLd+ce1oT9TYJIl5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UQrKK3oI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54QMs4pc026761;
	Tue, 27 May 2025 03:33:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lTT7gNpe0RlYUUoXnRQJceAMDHCMXeGeLwgnS81naao=; b=UQrKK3oI0S58ze7V
	ps71bu6fgT8+yifKXp8SDriGa+9JWOvSRYOm6Gn2NuqEqKX8AycvQytwLY48qX9P
	jd+6lMzenKR7E1MnBIAOL+SNwMvM1Uo+qm6YI4K3yFLnwjbZIM3WIe/F+kacrjBP
	zDGPdzpN2RgBFKuVBtLMHZcRdCq6tyNpghqTlXEIONGlZK7YPjoH4Y7snJzdOUAg
	8nnlILRE79ojst81ShTn07Lqs0Y4o2Fco4iDapYDicBmngdTHeXV2COJ5jVjWOYV
	+TZ766h35I++DtbDHg44Pw9OklGLbC0uzjwMQ4SGE3S8gYhrw+w69XfRc7m2xNDa
	IUHfZA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46vmgct1m3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 May 2025 03:33:20 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54R3XJ3S022496
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 May 2025 03:33:19 GMT
Received: from hu-renjiang-sha.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 26 May 2025 20:33:15 -0700
From: Renjiang Han <quic_renjiang@quicinc.com>
Date: Tue, 27 May 2025 09:02:27 +0530
Subject: [PATCH v7 3/3] arm64: dts: qcom: qcs615-ride: enable venus node to
 initialize video codec
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250527-add-venus-for-qcs615-v7-3-cca26e2768e3@quicinc.com>
References: <20250527-add-venus-for-qcs615-v7-0-cca26e2768e3@quicinc.com>
In-Reply-To: <20250527-add-venus-for-qcs615-v7-0-cca26e2768e3@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Renjiang Han
	<quic_renjiang@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748316786; l=715;
 i=quic_renjiang@quicinc.com; s=20241001; h=from:subject:message-id;
 bh=5rdIo6YPkp6Eq1WY28OqqHvCyYrJPeFwY8f7Wr4Xfvw=;
 b=kzWg/8VGpQjLs14x3nO4x/fr52VU1hWX0CIK4tay13ZOnHUMxfdK3vucz6cHThwREsG3E5KL2
 fTcbWf24RRkDSIoCAU7ljiEICdtVlWNmpw1te/vulwmx9waoF/Kiivv
X-Developer-Key: i=quic_renjiang@quicinc.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: JEVmwZs2v7K1s45XC5Vv2jUgqYMKpivC
X-Proofpoint-GUID: JEVmwZs2v7K1s45XC5Vv2jUgqYMKpivC
X-Authority-Analysis: v=2.4 cv=Ws4rMcfv c=1 sm=1 tr=0 ts=68353280 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=1tseWai4MNHguRGVtBsA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDAyNiBTYWx0ZWRfX3bW+5VtuZtt0
 C/lw8lSl2Xxn/HHexyLcGARR0P8XPmnMJ0ZnkaJW4RbqrcYEZWHes69ctgZqfjxxKHXpQ7hpjTz
 g+G71RcGJWmtGCUY9pL4Ksa4NBy98kWW7crlC662gGRPGuJLVxXGmJWdl9sF30TbWXvO4tXXDsR
 hfvsAafilckQq7Us6qzI0lqMTfLbhZYD7e0Li4V45fprclkrRRtcTm1OXWa3cO72b1P01MyoPoR
 r4AMkJEhXl2muVRbVF1JI6qQS5gPXXvdRI6/kbmrgL48mc7elk9PcVuirMsAjH2NSQzHDVMGcbq
 d68wDbLz6Bwpv7m/KZABDC5RNpBH5vatDWwh2UFiKcasJsBD41Vs8fFNBapP/BIboGveiredGDg
 fZsQVusQxI9+wtDHQEloSZBdi5gKOTW7n1b5S1CUjT4nTAuhOF4Z26r+PSbdAv2NvEx73BIE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_02,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 mlxlogscore=742 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505270026

Enable the venus node to allow the video codec to start working properly
by setting its status to "okay".

Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 2b5aa3c66867676bda59ff82b902b6e4974126f8..0686f5c10bdaf7ba3f522e16acd2107d25742dd9 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -338,6 +338,10 @@ &ufs_mem_phy {
 	status = "okay";
 };
 
+&venus {
+	status = "okay";
+};
+
 &watchdog {
 	clocks = <&sleep_clk>;
 };

-- 
2.34.1


