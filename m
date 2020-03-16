Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1890186B27
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 13:38:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731305AbgCPMiD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 08:38:03 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:40066 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731124AbgCPMiC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 08:38:02 -0400
Received: by mail-qk1-f196.google.com with SMTP id j2so12894395qkl.7
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2020 05:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=MPn5IAw3djWwAyz1kz+XKbBrYIDHFtPILHod+O3PgbQ=;
        b=aIKbt6gvuiAhWyACI49w9p3qYDWetIUw69TZkvSfFYqabNj45UFmhTmKNRHgQnTnkR
         IFxzsGzim4MNiBCWvgYX5FoIWiPm5WgtqdBMX5MADHe3jnAChBh32LnebALzQLpMO2rf
         IqC3WtBKRzD/hlzJqzBb2M95um5CgJ+SMXQIw12UioE99Z5jF48BLiklGfqxAuO4/QHS
         n1I3tMGpkalsddB6Z2jDzcO4NARtswgfs7Hqyl84SqJh0mNZl7IGKTzb6ibaxlVP1s5v
         Yo55SsyhAfHLBuy9n9GKk/R0w7Nt356odOOdO0QYnIMNN6fUAO6Hm3WSCH05dpGbNojS
         7Upg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=MPn5IAw3djWwAyz1kz+XKbBrYIDHFtPILHod+O3PgbQ=;
        b=qA2W6GhGS8EgJ+KEKs8dGbPCF67DDJChGcbCAZ6Ocim9mavTNZxxYxIiD2LGNwrVRT
         OTPV00zUaS7toevcprVKtddsFsPT7zdRkZj2/wGypXlmu+9yuWStIqO8m+cJ8WbcFmly
         blWPvtkKLCTuDpn8ODQRkOH45B9Ct/SH6h1OrHXmb/1FmtEZaBLf2LFVNvTEOXsRsBUn
         rv416Jhcq2hDQJygYWzqsblaIqg3GD36KmY9NezEImz2qC5FdVV4bXiQkTJ/nFAw76J+
         5NOVaeNlZrzZKudWWrnkc10ScmvBpR4QWNIVF4ukVdFcJG761DsibibYHK2ftXFVOaXD
         ssNA==
X-Gm-Message-State: ANhLgQ2Lq1k7QtxMkWZ3lANDkTguokDyt5GHzQLOlv1rnWt7lTfjr2sx
        hLjQioV1DagmIBQsyRWGMtorHVJ5BGCYww==
X-Google-Smtp-Source: ADFU+vsR/lHlA/aPYgy1rbDsRY5qjupHbAxemY9eG19DwFYbj9qOlM9R13lB9zyGeNbrRAqnDTSwxw==
X-Received: by 2002:a37:b886:: with SMTP id i128mr26473316qkf.410.1584362280987;
        Mon, 16 Mar 2020 05:38:00 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.57.212])
        by smtp.gmail.com with ESMTPSA id r15sm18535564qtr.40.2020.03.16.05.38.00
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Mar 2020 05:38:00 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1jDp0J-0003bq-Mn; Mon, 16 Mar 2020 09:37:59 -0300
Date:   Mon, 16 Mar 2020 09:37:59 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        David1.Zhou@amd.com, daniel@ffwll.ch,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        Logan Gunthorpe <logang@deltatee.com>
Subject: Re: [PATCH 1/6] lib/scatterlist: add sg_set_dma_addr() function
Message-ID: <20200316123759.GC20941@ziepe.ca>
References: <f2b46f49-a8d0-9d43-3120-e1ed36fc3a80@gmail.com>
 <20200312101943.GA14618@infradead.org>
 <b5db44eb-1dde-1671-feb0-9e47d120f172@amd.com>
 <20200312104729.GA26031@infradead.org>
 <20200312141928.GK31668@ziepe.ca>
 <20200313112139.GA4913@infradead.org>
 <20200313121742.GZ31668@ziepe.ca>
 <20200316085642.GC1831@infradead.org>
 <eb567569-426a-0845-b443-a20155897705@amd.com>
 <20200316095213.GA29212@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200316095213.GA29212@infradead.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Mar 16, 2020 at 02:52:13AM -0700, Christoph Hellwig wrote:
> On Mon, Mar 16, 2020 at 10:41:42AM +0100, Christian König wrote:
> > Well I would prefer if the drivers can somehow express their requirements
> > and get IOVA structures already in the form they need.
> > 
> > Converting the IOVA data from one form to another is sometimes quite costly.
> > Especially when it is only temporarily needed.
> 
> We basically have two ways to generate the IOVA:
> 
>   - a linear translation for the direct mapping case or some dumb IOMMU
>     drivers - in that case case there is a 1:1 mapping between input
>     segments and output segments in DMA mapping
>   - a non-trivial IOMMU where all aligned segments are merged into
>     a single IOVA range
> 
> So I don't really see how the dma layer could help much with any
> limitation beyond existing max size and dma boundary ones.

Christian are you thinking of something like the controllable
address&flags scheme in hmm_range_fault() so that the dma_map process
can write DMA address pages directly to some HW formatted structure?

Jason
