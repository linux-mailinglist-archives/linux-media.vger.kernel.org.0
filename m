Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 464B7605FD0
	for <lists+linux-media@lfdr.de>; Thu, 20 Oct 2022 14:13:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229783AbiJTMNb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Oct 2022 08:13:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229997AbiJTMNa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Oct 2022 08:13:30 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FDF5187DD2
        for <linux-media@vger.kernel.org>; Thu, 20 Oct 2022 05:13:27 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id w18so46883792ejq.11
        for <linux-media@vger.kernel.org>; Thu, 20 Oct 2022 05:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6+v29EKFl+eJvb82q1HKwVTg2HY11/VB4Svx4P9W+lo=;
        b=YqFUB2RVnHN5EsUo3VW1I9AsNIcJJQLV4S+D44r9T9b6ym2gHsJKjzGJimsfO6xmbU
         A/+REzVhwdsNLSGCWIlcXJnVzRV5XGbNg2/RaaZKNEi53jQhLaFGPH8liVB+C996ROnc
         E1C7cbICnMASBOMmLMtdY6huElsnoE+NKhqTKQuA/qOlUY6R49cmAb/38cLDHTGowhY4
         yUOGRnuAFJ5PnrBCfk8n9kco9tJZxEyyQWN+mfjRog96QiZ7rsio7eYITjKsjVmyrG7q
         jZwXCk33x8Jwjap9Zfv/JsVGZhluG1rEZaKxg0vX/31a+Q3b8L3mtUsmk97ho1lIr3Iy
         5Q3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6+v29EKFl+eJvb82q1HKwVTg2HY11/VB4Svx4P9W+lo=;
        b=KAvAY6GbztHic6HS4B//5q/LZi6eTyZRMb2YAqeaurTcYuTnIGDR+Rm+Omx2bknc5w
         fW23rmR2ykYfGJmV8WX0Vt0m/vi1kWSGMQrt1KCHDF17x7aFjpIlfKMWMQiKQJnFUjNJ
         wCG2eyewkkfdoZ4T8E/vFhZii1+iUTyQJ4XdAlAXJqKSkUFHtH6mL1A0Hv25nJ9L223t
         LxxiEUg7NbxYWRgfm1L/reAuk+v1ZWNgi8Q64vkR0Fhs2FRD7jbisMlAUs7QXURjcuDT
         0NLnBCB1kZfvkSLwMvBBHINUz5V3MF9dRxwVF9vv//zzwuoQxpRa4RRAo75MtlVTA/ci
         0fAA==
X-Gm-Message-State: ACrzQf1B8Fgz8faRxHVPTqL/cA6PI5K3+46k8bbjJC550aFhylNbXcG2
        UnaNoVIS/LRq+Ju/W3v6nhw=
X-Google-Smtp-Source: AMsMyM6BChwqh4PIcxBaoBdOLcOjBF6P/9MGAQWN+q+1y6+Muz30Cs5s0ZOBk0hSI0JvdUfHbEu7gA==
X-Received: by 2002:a17:907:31c4:b0:78d:9b2f:4e1a with SMTP id xf4-20020a17090731c400b0078d9b2f4e1amr10731462ejb.306.1666268006079;
        Thu, 20 Oct 2022 05:13:26 -0700 (PDT)
Received: from able.fritz.box (p5b0eacfe.dip0.t-ipconnect.de. [91.14.172.254])
        by smtp.gmail.com with ESMTPSA id s15-20020a05640217cf00b0045467008dd0sm12091979edy.35.2022.10.20.05.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 05:13:25 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     l.stach@pengutronix.de, nicolas@ndufresne.ca, ppaalanen@gmail.com,
        sumit.semwal@linaro.org, daniel@ffwll.ch, robdclark@gmail.com,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org
Cc:     =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH 2/3] drm/prime: set the dma_coherent flag for export
Date:   Thu, 20 Oct 2022 14:13:15 +0200
Message-Id: <20221020121316.3946-3-christian.koenig@amd.com>
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

When a device driver is snooping the CPU cache during access we assume
that all importers need to be able to snoop the CPU cache as well.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_prime.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 20e109a802ae..d5c70b6fe8a4 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -28,6 +28,7 @@
 
 #include <linux/export.h>
 #include <linux/dma-buf.h>
+#include <linux/dma-map-ops.h>
 #include <linux/rbtree.h>
 #include <linux/module.h>
 
@@ -889,6 +890,7 @@ struct dma_buf *drm_gem_prime_export(struct drm_gem_object *obj,
 		.size = obj->size,
 		.flags = flags,
 		.priv = obj,
+		.coherent = dev_is_dma_coherent(dev->dev),
 		.resv = obj->resv,
 	};
 
-- 
2.25.1

