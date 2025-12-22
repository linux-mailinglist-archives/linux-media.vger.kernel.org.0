Return-Path: <linux-media+bounces-49326-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A14DCD56DF
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 11:00:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DEB7C3034A1C
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 09:59:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D4AA221265;
	Mon, 22 Dec 2025 09:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="j5VaDvj0"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7E13112B7;
	Mon, 22 Dec 2025 09:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766397589; cv=none; b=URhMK9qQ3tkxke3p5joHKeWJLhDxzl02zziGqvQdKNh3dGnm+y8wAE1dmZaFMey0sDaN5GsdqwSm+yTZRgx8MGkQeXHw7g1vxUTlBVLQXNEfHufT3bJmQZfnx41oHO4ZOs4xGPH2CnQB5FQmgnSexrHNeYH6IAP+SwC5EUxgBwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766397589; c=relaxed/simple;
	bh=byqQdkECqUsBNdDd2tkVFPXBMf3Uck104mxVKGDm08M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=utY/QTr0avmMSOvJvV/JE1+RILvISMhkMrI4w8KkDplc1fGyHhW0ftHOV6TWiW74WaU1fJ+l1+PtMt1A8NlNqdoF8bb2qaDFPxLSdN2NlLwf+mMceoz7mA24xNTM079/e9YGElyhvaRROq2thgea0bNlEXf9b1w1hiDRfRmiYVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=j5VaDvj0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM824YH3586371;
	Mon, 22 Dec 2025 09:59:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	puwrNkeefsGsVdj92cwnxJqsErXN0jD9MjSzI5I3bKc=; b=j5VaDvj00QYNnr9+
	4T+havVA/K9gaBIeNEJPL856bp45epcMgn/Ztgtyg0tdmawsWZr7F/h2hyo0a7jc
	v3PaCeBME5SmcRBuNlgwp3RqqH/cP7lYJ9Mm5l+OhutbphiXo1lIXrsxBpeziEkp
	qNH36oVJA1YAL7YRlE5PsbtmsIzBHztpCdZtAGdgAQCvWlyyRX3R77VpEMeTcxnT
	CNtzj9M1dkCoDIOAuWUW+6LhtwGgZpCUtX+iFBbv9/bkWsgeEBTu/9DUh5Nj5Q+T
	jya/PHuCgumL2kvxQHAx9qr2nKaOY9NkO9LVwHNi+eBQwV4vqSltXuOFL23OUBh0
	zhmXfQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b69ahjvcw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Dec 2025 09:59:40 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5BM9xd1P026352
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Dec 2025 09:59:39 GMT
Received: from hu-nihalkum-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Dec 2025 01:59:34 -0800
From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
To: <bryan.odonoghue@linaro.org>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_svankada@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Vladimir
 Zapolskiy" <vladimir.zapolskiy@linaro.org>
Subject: [PATCH v8 1/5] dt-bindings: i2c: qcom-cci: Document qcs8300 compatible
Date: Mon, 22 Dec 2025 15:29:10 +0530
Message-ID: <20251222095914.1995041-2-quic_nihalkum@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251222095914.1995041-1-quic_nihalkum@quicinc.com>
References: <20251222095914.1995041-1-quic_nihalkum@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=JuH8bc4C c=1 sm=1 tr=0 ts=6949168c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=s_BFhqDHtHiVpoTEQLAA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 0XI8_uyKexs6rYMBinzI26mm7LBfEVq1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA5MCBTYWx0ZWRfX6NzlH5IZvqEf
 JgKnjdAklr7bP/Xk+ElocRbfyHVTURbIX6WRJtW5sTvFQTAldzrIsphGEzTIOUVNRKmWPSZp1X0
 vLoC+UotB+ZJ0+ZweRCbFONA5p4iDpIu3LSUJYXRZA+w+DLz24yOXWdphftyVsmhqPiGZITtA3H
 aH0MgP6doNfWk55EyHwxkV9AE+MMJC0eNQyk1ysIi4+lCeJA6KJSUVDmXgKJGQrgTh1FPAC4lkS
 bVYWIBw/MWpEr/cn3I/FaVEHhwFQEfX/348nhar/7nUVUNtWKmxOIlHu/TvWdpT7kjp4fsLk99D
 HdIg63nU6ITsfORYicoPsSnFpG7efeLGOulV0JYCRpjpE9s3pUMAEdEagzGNSfZ6y/BuvGdLS7q
 1Sn8ZwX7K40wV0CF0Yp0jfqP8gLmZj/xcmfkV+/PgAqvgdvoPkG5XAMWSVmMQ1jJChNUs8zjGoM
 zxOs/DE+eT1CD4WudJQ==
X-Proofpoint-GUID: 0XI8_uyKexs6rYMBinzI26mm7LBfEVq1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220090

The three instances of CCI found on the QCS8300 are functionally the same
as on a number of existing Qualcomm SoCs.

Introduce a new SoC-specific compatible string "qcom,qcs8300-cci" with a
common fallback.

Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index a3fe1eea6aec..399a09409e07 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -28,6 +28,7 @@ properties:
           - enum:
               - qcom,kaanapali-cci
               - qcom,qcm2290-cci
+              - qcom,qcs8300-cci
               - qcom,sa8775p-cci
               - qcom,sc7280-cci
               - qcom,sc8280xp-cci
@@ -133,6 +134,7 @@ allOf:
             enum:
               - qcom,kaanapali-cci
               - qcom,qcm2290-cci
+              - qcom,qcs8300-cci
               - qcom,sm8750-cci
     then:
       properties:
-- 
2.34.1


