Return-Path: <linux-media+bounces-39881-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 665B2B25FC7
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 10:57:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E1F71C25358
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 08:55:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EE532F60A1;
	Thu, 14 Aug 2025 08:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jyh4dR6Y"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D707F2F0C4F
	for <linux-media@vger.kernel.org>; Thu, 14 Aug 2025 08:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755161588; cv=none; b=UDuYWBS1eg4Ly+p6MOdS4Q2J+ce3BBFTmS5HyEHui85XYy3Liqt29PZLhbQUAWI04HXlNSTkeLPVZOXkVgfWQUcQ3sJZkM0bgPkPFLnmlPIrE6rG8XA5/JJwbkPaigV1Egj77NVDlcm+zXXRKz7Kbb7NOmvH5NtT8Q0Wp1h4BQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755161588; c=relaxed/simple;
	bh=2nrV1RGrteIGILA35JGVcooDPCw0i8l4s+Fs181xoas=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Wk276wF5CHDIxGSkBVGBXmx0VCqcWmTtVu113cCTMZxLN6Wx4dkk+O6Rtc03HsMjc+RLzzvzkdPYkFkyR9fMrnL4OkigVSBnOAdxCSf6TPplNYpzx61OEhuuEe44K09JUTHTLOXuedEUz9VKksJ8MnchpSsvVKMaOzKYZDMnFbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jyh4dR6Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DMBPec027100
	for <linux-media@vger.kernel.org>; Thu, 14 Aug 2025 08:53:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=802pdFifR+0
	7OV/Ivdq0qgpF3I8tJB99ZMyu6lvL/YU=; b=jyh4dR6Y5GqRn9yuJLvkmi6qTRV
	W1SlCzCiWosgv77Dv6xxSxN2XXcwLBJccGOtJeFIx6ysXRCPtr7fvDrbaSw83d6Z
	twIYFk7pDFIA91QYFQtLMlNbSoUqh2vNpr3I6bAT+UA33MRhN4zHwOhIn2O0eEaR
	3CjcdJYkjtXoG8Uhl/bl0GFEyyMZKsBTfuAlS14VfX3V1OKshB9LeVhbaQrjfyO3
	u3Vs0EZbcFLnWgf9c3jZseeuy2EgX+9RolWGPOcRsvqNYky+0TzfmXhPmL3nEbfr
	PB7kda6Fx4iP/K0fM56yI+csS6tCxN2hhDm7yNNQ7Z5t++0AEbWP9mPzPyA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffhjtv53-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 14 Aug 2025 08:53:05 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b109ae72caso17575301cf.1
        for <linux-media@vger.kernel.org>; Thu, 14 Aug 2025 01:53:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755161585; x=1755766385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=802pdFifR+07OV/Ivdq0qgpF3I8tJB99ZMyu6lvL/YU=;
        b=JjJzXbE9pj3WfmT5MN0L52OKGoP85hD56bMueqbtWdrer0Lb78kDreuq6qpgV3B037
         9tCd07yhl8yaKBGiibsvd6xOK0yOEemx5VOmC+HE2rCOnmcM74nqurDuGhXAgS0o59To
         Lfw3VGUk32SjSkQBVsnSDucsvAZfsnRcfcdmajZsRRkHUMLCDBSFtLxbO2U5aOyYKPz5
         cXYNfqap2TjcMkcYmulRMhwSdCjZAfaddijYRxIpBfyL5iA2bT+d+ZgaX1mI9Uepfu0y
         K3ITQRYHa7qXAqlAc9ydkvMPPJhFEqTowLJeVl6ih7qrHCi1TiXhwnoZCZJLI4O3mY/H
         dsIA==
X-Gm-Message-State: AOJu0Yy0u5j8VXvkXC8URz86GjORoGzop/O7Nj3m5B6J3/v3Jkq/jUJm
	sI87HjDYSlxv+OmN7upRmsaeCkRuhbGhRS3tvJ4/KWvRi6TpGaWFEPBthDWaiNcebcnORg/ljUN
	mj8un/qBdWacwD74HfnVPLEp9eJehKOu2ysC9bZqvEsIU/AVjLAp9XluQ4+k886NbXA==
