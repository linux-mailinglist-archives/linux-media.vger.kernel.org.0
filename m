Return-Path: <linux-media+bounces-47750-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 04727C89061
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 10:42:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 87ABB353A41
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 09:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62956320A1D;
	Wed, 26 Nov 2025 09:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jpHG+pBW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="REGnyrwT"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4587731BC8C
	for <linux-media@vger.kernel.org>; Wed, 26 Nov 2025 09:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764150016; cv=none; b=ueF9HzeDpNhyfKKRfFFJXsf4oQU/poqu9tq/y/jI/IFZR6feT3XPDYKBPh0g6C77TIcwNNdllsY08vq7Rg+bLQyg2t/rQr60zeekRzcAkn36lqmvvhy6fhT4c8ausDL8a6keWVAiH4myH35YVN1ryfWc6XOB9Dm7UbfzXfREPpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764150016; c=relaxed/simple;
	bh=rd7c0V4M3tmTuN9LHbmCjH2xmbCOhasRN72Asug0f+Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i+wDIYxxp8VVndbNNaW5H6SGEGtHcsXzfZ7gOjqa7FydeEMo5fn4dYIw6NseBCskZZpFvMn/Pd9+oWEg2de4wxBPaidpv4BmgRWE857y5+63vfzkEtdfiFe+qApIZE5Z92RWLsa/7ktwG52T3RwQjc6O6bVMcu1Py22OIU52tBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jpHG+pBW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=REGnyrwT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ7gJ531234827
	for <linux-media@vger.kernel.org>; Wed, 26 Nov 2025 09:40:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WlNWApUQhbUcSvwN6sQKN6H1USuC4ygtexkKCEVvP4s=; b=jpHG+pBW2yYKbVJA
	+wsG3whgxkaGB2CRZxJo0NaACyo0aZHN3+F5+wM2ZpKYHWdx3imLA7Botfob4tA3
	sY1xrSrLERRkUNuzKmLe+8kEBU83kH68oc3ffhiJmiSYXJlTAuxFw8dvTiHaSXM/
	c1EVQ1UnstDYDr79wuMfLzzi8byYyfAyl5fQVlzZKLMdI9JaiaU0/+GbuSgWh/oe
	vbwPiluw4bucJxmR9KxZtoByhW1BWKr/iHiU/9rb5OoAILmjGTCLygzLfhbxS5H3
	QT+GgNjxlj64HUOnGSAFiroaXUN/Y5VXIFCFNGwRvWjtb+v6usGltexa7d0KQJYE
	rlJEbA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anwd40bya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 26 Nov 2025 09:40:12 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-bc0de474d4eso16118066a12.0
        for <linux-media@vger.kernel.org>; Wed, 26 Nov 2025 01:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764150012; x=1764754812; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WlNWApUQhbUcSvwN6sQKN6H1USuC4ygtexkKCEVvP4s=;
        b=REGnyrwTn0/2z6P0Ihy3Gyd8k88C/0IoXOsgDlqySbNngBQweiPtGTRn01A6WaEq58
         P/snFW5G8ACqpgJ/Vt0e5XfXlvmBFOtrOf6K85ti9wwzoPxCle2yW6B3H4CRZjfctvbz
         +eApAm6EaLIjyAMmBrYJBCrkFszEhwgdnku5aWv8gte4vn3U5UmD+POoj649Zv+Krgtz
         2LqqxYfCRySQbHsYrtWzI086Pg41ZRrm5ectBqAB9IV6gseUpzSjzcLL78Rk19yyfUTi
         lI8VnJRs57TthrZX/zhkrf6MfIHR6Km+brpQDJ+l70wJulV7dHKoHLe1culW6s3D+mZK
         3+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764150012; x=1764754812;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WlNWApUQhbUcSvwN6sQKN6H1USuC4ygtexkKCEVvP4s=;
        b=O0pO8KBwdQpxWOBGhDnHPc94Ipg5P5BAjb9oBIYDycj5HVztL0F8oX2Slw7+u1kHzI
         GVMgTVlHY216zbm7/VGYubvuUCy8lerTBorFjvokvgL77wbaabwT3eOORHU7FBpiczhk
         umcy0VeivqiYZUOi0kYK76G+G1aXK8OFr9gSlY2K0NMYLHyt2mh1L2ispkxspDSY+gpO
         WxxtY19CpiOzPT+dJAqS1m7HmB9z6TUYAtxFe1ckWEsGiIwjyoPd9EAhFg846Uiws459
         FkqLXzdkAK6giaZloW4ak/F7Z8ciAPUgAVjMT3Ey/5iqJLlLKmuXo7VV/iYjXHDXfQ2o
         omnw==
