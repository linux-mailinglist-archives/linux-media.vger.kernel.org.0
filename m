Return-Path: <linux-media+bounces-26178-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 59367A36FBC
	for <lists+linux-media@lfdr.de>; Sat, 15 Feb 2025 18:21:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A933418949ED
	for <lists+linux-media@lfdr.de>; Sat, 15 Feb 2025 17:20:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A56991F37BA;
	Sat, 15 Feb 2025 17:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="c8GyV/7W"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE2C1DF988;
	Sat, 15 Feb 2025 17:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739640004; cv=none; b=Iv7SJf/dyaU5LzvnBctBxbU1jzRLEzLAiiSmi/qB55UY29UWxOoeqqQcN3WXoMdHIM/SSURbAM8PKI4Ixhm2njjAhSyDc8A/q5rvtN1EpoBX2AfnHhVIaQjZKFaFi1RPcy8g7LcuP6/nE6guUNBCJ6AJcEhZ1vdJik5kTlzzk3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739640004; c=relaxed/simple;
	bh=4nL2yU5OQ9u/veQyteOUiLzrTY2mgfat8NMPtV3lUW0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=gkl/XgigklQEkblhyTSlPc+xN8MkBpCmUbXkssgXmnzONsihrux84y9DNuIf9Wo9TYJ05PeiY2YkshUh6NIdzqH5Cu0MeZHcsX5h781vB42WTD1LXRvc7DQDIJoYEOZdmB5V5Mt732GwKB2C3frONDcAexSjo/10csH5PPnqDd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=c8GyV/7W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51FFhkcU024742;
	Sat, 15 Feb 2025 17:19:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O+EHMKuQvFtrl4KDLo6nawUa0FRWBpLee8ssqH8cjCs=; b=c8GyV/7WnHOl1lUY
	kynWEfL8VDSJoreyzXg3UDuSkIb0Ary2vvetuhpm4L+XTBlo5GUtTijkuY1vmLfq
	K2OnZG9t7D4TyNcrcdsoMwmjXJ/uubdXYaVW2tCRk4trmRuHiaClYxEpQVL/2kgG
	XuBm86m9Vjrxuq6L0bQWI4eKnuuhBaUh7mTTygRvPdQi3Bx4MFjzuBTMSvWasTyb
	bazgScneUqmMRgVvNkzIj/7MaMoFeDFAjcIEJnbWOq0GRsAGckGFUKrnKG3YRTeH
	tJXdhT6fa485kNuRVzAKw7F58Dp++aXEjCPpoAg+v6zxOoX5DLKdDDS8nQ02JtSd
	UXBUVg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44tkqj8u1h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Feb 2025 17:19:46 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51FHJjYw031642
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Feb 2025 17:19:45 GMT
Received: from [10.213.96.105] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 15 Feb
 2025 09:19:42 -0800
From: Vedang Nagar <quic_vnagar@quicinc.com>
Date: Sat, 15 Feb 2025 22:49:32 +0530
Subject: [PATCH v2 1/2] media: venus: fix OOB read issue due to double read
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250215-venus-security-fixes-v2-1-cfc7e4b87168@quicinc.com>
References: <20250215-venus-security-fixes-v2-0-cfc7e4b87168@quicinc.com>
In-Reply-To: <20250215-venus-security-fixes-v2-0-cfc7e4b87168@quicinc.com>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Vedang Nagar <quic_vnagar@quicinc.com>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739639980; l=1198;
 i=quic_vnagar@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=4nL2yU5OQ9u/veQyteOUiLzrTY2mgfat8NMPtV3lUW0=;
 b=qVV6Mpk1MqTVSgUSQkcvl2/UvI7pnLGkHuYYu7eEdZvTDYXouNCVnmv29pLhhsY1STDYTZzBu
 s75/BMS79lbBz8lOMzx5mHoRNoTW+AIE9dpTeCjb1GFvoHZ3MEnbcJt
X-Developer-Key: i=quic_vnagar@quicinc.com; a=ed25519;
 pk=GHqLT8NPue4v+CDHbZork8Ps39CBHq345GQKvCZ1glE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: jduhREhtvSJFGL4URUkXjb9122cJwWQx
X-Proofpoint-ORIG-GUID: jduhREhtvSJFGL4URUkXjb9122cJwWQx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-15_07,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 mlxlogscore=692 suspectscore=0 phishscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502150153

During message queue read, the address is being read twice
from the shared memory. The first read is validated against
the size of the packet, however the second read is not
being validated. Therefore, it's possible for firmware to
modify the value to a bigger invalid value which can lead
to OOB read access issue while reading the packet.
Added fix to reupdate the size of the packet which was
read for the first time.

Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
---
 drivers/media/platform/qcom/venus/hfi_venus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index f9437b6412b91c2483670a2b11f4fd43f3206404..c124db8ac79d18f32289a690ee82145dc93daee6 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -298,6 +298,7 @@ static int venus_read_queue(struct venus_hfi_device *hdev,
 			memcpy(pkt, rd_ptr, len);
 			memcpy(pkt + len, queue->qmem.kva, new_rd_idx << 2);
 		}
+		*(u32 *)pkt = dwords << 2;
 	} else {
 		/* bad packet received, dropping */
 		new_rd_idx = qhdr->write_idx;

-- 
2.34.1


