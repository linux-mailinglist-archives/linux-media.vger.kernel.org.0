Return-Path: <linux-media+bounces-49453-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D18B4CDB806
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 07:31:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 92B6330C18CA
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 06:28:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12676329E62;
	Wed, 24 Dec 2025 06:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lvJMdQTd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bwereyeO"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D155931353E
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 06:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766557691; cv=none; b=JeU0hWYgjA/iy1frLoC816BvnGpK0UVIXFfXR3uzjfD6+fnvUYjYm3P0u4XyRt/luAsVTRKZnrDyoANP3n9YlOaB13ICkD8/6m0gZW1JjW754ZzDY23VOlXLHoh50uqBsjHR4eWh4ets6jNSIpkcpICwQLyP4/es9RKNOaZ4ZYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766557691; c=relaxed/simple;
	bh=xtcCRp++LaWYqpdmb2jGTHOJ0mXUq+jjwQQKy3bKQ+Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P1lnuW+AS/VGwTXcbYNEbmr00f8D8w/YGDILI/T1FmB4ottlsIX3XEMtAEeT2JJ1N7/hW2p2i+UpUqlRaus8IySjPsPg+jx+F7OkcNwg0wp/7SgqWgvadUcm6C7HH1Mz8GiVR5P264pLkuEQeZhAAR7yAf2XKMfsU6dCsyFCCDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lvJMdQTd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bwereyeO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO2u8q3461342
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 06:28:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iOdzmcIwX9TAQP5ZayadVCjvndDWClqgACwOqjT6E+I=; b=lvJMdQTdFbK7jmUM
	oieJFKC39OarlvkcxMVITu1cRWQJzJmUTAtHInbsKm+ie9ctn2bEiLkQr8MoZLll
	lIuYgneABA6GsZqznkcCJmF6pA53FTmZeSjo7cnlJmB6WrPcEF7An7Y4j4gYZX/T
	e7XblsWKcNcz9AWNX8420eCysVSvqsetz1iKu1NZGRO0NzCoBRD7Kzamw/fU4v9y
	UpY7mWvKQElkJtcP+M0Efg8Ab9Iy7FH0V2sE8Nh0avs93sJurdQF6NIQyQuHuDxR
	rEkCGFxcsEZ4k2vIpPdcNI4Px4FMisLpEkBXkn/E9Cc7+ikdxWsvraAUyx7Mo2jM
	wiIlqw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7w8ftak0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 06:28:08 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b90740249dso9910428b3a.0
        for <linux-media@vger.kernel.org>; Tue, 23 Dec 2025 22:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766557688; x=1767162488; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iOdzmcIwX9TAQP5ZayadVCjvndDWClqgACwOqjT6E+I=;
        b=bwereyeOFEZ/iaXumHAwNz4t/z+I1KbjjUQjgTxXCoPdyxG0R0Or6WK57q2dIKxRTK
         /JhXQU+MS5R/We8va5GIQ+fcwZ/koEWujII9nYAfL0jUaREPcCY/angfOWZHwnks6nQj
         mHb83dC0KI3NYJlLlzo1ipMepmJynrKPFZdq1ZDHkbJITPCq6o8j0U+wp+3chxKprPwY
         vq0HPU8rweTv1MLGbklqDGGUXNhlthKQ/YSPnCrTMXGYKXJniu9v1Jd5zIc0KWF7W8uZ
         j+JnggjcjOi+7ThBezRJFtLBUBxrKS2+rEj8jTtCYSSMGrRfSg3G1Y89SBjskSNPjVUl
         OBcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766557688; x=1767162488;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iOdzmcIwX9TAQP5ZayadVCjvndDWClqgACwOqjT6E+I=;
        b=lORTpH68rsDvVZcyNWFjOSMXl1FIGK7r2+KNGEVy887sJYGQDj3ZsVVcULFRJu/lUs
         miwwDiyFmIpLvEpHZ0bjv1hwYacbps0Bbid9kHPDHs3T3bEWSy+T+KxQrHIbQ5N/VKwA
         3+l5x1lXqiLDd5f8OqxkUMzdxh63N2hgZ536birNoaCgClnyRpMp5QJblykIdTODIx4+
         fqXFdYH1b7u8Zf6Kah1EwQwDgcpX+SVX1QPJUA1bfe4csV4e5/k6x2CAY0A0hTFSACwE
         sL6KDjfxHI6psNyP996v+UgygBsSPVOPBoHszbEZoo5dTMndm1VlZqsY/bOJhkjDtEn7
         5Lwg==
X-Gm-Message-State: AOJu0YyrS1yFDTYHPf9poEfcLdI1LA4PWgSeeRWn5x+TbMmunJ1lwG3l
	1C2zm78pkbhJL30rLZzq4hzu4v/tkhz8IFJYjN959f+mzk5eUFTIESRDCNMwb/G4acezBDMk0Rw
	S83Z54arM8k+xXlDU2V2Vf4UfT8f2lAviQDfJ4GEkOYPm3vOV6FaUf7qeTaXan23jLY0ySOUqPA
	==
X-Gm-Gg: AY/fxX5qmEM/oDxJOG+HYhY8B5MLsRS7qg9j30LQ8GB0x5vnH1adhLuXz9OSECetYqc
	kprGqFS92xVYrFohBKsinQgaNVSFgiJgzGVbHUIP+BA68Os5FUBaseKjcNwSWuljUhQAgCO+e3H
	opy5cNzpvWQwcTu22cObazFQrr5CwReZboEn9TFq8XJibnaJNweLHQZsCQNC5O+TGWdhPG2zR1j
	vahGXtQB4RxBYK8C+Qwcp7ANpvmgp2yXwZH3V9yEomjTWLpY5vetJidtW9vOvIJZ64SThbbUliz
	0O6YHaWJrYucE/HQNhnco1YvpNeW7mrZoscGnbcZytqAeq4NRzvs9gvB5QSLT4/ieTlifV+yZEG
	8zj58+1IVgAj+8KonIGFyvK/dmKww2Fwcn0w425jk6Hr3reA=
