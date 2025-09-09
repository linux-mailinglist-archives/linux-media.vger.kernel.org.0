Return-Path: <linux-media+bounces-42103-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8128EB4AC7D
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 13:43:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 357C717A6F1
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 11:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 864B0322536;
	Tue,  9 Sep 2025 11:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cgQW5vbB"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FC9321F4C;
	Tue,  9 Sep 2025 11:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757418198; cv=none; b=q9OYR+frKiHl8crkE+nKlUsrjZNAiuQWX6f+tilS+WWUhvSLvaSyqlHI1IIJJbouNLTUyaXk5VvLbglWQejyXaYtjvPHraF+zvgUY+B4DcupLotJc5opDDKIvg5aDzJbSFrsyoSDUeH2P2jTB9mEi+MmXJbwNtTjo2FWaP6W5X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757418198; c=relaxed/simple;
	bh=5wNHbBK0XxQh3Dl4CJgCp5Lcxvmf8C4eGCaWWIScw8o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AJDoaEaa1IxxpfmY5xNGdZBOp9DwR2giNVlDksCCtTo8baCNUaRJuhLKihRNn+CKTyoYrAGRzupyPCqLS4kfaKAmV3GYr9+g7LuEiIg9HluxnTk2CH3YSgJSeSWPeWo+HsQohLJsaKT6kLrDMikdDPn5iBLbkz/7ptxlNbdIvu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cgQW5vbB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LURA020161;
	Tue, 9 Sep 2025 11:43:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	me3s5KtnGfnPX3nQQuFWMWrdf93eGrA2nAX6p7Z51Aw=; b=cgQW5vbBqMBhkvw5
	Ne4lkwu5yLdGI6q1shOiXs4hpmWoNlstZefYLUzysjokXWBfBcXD59z6KspkhrVL
	0weyisiVnzgHVicbDyqwDsydE+bBtjqWxmsFFFiznTdMoLJiAUKg1Yqes/VLqSYA
	AxcdiYHcC3QrgQOE4iEpQF2hOYn43Wcf+UA1ocYs2JhQSzcsgT5MR6mAwFyijIFT
	ZeH1iEEr2A042YmxZ7Lffwu+g04iNZM5UlAa8XFpJq5bl6KUpJytUm8P5E8MBo2X
	B3ZwureU89Myc6MnUIp6VtpStBL5CI4/wmT3rr7LyPjGD1VwoBuyKQjBLLMOAu0i
	REfWWA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491vc2436q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 11:43:06 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 589Bh5ad020131
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Sep 2025 11:43:05 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Tue, 9 Sep 2025 04:43:00 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <bryan.odonoghue@linaro.org>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_svankada@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/4] dt-bindings: i2c: qcom-cci: Document qcs8300 compatible
Date: Tue, 9 Sep 2025 17:12:38 +0530
Message-ID: <20250909114241.840842-2-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250909114241.840842-1-quic_vikramsa@quicinc.com>
References: <20250909114241.840842-1-quic_vikramsa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=FN4bx/os c=1 sm=1 tr=0 ts=68c012ca cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=phzA4CzYhpZqrDFsW3YA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: lmNws11Z61Ia6VwWHaFCnrzzZlGpDzkr
X-Proofpoint-GUID: lmNws11Z61Ia6VwWHaFCnrzzZlGpDzkr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA5NCBTYWx0ZWRfX7KU+vljVLFYu
 i73wCLcdBN1xAgEd3i/TtH9nCaOWndVvwGY8DvZa3bfFFxlpk+UO5SVSfKaVZBDQKifNiP1HJXk
 tJiJGnRRWmSs/OHRJ4A5H+qLHRGRIzKTDJToIEK/b/oADEXZj466MDQE1zBc2IT5d2a0Qyf1cnl
 y8hRSHDBA1X4yZ8OWCwWgi0YD+/gZgUtTe/ItxNYq47vmBwTSFqYLJX2w7Asn4oH2zOO9o2xw5r
 KChVTL54nC+NyejRihPdmTKuWAabtAW23UyvcpE1EiVppomVNJFZkt5lxxt44ol3HdTvZdoSKC4
 4WzTt3eilyEomtH6buVo6wV17CyXta9CdrtrhNCNpaC4tD405Zjo0BubxX/w1YUO98xXliNT5Xg
 MhIBkR0E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_01,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080094

From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>

Add device tree bindings for the CCI controller on the
Qualcomm QCS8300 SoC.
Introduce the "qcom,qcs8300-cci" compatible string.

Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 73144473b9b2..d50359019501 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -25,6 +25,7 @@ properties:
 
       - items:
           - enum:
+              - qcom,qcs8300-cci
               - qcom,sc7280-cci
               - qcom,sc8280xp-cci
               - qcom,sdm670-cci
@@ -223,6 +224,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,qcs8300-cci
               - qcom,sm8550-cci
               - qcom,sm8650-cci
               - qcom,x1e80100-cci
-- 
2.25.1


