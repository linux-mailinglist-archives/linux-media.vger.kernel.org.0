Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F3C4307A07
	for <lists+linux-media@lfdr.de>; Thu, 28 Jan 2021 16:48:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231649AbhA1Ppv convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 28 Jan 2021 10:45:51 -0500
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151]:24698 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231631AbhA1Ppu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jan 2021 10:45:50 -0500
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-12-etlw7F1KPkS310PW0vAHjQ-1; Thu, 28 Jan 2021 15:41:31 +0000
X-MC-Unique: etlw7F1KPkS310PW0vAHjQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Thu, 28 Jan 2021 15:41:31 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000;
 Thu, 28 Jan 2021 15:41:31 +0000
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Christoph Hellwig' <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        "Tomasz Figa" <tfiga@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        "Sergey Senozhatsky" <senozhatsky@google.com>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>
CC:     Robin Murphy <robin.murphy@arm.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: RE: [PATCH 2/6] dma-mapping: add a dma_mmap_pages helper
Thread-Topic: [PATCH 2/6] dma-mapping: add a dma_mmap_pages helper
Thread-Index: AQHW9YdDx2Jomxp/n0KiElYHhtkl1qo9KjnA
Date:   Thu, 28 Jan 2021 15:41:31 +0000
Message-ID: <792682fa4a97411a8248abeec29b78ee@AcuMS.aculab.com>
References: <20210128145837.2250561-1-hch@lst.de>
 <20210128145837.2250561-3-hch@lst.de>
In-Reply-To: <20210128145837.2250561-3-hch@lst.de>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Christoph Hellwig
> Sent: 28 January 2021 14:59
> 
> Add a helper to map memory allocated using dma_alloc_pages into
> a user address space, similar to the dma_alloc_attrs function for
> coherent allocations.
> 
...
> +::
> +
> +	int
> +	dma_mmap_pages(struct device *dev, struct vm_area_struct *vma,
> +		       size_t size, struct page *page)
> +
> +Map an allocation returned from dma_alloc_pages() into a user address space.
> +dev and size must be the same as those passed into dma_alloc_pages().
> +page must be the pointer returned by dma_alloc_pages().

To be useful this needs to specify the offset into the user address area.
(ie the offset in the mmap() buffer.)

For example we have an fpga based PCIe card that converts internal
addresses that refer to one of 512 16k 'pages' to 64bit PCIe bus
master addresses.
So it (sort of) contains its own iommu.

So we can allocate (aligned) 16k kernel memory buffers with
dma_alloc_coherent() and make them appear contiguous to the
on-board PCIe bus master users.
We then mmap() them into contiguous user addresses.
So both 'ends' see contiguous addresses without requiring
contiguous physical memory or requiring all the memory be 
allocated at the same time.

Clearly in-kernel users have to allow for the 16k boundaries.
But the large structures are accesses from user space.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

