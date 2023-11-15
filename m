Return-Path: <linux-media+bounces-360-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9777EBF7D
	for <lists+linux-media@lfdr.de>; Wed, 15 Nov 2023 10:30:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98B331C208E4
	for <lists+linux-media@lfdr.de>; Wed, 15 Nov 2023 09:30:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5172C7465;
	Wed, 15 Nov 2023 09:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GHBEbi8V"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E09063A5
	for <linux-media@vger.kernel.org>; Wed, 15 Nov 2023 09:30:39 +0000 (UTC)
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C88C9F
	for <linux-media@vger.kernel.org>; Wed, 15 Nov 2023 01:30:38 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-99bdeae1d0aso960840666b.1
        for <linux-media@vger.kernel.org>; Wed, 15 Nov 2023 01:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700040637; x=1700645437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=yB7Vx9jRhXPtu5tqEcLUYKJwFbScID9ZtZB3ZSvKBco=;
        b=GHBEbi8Vh1mfoGi79xMjaDs7S6ox0m3RmcB9Ykg6YWJ25hHjFAtUJVTwfuxUo91QoU
         be7oWvHp9k+iN4qptKuDYXmcjSU9PP8Fu7Tvh9r0eOCOpAy+tM8G+VZIUL0WPl47zL5y
         f5jIFVHVMY27c9uLt2RBQIedNDODSyS9OwFghPB4zyB/wMB6wxa6SjVO+X2Zlpw/NtKh
         Tm+tyrSVeRWX0k8h2yO1EqCYJr3B16eE2qH/L4wjzog74FA2JxqN5hIYUKy1X6RgaUGQ
         wH7AcPsApDO2WXiSjND2fDINmthdMoA22CPt3vTKyeIw00Liqpf7VhEmyJPqPhcbjH95
         DgtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700040637; x=1700645437;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yB7Vx9jRhXPtu5tqEcLUYKJwFbScID9ZtZB3ZSvKBco=;
        b=T0DOBRu3qF8QwJuPnUBiENqFJ+iqz9u3rpL8PzSTwpNjbE8zaQfl3l/ixWrhq4ipb4
         vSi2nyBWvviEHacokeWGgBh6cK2bNohOdh/HqVYBj/Ts6xc5zTplv6qA/tNw3obtZ41U
         CCL3vRHQ9PD2S6nfgVESY/0DnvflGiTNvOJpB4TBTlSjTC1CSPCyBSQ1qx1o984AMR7K
         TUeZ0opCpGKAvfBSbOVsyBtVryfRoy35kZvcj1F9LjKQyPry16bYDCEaEi6EYfubKvat
         bi0Hg5UmsVrmabyqvZOUJC7H4Zu8t7wab2EPEXpezf62IJSkRIwZSi3CjxjVpl2QdrBH
         tRLQ==
X-Gm-Message-State: AOJu0Yxqwa7dZK5UTUk66NMwdPZcf+CJAexHHT5J/BuMNocajN7UwHsQ
	rkFRTDy2YEOGMZ2ItcDpNwQ=
X-Google-Smtp-Source: AGHT+IGSUIO1vf/vS6SCJdIo3iWj+1ibt6jwIe6cS2Zz1J88lLlR4jPJ2yLG0oV0Crvhh3hBAPUrDQ==
X-Received: by 2002:a17:906:d14b:b0:9ad:7890:b4c0 with SMTP id br11-20020a170906d14b00b009ad7890b4c0mr7671598ejb.56.1700040636600;
        Wed, 15 Nov 2023 01:30:36 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:1581:a900:e649:e473:229b:cd53])
        by smtp.gmail.com with ESMTPSA id ga33-20020a1709070c2100b0099e12a49c8fsm6880255ejc.173.2023.11.15.01.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 01:30:36 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To: sumit.semwal@linaro.org,
	faith.ekstrand@collabora.com,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH] dma-buf: fix check in dma_resv_add_fence
Date: Wed, 15 Nov 2023 10:30:35 +0100
Message-Id: <20231115093035.1889-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It's valid to add the same fence multiple times to a dma-resv object and
we shouldn't need one extra slot for each.

Signed-off-by: Christian König <christian.koenig@amd.com>
Fixes: a3f7c10a269d5 ("dma-buf/dma-resv: check if the new fence is really later")
Cc: stable@vger.kernel.org # v5.19+
---
 drivers/dma-buf/dma-resv.c |  2 +-
 include/linux/dma-fence.h  | 15 +++++++++++++++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 38b4110378de..eb8b733065b2 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -301,7 +301,7 @@ void dma_resv_add_fence(struct dma_resv *obj, struct dma_fence *fence,
 
 		dma_resv_list_entry(fobj, i, obj, &old, &old_usage);
 		if ((old->context == fence->context && old_usage >= usage &&
-		     dma_fence_is_later(fence, old)) ||
+		     dma_fence_is_later_or_same(fence, old)) ||
 		    dma_fence_is_signaled(old)) {
 			dma_resv_list_set(fobj, i, fence, usage);
 			dma_fence_put(old);
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index ebe78bd3d121..b3772edca2e6 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -498,6 +498,21 @@ static inline bool dma_fence_is_later(struct dma_fence *f1,
 	return __dma_fence_is_later(f1->seqno, f2->seqno, f1->ops);
 }
 
+/**
+ * dma_fence_is_later_or_same - return true if f1 is later or same as f2
+ * @f1: the first fence from the same context
+ * @f2: the second fence from the same context
+ *
+ * Returns true if f1 is chronologically later than f2 or the same fence. Both
+ * fences must be from the same context, since a seqno is not re-used across
+ * contexts.
+ */
+static inline bool dma_fence_is_later_or_same(struct dma_fence *f1,
+					      struct dma_fence *f2)
+{
+	return f1 == f2 || dma_fence_is_later(f1, f2);
+}
+
 /**
  * dma_fence_later - return the chronologically later fence
  * @f1:	the first fence from the same context
-- 
2.34.1


