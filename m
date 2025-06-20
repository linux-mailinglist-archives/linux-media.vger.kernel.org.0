Return-Path: <linux-media+bounces-35458-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1A7AE120E
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 06:09:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B8A819E3331
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 04:09:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13F7C20DD48;
	Fri, 20 Jun 2025 04:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lxB0cfA3"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE92220ADEE;
	Fri, 20 Jun 2025 04:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750392507; cv=none; b=d54bcjIa8tKRr3/0AsNofg3qI236xOY+Xa6Wpe96dWmsr1n38sfLZ+FDYbGmUdu5BsM7ltS3C4eDDLZI3842/4tCbA6rcKUmVwNAuHbU7UN0XXsxArqDyBi6Wjb3XjNRNYaPYA7GG3R9sPMM9Hzaqdy2yHr+nd3yMB1QIXQPiYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750392507; c=relaxed/simple;
	bh=CulyjY4NjRIeD655pJ5HRYpXZ+ZdovvS8mZgv+1xvTg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IdVMT2VCD+j65HLyJy0yi0oCdAYI2RyZo3tBqyhQeh7hUgY5R36qGnefiDn6Hvma8WYdimEt3LZvz7ISXd6IUyZ9wMauX2JYqGHg3+u2PlYll6tv5zx5HpMPe2TyIai92veu3O3sPrWWlYt0kmYF9KbiQcxwVCBHLpOT+JFl/Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lxB0cfA3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JEDRhC028912;
	Fri, 20 Jun 2025 04:08:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zBnlfquW8ztjsrCBTO4CFPwJoK+KHTJQ37+y7SWYtwg=; b=lxB0cfA320KFnrcT
	Vz/SaWAaXlFLOstwLxI5kqJWO+lg6UGzTjdrxgalXddWIRSn+AkmnMwwTgd571b/
	cX/dp450H4U0n4LrOTQnYSqdW2bmJKZpbyhdz+8awa0GjPZGjULAs/6BHIzaacyO
	S+jrEvNn4eoCDZDbXFYqwa2I99mwGYqh/kyQrqW9WLMtlYDFGCbid4pNBUUJbERa
	dGXsauz6dTDnbfmmXmBT6KuJKyA3oZEBU+tUdQkQnSwx3esMBgqyvD47MKAtFscP
	kjbU9UjfGVMy4gRfcnb8NXLuC8A1878qBTlS3mjt6PvQrY7k+npqiyCvg2RLpmcv
	UPvTTQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791h9hwwg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jun 2025 04:08:21 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55K48KiQ000915
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jun 2025 04:08:20 GMT
Received: from cse-cd01-lnx.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 19 Jun 2025 21:08:15 -0700
From: Wenmeng Liu <quic_wenmliu@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <akapatra@quicinc.com>,
        <hariramp@quicinc.com>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_svankada@quicinc.com>, <quic_depengs@quicinc.com>,
        <quic_vikramsa@quicinc.com>, <quic_wenmliu@quicinc.com>
Subject: [RFC PATCH 3/3] arm64: dts: qcom: qcs6490-rb3gen2: Add csiphy current support
Date: Fri, 20 Jun 2025 12:07:36 +0800
Message-ID: <20250620040736.3032667-4-quic_wenmliu@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250620040736.3032667-1-quic_wenmliu@quicinc.com>
References: <20250620040736.3032667-1-quic_wenmliu@quicinc.com>
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
X-Proofpoint-ORIG-GUID: F-Kil7l_4sVM6dbBgELwl4lX8MQRQUox
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDAyOSBTYWx0ZWRfX7GXsx9or//wn
 ZyaWhbUreiWagcaBY6K2Gk57uyCiMUnCqmYOdumeh3Mx9MVjZVUv0Pd5jSCg6dPbFkk33o6B9vR
 6jffu/iVPxtcAZ8wci8Sv/5QUjgmhmYYShN4vqImKRaO7YdO2KTgYhX66rIkkWEOFRD3swkRxMO
 gCAgTfj2NFMAx+n/f17osAtwuyI4mOiZpMwrsXqzoWpEybiGf4PTamE7FER7EkfM1bsyTzc+93S
 +PY33zwfLzqnXeR52obLXETn6tt13po2/pKXjvzMpXsyhlIaNN+ngwodEGLuilURR0mdrQ/+P/E
 lC/tgiEPstgloNOzTO2Gi/IxVPT1hFNP9Sqy6ngDFJTy+dBKSo+F872Ckrf9CPK5GlbyLrAB5xB
 vVZvbJY068W/5OjRXbxs9UStdlvbYih8zsbIoX/LmqZ6JAQL/nPC5gP2HybDVikSAdTTzj32
X-Authority-Analysis: v=2.4 cv=UL/dHDfy c=1 sm=1 tr=0 ts=6854deb5 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=zPEXOy06XE7ydg0V1ewA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: F-Kil7l_4sVM6dbBgELwl4lX8MQRQUox
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_01,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0 mlxlogscore=838
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200029

Add csiphy current value to support csiphy current load setting.

Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso
index b9e4a5214f70..60e7d46db394 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso
@@ -16,6 +16,7 @@
 &camss {
 	vdda-phy-supply = <&vreg_l10c_0p88>;
 	vdda-pll-supply = <&vreg_l6b_1p2>;
+	regulator-load-current = <54000 96400>;
 
 	status = "okay";
 
-- 
2.34.1


