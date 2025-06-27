Return-Path: <linux-media+bounces-36115-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1905AAEBBFA
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 17:35:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85E201891C51
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 15:35:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A47502E9EBB;
	Fri, 27 Jun 2025 15:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TBq0pIge"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76D12E1C7F;
	Fri, 27 Jun 2025 15:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751038419; cv=none; b=DFi85Mj1QzKgdVdWcGX+5jkUCnmloJMhNLSOAX1dcyoewfeh+x1B+t+wMlTbirZ73I1qR2VuB8I+Ltqd22WNAujrXN/6OCWhhyXlfuQ75dKulkBz1zcbySUnLX60Wfvlr9hM2nY8AtBY7dZ75rf/irb1cxrT3+sSnlgn8pAXH4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751038419; c=relaxed/simple;
	bh=7yLqISZi2iOkaYLdO3jaD791BiQle43dMbxx3g6IDjM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=aVRMYSflqG/I+7HAo+Ff4qNu6qEt3Bvex6UYY6a8YR++pVWl6JINPkQcwLK24+GTnT46/8vnuMXwyCXqCtnWcvaFlNrRtrbM1JpNhDvmdcizyEsN5G8L8joqw3qxlXjOg0u64dBkrK5qnk/9SNg01yimGFFnv7zXWYmQDeg6BcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TBq0pIge; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RC5Yg4014245;
	Fri, 27 Jun 2025 15:33:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tv69h5+7Ly9EksC2Tsf+uzCBpppecTtLheLgqclXCFk=; b=TBq0pIgex6PpX3mP
	MDMEOZ4/WtADv3ijqmZiLFTQH8W0SzdwKq6ndGwODBWnht4G3+wBUtGhOc0zJRsP
	emYM6A9RMo4CODveA7vdywZh2wT7HYK0hCZauS4LV0TLmsGrYXeDGzwlsGw90XRp
	ZSlRVwDqoJGN44KoQVs+1/RKbCCoZ3jTvhQZrxJd7liPk0Qpa6sBA2KJOsQZy3UV
	Dwk5E12hzXYC02HyvinqWmqxGd5/yKILq29Yb0GT5Dd8t9Sbi4Kyzg2+hVd9OzPi
	vjGd9jxehmbTeQ9ANzqNUujjibwHjeEixV0YsJ7IRoZG+xkuyMvaetHHt3HSNsfj
	IHVEKA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47emcn13qf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 15:33:32 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55RFXVx4028121
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 15:33:31 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 27 Jun 2025 08:33:08 -0700
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Fri, 27 Jun 2025 21:02:42 +0530
Subject: [PATCH v2 5/5] media: iris: configure DMA device for vb2 queue on
 OUTPUT plane
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250627-video_cb-v2-5-3931c3f49361@quicinc.com>
References: <20250627-video_cb-v2-0-3931c3f49361@quicinc.com>
In-Reply-To: <20250627-video_cb-v2-0-3931c3f49361@quicinc.com>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar
	<abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751038370; l=1047;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=7yLqISZi2iOkaYLdO3jaD791BiQle43dMbxx3g6IDjM=;
 b=oTbDCzGCYYmLi2iqlXPuX89czjjcSCXKphzW/FFLmzcMlHUO5MP7tyqVoeKFH+x5p2RiqWRUG
 5VRCRWJCMwPBHl181JFia+8w2GUZPBk0tiRcK6zlL3NT+8rrk7Oj1Vh
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: EX3SaSJiTpEPEm0ln1RWvh8y23XP2zYo
X-Proofpoint-ORIG-GUID: EX3SaSJiTpEPEm0ln1RWvh8y23XP2zYo
X-Authority-Analysis: v=2.4 cv=J+eq7BnS c=1 sm=1 tr=0 ts=685eb9cc cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=9NI5Io21HBJBbxBAymgA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEyNSBTYWx0ZWRfX+tryu9OBSq93
 0wyPibvzF+0o5o4FdRoAw9ZPWJGkNcWDfjEXBfhqQlrRKCZREp7cY25wFKxpo5N/J2j7UDmgxoy
 90//wu6S27arUfDpDA2koarZifQBGXYQ1P533tgm4GKqn8/uLQI6X16+xhOXmJCudG6F+QpBDZg
 QW0WjXaBu9Moyf/BY3Motbf7oN/3XS3KSgIzSE88xNmu0TWfnKbma+3uvL4FMAKnrjZF9HeJBHH
 Luw6VGf9j1CWLhO6i414sPSr5Mpd3RWUmiwSICAugCGXLhTn7jWkvXg1jN5/8kjBqCAebZMKuBO
 KLI5LndV0MLuGfZJRnUQDh7rXi4RIV6FrqNaen5Y/VS3cLEaE0u4CT9w41uk/bWEai7XdJeJ0oq
 2v/9FMp1OcDQ8vxFf465d8/Voo5T+oE8TMjgiTcWpl6HHDBjQs9yT2lMC0qJtD5Y5PxTM1cP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999 adultscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270125

While setting up the vb2 queues, assign "non_pixel" device to manage
OUTPUT plane buffers i.e bitstream buffers incase of decoder. It prefers
the non_pixel device(np_dev) when available, falling back to core->dev
otherwise.

Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_vb2.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
index cdf11feb590b5cb7804db3fcde7282fb1f9f1a1e..01cc337970400d48063c558c1ac039539dbcbaba 100644
--- a/drivers/media/platform/qcom/iris/iris_vb2.c
+++ b/drivers/media/platform/qcom/iris/iris_vb2.c
@@ -159,6 +159,10 @@ int iris_vb2_queue_setup(struct vb2_queue *q,
 	*num_planes = 1;
 	sizes[0] = f->fmt.pix_mp.plane_fmt[0].sizeimage;
 
+	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT ||
+	    q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+		q->dev = core->np_dev ? core->np_dev : core->dev;
+
 unlock:
 	mutex_unlock(&inst->lock);
 

-- 
2.34.1


