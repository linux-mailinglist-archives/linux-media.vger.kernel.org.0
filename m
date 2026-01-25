Return-Path: <linux-media+bounces-51506-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0B+PJk44dmmTNgEAu9opvQ
	(envelope-from <linux-media+bounces-51506-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 16:35:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 082A381429
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 16:35:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 625C8303CC39
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 15:33:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99583325734;
	Sun, 25 Jan 2026 15:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EWOujBcx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cx6AYnBO"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43AA3326923
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 15:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769355193; cv=none; b=iRSZOXGRcvXGtxDt/C3zCrTiU8/t8p7LLJu8CEaeYqR6VJeXP0RqzVkc+bEsskR81VrnDOjjJ/+RM9oy9lUue/xkx9dAqpk/W/HGgh3mRPOm138B5c4nBtzQfD387NVKNIJFpupxeBW8oMIeRG2Iupm3TEdGjQPangTbn7Sxz3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769355193; c=relaxed/simple;
	bh=tlqsbZH3GVSIvVRdmUychoa8E6W2HNGx8SV90Y2uqks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C4HDjFh111ziZIcZXo8PnKV7kDsJJF7ccmibb/Gl7j9gc2cNI/9yIMucUGogvskU4ceOmLQhOxRxGpOV5mZE1aCEQyLrhj7KVUpImltVY84Nkry02s6rXxAhmsO6wSSjH0kI9DNIs50a3wC1NNX3ZM0uwBvpo/6k+VQ5CaUfMKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EWOujBcx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cx6AYnBO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60P7p9u32992167
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 15:33:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/P7AMnIG7+WRju9MQzPkvgMl+bPhQN9IN8sOlv+VN1Q=; b=EWOujBcxxxUM/l2G
	80C8krhJ0c8IH4gGcKz83vnLnuIelQJiBvfbM4my+JqYRelTiDw3tOe9IueObE+9
	SmJ1Ob6sxjv3d7Mt4Sejz39AOeYQf3mvxjEoQRQaZc6UrxrWZy1+tU2NRDqG+OnE
	5BsGhVzfS1km5zxkcvSVpMK+wBFI0ydhE80Ee3ERNHcpvv69Ad/L8WC6ZmfOdNqY
	iqNvl6L0Hs9sodZky+9BdTRxfRh0r0Ot3ziEIOWViSolp8ojEhyA8R5VmdDDuSYM
	G+LxCPzuRBj0/s7qPdhfgP3ANUCyrxIK8a6FKjr6s9MPYBpJtFvgnBOtZEvLEcgo
	RubLoA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq9tt9qm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 15:33:10 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c1cffa1f2dso1283949985a.1
        for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 07:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769355190; x=1769959990; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/P7AMnIG7+WRju9MQzPkvgMl+bPhQN9IN8sOlv+VN1Q=;
        b=cx6AYnBO5Mtr0tgFxwvI76VXWd7dC8JIo8xRsUvtzS21LR5IlHTeFs2EXXQufVxNWy
         RQcGDz7FaS1LFl91KAnW/bcr9QVTthSeJmucJ8YtezPreJEHWkRFydM7BflnWBEep80h
         EmOANz5hNBP+POaFVEMXBGBUXH3bNJK7cXws4pBCbCXbAxWNT0A2o2BcX4LRa//yRH9y
         DjNvnJ+1H2BYehLyV48qKcwUrhE0cBUsewMYUgXyXYW1PL8AG5JJJaThg9GZef76D6jo
         P2T3UnwYIh92qxM2lDbdiE7gl75j14iQT5U2n5igi+HfbUY2/0idCpC5yU02pywXoSvS
         e69A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769355190; x=1769959990;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/P7AMnIG7+WRju9MQzPkvgMl+bPhQN9IN8sOlv+VN1Q=;
        b=dwWWxVyLvBHhxyUZFszSxiRCYx2pNpfWc+XBjxGCVR2gnvTEbZPOJ03uGeF6TsMhhB
         e2o+ds7fZqeQb12U6Lux+zelNSUGS3feVLv4qhO34AHNXu192spXWeY73XWD24C0Q7aL
         44RD5P+6UAnb5p072U95fvlqvKUQh5daab7uKtm0ySGp8Habz9In85GN99cAxRUn1zW1
         z/OxJ6B9nFk7RwFZspSIO6ICUxleyhlRmh5SX0g1MwHH1ndpua3+4/pic6Xv+CM8R1N3
         +Mjh9sMXbnkf/119gXWrWUNmqYIhNU0yVJFMauOZH8W5PT2Qph+XgB1RgiANBbGpqDLY
         5qYg==
X-Gm-Message-State: AOJu0Yzxspr2dr/aks0fSmCNKDDL9dnoESjQ9koiJoBgm9KMWPh6VQEH
	2J+Mo5wequIJEgamgJIAHcN5cn7A3mhPrrtJncLWQTQsHzBOqXfW0qaOwbBVn4jtBaIr2Xf18ai
	hGN+aiLmRDbviC8S03W0/VnVgUc751+8IUz21xyV/Msjx2GTFp/GAwENvSXstWe++Pw==
X-Gm-Gg: AZuq6aJkWNz9ICR9bsHcMGcS8PTW6nDmbBZfd1dUKfRfQ2UNYoWCcbpmOwdqhu0cXRn
	P5apKOwXE1OyrukngdCZKgo3oNSbs9sDRC8KPkL9JmXX08xRDB+hvDFzV8csAQgDNTNGwtRmC4s
	kEN/PC3nLs76LqKN/f3XXqKEoKo2n6jKMsGJuDFpoNm4ZbXy/m3k/47XCjXas55GMnAMQAeWXXh
	Z/cOTEmTCTl3DoL1hAa/SSaJoJ65CbYcW3MwZ5olEYcdyhO7jg97GzMRd2eD8teTARyj6kFUFl2
	o2Wm8fqqODxZj5OSxJduOwPd2UW+hYS8vT2bw8LhGKjR1RoO/XkkMxshuqtXxXfSR0cVMRLm1X0
	1WYKLSizTRNDhTW8kMmYZG52XVI3f8SE26ZMwGP5yFxK0LorBdF+UiFYxzHkUQUdlOuYKcIXQbd
	0RjsVXNbzHtMjoSy4IApy/UtM=
X-Received: by 2002:a05:620a:4110:b0:8b2:ea3f:2fa4 with SMTP id af79cd13be357-8c6f97be394mr176145185a.6.1769355190109;
        Sun, 25 Jan 2026 07:33:10 -0800 (PST)
X-Received: by 2002:a05:620a:4110:b0:8b2:ea3f:2fa4 with SMTP id af79cd13be357-8c6f97be394mr176141985a.6.1769355189656;
        Sun, 25 Jan 2026 07:33:09 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385da1a0a45sm19154661fa.34.2026.01.25.07.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 07:33:09 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 25 Jan 2026 17:33:01 +0200
Subject: [PATCH v3 4/7] arm64: dts: qcom: sc8280xp: Add Venus
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260125-iris-sc8280xp-v3-4-d21861a9ea33@oss.qualcomm.com>
References: <20260125-iris-sc8280xp-v3-0-d21861a9ea33@oss.qualcomm.com>
In-Reply-To: <20260125-iris-sc8280xp-v3-0-d21861a9ea33@oss.qualcomm.com>
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
        David Heidelberg <david@ixit.cz>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4083;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=uwzGdj/l2lleZsXaaz7tMKvHRtkCMWu9yBtOm4qdOx0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpdjesewkgeBJNKqzgR6TqjFPWmlFPkmDy3FLiz
 gSLKtKkeluJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXY3rAAKCRCLPIo+Aiko
 1aT/B/0RBcRodfj+texszWUs7wdimS7QMLazpxfKguIK0LbGijYgs/MjzY7mIwyvEx5o63oP8fK
 HG74r1TDkfjvQUliOLpV7vIwUoRdtU+xxlyQelRtXZTZixNSQd5jS0LR39b2RpZGpIxH0I+8qkn
 9Nmw+1sMCSQGh8fAeJzEVd2Ps3sRNiCVazG/FznlOeVTMxI1ylxt5kEJ3FFPpjwjrw7SrO8Npe1
 TRHhY9P+rQaJuTHJIJQBnywrp5H9uAOoDVhACVCrTWYefGwP+SUHmInM+jdWN8l57NCcQ3GEQyP
 DhdFDYetABGzohIU+wA+afdSLM4w4MM8FU9eM+QGkeH4g6SJ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI1MDEzMCBTYWx0ZWRfX/py/uVXW/4kK
 96Qv02vvhMgjm4nQAd1QDjsAFk4P2vpytWsbjF4E/AYim04TCIYLno3dMNVjDkfa586izezaYIZ
 TbcAlu2J5W4SuTCwnlP6b+aBY9DBmZPA7FSorFioXF98ugmnAsUd7dYbPwGSgESoV6WTneEmfjM
 uJHzljlsxFhjq1lHdIwlZFNG0P7AjWFPlnxFnY8cAlBAcQr8RGcXNQ2xgCC9ryHO29gKhHozT4N
 uwl1NAzawPU2AK0dwmzmEJetrusrtKH0wH7XaeAUQRpL+Nha+ZNA3GahDKWVMtpxYXaRtJaxjIV
 raf1zzZ5MKOZJDccPf9/1vAsgu+pX7o86twoPYRQNQ8UubU+RUMNfJjyEzpfYLY8sc/TJ1xBVr3
 JDNImkf7ClPNxntsveah+6HgMrjimP23UAmEOBBV6MhQxNmdAlL6rG0P5BNk1GY0x5Pxv5GOCrH
 YNyVneEiAlaQH5EMWDw==
X-Authority-Analysis: v=2.4 cv=QN5lhwLL c=1 sm=1 tr=0 ts=697637b6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=GiR9guPQU3y8euSElqAA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: AcbNHXcLwnFysLxayyV2ODIuVXKtOEdC
X-Proofpoint-ORIG-GUID: AcbNHXcLwnFysLxayyV2ODIuVXKtOEdC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601250130
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
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51506-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aa00000:email,86c00000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,abf0000:email,5.42.239.224:email,linaro.org:email,85b00000:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 082A381429
X-Rspamd-Action: no action

From: Konrad Dybcio <konradybcio@kernel.org>

Add the required nodes to enable Venus on sc8280xp.

[ bod: added interconnect tags ]

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
[ johan: use sm8350 videocc defines ]
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
[ bod: dropped video encoder/decoder declarations ]
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
[ db: dropped llcc icc, switched to sc8280xp compat, added more freqs ]
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 89 ++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 41c57e7dc433..66a65ae50f00 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -10,7 +10,9 @@
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sc8280xp-camcc.h>
 #include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
+#include <dt-bindings/clock/qcom,sm8350-videocc.h>
 #include <dt-bindings/dma/qcom-gpi.h>
+#include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interconnect/qcom,sc8280xp.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -691,6 +693,11 @@ reserved-region@85b00000 {
 			no-map;
 		};
 
