Return-Path: <linux-media+bounces-24662-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 78763A0AE5E
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2025 05:35:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD9111882A7E
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2025 04:35:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A12CD1CB332;
	Mon, 13 Jan 2025 04:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HwYag8vu"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E2F1C5F32;
	Mon, 13 Jan 2025 04:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736742775; cv=none; b=I1+amAEpf7nByreTI9J5+J3JfCCgso0Y+GBMmi3ZRMnIuceg0nki3fW8xfsW/imcZ5B6rH/QPC/+tTjd38BMo9jVWOIuP9Bo1Vdvv2XZiUrBnBd4CYIyATnAVLHuJIxltsQKvYDBp+MmP38X7uPOevlI8rKCPvb/7GBei1K9SVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736742775; c=relaxed/simple;
	bh=jdA/5i+fssVM9AfpuJctWl9cQCS6c/cjQRcx/NvUbuA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SxfdyFySi9ioPnPI0OoncF+45BowbTwj8xsvepiKPbHxkaZL7eFSF5lhSntVtGkOKcwEhYlyzxMUk+lViqQ1PEs6VO8P0HE87rjDKaMFTQ8tKrsjT6Mfp1s1qebkjndzwc9hAeub0ucjk8DvyRghGMjS0bNX9xwVdNPN/IKoWoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HwYag8vu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50CMws2a021571;
	Mon, 13 Jan 2025 04:32:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VHoWDgDKICnb37LTKKPqRfKqGjsfnZtvJ5kVNQRU8HQ=; b=HwYag8vuajQ2gHBw
	XaHW+6HpZ2RGcLtC1aI9t/nRbbt/vwmjxbpiaZIjgn5zay6VCiOI6uBE0kgp96KK
	if1FP1vXoromsl41H1gt76nfy2r4Mhh6APsDa1qObzX9IF729RxdBDJOT2Ys3bkK
	LZWYWvCGMeO8T9iVTycJabDA3Yz8ncWB0PVQhQGgk7obpi+vyD6UtqA2RmBj/nvl
	NuVOxiZdiy1nQ5DyD9DGe7h2k4zEZi+pk944PILcJ/Ptm8E6zXFwzenmWA6tDt46
	8oUq5MBD0rDD9tLsBOwZSPzuwL3jPXhVgKJCCmsSNhyOOt4swn3ctGzMS+gCa11A
	hzIU/g==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 443htgu6yg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 04:32:50 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50D4WnZl012937
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 04:32:49 GMT
Received: from hu-depengs-sha.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 12 Jan 2025 20:32:43 -0800
From: Depeng Shao <quic_depengs@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vladimir.zapolskiy@linaro.org>,
        <hverkuil@xs4all.nl>
CC: <quic_eberman@quicinc.com>, <quic_depengs@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: [PATCH v9 10/16] media: qcom: camss: Add default case in vfe_src_pad_code
Date: Mon, 13 Jan 2025 10:01:27 +0530
Message-ID: <20250113043133.1387162-11-quic_depengs@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250113043133.1387162-1-quic_depengs@quicinc.com>
References: <20250113043133.1387162-1-quic_depengs@quicinc.com>
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
X-Proofpoint-GUID: -Il5XH4jGve7-pnVQNTSyUFUyDrTr3aH
X-Proofpoint-ORIG-GUID: -Il5XH4jGve7-pnVQNTSyUFUyDrTr3aH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501130036

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