X-Received: by 2002:a05:6a00:1d08:b0:7e8:450c:61c6 with SMTP id d2e1a72fcca58-7ff6667b6bemr13836243b3a.54.1766557687754;
        Tue, 23 Dec 2025 22:28:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG6/VVdv5LYR0NlRCzKDcgcQQZY58Z9RxGAUWMdermZHeHEAtShlzmWAMeTdGav8ECyJNAdsw==
X-Received: by 2002:a05:6a00:1d08:b0:7e8:450c:61c6 with SMTP id d2e1a72fcca58-7ff6667b6bemr13836210b3a.54.1766557687300;
        Tue, 23 Dec 2025 22:28:07 -0800 (PST)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7eb85f15sm15618908b3a.68.2025.12.23.22.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 22:28:06 -0800 (PST)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 11:57:15 +0530
Subject: [PATCH 6/6] media: iris: Prevent output buffer queuing before
 stream-on completes
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-iris-fixes-v1-6-5f79861700ec@oss.qualcomm.com>
References: <20251224-iris-fixes-v1-0-5f79861700ec@oss.qualcomm.com>
In-Reply-To: <20251224-iris-fixes-v1-0-5f79861700ec@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766557663; l=1980;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=9cv66z5/Jx2IEk3a10U2yz6GWrmYnmCrelbm3ThLw6M=;
 b=8RqraBMlk1Pmn+B8DOYKVlIAApcZqiNp6DcP3/Y21GGjMxtB7/a8ZQ/cQgouv1JfWrfqQwPHW
 pTpzt88mns6A8NIMDMn+VerisdGMeoJwJiQi7bZqSdqQ3GeVGd5UWYE
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-GUID: XQldeTwxP3Oo7Gyp11tCsxMXgVkN5LT5
X-Proofpoint-ORIG-GUID: XQldeTwxP3Oo7Gyp11tCsxMXgVkN5LT5
X-Authority-Analysis: v=2.4 cv=QutTHFyd c=1 sm=1 tr=0 ts=694b87f8 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=XLzqMKnRyDA5696EbmIA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA1MyBTYWx0ZWRfX4z7UB1+E99EZ
 UpNxxrEf3f4d6BRdGxgP/kgP/KyQxFcgrnC0CzdoV6C4E+kyagycv+8hEszaISFWUhtPwv6dkRp
 JJOM1uOPheJ2X6nOA67y8Fy7vp6KBum16S1RHDPgRxlaf6Gdhjtd2aEXzmVSVG0Sk4/x6xVsLkg
 QMe0Gl1lqkMc/4kofFzCr+LOD7PGX6qyX2pxSXxKyQMc7H7dRTdaL4L6AHB3zhJwSpmr+a996kb
 iL+1a4tu6POFmQ7COtEs/Aor6mCYnWyEctsH02457WiZViLHeeCTJdi5BOWTz6g/Y5codv8Z0xg
 exzzHqqQ1LqA0CA0XkA2O+TSFZGqCP56s2NP7Wklwe4BN/S9KDSw4TKhTWzA/3NLkV8q/dOvJgz
 M6ZSDsG7xwrn5GNChMKZDfofW1/xMQbl57cvUJgLjjjm02Il1vEsAbsP19mnNJ8b5OxGSS2LehL
 Y2vClvl4rude0KYGD5Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240053

From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

During normal playback, stream-on for input is followed by output, and
only after input stream-on does actual streaming begin. However, when
gst-play performs a seek, both input and output streams are stopped,
and on restart, output stream-on occurs first. At this point, firmware
has not yet started streaming. Queuing output buffers before the firmware
begins streaming causes it to process buffers in an invalid state, leading
to an error response. These buffers are returned to the driver as errors,
forcing the driver into an error state and stopping playback.

Fix this by deferring output buffer queuing until stream-on completes.
Input buffers can still be queued before stream-on as required.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vb2.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
index 139b821f7952feb33b21a7045aef9e8a4782aa3c..bf0b8400996ece5c9d449b99609a302da726bf9a 100644
--- a/drivers/media/platform/qcom/iris/iris_vb2.c
+++ b/drivers/media/platform/qcom/iris/iris_vb2.c
@@ -193,10 +193,14 @@ int iris_vb2_start_streaming(struct vb2_queue *q, unsigned int count)
 	buf_type = iris_v4l2_type_to_driver(q->type);
 
 	if (inst->domain == DECODER) {
-		if (inst->state == IRIS_INST_STREAMING)
+		if (buf_type == BUF_INPUT)
+			ret = iris_queue_deferred_buffers(inst, BUF_INPUT);
+
+		if (!ret && inst->state == IRIS_INST_STREAMING) {
 			ret = iris_queue_internal_deferred_buffers(inst, BUF_DPB);
-		if (!ret)
-			ret = iris_queue_deferred_buffers(inst, buf_type);
+			if (!ret)
+				ret = iris_queue_deferred_buffers(inst, BUF_OUTPUT);
+		}
 	} else {
 		if (inst->state == IRIS_INST_STREAMING) {
 			ret = iris_queue_deferred_buffers(inst, BUF_INPUT);

-- 
2.34.1


