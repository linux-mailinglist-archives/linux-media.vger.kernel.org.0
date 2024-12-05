Return-Path: <linux-media+bounces-22734-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E85D09E5A7E
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 16:59:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8B48286BBD
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 15:59:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39000229B3C;
	Thu,  5 Dec 2024 15:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mpmG1Itb"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB1D229B21;
	Thu,  5 Dec 2024 15:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733414216; cv=none; b=BwkS196s9gie1xfHsWfy0HBESWToAKa1DXq7llKCCiogxreEnuUG9G80OAu8WfulCHm6x6TtXzSnG5LzwXYTafcP2nTmEc/1dHWOvfWQxXqpmrfM8kjWYdv0dArBuRXECK2DEI2A5Tctxg1DZEOZdjh77f/h9AzKUXpghBSsyvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733414216; c=relaxed/simple;
	bh=7JS0NE4wruUntpJKvirWK0pMF40CD8I62RZJecNwjMs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iuBpArRCsl3XjkIrpnLLRwMRqpYUyC5jzCN2g3xrQpqsFrz0bDeAUn0LIQJ3Ls6a+6SeXa99OkxDWO68SsaoDURtdfwQetW3ktMRJMXXkE+LWhOYii3mWcdy9pVlE8WMAwsQluVn+wmJYK8sAVkQCnwGMp7DrrVxKrNXe7TYSfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mpmG1Itb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5DFkf9031997;
	Thu, 5 Dec 2024 15:56:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ui+pO1Undne/m8Q9UXYYYqutc6MTZ6V5oq11Csrb05k=; b=mpmG1ItbgiveWXx+
	bD/6mt6Q7G3slJd7VO5SSP7ntdew4S57T6hy5ajFmge439w1LACyOAua+WS++HPT
	CpzpEdwDOfDdTr9PShmd9i4H71axLSz96XbsFEhtdeD4XxOWuuWDeW4uFYvhhKB8
	nxUsQRyA9r3UoO2XC6MM3aorEcfEBt6FeZdA+UKGIZuc55q3JUiVJB/+IAD4Q+Cq
	V4vh20YDsONEHlDAYxo8gO6tSapzsXRPHZLcNvYsSaNoubHjPnhF3y5uaui49aZ8
	dW8sszxtTknG+lAZWNzr0aSkCMcyl+zrByTDdbomWrvXdSQzdcSaSYuQTzglo36M
	06jTxw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43a3fay10n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 15:56:51 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B5FuoFC024261
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Dec 2024 15:56:50 GMT
Received: from hu-depengs-sha.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 5 Dec 2024 07:56:43 -0800
From: Depeng Shao <quic_depengs@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vladimir.zapolskiy@linaro.org>
CC: <quic_eberman@quicinc.com>, <quic_depengs@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: [PATCH 12/16] media: qcom: camss: Add default case in vfe_src_pad_code
Date: Thu, 5 Dec 2024 21:25:34 +0530
Message-ID: <20241205155538.250743-13-quic_depengs@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241205155538.250743-1-quic_depengs@quicinc.com>
References: <20241205155538.250743-1-quic_depengs@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 3lkDZkBrVFDjz2qWvufyyvVqXqKgDyXX
X-Proofpoint-GUID: 3lkDZkBrVFDjz2qWvufyyvVqXqKgDyXX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 spamscore=0 mlxscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 clxscore=1011 priorityscore=1501 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050116

Add a default case in vfe_src_pad_code to get rid of a compile
warning if a new hw enum is added.

Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 58e24a043e81..1c9b6569fbe5 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -404,6 +404,10 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
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


