Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30A021B70F3
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2020 11:31:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727033AbgDXJbg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Apr 2020 05:31:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726851AbgDXJbe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Apr 2020 05:31:34 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACEF9C09B045;
        Fri, 24 Apr 2020 02:31:34 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id d184so4542768pfd.4;
        Fri, 24 Apr 2020 02:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hJmixU2PrWkj0dk3qkCF/oIlS2qMsZOQ6WSeOMDMwe4=;
        b=jfdfDUo7m5mp06Ypfyw/D2rrmYGOh1zDXOzzXPhV0hPC7QpjGZt5E9PFv4Hx38T0Vt
         19Bsk+Sx/ENO7hknGQ8fXAi3rP7P0yK1TYDNwKdy7I5kRHfxAtU+NQGrlV1nWBDpz75/
         D8U2+mRYzQScrH4OBCmDWpwbNYrfQZmc9+VseB62w6ZG0wEt0j5rL5OiSS7AAQnMZA48
         L+U8FcKxS0CLY+r6eQb8SuFeyGgoUzgWWfGX6EwylVPvyU5WP6Htmu7tZqzeYYQhvKba
         726KkLhnCButncSilMtFqr/waw6Jolb7qPACPetkYWva/JaMBtrPVxOFndFYLqcAi+RQ
         MebQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hJmixU2PrWkj0dk3qkCF/oIlS2qMsZOQ6WSeOMDMwe4=;
        b=IPjInLusdOVDrC7kOuCRnsy/9ur3Na+0q5r7Dnouv5JmQzcGKphoVA8oTHLCRKcsLA
         xxaSp4MxKrd4wBOjpw3m0F9BqAGpGWRLYOfij+e18C4CpfoSneN08M6Iou/j2wFJYvAF
         Si5C3u27clxcNO81yhNAZ4d0rXlAxnSMY5A59AFbiIGW5CdAQ5fC4MeS/upA03uYntlF
         5KdYSH1kmNG18OeDI0ZJafeZ8B0VJecJl4Xthdyew6ohAIIhEDl52wo9QGxFBl4Ujg2D
         vBS4uKiLw8MPvN/ssSvCdasgpEiJFfG1+ZfoZGt3hekO+IgwiukubLBfQf91rEtl887U
         UmXw==
X-Gm-Message-State: AGi0PuaE116DNnBB3L5x/JWGk9UJVgBQewIZLoze5o0q6TNr24ceb9YM
        yC5r14mX8pNRM2Gk2uDDXCw=
X-Google-Smtp-Source: APiQypIYVrp4eIX/1QCWzmFSQOWsmg0KhkwamqOlSsyLw3MgSL45w+5CYH2qqPshjBDRojasLyZlmQ==
X-Received: by 2002:aa7:9251:: with SMTP id 17mr8100836pfp.315.1587720694144;
        Fri, 24 Apr 2020 02:31:34 -0700 (PDT)
Received: from localhost.localdomain (146.85.30.125.dy.iij4u.or.jp. [125.30.85.146])
        by smtp.gmail.com with ESMTPSA id 185sm5541315pfv.9.2020.04.24.02.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 02:31:33 -0700 (PDT)
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To:     Hans Verkuil <hans.verkuil@cisco.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Subject: [PATCHv5 13/13] media: vivid: add cache_hints module param
Date:   Fri, 24 Apr 2020 18:29:20 +0900
Message-Id: <20200424092920.4801-14-sergey.senozhatsky@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200424092920.4801-1-sergey.senozhatsky@gmail.com>
References: <20200424092920.4801-1-sergey.senozhatsky@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a cache_hints module param to control per-queue user space cache
hints support.

Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
---
 Documentation/admin-guide/media/vivid.rst          | 9 +++++++++
 drivers/media/test-drivers/vivid/vivid-core.c      | 9 +++++++++
 drivers/media/test-drivers/vivid/vivid-core.h      | 1 +
 drivers/media/test-drivers/vivid/vivid-meta-cap.c  | 5 +++++
 drivers/media/test-drivers/vivid/vivid-meta-out.c  | 5 +++++
 drivers/media/test-drivers/vivid/vivid-sdr-cap.c   | 7 +++++++
 drivers/media/test-drivers/vivid/vivid-touch-cap.c | 5 +++++
 drivers/media/test-drivers/vivid/vivid-vbi-cap.c   | 5 +++++
 drivers/media/test-drivers/vivid/vivid-vbi-out.c   | 5 +++++
 drivers/media/test-drivers/vivid/vivid-vid-cap.c   | 5 +++++
 drivers/media/test-drivers/vivid/vivid-vid-out.c   | 5 +++++
 11 files changed, 61 insertions(+)

