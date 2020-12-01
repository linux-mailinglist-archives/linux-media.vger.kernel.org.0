Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDA7A2CB08C
	for <lists+linux-media@lfdr.de>; Tue,  1 Dec 2020 23:57:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726630AbgLAW4p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Dec 2020 17:56:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725955AbgLAW4o (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Dec 2020 17:56:44 -0500
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 739E8C0613D4;
        Tue,  1 Dec 2020 14:55:58 -0800 (PST)
Received: by mail-pj1-x1041.google.com with SMTP id iq13so2260787pjb.3;
        Tue, 01 Dec 2020 14:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xF9wBhJ/ruSDlA6Srxw1jVi0WbujgXsPSvslQZosYxU=;
        b=kJ3eowGG6g5XcJ9j4rRIQL+S4zJl30r+BhTrFCtmOwibuAKtR4DDYXdV8bKdDWROYr
         hIJWB+9HfBhIHCvajqYuY/YoA4dBE9kgYcK1rvjITkuv9vWV2vbKzN4c3Q2M/9dDbTvJ
         mb0KuF4fCvmofdUjb/UAqGCpTb4hHuzvX9Pp0eKJE0uGqhqHNCW8i/nE6BO94oySkznK
         JLSsVoxB7aGrcQt0uGkK+SXilz9hE+OhFDpfodutUmq7ZEyoOhnvKWj70Np9qJ5QN6o1
         B7eFOzNhMNQr5jL8B58gtPE6Rx15ttucZ4kxgzye2HAVpNsA0P6gnZc5Q169xinM0Bka
         kbcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=xF9wBhJ/ruSDlA6Srxw1jVi0WbujgXsPSvslQZosYxU=;
        b=YgutM2LfeURqdiYqx9qjEmgvLPQw/I7sBusQ/2prij7s/2OkGMjVxwRY9SSl1+OKb6
         LD82ciUGrTdACG/eqsvREedbq9tnJakO1Yu3L2EeOq5qcGnSEHlgF1+hBKJx1uj/9khe
         R4SPWgeEAkqNmvgpNSo72AZtq8mPC1+JVmsWFUic9xDlGLTLsl2T69J8lWRC8EoN2JDq
         qNtC9sdoh4zNFTpN1lk5F/BaVBi5606+9AL3b8kpQnG/qjyoIoNBun6AZ8XU0ZM26BWI
         QSt3R67sM8HEBu5QuNzN24YN1DOe1HsFmp5C/hS6sJVBC2IRO00riyXRQ3e1uajV91NW
         2P7Q==
X-Gm-Message-State: AOAM533ruUbWnOTBSnLeatNOQGBre0WWfm81RBGoKkZwFxqQnKDNGmjd
        7I1BPos4oU6BzqMv51+LGCw=
X-Google-Smtp-Source: ABdhPJy3f2TRP3AqnHaRLUzLECJ1htGQGvX3mrji3EHlmRSp8/8UXe2pBn1MoP8oA9an04VIieWPDQ==
X-Received: by 2002:a17:90a:d308:: with SMTP id p8mr5051014pju.110.1606863357919;
        Tue, 01 Dec 2020 14:55:57 -0800 (PST)
Received: from google.com ([2620:15c:211:201:7220:84ff:fe09:5e58])
        by smtp.gmail.com with ESMTPSA id v196sm758721pfc.34.2020.12.01.14.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 14:55:56 -0800 (PST)
Sender: Minchan Kim <minchan.kim@gmail.com>
Date:   Tue, 1 Dec 2020 14:55:54 -0800
From:   Minchan Kim <minchan@kernel.org>
To:     John Stultz <john.stultz@linaro.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>, Hyesoo Yu <hyesoo.yu@samsung.com>,
        Matthew Wilcox <willy@infradead.org>, david@redhat.com,
        iamjoonsoo.kim@lge.com, vbabka@suse.cz,
        Suren Baghdasaryan <surenb@google.com>,
        KyongHo Cho <pullip.cho@samsung.com>,
        John Dias <joaodias@google.com>,
        Hridya Valsaraju <hridya@google.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>,
        Christian Koenig <christian.koenig@amd.com>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>
Subject: Re: [PATCH v2 4/4] dma-buf: heaps: add chunk heap to dmabuf heaps
Message-ID: <20201201225554.GA3968963@google.com>
References: <20201201175144.3996569-1-minchan@kernel.org>
 <20201201175144.3996569-5-minchan@kernel.org>
 <CALAqxLXFeUStaJ8Mtm5v3kSxmeqnjzLTsyathkrKF0ke3fYGiQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALAqxLXFeUStaJ8Mtm5v3kSxmeqnjzLTsyathkrKF0ke3fYGiQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Dec 01, 2020 at 11:48:15AM -0800, John Stultz wrote:
> On Tue, Dec 1, 2020 at 9:51 AM Minchan Kim <minchan@kernel.org> wrote:
> 
> Thanks for reworking and resending this!
> 
> ...
> > +static int __init chunk_heap_init(void)
> > +{
> > +       struct cma *default_cma = dev_get_cma_area(NULL);
> > +       struct dma_heap_export_info exp_info;
> > +       struct chunk_heap *chunk_heap;
> > +
> > +       if (!default_cma)
> > +               return 0;
> > +
> > +       chunk_heap = kzalloc(sizeof(*chunk_heap), GFP_KERNEL);
> > +       if (!chunk_heap)
> > +               return -ENOMEM;
> > +
> > +       chunk_heap->order = CHUNK_HEAP_ORDER;
> > +       chunk_heap->cma = default_cma;
> > +
> > +       exp_info.name = cma_get_name(default_cma);
> 
> So, this would create a chunk heap name with the default CMA name,
> which would be indistinguishable from the heap name used for the plain
> CMA heap.
> 
> Probably a good idea to prefix it with "chunk-" so the heap device
> names are unique?

That will give an impression to user that they are using different CMA
area but that's not true. IMHO, let's be honest at this moment.
When DT binding with CMA is landing down, it could provide unique name.
Thought?
