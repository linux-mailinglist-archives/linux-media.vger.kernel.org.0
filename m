Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9762951AC0C
	for <lists+linux-media@lfdr.de>; Wed,  4 May 2022 20:02:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343510AbiEDSFn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 May 2022 14:05:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376499AbiEDSES (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 May 2022 14:04:18 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C49A14FC4D
        for <linux-media@vger.kernel.org>; Wed,  4 May 2022 10:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651684737;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=3t8epFEjcxVGinupv1KfUngZ1NH7mCjOSa22VqDXFR0=;
        b=X1+4HlfZBhTqWCgP1r5i8asWa5k/8KZqFkILiwIgoa/ebK0fILBDn1kv2Q+C+UexoTywc6
        FBnzZpoeCmKvxJAGs3b46jz3mnI4xhrpKPeTL61tszjksPi2yodu0urO3g+YI27F+F/3Sa
        AyKObawJMjlCsttouj9uXen+WzX3vDo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-SYi26IApO_6G33qATbnfIg-1; Wed, 04 May 2022 13:18:56 -0400
X-MC-Unique: SYi26IApO_6G33qATbnfIg-1
Received: by mail-ej1-f69.google.com with SMTP id hq12-20020a1709073f0c00b006f48c335617so1229311ejc.2
        for <linux-media@vger.kernel.org>; Wed, 04 May 2022 10:18:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3t8epFEjcxVGinupv1KfUngZ1NH7mCjOSa22VqDXFR0=;
        b=wMorTBuktj4kIoQS0SkRIKG2Y2GsnyePitcnAo5k/bhtY14zn8fRXj4d27p4RHumHW
         X5v7/8O+pnOnW4PJVvF2vtqAhlc5FUHpIbw4BvOSjjH6a3A7lg2wT77p/1Ym/kVgG7uL
         iogd9c6TRR/XET07TCjg1m+APYRP2m3mwUquoW0eZgN74eek9H0mLTkBdxW1alIMwiSf
         lezxbTRHmLSsl5/X66MUjma+Q9zE+CtFCYk/I5gipwv5wUebnb02S86vFFCPEiH7e7Gi
         2NJCkR2r8Oy2hrKRdEKUOlLNU14GDmfDBhkUl2DrMVT0RqX+kgjc9CfnaFcKfBaG36JP
         tr+w==
X-Gm-Message-State: AOAM532DcbOwornJik2ehgQ40wt69fEkU+AC7qpJZH0wzfuZOU/odoNr
        SLusiI1dWkspu0GYbHGqD9BvTrPtrk3UCdyi7D3nlGeQwAqSQdAwIxSsl99veE70nLrh3FtZYpB
        BFiHCYIj1FIhLE9TYK4SLKaM=
X-Received: by 2002:a17:907:a407:b0:6f4:3f14:7707 with SMTP id sg7-20020a170907a40700b006f43f147707mr16222513ejc.351.1651684734975;
        Wed, 04 May 2022 10:18:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeNLSEO6aMZEJmeSDZvOrdtsRQbX4QDRaEAbooQf77kraL3riqlGTEh69XjibmoSyspABsDQ==
X-Received: by 2002:a17:907:a407:b0:6f4:3f14:7707 with SMTP id sg7-20020a170907a40700b006f43f147707mr16222496ejc.351.1651684734772;
        Wed, 04 May 2022 10:18:54 -0700 (PDT)
Received: from fedora.nat2.vcit.vutbr.net (nat2.vcit.vutbr.net. [185.62.108.68])
        by smtp.gmail.com with ESMTPSA id bf16-20020a0564021a5000b0042617ba63aesm9492598edb.56.2022.05.04.10.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 10:18:54 -0700 (PDT)
From:   Mark Menzynski <mmenzyns@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     Mark Menzynski <mmenzyns@redhat.com>,
        Ben Skeggs <bskeggs@redhat.com>,
        Karol Herbst <kherbst@redhat.com>,
        Lyude Paul <lyude@redhat.com>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH] drm/nouveau: reorder nouveau_drm_device_fini
Date:   Wed,  4 May 2022 19:18:51 +0200
Message-Id: <20220504171851.17188-1-mmenzyns@redhat.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Resources needed for output poll workers are destroyed in
nouveau_fbcon_fini() before output poll workers are cleared in
nouveau_display_fini(). This means there is a time between fbcon_fini
and display_fini, where if output poll happens, it crashes.

BUG: KASAN: use-after-free in
__drm_fb_helper_initial_config_and_unlock.cold+0x1f3/0x291
[drm_kms_helper]

Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Mark Menzynski <mmenzyns@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 561309d447e0..773efdd20d2f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -588,12 +588,6 @@ nouveau_drm_device_init(struct drm_device *dev)
 	if (ret)
 		goto fail_dispctor;
 
-	if (dev->mode_config.num_crtc) {
-		ret = nouveau_display_init(dev, false, false);
-		if (ret)
-			goto fail_dispinit;
-	}
-
 	nouveau_debugfs_init(drm);
 	nouveau_hwmon_init(dev);
 	nouveau_svm_init(drm);
@@ -601,6 +595,12 @@ nouveau_drm_device_init(struct drm_device *dev)
 	nouveau_fbcon_init(dev);
 	nouveau_led_init(dev);
 
+	if (dev->mode_config.num_crtc) {
+		ret = nouveau_display_init(dev, false, false);
+		if (ret)
+			goto fail_dispinit;
+	}
+
 	if (nouveau_pmops_runtime()) {
 		pm_runtime_use_autosuspend(dev->dev);
 		pm_runtime_set_autosuspend_delay(dev->dev, 5000);
@@ -641,15 +641,14 @@ nouveau_drm_device_fini(struct drm_device *dev)
 		pm_runtime_forbid(dev->dev);
 	}
 
+	if (dev->mode_config.num_crtc)
+		nouveau_display_fini(dev, false, false);
 	nouveau_led_fini(dev);
 	nouveau_fbcon_fini(dev);
 	nouveau_dmem_fini(drm);
 	nouveau_svm_fini(drm);
 	nouveau_hwmon_fini(dev);
 	nouveau_debugfs_fini(drm);
-
-	if (dev->mode_config.num_crtc)
-		nouveau_display_fini(dev, false, false);
 	nouveau_display_destroy(dev);
 
 	nouveau_accel_fini(drm);
-- 
2.32.0

