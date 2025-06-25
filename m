Return-Path: <linux-media+bounces-35903-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04455AE8DD5
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 21:05:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4CAB34A0D6E
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 19:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31E102F546A;
	Wed, 25 Jun 2025 18:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jsjj11g2"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496622F49E4
	for <linux-media@vger.kernel.org>; Wed, 25 Jun 2025 18:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750877950; cv=none; b=PKB/z77bDi7H+IzfVt9D38rv/CAw3KMyEPw/EyKT+bOzutKPezdMTFiIq+N+2jmcnvVw4r7GE8PJhpPRCVejCBkeQFipvt0pKFtljur1+71zfPLlcAHzfbewfIyzh4U/IT8kmMrH/qJPoikdg+Ki21rk0lJ583nyUgvI/d+5xXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750877950; c=relaxed/simple;
	bh=J0pQNbB6x/H7ePaaaS7ZUOpUGbfsgtn3CSHqO9Dcccc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tW2VFo6UmbR+RXsoEHB9oo4fAX/jtqIPZ258lGRZc4+x8tMdw55+4pp7bBQc8AdYwSkSI5JYcEfEtCly0tgfC4/BQtPQYKG4Ovi15iDtpj1FlIRyccJx//8UBWZYP75CXnOrftRBFMh9e8kCdyc4cDyz47bUZ35+MNSno6IuvyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jsjj11g2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PAfENE000685
	for <linux-media@vger.kernel.org>; Wed, 25 Jun 2025 18:59:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=F1yQ7yX6yaI
	pkwDE3wKH9/Crq7XFmKQYbQ8fPyvBhLE=; b=Jsjj11g2GaQ7eLpMX999DlmpRRZ
	Qdm/Ot9DBdj2iOFXnlkYR98in9o5uGBvdnv1k+wkco73TQPDbIYTGRVgUPmOQ7ow
	/n/2bFPspIRN5jh4DSRjlSD3kbTpCTjBL/I372r8pp8yrYw2mMtbEwJFFOjzMuak
	4zyG8LJ3c915BHAgGSBWBs2MsN7b/EXj2hzv8VC5kcPJgIYAu60BEB3ro7XTPB3i
	fXFfgFvyOsBMVZhj2IunSw2Y+xwnysfAszBTpzVcLrk5CPfadmwWaIZ5WFYwcNZL
	3V4RD6mV3Ltg9+zGKghl11tkcSygCgzTKoYbxK0BbxwWnOsua9PYFsyO3sw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g7tdast6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Jun 2025 18:59:07 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-748764d84feso333291b3a.2
        for <linux-media@vger.kernel.org>; Wed, 25 Jun 2025 11:59:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750877947; x=1751482747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F1yQ7yX6yaIpkwDE3wKH9/Crq7XFmKQYbQ8fPyvBhLE=;
        b=O3iB0dkckBSSbmYVbE3h8NvPFM5AixhyXUhrjZv2q00BdPxTTjKr6lrOUAp/gJtCwh
         7PIG0CQsnp3rxqXdg6Ld9d9Qy63jnE9YaV3/JUInFx6C+xF2fn+v4SUJHxSB9El0f0Bk
         462h/KiEr1fQpSEV9Jmzy0ckYOSMlWH96F4KTActC55XjX9wsBPlHp3bLoEo06eOhw6P
         /8NXDAL4Bv4K/v+HzWU5euJI9UYrM9/zOCK/Yd5CX9iZVwt2UJi0euXuPQenWmB/QX98
         CU9/jcMSI9nYnomvtBx1u5GZWT8Oau+B4zSROAbv2keYqrLF10ZnTZuA5u/uy6ZtnT+o
         IcLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPdPrUp0L5qqyrshxDWm6n6jSgjlYsu1s6Qf1XdtEiXDXouI7OK52La7OzbZpvKt5qx5WBows5HkXEWw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyfr6fXQCgdDfAE1lwKjCql4PItLg84nnArx969NGT+1gCM+z1K
	cfGX+rsJdAdSZh0fB9gYHcVWHM36sF9BReX67BPqVQa4aILVPD6q5nNranNClOkIys9zAx4Fd7G
	gqZoAZHKUgo758HNqPiYsiQ9ft3BwGD1WoY93LST8cZS8L/0MgL7x2WxbvOccledOZQ==