diff --git a/Documentation/admin-guide/media/vivid.rst b/Documentation/admin-guide/media/vivid.rst
index 52e57b773f07..a41fa7129dec 100644
--- a/Documentation/admin-guide/media/vivid.rst
+++ b/Documentation/admin-guide/media/vivid.rst
@@ -293,6 +293,15 @@ all configurable using the following module options:
 		- 0: vmalloc
 		- 1: dma-contig
 
+- cache_hints:
+
+	user-space cache hints selection, default is 0. It specifies if the
+	device supports user-space cache (for MMAP queues only) and memory
+	consistency hints.
+
+		- 0: forbid hints
+		- 1: allow hints
+
 Taken together, all these module options allow you to precisely customize
 the driver behavior and test your application with all sorts of permutations.
 It is also very suitable to emulate hardware that is not yet available, e.g.
diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
index 6c740e3e6999..b1bea405f382 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.c
+++ b/drivers/media/test-drivers/vivid/vivid-core.c
@@ -169,6 +169,14 @@ MODULE_PARM_DESC(allocators, " memory allocator selection, default is 0.\n"
 			     "\t\t    0 == vmalloc\n"
 			     "\t\t    1 == dma-contig");
 
+static unsigned int cache_hints[VIVID_MAX_DEVS] = {
+	[0 ... (VIVID_MAX_DEVS - 1)] = 0
+};
+module_param_array(cache_hints, uint, NULL, 0444);
+MODULE_PARM_DESC(cache_hints, " user-space cache hints, default is 0.\n"
+			     "\t\t    0 == forbid\n"
+			     "\t\t    1 == allow");
+
 static struct vivid_dev *vivid_devs[VIVID_MAX_DEVS];
 
 const struct v4l2_rect vivid_min_rect = {
@@ -819,6 +827,7 @@ static int vivid_create_queue(struct vivid_dev *dev,
 	q->lock = &dev->mutex;
 	q->dev = dev->v4l2_dev.dev;
 	q->supports_requests = true;
+	dev->allow_cache_hints = (cache_hints[dev->inst] == 1);
 
 	return vb2_queue_init(q);
 }
diff --git a/drivers/media/test-drivers/vivid/vivid-core.h b/drivers/media/test-drivers/vivid/vivid-core.h
index 99e69b8f770f..75ab627ba91f 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.h
+++ b/drivers/media/test-drivers/vivid/vivid-core.h
@@ -572,6 +572,7 @@ struct vivid_dev {
 
 	bool				meta_pts;
 	bool				meta_scr;
+	bool				allow_cache_hints;
 };
 
 static inline bool vivid_is_webcam(const struct vivid_dev *dev)
diff --git a/drivers/media/test-drivers/vivid/vivid-meta-cap.c b/drivers/media/test-drivers/vivid/vivid-meta-cap.c
index 780f96860a6d..0ba8fff47106 100644
--- a/drivers/media/test-drivers/vivid/vivid-meta-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-meta-cap.c
@@ -34,6 +34,11 @@ static int meta_cap_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
 		*nbuffers = 2 - vq->num_buffers;
 
 	*nplanes = 1;
+
+	if (dev->allow_cache_hints && vq->memory == VB2_MEMORY_MMAP)
+		vq->allow_cache_hints = 1;
+	else
+		vq->allow_cache_hints = 0;
 	return 0;
 }
 
diff --git a/drivers/media/test-drivers/vivid/vivid-meta-out.c b/drivers/media/test-drivers/vivid/vivid-meta-out.c
index ff8a039aba72..6be56f1230d4 100644
--- a/drivers/media/test-drivers/vivid/vivid-meta-out.c
+++ b/drivers/media/test-drivers/vivid/vivid-meta-out.c
@@ -34,6 +34,11 @@ static int meta_out_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
 		*nbuffers = 2 - vq->num_buffers;
 
 	*nplanes = 1;
+
+	if (dev->allow_cache_hints && vq->memory == VB2_MEMORY_MMAP)
+		vq->allow_cache_hints = 1;
+	else
+		vq->allow_cache_hints = 0;
 	return 0;
 }
 
