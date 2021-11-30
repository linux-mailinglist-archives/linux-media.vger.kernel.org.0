Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83B77462E8B
	for <lists+linux-media@lfdr.de>; Tue, 30 Nov 2021 09:31:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239623AbhK3Ied (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Nov 2021 03:34:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239620AbhK3Iec (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Nov 2021 03:34:32 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA1E1C061574
        for <linux-media@vger.kernel.org>; Tue, 30 Nov 2021 00:31:13 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id g14so83403951edb.8
        for <linux-media@vger.kernel.org>; Tue, 30 Nov 2021 00:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=GMM6hj319wAs5POVBFDLh6DbIb0qq9wk3Wcw4ZV0r2Y=;
        b=Hc6Yi6eQ3GtUBUI3WuciYPZtsIx42QpLCBTjxjGlWhPN2n1jTEsBIvYplewCjgdbc/
         lSu9rVVWhM+12NPM63jIEV+CpC0QneQSuhP4dUrZNui/cxastpnGzfGTMxQ8MluJ5Dvb
         UshwKMxaKlBbF76VRnZUBHpx/dPgCRYaIoxyo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=GMM6hj319wAs5POVBFDLh6DbIb0qq9wk3Wcw4ZV0r2Y=;
        b=anFOvsa//ow2vTQpxe7amD6GFAzQybQZcMfvM39uWyCBlk0UVaJmeX8WxrzkCsO4eD
         lnZ5VrX3J3Try5bn+eN7Tg2feqjs9j5RncWPcR1aLGB5bBkLPe/hAvGyLgRUsnpcQVnv
         TPhs2HVzJ/QxsE47UtEE0z1735uk3x8opBNogXqr3h7wbOpOfBwzDOoXz2of5RJgIrVZ
         v3cwlY1W80XZyqjwAWp/mytYmuN8F/oaRB5FjHGL7ptigxFVO6LR7hK8EmtsPnyazPjt
         uQsx9kpipaSgUKl64iokAxB0Pv16cqDVzP5g2vgMf/yUchO7Yb24B8ewV6xRKBvxbzwB
         A10g==
X-Gm-Message-State: AOAM533k2i6TDz7Ltb8eB59u9DvttbvTfkD1hRlg9gDEw2klnOR9fee5
        Wx6ylB/UTOPkAAWzFL36EnSdeq/Gf5EvJQ==
X-Google-Smtp-Source: ABdhPJyai5hi6W4uK1D5519BQ1UPwtPEl6b4o8aZO9aCKtIlBdeoAaOOrYlM9h3nEuXtCU99zNLfJQ==
X-Received: by 2002:a17:906:bcce:: with SMTP id lw14mr66471416ejb.411.1638261072383;
        Tue, 30 Nov 2021 00:31:12 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id u23sm11102327edi.88.2021.11.30.00.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 00:31:11 -0800 (PST)
Date:   Tue, 30 Nov 2021 09:31:10 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>, sumit.semwal@linaro.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 22/26] dma-buf: add enum dma_resv_usage
Message-ID: <YaXhTkSKJH0tO6WT@phenom.ffwll.local>
References: <20211123142111.3885-1-christian.koenig@amd.com>
 <20211123142111.3885-23-christian.koenig@amd.com>
 <YZ+y+Uwo809qtvs5@phenom.ffwll.local>
 <1e45687c-23ee-03da-abb8-da4a5f9d2872@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1e45687c-23ee-03da-abb8-da4a5f9d2872@gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 29, 2021 at 01:19:11PM +0100, Christian König wrote:
> Am 25.11.21 um 16:59 schrieb Daniel Vetter:
> > [SNIP]
> > > + *
> > > + * For example when asking for WRITE fences then the KERNEL fences are returned
> > > + * as well. Similar when asked for READ fences then both WRITE and KERNEL
> > > + * fences are returned as well.
> > > + */
> > > +enum dma_resv_usage {
> > > +	/**
> > > +	 * @DMA_RESV_USAGE_KERNEL: For in kernel memory management only.
> > > +	 *
> > > +	 * This should only be used for things like copying or clearing memory
> > > +	 * with a DMA hardware engine for the purpose of kernel memory
> > > +	 * management.
> > > +	 *
> > > +         * Drivers *always* need to wait for those fences before accessing the
> > > +	 * resource protected by the dma_resv object. The only exception for
> > > +	 * that is when the resource is known to be locked down in place by
> > > +	 * pinning it previously.
> > Should dma_buf_pin also do the wait for kernel fences? I think that would
> > also ba e bit clearer semantics in the dma-buf patch which does these
> > waits for us.
> > 
> > Or should dma_buf_pin be pipelined and it's up to callers to wait? For kms
> > that's definitely the semantics we want, but it's a bit playing with fire
> > situation, so maybe dma-buf should get the more idiot proof semantics?
> 
> Yeah, good question. I've already added a wait after mapping an attachment
> for static importers.
> 
> But for dynamic importers I'm not sure what we want to do. On the one hand
> waiting for moves to finish is certainly the more defensive approach on the
> other hand when you have a dynamic importer you absolutely need to handle
> those dependencies correctly anyway.

Hm yeah only doing it for non-dynamic attachments sounds fine to me (with
kerneldoc in dma_buf_pin() ofc).
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
