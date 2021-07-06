Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84CC93BDD36
	for <lists+linux-media@lfdr.de>; Tue,  6 Jul 2021 20:33:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231309AbhGFSe3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Jul 2021 14:34:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229954AbhGFSe2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Jul 2021 14:34:28 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 938EEC061574
        for <linux-media@vger.kernel.org>; Tue,  6 Jul 2021 11:31:48 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id 145so6307447pfv.0
        for <linux-media@vger.kernel.org>; Tue, 06 Jul 2021 11:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xS4jmUfoYf+qsHEX1NkazSuwR3nlQAXkZMVvUw/VAUw=;
        b=WvzI34BCNFC58UqM62eaC15I3Yl4gCH/I8Ta5Ki1kdgAdDX/cqsF343tDXX9SeXxjE
         a8pdPzapSJ/sQt5ALbN0TSo27XMUHAhF+ez6o1TqVZ0w34FyFoB2xXLpSFnx+kAoI1Oa
         /2QK4caLLF12JWPBYN7cBaevzABXzTT6p2tWO4RfsWJPrgJzAY9QsaEw4MwwoHGjZjND
         H+aa1hpGfvT+9YIcsPNAoK1a9s92DpckoP2b2Wv7OA4c2l3ABp1equdZgsXeTEcw/jWG
         mVVlxVe1jSXOTMYW+Th87k0OQhmUJk8cdCf+SRPXnXQsphxTzFJuGNNuThCnpUmmJqv3
         6b6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xS4jmUfoYf+qsHEX1NkazSuwR3nlQAXkZMVvUw/VAUw=;
        b=BGxPxh2S0PF5Sl+TZpqpzcuxyDrSsmBa/9uaEwBnJIi2E5W7JRm62gzk4LUxIJP2Ud
         F2ielQpjGq+TGHnd5Yg23jpUaM9WOJbLE4jPVF6piWk622vTwVeNAJs2PiBKcoA6W9Z6
         VKQsUIsH+hQzPYIl3x9Et1flyFhyng3y+h0ajf5KnlfxVim4tpZ3M3XV3WKuOdH+yZR+
         9cdi62mo4R4iYD1Zc0ytuNwwlELroeBfIbJT2YwHBSIQAS4hutDwPSXV9Oi5wDksKWex
         gkgU6atihtp75+tNIGFJVXVHRqkHBJ0uY1hPRvNbgwiXoD66nfJykUQhhVZkRPqf2hjz
         23IA==
X-Gm-Message-State: AOAM531hfNXL/yfX4uO33RsoQ7dEfrzGLAsf+fSafX4eGA6rgeud7ECQ
        et/JAekNvbrYcpv7venDtFxAnA==
X-Google-Smtp-Source: ABdhPJxCLr3QP1MrQQwgN3RYMUf8nARhv0A5jCkgz/6YUMgwNC9ne4TbUPIgRuDm3nikL4Z47miuFA==
X-Received: by 2002:a63:5a59:: with SMTP id k25mr10017534pgm.423.1625596307999;
        Tue, 06 Jul 2021 11:31:47 -0700 (PDT)
Received: from ziepe.ca ([206.223.160.26])
        by smtp.gmail.com with ESMTPSA id n33sm19327390pgm.55.2021.07.06.11.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jul 2021 11:31:47 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1m0prF-004Wdb-Bw; Tue, 06 Jul 2021 15:31:45 -0300
Date:   Tue, 6 Jul 2021 15:31:45 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     Oded Gabbay <oded.gabbay@gmail.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Gal Pressman <galpress@amazon.com>, sleybo@amazon.com,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        linux-rdma <linux-rdma@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Doug Ledford <dledford@redhat.com>,
        Dave Airlie <airlied@gmail.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Leon Romanovsky <leonro@nvidia.com>,
        Christoph Hellwig <hch@lst.de>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>
Subject: Re: [PATCH v4 0/2] Add p2p via dmabuf to habanalabs
Message-ID: <20210706183145.GT4604@ziepe.ca>
References: <20210705130314.11519-1-ogabbay@kernel.org>
 <YOQXBWpo3whVjOyh@phenom.ffwll.local>
 <CAFCwf10_rTYL2Fy6tCRVAUCf4-6_TtcWCv5gEEkGnQ0KxqMUBg@mail.gmail.com>
 <CAKMK7uEAJZUHNLreBB839BZOfnTGNU4rCx-0k55+67Nbxtdx3A@mail.gmail.com>
 <20210706142357.GN4604@ziepe.ca>
 <CAKMK7uELNzwUe+hhVWRg=Pk5Wt_vOOX922H48Kd6dTyO2PeBbg@mail.gmail.com>
 <20210706152542.GP4604@ziepe.ca>
 <CAKMK7uH7Ar6+uAOU_Sj-mf89V9WCru+66CV5bO9h-WAAv7Mgdg@mail.gmail.com>
 <20210706162953.GQ4604@ziepe.ca>
 <CAKMK7uGXUgjyjch57J3UnC7SA3-4g87Ft7tLjj9fFkgyKkKdrg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uGXUgjyjch57J3UnC7SA3-4g87Ft7tLjj9fFkgyKkKdrg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jul 06, 2021 at 07:35:55PM +0200, Daniel Vetter wrote:

> Yup. We dont care about any of the fancy pieces you build on top, nor
> does the compiler need to be the optimizing one. Just something that's
> good enough to drive the hw in some demons to see how it works and all
> that. Generally that's also not that hard to reverse engineer, if
> someone is bored enough, the real fancy stuff tends to be in how you
> optimize the generated code. And make it fit into the higher levels
> properly.

Seems reasonable to me

> And it's not just nvidia, it's pretty much everyone. Like a soc
> company I don't want to know started collaborating with upstream and
> the reverse-engineered mesa team on a kernel driver, seems to work
> pretty well for current hardware. 

What I've seen is that this only works with customer demand. Companies
need to hear from their customers that upstream is what is needed, and
companies cannot properly hear that until they are at least already
partially invested in the upstream process and have the right
customers that are sophisticated enough to care.

Embedded makes everything 10x worse because too many customers just
don't care about upstream, you can hack your way through everything,
and indulge in single generation thinking. Fork the whole kernel for 3
years, EOL, no problem!

It is the enterprise world, particularly with an opinionated company
like RH saying NO stuck in the middle that really seems to drive
things toward upstream.

Yes, vendors can work around Red Hat's No (and NVIDIA GPU is such an
example) but it is incredibly time consuming, expensive and becoming
more and more difficult every year.

The big point is this:

> But also nvidia is never going to sell you that as the officially
> supported thing, unless your ask comes back with enormous amounts of
> sold hardware.

I think this is at the core of Linux's success in the enterprise
world. Big customers who care demanding open source. Any vendor, even
nvidia will want to meet customer demands.

IHMO upstream success is found by motivating the customer to demand
and make it "easy" for the vendor to supply it.

Jason
