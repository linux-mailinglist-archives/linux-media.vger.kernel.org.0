Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04B2A28885B
	for <lists+linux-media@lfdr.de>; Fri,  9 Oct 2020 14:12:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388418AbgJIMMY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Oct 2020 08:12:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732957AbgJIMMX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Oct 2020 08:12:23 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 316E8C0613D2
        for <linux-media@vger.kernel.org>; Fri,  9 Oct 2020 05:12:23 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id z6so10294159qkz.4
        for <linux-media@vger.kernel.org>; Fri, 09 Oct 2020 05:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CDbjI7PI2DVtcti/K71bQwrAiX/e3WO6iYhXq1xpE8k=;
        b=QZHZihMbJ0+6cO/RXFdRTnbjHZMdsMwMdoZ9ofxIbLiL7huuUpUScZKwWV84kB55Bx
         Uj0tRXkYKOAM75Zw3mq9huJb+sXq21viOZihFZp7lRXmxRJ1cFf8BtITIb1t2tYeDMCa
         txj96jZKuDfh/KqtvpNSOfhj3rLyTVUnAr0oXGalYRsnEuMdnS5jRpZrZBYvWtLxhF/R
         8KJwS/cHgY0rK/bg+oGMABqazzprmcMisElyCeHlYguGApZ1AR8/+MXPoqVhnTd0VCNc
         25kstyMGbbGfaTeeP9LQeGTP2F+aZXhWaayqadeXvcUq6gtI3AMZT8PIqYCcvUwK2WBG
         1Xkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CDbjI7PI2DVtcti/K71bQwrAiX/e3WO6iYhXq1xpE8k=;
        b=eqOpBYUP1KZj0RYhzO/JNsCAt8j+ixpylMyzs+uJwQB3/Ng9c5rxfrxVLu9GbIyWK5
         BvnO8XD7FoZxQEyVggiRPdhd/LxYl2h/bJOqneSxmBrNqgOqFVheJDqg4nZEGnsTsxgs
         XK6Azauj7yb1Eseti3sxIfjaDxPr79iYIE8bon6mnTAO1HVvk56zvKa8GfGux0QncwO+
         WTUctJ6fVtcBl2eD6hdO8j+l7X1ODaJd5hkSCJLwTC1stunvfcjCcWzQnMWoGH0DtuVR
         XS5IqbmZmEnEBq4n/xKnoUiTJwc6C9L3/TMdF3ABxpEUTrjayZcvb46Z+xJbBBmKGNXT
         6nPw==
X-Gm-Message-State: AOAM533TDYQUqPrHbT2YxMMI/cbxdDUE3lkuofDFWJH3ZVm5RTvkinb2
        NM2f1CjPczbGXT4+5hqmf8s8RTyY+eMuyOsU
X-Google-Smtp-Source: ABdhPJxEdEoxk4QkWTG/LbIw5wa4/oJkAIU0dpDguLktaDqFHaLdn7sPQWVl5NbgF//Vvgox/Hv3PQ==
X-Received: by 2002:a05:620a:62b:: with SMTP id 11mr11556303qkv.229.1602245542390;
        Fri, 09 Oct 2020 05:12:22 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id g19sm5882365qkm.64.2020.10.09.05.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 05:12:21 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1kQrG0-001xcJ-L2; Fri, 09 Oct 2020 09:12:20 -0300
Date:   Fri, 9 Oct 2020 09:12:20 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     christian.koenig@amd.com, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        chris@chris-wilson.co.uk, airlied@redhat.com,
        akpm@linux-foundation.org, sumit.semwal@linaro.org
Subject: Re: [PATCH 1/4] mm: introduce vma_set_file function v2
Message-ID: <20201009121220.GM5177@ziepe.ca>
References: <20201008112342.9394-1-christian.koenig@amd.com>
 <20201008141211.GG438822@phenom.ffwll.local>
 <8fc28dfa-4bae-bee1-5aca-4e3c6e88b994@gmail.com>
 <20201009073900.GL438822@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201009073900.GL438822@phenom.ffwll.local>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 09, 2020 at 09:39:00AM +0200, Daniel Vetter wrote:
> I just noticed this here in the patch because everyone else does not do
> this. But looking at the mmap_region() code in mmap.c we seem to indeed
> have this problem for the error path:
> 
> unmap_and_free_vma:
> 	vma->vm_file = NULL;
> 	fput(file);
> 
> Note that the success path does things correctly (a bit above):
> 
> 	file = vma->vm_file;
> out:
> 
> So it indeed looks like dma-buf is the only one that does this fully
> correctly. So maybe we should do a follow-up patch to change the
> mmap_region exit code to pick up whatever vma->vm_file was set instead,
> and fput that?

Given that this new vma_set_file() should be the only way to
manipulate vm_file from the mmap op, I think this reflects a bug in
mm/mmap.c.. Should be:

unmap_and_free_vma:
        fput(vma->vm_file);
        vma->vm_file = NULL;

Then everything works the way you'd expect without tricky error
handling

Jason
