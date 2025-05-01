Return-Path: <linux-media+bounces-31519-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 870C1AA63C5
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 21:16:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8984D4A2E96
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 19:16:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B36022F176;
	Thu,  1 May 2025 19:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pCV59j1/"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFF2229B37;
	Thu,  1 May 2025 19:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746126883; cv=none; b=YaCY+gQp5pCDwIV33YSrkuZJNJdjJN6F8WnC+NKRIzapcqaTMthmpKLzKQNZyfHxiNys9LbsL6DFkORTD+glZqHpidZxsrdAaMkBoqFosUJIhP2BNFdEnM9g0yl56d+kXksGubrhZqsqNxKiBxTK4Fjlu5o7jUGIGUrU1qdiBRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746126883; c=relaxed/simple;
	bh=V5TvLDVr+QXCUHuxpLOSP1STdE9U73/GWqIEzvpC1Jg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=eM8h4VYHHAi7nB8S+IKrr6YQf8eLZ6Qm5cnR0pQdUCTfeZx6IXAFNs4RKwa+prfgpN4hNJGAtCnVgTuijA3VDnv2/4KuKE8xDShceC1+PlAdQPXqMiusID8Lkk+9M2EOqdRRVya7Yd5l7GgIPp0lZwFx1feKjS6ASy8um+7HONI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pCV59j1/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 541D27a7022169;
	Thu, 1 May 2025 19:14:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H28PoZJ+vidDsFOh5sGN7IDhs3XVkHINzAY814q32Co=; b=pCV59j1/FtAoGUoV
	GQUWIMYH2qLz4431OGLFp1jBEx7kXeusWDOhi8OHsJAE8JNU19Az9GXAbVzloTJO
	6lBzR3CqX+5wdrxJYcNsMH3QL6ULKwGpkjDPiQUh0SWQgFH+FIS5QpBqHqknBVC9
	eMhFe3mq0g8Hfeo2ZPFyW14QXvHsAguBOOn+RCgqtObDbh26Sjlb955olyBg032a
	ZO7CgVfrfh1GMBttK/rviXR4iKh5dBXgO/n4gdYMT+AI0lUSZ+g3ViLzzXz4bW7m
	TRJix7YbiwchK0maQvr4pPSqryw2wvU/vCe3FUQN9qpwFKjJyXAHZl7LRMwUsoI6
	EcTdkg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u7x7cj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 May 2025 19:14:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 541JEbx2023041
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 1 May 2025 19:14:37 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 1 May 2025 12:14:31 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Fri, 2 May 2025 00:43:37 +0530
Subject: [PATCH v3 07/23] media: iris: Fix missing function pointer
 initialization
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250502-qcom-iris-hevc-vp9-v3-7-552158a10a7d@quicinc.com>
References: <20250502-qcom-iris-hevc-vp9-v3-0-552158a10a7d@quicinc.com>
In-Reply-To: <20250502-qcom-iris-hevc-vp9-v3-0-552158a10a7d@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil
	<hverkuil@xs4all.nl>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Nicolas Dufresne
	<nicolas.dufresne@collabora.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        <20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org>,
        <20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com>,
        <stable@vger.kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746126827; l=1303;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=V5TvLDVr+QXCUHuxpLOSP1STdE9U73/GWqIEzvpC1Jg=;
 b=6wGDPYfD+0MMsHqkqcmsIrcxS+TondlGm6UnDUoYX9/SaOKS1t4dfS9BGc1SBN4y7wZEmuZAg
 jXNHUkKOXELAB3gZWIoXqF0GyoZ+abgWVrlkfNVHk8yxngqUD7iPkif
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Ldc86ifi c=1 sm=1 tr=0 ts=6813c81e cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=KBDEKiRkX8NPVKSMWrcA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: hwVIULiTnsDU0rDcatRRW2P2PBFuTKGh
X-Proofpoint-ORIG-GUID: hwVIULiTnsDU0rDcatRRW2P2PBFuTKGh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDE0NyBTYWx0ZWRfX6b4gVsEH6J1O i8zdbnlJFBCOt+wIfrzpFp/KZzKtLfJXoIvi9PHJtqa6NR/h5QxURX119VsUwsnf0iPtG5+0Ln8 eCutwCE1bypJcHnp5KyaTJzR8I7KPHGeCrkRizBfluwQ4dVxkBRraTY+J9dnjr6bHQjkKK0Ftp3
 V5EXdycZicf06RCfPZyNZwKHUGP1kepsJYYA8e8o0fFFPB8rEzP1SndsvLjy/ZL96mxg9qAgW92 ZzQizKPt3Q6/knY28HS1QWNBjaYVMLVd9njt6WiBY8PvFjKUUTBXcrQVDn7UJyAFKPO6zamixsm tNC1gSX9UWNi+0y//M5PAlZHO/0CAx0FePG1+xtoR4LVZRRs4Gdf05u+eK7jXbOtZBengpAhB7x
 PBzgyg50Zm+QaT/qnNzZp1EMafaCcnS/g/ob8xTXLRxLOTXfHjq04I+N5LxxdFEgWJsQFMJt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 clxscore=1015 spamscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 suspectscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505010147

The function pointers responsible for setting firmware properties were
never initialized in the instance capability structure, causing it to
remain NULL. As a result, the firmware properties were not being set
correctly.

Fix this by properly assigning the function pointers from the core
capability to the instance capability, ensuring that the properties are
correctly applied to the firmware.

Cc: stable@vger.kernel.org
Fixes: 3a19d7b9e08b ("media: iris: implement set properties to firmware during streamon")
Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 915de101fcba..13f5cf0d0e8a 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -157,6 +157,7 @@ void iris_session_init_caps(struct iris_core *core)
 		core->inst_fw_caps[cap_id].value = caps[i].value;
 		core->inst_fw_caps[cap_id].flags = caps[i].flags;
 		core->inst_fw_caps[cap_id].hfi_id = caps[i].hfi_id;
+		core->inst_fw_caps[cap_id].set = caps[i].set;
 	}
 }
 

-- 
2.34.1


