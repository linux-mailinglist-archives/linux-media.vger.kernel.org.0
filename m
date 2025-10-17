Return-Path: <linux-media+bounces-44935-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 93196BEB3C7
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 20:35:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BF033B06FC
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 18:35:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A8B9332907;
	Fri, 17 Oct 2025 18:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lz1xY2u9"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A06232E14C
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 18:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760726131; cv=none; b=hHX0WLnEvE6E4vaUFfX9V7Y5YRu7xs6vly+8zOY5i+DPZE7VOVrv4cPTCnTW8u5vmGbdqFDPFhNOGzCM4P7xc5lkCBrZbCP2hnPb8+vxcceLLAE3XfHNCR7L3+JAQGexgZd1cGAdjMX2JVWNf0+64FcWoxG27MqaKs2Jj/Maaro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760726131; c=relaxed/simple;
	bh=DSP0RYR4BmXibqx7IUSmnSQ47NHXteY7yJtMQO88UP0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a6z3H2GQrAUKV0jPthNnrS9kplPZg/ApmwvzuTgf2VGotUtKQk2hfqynPeYRWOb0RKgvv3ajjLuphzkHSWeaWQdFGO/PxxBZHj0+C7jOSwRUMwRwml48MQqHlwDm5eMB1ZWVbp87eyeSieIM7/g7Kc7O4G4MeGWr6d15/AxvVng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lz1xY2u9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59HIS0tn017627
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 18:35:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HUBZezXctNZUTvhj4jU3CP7PPArzUZna/FMnzKRKs/c=; b=lz1xY2u9tWLZbsp8
	CMttYA1PCfiGOdBDBqb210sQNgvttsBAq8sIJ/pwgHkjXi2St4w8hxgMB4aGmfNt
	H8nuCGou1Z4RLulv5zth3Zg0/lAd7+JOlt+Hs7kk6eg8JtPFzxWlDtcyg2SAVbrB
	vTtpXDazV4r/lEWzyOMqrGdXYX26ELvrcnZxVREInqrRKFRIT2hAudS6e5zb+fWJ
	aHmeRkbJpW8ysYxQcf413EbcCg6Ry8FNSwyXCbUTnUqzUVzf7OlSHNBmFl2bfubb
	S7GJmR7upYEhleAUnexIDzq1J6nnMWPFkgu6GDgC4UkYPjBRD6/myIIJ9xznX2Ar
	krMBUQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49sua8v2vf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 18:35:28 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-290dad78361so2047705ad.3
        for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 11:35:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760726128; x=1761330928;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HUBZezXctNZUTvhj4jU3CP7PPArzUZna/FMnzKRKs/c=;
        b=Ws+Pa5CNtc0owK2Tm33ExRIwQ89CAnuzwLfDUy335MYkY0syquzwJ9pTc8+0z7uvGq
         7THPolP0Skheblqssa5OI1JTzVfTNp+ujxNLzqXu+62nT9nNU5KmhuRhhZJ4DSoWYdhk
         6OYP+AIiWFo9/arUFf7M59FWLxBMhW9YwRigFwYPsWXxH0o+O0nJBnhNw19WXN5O6ALG
         iZpyGqJ8/rmHfKl+kEIcd6I+SxTJUjiKTc3BMlDs97+SLYqp0Gd90t1OoKzzciwCWanh
         jIMga9k3qc7hd4x/oQf3H1VAlL3XcTGqAYMksoX4CfVURaYVqO5njKW+A1UbiUGFD3ZC
         yYaA==
X-Gm-Message-State: AOJu0YyB3ytAH5bbVCNj+9d0e8Cc5hGpYVfAvcbGnFMc19rAQlZgYoot
	M1fXsHclESMH3khfjTulFnbLXd5JoF1Stk2o31tkqGBkWpTE3g9w3ZONVXJ577B0w9spUdpENWH
	DWC+LJKdDeG+xW/ppaDZCarhYe+zXeFSdNPiw6GaTsYn6xwxKNX+uB6/CPtYNDrOSBA==
X-Gm-Gg: ASbGncvrawN7KVdxFzZQVrk0O6qnL8YD9EbuV9/gV8ZPzDwka0FsrPRrAgV2gntev/c
	PStkLY/673VjAQFdUak/zupC4fshSEsI4YrRTN/5wK7jXXWGpbfSv56vmgoEQlpfLddDjrzsDvz
	+j1hXJEM6WLY28gOKCE1jfLBfEdy7Kz5ZbQEd/whai6FT3gXIVU8xKKGkf1XpatpQ3I8Y0CHdY0
	H9lw/F7pRI0aKqzmYyuSmbMAWgEn6bJL1ZZxOeQ1OeKZiB7+LUp22LwBdf7jz33Ssi6/8FRC097
	RL1tpOAzA3QI28syHwh8lc8DtZHxV3Fc4fB6eapGGo6Bwf4SVQDOyDia2kLx8ZV8TX3VElVXHKx
	IgcgB9++wvV/T0yp4JMjMOynlIYiYjobv5FaEUHWLPvEt/5eNKrH1Reaa4fw=
