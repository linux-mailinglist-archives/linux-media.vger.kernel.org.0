Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F33CC75A041
	for <lists+linux-media@lfdr.de>; Wed, 19 Jul 2023 22:58:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230490AbjGSU6C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Jul 2023 16:58:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230445AbjGSU57 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Jul 2023 16:57:59 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04F171FF5
        for <linux-media@vger.kernel.org>; Wed, 19 Jul 2023 13:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689800232;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=u8/7gfrcuf8/DAAooprDSDfzeOTJmiOUpVBm/359QlE=;
        b=Lyt1wzMSYYPBYe6SmQ5Yeeco0Ncvhf/fKBXHAL5mt99GgkJ5uUrq93DEv0EafkRyJ4vmDQ
        EX7HASjm0CjnqzdrSMkDYAGTHxGQin7bRix1FBnMxGM6RTMDCBlvkDghLOYRyaqtS0tx1Y
        UWqaoCkUTi3uBEzVQeLyenKS677Cy3k=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-i7my2VgFOseIZdEYi80_pQ-1; Wed, 19 Jul 2023 16:57:09 -0400
X-MC-Unique: i7my2VgFOseIZdEYi80_pQ-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-315a03cae87so532127f8f.0
        for <linux-media@vger.kernel.org>; Wed, 19 Jul 2023 13:57:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689800228; x=1690405028;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u8/7gfrcuf8/DAAooprDSDfzeOTJmiOUpVBm/359QlE=;
        b=PLIsm1oUysapTuvUt+O69J3ixA3w66L0FTvMLR6cRt07cQhU4D13kHvW/ebWnz3u/C
         fUbgnQ31fxq0a0BAELq4IOLfIRV8UPB8Yt4GFcsKl7a9udgTEcVpz6hhb0S6f6lF2grU
         Jb1DYS7CUsXkgcNIXZnjksQN5z6S7Y/7fJozIUmDmtKR46n578Ym1uXlPvaFQCfB78MY
         wTLDxwXYIxh67dpKuy2wtnaTG3M8iRj+dDXRCYPXdgCECvZueSiP8kJO1Mo7KOXG1chs
         3+M1eDRjJ2ZtoXc0RhTkguaOcCpMMuvs4CmQSZ98IOv31pfH1v10yrseAwhh60hsim9j
         JqHA==
X-Gm-Message-State: ABy/qLYvs1le4MJbB7Cz+MLYIMcj33VZt55sGQNXljBxTId5jB4QTmuc
        zyQLLpwESWeiLVi4JSv9ClnPHjfqbQ6pfB1FEQmd+w7RA8N4sUfQ2qLIQBI2xzRlwBdUWZCoJVC
        qXlAL/XxLykQwQmJnfHf5XoQ=
X-Received: by 2002:a5d:6808:0:b0:313:ef62:6370 with SMTP id w8-20020a5d6808000000b00313ef626370mr779420wru.10.1689800228320;
        Wed, 19 Jul 2023 13:57:08 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFLQI82PXe04TmP/q3eozKaXk38E3F+Qti+S7R2zewTlwbsEDY2//S9hJbdkbY4vyqMa8EZ9Q==
X-Received: by 2002:a5d:6808:0:b0:313:ef62:6370 with SMTP id w8-20020a5d6808000000b00313ef626370mr779410wru.10.1689800228058;
        Wed, 19 Jul 2023 13:57:08 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id t14-20020a5d460e000000b0030fb4b55c13sm6150243wrq.96.2023.07.19.13.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 13:57:07 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        maarten.lankhorst@linux.intel.com
Cc:     Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        tzimmermann@suse.de, Abaci Robot <abaci@linux.alibaba.com>,
        linux-kernel@vger.kernel.org, sumit.semwal@linaro.org,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        christian.koenig@amd.com, linux-media@vger.kernel.org
Subject: Re: [PATCH] drm/shmem-helper: Remove duplicate include
In-Reply-To: <20230320015829.52988-1-jiapeng.chong@linux.alibaba.com>
References: <20230320015829.52988-1-jiapeng.chong@linux.alibaba.com>
Date:   Wed, 19 Jul 2023 22:57:07 +0200
Message-ID: <871qh3k4bg.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Jiapeng Chong <jiapeng.chong@linux.alibaba.com> writes:

> ./drivers/gpu/drm/drm_gem_shmem_helper.c: linux/module.h is included more than once.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=4567
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

