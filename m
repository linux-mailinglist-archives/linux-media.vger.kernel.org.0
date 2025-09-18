Return-Path: <linux-media+bounces-42704-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6702AB82CEC
	for <lists+linux-media@lfdr.de>; Thu, 18 Sep 2025 05:51:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A5551C06B78
	for <lists+linux-media@lfdr.de>; Thu, 18 Sep 2025 03:52:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96F3724679C;
	Thu, 18 Sep 2025 03:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VqnvnRXl"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079E923D28B
	for <linux-media@vger.kernel.org>; Thu, 18 Sep 2025 03:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758167482; cv=none; b=MDJF5n3LYthnHHpgXvi5hQSK3yWAe59UJJyHbQtt1ZqtR22+YvWnflyTcARpX6oJf5GVEI0O0jPkiIqiS17pscXyFBU/0hg0YFbd2le7TsasRog+uC4s19duVr0+MyzBegom/hPbMfZ+zChe1vjN33n1OhWgereRf7TGQwfAgM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758167482; c=relaxed/simple;
	bh=n1jsPxkiDoDjeGzSxaWrdwHm2EzDZrO/DhyX5ok9ZkU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eiqK+lK4fbZF89i8SYkfB1hR++gF9sNai9zHv9ata65t1aJpCVUulreRlb/J9D/YOvCh2H7oi1Kly1xGmlj38q/H9HMGwqAX40F9+lGQgDL4+gaRkQb/tCJPspgxoLSmjbC3mzupeEtbNN2Svq1ynPDud6iSz6FduWeHvva0phY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VqnvnRXl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58I3E6CR021427
	for <linux-media@vger.kernel.org>; Thu, 18 Sep 2025 03:51:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RkZe+kneCZcqUTCXv49AXWAvghtTrXyc5dpFgLO8PBU=; b=VqnvnRXlP6KvEO+S
	vWs5UjO9/qWSjXicrJPqWCIaTDXvc0wkf0cTG3PrHUVU8XjAb+9GYh8BSHI0QXZp
	8Tc1387V3r+kexpJvziCkqxIC3TfUwSKEgmPBYdhzvWHhdJpbffRpsJfdrm+gdFO
	6aheDDAJK4WdKZisnjsnhMe3034vxDTeGj7f0khE/cZwV5v6hGene++vu4Ikp7U/
	fSmjgm5PuJVX5Yt/kmgA7oq8u3sa07abNGfPSUv7b6bY4fj/YuXqnzUdL+V7B2n/
	hf61GQ1UxdjTyi5WqbEdZvvU2bE4+bzYkG/kKapICujal32/Wte/xT9+7n6yLYlj
	ZFG2jw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy5ctr7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 18 Sep 2025 03:51:19 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-718cb6230afso9637366d6.0
        for <linux-media@vger.kernel.org>; Wed, 17 Sep 2025 20:51:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758167478; x=1758772278;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RkZe+kneCZcqUTCXv49AXWAvghtTrXyc5dpFgLO8PBU=;
        b=AT/tHHr/3aslWgHeJ0GilsKNNrLXL36TvGm3Z52a7Kl0F1o+IQIecOREURdW1vzjUu
         eKwKI8En4O8BWKH3xt1TpJbtKemdxbYKbLO4PeRlQ8qE9iXfkBL6fIfTtvVXYZbJNtQG
         F6PUxXUWg9EY+NTbyECmtDZvMc2zSQfkSlP2Hg3wTqCAIU7DIQXkb6SoElXC+2qCnQHH
         z+dxuO9m9xlJ7h7JcUbMkhWpuLBTimPbVFG0bZnD2MvV+1dudETsJwUMB/Rc34mqdmnf
         HM20x1hh7bJMwkQx2YLeN2mLFdveo5vmZ+F87E07BPnhxiF0BiFdqi/szv7C7v/OrEdf
         YK1A==
X-Forwarded-Encrypted: i=1; AJvYcCUPRFMrpOKs5p8TATOMRhp2j7bxsPCBS8KX/Gd0TnIlFWJQ5VrkdxRnQTEUJqDSIEiBrRzdh+YBW/F3Yg==@vger.kernel.org
X-Gm-Message-State: AOJu0YykYkhpxgpo8uBQN9jkiHb3ykwQpCn2+Pfifr6quO6uAJFB/Cmm
	qS4GD1wsaxmVp/PAzeg+UXtMnPzUETlPvK0I26/DHbCP0emXXpJnHQX/QdkK0onOI/Wy3HaaJYW
	kyqaTwoRli7Hy80gPLCMUk3XlHgCf/9+1txBkLgccXgAesLyNZE84zy7af+uYYaxj6q4jn/9v0g
	==
X-Gm-Gg: ASbGncuu+d88mL3+L0FBiFFjgziw9vQolheHz0oQBfE5OcFx5kUbg/d5yqKdTOy0rC7
	ZYgTkH0cHkR4m+yKUx8QYqXR0u6LQOhiYvRNWv1L34RQw7dErbSAx4Yof15DxXJIK1NQmnCF94U
	78IdbxY5CiTHrEbEuo33HKleskUe1TIrf85sinW9IHFcBUoFdZOkplFIj1PxrKeuFTjdOzgqg5E
	PBEggKGfUIbDDBmA64UsQQ8I0KMllIzIPO/yOQ2xE11LF9sq4fezx4cx7gfjKXswDi5ZvpK7D/m
	lP+bodfE7BlBQN7KuZ4KZE8E7UN7Mss3lxHCcFiV108YlnIIt0fML2JbPTrG3E7sUgzvcYDOeRN
	N6kWRyMSGXFW4mwOSSzKqa1wS3IllYpp+RPowfRFfJ9TuscyDrceU