diff --git a/drivers/media/test-drivers/vivid/vivid-sdr-cap.c b/drivers/media/test-drivers/vivid/vivid-sdr-cap.c
index 2b7522e16efc..f87cd7d0fada 100644
--- a/drivers/media/test-drivers/vivid/vivid-sdr-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-sdr-cap.c
@@ -211,9 +211,16 @@ static int sdr_cap_queue_setup(struct vb2_queue *vq,
 		       unsigned *nbuffers, unsigned *nplanes,
 		       unsigned sizes[], struct device *alloc_devs[])
 {
+	struct vivid_dev *dev = vb2_get_drv_priv(vq);
+
 	/* 2 = max 16-bit sample returned */
 	sizes[0] = SDR_CAP_SAMPLES_PER_BUF * 2;
 	*nplanes = 1;
+
+	if (dev->allow_cache_hints && vq->memory == VB2_MEMORY_MMAP)
+		vq->allow_cache_hints = 1;
+	else
+		vq->allow_cache_hints = 0;
 	return 0;
 }
 
diff --git a/drivers/media/test-drivers/vivid/vivid-touch-cap.c b/drivers/media/test-drivers/vivid/vivid-touch-cap.c
index ebb00b128030..af43a5f69ea0 100644
--- a/drivers/media/test-drivers/vivid/vivid-touch-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-touch-cap.c
@@ -27,6 +27,11 @@ static int touch_cap_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
 		*nbuffers = 2 - vq->num_buffers;
 
 	*nplanes = 1;
+
+	if (dev->allow_cache_hints && vq->memory == VB2_MEMORY_MMAP)
+		vq->allow_cache_hints = 1;
+	else
+		vq->allow_cache_hints = 0;
 	return 0;
 }
 
diff --git a/drivers/media/test-drivers/vivid/vivid-vbi-cap.c b/drivers/media/test-drivers/vivid/vivid-vbi-cap.c
index 1a9348eea781..126754c0bee4 100644
--- a/drivers/media/test-drivers/vivid/vivid-vbi-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-vbi-cap.c
@@ -138,6 +138,11 @@ static int vbi_cap_queue_setup(struct vb2_queue *vq,
 		*nbuffers = 2 - vq->num_buffers;
 
 	*nplanes = 1;
+
+	if (dev->allow_cache_hints && vq->memory == VB2_MEMORY_MMAP)
+		vq->allow_cache_hints = 1;
+	else
+		vq->allow_cache_hints = 0;
 	return 0;
 }
 
diff --git a/drivers/media/test-drivers/vivid/vivid-vbi-out.c b/drivers/media/test-drivers/vivid/vivid-vbi-out.c
index cd56476902a2..d35b458c01d2 100644
--- a/drivers/media/test-drivers/vivid/vivid-vbi-out.c
+++ b/drivers/media/test-drivers/vivid/vivid-vbi-out.c
@@ -34,6 +34,11 @@ static int vbi_out_queue_setup(struct vb2_queue *vq,
 		*nbuffers = 2 - vq->num_buffers;
 
 	*nplanes = 1;
+
+	if (dev->allow_cache_hints && vq->memory == VB2_MEMORY_MMAP)
+		vq->allow_cache_hints = 1;
+	else
+		vq->allow_cache_hints = 0;
 	return 0;
 }
 
diff --git a/drivers/media/test-drivers/vivid/vivid-vid-cap.c b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
index e94beef008c8..d0dfd3632ba9 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
@@ -129,6 +129,11 @@ static int vid_cap_queue_setup(struct vb2_queue *vq,
 
 	*nplanes = buffers;
 
+	if (dev->allow_cache_hints && vq->memory == VB2_MEMORY_MMAP)
+		vq->allow_cache_hints = 1;
+	else
+		vq->allow_cache_hints = 0;
+
 	dprintk(dev, 1, "%s: count=%d\n", __func__, *nbuffers);
 	for (p = 0; p < buffers; p++)
 		dprintk(dev, 1, "%s: size[%u]=%u\n", __func__, p, sizes[p]);
diff --git a/drivers/media/test-drivers/vivid/vivid-vid-out.c b/drivers/media/test-drivers/vivid/vivid-vid-out.c
index ee3446e3217c..4af8aaa13ffa 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-out.c
+++ b/drivers/media/test-drivers/vivid/vivid-vid-out.c
@@ -78,6 +78,11 @@ static int vid_out_queue_setup(struct vb2_queue *vq,
 
 	*nplanes = planes;
 
+	if (dev->allow_cache_hints && vq->memory == VB2_MEMORY_MMAP)
+		vq->allow_cache_hints = 1;
+	else
+		vq->allow_cache_hints = 0;
+
 	dprintk(dev, 1, "%s: count=%d\n", __func__, *nbuffers);
 	for (p = 0; p < planes; p++)
 		dprintk(dev, 1, "%s: size[%u]=%u\n", __func__, p, sizes[p]);
-- 
2.26.2

