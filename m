Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6122C77F100
	for <lists+linux-media@lfdr.de>; Thu, 17 Aug 2023 09:12:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348409AbjHQHL7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Aug 2023 03:11:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348377AbjHQHLn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Aug 2023 03:11:43 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9685272B
        for <linux-media@vger.kernel.org>; Thu, 17 Aug 2023 00:11:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6FBE463757
        for <linux-media@vger.kernel.org>; Thu, 17 Aug 2023 07:11:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C26F1C433C9;
        Thu, 17 Aug 2023 07:11:38 +0000 (UTC)
Message-ID: <532a4f36-ad81-50fb-24d2-1f31f93cc714@xs4all.nl>
Date:   Thu, 17 Aug 2023 09:11:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] media: videobuf2-core.c: check if all buffers have the
 same number of planes
To:     Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        andrew-ct.chen@mediatek.com, yunfei.dong@mediatek.com,
        matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
        linux-mediatek@lists.infradead.org,
        Wei Chen <harperchen1110@gmail.com>, tiffany.lin@mediatek.com,
        Nicolas Dufresne <nicolas@ndufresne.ca>
References: <e75ff985-2499-9a16-21fe-ee2e81547e6f@xs4all.nl>
 <20230816143432.GA4436@pendragon.ideasonboard.com>
 <ZN0L6SAWlr+KZTVK@valkosipuli.retiisi.eu>
Content-Language: en-US, nl
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <ZN0L6SAWlr+KZTVK@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/08/2023 19:48, Sakari Ailus wrote:
> Hi Hans, Laurent,
> 
> On Wed, Aug 16, 2023 at 05:34:32PM +0300, Laurent Pinchart wrote:
>> Hi Hans,
>>
>> Thank you for the patch.
>>
>> On Wed, Aug 16, 2023 at 02:47:33PM +0200, Hans Verkuil wrote:
>>> Currently if VIDIOC_CREATE_BUFS is called to add new buffers, then the requested
>>> number of planes per buffer might be different from the already allocated buffers.
>>>
>>> However, this does not make a lot of sense and there are no drivers that allow
>>> for variable number of planes in the allocated buffers.
>>>
>>> While it is possible do this today, when such a buffer is queued it will fail
>>> in the buf_prepare() callback where the plane sizes are checked if those are
>>> large enough. If fewer planes were allocated, then the size for the missing
>>> planes are 0 and the check will return -EINVAL.
>>>
>>> But it is much better to do this check in VIDIOC_CREATE_BUFS.
>>
>> I don't think this is a good idea. One important use case for
>> VIDIOC_CREATE_BUFS is to allocate buffers for a different format than
>> the one currently configured for the device, to prepare for a future
>> capture (or output) session with a different configuration. This patch
>> would prevent that.
> 
> I'd prefer to keep this capability in videobuf2, too. Although... one way
> achieve that could be to add a flag (or an integer field) in struct
> vb2_queue to tell vb2 core that the driver wants to do the num_planes
> checks by itself.

Having a flag for this was something I intended to do once we have a
driver that actually supports this feature. I'm not aware of any driver
that needs this today. But I'll make a v2 adding this flag, it is simple
to do and doesn't hurt.

> 
> It'd be also nicer, considering the end result, to configure this when
> setting up the queue, rather than based on the first buffer created. This
> would involve changing a large number of drivers though.
> 

"to configure this": what is "this"? The new flag? Or the number of planes?
And with "setting up the queue" do you mean the queue_setup callback or
when the vb2_queue is initialized?

Regards,

	Hans
