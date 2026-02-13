Return-Path: <linux-media+bounces-52730-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAcvCXIlj2lNKAEAu9opvQ
	(envelope-from <linux-media+bounces-52730-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 14:21:54 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2B4136520
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 14:21:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0D5003022981
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 13:21:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 155473612D2;
	Fri, 13 Feb 2026 13:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="a8gxREP0"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B703612C6;
	Fri, 13 Feb 2026 13:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770988895; cv=none; b=t6Pmyar4Q4ZMBqgWiysenjDRtEM+LPe7MD/dIzlC0xccche5YCbTBF8Yu3zPNC9oiGzD6HXRsGblhXrNPVpVxMio6SERKnyJRNghQLddLmuHZf4tszmXgLAlABN3N2OmqA8cEBtjzojtQtfFVvzYJ0N9ETdRqDXqck82f6RRKPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770988895; c=relaxed/simple;
	bh=F5JamfLWId9KwRYvz9y+gz8Crrly5Y0xicr2KjcCqTQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NWWiDKpO1uYIEESYJF4RLw3+m28bjHaB6rXllLlgIxNP0Mr4n/gdQA79lDak69uFswhJMn5JdUhgPq4RFJ1TA9oImFxCkLdTBATbc08ELczmRXpeIi+mEh8FO1tLhd/Vsh+pOeR6pV7AULMFY/rQj4vBph5Ewy+K50ULb8aNdEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=a8gxREP0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61D9EquB2733242;
	Fri, 13 Feb 2026 13:21:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I/ieITYcb/pPlgc5AgpUnTzCcU9WHvA0FNJVlars9CM=; b=a8gxREP0u+gKlGL1
	THfTBRxPj4gCXU2HeTigF1Rszocbj1vS38j8VJk5qmDUx0aT+UdBumchsjQKBalk
	Cy+dkFfJuIlFL385Mq8znFFhOXFLbes/Ps09BWiPar7h1s6cF3de741uYe3CavYp
	b78W5KcArI4dPQPGpzqhH/poj5LIw0T9zTz0ZZ2cO+v69eRTkGS2fnG2001thNn0
	SPKa8EEm4Dg8anH5HYBToCRklgBz4p4EU0xkso2FtNlsn4MSmjVH0yKmd1uwZWgS
	QGopghOSOEmvu6f1tzb1YST39OfFEICW0rba3E+f6GGl9eBdnejyagGRoT2qX/nL
	9pQn1w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9s6wtewp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Feb 2026 13:21:30 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 61DDLU5g010211
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Feb 2026 13:21:30 GMT
Received: from hu-nihalkum-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 13 Feb 2026 05:21:24 -0800
From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
To: <bryan.odonoghue@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <loic.poulain@oss.qualcomm.com>, <rfoss@kernel.org>,
        <andi.shyti@kernel.org>, <linux-i2c@vger.kernel.org>,
        <cros-qcom-dts-watchers@chromium.org>
CC: <quic_svankada@quicinc.com>, <quic_vikramsa@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Vladimir
 Zapolskiy" <vladimir.zapolskiy@linaro.org>
Subject: [PATCH v10 1/5] dt-bindings: i2c: qcom-cci: Document qcs8300 compatible
Date: Fri, 13 Feb 2026 18:50:54 +0530
Message-ID: <20260213132058.521474-2-quic_nihalkum@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260213132058.521474-1-quic_nihalkum@quicinc.com>
References: <20260213132058.521474-1-quic_nihalkum@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ZgytGsE4lYNlOc6TwMVpBcpogJPjGuUB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDEwMyBTYWx0ZWRfX0A6bTsNM6UUc
 IdU0/FcXHLtV/N6SqF3przAxvn/U+mvgMqBDaTqvxjmT37RkGylD25bPM+yblhgRjSp3FvE6YHB
 IWarn15ffieXXJsmadiQP76sprG4hKnVZRaTa1trF16mwUw+Ds8IDFXQa16uyo+OUHOuMk0QR/0
 S6Gz1UybVechZA4P4pijQWLQkOJ2oNPOj6OTKqGSbbnyLm4M9NuY2JCVyNVDwTAE27YJWDTDT6P
 /htcGpsUOeOzEnmHAD7GR/tKmzqOYVtzegGcjTqEzO/uSlcVjBbcb7Aeff4hcz9gw/701I/5kgF
 5muDAkME0Gl6qAXqHUqNLwZSR7wkp0ib5E4YFXZS4ASx7R7BC/fClLvdcF40sy/w4MHGGWJEwIu
 Io4aSsJSlwZ86XF93ePAUeas3nZ0HMMTy1sNoVZ2UQK5TaQHrYi+AZjTDk6IyxVe97aY3mTLSZr
 vPoNGQq3yGin+5bq4Pw==
X-Proofpoint-GUID: ZgytGsE4lYNlOc6TwMVpBcpogJPjGuUB
X-Authority-Analysis: v=2.4 cv=CLInnBrD c=1 sm=1 tr=0 ts=698f255a cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=s_BFhqDHtHiVpoTEQLAA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_02,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130103
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[quicinc.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[quicinc.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,xs4all.nl,oss.qualcomm.com,vger.kernel.org,chromium.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52730-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[quic_nihalkum@quicinc.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[quicinc.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,quicinc.com:mid,quicinc.com:dkim,quicinc.com:email];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BC2B4136520
X-Rspamd-Action: no action

The three instances of CCI found on the QCS8300 are functionally the same
as on a number of existing Qualcomm SoCs.

Introduce a new SoC-specific compatible string "qcom,qcs8300-cci" with a
common fallback.

Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
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


