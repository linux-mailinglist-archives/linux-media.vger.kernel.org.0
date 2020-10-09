Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42842288C52
	for <lists+linux-media@lfdr.de>; Fri,  9 Oct 2020 17:14:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389156AbgJIPOV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Oct 2020 11:14:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388579AbgJIPOU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Oct 2020 11:14:20 -0400
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80FE3C0613D2
        for <linux-media@vger.kernel.org>; Fri,  9 Oct 2020 08:14:20 -0700 (PDT)
Received: by mail-qv1-xf42.google.com with SMTP id j3so4901108qvi.7
        for <linux-media@vger.kernel.org>; Fri, 09 Oct 2020 08:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=d5tRJ9PpcVIuucKEk9PjSNEdnKeyXjPzYCqe74ejgpM=;
        b=Zn8X4w0/OSkhz1OuZv5cn9hAzblt5Hz2mscK1C8WJ1JcDT5nIpUMpSMLResc3MFIeJ
         GYAwP5W+J0Fxn2Md7iAQTDLSGl8qafxyhc+wXW+psUrtfS5wngK5J1ar+PSV3qeK2Nj5
         0m6G/dAXHeQgo5p2oWl5wszCZy8X++skWa3fLZ38pZcn+TFZhh2cIuqy4at1AIMSl2Rj
         sRITU+dZXxiE1XajWjAvISGvD4aFphoRP21auU1OzDipxnqXLk9pmk/qYrzNztspn4bq
         ia3DCQaNq81q+PGYCObzRoeKRHiP/S327EfmURD1pAthONNzdj/rwgMutzPgFDspy8uM
         keMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=d5tRJ9PpcVIuucKEk9PjSNEdnKeyXjPzYCqe74ejgpM=;
        b=IVlOqZ/VPrmsv1TYb8UieRpP3gyhcC9mY6120yzyo72EboptP9n2wNzAp1OB5o56vv
         hF98sSDcSKhhj+Y+4wGv3enZEkBEGl0h/ZHQHcIKLWDbK/t085PoWTveAegonIt16Gdw
         GOWuL54u/iLmBRh50zQ5MhYw8vJ335BaZnT/D74yXSzm0SAqxlP3lK6vULdek3IZH7U0
         MFIv/ddygTZyJ7noaqpx+I0dtvPQM49fWD1mq5MxuHRMzuNTzan8B3ctuhBKx4ykiQco
         vMJgKj6rQLA4SEc3aBpZPRtTfeZrDg0QTsD9PIT9bC8abwJuLhJEjNBjCk3saVZT72Ho
         qfHg==
X-Gm-Message-State: AOAM530Y1apJDUMqNT7k3DzyrZXRmQqDL6V7bWbOXC1QnjE/rVQSucOd
        7O8Mjc+HLnp9j+rffd7gnBU2ow==
X-Google-Smtp-Source: ABdhPJxKiahJdvTtsQaQo417yOupHNeidai5L3YpYKdnVDmVTqBZN9rm1cv4o5Miumg1ehkWBKEPgQ==
X-Received: by 2002:a0c:cd0e:: with SMTP id b14mr13194813qvm.3.1602256459739;
        Fri, 09 Oct 2020 08:14:19 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id s15sm6329516qkj.21.2020.10.09.08.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 08:14:19 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1kQu66-0020X4-DL; Fri, 09 Oct 2020 12:14:18 -0300
Date:   Fri, 9 Oct 2020 12:14:18 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>
Cc:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, chris@chris-wilson.co.uk,
        airlied@redhat.com, akpm@linux-foundation.org, daniel@ffwll.ch,
        sumit.semwal@linaro.org, willy@infradead.org, jhubbard@nvidia.com
Subject: Re: [PATCH 2/6] mm: introduce vma_set_file function v3
Message-ID: <20201009151418.GW5177@ziepe.ca>
References: <20201009150342.1979-1-christian.koenig@amd.com>
 <20201009150342.1979-2-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201009150342.1979-2-christian.koenig@amd.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 09, 2020 at 05:03:38PM +0200, Christian König wrote:
> +/*
> + * Change backing file, only valid to use during initial VMA setup.
> + */
> +void vma_set_file(struct vm_area_struct *vma, struct file *file)
> +{
> +	if (file)
> +	        get_file(file);
> +
> +	swap(vma->vm_file, file);
> +
> +	if (file)
> +		fput(file);
> +}

fput crashes when file is NULL so the error handling after
unmap_and_free_vma: can't handle this case, similarly vm_file can't be
NULL either.

So just simply:

 swap(vma->vm_file, file);
 get_file(vma->vm_file);
 fput(file);
 
Will do?

Just let it crash if any of them are wrongly NULL.

Jason
