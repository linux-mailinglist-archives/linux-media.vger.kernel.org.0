Return-Path: <linux-media+bounces-31520-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC50AA63CA
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 21:16:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 136861890780
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 19:16:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7EBA230274;
	Thu,  1 May 2025 19:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lyvFFFwT"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CC722A4DA;
	Thu,  1 May 2025 19:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746126892; cv=none; b=Yhm6iR3lfuMN6B8nk4UkdhImIhmTyWEBsV9EAlljEUDey9ruTknTY6WRQtzEfZ7kmG0bchIhUHvFNlVPsf+knZTSwG4xAKchQnfHK2Qy+DHygBb+A7zm+XfUDJjXDK8yfOixeaGDiGdtX79coZbNWhoxytVuFvDHjqm8Fl52kGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746126892; c=relaxed/simple;
	bh=Xjtn4TgGettv2wkzFD81ftRyg6tH/j2KQ8TC8T9GmFo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=WcLeDayqk32LaSAhKLR6XivIEQAwPiI417NuLCuF3guqbhf1m+Exj/ErYCmw1B0MWdcfrVuP9Me4Ux1sFZMGElRllqolWEiHaaMmszMdJDvLeGrAtwHFPQAbdnVlWH5nasRLJZPQImvayoIPjIO2ruGuTwBxy/7nes30t0LqlZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lyvFFFwT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 541D2KZ3010313;
	Thu, 1 May 2025 19:14:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k9ycHKNft0emV3rTjB+m64CWSqaQetD4uvh4j4R8M1E=; b=lyvFFFwTxcXm1j9b
	pJIMFJiCf/Kx/cflp+INolvqfyrP4Go+EPhkiYfwObNFhcV9gEMsEhZI9U4Z/DzM
	EljDk9Kpkwex9NETL1COpputKZjHrgMTj/ywCoww5lKGy7PsQBjOJIrH4B1SWJ19
	kLK4DLkXdWlE2gwj9hHafQlwiWtWWKTvBTNkHm8l8sZmfhI8k6TuFeyWeyO3g0qQ
	smWdju9nh2FsPVjmNN/kU0zdT7GXB/0/GYo6PuwgXyTMt/Kwx6QPaOjk9sMT90mc
	tUVqhacy5tQ7tE4YL4/w3EeytYRKAsv9Hk1YrJYF04ex7aWU0AQj9/2Sjl0KyDJh
	nGz48A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u3x5dt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 May 2025 19:14:45 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 541JEiWI029876
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 1 May 2025 19:14:44 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 1 May 2025 12:14:38 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Fri, 2 May 2025 00:43:38 +0530
Subject: [PATCH v3 08/23] media: iris: Fix NULL pointer dereference
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250502-qcom-iris-hevc-vp9-v3-8-552158a10a7d@quicinc.com>
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
        <stable@vger.kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746126827; l=1443;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=Xjtn4TgGettv2wkzFD81ftRyg6tH/j2KQ8TC8T9GmFo=;
 b=G+F6ndofmCS+7lavAtL9uEkrW0bVtWyk1ATUsvYDqinaWCWqip1RdrxaR99wrxG7rHqtgvQY/
 RYbfMjer5a4C1UpJ3M14pCJgUrXKai5HQWj5xjlCtzWSdzlwAF0WYr4
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Bv6dwZX5 c=1 sm=1 tr=0 ts=6813c825 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=_9w-BpbxiFVjEEnp1AAA:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: eKhedztkvYBcx6xAsXafFYbMkHicZkhm
X-Proofpoint-ORIG-GUID: eKhedztkvYBcx6xAsXafFYbMkHicZkhm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDE0NyBTYWx0ZWRfX7RMPB7YY0JLw wYPW69he47lQgdP6c32SjYG7TAT1JTDDeG2pJNxqnNM3dKoHEo/FSpx+qTRiIlqB2tX801TDLOX STmWZbzhmeKc6pyWeof3E9XjZ1klEtlSR3uKC70kISUQrJlZZbYsLAQnAXGNyvVtj0bZlV9hzvj
 qf7kuNM+Pofx90yVK7oAfrkl8L9dgqiTnaiVfyzPbTX9AR3T5CtuwjcDbKhdj0UJN3qqAHYXzx8 cvOSMSjtiHPisVSOKivnya6/tlit7HVGiFZPMvu2ByrFP7MMqRESKwPjaLldGmOuYGOQCxxsrdu 8F/l5dmNhxfqlzMeooBF75ziW1wTx7lVMyEB9wI06m7eDC7ofCgIKa/QoPWTAPrmRbyp0KiLWHI
 rLapdLPmxZiMThggBEQBdL6KjMHJ+2s/QS5SOVTyJjkkaJgDrysNxfhdUev9+A8ky6zzdvlN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 mlxlogscore=999 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505010147

A warning reported by smatch indicated a possible null pointer
dereference where one of the arguments to API
"iris_hfi_gen2_handle_system_error" could sometimes be null.

To fix this, add a check to validate that the argument passed is not
null before accessing its members.

Cc: stable@vger.kernel.org
Fixes: fb583a214337 ("media: iris: introduce host firmware interface with necessary hooks")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/linux-media/634cc9b8-f099-4b54-8556-d879fb2b5169@stanley.mountain/
Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index d1a2a497a7b2..4488540d1d41 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -265,7 +265,8 @@ static int iris_hfi_gen2_handle_system_error(struct iris_core *core,
 {
 	struct iris_inst *instance;
 
-	dev_err(core->dev, "received system error of type %#x\n", pkt->type);
+	if (pkt)
+		dev_err(core->dev, "received system error of type %#x\n", pkt->type);
 
 	core->state = IRIS_CORE_ERROR;
 

-- 
2.34.1


