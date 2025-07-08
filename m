Return-Path: <linux-media+bounces-37161-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6E9AFD61A
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 20:08:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA779544523
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 18:07:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 564632E7174;
	Tue,  8 Jul 2025 18:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nBSlKwxF"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31D32E8E1C
	for <linux-media@vger.kernel.org>; Tue,  8 Jul 2025 18:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751997951; cv=none; b=pwOSpmzqzJpCtV3V3+7DoXi6TBak/GzprzvbmrD735kvGzAWxav/3PHlAsI7fQWsumUwcPB2+WjtbvcMK86JvijcB9uvNG6bqBgOQX4Wj2gV07BOOj5tAPeQJeQTipNgBTdiucFQ7Ot24G0WzeA/iHh95NRBi4Zp6nvGw9ExMnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751997951; c=relaxed/simple;
	bh=3a0MWleIyO3gL2IRZDHzo83tNGJ9l+qQFqUNeP2HJrk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=klAxFubj4qQL9RWRSgFUyUpLniNTzmJG0tMLtuB5EO1W6aficqfyGOGVdWM0sssmwnSuNqDIU90aGdLRwJa/e/ePOo56skjkFThTRhN73+sVcEmp71nHPrQJWt2TCzmclybfQnEQ2E2vE6cjBcMkfnJzCorIdYPCoOOgwvlIVjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nBSlKwxF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568I5QwY026881
	for <linux-media@vger.kernel.org>; Tue, 8 Jul 2025 18:05:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=v5EEqpTBsWK
	2r9AuHuvHgMamXxn21K03bgFNVlidZok=; b=nBSlKwxFq65reUnqR3XPaUODDaZ
	qkLr9zo66sQARJtTgLTARM37EQ84aGp3AaUq7ynXro+kdyERno2xffUVLfieVcwO
	H5aXwXy419XqvWmaFcPQYxAnfmg0GbQ+LOA+LCY/lQPy1AFwRQziFSj8CTzyQruj
	qFqGrabmJb5yeLQQqejREEsHkLu8ouvSxYiq+STCFD2aYUiHoVwAtjcrog9VKali
	/+EYoUjpMpCtcYDj119MQgXKcdjQdmnMUMHshlh4Gcva0gkWCnkwfWR6W32Jsoav
	k1KLSK851BBsqEnOIPgoC/u0ds/sKCdw2msK48sJ3caF0PurS/ksNBsvV3Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47rfq338ub-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 08 Jul 2025 18:05:48 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a7f6e08d92so55905911cf.3
        for <linux-media@vger.kernel.org>; Tue, 08 Jul 2025 11:05:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751997947; x=1752602747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v5EEqpTBsWK2r9AuHuvHgMamXxn21K03bgFNVlidZok=;
        b=GC/mg0bfTXw3FR9FPd8lPpxZnvVt2f5DDuXKiBR8EYQsiJCrfq70Iwtx7gGAdimMfD
         Vnt+yv3otIch0n7H+PsK+4S2LlxQiAdQLa21WiFr7flddabEUPajef+plDnC8ydg6t5U
         CVytCLb3DPodWiRDwZ+GerE1Qv585v+s84QdCg+7lpNPNZPvfse/dJitEo6sUbadvxP9
         AN+Tl7zD+5p6/kHJg11jYWjjup+fAKckwiqDEAjzOJ0ocTUZOKeAvk2Wqe9/mJKbQFQH
         rgbDQGfVwamLwNZnkGDel7o31dqLAP1rZa9bBtozKeMtobPFpyABjBprNKFh8FaJ8in/
         qjMA==
X-Gm-Message-State: AOJu0YwcEAZXuwR0HuutHIHOZxFTjW0iPLvP2cUiUj8PKHOkPQ5EHx6b
	hrix7bwkfBZkF7FCLu92+jp/n98eIa7h5IGndE45W9Ub6RZ2J7UferdgMnNJZVNSRD4E0ZbZEEb
	sV5pAVS+lD28kdw3+0ST0v0FtfdDxPTAWYUrNOSPTAXb9N0B9OwJrSEb8ANIC+EMuwA==
