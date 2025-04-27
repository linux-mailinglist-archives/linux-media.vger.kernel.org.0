Return-Path: <linux-media+bounces-31122-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 127CBA9E044
	for <lists+linux-media@lfdr.de>; Sun, 27 Apr 2025 09:06:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 628C0463864
	for <lists+linux-media@lfdr.de>; Sun, 27 Apr 2025 07:05:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 820D62517BC;
	Sun, 27 Apr 2025 07:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OJDQ1DDX"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B77F2472A4;
	Sun, 27 Apr 2025 07:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745737400; cv=none; b=soM0h89IKWQxJaPZGhRRNeZcy7eQwefoEf5zxj0k6LSj52T7f0EA8J5d9gfaOIC40c8UuuvhYuAsxbZTB9tI6EqiWXmG2YA3dO1FHQwkldB5HserkxxFcejjNTJOJ6CAxXgM49sTmraKWITqix9rjeNMX+yELp3vEiZrYeDEElQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745737400; c=relaxed/simple;
	bh=IOCMd2d69Kedkh8/lIsbtZOWFs/1jvc5ASkjuV1U69Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WHulEt0ELS87PABGbwHOhqoTvATLrSRJkxAU2oZ4rrq+ba7QMBi3YVAXGP+rtCnm7NIqFP1IEhybodoFMwQ/7qlHcXX5Unaz6GAtikfcXFSlOdKeCWQJ/YTxn1yiCSh5x+/3JnJbE5icewzkSR9nq63pb1rxDWn8TJatwcJdYCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OJDQ1DDX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53QNl39Y002639;
	Sun, 27 Apr 2025 07:03:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FYlqfxt+ExHh443vWlcPdW0QNqe/uT0OiLOQ0iqOfG4=; b=OJDQ1DDXqD/qF4u5
	XbvLZj1LB+cBclP72DeKJwEC8L9VfIqxmDwLDBjfFsusHfw6lSgQ5zyuXB5dUElp
	EHg/VNhc/RBIPp+Vve6WyjtxE0aVBk69luKCUaRgrK21JKP8LjCUjey6Y3pwTYxn
	o0owTE0hWUcYuJ33bB49PCX3Z1xjuAr5Jk5fRcNszwpuEDM+dqjNTz1DgzZ1cxdH
	bhYXu0U99AGktwnsYo2mM7wbAo7lIoU9XtUXLTDYHnlA5qeOo2iRb89LPSUYh3Qk
	XhHgdgjipLKDxjCasVv9SmsW2z9J4ZO8qofLPMR7yvOli9eibA76H0jUIq6cx8Ht
	xyXOWw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468rnmu20m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 27 Apr 2025 07:03:01 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53R731x0017087
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 27 Apr 2025 07:03:01 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 27 Apr 2025 00:02:55 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_vikramsa@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH RFC/WIP v2 9/9] media: qcom: camss: Enumerate resources for SA8775P
Date: Sun, 27 Apr 2025 12:31:35 +0530
Message-ID: <20250427070135.884623-10-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250427070135.884623-1-quic_vikramsa@quicinc.com>
References: <20250427070135.884623-1-quic_vikramsa@quicinc.com>
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
X-Proofpoint-ORIG-GUID: Lhnlg-nqN5ES_sZ-pLF90AVcugIoWwRf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI3MDA1NSBTYWx0ZWRfX/oekE8ZMS500 nHEOoBz5jb3sPfvDYlxaRtYzCx31Q2DIw4pNpqTQeji22WiUBC5i8x57ED0jd6Dh3lCQRDVI6RN cQ4NuSv2iT9HiJpACqm32Tbb/lFs2RpdvtdnsOrOoXo1bDtDKNOhmRZftNn6e45t5cT/9djYiYj
 zc4Owt1tEbGwARR+hreWxRZFZWK22JahhsI+jh9MtUBS4gfgnyVM8WZHFSLQxNXLVIktYYI/vaT fX00mloQGG/uTFWTycr/J0YvwxHTLWxmOsVBB/MauWq1Ym8bhYMpDXWdBKIR9bZUlLkdaCWLBNG y9Q9AqaXnFCGKB4h+BCQQvEvSjrGL+IvRrVn1vqM92N2s2rOiTO8eMwo4pJwby6De8mEKyhECR0
 FtS4LgDDOXCA+CQerGVK7jvP1W7YhJhJaqDl7aAuwSZrH+M9Yzqb5RCxNCzbx9fgYUgZNJiv
X-Proofpoint-GUID: Lhnlg-nqN5ES_sZ-pLF90AVcugIoWwRf
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=680dd6a5 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=SWFg1dtF3-VgytXPzhIA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-27_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 mlxscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504270055

Enumerate csiphy, csid and vfe resources for SA8775P.

Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 drivers/media/platform/qcom/camss/camss.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 763159ac39b6..edfb9952ed53 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4181,7 +4181,14 @@ static const struct camss_resources msm8996_resources = {
 static const struct camss_resources sa8775p_resources = {
 	.version = CAMSS_8775P,
 	.pd_name = "top",
+	.csiphy_res = csiphy_res_8775p,
+	.csid_res = csid_res_8775p,
+	.csid_wrapper_res = &csid_wrapper_res_sa8775p,
+	.vfe_res = vfe_res_8775p,
 	.icc_res = icc_res_sa8775p,
+	.csiphy_num = ARRAY_SIZE(csiphy_res_8775p),
+	.csid_num = ARRAY_SIZE(csid_res_8775p),
+	.vfe_num = ARRAY_SIZE(vfe_res_8775p),
 	.icc_path_num = ARRAY_SIZE(icc_res_sa8775p),
 	.link_entities = camss_link_entities
 };
-- 
2.25.1


