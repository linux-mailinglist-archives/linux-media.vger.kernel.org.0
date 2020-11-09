Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29F4B2AC5DA
	for <lists+linux-media@lfdr.de>; Mon,  9 Nov 2020 21:19:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729835AbgKIUTr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Nov 2020 15:19:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729243AbgKIUTr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Nov 2020 15:19:47 -0500
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com [IPv6:2607:f8b0:4864:20::f44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34594C0613D6
        for <linux-media@vger.kernel.org>; Mon,  9 Nov 2020 12:19:47 -0800 (PST)
Received: by mail-qv1-xf44.google.com with SMTP id 13so4734821qvr.5
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2020 12:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=HHHYB1ExYLieT1XHJGJI8HPhRjnPWnLekqDHsJKHIQY=;
        b=JXgaaqDOW62GJeK6LF9p9QXp4arZzjT+9gOkdgDMbbBoFO+8sUD00sB0JqVlcQZSxV
         vl2psYZJGXUFO5mwdAm7RkY4hAKaDkxQqxt9cCodVKzEWjgN2Avsu8bajD/+E6QYqqdC
         A1tRfbBTXbInfICRoJGTOSrrECkpnxpkzxbI7e/1OJCxzWq7kFD95wrfiSB8nZ6UecOk
         dClV/5rDLoThnRxwB0KwY4Vkv6oNJCO+A0hAlZU2ZqdpITWBVjpnAPdneJ9qCIAXfZVP
         ty/uyz1FELwQ29ayrN7FVG+4y3r6CEdfAZ6dA9hGacXCCPrSnv8g+b6mYWP6EPJDPMhi
         BDZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=HHHYB1ExYLieT1XHJGJI8HPhRjnPWnLekqDHsJKHIQY=;
        b=rI5df+Ds4Q6dzzCOtVwuJvE0m6tahVReO5DDSqYKMd2uEgeMfVcFLcs9KuHE3awiXR
         NEOlmcjb7fxZdXwPrMLPhoe9X0szMa+rkpxJJvGsYAAK68op8q0p5KSt8ovrxtJSYX3t
         d5hM0x1TCViLq+1tk1Kz5uPjwW0+U074DDirDa4uJZN3cZCC5AkyQQXgSEj06iXw4U7b
         uPRdB4skYf7C/AnQ+V2RGyLZv74YkErmgkjWeiXqnw/GwXcWFa7nuzkNkIwTW6Q09pTt
         keRvIPi9b7cMqSv5jxQAZWRchTQj5LCALLgOM1hl6BCUsf2UcCC8o5PTI+vR0H1zgNUV
         FsrQ==
X-Gm-Message-State: AOAM533djFowCENxkpi01LfW2o97sVKvrhtho28ftwV9P9IK11EIrviG
        dj9BntmK3FSp+6x6t4Ba26LyyQ==
X-Google-Smtp-Source: ABdhPJzK9dM3acw0STrCk9csKCfXW/JXgGf/mN+se1YyATHnQetQCofOE1QIpslDFg5IZrWXLNthmQ==
X-Received: by 2002:a0c:edb1:: with SMTP id h17mr15177616qvr.7.1604953186119;
        Mon, 09 Nov 2020 12:19:46 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id l28sm6916468qkl.7.2020.11.09.12.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 12:19:45 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1kcDdg-0026FV-KT; Mon, 09 Nov 2020 16:19:44 -0400
Date:   Mon, 9 Nov 2020 16:19:44 -0400
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Thomas =?utf-8?Q?Hellstr=C3=B6m?= 
        <thomas.hellstrom@linux.intel.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        John Hubbard <jhubbard@nvidia.com>,
        Christoph Hellwig <hch@infradead.org>,
        J??r??me Glisse <jglisse@redhat.com>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        Jan Kara <jack@suse.cz>, Pawel Osciak <pawel@osciak.com>,
        KVM list <kvm@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Linux MM <linux-mm@kvack.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH v5 05/15] mm/frame-vector: Use FOLL_LONGTERM
Message-ID: <20201109201944.GG244516@ziepe.ca>
References: <20201104164119.GA18218@infradead.org>
 <20201104181708.GU36674@ziepe.ca>
 <d3497583-2338-596e-c764-8c571b7d22cf@nvidia.com>
 <20201105092524.GQ401619@phenom.ffwll.local>
 <20201105124950.GZ36674@ziepe.ca>
 <7ae3486d-095e-cf4e-6b0f-339d99709996@nvidia.com>
 <CAKMK7uGRw=xXE+D=JJsNeRav9+hdO4tcDSvDbAuWfc3T4VkoJw@mail.gmail.com>
 <CAKMK7uFb2uhfRCwe1y5Kafd-WWqE_F3_FfpHR9f8-X-aHhgjOQ@mail.gmail.com>
 <20201106125505.GO36674@ziepe.ca>
 <504d77b87c81b7027157e0c7b5286e17123c59d9.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <504d77b87c81b7027157e0c7b5286e17123c59d9.camel@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 09, 2020 at 09:44:02AM +0100, Thomas Hellström wrote:
> static inline bool vma_is_special_huge(const struct vm_area_struct
> *vma)
> {
> 	return vma_is_dax(vma) || (vma->vm_file &&
> 				   (vma->vm_flags & (VM_PFNMAP | VM_MIXEDMAP)));
> }

That is testing a VMA, not a PTE, which doesn't help protect
get_user_pages_fast.

Sounds like is has opened a big user crashy problem in DRM and the
huge page stuff needs to be revereted..

Dan?

Jason