X-Gm-Gg: ASbGncvNwi6mmLC0xvNTF4+KznKVumFMVVXhhsPFvqp3e5s74nnEps16L2vz4zmlYCq
	e/zYfNVWOy0J+fGW9KRdY4pBGOQAbcNBZg0P9thjTIhTlYilnfAInTYVTKW2PZdO/cIRg6fLUMm
	Ifu6A3Mywdylxw4eZVAKAY1JtV/4jTf4Nwi7mHyIREHX7AG53iRzjAaPJt1qoqCuZpkRLtx9hvO
	9Mo1lCfWTx2E8E4w6YCABygOsTF95tjlcy4bM4QVlTnHIEC2rfZEMBTH5IxtAtptCEgZyKJ0ibM
	jfRkLMMMa0kMb8hEV1jnDuE8Rxsg0NF6hcAmYL+yPswDcOd+GHLNwDM8Mo5UurlAkNYpvhcaYA=
	=
X-Received: by 2002:ac8:7f42:0:b0:4a6:f7a7:4d43 with SMTP id d75a77b69052e-4a9cd6c7133mr74848051cf.14.1751997947205;
        Tue, 08 Jul 2025 11:05:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhjWVmMm7n2+pNxplxU2Hy47+FGd6ZQWvQBUcOs7FaKkNrNRd0xCNwdMoqmPKRnemCM1vPcQ==
X-Received: by 2002:ac8:7f42:0:b0:4a6:f7a7:4d43 with SMTP id d75a77b69052e-4a9cd6c7133mr74847371cf.14.1751997946606;
        Tue, 08 Jul 2025 11:05:46 -0700 (PDT)
Received: from trex.. (97.red-79-144-186.dynamicip.rima-tde.net. [79.144.186.97])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b4708d0a5csm13394906f8f.29.2025.07.08.11.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 11:05:46 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, bryan.odonoghue@linaro.org,
        quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com,
        krzk+dt@kernel.org, konradybcio@kernel.org, mchehab@kernel.org,
        robh@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        amit.kucheria@oss.qualcomm.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 7/7] arm64: dts: qcom: qrb2210-rb1: Enable Venus
Date: Tue,  8 Jul 2025 20:05:30 +0200
Message-Id: <20250708180530.1384330-8-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250708180530.1384330-1-jorge.ramirez@oss.qualcomm.com>
References: <20250708180530.1384330-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDE1MSBTYWx0ZWRfX5YToUofFnVVX
 TMGz8tbFwwWKiXZzewm43gtavlO0hm7Ed/pomjis3qQGJUAQCT2fCw2o4g0OKVlJNRQjT/ZoHWN
 RUS3BAdU47IMecaU5WreV4Bxr6sjjjbwst3R3T5fD0o5ohD9lXfWYOJ5wWhpO0hg5/F7ldZBfnZ
 JXQBpojLFWB7eQw5h2NN8HNCarug8/LHOVcNZ5Ei+gbHnjiPoyYMSDxJAhL3COh383MBMpL8AV5
 JIi/UkbzF0DecJGrIhjbLWP/oz7H2zLe8t8xPy7KP2Fdjur9Myonewl8wHkwQCCCl0qZqJKAvl2
 0Y35ISsMZc0Q4lgvOS0YPoJiysencFZNunbpS5gKy4zCyaNsikPp21KEqWSu4VPcSghf8UkBI2S
 hxfW4MCXP0FCChzaRBDyDpEBxKvA8a5ZQsxLm8O4VqMjb3Vf2FWyZqagRCT5VkJVuouNyaDK
X-Proofpoint-ORIG-GUID: VH0m5LBY2_M1eiZYGvHLx5dWzz-JYGFm
X-Proofpoint-GUID: VH0m5LBY2_M1eiZYGvHLx5dWzz-JYGFm
X-Authority-Analysis: v=2.4 cv=SOBCVPvH c=1 sm=1 tr=0 ts=686d5dfc cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=oX6B8lV6/A+qF9mARCc04Q==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=Qms5JgQ9tnEuTiNUcoUA:9
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_05,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 adultscore=0 mlxlogscore=697 spamscore=0 impostorscore=0 phishscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080151

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


