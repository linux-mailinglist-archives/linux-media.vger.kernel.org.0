Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A14997A0F0B
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 22:33:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229628AbjINUde (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 16:33:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229516AbjINUde (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 16:33:34 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B2AB22698
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 13:33:29 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 60F1D1FB;
        Thu, 14 Sep 2023 13:34:06 -0700 (PDT)
Received: from [10.57.93.68] (unknown [10.57.93.68])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4370E3F738;
        Thu, 14 Sep 2023 13:33:27 -0700 (PDT)
Message-ID: <dde29b86-1cca-0712-0f0d-25d7e6d3327e@arm.com>
Date:   Thu, 14 Sep 2023 21:33:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 02/13] media: rockchip: rga: extract helper to fill
 descriptors
Content-Language: en-GB
To:     Michael Tretter <m.tretter@pengutronix.de>,
        Jacob Chen <jacob-chen@iotwrt.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Shengyu Qu <wiagn233@outlook.com>,
        Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
        Diederik de Haas <didi.debian@cknow.org>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
References: <20230914-rockchip-rga-multiplanar-v1-0-abfd77260ae3@pengutronix.de>
 <20230914-rockchip-rga-multiplanar-v1-2-abfd77260ae3@pengutronix.de>
 <239e2853-f89f-20da-2492-7f6d33aede63@arm.com>
 <20230914175724.GB1580188@pengutronix.de>
From:   Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20230914175724.GB1580188@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2023-09-14 18:57, Michael Tretter wrote:
> Hi Robin,
> 
> On Thu, 14 Sep 2023 16:06:27 +0100, Robin Murphy wrote:
>> On 2023-09-14 13:40, Michael Tretter wrote:
>>> The IOMMU of the RGA is programmed with a list of DMA descriptors that
>>> contain an 32 bit address per 4k page in the video buffers. The address
>>> in the descriptor points to the start address of the page.
>>>
>>> Introduce 'struct rga_dma_desc' to make the handling of the DMA
>>> descriptors explicit instead of hiding them behind standard types.
>>>
>>> As the descriptors only handle 32 bit addresses, addresses above 4 GB
>>> cannot be addressed. If this is detected, stop filling the descriptor
>>> list and report an error.
>>
>> That sounds unnecessary, since the only DMA addresses the RGA should be
>> seeing are those from a dma_map_sg() call using the RGA device itself, and
>> that would have failed if it was unable to provide a valid DMA address for
>> the device.
>>
>> The existing rga_buf_map() code is so clearly wrong I can't tell whether
>> that mapping is done somewhere out in the core framework or whether the
>> driver's supposed to be doing it for itself.
> 
> The sg_table is filled by dma_map_sgtable in
> drivers/media/common/videobuf2/videobuf2-dma-sg.c.

Ah, great - in that case all you should need to do here is fill out the 
DMA descriptors with the correct DMA address as you are doing. If 
buf->dev is the right thing and you've set your DMA masks correctly then 
you can rely on the DMA addresses being appropriate already, since it's 
vb2-dma-sg's job to get that right (which per another recent thread it 
will do, but could do better...)

> Do you suggest to just drop the check for the addresses or is there something
> fundamentally wrong with filling the descriptor list in the driver? Can you
> explain what exactly is wrong with this code and do you have a pointer how to
> implement this correctly?

The rest of your patch is frankly more correct than what it's replacing, 
you can just drop the redundant upper_32_bits() check :)

Cheers,
Robin.
