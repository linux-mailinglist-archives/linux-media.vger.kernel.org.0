Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50284605FCF
	for <lists+linux-media@lfdr.de>; Thu, 20 Oct 2022 14:13:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229991AbiJTMNZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Oct 2022 08:13:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229783AbiJTMNX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Oct 2022 08:13:23 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A44E15B33C
        for <linux-media@vger.kernel.org>; Thu, 20 Oct 2022 05:13:22 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id sc25so46847767ejc.12
        for <linux-media@vger.kernel.org>; Thu, 20 Oct 2022 05:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iU7Ami80HgupJejJurFRg6REd9+0fdnmtvN6kf9fvrM=;
        b=YFmoiqdZUBvC+qFN4kk5CTQPdnf9XhwtohpUYscevmN3jNaa4iFjgNcC2RM4jiQnjB
         9QQenxNMrEOb47eteh6gQCK+aTvV9QnUjsLplkE/gnlBn6ZZCmvRMolI7L7lkS8gfDJN
         XzpHrUX6pWw4JKBoGNh96KK6b9moEebp2+jcLNqnpX8KY/h6kpX11NqOyTWU2Us9cK70
         njdXYgopNoZCXEkJZG5ecV5jI3yOTPGDQ9RiNZ3pTkUvACi07cPoLI0BEZu4xdQoiB7v
         a/DjTDxQFS+Y9jlzSNWjadoUcCyCE//D+fs8NQOdH80OulAh6H5w5F6WKZD3tYpl9k0y
         8HUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iU7Ami80HgupJejJurFRg6REd9+0fdnmtvN6kf9fvrM=;
        b=LUe4PKAqcWpPu1rAQ+ibO91ApkAqoC6niVZL5lvUURf+a81EXkha9yWXczCNDHfOEx
         agnoBqqp2pFASPFg5s0nVz8LbUhM+oRhjqCymjWh2TW+Z27iMVi7BR9zu2JepXU1HyJP
         Er7I1HRPcfnMY71Icda9Ur+bfCp9DViNdl5jcAbTDXpeHCfxFyC/4Xsa30Mdklz9dicD
         pu+iM10JEh/FYTAnP8WA44u/AS61X+8YpwHWExAbs+nJvE+Sbe+dpfmyAqtru9mzoxSx
         0IT3FtuxPFH1Uy/4LzNPahp3a3bo+kvVgo/y6JCtqTnLcW7DW1r8C7fkdWPqSXc8zGeq
         f9wQ==
X-Gm-Message-State: ACrzQf1ZBzmyupPOb9I2qzFVCDYABknYOkxpn9QgLZRgqDNfR+ced7MM
        BglKjpCue8m5sGZF86JmZxE=
X-Google-Smtp-Source: AMsMyM4E5G4lZ2GfE7xMWxIcUkc1BGvYjZ6cG1RBPZY7QZErHLQSw1Tvl2XS3C3UC5WoYKpuZXDWUA==
X-Received: by 2002:a17:907:2d91:b0:78d:8747:71b4 with SMTP id gt17-20020a1709072d9100b0078d874771b4mr10614819ejc.545.1666268001024;
        Thu, 20 Oct 2022 05:13:21 -0700 (PDT)
Received: from able.fritz.box (p5b0eacfe.dip0.t-ipconnect.de. [91.14.172.254])
        by smtp.gmail.com with ESMTPSA id s15-20020a05640217cf00b0045467008dd0sm12091979edy.35.2022.10.20.05.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 05:13:20 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     l.stach@pengutronix.de, nicolas@ndufresne.ca, ppaalanen@gmail.com,
        sumit.semwal@linaro.org, daniel@ffwll.ch, robdclark@gmail.com,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org
Cc:     =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH 1/3] dma-buf: add dma_coherent flag
Date:   Thu, 20 Oct 2022 14:13:14 +0200
Message-Id: <20221020121316.3946-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221020121316.3946-1-christian.koenig@amd.com>
References: <20221020121316.3946-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Start to fix the coherency issues for non PCI devices by adding a dma_coherent
flag to the DMA-buf.

The flag should be set by the exporter if only devices which can do coherent
DMA-access with respect to the CPU cache are allowed to access the buffer.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-buf.c |  5 +++++
 include/linux/dma-buf.h   | 16 ++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index c40d72d318fd..7509807bf485 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -15,6 +15,7 @@
 #include <linux/slab.h>
 #include <linux/dma-buf.h>
 #include <linux/dma-fence.h>
+#include <linux/dma-map-ops.h>
 #include <linux/anon_inodes.h>
 #include <linux/export.h>
 #include <linux/debugfs.h>
@@ -635,6 +636,7 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
 
 	dmabuf->priv = exp_info->priv;
 	dmabuf->ops = exp_info->ops;
+	dmabuf->dma_coherent = exp_info->coherent;
 	dmabuf->size = exp_info->size;
 	dmabuf->exp_name = exp_info->exp_name;
 	dmabuf->owner = exp_info->owner;
@@ -894,6 +896,9 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
 	if (WARN_ON(importer_ops && !importer_ops->move_notify))
 		return ERR_PTR(-EINVAL);
 
+	if (dmabuf->dma_coherent && !dev_is_dma_coherent(dev))
+		return ERR_PTR(-EINVAL);
+
 	attach = kzalloc(sizeof(*attach), GFP_KERNEL);
 	if (!attach)
 		return ERR_PTR(-ENOMEM);
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index 6fa8d4e29719..f2083b94b116 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -326,6 +326,20 @@ struct dma_buf {
 	/** @ops: dma_buf_ops associated with this buffer object. */
 	const struct dma_buf_ops *ops;
 
+	/**
+	 * @dma_coherent:
+	 *
+	 * True if the buffer is backed by DMA coherent memory with respect to
+	 * the CPU cache even if the architecture can support incoherent
+	 * devices.
+	 *
+	 * Usually mirrors the result of dev_is_dma_coherent() of the exporter,
+	 * but can be cleared by the exporter to allow incoherent devices
+	 * access to the buffer if the exporter takes care of coherency for CPU
+	 * accesses.
+	 */
+	bool dma_coherent;
+
 	/**
 	 * @vmapping_counter:
 	 *
@@ -524,6 +538,7 @@ struct dma_buf_attachment {
  * @ops:	Attach allocator-defined dma buf ops to the new buffer
  * @size:	Size of the buffer - invariant over the lifetime of the buffer
  * @flags:	mode flags for the file
+ * @coherent:	If DMA accesses must be coherent to the CPU cache.
  * @resv:	reservation-object, NULL to allocate default one
  * @priv:	Attach private data of allocator to this buffer
  *
@@ -536,6 +551,7 @@ struct dma_buf_export_info {
 	const struct dma_buf_ops *ops;
 	size_t size;
 	int flags;
+	bool coherent;
 	struct dma_resv *resv;
 	void *priv;
 };
-- 
2.25.1

