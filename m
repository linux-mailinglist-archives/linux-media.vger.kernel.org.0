Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED82E2A65AA
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 15:00:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729990AbgKDOA1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 09:00:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726777AbgKDOA0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Nov 2020 09:00:26 -0500
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AC70C0613D3
        for <linux-media@vger.kernel.org>; Wed,  4 Nov 2020 06:00:26 -0800 (PST)
Received: by mail-qk1-x742.google.com with SMTP id s14so19260309qkg.11
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2020 06:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=J6Nw3097qL1FGBO59AefdNEIbSIDtL/HHl1l69CFDp8=;
        b=Wan5zLNCc03uOg3crmJFeRaNbOEA+qwrbKwCY9LDkg1fZnFvzGEBwk4V+VLFOn5oKx
         tmcyGIKCw4+CD/juWp2ijPQPLgAyQG0AhFaLumt8mFw7D817cQkKUY2w7oYalFQSRaiQ
         Vb/ptf8IpP3WfnK3UuZPUxBAXkXY6PqsAqGNVYoZolg0yUEgsR1Di4PcNN7C/aUr2Q/R
         O0ZcNPr6tO0Ab4yQ9aVnuDw44g3gsPath6hDrZSj4xe9Loas/o/6/OXlQjyqG2MFoi+n
         R3zy4MV988W7+StxSAydki/+D4rJ/lZx0EB7vwQbsli0N+fpB6onleBpY6HTFL+CpY9E
         jiFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=J6Nw3097qL1FGBO59AefdNEIbSIDtL/HHl1l69CFDp8=;
        b=IQKiA7TyotYGotaZOqqWq+yGUf5Kh4UKXcV5uLlS5aX8T2LRlepddnW12mzontkcRB
         FqqI6EAaLHloxcPBxs0pWAZKqQnEzxmXxlLqCai1FFTuTz5xbU5VWGsAYdrJH5M5j2FZ
         2fcW71W4xIcYDL9GnDeiFIuUTnEmuWZPJqUS/qex0lIaSpsTsynw+IlRWoUHh2X8Jdwq
         WmQvVl6AHDN37/is2iFm8JrQY/8jBfRMM2nu8R9YK9aDrX4UxVzy6zbwVGdIvyH8IUct
         KTHGY99mLgvrL2Bn14eyp/MzHYT22OsWNOOMTJFy6dM9yqSN1JSaG3wa2li1+1JwTq0s
         cSzQ==
X-Gm-Message-State: AOAM5332krAyz+6QBY+CAEhJY+/2s9oRTKV4XfzYlOXI6c2452OYV03P
        GmLo7PoqqvhfkxQhXoPAUwDc7w==
X-Google-Smtp-Source: ABdhPJz06+PUPTCOD5MO6YcYJfu8e1guRGyarj130cNdAlQFDKce0Oko/G5bRBr5wbl0qK0lrF7Apg==
X-Received: by 2002:a37:4ccf:: with SMTP id z198mr26929935qka.348.1604498425743;
        Wed, 04 Nov 2020 06:00:25 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id y3sm131855qto.2.2020.11.04.06.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 06:00:24 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1kaJKp-00GVgS-9E; Wed, 04 Nov 2020 10:00:23 -0400
Date:   Wed, 4 Nov 2020 10:00:23 -0400
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     John Hubbard <jhubbard@nvidia.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        KVM list <kvm@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Pawel Osciak <pawel@osciak.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH v5 05/15] mm/frame-vector: Use FOLL_LONGTERM
Message-ID: <20201104140023.GQ36674@ziepe.ca>
References: <20201030100815.2269-1-daniel.vetter@ffwll.ch>
 <20201030100815.2269-6-daniel.vetter@ffwll.ch>
 <446b2d5b-a1a1-a408-f884-f17a04b72c18@nvidia.com>
 <CAKMK7uGDW2f0oOvwgryCHxQFHyh3Tsk6ENsMGmtZ-EnH57tMSA@mail.gmail.com>
 <1f7cf690-35e2-c56f-6d3f-94400633edd2@nvidia.com>
 <CAKMK7uFYDSqnNp_xpohzCEidw_iLufNSoX4v55sNZj-nwTckSg@mail.gmail.com>
 <7f29a42a-c408-525d-90b7-ef3c12b5826c@nvidia.com>
 <CAKMK7uEw701AWXNJbRNM8Z+FkyUB5FbWegmSzyWPy9cG4W7OLA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uEw701AWXNJbRNM8Z+FkyUB5FbWegmSzyWPy9cG4W7OLA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Nov 01, 2020 at 11:50:39PM +0100, Daniel Vetter wrote:

> It's not device drivers, but everyone else. At least my understanding
> is that VM_IO | VM_PFNMAP means "even if it happens to be backed by a
> struct page, do not treat it like normal memory". And gup/pup_fast
> happily break that. I tried to chase the history of that test, didn't
> turn up anything I understood much:

VM_IO isn't suppose do thave struct pages, so how can gup_fast return
them?

I thought some magic in the PTE flags excluded this?

Jason
