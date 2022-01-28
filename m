Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 324C54A00BE
	for <lists+linux-media@lfdr.de>; Fri, 28 Jan 2022 20:17:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344167AbiA1TRP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jan 2022 14:17:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45559 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239389AbiA1TRP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jan 2022 14:17:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1643397434;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eO1UXFuFc6XDm59y7eIl2dtM6a/z0pBy0qGOEAiugBI=;
        b=c8iWQcuZvRTLEwe5kXcTTna0eo+znPw+8ex8obIRugEgFvsdAlWmHf/ePulVbWZFvvc0+6
        tuN3AjXQEgVu4bjPPIiZTOWQhYyJkVmqM5L0cQARR+JBYpAQgF2ZfJUxxPsDSaZQxLOSkg
        bc0F09HwyoxIpiG7L0lxTG8N4EwJSPw=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-TOouzqI5NfmLtQieiCm7jQ-1; Fri, 28 Jan 2022 14:17:13 -0500
X-MC-Unique: TOouzqI5NfmLtQieiCm7jQ-1
Received: by mail-qv1-f69.google.com with SMTP id bx10-20020a056214058a00b00424e90c0dc4so6985354qvb.6
        for <linux-media@vger.kernel.org>; Fri, 28 Jan 2022 11:17:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:organization:user-agent:mime-version
         :content-transfer-encoding;
        bh=eO1UXFuFc6XDm59y7eIl2dtM6a/z0pBy0qGOEAiugBI=;
        b=Id3yHQkurh1EQp1CL1iimBK9VkB25x83CL4zw40PbbrNfVSpQ1escJ8HQYOjwCPQaR
         VWoZWMkmjuPgrNnR3xeClLU3nuW9u8i+6OrclwarDFh+Rak2ThBJHwSoiDf3ErJAYPXx
         6mjZ+ZFfpqRk3hnyVek/lwMetKNwF84oku8Ew0Gbi+5g08g1pLlHS/r5UvtFhXxAmzMW
         4SQFDm81RbRYiuwyhuzVz+YOQOc/0rJuTivLZy5OFshoCpU8S7Ds4BXTgRlgaZT9FoSe
         CJDEBH5GvWqMhZShI68NhhKN68TnHYtMtVgsogg2EMNr8zYveORsrRdKXM0JuPH9bX0c
         6jMg==
X-Gm-Message-State: AOAM530dSTiJRmEGaWaXKeVDi0pNdanOVoW1SneizfwHZ/4FI9q2O3et
        MhTI6ZZkHYVGc0O210MbsTIx2WCvPeXPtyUEQKFtE3kUrsT4K9Tk/TZ87AON+pZrsd86J+tJ6hs
        NyC164xvbuVCwAPLoLDvv90g=
X-Received: by 2002:a05:622a:ca:: with SMTP id p10mr2002425qtw.123.1643397432670;
        Fri, 28 Jan 2022 11:17:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwYaAdUDE5W566fq77+INMNx47zILwdtqN04KYzsDT/UoGpKgB0OvZw6qO3zCtXnbY/NcpCYg==
X-Received: by 2002:a05:622a:ca:: with SMTP id p10mr2002408qtw.123.1643397432443;
        Fri, 28 Jan 2022 11:17:12 -0800 (PST)
Received: from [192.168.8.138] (pool-98-118-105-43.bstnma.ftas.verizon.net. [98.118.105.43])
        by smtp.gmail.com with ESMTPSA id u17sm3548025qkj.44.2022.01.28.11.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jan 2022 11:17:11 -0800 (PST)
Message-ID: <67747024d7b3e1904d639e5877a580a0af32d855.camel@redhat.com>
Subject: Re: [PATCH 09/14] drm/nouveau: Replace dma-buf-map with iosys-map
From:   Lyude Paul <lyude@redhat.com>
To:     Lucas De Marchi <lucas.demarchi@intel.com>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc:     srinivas.kandagatla@linaro.org, gregkh@linuxfoundation.org,
        sumit.semwal@linaro.org, christian.koenig@amd.com,
        daniel.vetter@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de,
        linux-media@vger.kernel.org, nouveau@lists.freedesktop.org
Date:   Fri, 28 Jan 2022 14:17:09 -0500
In-Reply-To: <20220128083626.3012259-10-lucas.demarchi@intel.com>
References: <20220128083626.3012259-1-lucas.demarchi@intel.com>
         <20220128083626.3012259-10-lucas.demarchi@intel.com>
Organization: Red Hat Inc.
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.2 (3.42.2-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

For this patch:

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Fri, 2022-01-28 at 00:36 -0800, Lucas De Marchi wrote:
> iosys-map is the new name for dma-buf-map and will gain new
> capabitilities. Replace with the new API in nouveau.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_gem.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c
> b/drivers/gpu/drm/nouveau/nouveau_gem.c
> index 9416bee92141..ad0527bdaadf 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> @@ -24,6 +24,8 @@
>   *
>   */
>  
> +#include <linux/iosys-map.h>
> +
>  #include <drm/drm_gem_ttm_helper.h>
>  
>  #include "nouveau_drv.h"

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

