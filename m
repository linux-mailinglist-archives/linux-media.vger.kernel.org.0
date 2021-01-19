Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD2032FC148
	for <lists+linux-media@lfdr.de>; Tue, 19 Jan 2021 21:41:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730225AbhASUii (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Jan 2021 15:38:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732149AbhASUhY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Jan 2021 15:37:24 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59F33C061757;
        Tue, 19 Jan 2021 12:36:44 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id g15so673209pjd.2;
        Tue, 19 Jan 2021 12:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=B8V4SvilY22Ou2CtEY4Ue8qbjrsp3tthnLCK+7Q59QY=;
        b=PeAXI8eTzedOObem6tpD3NZRZKrBkgPenj/spRJ6lVUlMubwNa3Hsb2icgzXSomLqy
         jZ0E6xPVrfpe5ilrFFeyILMIUF5YcgHQi8+CknGm8Z7ZWUZZCKKEMDt51BM3ZYstg0yS
         2eROI954uU0JzmDnA7QdgSEGNXTAfT2mPXLCf5SRW6gvfz0nZx1CGzLXdOpj0nPZz7V4
         y59gAQtbX2e1l++jNfgypKC6n73SaA/zOLG1zk0c85OMOYgSZgOx+w37YU2SDizmy0t1
         fvYjxUEcFgSQxSZ+zg5/YjdqyN0owSiUhq96CQQhEn4PximkBY0CGFHHAzCp3nk1Coad
         NRDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=B8V4SvilY22Ou2CtEY4Ue8qbjrsp3tthnLCK+7Q59QY=;
        b=eLbXha3AZwW4YcP11twEA0IatZARw2/7VYE3M+mL00WU+KOvcEkx7mJvTr8ARXyx1Y
         5mOxcXSIkhVi6RrNjoGcavcmDuL5vSeUrZHYs8CuZW8P8aLyTay5yVWcBQ73uCHbS4uF
         MIzDm2NZHIwPbJWJ61bVLSVzfziSeMXEZumLv2gE+GWyygw1Lb+W267yuFE62GY3p+Wr
         EQlmnM8emIhhcIC4niHKUUgLkzVpAx/pyygIG1Sqox1Y6wB95MibXHnTjSQprOYNSA34
         vFsOd2MDqUvrDAjhpiEhdtJFF3FVmCxqK/wbUAiKTsyC7kJVSwVHqCHNOxN0DSQhnzOg
         6neQ==
X-Gm-Message-State: AOAM533vqjPNcC4H53UdkkvpQtoFBbbH0rLrqHZcuZouz4sAM7jIDDuk
        AC0KNzhgf837gQFcsK0Z5mw=
X-Google-Smtp-Source: ABdhPJxMgNFUumt9XiceexCYO3QOZQGhZnpeiTmcQUHGdDtv9MMjBRezO5wS52FU++T2/s/pwxcgsg==
X-Received: by 2002:a17:902:d909:b029:df:52b4:8147 with SMTP id c9-20020a170902d909b02900df52b48147mr1944220plz.33.1611088603852;
        Tue, 19 Jan 2021 12:36:43 -0800 (PST)
Received: from google.com ([2620:15c:211:201:8d1f:e7:cd3c:db2f])
        by smtp.gmail.com with ESMTPSA id b67sm1171pfa.140.2021.01.19.12.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 12:36:42 -0800 (PST)
Sender: Minchan Kim <minchan.kim@gmail.com>
Date:   Tue, 19 Jan 2021 12:36:40 -0800
From:   Minchan Kim <minchan@kernel.org>
To:     John Stultz <john.stultz@linaro.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        linux-mm <linux-mm@kvack.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Hyesoo Yu <hyesoo.yu@samsung.com>, david@redhat.com,
        Michal Hocko <mhocko@suse.com>,
        Suren Baghdasaryan <surenb@google.com>,
        KyongHo Cho <pullip.cho@samsung.com>,
        John Dias <joaodias@google.com>,
        Hridya Valsaraju <hridya@google.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Christoph Hellwig <hch@infradead.org>,
        Rob Herring <robh+dt@kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>
Subject: Re: [PATCH v3 4/4] dma-buf: heaps: add chunk heap to dmabuf heaps
Message-ID: <YAdC2J4x/4J9ozkq@google.com>
References: <20210113012143.1201105-1-minchan@kernel.org>
 <20210113012143.1201105-5-minchan@kernel.org>
 <CALAqxLWPT8PWYue0h1863NjNxKn_FH0DtoRtArpmmxZ1Ve5xCw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALAqxLWPT8PWYue0h1863NjNxKn_FH0DtoRtArpmmxZ1Ve5xCw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jan 19, 2021 at 10:29:29AM -0800, John Stultz wrote:
> On Tue, Jan 12, 2021 at 5:22 PM Minchan Kim <minchan@kernel.org> wrote:
> >
> > From: Hyesoo Yu <hyesoo.yu@samsung.com>
> >
> > This patch supports chunk heap that allocates the buffers that
> > arranged into a list a fixed size chunks taken from CMA.
> >
> > The chunk heap driver is bound directly to a reserved_memory
> > node by following Rob Herring's suggestion in [1].
> >
> > [1] https://lore.kernel.org/lkml/20191025225009.50305-2-john.stultz@linaro.org/T/#m3dc63acd33fea269a584f43bb799a876f0b2b45d
> >
> > Signed-off-by: Hyesoo Yu <hyesoo.yu@samsung.com>
> > Signed-off-by: Hridya Valsaraju <hridya@google.com>
> > Signed-off-by: Minchan Kim <minchan@kernel.org>
> > ---
> ...
> > +static int register_chunk_heap(struct chunk_heap *chunk_heap_info)
> > +{
> > +       struct dma_heap_export_info exp_info;
> > +
> > +       exp_info.name = cma_get_name(chunk_heap_info->cma);
> 
> One potential issue here, you're setting the name to the same as the
> CMA name. Since the CMA heap uses the CMA name, if one chunk was
> registered as a chunk heap but also was the default CMA area, it might
> be registered twice. But since both would have the same name it would
> be an initialization race as to which one "wins".

Good point. Maybe someone might want to use default CMA area for
both cma_heap and chunk_heap. I cannot come up with ideas why we
should prohibit it atm.

> 
> So maybe could you postfix the CMA name with "-chunk" or something?

Hyesoo, Any opinion?
Unless you have something other idea, let's fix it in next version.
