Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 374A628892F
	for <lists+linux-media@lfdr.de>; Fri,  9 Oct 2020 14:48:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732467AbgJIMsx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Oct 2020 08:48:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729045AbgJIMsw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Oct 2020 08:48:52 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58AABC0613D2
        for <linux-media@vger.kernel.org>; Fri,  9 Oct 2020 05:48:52 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id s4so10362701qkf.7
        for <linux-media@vger.kernel.org>; Fri, 09 Oct 2020 05:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bKAda/rTW4nq6+j1jXEBgS/13SJBQ2WY2j5bHQ+ISAM=;
        b=HLVf/9fs3er+0kSwyJTggMLNde7v6twDJX2OORdUgNP4K/LTsJAusSj3xZhnK/9iEP
         2MiDVI/gcY40GDzZOHFy1D1gUeZmYvK+y8q3WrgO2wIZyqUCgxZmIrGytraz5FbwrvVk
         FIWoQQ/EYzOwBXKaVfiWwe8sni4FQhNRH93rHGzY9G+WQBuX2toU0JYl3qUK8vxILogk
         CO/+6WIVejt98w1VEtO30gtBiu4FzGnjZIpjkg9+CRC8VLCjso0cqZThY5uICmC4Leel
         mG8PVTlyewS4MOqVzGOqsDKY0BxrcNvf/7YuapUiGj3wEjRkZ+Rv/IezCJ6KD+Oa9Tui
         5i5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bKAda/rTW4nq6+j1jXEBgS/13SJBQ2WY2j5bHQ+ISAM=;
        b=Qh3erHcceEOmG/zSB36nJB/Y5u3Aqg0zhCgs4fwb8d6tQpJAKP6G0a95yzCemxilF7
         n9rl2eJjFoleEd5mlL8jZWd5XJLFp2EAlSkmIAojm6PeUeHYrtMIdLIHjnav5LJXIW+I
         TFKP5WaRu0wfCHaVHHV/2NBhfi231NJn42VBn3gKKGrLCZyB8qw37bxzzncEx29e4QL2
         IiNLraTyAsmQos4ioKEQR7r5Lb4HAW0UUORmYLiTFB1vLp4do20Adhrlg3OLJlUjbLQ9
         MYGt9hWyVDfpDTNeYo657zEEJwJ83gNreEdmhl4X3jV9ng48UKP8kQOtFKtwrMI7+CG8
         I3HA==
X-Gm-Message-State: AOAM5337tjiPxBpk7AknpnPe5Yx8QHnklMUUqoBEAKFS1/Kg7VSp2q47
        e6PmsS+XsSni3A50DiaVRkdn1A==
X-Google-Smtp-Source: ABdhPJxKkkXOIA4i8TbRkwc7dtfamUS7+upXdOHf9JVMgQW+IXdzrhalpqUKvvNnrEeFMFZ6pHcyaQ==
X-Received: by 2002:ae9:e702:: with SMTP id m2mr6280147qka.387.1602247731583;
        Fri, 09 Oct 2020 05:48:51 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id m18sm4248636qkk.102.2020.10.09.05.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 05:48:50 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1kQrpK-001y6e-9J; Fri, 09 Oct 2020 09:48:50 -0300
Date:   Fri, 9 Oct 2020 09:48:50 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>, kvm@vger.kernel.org,
        linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        linux-s390@vger.kernel.org,
        Daniel Vetter <daniel.vetter@intel.com>,
        Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v2 09/17] mm: Add unsafe_follow_pfn
Message-ID: <20201009124850.GP5177@ziepe.ca>
References: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
 <20201009075934.3509076-10-daniel.vetter@ffwll.ch>
 <20201009123421.67a80d72@coco.lan>
 <20201009122111.GN5177@ziepe.ca>
 <20201009143723.45609bfb@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201009143723.45609bfb@coco.lan>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 09, 2020 at 02:37:23PM +0200, Mauro Carvalho Chehab wrote:

> I'm not a mm/ expert, but, from what I understood from Daniel's patch
> description is that this is unsafe *only if*  __GFP_MOVABLE is used.

No, it is unconditionally unsafe. The CMA movable mappings are
specific VMAs that will have bad issues here, but there are other
types too.

The only way to do something at a VMA level is to have a list of OK
VMAs, eg because they were creatd via a special mmap helper from the
media subsystem.

> Well, no drivers inside the media subsystem uses such flag, although
> they may rely on some infrastructure that could be using it behind
> the bars.

It doesn't matter, nothing prevents the user from calling media APIs
on mmaps it gets from other subsystems.

> If this is the case, the proper fix seems to have a GFP_NOT_MOVABLE
> flag that it would be denying the core mm code to set __GFP_MOVABLE.

We can't tell from the VMA these kinds of details..

It has to go the other direction, evey mmap that might be used as a
userptr here has to be found and the VMA specially created to allow
its use. At least that is a kernel only change, but will need people
with the HW to do this work.

> Please let address the issue on this way, instead of broken an
> userspace API that it is there since 1991.

It has happened before :( It took 4 years for RDMA to undo the uAPI
breakage caused by a security fix for something that was a 15 years
old bug. 

Jason
