Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 180411F69BD
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2020 16:15:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728032AbgFKOPT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Jun 2020 10:15:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727053AbgFKOPT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Jun 2020 10:15:19 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6EC4C08C5C2
        for <linux-media@vger.kernel.org>; Thu, 11 Jun 2020 07:15:18 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id g28so5698102qkl.0
        for <linux-media@vger.kernel.org>; Thu, 11 Jun 2020 07:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KdY4CqOeXBwEiWOcFlqbqG5is4zfH8IsaBHV/GBHIHQ=;
        b=PR0gi9LBQQMt96kk5vRqeFR+V5WYHc55goGq7/IDrxkd9Rh9/YG4b34BFLq0d+yZak
         BzFk4zfLtE+kjSjyF7+exbUyisWbPZy/yiLvO6PtXdNGgJHOY8zf+OZ+iAubr5+Tx4Lg
         D4HeiosK8RaYH70wLLBoyGznPMMuJUn0V+ocWO9N930QQt7fPPBvGVsW8vOLNjXPWLRJ
         HkUS7exwuBnCFIc1OZ028wKpj25WTPUot6ReBMtdHn/iN8mcZwnlTrlzELhcNeGkhWGY
         TFje4r50V7bjdc94j0MAgMsh5GCFD+me2eO4hQx0IUtZreCgJFCWBiuSwLKGsBDoHK5K
         Bujw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KdY4CqOeXBwEiWOcFlqbqG5is4zfH8IsaBHV/GBHIHQ=;
        b=pSFBtf1UGUF2XscWEtVGsP/ROktBJNHyuZlp1aTVDRIobSBTxEVYgXjG8V2lppsw4+
         DzE7tO3rThkKaGCAnBNWhVyVrA7IDR1/yeT5OrPHk3LUZNOuJwRbC6TiqaOd4EvHFKBJ
         yevmkrs5NVqlJ3aBQgCFEVhMFntZSecQT4oVW6yfBJ/Ovm0NC7rxx4XVCNce/ZOv3gpG
         y2r1MHg3L0BZygOFklvLgnHNZjc+GXG2exzaO3aZRj86Su9WKyl7lKBZySmimsLKWgZG
         R2UWXolkEyGox1NWtnDnsPsbS2iEtmzF4zu4aTZ5Qhqzsvgam59jHY7TGg9J4olGDbrj
         Lt1w==
X-Gm-Message-State: AOAM531VWbJJuk+oajBAn1168fX0i5+b0VD8QZGYPSOXKe8DWZtO4r+R
        AxLN5YRsrv6beH7ueoRsPO1WYQ==
X-Google-Smtp-Source: ABdhPJwayNj1HFNzuKaP5QQLXWWEv6Z+gHXsBE1qPL3LYHDQquNuTclWXHUZlWr93wqBBawpSND6wg==
X-Received: by 2002:ae9:efc2:: with SMTP id d185mr8655279qkg.177.1591884917518;
        Thu, 11 Jun 2020 07:15:17 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id d16sm2634050qte.49.2020.06.11.07.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2020 07:15:16 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.93)
        (envelope-from <jgg@ziepe.ca>)
        id 1jjNz9-005wvW-Ge; Thu, 11 Jun 2020 11:15:15 -0300
Date:   Thu, 11 Jun 2020 11:15:15 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Thomas =?utf-8?B?SGVsbHN0csO2bSAoSW50ZWwp?= 
        <thomas_os@shipmail.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        linux-rdma@vger.kernel.org,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        LKML <linux-kernel@vger.kernel.org>,
        amd-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        Thomas Hellstrom <thomas.hellstrom@intel.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        linux-media@vger.kernel.org,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Mika Kuoppala <mika.kuoppala@intel.com>
Subject: Re: [Linaro-mm-sig] [PATCH 04/18] dma-fence: prime lockdep
 annotations
Message-ID: <20200611141515.GW6578@ziepe.ca>
References: <20200604081224.863494-1-daniel.vetter@ffwll.ch>
 <20200604081224.863494-5-daniel.vetter@ffwll.ch>
 <b11c2140-1b9c-9013-d9bb-9eb2c1906710@shipmail.org>
 <20200611083430.GD20149@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200611083430.GD20149@phenom.ffwll.local>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 11, 2020 at 10:34:30AM +0200, Daniel Vetter wrote:
> > I still have my doubts about allowing fence waiting from within shrinkers.
> > IMO ideally they should use a trywait approach, in order to allow memory
> > allocation during command submission for drivers that
> > publish fences before command submission. (Since early reservation object
> > release requires that).
> 
> Yeah it is a bit annoying, e.g. for drm/scheduler I think we'll end up
> with a mempool to make sure it can handle it's allocations.
> 
> > But since drivers are already waiting from within shrinkers and I take your
> > word for HMM requiring this,
> 
> Yeah the big trouble is HMM and mmu notifiers. That's the really awkward
> one, the shrinker one is a lot less established.

I really question if HW that needs something like DMA fence should
even be using mmu notifiers - the best use is HW that can fence the
DMA directly without having to get involved with some command stream
processing.

Or at the very least it should not be a generic DMA fence but a
narrowed completion tied only into the same GPU driver's command
completion processing which should be able to progress without
blocking.

The intent of notifiers was never to endlessly block while vast
amounts of SW does work.

Going around and switching everything in a GPU to GFP_ATOMIC seems
like bad idea.

> I've pinged a bunch of armsoc gpu driver people and ask them how much this
> hurts, so that we have a clear answer. On x86 I don't think we have much
> of a choice on this, with userptr in amd and i915 and hmm work in nouveau
> (but nouveau I think doesn't use dma_fence in there). 

Right, nor will RDMA ODP. 

Jason
