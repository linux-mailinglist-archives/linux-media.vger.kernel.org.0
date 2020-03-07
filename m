Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 775F017CC42
	for <lists+linux-media@lfdr.de>; Sat,  7 Mar 2020 06:26:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725954AbgCGF0b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 Mar 2020 00:26:31 -0500
Received: from mail-pj1-f53.google.com ([209.85.216.53]:55300 "EHLO
        mail-pj1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725878AbgCGF0b (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 7 Mar 2020 00:26:31 -0500
Received: by mail-pj1-f53.google.com with SMTP id a18so1945297pjs.5
        for <linux-media@vger.kernel.org>; Fri, 06 Mar 2020 21:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=m0qO8FIzp0cZyprt1Sa2E1nulU01Dq+FQDcf56JRaHM=;
        b=QzwlzqVXEjKsreaLXEMpUJwqFE9q8wUq/dd8gNsxRm2RkZ8vMILiU4H+qO3wD5fqX3
         m/NqdrHt4y+FWKPjnPbLVVGwd746Y8OvEytoQxpQkZYlnu8kq6XIwa8Y118PZSq9u6Tv
         BB/DJdbuCZ8Mt4i6CW9pCBRy9U0f26rVEhi64=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=m0qO8FIzp0cZyprt1Sa2E1nulU01Dq+FQDcf56JRaHM=;
        b=bSHmQ6qxth3enRrBUtVk5FCDLB+jYHcewVotDNyvLs1UJSCz0EbJVsD6rkwC1rCXOO
         m4CF7tixNhEuNIOswj2VRkW6KnhX2OdKVVbgqWH4mghpT75JQq+wbw5SnkU5OE9PCR5g
         102+GNiHMbC8xPEiaMah2knVGOhjRk/s/k82gfXEsMHNKs5cqcmY9c1DpRPJMxhFLlwb
         SyamVfgGBLw7vB0kEplCJMq810BMYH6gvpUZ1rez3KGKUtc6QtTTBGnh0/9F/hJ86MJk
         ZWh8gxUa/t5aYC5Xmi4qTvduNFelaL2X3m+5gn1jES/kYqIyovjhqRLehmqvNIgW3Gcp
         q91Q==
X-Gm-Message-State: ANhLgQ0Id5/S9Pl7C6zsQexAOAZ75L6pQs/2R3LhZuxVuKLpBh2BLXb7
        PDSIWYLr7hlg+JMPvgL6OTFrEg==
X-Google-Smtp-Source: ADFU+vuU++UabpUn23TPIMjF0+4FrG9QMbre/vx+vzcwlvnA8Lx3/HlVqnnIynK1UAqogvvbZlFjQQ==
X-Received: by 2002:a17:902:6ac7:: with SMTP id i7mr6107489plt.314.1583558790277;
        Fri, 06 Mar 2020 21:26:30 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:5bbb:c872:f2b1:f53b])
        by smtp.gmail.com with ESMTPSA id 185sm30060827pfv.104.2020.03.06.21.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2020 21:26:29 -0800 (PST)
Date:   Sat, 7 Mar 2020 14:26:28 +0900
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
Subject: Re: [PATCHv4 10/11] videobuf2: add begin/end cpu_access callbacks to
 dma-sg
Message-ID: <20200307052628.GB176460@google.com>
References: <20200302041213.27662-1-senozhatsky@chromium.org>
 <20200302041213.27662-11-senozhatsky@chromium.org>
 <f99cd8d2-26a2-acd1-a986-aee66cd2ba12@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f99cd8d2-26a2-acd1-a986-aee66cd2ba12@xs4all.nl>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (20/03/06 15:04), Hans Verkuil wrote:
[..]
> > +	/*
> > +	 * NOTE: dma-sg allocates memory using the page allocator directly, so
> > +	 * there is no memory consistency guarantee, hence dma-sg ignores DMA
> > +	 * attributes passed from the upper layer. That means that
> > +	 * V4L2_FLAG_MEMORY_NON_CONSISTENT has no effect on dma-sg buffers.
> > +	 */
> >  	buf->pages = kvmalloc_array(buf->num_pages, sizeof(struct page *),
> >  				    GFP_KERNEL | __GFP_ZERO);
> >  	if (!buf->pages)
> > @@ -470,6 +476,26 @@ static void vb2_dma_sg_dmabuf_ops_release(struct dma_buf *dbuf)
> >  	vb2_dma_sg_put(dbuf->priv);
> >  }
> >  
> > +static int vb2_dma_sg_dmabuf_ops_begin_cpu_access(struct dma_buf *dbuf,
> > +					enum dma_data_direction direction)
> 
> I suggest you use this style to avoid checkpatch warnings:
> 
> static int
> vb2_dma_sg_dmabuf_ops_begin_cpu_access(struct dma_buf *dbuf,
> 				       enum dma_data_direction direction)

OK, will do.

Just for information, my checkpatch doesn't warn me:

$ ./scripts/checkpatch.pl outgoing/0010-videobuf2-add-begin-end-cpu_access-callbacks-to-dma-.patch
total: 0 errors, 0 warnings, 46 lines checked

outgoing/0010-videobuf2-add-begin-end-cpu_access-callbacks-to-dma-.patch has no obvious style problems and is ready for submission.

	-ss
