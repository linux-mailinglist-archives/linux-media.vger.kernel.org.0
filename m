Return-Path: <linux-media+bounces-61261-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4F7GMRwsA2pI1QEAu9opvQ
	(envelope-from <linux-media+bounces-61261-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 15:33:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A14352141C
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 15:33:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EBBC832243B0
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 13:16:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92D8E3A2E24;
	Tue, 12 May 2026 13:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aNC2GR87";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kG0iWrun"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE7439EB79
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 13:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778591395; cv=none; b=YnEZts4844SBN8iv8m0fQ35EWFCOKQoNlZgeeYW7zVz/68ASrTAsZeghU8+b12rCHSwmQh42n/ZkWUCH/55LwJD0LEowKBMQwFV1kqAA7v6hnpXZ2DMARuXX622eOrrkWQOfrmp8tY5SBzPa64X9IVSbpIXWyVoYL8MhGsf7IXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778591395; c=relaxed/simple;
	bh=dicEJZtLq6zW0VUaiQ1W5EgO1yN4WYL6q5FtmZ8EKdM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KQQz4GLsY3kHGT28W+hxFKFJveT6FaDqQnir39ocspf/BSnS9hzcrcpr6Np0Lk8+bVEPFxw040PFZflCeHu5fZT+dZuLiRQr8CoH8vxI+zgUoZYmBrZYbobvEEOqB48Pj+1fd/02DkqFKWBQXVJeUYoTn9Q0GjB/cnsTpYPqIFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aNC2GR87; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kG0iWrun; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CAe8ub2186405
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 13:09:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hyGb0UCYPIrtzlYMMFqHwR0AZmvnwPLK/gKxBVnW7aQ=; b=aNC2GR87CJrXucOX
	VEhsel9rhuSIbyow70DpMTPuFlhvJtZ8Hg2Q8yVdIZX+bEJy74IahNKZB5u/ZXvs
	/19aGlrDMkAECHKwyQuYIA+7NyXUCuPKzwMRPQzHrZPHTyWOMRnf3nTVr/cyaD6K
	rmj2FJIO1LgeZGGofBh/1A/Z0gkzP6lpu+aC0HaDSudetpeqgUVnxXyV7b90NWqW
	QdCx5S7SNWr/g/uNGmIIcki9bAgePbh7Xg0fotwEmJK6jNEYbHl5pgdBFHVmGoTy
	Vr48XN2bYX0DG45oahE0+snEvI1++zAW+9sowPya50NCn1ZJYhMyayrxwXT+PTvR
	OWOf8g==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv0ub2p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 13:09:53 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-696233b2816so10327215eaf.1
        for <linux-media@vger.kernel.org>; Tue, 12 May 2026 06:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778591392; x=1779196192; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hyGb0UCYPIrtzlYMMFqHwR0AZmvnwPLK/gKxBVnW7aQ=;
        b=kG0iWrunOPMuHCbOndKLW/LKfwXgwwsDYjFYPXCCzazNEofI5ORXQfWFnTs+GOteEU
         GOLMwVb5hO43DJw3F5nqH5/56huI6ThCzbRbsqRxl9vPyNvzHXUIQdBzEtxTUHDXoE7r
         7X/+K2sVIMYIqgt7WP+2fANLHfVmrvpNsqPmw1+HHnMo4d75hsRRN6DgWlyo4Pszkr4c
         xKvLfjwfm7WIf1ismNYfHupfxIp5f6Qx1BJ5s7q+N0P3pXQBXc0MqSDq6yQDb9XoEYWb
         /CPnpovXJA/GJL1WqDdISmEwsAxp/57+lmqyordEbnjXkYm4TNG/2IKS1CPnqlKa9QM4
         3cdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778591392; x=1779196192;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hyGb0UCYPIrtzlYMMFqHwR0AZmvnwPLK/gKxBVnW7aQ=;
        b=D3lJG9VoMyGrUxFcQs3CPKbglXqpSi4JiWAvm+IZ6G2TEQrURs58Jbf3BKzZhICgKM
         OofxKB6mfZ3BJndx2QV0Rxu4gpymAJ3w6BsYXTOPfMuTHCrUHivgsrvfZ/TmWD3ckkmY
         tPyPrhTFsPOsfv/1ENkxujoDelP4WU7E+h43m+MnZQj42lLi8WG3rrSLr7YRKDHMUq9B
         llayk2brZ5bpaGE5pCrYqI9a/I7AfRzCvz390yWjjkwmEWSeUxzXxGRcvWV08Fsh/zgA
         2WF9ol50ddinV3ixKF1JAANUpiET2Xpo8e6Lcn16z1J3bOjowTrTxTr2U+hKZVX96mVX
         gcwQ==
X-Gm-Message-State: AOJu0Yy+3MDeLemetXcIt//G8kDrLd7IkD4TZquY7Jx7JbsK0df6AO42
	8hTh1HpHeaNOPzjYOEjb8A0KUJ22tIQCfF8NCi0BDYThC7c34vFx/Q9rJq9vJscph0zRfmmUcPy
	DYr01FWtnJt4vY41KEZ5p3bsJP7hZzrQAId1kDCGjSF9GMIWdFg3tpBWo/rONiQ+46g==
X-Gm-Gg: Acq92OHu0wfhLsx3YbOEokDy1x1EgkqW7zssHntnCbcKuw9J7FlgkObA0uAlG2vzFuD
	uyRgsW7RiVXbmTPLgwbFHEJ0t00BiSWM3+BOaUxcAb6wdDR36MJD3e02dpn7wixz0fff9o+gwhG
	wvkLu83jTuKhVeHTbSEFmfwUncrvHoj9uuOMmP5M7SOyoMoeVJuWuinsvRI29pfIp6gcTq3B07F
	x/pdwJbshmH/bxLG01cl96RSzrUTJbCIf9H0DoPZIaF53NDme2dQmX1tnAjr4mCRVyQWgwF24bV
	9oNuFhg9FtCQ4pangMcZnoOr+GRqIhgZHaw4Kj16ifr4ADnZRjZRCvtyf1tGBx7e0TpKiAlA2Bx
	pHXwHzTP9Lm2Fiko9zaopHm7MBte9hmXmbt+GRNTPBsXPx563pYmtOyZ4q4aGIH5IW+09KdTpg4
	U7ksd87At1t99UkK8tOlyx3Cui46Uct+7+OPE=
X-Received: by 2002:a05:6820:4def:b0:696:70f0:7ad7 with SMTP id 006d021491bc7-69b25b178ffmr9484722eaf.4.1778591392279;
        Tue, 12 May 2026 06:09:52 -0700 (PDT)
X-Received: by 2002:a05:6820:4def:b0:696:70f0:7ad7 with SMTP id 006d021491bc7-69b25b178ffmr9484696eaf.4.1778591391850;
        Tue, 12 May 2026 06:09:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f3a8e1sm33739451fa.15.2026.05.12.06.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 06:09:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 12 May 2026 16:09:34 +0300
Subject: [PATCH v5 6/6] arm64: dts: qcom: sm8350-hdk: enable Iris core
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-iris-sc8280xp-v5-6-8cc251e83b58@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=806;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=dicEJZtLq6zW0VUaiQ1W5EgO1yN4WYL6q5FtmZ8EKdM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqAyaUrAFin2gF+M+wxc/W4ANjprSyX58zXRICZ
 j/IR/OCWPOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagMmlAAKCRCLPIo+Aiko
 1aIkCACuOuwukXm+nYWynwcb4cgPAmYBJclYTUrssk+rPw19hU+3ONBczaDfWgzu8/0wVF2gdh4
 VA6blAe+atLPhziv36a+9GeJvfCGUpC3jE3tcONhdsqdzx8vIp01Epj5lZo3eMeY/AMHvqsl2UP
 OH6ytaDeLF6jn3nKc8YmrUIQuNQ59xRwjbhVwA+6wssLaDqVBVgl+la4Wir8g4q/GDqeLmx6p+n
 aArwsig4imUpyldyExmudDDRXHrkxAyuF4/toa6os3CY/Q2SCpviTITy44Si4vTNxwIp9CLKZON
 /+4gpJY69vdjvEH7+oP3n6GmsgmzKYKU8iWLgC+/uFYuB1VH
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEzNiBTYWx0ZWRfX9ovymWsn1LRD
 AXPIy0jKSr/8V7gXNlMZTZ5Z5Kj+DQC7kyO3pZkGcAuz4cz6HGHrKzahkWRdHJQqWi+Df0IyTYN
 YIVE+mDmXVrkxrd9lY6gZoB4FRPVq7RXQQT1wSvAvRwnIoP7OGjDjp/Z55qf9GS7MYcfC+K8sbW
 l2RTVUtP2aRRYXW1MJjHyTY1Tz0FFKSVDrHVxaUor+CSgTOdAr56MYhU285i7KP/t3unczzIQG/
 OfUHH+zqd04JPSgMwq3+chHrQVIGEWulSl58NnLyJbtmt1F9pFMEfWVihkN4Rn2J/YCkNUM30JC
 8NGtBQOk0H+3gmG6dR+Vou/p6lgOleECJJCthPLOf+/E15rHn9v0RdYwwoIwhKVQSUnehS7c/9N
 IDBhQFXMo4HZXsTn5mEvWsp6Na2sLlQUzsOTCd2XU8xIArxZ1pEKBETTm30c21LKA7iiJLs55ed
 8AAogtF+eo7YUcW5mAQ==
X-Authority-Analysis: v=2.4 cv=bpB8wkai c=1 sm=1 tr=0 ts=6a0326a1 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=6kKVESMuOeKZ7y-A11oA:9 a=QEXdDO2ut3YA:10 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-GUID: skFUwzayxGAoQjuV5Ei06HP95s1qjZEP
X-Proofpoint-ORIG-GUID: skFUwzayxGAoQjuV5Ei06HP95s1qjZEP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120136
X-Rspamd-Queue-Id: 2A14352141C
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
	TAGGED_FROM(0.00)[bounces-61261-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
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

Enable video en/decoder on the SM8350 HDK board. The firmware is not
(yet) a part of linux-firmware and needs to be extracted from Android
data.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index 5f975d009465..055fc8ade85a 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -472,6 +472,12 @@ lt9611_out: endpoint {
 	};
 };
 
+&iris {
+	firmware-name = "qcom/vpu/vpu20_p4_sm8350.mbn";
+
+	status = "okay";
+};
+
 &mdss {
 	status = "okay";
 };

-- 
2.47.3


