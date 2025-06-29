Return-Path: <linux-media+bounces-36165-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E93BAECD8E
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 16:12:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 640B9175217
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 14:12:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B445523E32D;
	Sun, 29 Jun 2025 14:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bp7Axe3Z"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3E2239E9C
	for <linux-media@vger.kernel.org>; Sun, 29 Jun 2025 14:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751206080; cv=none; b=UtsGlbu8Vz7DmsM3AMmb72lIaaykADQY7pzGLbsTNEShJOYnICe9ELzQAujrnjvi71Z71n97DwRtFjznx5ZZG78WZ6cUOophdI3B/NTXCE9QPlWK6mWwZKF3wf2+x7QheuL8qJaeSPOO3BZM1tI9uC5o9NpEHhuGWrsmpER+qz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751206080; c=relaxed/simple;
	bh=YuCHHK211nqpvFmOlpnR7LLsU5KAAseFcypOymve7lM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qDi8RDDZ+isqffNH6D0D9yUl9PPQmN3vT5YIHhVW2xWAAVcqwgoBIz5P0TQglJjK6BRHvT3YV4XI8AsJx9FUpQpJkqMbfZC9cpYmNMs7QxAHiVCuuyuIQ3id/aJxzIC3e3yAK1yC0xRysjpYGYrNzfQTfjO+anitoXqevfmaLQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bp7Axe3Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TAEgiB011214
	for <linux-media@vger.kernel.org>; Sun, 29 Jun 2025 14:07:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Dn2IbO0/ubD
	WRHxm3cfadMPbuPKYgkB0YKeKTE62Wnw=; b=bp7Axe3ZmrHKHzgVNwp+Bq+ZX00
	asBodS0A5L3U1Lq7H4u4AoZq3IXvqdmFXWymOUD+oLWMV+6x4KbIJXzuQn7AT/zY
	dZv60Z3KBiAUZic1/bj9Kt9XMotRjY3ojrTbccgOrNgDFRsl1DumkVyMOtk0aBZg
	WCW1PetrErwCqd+uOnK0Ardmw7+QC4Kj7eFzLyKY9Odpm0BZosZbGtvOq0FVqPpR
	vXGlyUY1myNKgX/ZDIHo2nQov9FzLk3qlwVFn0SVGwZ3PTmWFOQiWCNPcgNYInNx
	DzBArd2riU/MDBYOuYHKl3/ZIGSHGlRknNVea5NTwpxh3PK86Fw2RXi+vYw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qm2842-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 29 Jun 2025 14:07:57 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-313f8835f29so1608067a91.3
        for <linux-media@vger.kernel.org>; Sun, 29 Jun 2025 07:07:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751206076; x=1751810876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dn2IbO0/ubDWRHxm3cfadMPbuPKYgkB0YKeKTE62Wnw=;
        b=pHIoX72ZFCQ4PEsPQkVN5DOd/LlP38kutx/pDWplonsNlAYsFvTOQhC1HhazhQ6nib
         Zt54fG8No8+8kRh+a4PWtIJDxR89UL2QthrEyqdSolew88wmK4H/hOvwtKUCDUkj7/T+
         QFzZhWaRl3JQy/1OWTIn6hd84jhRIhYZrCl2ufpqY2Bbp4nR8HtHHhl4v/wAYSyqttbQ
         yBDxtrHecjBLy6rZnebenxV9tlG4im5PURDHxJVmy1MFeuR25H6CQxprq6bKrIVsdU3h
         Of4rDNb7d6n8mHtI3zbZFXzQ30tdMDp35ItLcnQt6U5O3+SEr39F0SfuvGA6mVK+BErx
         KtLg==
X-Forwarded-Encrypted: i=1; AJvYcCVSKMn7OaQFZl38JCmiiISphcKlyZoGvn0UJIQlUqIvD3UAvC2eNEdK6YhF3jTJQ5zf6rWCjMT3kkQcxg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjxC7yAg7bYlvBHp4ZfEdSSP2BbWGF0NaVwQ2vnMQlzrxbTPdy
	OJIHlefmFNFN4v+irVsId61gxdBhasW//74YO0I5LMIK5lKR4NQiTFlMR/ojoaTA0PdZnj1eMGS
	ggRaVv7C5DaazYP9swAaPDFsM8fIiCIEC0yYGMssbQNEwO8yUmAQZ4mf792wsRLGfsw==