X-Gm-Gg: ASbGnctKmPFxH+d9fr2tZWIkDu6c1NCdmlgS+75ZMx+bgeNIms0vqNlZi/BgILIGOjU
	J60+M6ab2Mo5y2BOIE6oyLrgZXBUqdzEYmiijiAZ1gIKk8d1/Vh83GME/Qw/4pf3RWuholhzR9d
	yNpD6oE0QK5Lcmc2uk21vvKWgml78g0Qtor5lwTEL1kWN6Av52Xg3dtbmd0g4iZX3j4JHvp4YyF
	qJ9maAOp1hNSF2N8SwqaY3fDg2IW27ckdpybvJrYKb48++PKdnkybkDQlzbePkEJmI28xxcRCnG
	JlxeEog2swPhL6tsIj9CLqayZmP0sO8y
X-Received: by 2002:a05:6a21:680b:b0:204:4573:d854 with SMTP id adf61e73a8af0-2207f1adf3bmr5936418637.9.1750877946419;
        Wed, 25 Jun 2025 11:59:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1LmWA4B37cTCZvJEIcBbu0dTeCfOuaoULsy1QTxM37zp0IXZvdQikKnG42zq3g+gUrjS54w==
X-Received: by 2002:a05:6a21:680b:b0:204:4573:d854 with SMTP id adf61e73a8af0-2207f1adf3bmr5936371637.9.1750877945889;
        Wed, 25 Jun 2025 11:59:05 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f125d668sm11591495a12.54.2025.06.25.11.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 11:59:05 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-kernel@vger.kernel.org (open list),
        linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b),
        linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b)
Subject: [PATCH v7 29/42] drm/msm: Extract out syncobj helpers
Date: Wed, 25 Jun 2025 11:47:22 -0700
Message-ID: <20250625184918.124608-30-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
References: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CPYqXQrD c=1 sm=1 tr=0 ts=685c46fb cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=ii7SkllToyZ1umWTbp4A:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfX8FJuB/Nq7KfT
 1RUNiYYWQiDjybOUtkVailDiZGlwm2XP3+s31UkVbYDmte+EUy5n0efIzSkSI1P85/n5UJuuPq7
 dwUMcCaFCBMYkUhOr6QiEcKyrlp+PW7B92eDEMv/fdUcHGzXYwqBgW2ZFDmXIo1CSn9md+01baP
 K+QnJFpRhLVw3FIJdnTrcD920llvQxyGDN2NVbKM09JPHPAXwHy9EKBiRxbLTMiWfIlFiy8shQi
 GkeM8MZZmiqnJknND6hzLpFvaCI93qu3feVgxrRQrVklCvv0ML2hU35tXvXOiLCxLinBxuMk+vL
 eLr3QGZ+NJ1FbPiec8kRsntKZZuP4sidSMWI/83vrj7HFQrY+khj3/bVhWfzUdBdizCghsny+ky
 bauMLdSr2sS9L3I3iu0L7QmQL7oZ45w3xFmcqSfw1kojYqsk0Brp/GAfSESoBXyKaVJgUnBZ
X-Proofpoint-GUID: PuP6Z1xk4xKsmMJ_DlgpwGOw-EKuHJnL
X-Proofpoint-ORIG-GUID: PuP6Z1xk4xKsmMJ_DlgpwGOw-EKuHJnL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250143

From: Rob Clark <robdclark@chromium.org>

We'll be re-using these for the VM_BIND ioctl.

Also, rename a few things in the uapi header to reflect that syncobj use
is not specific to the submit ioctl.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/Makefile         |   1 +
 drivers/gpu/drm/msm/msm_gem_submit.c | 192 ++-------------------------
 drivers/gpu/drm/msm/msm_syncobj.c    | 172 ++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_syncobj.h    |  37 ++++++
 include/uapi/drm/msm_drm.h           |  26 ++--
 5 files changed, 235 insertions(+), 193 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/msm_syncobj.c
 create mode 100644 drivers/gpu/drm/msm/msm_syncobj.h

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 5df20cbeafb8..8af34f87e0c8 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -128,6 +128,7 @@ msm-y += \
 	msm_rd.o \
 	msm_ringbuffer.o \
 	msm_submitqueue.o \
