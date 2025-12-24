Return-Path: <linux-media+bounces-49451-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C40BCDB7EB
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 07:30:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C277730A2817
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 06:28:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EAE6329C43;
	Wed, 24 Dec 2025 06:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ICiPB2DA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LBOj0ztr"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD18231353E
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 06:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766557684; cv=none; b=b3EAYxhUx1I/qHuj2r1zQ2/YEmvQcQ6yO8NLtHisXxvUNd+4TruoVP+LcrPrlOLwCMnRE9iCRG+pp3u6+LvhKmse953cF55TaNWFpm+PiEMNfcNA/XiLRJnQBtslUQearSReImzx34gTaBc4nLsyUOxb/uccRdv/Z8MCvSQi5Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766557684; c=relaxed/simple;
	bh=M+GIoy2gxHtpG8kWRg8hudwnpGiElTFNCgid9xEAMgo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=izqQ9SI8BaOiJKH1elGB6AiP56BKC3hN+T4NRtFwyvCeRTSrg7bPjAbBiOGOz1yUh76EAChT+kGx/zHUndYfVE05J5aIPGPuB9goUjouGCLKa2vLNsPZVg+Nh3rCVw1047ckAJCc4+ZobYSlyQJF2NU86nyEQy/sH6UNTvCoaC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ICiPB2DA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LBOj0ztr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO2Omwi461418
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 06:28:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dmGzRYHDeCe94sK8XcLR661ULH1uWhl3sDxeRfzlGhw=; b=ICiPB2DAWl0+fPhr
	e/EpGPOyxj58Mx4yW0PO03FdN7u5MInSDnJ0N6x6Ab+ksieFjB70T0V0EHMJo7Vz
	32GKqXB6kWvJDiFZkSNstl9oyCuLlMu70yEBG/DX2xZP0BVGvtMXD3EI0LRwRRqb
	+enP2R41m1YOPrRq1iyEtOi8bxrZcGMdJskeMxpvXeXfrKA5EpKIcQDmqNDGGPwQ
	JcxoDtkYgI7AqqkfaeI8OuJ52f2N/Dkb33i2jPwUrf7fnHqBACJ4Y/ciFx9uFkia
	/TuUyz2VIFPCMjBM40ZPQ7HD3QhF0OrzJpaLb80BEDHTa8yB8P3920ctju6HKaWR
	LkU/Kw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7w8ftaja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 06:28:01 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7c7957d978aso6806845b3a.1
        for <linux-media@vger.kernel.org>; Tue, 23 Dec 2025 22:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766557681; x=1767162481; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dmGzRYHDeCe94sK8XcLR661ULH1uWhl3sDxeRfzlGhw=;
        b=LBOj0ztrrqA/panP9E7ZZZ95Rt6ufoPx1qx++ROTez1cme4CJ16/qJ2dGUvlcn7yYP
         yNBAlNEgZ+M5lmF/fJSxAlukBl7HPpHlFgOHTj7qt/gdbZWfUkCIb5gDF+4VFhmN7WG8
         h2ogL7SlQSqweN+7bME5NqAtlSiALPe2x/DIhc4bk5JUdt9q26LHlOFFN8qJlJcDURK3
         CRUMJ2rQ/BeOvSzaW0QwuzqllnYTysMC7gozGm0LUFtNuZ+mG2H/Z9EtRJvKQokQzEJQ
         CP4EqQYjn/fYpr3RO9wbHy1JCGFlT9cf+4i0KeaBAOBlLZIf3XtX1aBcnde0wEYXOQ3l
         OdEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766557681; x=1767162481;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dmGzRYHDeCe94sK8XcLR661ULH1uWhl3sDxeRfzlGhw=;
        b=Rmu1A3yWEhBDbadRQ7rCHcAGR/B/sES/BUpjZf1vm/Sq1ASJhI/36qb5MkNrNXGlG/
         GtXSCnoz5znFCNeAkwpFnbQqQhjrZR1d6M14mO/P1dWrRje/PG14X9rx/WPPgdoeBh7h
         kMqPVgLg7AwcfRa0zcVa5bc69MQXDlxVpXIpqBBVfXBuGnKunj7R9kZXx/SRQF2kNITD
         cEd4p1CGiayg1KWw3JMcaYyLa5Im3RyCmuHmoffIHJQo7z2TRjPc6OhSFlzJGipEJwNc
         eIHnzRErWsnqiLohLHibSXGMZVE4R+NCurbNhdz25Tt/Kb1rhP4gDzFINYgf/M38kyym
         YTOQ==
X-Gm-Message-State: AOJu0Yx4xnHPi3y57EHp35pGPtcKcWxtgZzyuqYpoOT7F2inmkBjGYd0
	/vMMaD6NPSL/Axm1WhJHuxCjVehxNa7Ll0yAnx0eiiZisbRJtR2s3T0CV05E9tz60vqha752FBB
	PwTzOAlaVStOO5KboXYFVCW0o/l4GeMkjxjmhhpUJ3XVL85c4AkhYocLfBs7QZ9gG0ET6pFWQrQ
	==