X-Forwarded-Encrypted: i=1; AJvYcCXBDhKFDdDUZb5cVQ6LXicDZMmRQw3guvwoA2nYom+qwQzYUATjfubYnYLbwP+vtyxFm4Bs7PonCptPzg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1iNn8RokoRwoZR3hVPvdclprClCNRoMVP0P4t+Mfj0rbuPxOG
	HLdJBB1f5T5DnC2+IypMMbEFMWTzImLr6/RFJZJEOvaOWMZ9LB4ByunGE7mn90OGDrAFXsygbay
	wjiPPTpnqP+sMxRGdP0o993j/85ZDuCAm77u09//MqS+QmLhtFsZNhUOggNGcouyoQg==
X-Gm-Gg: ASbGncv8a4vikf6ilDdEikVqdnyNoQgCzBDuA+/hBpFh6kOx3n84sD7bGhmvGM6/o9Z
	4W/f4S6jm1NFkjKl38AVAnuEUdcNfGi9cU0vIFIBcZFcFlm2of7hp8tBsscFSYox5XSwSNhXWSR
	SaVHgnoUnRQ14/dMQqaj9ZPO/C44Ssey483e4ImqNp4N3z+kCV3T8Zo4sCDVPK0N2j9/RPwO3Xz
	TkNsRv2r7KLMSAXpRbfBDMwJUOiYbDDw8aQOt0yHvVC9t45EjSE8novw5npoUQ/P0SvM1e/z1E3
	6M/D0zd+q/F2Q0sgAwJ+gtan2/FwdhAkJLVvBcKZDCvbAXJSKwcH1TZkTmIByLMFjcKsQ7KdFsT
	p9oQaxJaiawxZyJQsIwtnN7cxtG5sBL3BoQ8aWxaSpvFr8BnDMB4yhhICZ8zPqzL9
X-Received: by 2002:a05:7022:4423:b0:119:e56b:c745 with SMTP id a92af1059eb24-11cb3ec27efmr5450593c88.10.1764150011384;
        Wed, 26 Nov 2025 01:40:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEz+n06EkfUzwbICqAyBiLKPTBbzt5l20EQBh0ImcrqGpeuurXakKbTOxAUqwG31wXq80PiBg==
X-Received: by 2002:a05:7022:4423:b0:119:e56b:c745 with SMTP id a92af1059eb24-11cb3ec27efmr5450560c88.10.1764150010798;
        Wed, 26 Nov 2025 01:40:10 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11c93e3e784sm69150307c88.5.2025.11.26.01.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 01:40:10 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 01:38:40 -0800
Subject: [PATCH 7/7] arm64: dts: qcom: sm8750: Add support for camss
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-add-support-for-camss-on-sm8750-v1-7-646fee2eb720@oss.qualcomm.com>
References: <20251126-add-support-for-camss-on-sm8750-v1-0-646fee2eb720@oss.qualcomm.com>
In-Reply-To: <20251126-add-support-for-camss-on-sm8750-v1-0-646fee2eb720@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: mJpfZhT7EUQTZhmZ7yQTLIU6xhtMgIv0
X-Authority-Analysis: v=2.4 cv=feqgCkQF c=1 sm=1 tr=0 ts=6926cafc cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=OOGx0pUHP5hP6dmBc4UA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: mJpfZhT7EUQTZhmZ7yQTLIU6xhtMgIv0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA3OCBTYWx0ZWRfXzKY8L52XrGjg
 +dwsM8Ee6oWM0iGkJgoFmqS+zFmifas+j5dzdLx4R1g4GQPDaxeZr9XW0PHvwP19Dy7afuzAPjB
 Jmam2+8+npMcHXE35pOtyVI7V7EhKhIi+fTKEbcmPGRz5l0DNICdtoRz/qnOUtsQ0wGOp2uPMAX
 BthTMuJoOOF1S9/IyZp+pMj/divGsHgqB2eHJIUJIxzCsuFlmaid7NRvoqre6T6obdnE0gmDIep
 yJJlDlrcABCR/KBBtcBaS7eSNMlJCl90gaEgbH1timkd561dXHpS9yFsND9izrmVlephTfBgsEq
 gAWt3b43v6NPhejbC9OHOoRcgZmifHE0DurtUpTFnTI6CFK90RUgCH/RkE7sLHK6+ZhA90gqZLj
 HzUKhMz7kmla/ngV9bQC9d2Nbsl1Jw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260078

