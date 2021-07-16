Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 894893CB9E1
	for <lists+linux-media@lfdr.de>; Fri, 16 Jul 2021 17:33:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240888AbhGPPf6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Jul 2021 11:35:58 -0400
Received: from foss.arm.com ([217.140.110.172]:40190 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240845AbhGPPfz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Jul 2021 11:35:55 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 74B81D6E;
        Fri, 16 Jul 2021 08:32:59 -0700 (PDT)
Received: from [10.57.36.240] (unknown [10.57.36.240])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A607E3F774;
        Fri, 16 Jul 2021 08:32:56 -0700 (PDT)
Subject: Re: [PATCH v4 0/3] Apple M1 DART IOMMU driver
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Sven Peter <sven@svenpeter.dev>, Will Deacon <will@kernel.org>,
        Joerg Roedel <joro@8bytes.org>,
        Arnd Bergmann <arnd@kernel.org>, devicetree@vger.kernel.org,
        Hector Martin <marcan@marcan.st>, linux-kernel@vger.kernel.org,
        Marc Zyngier <maz@kernel.org>,
        Mohamed Mediouni <mohamed.mediouni@caramail.com>,
        Stan Skowronek <stan@corellium.com>,
        linux-arm-kernel@lists.infradead.org,
        Mark Kettenis <mark.kettenis@xs4all.nl>,
        iommu@lists.linux-foundation.org, Alexander Graf <graf@amazon.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Rob Herring <robh+dt@kernel.org>, r.czerwinski@pengutronix.de,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
References: <20210627143405.77298-1-sven@svenpeter.dev>
 <7261df01-34a9-4e53-37cd-ae1aa15b1fb4@arm.com>
 <YPEmA0rdXHiGtHSx@infradead.org>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <0d20bd6b-d0a1-019c-6398-b12f83f4fdf7@arm.com>
Date:   Fri, 16 Jul 2021 16:32:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YPEmA0rdXHiGtHSx@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2021-07-16 07:24, Christoph Hellwig wrote:
> On Wed, Jul 14, 2021 at 07:19:50PM +0100, Robin Murphy wrote:
>> Even at the DMA API level you could hide *some* of it (at the cost of
>> effectively only having 1/4 of the usable address space), but there are
>> still cases like where v4l2 has a hard requirement that a page-aligned
>> scatterlist can be mapped into a contiguous region of DMA addresses.
> 
> Where does v4l2 make that broken assumption?  Plenty of dma mapping
> implementations including dma-direct do not support that.

See vb2_dc_get_contiguous_size() and its callers. I still remember 
spending an entire work day on writing one email at the culmination of 
this discussion:

https://lore.kernel.org/linux-iommu/56409B6D.5090903@arm.com/

809eac54cdd6 was framed as an efficiency improvement because it 
technically was one (and something I had wanted to implement anyway), 
but it was also very much to save myself from any further email debates 
or customer calls about "regressing" code ported from 32-bit platforms...

Robin.
