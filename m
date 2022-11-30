Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9252163D37A
	for <lists+linux-media@lfdr.de>; Wed, 30 Nov 2022 11:34:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233439AbiK3KeS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Nov 2022 05:34:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbiK3KeR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Nov 2022 05:34:17 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1914E45A33
        for <linux-media@vger.kernel.org>; Wed, 30 Nov 2022 02:34:16 -0800 (PST)
Received: from [192.168.0.192] (unknown [194.146.248.75])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: andrzej.p)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id EA0776602B30;
        Wed, 30 Nov 2022 10:34:13 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1669804454;
        bh=2hFC5RSF5GsbSet1B9Ixu/bnkB8s7uP8bwzEtBcEJrY=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=Id34rgdvjDhgBWdQE7jhsxbfP/LCKwvxTPzn4V0EQty5zXc9itZt3bPGCYp+AYK2N
         jSS9Wj5PvnnF8Fr85a2wqrU+b/6CTeslvgEAmPSAa+R3EhWlEJZL/or5fSrjoDyrh+
         62NQCFtcthEuOGAICIfjUVBI1nBNwmEfK8yhCuRvqr4yVjJ3o/B2qi/ox1JbsKy0k+
         i8OSd3mf/bwLQ6lm/TSZFfHS+VP51SMNsuxMvG6N19uJHRxbyo19NgV9zBep6AJShg
         kfpX5zGOSh3RVG2lkY/8P/JprGLKDj5jWJDZugLyUyX+esor8u6V4wraOdznn4GY54
         tU19Du/b47rBw==
Message-ID: <d9106e1d-c03d-e792-6e7a-1fd4c9c47872@collabora.com>
Date:   Wed, 30 Nov 2022 11:34:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Correct way to use vb2_dma_sg via USB?
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Florian Echtler <floe@butterbrot.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Christoph Hellwig <hch@lst.de>
References: <c8e912fd-fe0e-8066-6357-e945a51afec2@butterbrot.org>
 <01c9cd34-2499-79a2-7142-7269a9ff7711@butterbrot.org>
 <47d4a419-a5fb-1361-93e2-c039625e94f9@butterbrot.org>
 <c4e6c1ad-0551-951d-c469-407e07d18b5b@xs4all.nl>
Content-Language: en-US
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <c4e6c1ad-0551-951d-c469-407e07d18b5b@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Florian,

W dniu 29.11.2022 o 17:28, Hans Verkuil pisze:
> On 29/11/2022 16:48, Florian Echtler wrote:
>> Following up on [PATCH 1/7] media: videobuf-dma-contig: use dma_mmap_coherent:
>>
>> If the videobuf framework is going to be replaced anyway, would it even make sense to try and fix this bug in the (admittedly very specific) sur40 driver?
> 
> videobuf is the old predecessor of the videobuf2 framework. The sur40 driver
> uses vb2 (as it should), and vb2 is here to stay.
> 
> The old videobuf framework is on the way out, but that's unrelated to your driver.
> 
> I'm afraid I'm not a usb expert, so I can't help with this.
> 
> Regards,
> 
> 	Hans
> 
>>
>> If the answer should be yes, then I'd still need a hint about how to make vb2_dma_sg work with usb_sg_init...
>>
>> Best, Florian
>>
>> On 14.11.22 15:32, Florian Echtler wrote:
>>> Sorry to nag again, but is there anyone around who might be able to give me hint? Have not been able to find any conclusive documentation on this.
>>>
>>> Best, Florian
>>>
>>> On 09.11.22 11:09, Florian Echtler wrote:
>>>> Hello everyone,
>>>>
>>>> while trying to fix the regression in sur40.ko mentioned earlier, I noticed that apparently some other bits of the DMA pipeline have changed as well in the meantime.
>>>>
>>>> The code bit in question in sur40.c currently looks as follows:
>>>>
>>>>       sgt = vb2_dma_sg_plane_desc(&new_buf->vb.vb2_buf, 0);

I can't give you a fish, but maybe I can point to where the fishing rod is.

Based on the description (nents == 0) I'd _assume_ that the problem is not at
the videobuf2-usb intersection but rather in a way videobuf2 is/should be used.
This is only an _assumption_, though.

The above call ends up in vb2_dma_sg_cookie(). The "cookie" is buf->dma_sgt,
which, according to the comment in struct vb2_dma_sg_buf definition, will point
to eiter sg_table (vb2_dma_sg_buf's member) or dma_buf sglist.

You need to know which memory model you use: mmap, userptr or dmabuf.

The reason why nents is (still?) zero might be that dma_map_sgtable() has never
been called. Or __dma_map_sg_attrs() in dma_map_sgtable() returns < 0, or 0.
While at it, sgt->orig_nents is actually used in __dma_map_sg_attrs()
invocation. Inside __dma_map_sg_attrs() a zero is returned if !dev->dma_mask.
Otherwise a result of either dma_direct_map_sg() or ops->map_sg() is returned.

Maybe that helps you debug the issue.

Regards,

Andrzej

>>>>
>>>>       result = usb_sg_init(&sgr, sur40->usbdev,
>>>>           usb_rcvbulkpipe(sur40->usbdev, VIDEO_ENDPOINT), 0,
>>>>           sgt->sgl, sgt->nents, sur40->pix_fmt.sizeimage, GFP_KERNEL);
>>>>
>>>> However, when I put in some debug output, I noticed that sgt->nents is zero. Shouldn't that be initialized by vb2_dma_sg_plane_desc?
>>>>
>>>> I tried to manually set it to 1 and got some partially-filled buffers back, so this seems the right way to go, but I couldn't find any other driver/example that uses this combination. Any hints
>>>> very welcome.
>>>>
>>>> Best, Florian
>>>
>>
> 

