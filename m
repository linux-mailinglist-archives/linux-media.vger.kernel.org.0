Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86A7A424999
	for <lists+linux-media@lfdr.de>; Thu,  7 Oct 2021 00:26:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239805AbhJFW2W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Oct 2021 18:28:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239788AbhJFW2W (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Oct 2021 18:28:22 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EB52C061755
        for <linux-media@vger.kernel.org>; Wed,  6 Oct 2021 15:26:29 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id r18so15435612edv.12
        for <linux-media@vger.kernel.org>; Wed, 06 Oct 2021 15:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H+nOhPS+wAzJMFLxztgHfxic/R0k6dIHc6E+iJqbP5E=;
        b=U/CKsCX2gwJHEos+DYR3x1GBZiK3GJRQSgE9+ev9lBDpQOKe/XqCXbjlZ3tQT9B/Fe
         IITZwUqQZo5RMUH6U7w+0jBf3CEWseJ+yoG8VOVf0VssxrCEIqrNlgo8Jc7nVZx5C4Wi
         dqkSqRIcNGp7pGLF0bxX4r+rmkNRy8hgSJ0J8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H+nOhPS+wAzJMFLxztgHfxic/R0k6dIHc6E+iJqbP5E=;
        b=Bvh8lulqsA7y/KpIr1Viwm9gQrdueD0IEqUYy5Bu7EqnjLwhfKgUzErzMA1sWs4XSl
         1Afuxv/DXBOvqVRO4/tUu8XxRZhGAgARhXR3lPqYYCiGUCII2HdMAMYH/T5fHeg4HmL1
         r9AkR68juqzh8v1/nL0RkfjFwtWWHZWHz3x0VIVIjanBl52+wAFmMdqqZXA11f4m7CN0
         oCu22vFIwBcM5iEJTQBsdh0sgO4uk2AhqaKAehm/ITk/vPDv4qCU9gwiKoltZS0vxYnp
         9AyFEQdDBs9v7hATOksk3BqnsiL2cnM4O9pgEPp048zsCBASE0nkmDpJJUWM5OE1VQK3
         kmXg==
X-Gm-Message-State: AOAM533e08UpRqzH/ieFI/Be8N5N653B+qS4HAs4x3CiTnPhqGEpGEhj
        3IzSOOIT4C/IxjYgxuDgXP7fMw==
X-Google-Smtp-Source: ABdhPJyPk11Rfj76NbQux0A7oMaFqPHvtKi/8LsdiBFSwj+jfxfA8DRHW2tY/73HxfJOiUzXxN5ECA==
X-Received: by 2002:a17:906:230c:: with SMTP id l12mr1093856eja.52.1633559187855;
        Wed, 06 Oct 2021 15:26:27 -0700 (PDT)
Received: from alco.lan (80.71.134.83.ipv4.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id h7sm10557906edt.37.2021.10.06.15.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 15:26:27 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v4 1/8] media: ipu3-cio2 Check num_planes and sizes in queue_setup
Date:   Thu,  7 Oct 2021 00:26:18 +0200
Message-Id: <20211006222625.401122-2-ribalda@chromium.org>
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
In-Reply-To: <20211006222625.401122-1-ribalda@chromium.org>
References: <20211006222625.401122-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If num_planes is different than zero num_planes and sizes must be
checked to support the format.

Fix the following v4l2-compliance error:

Buffer ioctls (Input 0):
    fail: v4l2-test-buffers.cpp(717): q.create_bufs(node, 1, &fmt) != EINVAL
  test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL

Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
index 98cb3bc834db..356ea966cf8d 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
@@ -797,13 +797,17 @@ static int cio2_vb2_queue_setup(struct vb2_queue *vq,
 	struct cio2_queue *q = vb2q_to_cio2_queue(vq);
 	unsigned int i;
 
-	*num_planes = q->format.num_planes;
+	if (*num_planes && *num_planes < q->format.num_planes)
+		return -EINVAL;
 
-	for (i = 0; i < *num_planes; ++i) {
+	for (i = 0; i < q->format.num_planes; ++i) {
+		if (*num_planes && sizes[i] < q->format.plane_fmt[i].sizeimage)
+			return -EINVAL;
 		sizes[i] = q->format.plane_fmt[i].sizeimage;
 		alloc_devs[i] = dev;
 	}
 
+	*num_planes = q->format.num_planes;
 	*num_buffers = clamp_val(*num_buffers, 1, CIO2_MAX_BUFFERS);
 
 	/* Initialize buffer queue */
-- 
2.33.0.800.g4c38ced690-goog

