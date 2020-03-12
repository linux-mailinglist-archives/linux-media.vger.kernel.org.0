Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A89F61835E6
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2020 17:13:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727001AbgCLQN2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Mar 2020 12:13:28 -0400
Received: from ale.deltatee.com ([207.54.116.67]:43386 "EHLO ale.deltatee.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726385AbgCLQN1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Mar 2020 12:13:27 -0400
Received: from s0106ac1f6bb1ecac.cg.shawcable.net ([70.73.163.230] helo=[192.168.11.155])
        by ale.deltatee.com with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <logang@deltatee.com>)
        id 1jCQSb-0001tv-Kl; Thu, 12 Mar 2020 10:13:26 -0600
To:     Jason Gunthorpe <jgg@ziepe.ca>,
        Christoph Hellwig <hch@infradead.org>
Cc:     =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        David1.Zhou@amd.com, daniel@ffwll.ch,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
References: <20200311135158.3310-1-christian.koenig@amd.com>
 <20200311135158.3310-2-christian.koenig@amd.com>
 <20200311152838.GA24280@infradead.org>
 <f2b46f49-a8d0-9d43-3120-e1ed36fc3a80@gmail.com>
 <20200312101943.GA14618@infradead.org>
 <b5db44eb-1dde-1671-feb0-9e47d120f172@amd.com>
 <20200312104729.GA26031@infradead.org> <20200312141928.GK31668@ziepe.ca>
From:   Logan Gunthorpe <logang@deltatee.com>
Message-ID: <654680ab-5e52-899e-963f-1a511615092a@deltatee.com>
Date:   Thu, 12 Mar 2020 10:13:23 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200312141928.GK31668@ziepe.ca>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 70.73.163.230
X-SA-Exim-Rcpt-To: intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org, daniel@ffwll.ch, David1.Zhou@amd.com, christian.koenig@amd.com, hch@infradead.org, jgg@ziepe.ca
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on ale.deltatee.com
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=5.0 tests=ALL_TRUSTED,BAYES_00,
        GREYLIST_ISWHITE autolearn=ham autolearn_force=no version=3.4.2
Subject: Re: [PATCH 1/6] lib/scatterlist: add sg_set_dma_addr() function
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 2020-03-12 8:19 a.m., Jason Gunthorpe wrote:
> On Thu, Mar 12, 2020 at 03:47:29AM -0700, Christoph Hellwig wrote:
>> On Thu, Mar 12, 2020 at 11:31:35AM +0100, Christian König wrote:
>>> But how should we then deal with all the existing interfaces which already
>>> take a scatterlist/sg_table ?
>>>
>>> The whole DMA-buf design and a lot of drivers are build around
>>> scatterlist/sg_table and to me that actually makes quite a lot of sense.
>>>
>>
>> Replace them with a saner interface that doesn't take a scatterlist.
>> At very least for new functionality like peer to peer DMA, but
>> especially this code would also benefit from a general move away
>> from the scatterlist.
> 
> If dma buf can do P2P I'd like to see support for consuming a dmabuf
> in RDMA. Looking at how.. there is an existing sgl based path starting
> from get_user_pages through dma map to the drivers. (ib_umem)
> 
> I can replace the driver part with something else (dma_sg), but not
> until we get a way to DMA map pages directly into that something
> else..
> 
> The non-page scatterlist is also a big concern for RDMA as we have
> drivers that want the page list, so even if we did as this series
> contemplates I'd have still have to split the drivers and create the
> notion of a dma-only SGL.
> 
>>> I mean we could come up with a new structure for this, but to me that just
>>> looks like reinventing the wheel. Especially since drivers need to be able
>>> to handle both I/O to system memory and I/O to PCIe BARs.
>>
>> The structure for holding the struct page side of the scatterlist is
>> called struct bio_vec, so far mostly used by the block and networking
>> code.
> 
> I haven't used bio_vecs before, do they support chaining like SGL so
> they can be very big? RDMA dma maps gigabytes of memory

bio_vec's themselves don't support chaining... In the block layer they
are used in a struct bio which handles chaining, splitting and other
features. Each bio, though, has a limit of 256 segments to avoid higher
order allocations. Depending on your use case, you could reuse bios or
write your own container to chain bio_vecs.

>> The structure for holding dma addresses doesn't really exist
>> in a generic form, but would be an array of these structures:
>>
>> struct dma_sg {
>> 	dma_addr_t	addr;
>> 	u32		len;
>> };


> Yes, we easily have ranges of >1GB. So I would certainly say u64 for the len here.

I'd probably avoid the u64 here and leave space for some flags or
something. If you have >1GB to map you can always just have mulitple
segments. With 4GB per segment and 256 segments per page, a page of DMA
sgs can easily map 1TB of memory in a single call and with chaining or
larger allocations you can extend that further, if needed.

Logan

