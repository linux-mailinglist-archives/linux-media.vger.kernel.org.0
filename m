Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E45CB3AAE32
	for <lists+linux-media@lfdr.de>; Thu, 17 Jun 2021 09:57:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229834AbhFQH7L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Jun 2021 03:59:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229666AbhFQH7L (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Jun 2021 03:59:11 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C27DAC06175F
        for <linux-media@vger.kernel.org>; Thu, 17 Jun 2021 00:57:03 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id x10so2501076plg.3
        for <linux-media@vger.kernel.org>; Thu, 17 Jun 2021 00:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lWxUJxhz7O6kFGlQehJLdP1IrX0/F+zia2bYyRaN+u4=;
        b=U7ji2Myu1pVJ0NTa6ROs3kMnITp4KGNBkxCIUDH/9h9v8zv3cIxcdfbXFH5UOTNtTu
         OH+k8UmW6BiKCCkAQ6iwnpson24WDcJQmLJ46T3wMSoGTEI9HpvoWWrzSEdpK7c9FnFR
         gNYx50mOrCUmNGwx4rBzgvwSJzMeMVlxpVp2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lWxUJxhz7O6kFGlQehJLdP1IrX0/F+zia2bYyRaN+u4=;
        b=bysG4YTFO51l3r7nFRZdcCqY/ifmQ4CYWAcPmsMlem68GsmZMZKi1YCIvXCwdselD0
         hzCoo44S5N2nPzLKlnfxOJtFpOl7moW+0YN6V8MTAp1j2Cgrl/NiwVdnFcL4LZnjsXdY
         VkEtzUdBmz5zxk6owaTD6cNVUcCGYpDREK/rvSvHzFG50ev/PJS/V65qOyZ1bgpXAACS
         Q2Vugz5t1KcHqXRYq+1rFCXWmAY81GW6A6z6fCh9thewY6BUTmMpkF91efT9h1LjN8In
         OUurlXCifqO9ko5AwuGFApR/Mf0jCTG2/XetmzTZZtt3T3qXjpl4KpbkT631K/GrNGvx
         jXiw==
X-Gm-Message-State: AOAM533vYsAGx590k1fy5D+pc+Tomxjzr6oOa6/I2sD0MgfYrUH4FKu/
        jRie9/vvSU5b2KgjJI0LHVlkew==
X-Google-Smtp-Source: ABdhPJy+OzFqYL0+fgg7K7cexyu5dzwva4aO42WBStaKuByOyAyQ8YSjALACLshN7vsa2OBjnCUYWQ==
X-Received: by 2002:a17:902:7590:b029:11c:432f:d1ec with SMTP id j16-20020a1709027590b029011c432fd1ecmr3351376pll.59.1623916623323;
        Thu, 17 Jun 2021 00:57:03 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:32ae:4292:bec1:e4])
        by smtp.gmail.com with ESMTPSA id x6sm4253222pfd.173.2021.06.17.00.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 00:57:02 -0700 (PDT)
Date:   Thu, 17 Jun 2021 16:56:58 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv2 8/8] videobuf2: handle non-contiguous DMA allocations
Message-ID: <YMsASjnC5BDa6/E9@google.com>
References: <20210427131344.139443-1-senozhatsky@chromium.org>
 <20210427131344.139443-9-senozhatsky@chromium.org>
 <10a0903a-e295-5cba-683a-1eb89a0804ed@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10a0903a-e295-5cba-683a-1eb89a0804ed@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (21/06/03 13:59), Hans Verkuil wrote:
> >  
> > +static void __vb2_dc_put(struct vb2_dc_buf *buf)
> > +{
> > +	if (buf->coherent_mem) {
> > +		dma_free_attrs(buf->dev, buf->size, buf->cookie,
> > +			       buf->dma_addr, buf->attrs);
> > +		return;
> > +	}
> > +
> > +	if (buf->vaddr)
> > +		dma_vunmap_noncontiguous(buf->dev, buf->vaddr);
> > +	dma_free_noncontiguous(buf->dev, buf->size,
> > +			       buf->dma_sgt, buf->dma_addr);
> > +}
> 
> Is there a reason for creating __vb2_dc_put()? I found it more
> a hindrance when reviewing than an advantage. I prefer to have
> it moved to vb2_dc_put, that way all the clean up happens in that
> single function.

Done.
