Return-Path: <linux-media+bounces-37818-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E105BB06807
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 22:50:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0CBE54E753B
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 20:49:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A1DA2D8788;
	Tue, 15 Jul 2025 20:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FCrVWsn7"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0CD2D0C9F
	for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 20:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752612492; cv=none; b=RXENKWzNWocONGfC8wz31IMHAhqbSPDC7FU8/bjLW6HAuusN/7ozcdPZ6vxonn8TirwsavOyKSKArplXFzAwzG7OeBDlHazjg1xQzm5QbqiKeYFWOlp/ASaspMkRHV44ze99a2EHFxtqam5siWWU5Pz49HmnnhDzk0I7oyUJv9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752612492; c=relaxed/simple;
	bh=BnlN8BH0y5miKc7waS4rKUqhxFa14KCTqJylMT6SIe4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ju2dRzWXh+CnGuqgEFpJGRuGQqbgxpFC4ax8+rAe1pqdp6H3zarETy9mJlRN95aaMkgR6+qSo3xH6Pz2mbyXnLeVe4wVwhbM23ud4eQmqZabj3om7ZZjzhcduwAaQNmlJzlL5vQ2PPN0WP/822Nv42Q+UgLm1vEECqimnJ3bOM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FCrVWsn7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FGDAOD025681
	for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 20:48:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Ulnnyakmdjr
	TKRRwRremdAmueSN3wLLHqGlctDxytVc=; b=FCrVWsn7DwpAiRU03Bf7J3G10cA
	8p25K05EY7CBZRIGQM6AyjVxlOR2oIwb+DQI997+Iu4vcB6XSrTzDCFrC0dQb/xI
	Lxt8a+/oP4Seb8DmW8DUObqPyyACQYchIeaNbicANBF/pIQLlHKDz7giOsKzw3FA
	dHayKBpV9m8wbC0seZUTD1UHxcVO3dntGfzcPnBx8ve0fKr3K4VThehhsntDZPWW
	YNqnT0TTq5IMisspE5kfQ1GDHWA8D5KAOCPAG/IEZ/tF8TdgA1TLP3bXMPtgyYMA
	hdbTLK4pV73iw8411U5bEvioVR/tSq3CapeCa0KH8HWC+tbV4ZmXkk0HjcQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wqsy1avj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 20:48:09 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e33f7a58f6so115591285a.3
        for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 13:48:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752612488; x=1753217288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UlnnyakmdjrTKRRwRremdAmueSN3wLLHqGlctDxytVc=;
        b=pv/X/uAcztu4x7HqaJEED9thFx+PcaySGuoUSxsyXtcX2c0Eo8giF+GS9XusarijQO
         dWZ31mkHpdOUOEtHyRFqs5vwklm2qvDqLf8ix7dHgriC/DzwZANiHK4hE3cTiXWwCVbE
         8ZgacZtJa/i/6tJkEJK1tgdU+A45/Y2YbmSVnYkjfIXcWGMOjMgeGIn5h3FwWbwhBKcV
         Citj8RzVX7bTH2JgH/inFNCp8IX24FEb80GbccJaZoyyry4bE4fDSE9p9mTnOdh5MPYZ
         6Go/7SkkplnRWJmZ437WxbpYMK19FmjiNCMvRTx3gDI45xvRVTwPIzlagqYmxmPAcYBl
         HSbw==
X-Gm-Message-State: AOJu0Yx6MovjxNUvu8KkQFmqCVCqm78HDkDcnZ+J3hUEzThUz02hABlj
	keAdLgNDYXLbvqPxZTZ37B2tWWKaANYoIY94CoTU0EZ3yqQfPhMO+i1BCvioJHHJ544UaNwF/1v
	lzxNkd9UrtsTyXz/r+oKgKOooXcZHFEZZGKIbWnhfyme+S4vdYUHq3HkRBzGpT/cNOw==
