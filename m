Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3873A2044EA
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2020 02:02:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730926AbgFWACf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Jun 2020 20:02:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730774AbgFWACe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Jun 2020 20:02:34 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 486E9C061796
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2020 17:02:34 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id i16so14115960qtr.7
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2020 17:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fL1wENgZCNwSv3s/JTNbtGHYfJcNOvZphPgobRgCX+0=;
        b=jOiz5xhY4H9RrA31ewUoMb6lWoSEJluMNJ4pFLIyuL2C/PAw2cU4NhHZPSbOtneWmY
         ozUMm9lxePnw9yOjxx4YXvXCK3kITgyY6VI+mhuSl9fkmcyIppyhy/Jz6vVv/4LKzuRn
         Gb8qhMwxyR4RKm7f3IBCU6P9IiqbHgwNX0yoHpJ3PAkHDvus22DcgqWtCXRMKvuPd80+
         GtMIE29iM9uSkrK/mkJM41mZz+r3jtg9ekirUsyx5erxi/e/W0HuUH+SRS8iBijVSbYY
         gVUrM+bjvjO7k15tkl2NlzpoPMdsvYPWVTdqh0sfLGGUDdoylYfcONvUD2B6N+OO84GZ
         lj3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fL1wENgZCNwSv3s/JTNbtGHYfJcNOvZphPgobRgCX+0=;
        b=SEwVLr9Q+jaMmLdr5QIBYmXeaMsCXqLfKwWydUB49O1/FhRrTY3vBLe0+AjE5YcJnU
         b9MnNCC17mx2t9NCy3FLB51X01WZFcr5wLqHsT+3ImASjjnOM4FOnPcCzzQ6jdQZz5/4
         JYFEkMg459BUfVwicCPMOan5ZOIPmzXFQqQokA3qeRj9rvSHCUy8a3xFFLjWMm6QnHsg
         PuAQ7CViN9lHAF616BBr1jegY4XaCjhdsUpF+61JFBEknh7ujvZ0a2oPdj8IzbdzjY0g
         HqHAybhpOv9urYrvk6iHi+nXCX0NzqsLGphT/hjMmdQJ3cqzIQZVk0mZbaz6EhPVF4YA
         JCAw==
X-Gm-Message-State: AOAM533nD13kXpibXWhvDlrujvs2WCYT971yNoIyC4jFacAAbDjRQUrt
        tRI+W+wVG/iTNkS1zChjC9B6LQ==
X-Google-Smtp-Source: ABdhPJyCyWWM03fNzzwWcrkorPAde8ZwkJyT1NwEy7u+QyW/bvUE+EE8dkCWV5n1HdRyI+PQxXYPRQ==
X-Received: by 2002:ac8:70da:: with SMTP id g26mr17916678qtp.333.1592870553204;
        Mon, 22 Jun 2020 17:02:33 -0700 (PDT)
Received: from ziepe.ca ([206.223.160.26])
        by smtp.gmail.com with ESMTPSA id d186sm6145604qkb.110.2020.06.22.17.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 17:02:32 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.93)
        (envelope-from <jgg@ziepe.ca>)
        id 1jnWOV-00CHMM-GL; Mon, 22 Jun 2020 21:02:31 -0300
Date:   Mon, 22 Jun 2020 21:02:31 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Jerome Glisse <jglisse@redhat.com>
Cc:     Felix Kuehling <felix.kuehling@amd.com>,
        linux-rdma <linux-rdma@vger.kernel.org>,
        Thomas =?utf-8?B?SGVsbHN0csO2bSAoSW50ZWwp?= 
        <thomas_os@shipmail.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        LKML <linux-kernel@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Thomas Hellstrom <thomas.hellstrom@intel.com>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Mika Kuoppala <mika.kuoppala@intel.com>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Subject: Re: [Linaro-mm-sig] [PATCH 04/18] dma-fence: prime lockdep
 annotations
Message-ID: <20200623000231.GW6578@ziepe.ca>
References: <20200619151551.GP6578@ziepe.ca>
 <CAKMK7uEvkshAM6KUYZu8_OCpF4+1Y_SM7cQ9nJWpagfke8s8LA@mail.gmail.com>
 <20200619172308.GQ6578@ziepe.ca>
 <20200619180935.GA10009@redhat.com>
 <20200619181849.GR6578@ziepe.ca>
 <56008d64-772d-5757-6136-f20591ef71d2@amd.com>
 <20200619195538.GT6578@ziepe.ca>
 <20200619203147.GC13117@redhat.com>
 <20200622114617.GU6578@ziepe.ca>
 <20200622201540.GB9708@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200622201540.GB9708@redhat.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jun 22, 2020 at 04:15:40PM -0400, Jerome Glisse wrote:
> On Mon, Jun 22, 2020 at 08:46:17AM -0300, Jason Gunthorpe wrote:
> > On Fri, Jun 19, 2020 at 04:31:47PM -0400, Jerome Glisse wrote:
> > > Not doable as page refcount can change for things unrelated to GUP, with
> > > John changes we can identify GUP and we could potentialy copy GUPed page
> > > instead of COW but this can potentialy slow down fork() and i am not sure
> > > how acceptable this would be. Also this does not solve GUP against page
> > > that are already in fork tree ie page P0 is in process A which forks,
> > > we now have page P0 in process A and B. Now we have process A which forks
> > > again and we have page P0 in A, B, and C. Here B and C are two branches
> > > with root in A. B and/or C can keep forking and grow the fork tree.
> > 
> > For a long time now RDMA has broken COW pages when creating user DMA
> > regions.
> > 
> > The problem has been that fork re-COW's regions that had their COW
> > broken.
> > 
> > So, if you break the COW upon mapping and prevent fork (and others)
> > from copying DMA pinned then you'd cover the cases.
> 
> I am not sure we want to prevent COW for pinned GUP pages, this would
> change current semantic and potentialy break/slow down existing apps.

Isn't that basically exactly what 17839856fd588 does? It looks like it
uses the same approach RDMA does by sticking FOLL_WRITE even though it
is a read action.

After that change the reamining bug is that fork can re-establish a
COW./

> Anyway i think we focus too much on fork/COW, it is just an unfixable
> broken corner cases, mmu notifier allows you to avoid it. Forcing real
> copy on fork would likely be seen as regression by most people.

If you don't copy the there are data corruption bugs though. Real apps
probably don't hit a problem here as they are not forking while GUP's
are active (RDMA excluded, which does do this)

I think that implementing page pinning by blocking mmu notifiers for
the duration of the pin is a particularly good idea either, that
actually seems a lot worse than just having the pin in the first
place.

Particularly if it is only being done to avoid corner case bugs that
already afflict other GUP cases :(

> > What do you mean 'GUP fast is still succeptible to this' ?
> 
> Not all GUP fast path are updated (intentionaly) __get_user_pages_fast()

Sure, that is is the 'raw' accessor

Jason