+	msm_syncobj.o \
 	msm_gpu_tracepoints.o \
 
 msm-$(CONFIG_DRM_FBDEV_EMULATION) += msm_fbdev.o
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 9562b6343e13..9f18771a1e88 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -16,6 +16,7 @@
 #include "msm_gpu.h"
 #include "msm_gem.h"
 #include "msm_gpu_trace.h"
+#include "msm_syncobj.h"
 
 /* For userspace errors, use DRM_UT_DRIVER.. so that userspace can enable
  * error msgs for debugging, but we don't spam dmesg by default
@@ -491,173 +492,6 @@ void msm_submit_retire(struct msm_gem_submit *submit)
 	}
 }
 
-struct msm_submit_post_dep {
-	struct drm_syncobj *syncobj;
-	uint64_t point;
-	struct dma_fence_chain *chain;
-};
-
-static struct drm_syncobj **msm_parse_deps(struct msm_gem_submit *submit,
-                                           struct drm_file *file,
-                                           uint64_t in_syncobjs_addr,
-                                           uint32_t nr_in_syncobjs,
-                                           size_t syncobj_stride)
-{
-	struct drm_syncobj **syncobjs = NULL;
-	struct drm_msm_gem_submit_syncobj syncobj_desc = {0};
-	int ret = 0;
-	uint32_t i, j;
-
-	syncobjs = kcalloc(nr_in_syncobjs, sizeof(*syncobjs),
-	                   GFP_KERNEL | __GFP_NOWARN | __GFP_NORETRY);
-	if (!syncobjs)
-		return ERR_PTR(-ENOMEM);
-
-	for (i = 0; i < nr_in_syncobjs; ++i) {
-		uint64_t address = in_syncobjs_addr + i * syncobj_stride;
-
-		if (copy_from_user(&syncobj_desc,
-			           u64_to_user_ptr(address),
-			           min(syncobj_stride, sizeof(syncobj_desc)))) {
-			ret = -EFAULT;
-			break;
-		}
-
-		if (syncobj_desc.point &&
-		    !drm_core_check_feature(submit->dev, DRIVER_SYNCOBJ_TIMELINE)) {
-			ret = SUBMIT_ERROR(EOPNOTSUPP, submit, "syncobj timeline unsupported");
-			break;
-		}
-
-		if (syncobj_desc.flags & ~MSM_SUBMIT_SYNCOBJ_FLAGS) {
-			ret = SUBMIT_ERROR(EINVAL, submit, "invalid syncobj flags: %x", syncobj_desc.flags);
-			break;
-		}
-
-		ret = drm_sched_job_add_syncobj_dependency(&submit->base, file,
-							   syncobj_desc.handle, syncobj_desc.point);
-		if (ret)
-			break;
-
-		if (syncobj_desc.flags & MSM_SUBMIT_SYNCOBJ_RESET) {
-			syncobjs[i] =
-				drm_syncobj_find(file, syncobj_desc.handle);
-			if (!syncobjs[i]) {
-				ret = SUBMIT_ERROR(EINVAL, submit, "invalid syncobj handle: %u", i);
-				break;
-			}
-		}
-	}
-
-	if (ret) {
-		for (j = 0; j <= i; ++j) {
-			if (syncobjs[j])
-				drm_syncobj_put(syncobjs[j]);
-		}
-		kfree(syncobjs);
-		return ERR_PTR(ret);
-	}
-	return syncobjs;
-}
-
-static void msm_reset_syncobjs(struct drm_syncobj **syncobjs,
-                               uint32_t nr_syncobjs)
-{
-	uint32_t i;
-
-	for (i = 0; syncobjs && i < nr_syncobjs; ++i) {
-		if (syncobjs[i])
-			drm_syncobj_replace_fence(syncobjs[i], NULL);
-	}
-}
-
-static struct msm_submit_post_dep *msm_parse_post_deps(struct drm_device *dev,
-                                                       struct drm_file *file,
-                                                       uint64_t syncobjs_addr,
-                                                       uint32_t nr_syncobjs,
-                                                       size_t syncobj_stride)
-{
-	struct msm_submit_post_dep *post_deps;
-	struct drm_msm_gem_submit_syncobj syncobj_desc = {0};
-	int ret = 0;
-	uint32_t i, j;
-
-	post_deps = kcalloc(nr_syncobjs, sizeof(*post_deps),
-			    GFP_KERNEL | __GFP_NOWARN | __GFP_NORETRY);
-	if (!post_deps)
-		return ERR_PTR(-ENOMEM);
-
-	for (i = 0; i < nr_syncobjs; ++i) {
-		uint64_t address = syncobjs_addr + i * syncobj_stride;
-
-		if (copy_from_user(&syncobj_desc,
-			           u64_to_user_ptr(address),
-			           min(syncobj_stride, sizeof(syncobj_desc)))) {
-			ret = -EFAULT;
-			break;
-		}
-
-		post_deps[i].point = syncobj_desc.point;
-
-		if (syncobj_desc.flags) {
-			ret = UERR(EINVAL, dev, "invalid syncobj flags");
-			break;
-		}
-
-		if (syncobj_desc.point) {
-			if (!drm_core_check_feature(dev,
-			                            DRIVER_SYNCOBJ_TIMELINE)) {
-				ret = UERR(EOPNOTSUPP, dev, "syncobj timeline unsupported");
-				break;
-			}
-
-			post_deps[i].chain = dma_fence_chain_alloc();
-			if (!post_deps[i].chain) {
-				ret = -ENOMEM;
-				break;
-			}
-		}
-
-		post_deps[i].syncobj =
-			drm_syncobj_find(file, syncobj_desc.handle);
-		if (!post_deps[i].syncobj) {
-			ret = UERR(EINVAL, dev, "invalid syncobj handle");
-			break;
-		}
-	}
-
-	if (ret) {
-		for (j = 0; j <= i; ++j) {
-			dma_fence_chain_free(post_deps[j].chain);
-			if (post_deps[j].syncobj)
-				drm_syncobj_put(post_deps[j].syncobj);
-		}
-
-		kfree(post_deps);
-		return ERR_PTR(ret);
-	}
-
-	return post_deps;
-}
-
-static void msm_process_post_deps(struct msm_submit_post_dep *post_deps,
-                                  uint32_t count, struct dma_fence *fence)
-{
-	uint32_t i;
-
-	for (i = 0; post_deps && i < count; ++i) {
-		if (post_deps[i].chain) {
-			drm_syncobj_add_point(post_deps[i].syncobj,
-			                      post_deps[i].chain,
-			                      fence, post_deps[i].point);
-			post_deps[i].chain = NULL;
-		} else {
-			drm_syncobj_replace_fence(post_deps[i].syncobj,
-			                          fence);
-		}
-	}
-}
-
 int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 		struct drm_file *file)
 {
@@ -668,7 +502,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	struct msm_gpu *gpu = priv->gpu;
 	struct msm_gpu_submitqueue *queue;
 	struct msm_ringbuffer *ring;
-	struct msm_submit_post_dep *post_deps = NULL;
+	struct msm_syncobj_post_dep *post_deps = NULL;
 	struct drm_syncobj **syncobjs_to_reset = NULL;
 	struct sync_file *sync_file = NULL;
 	int out_fence_fd = -1;
@@ -745,10 +579,10 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	}
 
 	if (args->flags & MSM_SUBMIT_SYNCOBJ_IN) {
-		syncobjs_to_reset = msm_parse_deps(submit, file,
-		                                   args->in_syncobjs,
-		                                   args->nr_in_syncobjs,
-		                                   args->syncobj_stride);
+		syncobjs_to_reset = msm_syncobj_parse_deps(dev, &submit->base,
+							   file, args->in_syncobjs,
+							   args->nr_in_syncobjs,
+							   args->syncobj_stride);
 		if (IS_ERR(syncobjs_to_reset)) {
 			ret = PTR_ERR(syncobjs_to_reset);
 			goto out_unlock;
@@ -756,10 +590,10 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	}
 
 	if (args->flags & MSM_SUBMIT_SYNCOBJ_OUT) {
-		post_deps = msm_parse_post_deps(dev, file,
-		                                args->out_syncobjs,
-		                                args->nr_out_syncobjs,
-		                                args->syncobj_stride);
+		post_deps = msm_syncobj_parse_post_deps(dev, file,
+							args->out_syncobjs,
+							args->nr_out_syncobjs,
+							args->syncobj_stride);
 		if (IS_ERR(post_deps)) {
 			ret = PTR_ERR(post_deps);
 			goto out_unlock;
@@ -902,10 +736,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	args->fence = submit->fence_id;
 	queue->last_fence = submit->fence_id;
 
-	msm_reset_syncobjs(syncobjs_to_reset, args->nr_in_syncobjs);
-	msm_process_post_deps(post_deps, args->nr_out_syncobjs,
-	                      submit->user_fence);
-
+	msm_syncobj_reset(syncobjs_to_reset, args->nr_in_syncobjs);
+	msm_syncobj_process_post_deps(post_deps, args->nr_out_syncobjs, submit->user_fence);
 
 out:
 	submit_cleanup(submit, !!ret);
diff --git a/drivers/gpu/drm/msm/msm_syncobj.c b/drivers/gpu/drm/msm/msm_syncobj.c
new file mode 100644
index 000000000000..4baa9f522c54
--- /dev/null
+++ b/drivers/gpu/drm/msm/msm_syncobj.c
@@ -0,0 +1,172 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (C) 2020 Google, Inc */
+
+#include "drm/drm_drv.h"
+
+#include "msm_drv.h"
+#include "msm_syncobj.h"
+
+struct drm_syncobj **
+msm_syncobj_parse_deps(struct drm_device *dev,
+		       struct drm_sched_job *job,
+		       struct drm_file *file,
+		       uint64_t in_syncobjs_addr,
+		       uint32_t nr_in_syncobjs,
+		       size_t syncobj_stride)
+{
+	struct drm_syncobj **syncobjs = NULL;
+	struct drm_msm_syncobj syncobj_desc = {0};
+	int ret = 0;
+	uint32_t i, j;
+
+	syncobjs = kcalloc(nr_in_syncobjs, sizeof(*syncobjs),
+	                   GFP_KERNEL | __GFP_NOWARN | __GFP_NORETRY);
+	if (!syncobjs)
+		return ERR_PTR(-ENOMEM);
+
+	for (i = 0; i < nr_in_syncobjs; ++i) {
+		uint64_t address = in_syncobjs_addr + i * syncobj_stride;
+
+		if (copy_from_user(&syncobj_desc,
+			           u64_to_user_ptr(address),
+			           min(syncobj_stride, sizeof(syncobj_desc)))) {
+			ret = -EFAULT;
+			break;
+		}
+
+		if (syncobj_desc.point &&
+		    !drm_core_check_feature(dev, DRIVER_SYNCOBJ_TIMELINE)) {
+			ret = UERR(EOPNOTSUPP, dev, "syncobj timeline unsupported");
+			break;
+		}
+
+		if (syncobj_desc.flags & ~MSM_SYNCOBJ_FLAGS) {
+			ret = UERR(EINVAL, dev, "invalid syncobj flags: %x", syncobj_desc.flags);
+			break;
+		}
+
+		ret = drm_sched_job_add_syncobj_dependency(job, file,
+						   syncobj_desc.handle,
+						   syncobj_desc.point);
+		if (ret)
+			break;
+
+		if (syncobj_desc.flags & MSM_SYNCOBJ_RESET) {
+			syncobjs[i] = drm_syncobj_find(file, syncobj_desc.handle);
+			if (!syncobjs[i]) {
+				ret = UERR(EINVAL, dev, "invalid syncobj handle: %u", i);
+				break;
+			}
+		}
+	}
+
+	if (ret) {
+		for (j = 0; j <= i; ++j) {
+			if (syncobjs[j])
+				drm_syncobj_put(syncobjs[j]);
+		}
+		kfree(syncobjs);
+		return ERR_PTR(ret);
+	}
+	return syncobjs;
+}
+
+void
+msm_syncobj_reset(struct drm_syncobj **syncobjs, uint32_t nr_syncobjs)
+{
+	uint32_t i;
+
+	for (i = 0; syncobjs && i < nr_syncobjs; ++i) {
+		if (syncobjs[i])
+			drm_syncobj_replace_fence(syncobjs[i], NULL);
+	}
+}
+
+struct msm_syncobj_post_dep *
+msm_syncobj_parse_post_deps(struct drm_device *dev,
+			    struct drm_file *file,
+			    uint64_t syncobjs_addr,
+			    uint32_t nr_syncobjs,
+			    size_t syncobj_stride)
+{
+	struct msm_syncobj_post_dep *post_deps;
+	struct drm_msm_syncobj syncobj_desc = {0};
+	int ret = 0;
+	uint32_t i, j;
+
+	post_deps = kcalloc(nr_syncobjs, sizeof(*post_deps),
+			    GFP_KERNEL | __GFP_NOWARN | __GFP_NORETRY);
+	if (!post_deps)
+		return ERR_PTR(-ENOMEM);
+
+	for (i = 0; i < nr_syncobjs; ++i) {
+		uint64_t address = syncobjs_addr + i * syncobj_stride;
+
+		if (copy_from_user(&syncobj_desc,
+			           u64_to_user_ptr(address),
+			           min(syncobj_stride, sizeof(syncobj_desc)))) {
+			ret = -EFAULT;
+			break;
+		}
+
+		post_deps[i].point = syncobj_desc.point;
+
+		if (syncobj_desc.flags) {
+			ret = UERR(EINVAL, dev, "invalid syncobj flags");
+			break;
+		}
+
+		if (syncobj_desc.point) {
+			if (!drm_core_check_feature(dev,
+			                            DRIVER_SYNCOBJ_TIMELINE)) {
+				ret = UERR(EOPNOTSUPP, dev, "syncobj timeline unsupported");
+				break;
+			}
+
+			post_deps[i].chain = dma_fence_chain_alloc();
+			if (!post_deps[i].chain) {
+				ret = -ENOMEM;
+				break;
+			}
+		}
+
+		post_deps[i].syncobj =
+			drm_syncobj_find(file, syncobj_desc.handle);
+		if (!post_deps[i].syncobj) {
+			ret = UERR(EINVAL, dev, "invalid syncobj handle");
+			break;
+		}
+	}
+
+	if (ret) {
+		for (j = 0; j <= i; ++j) {
+			dma_fence_chain_free(post_deps[j].chain);
+			if (post_deps[j].syncobj)
+				drm_syncobj_put(post_deps[j].syncobj);
+		}
+
+		kfree(post_deps);
+		return ERR_PTR(ret);
+	}
+
+	return post_deps;
+}
+
+void
+msm_syncobj_process_post_deps(struct msm_syncobj_post_dep *post_deps,
+			      uint32_t count, struct dma_fence *fence)
+{
+	uint32_t i;
+
+	for (i = 0; post_deps && i < count; ++i) {
+		if (post_deps[i].chain) {
+			drm_syncobj_add_point(post_deps[i].syncobj,
+			                      post_deps[i].chain,
+			                      fence, post_deps[i].point);
+			post_deps[i].chain = NULL;
+		} else {
+			drm_syncobj_replace_fence(post_deps[i].syncobj,
+			                          fence);
+		}
+	}
+}
diff --git a/drivers/gpu/drm/msm/msm_syncobj.h b/drivers/gpu/drm/msm/msm_syncobj.h
new file mode 100644
index 000000000000..bcaa15d01da0
--- /dev/null
+++ b/drivers/gpu/drm/msm/msm_syncobj.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (C) 2020 Google, Inc */
+
+#ifndef __MSM_GEM_SYNCOBJ_H__
+#define __MSM_GEM_SYNCOBJ_H__
+
+#include "drm/drm_device.h"
+#include "drm/drm_syncobj.h"
+#include "drm/gpu_scheduler.h"
+
+struct msm_syncobj_post_dep {
+	struct drm_syncobj *syncobj;
+	uint64_t point;
+	struct dma_fence_chain *chain;
+};
+
+struct drm_syncobj **
+msm_syncobj_parse_deps(struct drm_device *dev,
+		       struct drm_sched_job *job,
+		       struct drm_file *file,
+		       uint64_t in_syncobjs_addr,
+		       uint32_t nr_in_syncobjs,
+		       size_t syncobj_stride);
+
+void msm_syncobj_reset(struct drm_syncobj **syncobjs, uint32_t nr_syncobjs);
+
+struct msm_syncobj_post_dep *
+msm_syncobj_parse_post_deps(struct drm_device *dev,
+			    struct drm_file *file,
+			    uint64_t syncobjs_addr,
+			    uint32_t nr_syncobjs,
+			    size_t syncobj_stride);
+
+void msm_syncobj_process_post_deps(struct msm_syncobj_post_dep *post_deps,
+				   uint32_t count, struct dma_fence *fence);
+
+#endif /* __MSM_GEM_SYNCOBJ_H__ */
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index 1bccc347945c..2c2fc4b284d0 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -220,6 +220,17 @@ struct drm_msm_gem_cpu_fini {
  * Cmdstream Submission:
  */
 
+#define MSM_SYNCOBJ_RESET 0x00000001 /* Reset syncobj after wait. */
+#define MSM_SYNCOBJ_FLAGS ( \
+		MSM_SYNCOBJ_RESET | \
+		0)
+
+struct drm_msm_syncobj {
+	__u32 handle;     /* in, syncobj handle. */
+	__u32 flags;      /* in, from MSM_SUBMIT_SYNCOBJ_FLAGS */
+	__u64 point;      /* in, timepoint for timeline syncobjs. */
+};
+
 /* The value written into the cmdstream is logically:
  *
  *   ((relocbuf->gpuaddr + reloc_offset) << shift) | or
@@ -309,17 +320,6 @@ struct drm_msm_gem_submit_bo {
 		MSM_SUBMIT_FENCE_SN_IN   | \
 		0)
 
-#define MSM_SUBMIT_SYNCOBJ_RESET 0x00000001 /* Reset syncobj after wait. */
-#define MSM_SUBMIT_SYNCOBJ_FLAGS        ( \
-		MSM_SUBMIT_SYNCOBJ_RESET | \
-		0)
-
-struct drm_msm_gem_submit_syncobj {
-	__u32 handle;     /* in, syncobj handle. */
-	__u32 flags;      /* in, from MSM_SUBMIT_SYNCOBJ_FLAGS */
-	__u64 point;      /* in, timepoint for timeline syncobjs. */
-};
-
 /* Each cmdstream submit consists of a table of buffers involved, and
  * one or more cmdstream buffers.  This allows for conditional execution
  * (context-restore), and IB buffers needed for per tile/bin draw cmds.
@@ -333,8 +333,8 @@ struct drm_msm_gem_submit {
 	__u64 cmds;           /* in, ptr to array of submit_cmd's */
 	__s32 fence_fd;       /* in/out fence fd (see MSM_SUBMIT_FENCE_FD_IN/OUT) */
 	__u32 queueid;        /* in, submitqueue id */
-	__u64 in_syncobjs;    /* in, ptr to array of drm_msm_gem_submit_syncobj */
-	__u64 out_syncobjs;   /* in, ptr to array of drm_msm_gem_submit_syncobj */
+	__u64 in_syncobjs;    /* in, ptr to array of drm_msm_syncobj */
+	__u64 out_syncobjs;   /* in, ptr to array of drm_msm_syncobj */
 	__u32 nr_in_syncobjs; /* in, number of entries in in_syncobj */
 	__u32 nr_out_syncobjs; /* in, number of entries in out_syncobj. */
 	__u32 syncobj_stride; /* in, stride of syncobj arrays. */
-- 
2.49.0