X-Received: by 2002:a05:6214:4104:b0:721:cbee:3a5c with SMTP id 6a1803df08f44-78ecef1ae02mr47254916d6.48.1758167478138;
        Wed, 17 Sep 2025 20:51:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSx6ImXWka4qzu25nsGIPKG3jxYLOXD5VmYgqTlB6n69eBvtJTy4miHF7fghHQwXJ6uEWe3g==
X-Received: by 2002:a05:6214:4104:b0:721:cbee:3a5c with SMTP id 6a1803df08f44-78ecef1ae02mr47254786d6.48.1758167477633;
        Wed, 17 Sep 2025 20:51:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-361aa38c4f7sm2799911fa.62.2025.09.17.20.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 20:51:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 06:50:22 +0300
Subject: [PATCH v5 1/5] drm/msm: correct separate_gpu_kms description
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-msm-gpu-split-v5-1-44486f44d27d@oss.qualcomm.com>
References: <20250918-msm-gpu-split-v5-0-44486f44d27d@oss.qualcomm.com>
In-Reply-To: <20250918-msm-gpu-split-v5-0-44486f44d27d@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1406;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=n1jsPxkiDoDjeGzSxaWrdwHm2EzDZrO/DhyX5ok9ZkU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoy4Gth5pDDKZjVIenXb81Ygke05JopoBwjyJK1
 zEuck0IZpSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaMuBrQAKCRCLPIo+Aiko
 1WQkB/4lg9tvQI4us/U5LqqNXJTGG36WkG5XJKtFnQcWFkKRzDRqk1ZNk4h9Mb3mPueYFIhsp8V
 BbzTyeamtCaqZ04D1qJMYL5eJwlgY4uL1spsdfLVR6Gi0qlqlEMDNidNoU4Dag9RWFOKia0N/Js
 Gr9EHf6lYOvHRjIiG1Hv8bT5u51c+GuTWMq9/QvZeSdizjJTeUSf87xvUG1VXyuLJALiOctg4RO
 okIthfyiGYNZm2Zl7TuRexJqoWjBn42AfFrtxnWDa4axY7m4DH+OLxrGjfVcNH6YSRarKwHvcKd
 ulw8+OVYkJs/GR3EXnuymyTQIpbFggCf3XuZO67duHMS3ilD
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: i19m1vrHOsBEXpwl3kdEKcP2j34lhpvN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX4Ageyi0IlgIV
 gBfwfZTddbVjxXuHeEMst3goen/xhucdj7vhIt6XpwVlXycurBjZJJcsyc+UmnBHdS1nYfaPlcV
 ERxvYYCVyQqSEvp1l4Z3e36/sTxARdL044kzTSbhjjOEVuXTXe84xeKuJHceDz6qttpap2C6k+L
 V7Y7NLDmb2FnMLwxlBAAwRe/rhPOjYbiAy01mGCWjrR8lTX4wD1z1foh8qvWMzdxftUAQaz+EEb
 j9QAMRUFxqZOcxljqPxUHczjQEA0dglmOy4Vy6CMIzmmq7wfphbB++KN7tSDu1tbTpTe8iHPVeK
 QqMtim09eUNtpl7BBbX0ZoT1KK1TbDXgsnkktf8u1uuNMAbuOVNtV2Aj39opfzzLj9reMRsva9o
 Iezcgwg3
X-Authority-Analysis: v=2.4 cv=Y+f4sgeN c=1 sm=1 tr=0 ts=68cb81b7 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=NR_zzOBYvoclL3rq_QoA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: i19m1vrHOsBEXpwl3kdEKcP2j34lhpvN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202

While applying commit 217ed15bd399 ("drm/msm: enable separate binding of
GPU and display devices") the module param was renamed from
separate_gpu_drm to separate_gpu_kms. However param name inside
MODULE_PARAM_DESC wasn't updated to reflect the new name.

Update MODULE_PARAM_DESC to use current name for the module param.

Fixes: 217ed15bd399 ("drm/msm: enable separate binding of GPU and display devices")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 7e977fec4100792394dccf59097a01c2b2556608..06ab78e1a2c583352c08a62e6cf250bacde9b75b 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -55,7 +55,7 @@ MODULE_PARM_DESC(modeset, "Use kernel modesetting [KMS] (1=on (default), 0=disab
 module_param(modeset, bool, 0600);
 
 static bool separate_gpu_kms;
-MODULE_PARM_DESC(separate_gpu_drm, "Use separate DRM device for the GPU (0=single DRM device for both GPU and display (default), 1=two DRM devices)");
+MODULE_PARM_DESC(separate_gpu_kms, "Use separate DRM device for the GPU (0=single DRM device for both GPU and display (default), 1=two DRM devices)");
 module_param(separate_gpu_kms, bool, 0400);
 
 DECLARE_FAULT_ATTR(fail_gem_alloc);

-- 
2.47.3


