Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DCF863C520
	for <lists+linux-media@lfdr.de>; Tue, 29 Nov 2022 17:28:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234465AbiK2Q2x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Nov 2022 11:28:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234009AbiK2Q2w (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Nov 2022 11:28:52 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F2985ADC1
        for <linux-media@vger.kernel.org>; Tue, 29 Nov 2022 08:28:50 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0E8D7B816D4
        for <linux-media@vger.kernel.org>; Tue, 29 Nov 2022 16:28:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD1A4C433D6;
        Tue, 29 Nov 2022 16:28:46 +0000 (UTC)
Message-ID: <c4e6c1ad-0551-951d-c469-407e07d18b5b@xs4all.nl>
Date:   Tue, 29 Nov 2022 17:28:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: Correct way to use vb2_dma_sg via USB?
Content-Language: en-US
To:     Florian Echtler <floe@butterbrot.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Christoph Hellwig <hch@lst.de>
References: <c8e912fd-fe0e-8066-6357-e945a51afec2@butterbrot.org>
 <01c9cd34-2499-79a2-7142-7269a9ff7711@butterbrot.org>
 <47d4a419-a5fb-1361-93e2-c039625e94f9@butterbrot.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <47d4a419-a5fb-1361-93e2-c039625e94f9@butterbrot.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 29/11/2022 16:48, Florian Echtler wrote:
> Following up on [PATCH 1/7] media: videobuf-dma-contig: use dma_mmap_coherent:
> 
> If the videobuf framework is going to be replaced anyway, would it even make sense to try and fix this bug in the (admittedly very specific) sur40 driver?

videobuf is the old predecessor of the videobuf2 framework. The sur40 driver
uses vb2 (as it should), and vb2 is here to stay.

The old videobuf framework is on the way out, but that's unrelated to your driver.

I'm afraid I'm not a usb expert, so I can't help with this.

Regards,

	Hans

> 
> If the answer should be yes, then I'd still need a hint about how to make vb2_dma_sg work with usb_sg_init...
> 
> Best, Florian
> 
> On 14.11.22 15:32, Florian Echtler wrote:
>> Sorry to nag again, but is there anyone around who might be able to give me hint? Have not been able to find any conclusive documentation on this.
>>
>> Best, Florian
>>
>> On 09.11.22 11:09, Florian Echtler wrote:
>>> Hello everyone,
>>>
>>> while trying to fix the regression in sur40.ko mentioned earlier, I noticed that apparently some other bits of the DMA pipeline have changed as well in the meantime.
>>>
>>> The code bit in question in sur40.c currently looks as follows:
>>>
>>>      sgt = vb2_dma_sg_plane_desc(&new_buf->vb.vb2_buf, 0);
>>>
>>>      result = usb_sg_init(&sgr, sur40->usbdev,
>>>          usb_rcvbulkpipe(sur40->usbdev, VIDEO_ENDPOINT), 0,
>>>          sgt->sgl, sgt->nents, sur40->pix_fmt.sizeimage, GFP_KERNEL);
>>>
>>> However, when I put in some debug output, I noticed that sgt->nents is zero. Shouldn't that be initialized by vb2_dma_sg_plane_desc?
>>>
>>> I tried to manually set it to 1 and got some partially-filled buffers back, so this seems the right way to go, but I couldn't find any other driver/example that uses this combination. Any hints
>>> very welcome.
>>>
>>> Best, Florian
>>
> 

