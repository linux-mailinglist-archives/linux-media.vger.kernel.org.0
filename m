Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42B314F802D
	for <lists+linux-media@lfdr.de>; Thu,  7 Apr 2022 15:08:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343572AbiDGNKo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Apr 2022 09:10:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343564AbiDGNKn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Apr 2022 09:10:43 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 669C125CBAE
        for <linux-media@vger.kernel.org>; Thu,  7 Apr 2022 06:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1649336922;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PYiG2jwpKviTbC79FBF6SS2JRtmy5ygo1J5oP0vh2gA=;
        b=MAR6r5axZ9YHQVLb+Nm2FBNWKq1GCCUzSzxVu4kwtAoHY0ABIiZlR8m16MaXVkrYXpL/84
        I4S3cFFHmij10ppfwuSo/8YxJ3E52vf89iRqlCqI03qdnM+Lmi4KLqZH3g8GJyJFFKgPx1
        xRKdY5T3NYM7QiEaAKMo3UYx63SXA9U=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-260-997_BAMEMzGKISoSqrixhg-1; Thu, 07 Apr 2022 09:08:40 -0400
X-MC-Unique: 997_BAMEMzGKISoSqrixhg-1
Received: by mail-wm1-f70.google.com with SMTP id n21-20020a05600c4f9500b0038e3b0aa367so3155022wmq.1
        for <linux-media@vger.kernel.org>; Thu, 07 Apr 2022 06:08:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=PYiG2jwpKviTbC79FBF6SS2JRtmy5ygo1J5oP0vh2gA=;
        b=FumdyXZ2dfT8+oGpwMP1mbCj8fUcSVhkYD3ojsW9gRiN8QI7bXRv9dnMJ2DJ+dbfU5
         htD37RChzvjFl16l0WBSwM/VHVtlstfapkN3E+h2HCqewowrP+4FilU6QSh32zyp1Dti
         ELC9SwZBXJlITlzUwiAvRPrXSGTGyjxSCdh2h4DL4vY2ZbG8e5DONuGl1mMx+Nb+XIwL
         BBRcbK00wJVkGmFayMW0AQ8sW/u++JgTIZGFhNg0BWnpw2DnweKGRjD+W5NU91ZWaj5V
         KG2wBWI61Y9a1b0MkMZxPJVPtQF22nS5+IhgVRs8wnFRgAZGzJq+lex9iB/MsngaHUMW
         ujWw==
X-Gm-Message-State: AOAM531H/epqmLnei2c3HOFXeUb5my6yQJpHuIZuPgW1snMOtFJ2I+1b
        aIL4MfcmRVIAu3xEa+fumgCQgd1iknVLEW+HU1Vv6/atHztmIQqtk6n7GAjOSAyMpangqzbBnNw
        C2zq21+u2IplCPwycJgB72ao=
X-Received: by 2002:adf:b60a:0:b0:206:4ba:395c with SMTP id f10-20020adfb60a000000b0020604ba395cmr10724764wre.447.1649336919223;
        Thu, 07 Apr 2022 06:08:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwusfCJViMsUP5Xtwk6CXg/MU53VnwwpUv0/qc7h8bleBl1fGekB+z/417y+QDwXAGl1LwU0w==
X-Received: by 2002:adf:b60a:0:b0:206:4ba:395c with SMTP id f10-20020adfb60a000000b0020604ba395cmr10724750wre.447.1649336919002;
        Thu, 07 Apr 2022 06:08:39 -0700 (PDT)
Received: from [192.168.1.102] ([92.176.231.205])
        by smtp.gmail.com with ESMTPSA id e3-20020a056000120300b002061837b5b4sm8531890wrx.85.2022.04.07.06.08.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Apr 2022 06:08:38 -0700 (PDT)
Message-ID: <29677a4e-42dc-d35e-f487-f8b344678bee@redhat.com>
Date:   Thu, 7 Apr 2022 15:08:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 02/15] dma-buf: specify usage while adding fences to
 dma_resv obj v7
Content-Language: en-US
To:     =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
        daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        intel-gfx@lists.freedesktop.org
Cc:     =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20220407085946.744568-1-christian.koenig@amd.com>
 <20220407085946.744568-3-christian.koenig@amd.com>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220407085946.744568-3-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Christian,

On 4/7/22 10:59, Christian König wrote:
> Instead of distingting between shared and exclusive fences specify
> the fence usage while adding fences.
> 
> Rework all drivers to use this interface instead and deprecate the old one.
> 

This patch broke compilation for the vc4 DRM driver. I've this patch locally
which seems to work but I don't know enough about the fence API to know if
is correct.

If you think is the proper fix then I can post it as a patch.

From 3e96db4827ef69b38927476659cbb4469a0246e6 Mon Sep 17 00:00:00 2001
From: Javier Martinez Canillas <javierm@redhat.com>
Date: Thu, 7 Apr 2022 14:54:07 +0200
Subject: [PATCH] drm/vc4: Use newer fence API to fix build error

The commit 73511edf8b19 ("dma-buf: specify usage while adding fences to
dma_resv obj v7") ported all the DRM drivers to use the newer fence API
that specifies the usage with the enum dma_resv_usage rather than doing
an explicit shared / exclusive distinction.

But the commit didn't do it properly in two callers of the vc4 driver,
leading to build errors.

Fixes: 73511edf8b19 ("dma-buf: specify usage while adding fences to dma_resv obj v7")
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/vc4/vc4_gem.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
index 38550317e025..9eaf304fc20d 100644
--- a/drivers/gpu/drm/vc4/vc4_gem.c
+++ b/drivers/gpu/drm/vc4/vc4_gem.c
@@ -546,7 +546,8 @@ vc4_update_bo_seqnos(struct vc4_exec_info *exec, uint64_t seqno)
 		bo = to_vc4_bo(&exec->bo[i]->base);
 		bo->seqno = seqno;
 
-		dma_resv_add_fence(bo->base.base.resv, exec->fence);
+		dma_resv_add_fence(bo->base.base.resv, exec->fence,
+				   DMA_RESV_USAGE_READ);
 	}
 
 	list_for_each_entry(bo, &exec->unref_list, unref_head) {
@@ -557,7 +558,8 @@ vc4_update_bo_seqnos(struct vc4_exec_info *exec, uint64_t seqno)
 		bo = to_vc4_bo(&exec->rcl_write_bo[i]->base);
 		bo->write_seqno = seqno;
 
-		dma_resv_add_excl_fence(bo->base.base.resv, exec->fence);
+		dma_resv_add_fence(bo->base.base.resv, exec->fence,
+				   DMA_RESV_USAGE_WRITE);
 	}
 }
 
-- 
2.35.1

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