X-Gm-Gg: ASbGncvPKM+xDXtAOdjulOFe3xopvol4+dG5HDfqB8yKCuM29QuyR0biqWhbH5LMig7
	1BPWPQP50yfb8y0Js6yCmey33Ev7wkX23cF94K1kX6b+bxV1wnwcyBYUt0/jyJyycdp3iWGazt/
	YFcgGegON0PzUSuhUXU/HLpvMz5BYQvVQ8UQfoM4ZGuUlecEAeG3twykdZhEO6Jm5ILptGDP0ap
	BLpnIMbWRiH4phVaqaLyOVfLXbgsdGnDqeKIGZm/whxsWG11VYEIIbXQD+JuttLEzcmuohSybY/
	Hw7cwmJi+MicC4U+cB7o2bp/NwZqMkiK
X-Received: by 2002:a17:90b:1d4d:b0:311:b0ec:135b with SMTP id 98e67ed59e1d1-318c9264acamr14997376a91.24.1751206076281;
        Sun, 29 Jun 2025 07:07:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0YeMc3nI6ml5QBg86+QzQfLpwkSSpiUlWx9O/NZt33gUkqNoK+5koucvNw8/t+8WApQARww==
X-Received: by 2002:a17:90b:1d4d:b0:311:b0ec:135b with SMTP id 98e67ed59e1d1-318c9264acamr14997321a91.24.1751206075813;
        Sun, 29 Jun 2025 07:07:55 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-318c13a509asm6958046a91.20.2025.06.29.07.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 07:07:55 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Danilo Krummrich <dakr@redhat.com>, Rob Clark <robdclark@chromium.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
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
Subject: [PATCH v8 24/42] drm/msm: Add _NO_SHARE flag
Date: Sun, 29 Jun 2025 07:03:27 -0700
Message-ID: <20250629140537.30850-25-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
References: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=686148bd cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=5GAAy6agFmV6x6zTEMEA:9
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: U2MfKYr0FF15aqEyGDS5IYxN8OYYg7zc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfXxfjsxdJRZRlL
 d5MweNl9NGXTWRObX4yY7GFXEwpfUDeLa1Xe47vW3wx+Bpp55CGka3erKXaCSCuutA2wzdLv+S3
 PGAzN2hxf+VZG8HRBgPYSmvl94HW9R8Bozwzgl6XOoG4wwyISxyEDB7lUi0QBAU02elh/tI6GEM
 Xs4WRjua04Q4zl4xbLzLJDlP4v7c6+VlL/Rs8mbxbUdh3TcBuUyUGIwG7Ji67jO8Bbs2bfVavmn
 +Fljq7NIS4hef9WfedRklqu/4n9UhrJomHT3OPLVwO7KRYlg/EPrdWL3ym/ZpzLd3RFO/8hBe3Z
 ynHVwgLUK+6qXk4zdSomqqUNhYsGwNvDE1jlMHi4IvwylWx/Zr3mhHu783aObxEcgeqZfzVSGi9
 wXvnNlw/ePn0glDyaoT8rWgOlw4kLPZ2LBrqpMQofYyQm1q9DbOF6Q/9L5QXnNYXXt4h6LPu
X-Proofpoint-GUID: U2MfKYr0FF15aqEyGDS5IYxN8OYYg7zc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290119

From: Rob Clark <robdclark@chromium.org>

Buffers that are not shared between contexts can share a single resv
object.  This way drm_gpuvm will not track them as external objects, and
submit-time validating overhead will be O(1) for all N non-shared BOs,
instead of O(n).

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_drv.h       |  1 +
 drivers/gpu/drm/msm/msm_gem.c       | 21 +++++++++++++++++++++
 drivers/gpu/drm/msm/msm_gem_prime.c | 15 +++++++++++++++
 include/uapi/drm/msm_drm.h          | 14 ++++++++++++++
 4 files changed, 51 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 0fe3c9a24baa..9b1ccb2b18f6 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -269,6 +269,7 @@ int msm_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map);
 void msm_gem_prime_vunmap(struct drm_gem_object *obj, struct iosys_map *map);
 struct drm_gem_object *msm_gem_prime_import_sg_table(struct drm_device *dev,
 		struct dma_buf_attachment *attach, struct sg_table *sg);
+struct dma_buf *msm_gem_prime_export(struct drm_gem_object *obj, int flags);
 int msm_gem_prime_pin(struct drm_gem_object *obj);
 void msm_gem_prime_unpin(struct drm_gem_object *obj);
 
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index d16d3012434a..100d159d52e2 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -546,6 +546,9 @@ static int get_and_pin_iova_range_locked(struct drm_gem_object *obj,
 
 	msm_gem_assert_locked(obj);
 
+	if (to_msm_bo(obj)->flags & MSM_BO_NO_SHARE)
+		return -EINVAL;
+
 	vma = get_vma_locked(obj, vm, range_start, range_end);
 	if (IS_ERR(vma))
 		return PTR_ERR(vma);
@@ -1076,6 +1079,14 @@ static void msm_gem_free_object(struct drm_gem_object *obj)
 		put_pages(obj);
 	}
 
