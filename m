Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1249757747
	for <lists+linux-media@lfdr.de>; Tue, 18 Jul 2023 11:00:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231853AbjGRJAd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jul 2023 05:00:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230373AbjGRJAc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jul 2023 05:00:32 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D01FB5;
        Tue, 18 Jul 2023 02:00:30 -0700 (PDT)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2D534838;
        Tue, 18 Jul 2023 10:59:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1689670774;
        bh=SRa3+hkSmTe9qdN9cZBlxLf7BK3h4HY/8zpZ2kZMqhg=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=fKLFUgJlVCEOcQU2wvvuAy2dHNJm0/gaB7xFvaICHOxopo1XwZK+v6qX6s/IMXzes
         pnIaTCxuMbJYSv0r0Ris63CSmR6nswbSs4s5KN4aFi/iBjt44P4IY1RjiQqnYKmVcF
         JVhrzo9IAHaF6fyP9jmouR0VfwfAfQ1vEuFJXwaY=
Message-ID: <d2472b65-01c2-7420-0293-a72e3f9b69fa@ideasonboard.com>
Date:   Tue, 18 Jul 2023 10:00:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 2/2] usb: gadget: uvc: limit isoc_sg to super speed
 gadgets
Content-Language: en-US
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Michael Grzeschik <mgr@pengutronix.de>,
        linux-usb@vger.kernel.org
Cc:     linux-media@vger.kernel.org, gregkh@linuxfoundation.org,
        balbi@kernel.org, laurent.pinchart@ideasonboard.com,
        kernel@pengutronix.de, stable <stable@kernel.org>
References: <20221125153450.344392-1-m.grzeschik@pengutronix.de>
 <20221125153450.344392-2-m.grzeschik@pengutronix.de>
 <20230124223558.GC7611@pengutronix.de>
 <cab204fc-9efa-379d-1aea-ec462cbcaceb@xs4all.nl>
From:   Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <cab204fc-9efa-379d-1aea-ec462cbcaceb@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Morning Hans

On 18/07/2023 09:46, Hans Verkuil wrote:
> Laurent, Dan,
>
> On 24/01/2023 23:35, Michael Grzeschik wrote:
>> Gentle Ping!
> Can one of you look at this series? I see that Dan was added as UVC Gadget maintainer
> earlier this year, so perhaps Dan can look at this? And also other UVC Gadget patches
> from Michael:
>
> https://patchwork.linuxtv.org/project/linux-media/list/?submitter=545
>
> Patchwork is messy: think several of the patches in that list are either superseded
> or are already merged, but the status was never updated.


Sorry; I'll put some time aside and look at the list this week.


Thanks

Dan

>
> Regards,
>
> 	Hans
>
>> On Fri, Nov 25, 2022 at 04:34:50PM +0100, Michael Grzeschik wrote:
>>> When calling uvc_video_encode_isoc_sg the function is preparing the sg payload
>>> by setting the sglist pointers of the videobuffer for the request. The usb
>>> gadget driver then is parsing the sg list and uses each sg entry to send in one
>>> urb to the host. Because of the unrelated buffer of the uvc header that buffer
>>> has to be send separately in an extra sg entry.
>>>
>>> When it comes to transfers with an limited payload (e.g. the maximum of 3kB for
>>> high-speed) this extra payload handling is not justified. A simple memcpy of
>>> the header and payload is usually faster and does not come with that extra
>>> runtime overhead.
>>>
>>> This patch is changing the uvc_video_encode_isoc_sg encode function only to be
>>> used for super speed gadgets.
>>>
>>> Cc: stable <stable@kernel.org>
>>> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>>>
>>> ---
>>> v1 -> v2: - left the sg assignment in uvc_buffer_sg under the test for use_sg
>>>           - rephrased the commit message
>>>
>>> drivers/usb/gadget/function/uvc_queue.c | 3 +--
>>> drivers/usb/gadget/function/uvc_video.c | 9 +++++++--
>>> 2 files changed, 8 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/usb/gadget/function/uvc_queue.c b/drivers/usb/gadget/function/uvc_queue.c
>>> index 0aa3d7e1f3cc32..0abb1763faf1b6 100644
>>> --- a/drivers/usb/gadget/function/uvc_queue.c
>>> +++ b/drivers/usb/gadget/function/uvc_queue.c
>>> @@ -87,9 +87,8 @@ static int uvc_buffer_prepare(struct vb2_buffer *vb)
>>>      if (queue->use_sg) {
>>>          buf->sgt = vb2_dma_sg_plane_desc(vb, 0);
>>>          buf->sg = buf->sgt->sgl;
>>> -    } else {
>>> -        buf->mem = vb2_plane_vaddr(vb, 0);
>>>      }
>>> +    buf->mem = vb2_plane_vaddr(vb, 0);
>>>      buf->length = vb2_plane_size(vb, 0);
>>>      if (vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
>>>          buf->bytesused = 0;
>>> diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
>>> index dd1c6b2ca7c6f3..b6ea600b011185 100644
>>> --- a/drivers/usb/gadget/function/uvc_video.c
>>> +++ b/drivers/usb/gadget/function/uvc_video.c
>>> @@ -459,6 +459,9 @@ static void uvcg_video_pump(struct work_struct *work)
>>>   */
>>> int uvcg_video_enable(struct uvc_video *video, int enable)
>>> {
>>> +    struct uvc_device *uvc = video->uvc;
>>> +    struct usb_composite_dev *cdev = uvc->func.config->cdev;
>>> +    struct usb_gadget *gadget = cdev->gadget;
>>>      unsigned int i;
>>>      int ret;
>>>
>>> @@ -490,9 +493,11 @@ int uvcg_video_enable(struct uvc_video *video, int enable)
>>>      if (video->max_payload_size) {
>>>          video->encode = uvc_video_encode_bulk;
>>>          video->payload_size = 0;
>>> -    } else
>>> -        video->encode = video->queue.use_sg ?
>>> +    } else {
>>> +        video->encode = (video->queue.use_sg &&
>>> +                 !(gadget->speed <= USB_SPEED_HIGH)) ?
>>>              uvc_video_encode_isoc_sg : uvc_video_encode_isoc;
>>> +    }
>>>
>>>      video->req_int_count = 0;
>>>
>>> -- 
>>> 2.30.2
>>>
