Return-Path: <linux-media+bounces-24071-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBC19FC584
	for <lists+linux-media@lfdr.de>; Wed, 25 Dec 2024 14:39:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A190D1882837
	for <lists+linux-media@lfdr.de>; Wed, 25 Dec 2024 13:39:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA36D1D4612;
	Wed, 25 Dec 2024 13:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NUajbWFg"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1121BC08B;
	Wed, 25 Dec 2024 13:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735133788; cv=none; b=iKq1H8WkovNTi8HQHJQLHm2/Cxf4SpUhFkgh5x9elpefKbv4aIK0NAEW8rYrB/skRJTpHFPTqQkFotsLF9+bEfAoJGyC4T5WlX2Wote/k+fZWjkkIRToT2aNmciy5s31fMIWW1rNHg4Bkzc0MpD0notInTQG5mE2j+XkucuR4m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735133788; c=relaxed/simple;
	bh=jdA/5i+fssVM9AfpuJctWl9cQCS6c/cjQRcx/NvUbuA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FfqYorVowJgfob2y5JpFpdPUQ43Lirgnje6FizlTDnu14XcVi13EGEKHoxC+rI+MIeZPZ25sqRZZXAQ1GiSXnqkUKltR2DxzyVm1bLeASswr+nYVKt72xwx8tyBUX2Jbd1Cd6ENVY4H6IZZF5vR4PtzJdXryh0lvxYdHJ7vNHpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NUajbWFg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BPBm1tM004084;
	Wed, 25 Dec 2024 13:36:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VHoWDgDKICnb37LTKKPqRfKqGjsfnZtvJ5kVNQRU8HQ=; b=NUajbWFg57cJxbAf
	E/NdbUVm+OAXxxrhpKsqiAwy4gtRoC86HHXGhDxGH4HEY+80RBMuVnRSBIxtzMCm
	1C0adukjVG4uoyCV5etZ4YG8Wzgw4k6VLDmWWlOQliyagXvIvU30sJBs/q1LTX6Y
	FTLltQnB1TX9uL/C+qz/pQ6JRmEXIRQfCcmLMnP78SLMdrRwNxg7F6PhPhhI9FJ3
	3YJ4seyy4QDhUA1imMp9uE3joGJFXtlK1fNFJgwvCLHKaMH5m+vxTL+x9+p7M97I
	axU19KGDW75KQBRL1apLHtMRgfL+KvNVUiCK8lDebT/j2Mj0TDXCvfZ7xaX/kXy3
	67ccRw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43rhfkr7vm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Dec 2024 13:36:23 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BPDaM03019715
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Dec 2024 13:36:22 GMT
Received: from hu-depengs-sha.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 25 Dec 2024 05:36:16 -0800
From: Depeng Shao <quic_depengs@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vladimir.zapolskiy@linaro.org>
CC: <quic_eberman@quicinc.com>, <quic_depengs@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: [PATCH 10/16] media: qcom: camss: Add default case in vfe_src_pad_code
Date: Wed, 25 Dec 2024 19:05:17 +0530
Message-ID: <20241225133523.4034820-11-quic_depengs@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241225133523.4034820-1-quic_depengs@quicinc.com>
References: <20241225133523.4034820-1-quic_depengs@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: uLoIAN5LmyensLQrDr5C0lJOMCpjORNH
X-Proofpoint-ORIG-GUID: uLoIAN5LmyensLQrDr5C0lJOMCpjORNH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412250121

Add a default case in vfe_src_pad_code to get rid of a compile
warning if a new hw enum is added.

Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 818dba4b14dc..2a037860b09f 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -405,6 +405,10 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 			return sink_code;
 		}
 		break;
+	default:
+		WARN(1, "Unsupported HW version: %x\n",
+		     vfe->camss->res->version);
+		break;
 	}
 	return 0;
 }
-- 
2.34.1