X-Received: by 2002:a05:6a21:a4a:b0:2f9:74d6:440e with SMTP id adf61e73a8af0-334a8650b5dmr3500588637.8.1760726127505;
        Fri, 17 Oct 2025 11:35:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjJuTka6aOUn/1+EvQOCTb/dd0QIHgH8nimjW8CSejnnxGUfAzi2PlSDzmmpz9xhF6KHcOHg==
X-Received: by 2002:a05:6a21:a4a:b0:2f9:74d6:440e with SMTP id adf61e73a8af0-334a8650b5dmr3500569637.8.1760726127094;
        Fri, 17 Oct 2025 11:35:27 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a2300f24fasm245487b3a.42.2025.10.17.11.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 11:35:26 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 11:35:16 -0700
Subject: [PATCH v2 2/5] media: v4l2: Add description for V4L2_PIX_FMT_AV1
 in v4l_fill_fmtdesc()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-av1_irisdecoder-v2-2-964a5478139e@oss.qualcomm.com>
References: <20251017-av1_irisdecoder-v2-0-964a5478139e@oss.qualcomm.com>
In-Reply-To: <20251017-av1_irisdecoder-v2-0-964a5478139e@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760726124; l=1154;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=DSP0RYR4BmXibqx7IUSmnSQ47NHXteY7yJtMQO88UP0=;
 b=YVIU3uQVT3vY83tryQM79WMBy7kN0qCmcc0tjWdsuQWcGktAsfLoI1hVWsGqL0UcNdUsif0LA
 G7i0qkFf0MzCJrlXhhvqoyFpXgm3pyTr/W80ykD0q0ME4GK06tirg7i
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-GUID: -D7V4YhN5rw7Tp-7Xfchk7COTPUtfK7T
X-Authority-Analysis: v=2.4 cv=e5MLiKp/ c=1 sm=1 tr=0 ts=68f28c70 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=3VFMuRvh7oFGMF0ZDtIA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE0MDEzNCBTYWx0ZWRfX7NdPd/AKHo2m
 ZpLZEAlA67wTCYv77T1qlTev6FphJeI1LmfurJxJUzy7+uy9hUPnPuBchA9rRmoYr6Ta9hmcr+F
 CfTvmowHYd+mJyoFxhjGzQqZNefwWewJ2d9BDPuQcSscIX1ZEcaaDmhXwmpLEGFoxB9v8+jmq6Z
 ZGtkA8gxrZq5ruabS5HUc8A6GxeE/5xoMzPy7mdJHEf4DpvcaWAcvROVJH08P19byYbYsMn+7J/
 aKxFMqgUIkK+Ui1aDtY7O2pAVPVkk17xq1Sf579pwfro1tWzuqSo7Ch6RVUeYP+QQcroK/Ml9Xz
 veLZ/qAiVX7hCO1YYxMG4Ya9yRV6yEPvrgCsWXU9nMYwkoT/CNbAYnEKKwc2aaAUwOb/UZfWei0
 5UcJEtLU4FncCzJi41DSzZ0HECU3wQ==
X-Proofpoint-ORIG-GUID: -D7V4YhN5rw7Tp-7Xfchk7COTPUtfK7T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510140134

Add a descriptive string for the AV1 pixel format to v4l_fill_fmtdesc(),
enabling proper reporting of AV1 support via VIDIOC_ENUM_FMT.

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 01cf52c3ea33e1a01e1b306036ba4e57ef5c95d0..bdfdf45c5de2f2ce885f219007718a54b5c86251 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1542,6 +1542,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 		case V4L2_PIX_FMT_QC10C:	descr = "QCOM Compressed 10-bit Format"; break;
 		case V4L2_PIX_FMT_AJPG:		descr = "Aspeed JPEG"; break;
 		case V4L2_PIX_FMT_AV1_FRAME:	descr = "AV1 Frame"; break;
+		case V4L2_PIX_FMT_AV1:		descr = "AV1 OBU stream"; break;
 		case V4L2_PIX_FMT_MT2110T:	descr = "Mediatek 10bit Tile Mode"; break;
 		case V4L2_PIX_FMT_MT2110R:	descr = "Mediatek 10bit Raster Mode"; break;
 		case V4L2_PIX_FMT_HEXTILE:	descr = "Hextile Compressed Format"; break;

-- 
2.34.1