X-Gm-Gg: ASbGncuFIom+mthm6chLMLff/y8EV0gE7npfqqGqJKmCmjqkjotg8nbp3qF2ceop6ay
	kCceSQn97GeDVaHJIooylcigYqB/wb+vsVeRNa4zfb/XSZHVa851kcxp/Gt65aYtda9VDfcZvJ6
	Psx75pPm4qxpklkEOFJEfO5LLU3p9gL+AX1YQOC7hP6LiZU1XZmiQOFz7aJXuEYxH02appxl5Ht
	p5CamYGkjnUl/wCIMnkr7pMzcrF1mwGqXjFQCS9nECG4nfICrTXLxyk9c6ZDaUt07CJn0Ruevyv
	H6Go9Fh/dByLys+EVpnNJJsUHG4nLxI+BuHyoptIh/AioWK//tqd9cUR/K9xoFdUXCUZENKVtGS
	OyCCosdHcvSZEQz9jbg==
X-Received: by 2002:a05:620a:468e:b0:7e3:3065:a6b9 with SMTP id af79cd13be357-7e3433486d1mr52338085a.7.1752612488366;
        Tue, 15 Jul 2025 13:48:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlw27oAr+iNWanGODjwWubXZcxp8SV4xbSVfakE6bozSVtRFetzaqd9UG4J7kX9ItIp+YXDQ==
X-Received: by 2002:a05:620a:468e:b0:7e3:3065:a6b9 with SMTP id af79cd13be357-7e3433486d1mr52333885a.7.1752612487970;
        Tue, 15 Jul 2025 13:48:07 -0700 (PDT)
Received: from trex.. (153.red-79-144-197.dynamicip.rima-tde.net. [79.144.197.153])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc2464sm16331877f8f.38.2025.07.15.13.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 13:48:07 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        krzk+dt@kernel.org, konradybcio@kernel.org, mchehab@kernel.org,
        andersson@kernel.org, conor+dt@kernel.org,
        amit.kucheria@oss.qualcomm.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 7/7] arm64: dts: qcom: qrb2210-rb1: Enable Venus
Date: Tue, 15 Jul 2025 22:47:49 +0200
Message-Id: <20250715204749.2189875-8-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250715204749.2189875-1-jorge.ramirez@oss.qualcomm.com>
References: <20250715204749.2189875-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDE5MSBTYWx0ZWRfX8rXcWOSb7FHU
 NcGB8TjBpi+eO52cXNs/STHrnkYTjnB55gkblUL7uRTVepkMQoxNKmZyvPkSMmF1N3lqJv6tXI3
 jFe5De8AuD26ynmPEb8gF4vkBJEt15sy6SJ4TjgDPX5QMGvWbzcZRaM7NT5HXzMfORen937MVB3
 3pMWtwUZ+cu5wxJPWVEUjF5pTGOKX2LOMvZdR5DtbI4rZb8WL1OsvoosKR2CoSitMPWnWfP+HCw
 aUoXGKz6vCPlkAXfEdN/w2dVU1oD3Ws5nYaW6MY+smkj+l58nxY5FWxLxJrL2aODlmpKeFvlH49
 +N15Iy14D8FlrMF38cxNAl4WXsODHPk6opo9MzKx8CfzNglYvW76Al1CY/o7YO3g9azoTW/ZNSQ
 S67pcYMz2efpeVyePLgGgAtIfFgF0llL6BYsHKBbudez/8N2897ABpeIG+MRS4v4N0R7AxdU
X-Proofpoint-GUID: k2g2zZZB73bJLNEHzlS9t1qMSokhUf_o
X-Proofpoint-ORIG-GUID: k2g2zZZB73bJLNEHzlS9t1qMSokhUf_o
X-Authority-Analysis: v=2.4 cv=McZsu4/f c=1 sm=1 tr=0 ts=6876be89 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Ki5fnJvzvo7yLsyA0quaxQ==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=Qms5JgQ9tnEuTiNUcoUA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_05,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=696 impostorscore=0 mlxscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507150191

Enable Venus on the QRB2210 RB1 development board.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index b2e0fc5501c1..8ccc217d2a80 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -711,3 +711,7 @@ &wifi {
 &xo_board {
 	clock-frequency = <38400000>;
 };
+
+&venus {
+	status = "okay";
+};
-- 
2.34.1


