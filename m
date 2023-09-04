Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DB987911A0
	for <lists+linux-media@lfdr.de>; Mon,  4 Sep 2023 08:50:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240421AbjIDGul (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Sep 2023 02:50:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbjIDGui (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Sep 2023 02:50:38 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07CC2102
        for <linux-media@vger.kernel.org>; Sun,  3 Sep 2023 23:50:33 -0700 (PDT)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 13620AF2;
        Mon,  4 Sep 2023 08:49:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1693810146;
        bh=FNa8a/QIGxIvSKxq3LQtqVg9G+lec4G9WTiv7rz+2Ks=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=Z3F8liv6q758CeSl7Pmc3XwEuDPb5kKwPM7S9dZ+qtnSho9b3l1FPtlIl46a5/Q0h
         qDXodEz1hTER3TxlXQA3uhfnAxCRCPI4Vg/v6tsIFLf/2UM0TbGoHzqQP1h4lvuC77
         PV3iFWe2yi+6TjzAkURyMZ9mRV1EnfQt9n3AJCCE=
Message-ID: <29cea943-3b2d-983d-cd32-a433d033270c@ideasonboard.com>
Date:   Mon, 4 Sep 2023 09:50:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] media: v4l2-subdev: Document that routing support depends
 on streams
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20230818155518.440-1-laurent.pinchart@ideasonboard.com>
 <ZN+Z4aYPNp+ymIw6@valkosipuli.retiisi.eu>
 <20230820225604.GB10135@pendragon.ideasonboard.com>
 <ZPMmLDvCuibZNFkZ@valkosipuli.retiisi.eu>
 <8906817c-b6a8-ec1d-3b46-17b6d2c512a1@ideasonboard.com>
 <ZPV6mQjbzJWN5Yef@valkosipuli.retiisi.eu>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <ZPV6mQjbzJWN5Yef@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 04/09/2023 09:35, Sakari Ailus wrote:
> On Mon, Sep 04, 2023 at 08:33:37AM +0300, Tomi Valkeinen wrote:
>> On 02/09/2023 15:10, Sakari Ailus wrote:
>>> Hi Laurent,
>>>
>>> On Mon, Aug 21, 2023 at 01:56:04AM +0300, Laurent Pinchart wrote:
>>>> Hi Sakari,
>>>>
>>>> On Fri, Aug 18, 2023 at 04:18:41PM +0000, Sakari Ailus wrote:
>>>>> On Fri, Aug 18, 2023 at 06:55:18PM +0300, Laurent Pinchart wrote:
>>>>>> Routing support, through the subdev .set_routing() operation, requires
>>>>>> the subdev to support streams. This is however not clearly documented
>>>>>> anywhere. Fix it by expanding the operation's documentation to indicate
>>>>>> that subdevs must set the V4L2_SUBDEV_FL_STREAMS flag.
>>>>>>
>>>>>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>>>>> ---
>>>>>>    include/media/v4l2-subdev.h | 5 +++--
>>>>>>    1 file changed, 3 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
>>>>>> index b325df0d54d6..0b04ed1994b6 100644
>>>>>> --- a/include/media/v4l2-subdev.h
>>>>>> +++ b/include/media/v4l2-subdev.h
>>>>>> @@ -822,8 +822,9 @@ struct v4l2_subdev_state {
>>>>>>     *		     operation shall fail if the pad index it has been called on
>>>>>>     *		     is not valid or in case of unrecoverable failures.
>>>>>>     *
>>>>>> - * @set_routing: enable or disable data connection routes described in the
>>>>>> - *		 subdevice routing table.
>>>>>> + * @set_routing: Enable or disable data connection routes described in the
>>>>>> + *		 subdevice routing table. Subdevs that implement this operation
>>>>>> + *		 must set the V4L2_SUBDEV_FL_STREAMS flag.
>>>>>
>>>>> Could we set the flag in the core when this op exists for a sub-device?
>>>>
>>>> That won't work in all cases, as a driver could expose immutable routes
>>>> by creating them in the .init_cfg() function, without implementing
>>>> .set_routing().
>>>>
>>>> Another option would be to check if the drivers has created routes after
>>>> the .init_cfg() called (indirectly) from v4l2_subdev_init_finalize(). It
>>>> may be a bit fragile though.
>>>
>>> If you have either, then the sub-device does support streams. As otherwise,
>>> there are no streams exposed to the user space. Right?
>>
>> We need to know the existence of V4L2_SUBDEV_FL_STREAMS flag before calling
>> init_cfg, in __v4l2_subdev_state_alloc.
> 
> Good point. Still, it'd be great to get rid of such flags. They are
> incorrectly set in so many places. :-(

Hmm, well, if we want, we could return an error at the end of 
__v4l2_subdev_init_finalize, if V4L2_SUBDEV_FL_STREAMS is set, but there 
is no .set_routing and .init_cfg did not set up routing, OR if 
V4L2_SUBDEV_FL_STREAMS is not set, but .set_routing exists. We could 
also check for V4L2_SUBDEV_FL_STREAMS in v4l2_subdev_set_routing, and 
return an error if it's not set.

I think if a subdev erroneously does not set V4L2_SUBDEV_FL_STREAMS, the 
driver won't get very far. So it's not an issue that can go hidden for 
very long.

  Tomi