X-Gm-Gg: ASbGncvza8vJnqUOSGBor3MGf+oYzGQUz1TxUXlH6O8TONl2konsih4Qp+yD2fextjQ
	96dboSKmZKFtcqVaOcLoBnM5JeIsrZ1AvXhBwIQ70bVtTUneZgwXqFzGhaNrBHdXg2xEsa6Qckz
	8RP7O5pvBAM6Vx+WtNoZGuGQY/v2NB8TO+viLamMN5Qh6TlL02Gka+yBp0rIqs1cl8vLekhpWYL
	2HrrDiq1PCsoR2vF2MkQKGvgdgyycxrzXzeLcjSMdli9xyykKVyo7kRFGrGGpLOkJDQyD2TIjAZ
	m2Z2ENbcewDHmVWendNiRJMu2TsXbA0F2o6gPCbeQO3bRYgtP+GCxKI9AkL4QR8d/IflTnolgIb
	6Yhl2J1HCtaVF
X-Received: by 2002:a05:622a:81c2:b0:4b0:e934:85e5 with SMTP id d75a77b69052e-4b10a958260mr23386671cf.5.1755161585083;
        Thu, 14 Aug 2025 01:53:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDfgB8pIcLGblDgdcBbn8sEeOUMF0U28QhhTWEOvZWpvnlv7kxX3cNXjAhMSWaa/z5Xj1oDQ==
X-Received: by 2002:a05:622a:81c2:b0:4b0:e934:85e5 with SMTP id d75a77b69052e-4b10a958260mr23386401cf.5.1755161584620;
        Thu, 14 Aug 2025 01:53:04 -0700 (PDT)
Received: from trex.. (205.red-83-60-94.dynamicip.rima-tde.net. [83.60.94.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c6bc93fsm13155895e9.2.2025.08.14.01.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 01:53:04 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v10 8/8] arm64: dts: qcom: qrb2210-rb1: Enable Venus
Date: Thu, 14 Aug 2025 10:52:48 +0200
Message-Id: <20250814085248.2371130-9-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250814085248.2371130-1-jorge.ramirez@oss.qualcomm.com>
References: <20250814085248.2371130-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NCBTYWx0ZWRfX609DbnY2Tfqh
 3iZeJmU4o7yk0Dp4vzuMNyqvvp9/DqYTqZrkzYmd5gMlzcorBBmO30qL6ElZwuJ42NqcPfT1wQ7
 G4r3CkJWAigrHzsLAZgFBkGTqsgR48AcHy80i8odKS3+VzVkoLYcCkoTh3tgNWINxfnGtMlCTnT
 prAodWXLJ4eGo8yR/gGpRcoPRPQNF+zidZSSmMzY7W5WWknLLAwuUHiuOssMWVU4nk9q1nje7Ry
 NihsvbFgbGbSGRYmcN/AEHXCbB4K+bgFf8UB+0Bb74EeAPIzNyz1k1BMlKtzxJIJIMKO5rC0wMG
 /9+9U/RTyHrEtXEkponfq2RQwUZXJcA5yFF4lmcSuQHh3Eqqsem5C+V7rBNotmJDdA9X9BUUh26
 ovXbwc1K
X-Proofpoint-GUID: cxETtCwNpoJSXBfa0uQxk7PMg9YTItIE
X-Authority-Analysis: v=2.4 cv=TJFFS0la c=1 sm=1 tr=0 ts=689da3f1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Rr2dNH5/fcnoRoBmcVUeRg==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=Qms5JgQ9tnEuTiNUcoUA:9 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: cxETtCwNpoJSXBfa0uQxk7PMg9YTItIE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110074

Enable Venus on the QRB2210 RB1 development board.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index b2e0fc5501c1..e92d0d6ad1b8 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -698,6 +698,10 @@ &usb_qmpphy_out {
 	remote-endpoint = <&pm4125_ss_in>;
 };
 
+&venus {
+	status = "okay";
+};
+
 &wifi {
 	vdd-0.8-cx-mx-supply = <&pm4125_l7>;
 	vdd-1.8-xo-supply = <&pm4125_l13>;
-- 
2.34.1