Add support for the camera subsystem on the SM8750 Qualcomm SoC. This
includes bringing up the CSIPHY, CSID, VFE/RDI interfaces. This change
also introduces the necessary modules for enabling future extended
functionalities.

The SM8750 platform provides:
- 3 x VFE, 5 RDI per VFE
- 2 x VFE Lite, 4 RDI per VFE
- 3 x CSID
- 2 x CSID Lite
- 6 x CSI PHY
- 2 x ICP
- 1 x IPE
- 2 x JPEG DMA & Downscaler
- 2 x JPEG Encoder
- 1 x OFE
- 5 x RT CDM
- 3 x TPG

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 599 +++++++++++++++++++++++++++++++++++
 1 file changed, 599 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 1937b48fac5a..b83389c3456b 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3332,6 +3332,605 @@ data-pins {
 					bias-pull-up;
 				};
 			};
+
+			cci0_0_default: cci0-0-default-state {
+				sda-pins {
+					pins = "gpio113";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				scl-pins {
+					pins = "gpio114";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci0_0_sleep: cci0-0-sleep-state {
+				sda-pins {
+					pins = "gpio113";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio114";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci0_1_default: cci0-1-default-state {
+				sda-pins {
+					pins = "gpio115";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				scl-pins {
+					pins = "gpio116";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci0_1_sleep: cci0-1-sleep-state {
+				sda-pins {
+					pins = "gpio115";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio116";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci1_0_default: cci1-0-default-state {
+				sda-pins {
+					pins = "gpio117";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				scl-pins {
+					pins = "gpio118";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci1_0_sleep: cci1-0-sleep-state {
+				sda-pins {
+					pins = "gpio117";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio118";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci1_1_default: cci1-1-default-state {
+				sda-pins {
+					pins = "gpio111";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				scl-pins {
+					pins = "gpio164";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci1_1_sleep: cci1-1-sleep-state {
+				sda-pins {
+					pins = "gpio111";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio164";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci2_0_default: cci2-0-default-state {
+				sda-pins {
+					pins = "gpio112";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				scl-pins {
+					pins = "gpio153";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci2_0_sleep: cci2-0-sleep-state {
+				sda-pins {
+					pins = "gpio112";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio153";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci2_1_default: cci2-1-default-state {
+				sda-pins {
+					pins = "gpio119";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				scl-pins {
+					pins = "gpio120";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci2_1_sleep: cci2-1-sleep-state {
+				sda-pins {
+					pins = "gpio119";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio120";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+		};
+
+		cci0: cci@ac7b000 {
+			compatible = "qcom,sm8750-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0ac7b000 0x0 0x1000>;
+			interrupts = <GIC_SPI 426 IRQ_TYPE_EDGE_RISING>;
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_0_CLK>;
+			clock-names = "ahb", "cci";
+			pinctrl-0 = <&cci0_0_default &cci0_1_default>;
+			pinctrl-1 = <&cci0_0_sleep &cci0_1_sleep>;
+			pinctrl-names = "default", "sleep";
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cci0_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci0_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci1: cci@ac7c000 {
+			compatible = "qcom,sm8750-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0ac7c000 0x0 0x1000>;
+			interrupts = <GIC_SPI 427 IRQ_TYPE_EDGE_RISING>;
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_1_CLK>;
+			clock-names = "ahb", "cci";
+			pinctrl-0 = <&cci1_0_default &cci1_1_default>;
+			pinctrl-1 = <&cci1_0_sleep &cci1_1_sleep>;
+			pinctrl-names = "default", "sleep";
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cci1_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci1_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci2: cci@ac7d000 {
+			compatible = "qcom,sm8750-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0ac7d000 0x0 0x1000>;
+			interrupts = <GIC_SPI 428 IRQ_TYPE_EDGE_RISING>;
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_2_CLK>;
+			clock-names = "ahb", "cci";
+			pinctrl-0 = <&cci2_0_default &cci2_1_default>;
+			pinctrl-1 = <&cci2_0_sleep &cci2_1_sleep>;
+			pinctrl-names = "default", "sleep";
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cci2_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci2_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		camss: isp@ad27000 {
+			compatible = "qcom,sm8750-camss";
+
+			reg = <0x0 0x0ad27000 0x0 0x2b00>,
+			      <0x0 0x0ad2a000 0x0 0x2b00>,
+			      <0x0 0x0ad2d000 0x0 0x2b00>,
+			      <0x0 0x0ad6d000 0x0 0xa00>,
+			      <0x0 0x0ad72000 0x0 0xa00>,
+			      <0x0 0x0ada9000 0x0 0x2000>,
+			      <0x0 0x0adab000 0x0 0x2000>,
+			      <0x0 0x0adad000 0x0 0x2000>,
+			      <0x0 0x0adaf000 0x0 0x2000>,
+			      <0x0 0x0adb1000 0x0 0x2000>,
+			      <0x0 0x0adb3000 0x0 0x2000>,
+			      <0x0 0x0ac86000 0x0 0x10000>,
+			      <0x0 0x0ac96000 0x0 0x10000>,
+			      <0x0 0x0aca6000 0x0 0x10000>,
+			      <0x0 0x0ad6e000 0x0 0x1800>,
+			      <0x0 0x0ad73000 0x0 0x1800>,
+			      <0x0 0x0ac06000 0x0 0x1000>,
+			      <0x0 0x0ac05000 0x0 0x1000>,
+			      <0x0 0x0ac16000 0x0 0x1000>,
+			      <0x0 0x0ac15000 0x0 0x1000>,
+			      <0x0 0x0ac42000 0x0 0x18000>,
+			      <0x0 0x0ac26000 0x0 0x1000>,
+			      <0x0 0x0ac25000 0x0 0x1000>,
+			      <0x0 0x0ac28000 0x0 0x1000>,
+			      <0x0 0x0ac27000 0x0 0x1000>,
+			      <0x0 0x0ac2a000 0x0 0x18000>,
+			      <0x0 0x0ac7f000 0x0 0x580>,
+			      <0x0 0x0ac80000 0x0 0x580>,
+			      <0x0 0x0ac81000 0x0 0x580>,
+			      <0x0 0x0ac82000 0x0 0x580>,
+			      <0x0 0x0ac83000 0x0 0x580>,
+			      <0x0 0x0ad8b000 0x0 0x400>,
+			      <0x0 0x0ad8c000 0x0 0x400>,
+			      <0x0 0x0ad8d000 0x0 0x400>;
+			reg-names = "csid0",
+				    "csid1",
+				    "csid2",
+				    "csid_lite0",
+				    "csid_lite1",
+				    "csiphy0",
+				    "csiphy1",
+				    "csiphy2",
+				    "csiphy3",
+				    "csiphy4",
+				    "csiphy5",
+				    "vfe0",
+				    "vfe1",
+				    "vfe2",
+				    "vfe_lite0",
+				    "vfe_lite1",
+				    "icp0",
+				    "icp0_sys",
+				    "icp1",
+				    "icp1_sys",
+				    "ipe",
+				    "jpeg_dma0",
+				    "jpeg_enc0",
+				    "jpeg_dma1",
+				    "jpeg_enc1",
+				    "ofe",
+				    "rt_cdm0",
+				    "rt_cdm1",
+				    "rt_cdm2",
+				    "rt_cdm3",
+				    "rt_cdm4",
+				    "tpg0",
+				    "tpg1",
+				    "tpg2";
+
+			clocks = <&camcc CAM_CC_CAMNOC_NRT_AXI_CLK>,
+				 <&camcc CAM_CC_CAMNOC_RT_AXI_CLK>,
+				 <&camcc CAM_CC_CAMNOC_RT_TFE_0_MAIN_CLK>,
+				 <&camcc CAM_CC_CAMNOC_RT_TFE_1_MAIN_CLK>,
+				 <&camcc CAM_CC_CAMNOC_RT_TFE_2_MAIN_CLK>,
+				 <&camcc CAM_CC_CAMNOC_RT_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+				 <&camcc CAM_CC_CAM_TOP_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_CSID_CLK>,
+				 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
+				 <&camcc CAM_CC_CSIPHY0_CLK>,
+				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY1_CLK>,
+				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY2_CLK>,
+				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY3_CLK>,
+				 <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY4_CLK>,
+				 <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY5_CLK>,
+				 <&camcc CAM_CC_CSI5PHYTIMER_CLK>,
+				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
+				 <&camcc CAM_CC_TFE_0_MAIN_CLK>,
+				 <&camcc CAM_CC_TFE_0_MAIN_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_TFE_1_MAIN_CLK>,
+				 <&camcc CAM_CC_TFE_1_MAIN_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_TFE_2_MAIN_CLK>,
+				 <&camcc CAM_CC_TFE_2_MAIN_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
+				 <&camcc CAM_CC_QDSS_DEBUG_XO_CLK>,
+				 <&camcc CAM_CC_CAMNOC_NRT_IPE_NPS_CLK>,
+				 <&camcc CAM_CC_CAMNOC_NRT_OFE_MAIN_CLK>,
+				 <&gcc GCC_CAMERA_SF_AXI_CLK>,
+				 <&camcc CAM_CC_ICP_0_CLK>,
+				 <&camcc CAM_CC_ICP_0_AHB_CLK>,
+				 <&camcc CAM_CC_ICP_1_CLK>,
+				 <&camcc CAM_CC_ICP_1_AHB_CLK>,
+				 <&camcc CAM_CC_IPE_NPS_CLK>,
+				 <&camcc CAM_CC_IPE_NPS_AHB_CLK>,
+				 <&camcc CAM_CC_IPE_NPS_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_IPE_PPS_CLK>,
+				 <&camcc CAM_CC_IPE_PPS_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_JPEG_0_CLK>,
+				 <&camcc CAM_CC_JPEG_1_CLK>,
+				 <&camcc CAM_CC_OFE_AHB_CLK>,
+				 <&camcc CAM_CC_OFE_ANCHOR_CLK>,
+				 <&camcc CAM_CC_OFE_ANCHOR_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_OFE_HDR_CLK>,
+				 <&camcc CAM_CC_OFE_HDR_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_OFE_MAIN_CLK>,
+				 <&camcc CAM_CC_OFE_MAIN_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_TFE_0_BAYER_CLK>,
+				 <&camcc CAM_CC_TFE_0_BAYER_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_TFE_1_BAYER_CLK>,
+				 <&camcc CAM_CC_TFE_1_BAYER_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_TFE_2_BAYER_CLK>,
+				 <&camcc CAM_CC_TFE_2_BAYER_FAST_AHB_CLK>;
+			clock-names = "camnoc_nrt_axi",
+				      "camnoc_rt_axi",
+				      "camnoc_rt_vfe0",
+				      "camnoc_rt_vfe1",
+				      "camnoc_rt_vfe2",
+				      "camnoc_rt_vfe_lite",
+				      "cam_top_ahb",
+				      "cam_top_fast_ahb",
+				      "csid",
+				      "csid_csiphy_rx",
+				      "csiphy0",
+				      "csiphy0_timer",
+				      "csiphy1",
+				      "csiphy1_timer",
+				      "csiphy2",
+				      "csiphy2_timer",
+				      "csiphy3",
+				      "csiphy3_timer",
+				      "csiphy4",
+				      "csiphy4_timer",
+				      "csiphy5",
+				      "csiphy5_timer",
+				      "gcc_hf_axi",
+				      "vfe0",
+				      "vfe0_fast_ahb",
+				      "vfe1",
+				      "vfe1_fast_ahb",
+				      "vfe2",
+				      "vfe2_fast_ahb",
+				      "vfe_lite",
+				      "vfe_lite_ahb",
+				      "vfe_lite_cphy_rx",
+				      "vfe_lite_csid",
+				      "qdss_debug_xo",
+				      "camnoc_ipe_nps",
+				      "camnoc_ofe",
+				      "gcc_sf_axi",
+				      "icp0",
+				      "icp0_ahb",
+				      "icp1",
+				      "icp1_ahb",
+				      "ipe_nps",
+				      "ipe_nps_ahb",
+				      "ipe_nps_fast_ahb",
+				      "ipe_pps",
+				      "ipe_pps_fast_ahb",
+				      "jpeg0",
+				      "jpeg1",
+				      "ofe_ahb",
+				      "ofe_anchor",
+				      "ofe_anchor_fast_ahb",
+				      "ofe_hdr",
+				      "ofe_hdr_fast_ahb",
+				      "ofe_main",
+				      "ofe_main_fast_ahb",
+				      "vfe0_bayer",
+				      "vfe0_bayer_fast_ahb",
+				      "vfe1_bayer",
+				      "vfe1_bayer_fast_ahb",
+				      "vfe2_bayer",
+				      "vfe2_bayer_fast_ahb";
+
+			interrupts = <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 605 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 376 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 89 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 433 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 436 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 457 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 606 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 377 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 271 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 277 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 463 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 657 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 372 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 475 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 276 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 287 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 456 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 664 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 702 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 348 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 349 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 413 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 416 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 417 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csid2",
+					  "csid_lite0",
+					  "csid_lite1",
+					  "csiphy0",
+					  "csiphy1",
+					  "csiphy2",
+					  "csiphy3",
+					  "csiphy4",
+					  "csiphy5",
+					  "vfe0",
+					  "vfe1",
+					  "vfe2",
+					  "vfe_lite0",
+					  "vfe_lite1",
+					  "camnoc_nrt",
+					  "camnoc_rt",
+					  "icp0",
+					  "icp1",
+					  "jpeg_dma0",
+					  "jpeg_enc0",
+					  "jpeg_dma1",
+					  "jpeg_enc1",
+					  "rt_cdm0",
+					  "rt_cdm1",
+					  "rt_cdm2",
+					  "rt_cdm3",
+					  "rt_cdm4",
+					  "tpg0",
+					  "tpg1",
+					  "tpg2";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&mmss_noc MASTER_CAMNOC_NRT_ICP_SF QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "ahb",
+					     "hf_mnoc",
+					     "sf_icp_mnoc",
+					     "sf_mnoc";
+
+			iommus = <&apps_smmu 0x1c00 0x00>,
+				 <&apps_smmu 0x18c0 0x00>,
+				 <&apps_smmu 0x1980 0x00>,
+				 <&apps_smmu 0x1840 0x00>,
+				 <&apps_smmu 0x1800 0x00>,
+				 <&apps_smmu 0x18a0 0x00>,
+				 <&apps_smmu 0x1880 0x00>,
+				 <&apps_smmu 0x1820 0x00>,
+				 <&apps_smmu 0x1860 0x00>;
+
+			power-domains = <&camcc CAM_CC_TFE_0_GDSC>,
+					<&camcc CAM_CC_TFE_1_GDSC>,
+					<&camcc CAM_CC_TFE_2_GDSC>,
+					<&camcc CAM_CC_TITAN_TOP_GDSC>,
+					<&camcc CAM_CC_IPE_0_GDSC>,
+					<&camcc CAM_CC_OFE_GDSC>;
+			power-domain-names = "vfe0",
+					     "vfe1",
+					     "vfe2",
+					     "top",
+					     "ipe",
+					     "ofe";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+
+				port@2 {
+					reg = <2>;
+				};
+			};
+
 		};
 
 		tcsrcc: clock-controller@f204008 {

-- 
2.34.1


