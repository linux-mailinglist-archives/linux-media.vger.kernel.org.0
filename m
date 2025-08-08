Return-Path: <linux-media+bounces-39100-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A15FBB1E4FD
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 10:55:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 10E4D7A4C1A
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 08:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64B3B2749E8;
	Fri,  8 Aug 2025 08:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SmBYrewt"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FFB9273D8E
	for <linux-media@vger.kernel.org>; Fri,  8 Aug 2025 08:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754643201; cv=none; b=XYtP9jgdf+QWA/nHH/c/6DHkOCKlVECKAeBhLGHEyMS02kuzDrstKQaDCChgsikzEBY+zS1De2beeL2HeIvcs6Fv/jGWKVfN5E/CyZtx7wBAKpJYt2x9NX49NM/rR+2WThp2rYyrIO8crvxesXeS9Y8+8GgPiC3f9V1Xd55au7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754643201; c=relaxed/simple;
	bh=xLcisQUmX1kKWJaAAGMAi99CaZ3yNW/4jd6IUN4d/Tc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=B18Ws5GC+rTsR237vt0gEJHR2sO94LnVNLRybToQ56e7XE4B14q4uuANPoLfs7tb/IjWZPeU+xtAfPVa6kmFtSazeCIrGJl60vc5rosMHD5mX0dvYOlG2CX8oYOU3czuSMLHySGZ7EHDeq0w4eUlBfOU7M/ToaZ1zT8802rdRS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SmBYrewt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5787LeCj018565
	for <linux-media@vger.kernel.org>; Fri, 8 Aug 2025 08:53:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XAMShpBw6gl
	5ZzER3GWo8lF+QTIMlJwqOkE02a/mRys=; b=SmBYrewto+jNpsi4mCt3DQSMm8s
	yyWJMBkdy7sYhTSI4EFHOId4KZhIezx18DuJfacTiZI76cgvob5NnPVDSOves4Am
	8bF7BfkiJhIB4Ul4yAjnLk8jmCBL/PlU/oN98Zu4HskcRTu7qtZAVeiJrO7crsCj
	Bs5+wJDgbVYVjXyqqgOBN10fIlsT3t7E95FSsykffNmCLwcppshrZTN3fuFj4v9d
	/++nJXyXw1D6GhB1dzt0AB7oq2XKqFTyJP7jdcy4LZQ5io1qI4cpctS5iKhltfGT
	kNdktzesb29biz17JE5DvVPaPgKHBKcRoHjr7Bk/bn+eSmdyLyyls46uxgg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48c586eyc3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 08 Aug 2025 08:53:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4af1a20cbcfso47306571cf.3
        for <linux-media@vger.kernel.org>; Fri, 08 Aug 2025 01:53:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754643197; x=1755247997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XAMShpBw6gl5ZzER3GWo8lF+QTIMlJwqOkE02a/mRys=;
        b=JUE3A+2NQDOA8k60eeI4rs1b+eHTRh6t/h1szoiVHr8DjrOrsSXw2kn3sgqAGdFAiw
         Uwzer40SNILaX+YY5MpV2tBLm1hKN0BMJ2zbsDVhJp2Pmfrh3VhDUgwZrUiIO5uOOL4C
         /HObkSZ40d2rnvSnKA2HSayUmtxklue0EIdD9L6BTHdy4IbmtTGbzEkKcKsqw/nNtA5d
         9EEU5Kv6zYN2YmNRWjLZdWer4XHzmrBPsQI4fgMSAdC2pPEdE4Iuuw4T2Li+w0P2TVXs
         X2HyqQT2xeTAz41aJ1ksvpARUtW5eQR5zTBJx7wxoPtFb2WlUiUDVyu3npZgP2nVZXiu
         og4A==
