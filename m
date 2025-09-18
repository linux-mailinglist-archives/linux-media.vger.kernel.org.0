Return-Path: <linux-media+bounces-42705-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D68B82D19
	for <lists+linux-media@lfdr.de>; Thu, 18 Sep 2025 05:52:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7560B1C21C3B
	for <lists+linux-media@lfdr.de>; Thu, 18 Sep 2025 03:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52A9A251795;
	Thu, 18 Sep 2025 03:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W+NSEzaq"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48805248F7C
	for <linux-media@vger.kernel.org>; Thu, 18 Sep 2025 03:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758167489; cv=none; b=n0aPGWkWTkPUXlrRdQI/1etmX+cpWxCsBxJXpIgqoIRA5X07e9eB0Uk4SacEp0xdxcbK5Vu+EvaHjDkTVy5n6nEn9kQDi+vLPUkBZeIXD1kTcdLbbpcLDOuMxAYZ+Jdb1ui1Hpcy4GAvMMGLdo8t8STR1hZbjG/KtjQN9BiAmKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758167489; c=relaxed/simple;
	bh=C3v8bPEKnu4N1pNpZUfC3RGMYAdkcdrJw1D6hEMyow4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xf8n25C4u17kG19arAJYAoB49gs6vIwfZT4D/PHjF5bw2M4hAUIu1wlW5qHOh/QaIQhLgWx1urcGf7ftcvasSLMva3qmJuEatT9BT1MtoZzijwZcGLKiv0PrQ6loHjLpxyHvvvCSCdP2RglULXv6CSoNbPB8LmgHMkdYUg+sQuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W+NSEzaq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HGIkHW010741
	for <linux-media@vger.kernel.org>; Thu, 18 Sep 2025 03:51:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KjDatx3pgsFlaMVHvhcmbGG7Lr4uVfJAQPjgyzQxqhk=; b=W+NSEzaqQm8lMEbA
	W+MumcTEawMMevVjP1G4G8VstIBbDthjRKKNHeVcbKo8LxrP8eKflQ9XlaathEg7
	ygpOWdvNWIB2qyApt1Vm9XnGCVIiw5tkjwkpDVUn0uBNJNtnHAiSPAgbxBYyszZt
	9PuwwK3Vrh+oXkiNYsf45LBUJxbH+63XB0UpfxDe8y//nSeUiloOauM86JEjDoBS
	VhM09dRfn6MhOuF67a41xHx7gjt4r8kDTaptQThTiknCJMimYNvEHbjlz602RMrj
	vQ15fo9iB60IFsIRotAp1z95F1+Tvw2IQ8Z3WEvZ6UhC3FJUwdaJPB8dyzd0t36Y
	yhaFGQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxxvswq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 18 Sep 2025 03:51:26 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b5f290579aso10206291cf.0
        for <linux-media@vger.kernel.org>; Wed, 17 Sep 2025 20:51:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758167485; x=1758772285;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KjDatx3pgsFlaMVHvhcmbGG7Lr4uVfJAQPjgyzQxqhk=;
        b=pkl0p7tl0J2jMPScp4vXV2TVTobAAaKbLVrDyyiPBdFds8TIsd3Llg5WbXa7mF0ZUO
         mIr4c8f1/bTQhB2ZRnBGHj9ZbLilMH0XxcPomsqcsQBaIj83K/XmZD1/v0FX3bbiWxHY
         A1QQh2ckr6IRu1t1Da0WiRWgVpCHEAjUArzM9rdJL1xD7cbgl8K8AiSvTaheqtobtSEG
         8PxIb8y9rTBi/he8LN4BRDot3yuBudoROwo7CfGlWUl0VQRK/Dh6QCXlkatXcw6Lnlyk
         ZwmjhLbK3BJ4pe5fDv5B8HRKtqshD85eOFb38LgNXlWpvU/CvydyTvLsyteTt5xTtJao
         1TZA==
X-Forwarded-Encrypted: i=1; AJvYcCX58G9waUEyp0IuIWn5CxI3mZjzuWWK+4d+oQlI5JO5I0oQXBVk29Gua2ihH9dEu6XHi0mK/Dt+eP0h0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzplS+nLJ0RNzdxcubFGn4hlZaSkhlTYCnH2wwd1hesF9gfv608
	RvmweLnhBSD/pC8o+i3f8J1dPJ/O3Z3JLMfbS9iLHtjqn7iOrE3Bx9cLUaf4nQ2kcEG2mtpk0JP
	+2h+jjCS6U0pUeMa0+gsQL+vTHVVs0R7XZtDXqGT5kciCfZGk0DDWuV9q9tlL1c6Erg4nUThdXA
	==
X-Gm-Gg: ASbGncu/kN84J3rxIlK+xbppw/TEF0vXBFp6x42TL5f1gOlswXLQ3qXZYVXIIGYSF01
	fafzVGF0XTgd8JN1Uxug7BaJvxv72smwFKO6a7wRNgtentbYtsAo0pULl1SfBjdhiRDtS6yfJmF
	WICN7FVxrkd9MUydTV7zl5znMKSfQffZQr5Eljo7J0D97b4P69t86RcKiFp1yMhsl3KlKi+xAY7
	ZjsJ2i1PnflQXXxVt8FxxnXjU9ZDHpWT2K4YHTBDjtu537NhURruKEO16uwqh9eUPOYr0QcTSva
	mUiECXkcaRCC/6lDVFYdacgm34K3cECP8CFkmWHrFCx4xUqC5csVIz83UBaIkhwGBxOHAbzzKJ+
	StS7Zf9Xp+tIyk1KNlL6HVErG326y5OpRHXYrnVrvDlU7KAwNFJHV
