Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 060407910F1
	for <lists+linux-media@lfdr.de>; Mon,  4 Sep 2023 07:33:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241009AbjIDFdq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Sep 2023 01:33:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233541AbjIDFdp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Sep 2023 01:33:45 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4296F9
        for <linux-media@vger.kernel.org>; Sun,  3 Sep 2023 22:33:42 -0700 (PDT)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E881E497;
        Mon,  4 Sep 2023 07:32:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1693805535;
        bh=DN5TjY7jLd/+K8gkbI18+34JBvyDKet/cmH+AZHj+as=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=M0ciasrQlbsia1jG2vWcmWz08AyCv0k0G5dsOCkDiDOKwGN7C5FUNGIrCXC1GP0Hs
         Raocn8KaLBcAu9TAoRkYDZXhKglCYgYHyXCPqAWIG6MOP78qLgkgOzryYRBC2hQ4qU
         V3zuGn2bl9FkxZcuE4kIRGvuqc1jNC8g8IUf5Aj8=
Message-ID: <8906817c-b6a8-ec1d-3b46-17b6d2c512a1@ideasonboard.com>
Date:   Mon, 4 Sep 2023 08:33:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] media: v4l2-subdev: Document that routing support depends
 on streams
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20230818155518.440-1-laurent.pinchart@ideasonboard.com>
 <ZN+Z4aYPNp+ymIw6@valkosipuli.retiisi.eu>
 <20230820225604.GB10135@pendragon.ideasonboard.com>
 <ZPMmLDvCuibZNFkZ@valkosipuli.retiisi.eu>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <ZPMmLDvCuibZNFkZ@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 02/09/2023 15:10, Sakari Ailus wrote:
> Hi Laurent,
> 
> On Mon, Aug 21, 2023 at 01:56:04AM +0300, Laurent Pinchart wrote:
>> Hi Sakari,
>>
>> On Fri, Aug 18, 2023 at 04:18:41PM +0000, Sakari Ailus wrote:
>>> On Fri, Aug 18, 2023 at 06:55:18PM +0300, Laurent Pinchart wrote:
>>>> Routing support, through the subdev .set_routing() operation, requires
>>>> the subdev to support streams. This is however not clearly documented
>>>> anywhere. Fix it by expanding the operation's documentation to indicate
>>>> that subdevs must set the V4L2_SUBDEV_FL_STREAMS flag.
>>>>
>>>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>>> ---
>>>>   include/media/v4l2-subdev.h | 5 +++--
>>>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
>>>> index b325df0d54d6..0b04ed1994b6 100644
>>>> --- a/include/media/v4l2-subdev.h
>>>> +++ b/include/media/v4l2-subdev.h
>>>> @@ -822,8 +822,9 @@ struct v4l2_subdev_state {
>>>>    *		     operation shall fail if the pad index it has been called on
>>>>    *		     is not valid or in case of unrecoverable failures.
>>>>    *
>>>> - * @set_routing: enable or disable data connection routes described in the
>>>> - *		 subdevice routing table.
>>>> + * @set_routing: Enable or disable data connection routes described in the
>>>> + *		 subdevice routing table. Subdevs that implement this operation
>>>> + *		 must set the V4L2_SUBDEV_FL_STREAMS flag.
>>>
>>> Could we set the flag in the core when this op exists for a sub-device?
>>
>> That won't work in all cases, as a driver could expose immutable routes
>> by creating them in the .init_cfg() function, without implementing
>> .set_routing().
>>
>> Another option would be to check if the drivers has created routes after
>> the .init_cfg() called (indirectly) from v4l2_subdev_init_finalize(). It
>> may be a bit fragile though.
> 
> If you have either, then the sub-device does support streams. As otherwise,
> there are no streams exposed to the user space. Right?

We need to know the existence of V4L2_SUBDEV_FL_STREAMS flag before 
calling init_cfg, in __v4l2_subdev_state_alloc.

  Tomi

