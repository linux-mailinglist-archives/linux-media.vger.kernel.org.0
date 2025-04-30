Return-Path: <linux-media+bounces-31482-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A862AA5604
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 22:47:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 86AD81BA54A9
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 20:47:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A7F02C1E22;
	Wed, 30 Apr 2025 20:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EpVSx6R3"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1230C221738;
	Wed, 30 Apr 2025 20:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746046036; cv=none; b=NsuIOvOPIU0gDcTd0tEDsGBQJ6iVD47T2bcw+im/aQtY2RXBQ4i3M6qmiQZis+vX4yOYPEVRycX3KTSs8ta+sPGZ+/7YDoMlbymrz6WC65yOJu2ND1u856Xc38eN4BSOFaU70KeBrzaoOQNC1UVeA0NiObtgcucLjwTsBnDZzLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746046036; c=relaxed/simple;
	bh=mTMLc/grEsMk9tdWZaAjExvtqZMAqAYePZboVGY5WvU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=LYX3WYvE7AzS8oy60yc/sXFFrgqaB2paoq9cpx3bjEUQ//OEpkVNd+VgqNixGSvyVf0JnOoyFLwIj+QuqArD6OxcBI9O63Cogfw3mFCPeLTBLkYOV1J7zxOduuT68qszwlvAyl4L3qwiDKyfts+8lwx2Cs/Nj64VsfoglmCT1j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EpVSx6R3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53UGhUKK004203;
	Wed, 30 Apr 2025 20:47:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dR7JRev4UWJ18b/yknGbjv7JNxutNiQRsQw8n2kq/K0=; b=EpVSx6R3i2K0xx+8
	t9wtFFVzyvP0IuMZPFdNce6K1+rl5/rrqU7MjLmyp2QwzTrzy3TPiT0ccN0AyKf7
	98VLXbk89h/ZHl3e+bbSvd3YDdt7640o2bLeYEiBUBhSgcLxyKBu48uTbYsr+h/A
	RcsK71t2MqLU0I+sJ4BRiJf0zxFvvdF0QCjZLuPajipEVCuTiLcbCB3ngN1i5ozs
	zLDMFH7xbyMp6De0OML0DNv1wP9MmjU22Aq5StPtB491zZoq3Iqca3vL6laKTEU8
	L4G+w2q+pssTW21V95XvhZOlfmTyIHvKhU0xGrIjy4vq7+VNO7pkKQc/lDO35VJd
	uOORrQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u4bn0t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 20:47:11 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53UKlBgD007713
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 20:47:11 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 30 Apr 2025 13:47:06 -0700
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Thu, 1 May 2025 02:16:47 +0530
Subject: [PATCH v7 1/5] dt-bindings: media: qcom,sm8550-iris: document
 QCS8300 IRIS accelerator
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250501-qcs8300_iris-v7-1-b229d5347990@quicinc.com>
References: <20250501-qcs8300_iris-v7-0-b229d5347990@quicinc.com>
In-Reply-To: <20250501-qcs8300_iris-v7-0-b229d5347990@quicinc.com>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746046022; l=1266;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=mTMLc/grEsMk9tdWZaAjExvtqZMAqAYePZboVGY5WvU=;
 b=uWWPy94p7FkyvmF7czp4SULNuralOCgU5usbLC1NroEolP5+bijpjC7Riqigss73sCPbqiszY
 OPlWJrGHuMqBLo1MD93I3ESC+RoLrVM/d8jvKIvThi6r7/nCRwjS5/9
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 0J1nHvEvKU3ZLE_kOJ09R3brYj-NFhbu
X-Authority-Analysis: v=2.4 cv=Yaq95xRf c=1 sm=1 tr=0 ts=68128c4f cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=vMvmzzE8Xnitjmo8DM4A:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDE1MiBTYWx0ZWRfX7uNBlAl/oXTM Qb5bIkq8dYOjJ1+5MOdsiG5Q9yjJ5iTe2XEXFom203DowMfPVEawnd9IJyvk/yvSGkKArGiU96I c6S8AWhUWBvDTu7PtaCTVKAuh1LfkJM3Cmf2OeLuVqzxC2COI2/l0HLjL4C56ZTG3uESyzRuFjF
 892b1oojcp5LeLeGKTLK8StR2QArhJD5HcU/eJquXB/MV5yOT2jExc9si8UzIUN7Z7MFelio1fT oIOp21ppkA+uH5oOOsKqK3Uj+x7/YTfo71ghmbqnPf/rqXJQq6YyUU3ETygOnmK+X9mbJyXFrnj xxRMJLTvlu7HQ8TEmUmrWkvbisXBp+AD+wcqBU1U9aeyxoD4VBGkjqEPYA/vS3sKvhxG/o0Uv2m
 /jyfnRuJM3h6+tHJvOWCb3XnqdAGBk3CKHTb1QKRD4WwPWCLEoBR2luUsqhzgYhxGSVcwQ2Z
X-Proofpoint-GUID: 0J1nHvEvKU3ZLE_kOJ09R3brYj-NFhbu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300152

Document the IRIS video decoder/encoder accelerator found in the QCS8300
platform. It belongs to same iris v3 family as that of SM8550 but is a
downscaled version of SM8550. It has 2 frame processing hardware blocks
while SM8550 has 4. Thereby QCS8300 have fewer capabilities than those
of SM8550.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
This patch depends on patch
https://lore.kernel.org/all/20250417-topic-sm8x50-iris-v10-v7-1-f020cb1d0e98@linaro.org/
---
 Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
index f567f84bd60d439b151bb1407855ba73582c3b83..c79bf2101812d83b99704f38b7348a9f728dff44 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
@@ -22,6 +22,7 @@ properties:
               - qcom,sa8775p-iris
           - const: qcom,sm8550-iris
       - enum:
+          - qcom,qcs8300-iris
           - qcom,sm8550-iris
           - qcom,sm8650-iris
 

-- 
2.34.1