+	if (msm_obj->flags & MSM_BO_NO_SHARE) {
+		struct drm_gem_object *r_obj =
+			container_of(obj->resv, struct drm_gem_object, _resv);
+
+		/* Drop reference we hold to shared resv obj: */
+		drm_gem_object_put(r_obj);
+	}
+
 	drm_gem_object_release(obj);
 
 	kfree(msm_obj->metadata);
@@ -1108,6 +1119,15 @@ int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
 	if (name)
 		msm_gem_object_set_name(obj, "%s", name);
 
+	if (flags & MSM_BO_NO_SHARE) {
+		struct msm_context *ctx = file->driver_priv;
+		struct drm_gem_object *r_obj = drm_gpuvm_resv_obj(ctx->vm);
+
+		drm_gem_object_get(r_obj);
+
+		obj->resv = r_obj->resv;
+	}
+
 	ret = drm_gem_handle_create(file, obj, handle);
 
 	/* drop reference from allocate - handle holds it now */
@@ -1140,6 +1160,7 @@ static const struct drm_gem_object_funcs msm_gem_object_funcs = {
 	.free = msm_gem_free_object,
 	.open = msm_gem_open,
 	.close = msm_gem_close,
+	.export = msm_gem_prime_export,
 	.pin = msm_gem_prime_pin,
 	.unpin = msm_gem_prime_unpin,
 	.get_sg_table = msm_gem_prime_get_sg_table,
diff --git a/drivers/gpu/drm/msm/msm_gem_prime.c b/drivers/gpu/drm/msm/msm_gem_prime.c
index 2e37913d5a6a..4d93f2daeeaa 100644
--- a/drivers/gpu/drm/msm/msm_gem_prime.c
+++ b/drivers/gpu/drm/msm/msm_gem_prime.c
@@ -16,6 +16,9 @@ struct sg_table *msm_gem_prime_get_sg_table(struct drm_gem_object *obj)
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	int npages = obj->size >> PAGE_SHIFT;
 
+	if (msm_obj->flags & MSM_BO_NO_SHARE)
+		return ERR_PTR(-EINVAL);
+
 	if (WARN_ON(!msm_obj->pages))  /* should have already pinned! */
 		return ERR_PTR(-ENOMEM);
 
@@ -45,6 +48,15 @@ struct drm_gem_object *msm_gem_prime_import_sg_table(struct drm_device *dev,
 	return msm_gem_import(dev, attach->dmabuf, sg);
 }
 
+
+struct dma_buf *msm_gem_prime_export(struct drm_gem_object *obj, int flags)
+{
+	if (to_msm_bo(obj)->flags & MSM_BO_NO_SHARE)
+		return ERR_PTR(-EPERM);
+
+	return drm_gem_prime_export(obj, flags);
+}
+
 int msm_gem_prime_pin(struct drm_gem_object *obj)
 {
 	struct page **pages;
@@ -53,6 +65,9 @@ int msm_gem_prime_pin(struct drm_gem_object *obj)
 	if (drm_gem_is_imported(obj))
 		return 0;
 
+	if (to_msm_bo(obj)->flags & MSM_BO_NO_SHARE)
+		return -EINVAL;
+
 	pages = msm_gem_pin_pages_locked(obj);
 	if (IS_ERR(pages))
 		ret = PTR_ERR(pages);
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index b974f5a24dbc..1bccc347945c 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -140,6 +140,19 @@ struct drm_msm_param {
 
 #define MSM_BO_SCANOUT       0x00000001     /* scanout capable */
 #define MSM_BO_GPU_READONLY  0x00000002
+/* Private buffers do not need to be explicitly listed in the SUBMIT
+ * ioctl, unless referenced by a drm_msm_gem_submit_cmd.  Private
+ * buffers may NOT be imported/exported or used for scanout (or any
+ * other situation where buffers can be indefinitely pinned, but
+ * cases other than scanout are all kernel owned BOs which are not
+ * visible to userspace).
+ *
+ * In exchange for those constraints, all private BOs associated with
+ * a single context (drm_file) share a single dma_resv, and if there
+ * has been no eviction since the last submit, there are no per-BO
+ * bookeeping to do, significantly cutting the SUBMIT overhead.
+ */
+#define MSM_BO_NO_SHARE      0x00000004
 #define MSM_BO_CACHE_MASK    0x000f0000
 /* cache modes */
 #define MSM_BO_CACHED        0x00010000
@@ -149,6 +162,7 @@ struct drm_msm_param {
 
 #define MSM_BO_FLAGS         (MSM_BO_SCANOUT | \
                               MSM_BO_GPU_READONLY | \
+                              MSM_BO_NO_SHARE | \
                               MSM_BO_CACHE_MASK)
 
 struct drm_msm_gem_new {
-- 
2.50.0


