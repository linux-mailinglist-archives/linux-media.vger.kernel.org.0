Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58393690479
	for <lists+linux-media@lfdr.de>; Thu,  9 Feb 2023 11:11:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229940AbjBIKLf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Feb 2023 05:11:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229902AbjBIKLe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Feb 2023 05:11:34 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5592A627AA
        for <linux-media@vger.kernel.org>; Thu,  9 Feb 2023 02:11:26 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 911918DD;
        Thu,  9 Feb 2023 11:11:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675937483;
        bh=8CSol8fu+fNoYMjl7b9w9bneSoHZnNdCgUE1zEbETN4=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=e/I3XgubRKvaQCODXmY36qOnWf3ikassInsi2T5Hrl7W1+WTgrg3f82k8658LFj7G
         G+Pep9akuxjH5zz/B9mu5ccLUuzGIO/Yic8ZQ/34NsXL6a0Cu4WD6XOxWukZMXCboR
         DxB2uAtVe/LzeJqKmkGMkDMJtvt1+UxJJBRcW7WA=
Message-ID: <a8a89876-8868-04c6-104b-6be1b6c628c4@ideasonboard.com>
Date:   Thu, 9 Feb 2023 12:11:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] media: Fix building pdfdocs
To:     Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        Akira Yokosawa <akiyks@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20230208082916.68377-1-tomi.valkeinen@ideasonboard.com>
 <Y+NnRvQ8X04tuurf@pendragon.ideasonboard.com>
 <20230208121750.1b4ac5cd@coco.lan>
Content-Language: en-US
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230208121750.1b4ac5cd@coco.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel, Dave,

Could you pick this fix to drm-next? The offending commit is there, it 
was merged via Laurent's "[GIT PULL FOR v6.3] R-Car DU fixes and 
improvements".

I can also push this to drm-misc-fixes, but the offending commit is not 
there yet.

  Tomi

On 08/02/2023 13:17, Mauro Carvalho Chehab wrote:
> Em Wed, 8 Feb 2023 11:11:34 +0200
> Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:
> 
>> Hi Tomi,
>>
>> Thank you for the patch.
>>
>> On Wed, Feb 08, 2023 at 10:29:16AM +0200, Tomi Valkeinen wrote:
>>> Commit 8d0e3fc61abd ("media: Add 2-10-10-10 RGB formats") added
>>> documatation for a few new RGB formats. For some reason these break the
>>
>> s/documatation/documentation/
>>
>>> pdfdocs build, even if the same style seems to work elsewhere in the
>>> file.
>>>
>>> Remove the trailing empty dash lines, which seems to fix the issue.
>>>
>>> Fixes: 8d0e3fc61abd ("media: Add 2-10-10-10 RGB formats")
>>> Reported-by: Akira Yokosawa <akiyks@gmail.com>
>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>
>> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>>
>>> ---
>>>
>>> Note: the offending patch was merged via drm tree, so we may want to
>>> apply the fix to the drm tree also.
>>
>> Sounds good to me. Mauro, could you ack this patch ?
> 
> Acked-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
>>
>>>   Documentation/userspace-api/media/v4l/pixfmt-rgb.rst | 3 ---
>>>   1 file changed, 3 deletions(-)
>>>
>>> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
>>> index d330aeb4d3eb..ea545ed1aeaa 100644
>>> --- a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
>>> +++ b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
>>> @@ -868,7 +868,6 @@ number of bits for each component.
>>>         - r\ :sub:`4`
>>>         - r\ :sub:`3`
>>>         - r\ :sub:`2`
>>> -      -
>>>       * .. _V4L2-PIX-FMT-RGBA1010102:
>>>   
>>>         - ``V4L2_PIX_FMT_RGBA1010102``
>>> @@ -909,7 +908,6 @@ number of bits for each component.
>>>         - r\ :sub:`4`
>>>         - r\ :sub:`3`
>>>         - r\ :sub:`2`
>>> -      -
>>>       * .. _V4L2-PIX-FMT-ARGB2101010:
>>>   
>>>         - ``V4L2_PIX_FMT_ARGB2101010``
>>> @@ -950,7 +948,6 @@ number of bits for each component.
>>>         - r\ :sub:`6`
>>>         - r\ :sub:`5`
>>>         - r\ :sub:`4`
>>> -      -
>>>   
>>>   .. raw:: latex
>>>     
>>
> 
> 
> 
> Thanks,
> Mauro

