Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05DE8446DEB
	for <lists+linux-media@lfdr.de>; Sat,  6 Nov 2021 13:39:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232984AbhKFMlj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 Nov 2021 08:41:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41718 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229669AbhKFMlj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 6 Nov 2021 08:41:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1636202337;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EG9nttygUp8iT/S+pFBMUQdNV7m/LTMOi7o8pXce84k=;
        b=QEGp/INpj6Y7hZO2EfmCv4ewR3lUqh0XMaUTG4buMO7DnUgKSfvwV5XSDvh8SfXF2s76DJ
        kcim+ldN2Js2TKumW+D1VAXl+vLLOdcEaWdx2bh91omwHyJ5OQkFVQcIHPiScvSzgeBdPg
        e7K1hTtJwku1P3mqDfTabY2JKcKywbA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-FlrrqKegN5exUW8k5FniOw-1; Sat, 06 Nov 2021 08:38:54 -0400
X-MC-Unique: FlrrqKegN5exUW8k5FniOw-1
Received: by mail-ed1-f69.google.com with SMTP id f20-20020a0564021e9400b003e2ad3eae74so11163239edf.5
        for <linux-media@vger.kernel.org>; Sat, 06 Nov 2021 05:38:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=EG9nttygUp8iT/S+pFBMUQdNV7m/LTMOi7o8pXce84k=;
        b=5Sv/w4+hyoEaffzwhgXkPTw2BGOqxNZhj0IWqrdaGOLi1mIfDYwjsmvhlmbCuoIBmc
         p/1OpA6/13npdwPHBC1oiTHQDkmFK84yucAJWZY/8Jwamwd+TpN+3KnLK2ZKKBPJg2L3
         oRhqM5w0AJE7O2YsB6BnXRTG879ytbr+BaTYp2D8PS1gnSxV0eVRWOxLsSDcIQKBNbOD
         jrzjT4BCFDn8JcGBXVNOO/AEq63vBAq3oW8WX7fkU7fU/2bOGr5GUA5AFr/LpP2n+B8o
         VLjmYPuU4iWjKYvI6BkB5b67f0eqPICmorpWkzsJMZd5EatnfcJalDUNGRFFcfTXMmI0
         xKcg==
X-Gm-Message-State: AOAM532HMlHjzMOMT+slN7x9Yxxbsd0oQezUwi1hoLc988BSb1F59T5Y
        mMKDAw0g9CmR0WM2vHD9EGWCQ1xcC2EP4NaDm8t5pF6WeuLo8j06Se9l0ci1aKHm3DxmuS1/RO6
        kYYfhOoqC9EvtjQvMNJP2Swo=
X-Received: by 2002:aa7:c34c:: with SMTP id j12mr71058680edr.31.1636202333459;
        Sat, 06 Nov 2021 05:38:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+330raMVTbfw7psS1HzmdrXQ5Qs5ZFWSJIKPGzPjh7mjMVO+gM+JFNF/OBKRsVgxTXEkq/Q==
X-Received: by 2002:aa7:c34c:: with SMTP id j12mr71058658edr.31.1636202333312;
        Sat, 06 Nov 2021 05:38:53 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id i22sm6048032edu.93.2021.11.06.05.38.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Nov 2021 05:38:52 -0700 (PDT)
Message-ID: <28823616-9622-29d4-75d6-cfef0d4f7323@redhat.com>
Date:   Sat, 6 Nov 2021 13:38:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH media-staging regression fix] media: videobuf2-dma-sg: Fix
 buf->vb NULL pointer dereference
Content-Language: en-US
To:     Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        linux-media@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
References: <20211101145355.533704-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211101145355.533704-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 11/1/21 15:53, Hans de Goede wrote:
> Commit a4b83deb3e76 ("media: videobuf2: rework vb2_mem_ops API")
> added a new vb member to struct vb2_dma_sg_buf, but it only added
> code setting this to the vb2_dma_sg_alloc() function and not to the
> vb2_dma_sg_get_userptr() and vb2_dma_sg_attach_dmabuf() which also
> create vb2_dma_sg_buf objects.
> 
> This is causing a crash due to a NULL pointer deref when using
> libcamera on devices with an Intel IPU3 (qcam app).
> 
> Fix these crashes by assigning buf->vb in the other 2 functions too,
> note libcamera tests the vb2_dma_sg_get_userptr() path, the change
> to the vb2_dma_sg_attach_dmabuf() path is untested.
> 
> Fixes: a4b83deb3e76 ("media: videobuf2: rework vb2_mem_ops API")
> Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Ping ? This is still an issue in the current media-staging tree.

Regards,

Hans


> ---
>  drivers/media/common/videobuf2/videobuf2-dma-sg.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> index 33ee63a99139..0452ed9fac95 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> @@ -241,6 +241,7 @@ static void *vb2_dma_sg_get_userptr(struct vb2_buffer *vb, struct device *dev,
>  	buf->offset = vaddr & ~PAGE_MASK;
>  	buf->size = size;
>  	buf->dma_sgt = &buf->sg_table;
> +	buf->vb = vb;
>  	vec = vb2_create_framevec(vaddr, size);
>  	if (IS_ERR(vec))
>  		goto userptr_fail_pfnvec;
> @@ -642,6 +643,7 @@ static void *vb2_dma_sg_attach_dmabuf(struct vb2_buffer *vb, struct device *dev,
>  	buf->dma_dir = vb->vb2_queue->dma_dir;
>  	buf->size = size;
>  	buf->db_attach = dba;
> +	buf->vb = vb;
>  
>  	return buf;
>  }
> 