X-Received: by 2002:a05:622a:5905:b0:4b2:dee2:6498 with SMTP id d75a77b69052e-4ba687170d5mr48007791cf.28.1758167484722;
        Wed, 17 Sep 2025 20:51:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJkTi8JBmYXbqf8LSUj3LGysoGnPKWFUHLDlvKqUyZ5Vm2UBcSDocxn6eFr71DibkblZ+CZQ==
X-Received: by 2002:a05:622a:5905:b0:4b2:dee2:6498 with SMTP id d75a77b69052e-4ba687170d5mr48007431cf.28.1758167483987;
        Wed, 17 Sep 2025 20:51:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-361aa38c4f7sm2799911fa.62.2025.09.17.20.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 20:51:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 06:50:24 +0300
Subject: [PATCH v5 3/5] drm/msm: split away IOCTLs implementation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-msm-gpu-split-v5-3-44486f44d27d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=28439;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=C3v8bPEKnu4N1pNpZUfC3RGMYAdkcdrJw1D6hEMyow4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoy4GtRQ2xMV7P8tuFj4PzTI5ufPnX1JsYId/Xp
 sARZdAgr6uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaMuBrQAKCRCLPIo+Aiko
 1ZKFB/0clVWRly6rBGuraOpwnVpDLu3y37mmbtxKOrv57BfyRscItQCXixkWi+rZ2GA/YRChYkO
 kcZ+GD5E9X9dDVQq0bnKWTl7ywbUVLdSrF0JnAQGveNCZgetzCNNOBPhq6jEK2F+p5ufl7OpAhC
 UyMzl8ZmsbZVSXSPjXA9dOYvrO7pcRYvopFzpsWy94EIl1KPD/Xc5W8NndKAoqkcyC9SBo3LPEB
 ol1bGt8UVaeD7J4H8ljOuoaLbFp4FMy4pzl/xYssl7iBQUW/HdF7x4TyNk2eYzgSieIveVvzvVk
 MNZ+7H24BDtjALuTGbYoUH2lPCx/kL2GYDMcTVvY8YdV+Kjc
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX3OqKsVLP79pV
 b1IWtWH1l5XtbXHCUjLH8S6gwD6wxTMHqzgwh7sV9FUkRk48TWTz55JYEeul77agALuFos1dJbQ
 VSLGjf9TCr5qlg/MS0sCzdq8jDJcN5Hnx16TGlATJr1B54DWMyEr89zDcgDYZ5hLESjurdCYl8N
 Uep5L2MUoPLyVEYPZ4l7K0oRAqZZtg5uxV0vFxlpq76o5HN+QzQ5+9tJDZmRvdyPImEhgpmWVSj
 pDzh60py1tTGjubKQVE/TVM2qS7ku8E/dZZolSnyCslFJrfQJcKZJdrTYkZ+CqMwLK9LMTC6LlS
 ysqsyTDNSUegnoEv2Z4RSG+w4+B0KmxzCzhSchD1YHkB6mU8tXshO64YcQ4ZNpaWBBXfCuMWYHN
 Ho44UXjk
X-Proofpoint-ORIG-GUID: h4LokrhEmlApNUryERy99RQ8b3DW7SbZ
X-Authority-Analysis: v=2.4 cv=KJZaDEFo c=1 sm=1 tr=0 ts=68cb81be cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=APMymX6OwX3YqAwivccA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: h4LokrhEmlApNUryERy99RQ8b3DW7SbZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202

The IOCTL interface is only used for interfacing the GPU parts of the
driver. In preparation to disabling GPU functionality split MSM IOCTLs
to a separate source file.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/Makefile    |   1 +
 drivers/gpu/drm/msm/msm_drv.c   | 489 +---------------------------------------
 drivers/gpu/drm/msm/msm_ioctl.c | 484 +++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_ioctl.h |  37 +++
 4 files changed, 523 insertions(+), 488 deletions(-)

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index d7876c154b0aa2cb0164c4b1fb7900b1a42db46b..0ac977a6ed01d91111d706995f341ced29f5ca8d 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -119,6 +119,7 @@ msm-y += \
 	msm_gpu.o \
 	msm_gpu_devfreq.o \
 	msm_io_utils.o \
+	msm_ioctl.o \
 	msm_iommu.o \
 	msm_perf.o \
 	msm_rd.o \
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 06ab78e1a2c583352c08a62e6cf250bacde9b75b..ba984cc71d1d3aa341e0f4532b7093adcd25d3b0 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -8,8 +8,6 @@
 #include <linux/dma-mapping.h>
 #include <linux/fault-inject.h>
 #include <linux/debugfs.h>
-#include <linux/of_address.h>
-#include <linux/uaccess.h>
 
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
@@ -18,8 +16,8 @@
 
 #include "msm_drv.h"
 #include "msm_debugfs.h"
-#include "msm_gem.h"
 #include "msm_gpu.h"