+		pil_video_mem: pil_video_region@86700000 {
+			reg = <0 0x86700000 0 0x500000>;
+			no-map;
+		};
+
 		pil_adsp_mem: adsp-region@86c00000 {
 			reg = <0 0x86c00000 0 0x2000000>;
 			no-map;
@@ -4181,6 +4188,88 @@ usb_1_dwc3_ss: endpoint {
 			};
 		};
 
+		venus: video-codec@aa00000 {
+			compatible = "qcom,sc8280xp-venus";
+			reg = <0 0x0aa00000 0 0x100000>;
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0_CLK>;
+			clock-names = "iface",
+				      "core",
+				      "vcodec0_core";
+			power-domains = <&videocc MVS0C_GDSC>,
+					<&videocc MVS0_GDSC>,
+					<&rpmhpd SC8280XP_MX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mx";
+
+			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
+			reset-names = "core";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_VIDEO_P0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-cfg",
+					     "video-mem";
+
+			operating-points-v2 = <&venus_opp_table>;
+			iommus = <&apps_smmu 0x2e00 0x400>;
+			memory-region = <&pil_video_mem>;
+
+			status = "disabled";
+
+			venus_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-720000000 {
+					opp-hz = /bits/ 64 <720000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-1014000000 {
+					opp-hz = /bits/ 64 <1014000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+				};
+
+				opp-1098000000 {
+					opp-hz = /bits/ 64 <1098000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-1332000000 {
+					opp-hz = /bits/ 64 <1332000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+
+				opp-1599000000 {
+					opp-hz = /bits/ 64 <1599000000>;
+					required-opps = <&rpmhpd_opp_turbo>;
+				};
+
+				opp-1680000000 {
+					opp-hz = /bits/ 64 <1680000000>;
+					required-opps = <&rpmhpd_opp_turbo_l1>;
+				};
+			};
+		};
+
+		videocc: clock-controller@abf0000 {
+			compatible = "qcom,sc8280xp-videocc";
+			reg = <0 0x0abf0000 0 0x10000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>;
+			power-domains = <&rpmhpd SC8280XP_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		cci0: cci@ac4a000 {
 			compatible = "qcom,sc8280xp-cci", "qcom,msm8996-cci";
 			reg = <0 0x0ac4a000 0 0x1000>;

-- 
2.47.3


