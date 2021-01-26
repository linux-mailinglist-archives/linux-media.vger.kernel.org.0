Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC5B6305B2F
	for <lists+linux-media@lfdr.de>; Wed, 27 Jan 2021 13:24:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S314069AbhAZW4K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jan 2021 17:56:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388685AbhAZT21 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Jan 2021 14:28:27 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D66DAC061573;
        Tue, 26 Jan 2021 11:27:39 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id a20so2595994pjs.1;
        Tue, 26 Jan 2021 11:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yle40tWleCzEixF2mwBGtJ3uB7QHbvhm1AXLk8kwIl8=;
        b=ZlkSubWPggrXH8a/wycob6mIua6+s0/ZdLTa5t2I6px+/S/tLG/+v+PoRWMqckd3Ni
         BJPh3o/DGMgDVUOglR6ENIVaJNdQqM/oKdsLbLHeXoYepAEFk5B8rcmSfC1hnzOUUrYq
         VZ9Y1ym2Eh0F6YGyspyf/MN3K5cy+uFnmjrrLGVtji/T8W4ly5ZjxCKfgAg14sOQl0L0
         uitV75YtyLO9mIJlv+RkIeftrpjh0vOQSBo4JQdKFGVUGSxee0vAnYHEz0aji5wTN7u4
         LREA6AJs9iDrayFk5sObqrTAYVNLBwJfb1lZLEEIuR/B9/4tOCzqc4uk9dFaGg1XYaSM
         McmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=yle40tWleCzEixF2mwBGtJ3uB7QHbvhm1AXLk8kwIl8=;
        b=gXoXXGu7REQF7h0I/prTxhtGLYT1Pgi98gpZYzWqdR3Ry96a+/KVjo8nU8tHYrz2VE
         YJCYfLD8DbewxwrU5tKDbJ//k16Tw9hPhTGWtYRQoqlLFF8MD3IQxdjo0pzQdwXSH38H
         Ouw0H302fgZLLh2W5GbMAd1NoRd1Q1dcQTJxUrSfGCoAqYQ8LQ1Dfu08XU1yLP9AOuNB
         fuSx6jVy++0yFSmPeayk2eiHoxtjTOTd4LldHwMkjjN4Q5qeb2DPe/l9S8dfmAVWwoLE
         YmEp++VfMV1+7IeDpEecmlNQdD9axDi5bUFXZn1N8uLenE6GSby1ByTbR/s6IW+y8UBI
         fIeg==
X-Gm-Message-State: AOAM530o8ejiWZnfUyF3we+cyX7/hIoNCEkhLiin7isVmP/CS3Se+z3i
        1W/iewqztUsXbE7LdnAYbe8=
X-Google-Smtp-Source: ABdhPJy5XocxQ8cgnEM5TwBXCFWhCBkaorP2EB5WKTN9SCc+sxCX2AoMx3hY+M6rFYi7ZiCnMRZYdg==
X-Received: by 2002:a17:90a:5793:: with SMTP id g19mr1418129pji.32.1611689259525;
        Tue, 26 Jan 2021 11:27:39 -0800 (PST)
Received: from google.com ([2620:15c:211:201:9dd5:b47b:bb84:dede])
        by smtp.gmail.com with ESMTPSA id w184sm20605882pgb.71.2021.01.26.11.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 11:27:38 -0800 (PST)
Sender: Minchan Kim <minchan.kim@gmail.com>
Date:   Tue, 26 Jan 2021 11:27:35 -0800
From:   Minchan Kim <minchan@kernel.org>
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        linux-mm <linux-mm@kvack.org>,
        LKML <linux-kernel@vger.kernel.org>, hyesoo.yu@samsung.com,
        david@redhat.com, mhocko@suse.com, surenb@google.com,
        pullip.cho@samsung.com, joaodias@google.com, hridya@google.com,
        john.stultz@linaro.org, sumit.semwal@linaro.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v4 4/4] dma-buf: heaps: add chunk heap to dmabuf heaps
Message-ID: <YBBtJ7zMrkdcNMuV@google.com>
References: <20210121175502.274391-1-minchan@kernel.org>
 <20210121175502.274391-5-minchan@kernel.org>
 <20210126070744.GA1244507@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210126070744.GA1244507@infradead.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jan 26, 2021 at 07:07:44AM +0000, Christoph Hellwig wrote:
> > +config DMABUF_HEAPS_CHUNK
> > +	bool "DMA-BUF CHUNK Heap"
> > +	depends on DMABUF_HEAPS && DMA_CMA
> > +	help
> > +	  Choose this option to enable dma-buf CHUNK heap. This heap is backed
> > +	  by the Contiguous Memory Allocator (CMA) and allocates the buffers that
> > +	  are arranged into a list of fixed size chunks taken from CMA.
> 
> Overly long line, which in text flowing text is really, really annoying.
> 
> Many more later.  Remember that > 80 chars are only allowed if they
> significantly improve readability.  

Let me make it shorter than 80 chars in next revision.
Thanks for the reivew, Christoph.
