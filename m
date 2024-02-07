Return-Path: <linux-media+bounces-4838-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8EF84D0CA
	for <lists+linux-media@lfdr.de>; Wed,  7 Feb 2024 19:11:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3EEA31F285ED
	for <lists+linux-media@lfdr.de>; Wed,  7 Feb 2024 18:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A56D84FC7;
	Wed,  7 Feb 2024 18:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="cbthdf0v"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903027D3E6
	for <linux-media@vger.kernel.org>; Wed,  7 Feb 2024 18:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707328934; cv=none; b=UmvLJHFFWX9m5xVuk8KHgazq2d6d0pbkj/Ph0CMMgrScmkaj4Hd0lcmNTVY8fwx0GdiLrquCYI+l16PUHV+he0UHfMgmQVcb9y3Limc8b5tV4S0EXDhUvZRCKKpl/PeUE4dbAqEBe+edyVVjSoyVIITNsR7gyxErYvm48Iy4tm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707328934; c=relaxed/simple;
	bh=w4okx/B33Ta4mIyM2W5dILgJDiRa0pz58/KwmLeZ/rw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Wj3tX+KEXbxBk1ewc5JPo8oC9GHOEuSQRmfpXeqHZqwsoLiLTTTenfjQP6C7qkLAdSNAYIxvLSjgz/mWLNuLnfNf+Wubz9vvasM/8qtu+/xs0gA1FbSRIWNV098RdWcbnytSrn2W32Z6UDMTDdZWGfeYLyoDNCXA/GE9iAL0tD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=cbthdf0v; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-33b352a3ae0so35214f8f.0
        for <linux-media@vger.kernel.org>; Wed, 07 Feb 2024 10:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1707328930; x=1707933730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fTie9X02LUZlS6EEEi4aYupSAjOSD5icxvNUzEugVLM=;
        b=cbthdf0vsJj/kfFW8YMr1TCR1EhzaGg7yRdrXIvZXh97okmmqIoWgrbHeRzh/oJVPB
         BlqKuLA86InGbG7PSF4T8NjqrFK6NDtZlhwsKJoMVOe1PliMN9ikP5YVjkom6sUpF07s
         HHrlSU+QphKpLZcyjJ9QKPdranKib7RfR7VZc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707328930; x=1707933730;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fTie9X02LUZlS6EEEi4aYupSAjOSD5icxvNUzEugVLM=;
        b=jUcoCf6h+41spyzY782HoPxEOQXuVYpUX2bLV2/4mqEM2X5LTonTPrJtogPqDrDEJE
         qj7rOGdwjXXHG8sO7tJZ8e9yie3f4Ah8fNES0oLUpEXDxirYX83NryjPj+Ov1k8AEMJr
         UNyBS2JNi7U/GMzqDOW9slWFYej1VZbYnEdV4YeWtetNetzd76jxmby0p+NtQj+IM8sP
         G9Q6m8mrVvN/bjcgExI70M2w4KZugPinZcZBob4z3+AdriXYcgCHATETvadsMSAsIzly
         CUTWyp9n8yfDT0PrRPlLj3rOV8lGfWP2sMRqZ3JSn4hdrV2iNo5W5hmX0KfkX0d/8R7z
         vMWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZrpSjxRj3QSBpYRijSzOaES0rYs4dhZJx3EZy5OoSn4zrh19nPigsNbqyqV6FUMfB6nAMe4M63eIfS1WxKgmKjsGOiwMxlSd8JkM=
X-Gm-Message-State: AOJu0YzDopnQEWgFAhqBhF7Z7gyBeKboosDs7tVjEgGG+UaEHpJ+iNmO
	2qmY0k3zFTZPkxzctTcDfijeIT4OOeItZzNvQzZM+kIVW5ztEl3G3IOUVSAlgSo=
