Return-Path: <linux-media+bounces-51485-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKf/GawZdmnXLgEAu9opvQ
	(envelope-from <linux-media+bounces-51485-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 14:25:00 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B6080B12
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 14:24:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 93A6E304C95C
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 13:20:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A764531DDBB;
	Sun, 25 Jan 2026 13:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hYbWmB1V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e7rDHSIb"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64AA031C567
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 13:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769347240; cv=none; b=h5CkrLA7tP393JDz2Pph5hoFiFvO4Tmm8dFROW9OcPKjHByAoyq75aSi0Aj4sg/IpaHQlG94Prfc4qZFEvaGhZsBaGctApQqnFKeAlJlPU1cDvLQc7bak+Gxiuw8FKJaC4X4jwl3KFGtTlPXXwxIDbwAnTCaHtSKr6pKvdi5w5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769347240; c=relaxed/simple;
	bh=tlqsbZH3GVSIvVRdmUychoa8E6W2HNGx8SV90Y2uqks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jhm1olGTgOr2TGKGmoWEx6nKFmii14TU8CXuuxl1kkl7QTFsUvHfbTGF41w+A2wCoprOKSWLtaERwjYe1+eYsteS8fYx6dEL1XXB6TVFMBcWDdKsfFkbq2/h/HtG5NMlO7X9CYnEM3vsDXvBNlo8cVBBS82HwFGeG6B1HIK+4LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hYbWmB1V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e7rDHSIb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60PCg0PH3130053
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 13:20:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/P7AMnIG7+WRju9MQzPkvgMl+bPhQN9IN8sOlv+VN1Q=; b=hYbWmB1Vf+fJwlpV
	1Z4GBSuEyuRiitMWYXUQIfb8E8jINq/uYl/gYZx4pBkQpeV++PnWA38LQvNqWEbu
	VSoqtEAm6CVFr1572fHF4vgQjpyQTORM+BZXwRwydNctOqZa4l8+6dk7JbeBB1QE
	WhjfEJDohVLurCsrefIJh+Ze4eKuQ8FiuOcUhnNCpnt1fwZqEB4ga3jXDKoxJw3E
	qm5ZBNEn87+h19HJEZt3fWAdPrAxCx66huBJDZt34rbLwTV/TuOaO9MS6KjZWcHt
	YZklm1rX7gxOHSgt6ogb4dQQuV/6fdT9yrbxkbvYPuapYe9T7nkR3odFk55GGQpu
	s1CPSg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq6xt52q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 13:20:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c52bb3ac7bso836949885a.0
        for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 05:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769347230; x=1769952030; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/P7AMnIG7+WRju9MQzPkvgMl+bPhQN9IN8sOlv+VN1Q=;
        b=e7rDHSIb4+122yjvSBgQt/K+nZPOZ6tSduCJIJP2cOU11PG42joVEmgeKKEeff8HmQ
         C1c/qHaJ0gDOTXuCGij24svFy1LNzBcvS5pEPkyh7urNdfYGfKq2V7y82L4FtFbAumLP
         hi50wX5j5jPSrjRESBhVWloGvg+wR4dxciIajJK63qlmgqVbw8yAIRH3uZ7QBCWit/wj
         DiyDioInoFCKzomlTQ3qNiAxa/AUEuX/lEwQilQeELMqnFEls5j5tfYKm2Cb5HyODHTP
         YQYJAFX+LRdfX/Nlq+6MtCt4fF9ITZs1I4pOnA88M4NHRLSox2RZ1WC8Q6TsU0YEqlDk
         4cvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769347230; x=1769952030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/P7AMnIG7+WRju9MQzPkvgMl+bPhQN9IN8sOlv+VN1Q=;
        b=CDjuswOmC6bhqvQbaiWqd2ggFPLTyaahjCTwRzgH/12BeYIbAqPfNaojZf5emTjjs7
         5Bk3E/Lr4f2WbHThhNCpSNgrQiycsxzWfEWpb3Od3NcKp7tpk9ayteMTjyl8qhzbBnWC
         fxvFsXO19k8dtlBZyZEFa2GC1lRvBOcBNW09NOojC3zOxaWdgoSkAMVLGmdF8PVet9Lw
         eeGOBAGlphwxy3ZHwH6Q4QoJbroqrzH5dDiS0kWD5eakv8OC+xQ1SUVsUdg9v3icVTbA
         sOCclB2VG5I+6bC/uWgFA3/sAu4YBvqX2pBIQ159eLpsRS7MMZ5e9f24nLeAsvaQBM73
         48lQ==
X-Gm-Message-State: AOJu0YyvVvcK9evhZQPZsYi+vZoUWjY8pH6XfgHAKMa4dH93J25eul2Z
	7Llg2n+eMjgESrWaFkHutinW5+H0SOLvDFWukj/33OPmb1jJDXtuuvnHujKKBlOrecd2i6/egp4
	AWwj+oIO90Nj++sjeDy0PcFmpznjfxkS+gWjkZF6YDVUoczl72OIZ+0DRIFIZn2iEIQ==
X-Gm-Gg: AZuq6aIfBvcdl63fJbT6h4aVt816UTAknW64Dy2drexksW9kYIjGq+5FY1CACX2GoCC
	LSf/nzu/oyBjeVfQBtHwmC9tRYp3ktREamFmCbMtM+4vd/KsuqLwoVjQypxHnYKvc4B3qa5dJ60
	DkkxgcK0/gE660lkM7EZghDl4QFQZps8T+ueKtWmfUDxjpZy2s4f4HbIaZssBQL05q2qTCjWDk7
	fOS0OLIDvRibwzAMSRivmj+frPBf2Eoh5T2X1ogRPR7LZGi6tvKgyTpotFtGn5GyKrQSSez2eex
	ZnM9Gzimv6CqETDrrC+hg8kNi/lVQf9unK/nQz1u1lMFKQbk9knS9rXd2PslReBkZmTAyvUfv4B
	2EXIdfbG824/g5Q2MHR0/MFavbYDRANmUB+2ZUg4O7AWhVChTkZpW6Lg+LdbOuZg2LMYDI/5eFy
	PKErv6b0B2pY1CKOp4gKUIHW4=
X-Received: by 2002:a05:620a:d84:b0:8c6:e0c5:7bbc with SMTP id af79cd13be357-8c6f96dd4damr157813285a.76.1769347229836;
        Sun, 25 Jan 2026 05:20:29 -0800 (PST)
X-Received: by 2002:a05:620a:d84:b0:8c6:e0c5:7bbc with SMTP id af79cd13be357-8c6f96dd4damr157809885a.76.1769347229345;
        Sun, 25 Jan 2026 05:20:29 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385da1706b5sm18901821fa.24.2026.01.25.05.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 05:20:28 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 25 Jan 2026 15:20:21 +0200
Subject: [PATCH 4/7] arm64: dts: qcom: sc8280xp: Add Venus
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260125-iris-sc8280xp-v1-4-2c5e69fae76b@oss.qualcomm.com>
References: <20260125-iris-sc8280xp-v1-0-2c5e69fae76b@oss.qualcomm.com>
In-Reply-To: <20260125-iris-sc8280xp-v1-0-2c5e69fae76b@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpdhiTbqK3zZOm59nzvvfYfQ2aUOlS8ZQF1KMwS
 SH87kQ/vkOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXYYkwAKCRCLPIo+Aiko
 1XRECACFn09G+XRS6NZqWLdJ0GaK9+9q3zw69zFCQ8cmfAE7tlc3nLF5YD4LBKykFGur2+eHe2g
 UH6dVldoaQeEs01CWAT8JOdAbchn6Tcegi/4s486deKGIm6q3hpLDVXnsrTtzyzRXZON/L99TF4
 joO0aAk9JfMK/yCHI/lF5PbfqtSUpzWG4REUlCkd57qVl+xy1Y88rM+5t8ColAK5uzsIL3uv74X
 OLQNuJ6tV/3+9vAXcIDppEp/k30Z4wgtG3mpaKyrAAHsTfW1cpJ4D3h5TIw9B2PEUOPw4A1WV9S
 j/1AtvT3ZwfD+eGodyvVBbUxxdBU1A2rSr6bpng2JE8G0QCN
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: r-eEdxAqSDlNXGqHWNJJKsn1UmsK3rZy
X-Proofpoint-ORIG-GUID: r-eEdxAqSDlNXGqHWNJJKsn1UmsK3rZy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI1MDExMSBTYWx0ZWRfXyE4oedB321qU
 36exZFAO2GrvcgyxBrMKmiWap4Kv5I5Wm6DE6MR6JgR+XU0akcgIJbn4x8qs0Du4Ux0l6J0CmWY
 m+P5i6//b4p3jZOVwzLpCYoDNIANR89uAS7qC3MM8iCwBH/wlrB/YVUzv4cFBsHToj0kaJTWzgB
 J/aJX0jRGec446/ztGu1olEpxl9TZBw3HiapqYJtsSaNgvZpF/zF53Vs2faAX3lT0uxz+1fWZQv
 sEnEAaCr4K0sO0kAb2HnTMcizUgAKGhdyTKqi9QuArU/nGiUqE9wLAoqNuSOQq+JeTo3UV0zhq8
 In2sEVsyV5XUCn7y90dZ7seqNlDU6GnLgIwIh6h5hMZSOgukaX4lvp4SDcoeWptK9eEcJ4JhOhY
 UHvgO07Og89pU6ws7YpBTvnM0vR/mmVOOeEoxLnQtKhbHyQ3w4XqROVHBJIKSz+TnBc3GIgtWM4
 GIBLJJ/oJqkoQMQclUQ==
X-Authority-Analysis: v=2.4 cv=Htd72kTS c=1 sm=1 tr=0 ts=6976189e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=GiR9guPQU3y8euSElqAA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601250111
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
	TAGGED_FROM(0.00)[bounces-51485-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ac4a000:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,abf0000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email,aa00000:email,5.42.239.224:email,86c00000:email,85b00000:email];
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
X-Rspamd-Queue-Id: C2B6080B12
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


