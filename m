Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A89D3D6FF6
	for <lists+linux-media@lfdr.de>; Tue, 27 Jul 2021 09:06:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235791AbhG0HGq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jul 2021 03:06:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235672AbhG0HGp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jul 2021 03:06:45 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE912C061757
        for <linux-media@vger.kernel.org>; Tue, 27 Jul 2021 00:06:45 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id b1-20020a17090a8001b029017700de3903so2202905pjn.1
        for <linux-media@vger.kernel.org>; Tue, 27 Jul 2021 00:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hZLPLply0xdbrRyNzREagpGRYzn73ptz2SbhQcpOnT0=;
        b=Em/DMtr9N6aKr4ztKcWR9cqXJqEzUjC25EIQpuWJ8xyBYDAxolGaw+VFhxw3v14mv+
         H98fIEAAuMWQjz5vGPW8QOI2MYDC6VJXx56obj120jIOWE8Klx/2bnAgr9qju5qtma5A
         r98JFS+Kcbr76qSKClK24eJvmciMuWaee81Vk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hZLPLply0xdbrRyNzREagpGRYzn73ptz2SbhQcpOnT0=;
        b=QrFpI/mKv7ftPmlG8fJKkDqwApFa0e16hOm4QSEfm+Nuuu1a7qT+4SdRXuTzcpoa4H
         ZR8KKv6eraqyqPvS8IikbGtjcL8Srz553PCnBPC7mBHtEAuaAjnTW+9Gc/B2Vfqduu7Z
         myyCOK24L9gQ8ivYQK0z94k+yHAXu2RmQn25a0POi2z5lQ5lgiBSL6Ou8W+STiWah6w5
         duEaS1BVRWiHlJ0arzq253MpotXZR11kWkrdG+njFBZjgBdZKLLeLYFQsIb3gl0UGXTG
         Dmb1OGDdxYhKpNCnPmDDl7HDjkI9b9qQbOJ+mM8XLWQqMEE04QpJ3OgCRIO9R6ySLRKT
         UmGA==
X-Gm-Message-State: AOAM530tjZaKYWwmDGU4TnP1vY4i18NkyegO2UkVRf2RVwpwlzMKWgxS
        WS03xBwTNEj2GEJsnij/9FITiw==
X-Google-Smtp-Source: ABdhPJyfma6fzkAfjK2NQZPekjB3bJI6jTkv/QxofyljWR05wyn7JE6TyD/iVL+IixW2PYvyMUUgdg==
X-Received: by 2002:a17:90a:e647:: with SMTP id ep7mr2888129pjb.145.1627369605558;
        Tue, 27 Jul 2021 00:06:45 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:ba3e:509b:495:ec84])
        by smtp.gmail.com with ESMTPSA id y15sm2437897pfn.63.2021.07.27.00.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 00:06:45 -0700 (PDT)
Date:   Tue, 27 Jul 2021 16:06:39 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Collabora Kernel ML <kernel@collabora.com>
Subject: Re: [PATCHv3 8/8] videobuf2: handle non-contiguous DMA allocations
Message-ID: <YP+wf+G8V4AoXSBq@google.com>
References: <20210709092027.1050834-1-senozhatsky@chromium.org>
 <20210709092027.1050834-9-senozhatsky@chromium.org>
 <3c80786a-7422-3736-7261-8605260eb99f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c80786a-7422-3736-7261-8605260eb99f@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (21/07/22 19:26), Dafna Hirschfeld wrote:
> >   /*********************************************/
> > @@ -139,17 +175,63 @@ static void vb2_dc_put(void *buf_priv)
> >   		sg_free_table(buf->sgt_base);
> >   		kfree(buf->sgt_base);
> >   	}
> > -	dma_free_attrs(buf->dev, buf->size, buf->cookie, buf->dma_addr,
> > -		       buf->attrs);
> > +
> > +	if (buf->coherent_mem) {
> > +		dma_free_attrs(buf->dev, buf->size, buf->cookie,
> > +			       buf->dma_addr, buf->attrs);
> > +	} else {
> > +		if (buf->vaddr)
> > +			dma_vunmap_noncontiguous(buf->dev, buf->vaddr);
> > +		dma_free_noncontiguous(buf->dev, buf->size,
> > +				       buf->dma_sgt, buf->dma_addr);
> 
> The last argument for dma_free_noncontiguous should be dma_dir.
> Also, the 'cookie' cb returns buf->dma_addr which is not initialized for
> the noncontiguous api. So it is not clear how drivers should use the new api.

Done. Thank you Dafna.
