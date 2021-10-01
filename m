Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BC6241EBCA
	for <lists+linux-media@lfdr.de>; Fri,  1 Oct 2021 13:25:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353765AbhJAL1L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Oct 2021 07:27:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353650AbhJAL1K (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Oct 2021 07:27:10 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C682EC06177C
        for <linux-media@vger.kernel.org>; Fri,  1 Oct 2021 04:25:26 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id v127so6942202wme.5
        for <linux-media@vger.kernel.org>; Fri, 01 Oct 2021 04:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tcQmVSrI7OejMP059qa+UggNTXs47BJZTPvAsqru6K4=;
        b=kxEmcp38i2Zwrx2Y/ZDQXaeMbeRJ+t1lH5XmKz2J+JrGtkIvbq+sh/0qJKz6+tbKDu
         AmAGA4Ig1Q/ZwFqedhf0qO64zNOEF+jxQ3IKuazABzsWXgf24E1L0g24WX2+0hGY5oC2
         exHMzWvERhGa4MZsdzcBNCgF3QI6aVQu1OMKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tcQmVSrI7OejMP059qa+UggNTXs47BJZTPvAsqru6K4=;
        b=X+qeTXmn/nFAtABm12Bh+BmV9dAhACh32Zofqov+My3Om+/U5Xxl637lDmZgyzR5n2
         T5OeTyF0plSMJtyumq6X7wdMT7e1XZwUzpjEyaAU1bWfyZu1P8dgi7W4u2gqkDAlGHjj
         AnSKbJC47wxTdM2MszIomVgp/Sq4uOyusePeXFHx4jZ3juwFQ+DkIGa8p5XDi10721td
         Ysork5X4CWLBNbjmcF+32Lehe+kJhSwY7fAwV8RGu9x5J+PyDBSFcr1lLL5v8908r/ij
         Jt+yCJHDhAA8RmXhzSiefRs5/UpM0PcipPAJSpkbsEday5k1iS5+bVv6DQsms6I/QOKJ
         YA8w==
X-Gm-Message-State: AOAM530ZihBhtiPTvjkqcdXguP6cSkp4fkuopC7279VOJi1oe6jdfl94
        oQ/8IBrwBTEfxiak+sr3ruvg5A==
X-Google-Smtp-Source: ABdhPJxFFSdqYaT34QsUzUV4aO+hqTEvapgasOeqx8dhRNM+mrPE+kM+gPRAj3JHwZZS5GoHLuyoHw==
X-Received: by 2002:a1c:f609:: with SMTP id w9mr3935009wmc.24.1633087525430;
        Fri, 01 Oct 2021 04:25:25 -0700 (PDT)
Received: from beni.c.googlers.com.com (216.131.76.34.bc.googleusercontent.com. [34.76.131.216])
        by smtp.gmail.com with ESMTPSA id x17sm5530958wrc.51.2021.10.01.04.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 04:25:25 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v3 1/8] media: ipu3-cio2 Check num_planes and sizes in queue_setup
Date:   Fri,  1 Oct 2021 11:25:15 +0000
Message-Id: <20211001112522.2839602-2-ribalda@chromium.org>
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
In-Reply-To: <20211001112522.2839602-1-ribalda@chromium.org>
References: <20211001112522.2839602-1-ribalda@chromium.org>
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
index 47db0ee0fcbfa..36099e95d29f2 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
@@ -798,13 +798,17 @@ static int cio2_vb2_queue_setup(struct vb2_queue *vq,
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
 		alloc_devs[i] = &cio2->pci_dev->dev;
 	}
 
+	*num_planes = q->format.num_planes;
 	*num_buffers = clamp_val(*num_buffers, 1, CIO2_MAX_BUFFERS);
 
 	/* Initialize buffer queue */
-- 
2.33.0.800.g4c38ced690-goog