X-Google-Smtp-Source: AGHT+IHqn7asFg55QdASw1RfE27vqthPRSMN0lHrVQGCD6NNTmq34xx1xMEfh/0PEB0EeQNTj5iWsw==
X-Received: by 2002:a5d:6dab:0:b0:33b:4a2b:1b1 with SMTP id u11-20020a5d6dab000000b0033b4a2b01b1mr4139253wrs.4.1707328929685;
        Wed, 07 Feb 2024 10:02:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXppY6D1aoyIYs6e0KXhXxPo1TXWnoCjo4RlxQwApSrZx2LvU5KzTbT6CM67f6UX2fw9wYhxSBIm/Ud4WsASGcKjNgzyrdR8nTeTw0Gcy9rsRw6z9J7Po5+2VDvqswkGypOJqCgnQ8IFUHSwqGxBmWCR/jePAExj6wckyoTh4c2QxAer4WONp1ID69/XUisILMrsgO8L63JQ5oZXAT07Xhg7VGrmifmlAloh8IPP5lLnXfad+4HBW2Q4hCzN1xADgCb+I7FFOz9XCFij7zgUFiDOvzmiC1atUu0qHEFbzVU9o5f2eVR
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id t4-20020a05600001c400b0033b44355a08sm2005948wrx.5.2024.02.07.10.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 10:02:09 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
	Daniel Vetter <daniel.vetter@ffwll.ch>,
	Daniel Vetter <daniel.vetter@intel.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH] dma-buf: try to catch swiotlb bounce buffers
Date: Wed,  7 Feb 2024 19:02:01 +0100
Message-ID: <20240207180201.118681-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

They rather fundamentally break the entire concept of zero copy, so if
an exporter manages to hand these out things will break all over.

Luckily there's not too many case that use
swiotlb_sync_single_for_device/cpu():

- The generic iommu dma-api code in drivers/iommu/dma-iommu.c. We can
  catch that with sg_dma_is_swiotlb() reliably.

- The generic direct dma code in kernel/dma/direct.c. We can mostly
  catch that with looking for a NULL dma_ops, except for some powerpc
  special cases.

- Xen, which I don't bother to catch here.

Implement these checks in dma_buf_map_attachment when
CONFIG_DMA_API_DEBUG is enabled.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Cc: Paul Cercueil <paul@crapouillou.net>
---
Entirely untested, but since I sent the mail with the idea I figured I
might as well type it up after I realized there's a lot fewer cases to
check. That is, if I haven't completely misread the dma-api and swiotlb
code.
-Sima
---
 drivers/dma-buf/dma-buf.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index d1e7f823fbdb..d6f95523f995 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -28,6 +28,12 @@
 #include <linux/mount.h>
 #include <linux/pseudo_fs.h>
 
+#ifdef CONFIG_DMA_API_DEBUG
+#include <linux/dma-direct.h>
+#include <linux/dma-map-ops.h>
+#include <linux/swiotlb.h>
+#endif
+
 #include <uapi/linux/dma-buf.h>
 #include <uapi/linux/magic.h>
 
@@ -1149,10 +1155,13 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
 #ifdef CONFIG_DMA_API_DEBUG
 	if (!IS_ERR(sg_table)) {
 		struct scatterlist *sg;
+		struct device *dev = attach->dev;
 		u64 addr;
 		int len;
 		int i;
 
+		bool is_direct_dma = !get_dma_ops(dev);
+
 		for_each_sgtable_dma_sg(sg_table, sg, i) {
 			addr = sg_dma_address(sg);
 			len = sg_dma_len(sg);
@@ -1160,7 +1169,15 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
 				pr_debug("%s: addr %llx or len %x is not page aligned!\n",
 					 __func__, addr, len);
 			}
+
+			if (is_direct_dma) {
+				phys_addr_t paddr = dma_to_phys(dev, addr);
+
+				WARN_ON_ONCE(is_swiotlb_buffer(dev, paddr));
+			}
 		}
+
+		WARN_ON_ONCE(sg_dma_is_swiotlb(sg));
 	}
 #endif /* CONFIG_DMA_API_DEBUG */
 	return sg_table;
-- 
2.43.0