X-Forwarded-Encrypted: i=1; AJvYcCWkkF/uqBY03p4tmrw1vqbUSiGjE4EwqYqWiblhZbxfJxWbPG7RsFq7ZpOrJBLB/+QeLbnpMcgWkfuIig==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBctIWrJbe0qOVcdWE2D5QVssJRLTGx+vSCh6L2SdW7x5TKWxF
	9xemtuvAhlt44C+abHpiwMdjm+r1MOxHAaJPiKbqsk2ZGPYBTd5D/HIg7Mjju1axSStEY8cwj6b
	bM96QdJcFSddEPfIvSDDF3lKE34CtdmJ+xvYlV8sQ2pMTeD9NQpB+qjOEyup4mDolbg==
X-Gm-Gg: ASbGncvmLZ06Sw9nAS5EUPOAzV9CFUydzWtcbSajcZS3955af2LgP/IknwNJxfpEz5T
	+3VpuZmQtU0xraGqoDjiKijv94A3AN6rydecLtpWK2hoSaVqglbSm33NIKIsIBrRA0TiKfxerTj
	EFY0cEDrLUqYnHOM+506XWerKWrFmZF4JgIDfYch8TGMFoZKgglNH474gJM8/mkM8P/azCfhv0t
	X2Ab+gNUA9nlLzc1YopYFaizuk1lxyy+EwvfSzSUTf9VMSBbJr+WVZBiKc6GEe8RifKa2vnWFCB
	+8+eZvVxnI891zk/GflIFsCcJbooylyCNWWRUaZnQp+MKYNyTA/gTXJexg01IP+9PTwBZgD5XZV
	vCZcblcwvcNid
X-Received: by 2002:a05:622a:248:b0:4ab:41a7:847 with SMTP id d75a77b69052e-4b0aedc95c1mr30198081cf.31.1754643197261;
        Fri, 08 Aug 2025 01:53:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJP2aWj+S7AivPnjl0T9O7ur4HP90mdxQ0hwDryC5Qx7SHbXMaFhvERCN4XIMhJujoabrZNQ==
X-Received: by 2002:a05:622a:248:b0:4ab:41a7:847 with SMTP id d75a77b69052e-4b0aedc95c1mr30197871cf.31.1754643196868;
        Fri, 08 Aug 2025 01:53:16 -0700 (PDT)
Received: from trex.. (205.red-83-60-94.dynamicip.rima-tde.net. [83.60.94.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e5e99e04sm123818745e9.11.2025.08.08.01.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 01:53:16 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        krzk+dt@kernel.org, konradybcio@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v9 8/8] arm64: dts: qcom: qrb2210-rb1: Enable Venus
Date: Fri,  8 Aug 2025 10:53:00 +0200
Message-Id: <20250808085300.1403570-9-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250808085300.1403570-1-jorge.ramirez@oss.qualcomm.com>
References: <20250808085300.1403570-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: wZPoaOZoB7Vgh8wOdS1-U0yug9_NFzof
X-Authority-Analysis: v=2.4 cv=MZpsu4/f c=1 sm=1 tr=0 ts=6895bafe cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Rr2dNH5/fcnoRoBmcVUeRg==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=Qms5JgQ9tnEuTiNUcoUA:9
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: wZPoaOZoB7Vgh8wOdS1-U0yug9_NFzof
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDA2NCBTYWx0ZWRfX5BEQGRS5rEPe
 G5ShFB1naINRaKQhBb6BGg73akiBhxahb+0jtW+7hAN+7L5+odrulCjk3vpnufTBlJYx3tK6iyL
 kc9WVxTnvQJx3x/obEkXSgCGSxcI5U8wnuvxD3DFjh4gLxZeRsE1tIbdihl3+H8gHzEIl5wdz7u
 44yyO/GG8Xvhj3dxV96SYg4rrKzU5bx5Doo3ClCxA31gCU2hS36R9YQ2b0TtDr8qjS1iC/oZjz1
 rL3jjQxUoU0RgERL8x+0lq+aVjwQ/6s0zNOfBkYYADB4uSmiiX6areiO8PoyoauN1LZi4uYBuHi
 jTEWXb4d2KFACiknYzqJ0a8iphpSz7iI2HAoSED3WlWyPQ7jyDiIJzqlki4spzSOWH3qpmqeP8P
 I3eW5jUu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060064

Enable Venus on the QRB2210 RB1 development board.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
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


