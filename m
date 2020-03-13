Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48FA91846A9
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2020 13:17:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726535AbgCMMRp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Mar 2020 08:17:45 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:45027 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726395AbgCMMRp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Mar 2020 08:17:45 -0400
Received: by mail-qt1-f195.google.com with SMTP id h16so7220532qtr.11
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2020 05:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=aqslJJ5bOf4ey2RANXL60FLOBW00NolP+CogM9HtYzU=;
        b=fnLvydTyvgwKngHoJknFmEckFBQX2TR0x0WgLYgJaIP2ICqATNg9WQ9cP/lfj4yVwh
         6mSSjRuG8nN+xIg2fA3Wd7Xt1BuckJTkHy5pwwlzksrBV2ZaY3FQvZpwWhr3ygDLDNAu
         vd67ky4AC/TpUDHBms5GP5WwHKK0QuHePWyU5pAXvMtzJwXELqz+UHhRHgKztLdSw7xT
         z9yD2/kP/N3e9eeVkrTyN4ecuy111HRBS030woDmFrAHJwyhiisQS0w+p64Q+vE4KqFb
         kFZ6v1pjSxCFLj4rKECs4vbLkU3eWHuyBdsVqrNKA3EQmpLAhIwVsZho0dP4f4DWiRMK
         AzKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=aqslJJ5bOf4ey2RANXL60FLOBW00NolP+CogM9HtYzU=;
        b=HQUupqC62ph9tM7zg/u+Bl8d8d5Xh5ZdZfO1iV2fL3CYPi2eJfiZdtFhepRUBBCh3i
         v6ws1RKC388a9hokIdiNQeyofuSEKOSB7KhFejSwMSdDibS4VJ3xupKVmjeDkQPkCEYA
         MjHwxbb2t6r76HSfSEi88UN0MBLTjKoYgyvprNQCqe/4+Gvg6uTb4skH6yDEY6hvuv15
         HeejiIGB5QZEktrRejEPNlTAVfQY/3agi4Xce+iFIm6reaw2iYrc8HzUlMLxyIigkMho
         o8UfjlEXFlJjyxdMKmJfJWvz6JWjbhZai+rWRt4Uqh08JndphrCIZgwaCufDmchbLIO1
         tb0A==
X-Gm-Message-State: ANhLgQ1Hgv2bN8H8Q4TQoTwxY82ByjavnBlkHctVheAT62S8P4XcIXuz
        Jnjab3QtWtQg8FGN4rOycm9LqA==
X-Google-Smtp-Source: ADFU+vvnZ++eeJohQNCGbL8UURJNf+LwktEkIgtg9LmyZVqXbslskSadTwZYDIFrd8k/gWvAv2Asig==
X-Received: by 2002:ac8:3659:: with SMTP id n25mr12061900qtb.254.1584101864517;
        Fri, 13 Mar 2020 05:17:44 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.57.212])
        by smtp.gmail.com with ESMTPSA id e2sm362936qkg.63.2020.03.13.05.17.43
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Mar 2020 05:17:43 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1jCjG2-0001qS-KQ; Fri, 13 Mar 2020 09:17:42 -0300
Date:   Fri, 13 Mar 2020 09:17:42 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        David1.Zhou@amd.com, daniel@ffwll.ch,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        Logan Gunthorpe <logang@deltatee.com>
Subject: Re: [PATCH 1/6] lib/scatterlist: add sg_set_dma_addr() function
Message-ID: <20200313121742.GZ31668@ziepe.ca>
References: <20200311135158.3310-1-christian.koenig@amd.com>
 <20200311135158.3310-2-christian.koenig@amd.com>
 <20200311152838.GA24280@infradead.org>
 <f2b46f49-a8d0-9d43-3120-e1ed36fc3a80@gmail.com>
 <20200312101943.GA14618@infradead.org>
 <b5db44eb-1dde-1671-feb0-9e47d120f172@amd.com>
 <20200312104729.GA26031@infradead.org>
 <20200312141928.GK31668@ziepe.ca>
 <20200313112139.GA4913@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200313112139.GA4913@infradead.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Mar 13, 2020 at 04:21:39AM -0700, Christoph Hellwig wrote:
> On Thu, Mar 12, 2020 at 11:19:28AM -0300, Jason Gunthorpe wrote:
> > The non-page scatterlist is also a big concern for RDMA as we have
> > drivers that want the page list, so even if we did as this series
> > contemplates I'd have still have to split the drivers and create the
> > notion of a dma-only SGL.
> 
> The drivers I looked at want a list of IOVA address, aligned to the
> device "page size".  What other data do drivers want?  Execept for the
> software protocol stack drivers, which of couse need pages for the
> stack futher down.

In principle it is possible to have just an aligned page list -
however the page size is variable, following certain rules, and today
the drivers still determine the correct page size largely on their
own.  

Some progress was made recently to consolidate this, but more is
needed.

If the common code doesn't know the device page size in advance then
today's approach of sending largest possible dma mapped SGLs into the
device driver is best. The driver only has to do splitting.

> > I haven't used bio_vecs before, do they support chaining like SGL so
> > they can be very big? RDMA dma maps gigabytes of memory
> 
> bio_vecs itself don't have the chaining, but the bios build around them
> do.  But each entry can map a huge pile.  If needed we could use the
> same chaining scheme we use for scatterlists for bio_vecs as well, but
> lets see if we really end up needing that.

RDMA surely needs something to generate huge lists of dma mapped
memory. MRs are very big objects

Jason
