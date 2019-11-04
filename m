Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DB75EE6F4
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2019 19:11:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729436AbfKDSLD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Nov 2019 13:11:03 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:40361 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728346AbfKDSLC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Nov 2019 13:11:02 -0500
Received: by mail-wr1-f68.google.com with SMTP id o28so18204107wro.7
        for <linux-media@vger.kernel.org>; Mon, 04 Nov 2019 10:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:mail-followup-to
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=j2dTn7Wj7MGJZeGgFXPtBogE4qg0BoOVrIkL6wJedbU=;
        b=RPIdhIouR3j/Ac7neKFnGVsgwJtt56byt4O2813ik4ObcxN+6tPIIPEpIvd4bHdCQy
         xfCULaOlOfNgr9pPNLunatyY1TT5oMd7MopfAimYN7Fzif9xA431/mZ6rvrz1NeweKf9
         nhCRlvw6Mqd6dfgcS8I0AQ1BearSl/gQZ3yck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=j2dTn7Wj7MGJZeGgFXPtBogE4qg0BoOVrIkL6wJedbU=;
        b=KpPy4Quu1a2ef4UnePr0VKe5OMQ8KHhEBCbmlUH20A3HsMECtFXNz+eVxRuvzUBiGJ
         +C3YEd2mv7moAeIJUA69rz6L4xzvFBxhi6qfzCvV4s37G/dJxE3xHleKVplDpQhbtJbN
         OWIIYNadAf4qB/6i91mOavFG2sTJECdGXJDAqQXk1HiBM4my2A9ZA4u96oQ8GPrXmRrb
         1d2OzC/mEwcQmbWzAR0/rDeFh7Jv0sYKU3NTgS/p+ZkW5hxf3Tbtv2e8/xMLAWADrDNc
         XXXXqap/Ia/CPAEJZeARyLC+j6XCcGs5W7NjxwSI661U61FRDpUD2G+G64UIZxgc9O1L
         GItw==
X-Gm-Message-State: APjAAAX5THK2X2y5YRTsTAQg8sYX7o4fc4fott465ZiM2Bn3SMOjgUh9
        3tVeZ+sbtzO4ME56D4RbySyr+w==
X-Google-Smtp-Source: APXvYqwKkCPGo7mLK0jIbZGuRHh4x9upKlx8LPQBL5XTz+fwA202HVPHUNfjQCRnXVzy4o6JxOqyww==
X-Received: by 2002:a5d:448a:: with SMTP id j10mr25997024wrq.79.1572891058912;
        Mon, 04 Nov 2019 10:10:58 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id f13sm17508153wrq.96.2019.11.04.10.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 10:10:57 -0800 (PST)
Date:   Mon, 4 Nov 2019 19:10:55 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Ira Weiny <ira.weiny@intel.com>
Cc:     John Hubbard <jhubbard@nvidia.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Alex Williamson <alex.williamson@redhat.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>,
        Christoph Hellwig <hch@infradead.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dave Chinner <david@fromorbit.com>,
        David Airlie <airlied@linux.ie>,
        "David S . Miller" <davem@davemloft.net>, Jan Kara <jack@suse.cz>,
        Jason Gunthorpe <jgg@ziepe.ca>, Jens Axboe <axboe@kernel.dk>,
        Jonathan Corbet <corbet@lwn.net>,
        =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
        Magnus Karlsson <magnus.karlsson@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Michal Hocko <mhocko@suse.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Paul Mackerras <paulus@samba.org>,
        Shuah Khan <shuah@kernel.org>,
        Vlastimil Babka <vbabka@suse.cz>, bpf@vger.kernel.org,
        dri-devel@lists.freedesktop.org, kvm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rdma@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org,
        linux-mm@kvack.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 09/19] drm/via: set FOLL_PIN via pin_user_pages_fast()
Message-ID: <20191104181055.GP10326@phenom.ffwll.local>
Mail-Followup-To: Ira Weiny <ira.weiny@intel.com>,
        John Hubbard <jhubbard@nvidia.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Alex Williamson <alex.williamson@redhat.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>,
        Christoph Hellwig <hch@infradead.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Dave Chinner <david@fromorbit.com>, David Airlie <airlied@linux.ie>,
        "David S . Miller" <davem@davemloft.net>, Jan Kara <jack@suse.cz>,
        Jason Gunthorpe <jgg@ziepe.ca>, Jens Axboe <axboe@kernel.dk>,
        Jonathan Corbet <corbet@lwn.net>,
        =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
        Magnus Karlsson <magnus.karlsson@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Michal Hocko <mhocko@suse.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Paul Mackerras <paulus@samba.org>, Shuah Khan <shuah@kernel.org>,
        Vlastimil Babka <vbabka@suse.cz>, bpf@vger.kernel.org,
        dri-devel@lists.freedesktop.org, kvm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rdma@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org,
        linux-mm@kvack.org, LKML <linux-kernel@vger.kernel.org>
References: <20191030224930.3990755-1-jhubbard@nvidia.com>
 <20191030224930.3990755-10-jhubbard@nvidia.com>
 <20191031233628.GI14771@iweiny-DESK2.sc.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191031233628.GI14771@iweiny-DESK2.sc.intel.com>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 31, 2019 at 04:36:28PM -0700, Ira Weiny wrote:
> On Wed, Oct 30, 2019 at 03:49:20PM -0700, John Hubbard wrote:
> > Convert drm/via to use the new pin_user_pages_fast() call, which sets
> > FOLL_PIN. Setting FOLL_PIN is now required for code that requires
> > tracking of pinned pages, and therefore for any code that calls
> > put_user_page().
> > 
> 
> Reviewed-by: Ira Weiny <ira.weiny@intel.com>

No one's touching the via driver anymore, so feel free to merge this
through whatever tree suits best (aka I'll drop this on the floor and
forget about it now).

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> 
> > Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> > ---
> >  drivers/gpu/drm/via/via_dmablit.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/via/via_dmablit.c b/drivers/gpu/drm/via/via_dmablit.c
> > index 3db000aacd26..37c5e572993a 100644
> > --- a/drivers/gpu/drm/via/via_dmablit.c
> > +++ b/drivers/gpu/drm/via/via_dmablit.c
> > @@ -239,7 +239,7 @@ via_lock_all_dma_pages(drm_via_sg_info_t *vsg,  drm_via_dmablit_t *xfer)
> >  	vsg->pages = vzalloc(array_size(sizeof(struct page *), vsg->num_pages));
> >  	if (NULL == vsg->pages)
> >  		return -ENOMEM;
> > -	ret = get_user_pages_fast((unsigned long)xfer->mem_addr,
> > +	ret = pin_user_pages_fast((unsigned long)xfer->mem_addr,
> >  			vsg->num_pages,
> >  			vsg->direction == DMA_FROM_DEVICE ? FOLL_WRITE : 0,
> >  			vsg->pages);
> > -- 
> > 2.23.0
> > 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
