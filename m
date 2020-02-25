Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AFA416BB2E
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2020 08:45:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729625AbgBYHpR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Feb 2020 02:45:17 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:34893 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729124AbgBYHpQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Feb 2020 02:45:16 -0500
Received: by mail-pl1-f194.google.com with SMTP id g6so5150425plt.2
        for <linux-media@vger.kernel.org>; Mon, 24 Feb 2020 23:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Y3Ufh0kd/NDODhpeTidFsO93dE8ZQpNceOjFTvbhgb0=;
        b=nOYYA/Ac6VFG5NfRwmfAEJ4IfTRDbeldgM5X2zcA5j8Z7IlkgVRdAzrr9kqhw+RXl9
         PZ39EN+SDpiIdCNOXZvzsevW2JA/Feb/cDugzP93qv5XtrRr4gbks1lXmyHSo2urpH4x
         OuzrRkfTrfKDKf27hmfoyzc8mTl5Bw1EANs1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Y3Ufh0kd/NDODhpeTidFsO93dE8ZQpNceOjFTvbhgb0=;
        b=P2giDiaKQ+pdxGRJHxgS1kUSCcq+NYftywzfDRbDA9PgjaEcuLgvnmdKBNHaQymy7Z
         GWUIWZ3Ep/tJjGWMoAP1/xlMhB6evkDr+I/O4YTHpSsE+sG49A+HlSpD+L1ddce2nEza
         pNf1JjXT/5vuVD/khH6CzZkni/S5b65mk/UyNnKS2vKW9t2ujpXFEdnTOdeh5Ls0h8S+
         XyfIcknOirzuQwr1WdR3v4tkfnJ7e3hhtvsSasKmp8QXYFLC1nwLrp3W4ve8AajHLpDG
         ex2y1kqphJtyaNlfeTUJzoAzByBUAJ6cbtKUB/KJQ+uwMouNh0dQnKhMvRUtoLyjoffL
         PzGQ==
X-Gm-Message-State: APjAAAVhj3k8DN+NL6YhezIrsiljsgQrd4yoTf3lBmuGlhR+aLTqYMUl
        +cMTPmeL2ojwbdZ0XmWSQqa9yg==
X-Google-Smtp-Source: APXvYqw+OtdPhv71cEVpj1CHeSNUV34jLiWZgbpas0TvOZlGuIXh21hYDCPdDfILJBF0LqX0Sjr+kQ==
X-Received: by 2002:a17:90b:f06:: with SMTP id br6mr3598849pjb.125.1582616715978;
        Mon, 24 Feb 2020 23:45:15 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:5bbb:c872:f2b1:f53b])
        by smtp.gmail.com with ESMTPSA id 3sm1952581pjg.27.2020.02.24.23.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2020 23:45:15 -0800 (PST)
Date:   Tue, 25 Feb 2020 16:45:12 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC][PATCHv2 03/12] videobuf2: add
 V4L2_FLAG_MEMORY_NON_CONSISTENT flag
Message-ID: <20200225074512.GG122464@google.com>
References: <20200204025641.218376-1-senozhatsky@chromium.org>
 <20200204025641.218376-4-senozhatsky@chromium.org>
 <17e99adc-d86d-ebd3-ab52-d6c8e3ac14f3@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17e99adc-d86d-ebd3-ab52-d6c8e3ac14f3@xs4all.nl>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (20/02/19 09:56), Hans Verkuil wrote:
> > +Memory Consistency Flags
> > +========================
> > +
> > +.. tabularcolumns:: |p{7.0cm}|p{2.2cm}|p{8.3cm}|
> > +
> > +.. cssclass:: longtable
> > +
> > +.. flat-table::
> > +    :header-rows:  0
> > +    :stub-columns: 0
> > +    :widths:       3 1 4
> > +
> > +    * .. _`V4L2_FLAG_MEMORY_NON_CONSISTENT`:
> > +
> > +      - ``V4L2_FLAG_MEMORY_NON_CONSISTENT``
> > +      - 0x00000001
> > +      - vb2 buffer is allocated either in consistent (it will be automatically
> > +	coherent between CPU and bus) or non-consistent memory. The latter
> > +	can provide performance gains, for instance CPU cache sync/flush
> > +	operations can be avoided if the buffer is accesed by the corresponding
> > +	device only and CPU does not read/write to/from that buffer. However,
> > +	this requires extra care from the driver -- it must guarantee memory
> > +	consistency by issuing cache flush/sync when consistency is needed.
> > +	If this flag is set V4L2 will attempt to allocate vb2 buffer in
> > +	non-consistent memory. This flag is ignored if queue does not report
> > +        :ret:`V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS` capability.
> 
> This flag only makes sense for the MMAP memory model, right? That should be
> documented and checked in the code.

Not all buffer allocators respect DMA attrs (V4L2_FLAG_MEMORY_NON_CONSISTENT
is a DMA attribute) even if we use MMAP memory model. Right? E.g. dma-cont
does, dma-sg - does not.

So the list is:

  a) buffer allocated for MMAP I/O
  b) buffer allocator which does not allocate pages from kernel page
     allocator
  c) queue that supports user space cache hints

If the driver does not set vb2_dma_contig_memops as q->mem_ops then
that queue should not have ->allow_cache_hints set. But even if it does,
the flag is ignored by the allocator.

So maybe the text can be:

+       ................... The flag takes effect only if the buffer is
+       used for :ref:`memory mapping <mmap>` I/O and the queue reports
+       :ref:`V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS` capability.

	-ss