X-Gm-Gg: AY/fxX6a3lS64P8BSo1wuvMOggLJ32zsba3a2o24LqUHIOvfykVATAdQ06pFg5GWZp1
	1IzYRApOPVooQDWA6GWi/ppz2m+7NweCMNe3m0ZUin3mEBIRDwn2edpCT/Sd+8oY6ejDEl0ttM1
	UuS6bguqlmQ0cDECuCHOWUpU2VA1Ak5L7QSR18Uk0/zme7gxJD/8MeEjX5HFMHGTyD6vCwe+AAc
	Dbt4vjENE7X/boiOc4Zun68MwQntjpaRSql8cv54iFHhnebI1HFW6FjFjsPXYW/oNAwy/JdQs1t
	j8yhIS0ZsQHtdduvM0LQ31JLlhaJclzg3xmm8CMJG0l1miKyojm8L4RtyczhDZa1TPNCALwag2j
	N6NEbc+x3EkwpunX1E8EDHAbBaY7X8UkuvHG51AwhXnJcsBo=
X-Received: by 2002:a05:6a00:a882:b0:7f7:26fe:c92f with SMTP id d2e1a72fcca58-7ff64cd5fcbmr14134918b3a.29.1766557680990;
        Tue, 23 Dec 2025 22:28:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEB13sITwFMzSekqucRZ1/QXtl9j1Db1CmzUObvaIsHVQrFZjz/0HNxVHV5k/BrretBQV1kIQ==
X-Received: by 2002:a05:6a00:a882:b0:7f7:26fe:c92f with SMTP id d2e1a72fcca58-7ff64cd5fcbmr14134899b3a.29.1766557680530;
        Tue, 23 Dec 2025 22:28:00 -0800 (PST)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7eb85f15sm15618908b3a.68.2025.12.23.22.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 22:28:00 -0800 (PST)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 11:57:13 +0530
Subject: [PATCH 4/6] Revert "media: iris: Add sanity check for stop
 streaming"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-iris-fixes-v1-4-5f79861700ec@oss.qualcomm.com>
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
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766557663; l=1712;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=M+GIoy2gxHtpG8kWRg8hudwnpGiElTFNCgid9xEAMgo=;
 b=8c67QftGs92IAU6RcgkPwepVKMaii/B+MdWcHSCwE5j/30t29xsZ66bXN6RjJp8KH1Cdpaump
 XgK5lSWiG7VCl/KbHEQOzUl8CioeAQ46D41BU9luxdd8qnix3A+px6S
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-GUID: 4J3CXzs1tgZF0lHkgUMT-SQEQMcNzJvK
X-Proofpoint-ORIG-GUID: 4J3CXzs1tgZF0lHkgUMT-SQEQMcNzJvK
X-Authority-Analysis: v=2.4 cv=QutTHFyd c=1 sm=1 tr=0 ts=694b87f1 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=miAyyWkRVIhBFoa6HtIA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA1MyBTYWx0ZWRfX1YTMK7A8ZouN
 ymrq5xJ63zikblZw76GUuuj9wbidkbw7vhkXwR6uBzirEifrcu2z82cm2DTNdyTcBedOs0vfAh5
 NwDspYTituqduVakQAHiFMGq+3UTXL4hJIJYTu82ug2LvET7UIsy8ZiKtP9IidlCBspkoxBmNuQ
 QkEP33frSDs1P1KG/KqBPKKYbOIfOAfsoeBoFmWdciKR7vyGV43yh2DPirv1RR/MeLFm8vkaZx8
 e7bTuI30ocDiQ+nOKevY8vDM1ySe0J7u+7ztQskyvpp5z3JaBwVs+/3ADF5UMtIZrq0NDQbVpk/
 dssawj/WA5lFuoKaV2kQHszEPJmkEvolyOLrEpzVZBf2ENttWl+Ok+snlD5Ago3VLJwdDV8I8jo
 z39btG9Yam4ToOvliNHSDw+LwEBJlNpiMacfqTWursV5QnMSanxOlR2ne4BnkjuEU9SIkM/IFM+
 FJsTaKqohFTsSpYrfJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240053

Revert the check that skipped stop_streaming when the instance was in
IRIS_INST_ERROR, as it caused multiple regressions:

1. Buffers were not returned to vb2 when the instance was already in
   error state, triggering warnings in the vb2 core because buffer
   completion was skipped.

2. If a session failed early (e.g. unsupported configuration), the
   instance transitioned to IRIS_INST_ERROR. When userspace attempted
   to stop streaming for cleanup, stop_streaming was skipped due to the
   added check, preventing proper teardown and leaving the firmware
   in an inconsistent state.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vb2.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
index db8768d8a8f61c9ceb04e423d0a769d35114e20e..139b821f7952feb33b21a7045aef9e8a4782aa3c 100644
--- a/drivers/media/platform/qcom/iris/iris_vb2.c
+++ b/drivers/media/platform/qcom/iris/iris_vb2.c
@@ -231,8 +231,6 @@ void iris_vb2_stop_streaming(struct vb2_queue *q)
 		return;
 
 	mutex_lock(&inst->lock);
-	if (inst->state == IRIS_INST_ERROR)
-		goto exit;
 
 	if (!V4L2_TYPE_IS_OUTPUT(q->type) &&
 	    !V4L2_TYPE_IS_CAPTURE(q->type))
@@ -243,10 +241,10 @@ void iris_vb2_stop_streaming(struct vb2_queue *q)
 		goto exit;
 
 exit:
-	if (ret) {
-		iris_helper_buffers_done(inst, q->type, VB2_BUF_STATE_ERROR);
+	iris_helper_buffers_done(inst, q->type, VB2_BUF_STATE_ERROR);
+	if (ret)
 		iris_inst_change_state(inst, IRIS_INST_ERROR);
-	}
+
 	mutex_unlock(&inst->lock);
 }
 

-- 
2.34.1