+#include "msm_ioctl.h"
 #include "msm_kms.h"
 
 /*
@@ -296,491 +294,6 @@ static void msm_postclose(struct drm_device *dev, struct drm_file *file)
 	context_close(ctx);
 }
 
-/*
- * DRM ioctls:
- */
-
-static int msm_ioctl_get_param(struct drm_device *dev, void *data,
-		struct drm_file *file)
-{
-	struct msm_drm_private *priv = dev->dev_private;
-	struct drm_msm_param *args = data;
-	struct msm_gpu *gpu;
-
-	/* for now, we just have 3d pipe.. eventually this would need to
-	 * be more clever to dispatch to appropriate gpu module:
-	 */
-	if ((args->pipe != MSM_PIPE_3D0) || (args->pad != 0))
-		return -EINVAL;
-
-	gpu = priv->gpu;
-
-	if (!gpu)
-		return -ENXIO;
-
-	return gpu->funcs->get_param(gpu, file->driver_priv,
-				     args->param, &args->value, &args->len);
-}
-
-static int msm_ioctl_set_param(struct drm_device *dev, void *data,
-		struct drm_file *file)
-{
-	struct msm_drm_private *priv = dev->dev_private;
-	struct drm_msm_param *args = data;
-	struct msm_gpu *gpu;
-
-	if ((args->pipe != MSM_PIPE_3D0) || (args->pad != 0))
-		return -EINVAL;
-
-	gpu = priv->gpu;
-
-	if (!gpu)
-		return -ENXIO;
-
-	return gpu->funcs->set_param(gpu, file->driver_priv,
-				     args->param, args->value, args->len);
-}
-
-static int msm_ioctl_gem_new(struct drm_device *dev, void *data,
-		struct drm_file *file)
-{
-	struct drm_msm_gem_new *args = data;
-	uint32_t flags = args->flags;
-
-	if (args->flags & ~MSM_BO_FLAGS) {
-		DRM_ERROR("invalid flags: %08x\n", args->flags);
-		return -EINVAL;
-	}
-
-	/*
-	 * Uncached CPU mappings are deprecated, as of:
-	 *
-	 * 9ef364432db4 ("drm/msm: deprecate MSM_BO_UNCACHED (map as writecombine instead)")
-	 *
-	 * So promote them to WC.
-	 */
-	if (flags & MSM_BO_UNCACHED) {
-		flags &= ~MSM_BO_CACHED;
-		flags |= MSM_BO_WC;
-	}
-
-	if (should_fail(&fail_gem_alloc, args->size))
-		return -ENOMEM;
-
-	return msm_gem_new_handle(dev, file, args->size,
-			args->flags, &args->handle, NULL);
-}
-
-static inline ktime_t to_ktime(struct drm_msm_timespec timeout)
-{
-	return ktime_set(timeout.tv_sec, timeout.tv_nsec);
-}
-
-static int msm_ioctl_gem_cpu_prep(struct drm_device *dev, void *data,
-		struct drm_file *file)
-{
-	struct drm_msm_gem_cpu_prep *args = data;
-	struct drm_gem_object *obj;
-	ktime_t timeout = to_ktime(args->timeout);
-	int ret;
-
-	if (args->op & ~MSM_PREP_FLAGS) {
-		DRM_ERROR("invalid op: %08x\n", args->op);
-		return -EINVAL;
-	}
-
-	obj = drm_gem_object_lookup(file, args->handle);
-	if (!obj)
-		return -ENOENT;
-
-	ret = msm_gem_cpu_prep(obj, args->op, &timeout);
-
-	drm_gem_object_put(obj);
-
-	return ret;
-}
-
-static int msm_ioctl_gem_cpu_fini(struct drm_device *dev, void *data,
-		struct drm_file *file)
-{
-	struct drm_msm_gem_cpu_fini *args = data;
-	struct drm_gem_object *obj;
-	int ret;
-
-	obj = drm_gem_object_lookup(file, args->handle);
-	if (!obj)
-		return -ENOENT;
-
-	ret = msm_gem_cpu_fini(obj);
-
-	drm_gem_object_put(obj);
-
-	return ret;
-}
-
-static int msm_ioctl_gem_info_iova(struct drm_device *dev,
-		struct drm_file *file, struct drm_gem_object *obj,
-		uint64_t *iova)
-{
-	struct msm_drm_private *priv = dev->dev_private;
-	struct msm_context *ctx = file->driver_priv;
-
-	if (!priv->gpu)
-		return -EINVAL;
-
-	if (msm_context_is_vmbind(ctx))
-		return UERR(EINVAL, dev, "VM_BIND is enabled");
-
-	if (should_fail(&fail_gem_iova, obj->size))
-		return -ENOMEM;
-
-	/*
-	 * Don't pin the memory here - just get an address so that userspace can
-	 * be productive
-	 */
-	return msm_gem_get_iova(obj, msm_context_vm(dev, ctx), iova);
-}
-
-static int msm_ioctl_gem_info_set_iova(struct drm_device *dev,
-		struct drm_file *file, struct drm_gem_object *obj,
-		uint64_t iova)
-{
-	struct msm_drm_private *priv = dev->dev_private;
-	struct msm_context *ctx = file->driver_priv;
-	struct drm_gpuvm *vm = msm_context_vm(dev, ctx);
-
-	if (!priv->gpu)
-		return -EINVAL;
-
-	if (msm_context_is_vmbind(ctx))
-		return UERR(EINVAL, dev, "VM_BIND is enabled");
-
-	/* Only supported if per-process address space is supported: */
-	if (priv->gpu->vm == vm)
-		return UERR(EOPNOTSUPP, dev, "requires per-process pgtables");
-
-	if (should_fail(&fail_gem_iova, obj->size))
-		return -ENOMEM;
-
-	return msm_gem_set_iova(obj, vm, iova);
-}
-
-static int msm_ioctl_gem_info_set_metadata(struct drm_gem_object *obj,
-					   __user void *metadata,
-					   u32 metadata_size)
-{
-	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	void *new_metadata;
-	void *buf;
-	int ret;
-
-	/* Impose a moderate upper bound on metadata size: */
-	if (metadata_size > 128) {
-		return -EOVERFLOW;
-	}
-
-	/* Use a temporary buf to keep copy_from_user() outside of gem obj lock: */
-	buf = memdup_user(metadata, metadata_size);
-	if (IS_ERR(buf))
-		return PTR_ERR(buf);
-
-	ret = msm_gem_lock_interruptible(obj);
-	if (ret)
-		goto out;
-
-	new_metadata =
-		krealloc(msm_obj->metadata, metadata_size, GFP_KERNEL);
-	if (!new_metadata) {
-		ret = -ENOMEM;
-		goto out;
-	}
-
-	msm_obj->metadata = new_metadata;
-	msm_obj->metadata_size = metadata_size;
-	memcpy(msm_obj->metadata, buf, metadata_size);
-
-	msm_gem_unlock(obj);
-
-out:
-	kfree(buf);
-
-	return ret;
-}
-
-static int msm_ioctl_gem_info_get_metadata(struct drm_gem_object *obj,
-					   __user void *metadata,
-					   u32 *metadata_size)
-{
-	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	void *buf;
-	int ret, len;
-
-	if (!metadata) {
-		/*
-		 * Querying the size is inherently racey, but
-		 * EXT_external_objects expects the app to confirm
-		 * via device and driver UUIDs that the exporter and
-		 * importer versions match.  All we can do from the
-		 * kernel side is check the length under obj lock
-		 * when userspace tries to retrieve the metadata
-		 */
-		*metadata_size = msm_obj->metadata_size;
-		return 0;
-	}
-
-	ret = msm_gem_lock_interruptible(obj);
-	if (ret)
-		return ret;
-
-	/* Avoid copy_to_user() under gem obj lock: */
-	len = msm_obj->metadata_size;
-	buf = kmemdup(msm_obj->metadata, len, GFP_KERNEL);
-
-	msm_gem_unlock(obj);
-
-	if (*metadata_size < len) {
-		ret = -ETOOSMALL;
-	} else if (copy_to_user(metadata, buf, len)) {
-		ret = -EFAULT;
-	} else {
-		*metadata_size = len;
-	}
-
-	kfree(buf);
-
-	return 0;
-}
-
-static int msm_ioctl_gem_info(struct drm_device *dev, void *data,
-		struct drm_file *file)
-{
-	struct drm_msm_gem_info *args = data;
-	struct drm_gem_object *obj;
-	struct msm_gem_object *msm_obj;
-	int i, ret = 0;
-
-	if (args->pad)
-		return -EINVAL;
-
-	switch (args->info) {
-	case MSM_INFO_GET_OFFSET:
-	case MSM_INFO_GET_IOVA:
-	case MSM_INFO_SET_IOVA:
-	case MSM_INFO_GET_FLAGS:
-		/* value returned as immediate, not pointer, so len==0: */
-		if (args->len)
-			return -EINVAL;
-		break;
-	case MSM_INFO_SET_NAME:
-	case MSM_INFO_GET_NAME:
-	case MSM_INFO_SET_METADATA:
-	case MSM_INFO_GET_METADATA:
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	obj = drm_gem_object_lookup(file, args->handle);
-	if (!obj)
-		return -ENOENT;
-
-	msm_obj = to_msm_bo(obj);
-
-	switch (args->info) {
-	case MSM_INFO_GET_OFFSET:
-		args->value = msm_gem_mmap_offset(obj);
-		break;
-	case MSM_INFO_GET_IOVA:
-		ret = msm_ioctl_gem_info_iova(dev, file, obj, &args->value);
-		break;
-	case MSM_INFO_SET_IOVA:
-		ret = msm_ioctl_gem_info_set_iova(dev, file, obj, args->value);
-		break;
-	case MSM_INFO_GET_FLAGS:
-		if (drm_gem_is_imported(obj)) {
-			ret = -EINVAL;
-			break;
-		}
-		/* Hide internal kernel-only flags: */
-		args->value = to_msm_bo(obj)->flags & MSM_BO_FLAGS;
-		ret = 0;
-		break;
-	case MSM_INFO_SET_NAME:
-		/* length check should leave room for terminating null: */
-		if (args->len >= sizeof(msm_obj->name)) {
-			ret = -EINVAL;
-			break;
-		}
-		if (copy_from_user(msm_obj->name, u64_to_user_ptr(args->value),
-				   args->len)) {
-			msm_obj->name[0] = '\0';
-			ret = -EFAULT;
-			break;
-		}
-		msm_obj->name[args->len] = '\0';
-		for (i = 0; i < args->len; i++) {
-			if (!isprint(msm_obj->name[i])) {
-				msm_obj->name[i] = '\0';
-				break;
-			}
-		}
-		break;
-	case MSM_INFO_GET_NAME:
-		if (args->value && (args->len < strlen(msm_obj->name))) {
-			ret = -ETOOSMALL;
-			break;
-		}
-		args->len = strlen(msm_obj->name);
-		if (args->value) {
-			if (copy_to_user(u64_to_user_ptr(args->value),
-					 msm_obj->name, args->len))
-				ret = -EFAULT;
-		}
-		break;
-	case MSM_INFO_SET_METADATA:
-		ret = msm_ioctl_gem_info_set_metadata(
-			obj, u64_to_user_ptr(args->value), args->len);
-		break;
-	case MSM_INFO_GET_METADATA:
-		ret = msm_ioctl_gem_info_get_metadata(
-			obj, u64_to_user_ptr(args->value), &args->len);
-		break;
-	}
-
-	drm_gem_object_put(obj);
-
-	return ret;
-}
-
-static int wait_fence(struct msm_gpu_submitqueue *queue, uint32_t fence_id,
-		      ktime_t timeout, uint32_t flags)
-{
-	struct dma_fence *fence;
-	int ret;
-
-	if (fence_after(fence_id, queue->last_fence)) {
-		DRM_ERROR_RATELIMITED("waiting on invalid fence: %u (of %u)\n",
-				      fence_id, queue->last_fence);
-		return -EINVAL;
-	}
-
-	/*
-	 * Map submitqueue scoped "seqno" (which is actually an idr key)
-	 * back to underlying dma-fence
-	 *
-	 * The fence is removed from the fence_idr when the submit is
-	 * retired, so if the fence is not found it means there is nothing
-	 * to wait for
-	 */
-	spin_lock(&queue->idr_lock);
-	fence = idr_find(&queue->fence_idr, fence_id);
-	if (fence)
-		fence = dma_fence_get_rcu(fence);
-	spin_unlock(&queue->idr_lock);
-
-	if (!fence)
-		return 0;
-
-	if (flags & MSM_WAIT_FENCE_BOOST)
-		dma_fence_set_deadline(fence, ktime_get());
-
-	ret = dma_fence_wait_timeout(fence, true, timeout_to_jiffies(&timeout));
-	if (ret == 0) {
-		ret = -ETIMEDOUT;
-	} else if (ret != -ERESTARTSYS) {
-		ret = 0;
-	}
-
-	dma_fence_put(fence);
-
-	return ret;
-}
-
-static int msm_ioctl_wait_fence(struct drm_device *dev, void *data,
-		struct drm_file *file)
-{
-	struct msm_drm_private *priv = dev->dev_private;
-	struct drm_msm_wait_fence *args = data;
-	struct msm_gpu_submitqueue *queue;
-	int ret;
-
-	if (args->flags & ~MSM_WAIT_FENCE_FLAGS) {
-		DRM_ERROR("invalid flags: %08x\n", args->flags);
-		return -EINVAL;
-	}
-
-	if (!priv->gpu)
-		return 0;
-
-	queue = msm_submitqueue_get(file->driver_priv, args->queueid);
-	if (!queue)
-		return -ENOENT;
-
-	ret = wait_fence(queue, args->fence, to_ktime(args->timeout), args->flags);
-
-	msm_submitqueue_put(queue);
-
-	return ret;
-}
-
-static int msm_ioctl_gem_madvise(struct drm_device *dev, void *data,
-		struct drm_file *file)
-{
-	struct drm_msm_gem_madvise *args = data;
-	struct drm_gem_object *obj;
-	int ret;
-
-	switch (args->madv) {
-	case MSM_MADV_DONTNEED:
-	case MSM_MADV_WILLNEED:
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	obj = drm_gem_object_lookup(file, args->handle);
-	if (!obj) {
-		return -ENOENT;
-	}
-
-	ret = msm_gem_madvise(obj, args->madv);
-	if (ret >= 0) {
-		args->retained = ret;
-		ret = 0;
-	}
-
-	drm_gem_object_put(obj);
-
-	return ret;
-}
-
-
-static int msm_ioctl_submitqueue_new(struct drm_device *dev, void *data,
-		struct drm_file *file)
-{
-	struct drm_msm_submitqueue *args = data;
-
-	if (args->flags & ~MSM_SUBMITQUEUE_FLAGS)
-		return -EINVAL;
-
-	return msm_submitqueue_create(dev, file->driver_priv, args->prio,
-		args->flags, &args->id);
-}
-
-static int msm_ioctl_submitqueue_query(struct drm_device *dev, void *data,
-		struct drm_file *file)
-{
-	return msm_submitqueue_query(dev, file->driver_priv, data);
-}
-
-static int msm_ioctl_submitqueue_close(struct drm_device *dev, void *data,
-		struct drm_file *file)
-{
-	u32 id = *(u32 *) data;
-
-	return msm_submitqueue_remove(file->driver_priv, id);
-}
-
 static const struct drm_ioctl_desc msm_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(MSM_GET_PARAM,    msm_ioctl_get_param,    DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(MSM_SET_PARAM,    msm_ioctl_set_param,    DRM_RENDER_ALLOW),
diff --git a/drivers/gpu/drm/msm/msm_ioctl.c b/drivers/gpu/drm/msm/msm_ioctl.c
new file mode 100644
index 0000000000000000000000000000000000000000..837be6849684fa72887cb7d709489d54e01c1a5c
--- /dev/null
+++ b/drivers/gpu/drm/msm/msm_ioctl.c
@@ -0,0 +1,484 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2016-2018, 2020-2021 The Linux Foundation. All rights reserved.
+ * Copyright (C) 2013 Red Hat
+ * Author: Rob Clark <robdclark@gmail.com>
+ */
+
+#include <linux/dma-fence.h>
+#include <linux/fault-inject.h>
+#include <linux/ktime.h>
+#include <linux/uaccess.h>
+
+#include <drm/drm_drv.h>
+#include <drm/drm_file.h>
+#include <drm/drm_ioctl.h>
+
+#include "msm_drv.h"
+#include "msm_gpu.h"
+#include "msm_ioctl.h"
+
+/*
+ * DRM ioctls:
+ */
+
+static inline ktime_t to_ktime(struct drm_msm_timespec timeout)
+{
+	return ktime_set(timeout.tv_sec, timeout.tv_nsec);
+}
+
+int msm_ioctl_get_param(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct msm_drm_private *priv = dev->dev_private;
+	struct drm_msm_param *args = data;
+	struct msm_gpu *gpu;
+
+	/* for now, we just have 3d pipe.. eventually this would need to
+	 * be more clever to dispatch to appropriate gpu module:
+	 */
+	if ((args->pipe != MSM_PIPE_3D0) || (args->pad != 0))
+		return -EINVAL;
+
+	gpu = priv->gpu;
+
+	if (!gpu)
+		return -ENXIO;
+
+	return gpu->funcs->get_param(gpu, file->driver_priv,
+				     args->param, &args->value, &args->len);
+}
+
+int msm_ioctl_set_param(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct msm_drm_private *priv = dev->dev_private;
+	struct drm_msm_param *args = data;
+	struct msm_gpu *gpu;
+
+	if ((args->pipe != MSM_PIPE_3D0) || (args->pad != 0))
+		return -EINVAL;
+
+	gpu = priv->gpu;
+
+	if (!gpu)
+		return -ENXIO;
+
+	return gpu->funcs->set_param(gpu, file->driver_priv,
+				     args->param, args->value, args->len);
+}
+
+int msm_ioctl_gem_new(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct drm_msm_gem_new *args = data;
+	uint32_t flags = args->flags;
+
+	if (args->flags & ~MSM_BO_FLAGS) {
+		DRM_ERROR("invalid flags: %08x\n", args->flags);
+		return -EINVAL;
+	}
+
+	/*
+	 * Uncached CPU mappings are deprecated, as of:
+	 *
+	 * 9ef364432db4 ("drm/msm: deprecate MSM_BO_UNCACHED (map as writecombine instead)")
+	 *
+	 * So promote them to WC.
+	 */
+	if (flags & MSM_BO_UNCACHED) {
+		flags &= ~MSM_BO_CACHED;
+		flags |= MSM_BO_WC;
+	}
+
+	if (should_fail(&fail_gem_alloc, args->size))
+		return -ENOMEM;
+
+	return msm_gem_new_handle(dev, file, args->size,
+			args->flags, &args->handle, NULL);
+}
+
+int msm_ioctl_gem_cpu_prep(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct drm_msm_gem_cpu_prep *args = data;
+	struct drm_gem_object *obj;
+	ktime_t timeout = to_ktime(args->timeout);
+	int ret;
+
+	if (args->op & ~MSM_PREP_FLAGS) {
+		DRM_ERROR("invalid op: %08x\n", args->op);
+		return -EINVAL;
+	}
+
+	obj = drm_gem_object_lookup(file, args->handle);
+	if (!obj)
+		return -ENOENT;
+
+	ret = msm_gem_cpu_prep(obj, args->op, &timeout);
+
+	drm_gem_object_put(obj);
+
+	return ret;
+}
+
+int msm_ioctl_gem_cpu_fini(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct drm_msm_gem_cpu_fini *args = data;
+	struct drm_gem_object *obj;
+	int ret;
+
+	obj = drm_gem_object_lookup(file, args->handle);
+	if (!obj)
+		return -ENOENT;
+
+	ret = msm_gem_cpu_fini(obj);
+
+	drm_gem_object_put(obj);
+
+	return ret;
+}
+
+int msm_ioctl_gem_info_iova(struct drm_device *dev, struct drm_file *file,
+			    struct drm_gem_object *obj, uint64_t *iova)
+{
+	struct msm_drm_private *priv = dev->dev_private;
+	struct msm_context *ctx = file->driver_priv;
+
+	if (!priv->gpu)
+		return -EINVAL;
+
+	if (msm_context_is_vmbind(ctx))
+		return UERR(EINVAL, dev, "VM_BIND is enabled");
+
+	if (should_fail(&fail_gem_iova, obj->size))
+		return -ENOMEM;
+
+	/*
+	 * Don't pin the memory here - just get an address so that userspace can
+	 * be productive
+	 */
+	return msm_gem_get_iova(obj, msm_context_vm(dev, ctx), iova);
+}
+
+int msm_ioctl_gem_info_set_iova(struct drm_device *dev, struct drm_file *file,
+				struct drm_gem_object *obj, uint64_t iova)
+{
+	struct msm_drm_private *priv = dev->dev_private;
+	struct msm_context *ctx = file->driver_priv;
+	struct drm_gpuvm *vm = msm_context_vm(dev, ctx);
+
+	if (!priv->gpu)
+		return -EINVAL;
+
+	if (msm_context_is_vmbind(ctx))
+		return UERR(EINVAL, dev, "VM_BIND is enabled");
+
+	/* Only supported if per-process address space is supported: */
+	if (priv->gpu->vm == vm)
+		return UERR(EOPNOTSUPP, dev, "requires per-process pgtables");
+
+	if (should_fail(&fail_gem_iova, obj->size))
+		return -ENOMEM;
+
+	return msm_gem_set_iova(obj, vm, iova);
+}
+
+int msm_ioctl_gem_info_set_metadata(struct drm_gem_object *obj,
+				    __user void *metadata, u32 metadata_size)
+{
+	struct msm_gem_object *msm_obj = to_msm_bo(obj);
+	void *new_metadata;
+	void *buf;
+	int ret;
+
+	/* Impose a moderate upper bound on metadata size: */
+	if (metadata_size > 128)
+		return -EOVERFLOW;
+
+	/* Use a temporary buf to keep copy_from_user() outside of gem obj lock: */
+	buf = memdup_user(metadata, metadata_size);
+	if (IS_ERR(buf))
+		return PTR_ERR(buf);
+
+	ret = msm_gem_lock_interruptible(obj);
+	if (ret)
+		goto out;
+
+	new_metadata =
+		krealloc(msm_obj->metadata, metadata_size, GFP_KERNEL);
+	if (!new_metadata) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	msm_obj->metadata = new_metadata;
+	msm_obj->metadata_size = metadata_size;
+	memcpy(msm_obj->metadata, buf, metadata_size);
+
+	msm_gem_unlock(obj);
+
+out:
+	kfree(buf);
+
+	return ret;
+}
+
+int msm_ioctl_gem_info_get_metadata(struct drm_gem_object *obj,
+				    __user void *metadata, u32 *metadata_size)
+{
+	struct msm_gem_object *msm_obj = to_msm_bo(obj);
+	void *buf;
+	int ret, len;
+
+	if (!metadata) {
+		/*
+		 * Querying the size is inherently racey, but
+		 * EXT_external_objects expects the app to confirm
+		 * via device and driver UUIDs that the exporter and
+		 * importer versions match.  All we can do from the
+		 * kernel side is check the length under obj lock
+		 * when userspace tries to retrieve the metadata
+		 */
+		*metadata_size = msm_obj->metadata_size;
+		return 0;
+	}
+
+	ret = msm_gem_lock_interruptible(obj);
+	if (ret)
+		return ret;
+
+	/* Avoid copy_to_user() under gem obj lock: */
+	len = msm_obj->metadata_size;
+	buf = kmemdup(msm_obj->metadata, len, GFP_KERNEL);
+
+	msm_gem_unlock(obj);
+
+	if (*metadata_size < len)
+		ret = -ETOOSMALL;
+	else if (copy_to_user(metadata, buf, len))
+		ret = -EFAULT;
+	else
+		*metadata_size = len;
+
+	kfree(buf);
+
+	return 0;
+}
+
+int msm_ioctl_gem_info(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct drm_msm_gem_info *args = data;
+	struct drm_gem_object *obj;
+	struct msm_gem_object *msm_obj;
+	int i, ret = 0;
+
+	if (args->pad)
+		return -EINVAL;
+
+	switch (args->info) {
+	case MSM_INFO_GET_OFFSET:
+	case MSM_INFO_GET_IOVA:
+	case MSM_INFO_SET_IOVA:
+	case MSM_INFO_GET_FLAGS:
+		/* value returned as immediate, not pointer, so len==0: */
+		if (args->len)
+			return -EINVAL;
+		break;
+	case MSM_INFO_SET_NAME:
+	case MSM_INFO_GET_NAME:
+	case MSM_INFO_SET_METADATA:
+	case MSM_INFO_GET_METADATA:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	obj = drm_gem_object_lookup(file, args->handle);
+	if (!obj)
+		return -ENOENT;
+
+	msm_obj = to_msm_bo(obj);
+
+	switch (args->info) {
+	case MSM_INFO_GET_OFFSET:
+		args->value = msm_gem_mmap_offset(obj);
+		break;
+	case MSM_INFO_GET_IOVA:
+		ret = msm_ioctl_gem_info_iova(dev, file, obj, &args->value);
+		break;
+	case MSM_INFO_SET_IOVA:
+		ret = msm_ioctl_gem_info_set_iova(dev, file, obj, args->value);
+		break;
+	case MSM_INFO_GET_FLAGS:
+		if (drm_gem_is_imported(obj)) {
+			ret = -EINVAL;
+			break;
+		}
+		/* Hide internal kernel-only flags: */
+		args->value = to_msm_bo(obj)->flags & MSM_BO_FLAGS;
+		ret = 0;
+		break;
+	case MSM_INFO_SET_NAME:
+		/* length check should leave room for terminating null: */
+		if (args->len >= sizeof(msm_obj->name)) {
+			ret = -EINVAL;
+			break;
+		}
+		if (copy_from_user(msm_obj->name, u64_to_user_ptr(args->value),
+				   args->len)) {
+			msm_obj->name[0] = '\0';
+			ret = -EFAULT;
+			break;
+		}
+		msm_obj->name[args->len] = '\0';
+		for (i = 0; i < args->len; i++) {
+			if (!isprint(msm_obj->name[i])) {
+				msm_obj->name[i] = '\0';
+				break;
+			}
+		}
+		break;
+	case MSM_INFO_GET_NAME:
+		if (args->value && (args->len < strlen(msm_obj->name))) {
+			ret = -ETOOSMALL;
+			break;
+		}
+		args->len = strlen(msm_obj->name);
+		if (args->value) {
+			if (copy_to_user(u64_to_user_ptr(args->value),
+					 msm_obj->name, args->len))
+				ret = -EFAULT;
+		}
+		break;
+	case MSM_INFO_SET_METADATA:
+		ret = msm_ioctl_gem_info_set_metadata(
+			obj, u64_to_user_ptr(args->value), args->len);
+		break;
+	case MSM_INFO_GET_METADATA:
+		ret = msm_ioctl_gem_info_get_metadata(
+			obj, u64_to_user_ptr(args->value), &args->len);
+		break;
+	}
+
+	drm_gem_object_put(obj);
+
+	return ret;
+}
+
+static int wait_fence(struct msm_gpu_submitqueue *queue, uint32_t fence_id,
+		      ktime_t timeout, uint32_t flags)
+{
+	struct dma_fence *fence;
+	int ret;
+
+	if (fence_after(fence_id, queue->last_fence)) {
+		DRM_ERROR_RATELIMITED("waiting on invalid fence: %u (of %u)\n",
+				      fence_id, queue->last_fence);
+		return -EINVAL;
+	}
+
+	/*
+	 * Map submitqueue scoped "seqno" (which is actually an idr key)
+	 * back to underlying dma-fence
+	 *
+	 * The fence is removed from the fence_idr when the submit is
+	 * retired, so if the fence is not found it means there is nothing
+	 * to wait for
+	 */
+	spin_lock(&queue->idr_lock);
+	fence = idr_find(&queue->fence_idr, fence_id);
+	if (fence)
+		fence = dma_fence_get_rcu(fence);
+	spin_unlock(&queue->idr_lock);
+
+	if (!fence)
+		return 0;
+
+	if (flags & MSM_WAIT_FENCE_BOOST)
+		dma_fence_set_deadline(fence, ktime_get());
+
+	ret = dma_fence_wait_timeout(fence, true, timeout_to_jiffies(&timeout));
+	if (ret == 0)
+		ret = -ETIMEDOUT;
+	else if (ret != -ERESTARTSYS)
+		ret = 0;
+
+	dma_fence_put(fence);
+
+	return ret;
+}
+
+int msm_ioctl_wait_fence(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct msm_drm_private *priv = dev->dev_private;
+	struct drm_msm_wait_fence *args = data;
+	struct msm_gpu_submitqueue *queue;
+	int ret;
+
+	if (args->flags & ~MSM_WAIT_FENCE_FLAGS) {
+		DRM_ERROR("invalid flags: %08x\n", args->flags);
+		return -EINVAL;
+	}
+
+	if (!priv->gpu)
+		return 0;
+
+	queue = msm_submitqueue_get(file->driver_priv, args->queueid);
+	if (!queue)
+		return -ENOENT;
+
+	ret = wait_fence(queue, args->fence, to_ktime(args->timeout), args->flags);
+
+	msm_submitqueue_put(queue);
+
+	return ret;
+}
+
+int msm_ioctl_gem_madvise(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct drm_msm_gem_madvise *args = data;
+	struct drm_gem_object *obj;
+	int ret;
+
+	switch (args->madv) {
+	case MSM_MADV_DONTNEED:
+	case MSM_MADV_WILLNEED:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	obj = drm_gem_object_lookup(file, args->handle);
+	if (!obj)
+		return -ENOENT;
+
+	ret = msm_gem_madvise(obj, args->madv);
+	if (ret >= 0) {
+		args->retained = ret;
+		ret = 0;
+	}
+
+	drm_gem_object_put(obj);
+
+	return ret;
+}
+
+int msm_ioctl_submitqueue_new(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct drm_msm_submitqueue *args = data;
+
+	if (args->flags & ~MSM_SUBMITQUEUE_FLAGS)
+		return -EINVAL;
+
+	return msm_submitqueue_create(dev, file->driver_priv, args->prio,
+		args->flags, &args->id);
+}
+
+int msm_ioctl_submitqueue_query(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	return msm_submitqueue_query(dev, file->driver_priv, data);
+}
+
+int msm_ioctl_submitqueue_close(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	u32 id = *(u32 *) data;
+
+	return msm_submitqueue_remove(file->driver_priv, id);
+}
diff --git a/drivers/gpu/drm/msm/msm_ioctl.h b/drivers/gpu/drm/msm/msm_ioctl.h
new file mode 100644
index 0000000000000000000000000000000000000000..5711476a00df4773b12020a37bfb3ceb964c19ee
--- /dev/null
+++ b/drivers/gpu/drm/msm/msm_ioctl.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2016-2018, The Linux Foundation. All rights reserved.
+ * Copyright (C) 2013 Red Hat
+ * Author: Rob Clark <robdclark@gmail.com>
+ */
+
+#ifndef __MSM_IOCTLS_H__
+#define __MSM_IOCTLS_H__
+
+#include <linux/types.h>
+
+struct drm_device;
+struct drm_file;
+struct drm_gem_object;
+
+int msm_ioctl_get_param(struct drm_device *dev, void *data, struct drm_file *file);
+int msm_ioctl_set_param(struct drm_device *dev, void *data, struct drm_file *file);
+int msm_ioctl_gem_new(struct drm_device *dev, void *data, struct drm_file *file);
+int msm_ioctl_gem_cpu_prep(struct drm_device *dev, void *data, struct drm_file *file);
+int msm_ioctl_gem_cpu_fini(struct drm_device *dev, void *data, struct drm_file *file);
+int msm_ioctl_gem_info_iova(struct drm_device *dev, struct drm_file *file,
+			    struct drm_gem_object *obj, uint64_t *iova);
+int msm_ioctl_gem_info_set_iova(struct drm_device *dev, struct drm_file *file,
+				struct drm_gem_object *obj, uint64_t iova);
+int msm_ioctl_gem_info_set_metadata(struct drm_gem_object *obj,
+				    __user void *metadata, u32 metadata_size);
+int msm_ioctl_gem_info_get_metadata(struct drm_gem_object *obj,
+				    __user void *metadata, u32 *metadata_size);
+int msm_ioctl_gem_info(struct drm_device *dev, void *data, struct drm_file *file);
+int msm_ioctl_wait_fence(struct drm_device *dev, void *data, struct drm_file *file);
+int msm_ioctl_gem_madvise(struct drm_device *dev, void *data, struct drm_file *file);
+int msm_ioctl_submitqueue_new(struct drm_device *dev, void *data, struct drm_file *file);
+int msm_ioctl_submitqueue_query(struct drm_device *dev, void *data, struct drm_file *file);
+int msm_ioctl_submitqueue_close(struct drm_device *dev, void *data, struct drm_file *file);
+
+#endif

-- 
2.47.3


