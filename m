Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 915B02EBFDA
	for <lists+linux-media@lfdr.de>; Wed,  6 Jan 2021 15:51:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726732AbhAFOva (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Jan 2021 09:51:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726606AbhAFOv3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Jan 2021 09:51:29 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84BF6C06134C
        for <linux-media@vger.kernel.org>; Wed,  6 Jan 2021 06:50:49 -0800 (PST)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 09CA5878;
        Wed,  6 Jan 2021 15:50:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609944648;
        bh=BRLX7KZqCSNnkG6alMUM438aJvov5dIJRn4bny0P0rg=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=XuI50PBcdXp4UPM/ks21f8zM8WQRyEkVXSMqT2tLlZDbmewyuGVzPVSvs+4kFrFtz
         WzT0bivQXfT+kvTn/CZgxUYhGOMxjJ3BfgK87LN1zqy1/lJDFgtEfwcab6zi0hwIco
         ugK+oIroFWFQRAVLF5y3CXvlHNTYfLhwsgpJb1wE=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH] Revert "media: videobuf2: Fix length check for single
 plane dmabuf queueing"
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Naushir Patuck <naush@raspberrypi.com>, linux-media@vger.kernel.org
References: <20210106135210.12337-1-naush@raspberrypi.com>
 <c63d6797-d3f7-3e6d-b760-d05291dbc0ed@ideasonboard.com>
 <X/XMS+53s3RDUdY0@pendragon.ideasonboard.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <db558ced-be02-3493-ef0a-5cbac6a5fbb1@ideasonboard.com>
Date:   Wed, 6 Jan 2021 14:50:45 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <X/XMS+53s3RDUdY0@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 06/01/2021 14:42, Laurent Pinchart wrote:
> On Wed, Jan 06, 2021 at 02:35:22PM +0000, Kieran Bingham wrote:
>> Hi Naush,
>>
>> On 06/01/2021 13:52, Naushir Patuck wrote:
>>> The updated length check for dmabuf types broke existing usage in v4l2
>>> userland clients.
>>
>> Indeed, my tests have indeed been failing since 5.8 or such it seems.
>>
>> Thank you for this - it fixes the tests again for me.
>>
>> Tested-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> Cc: stable@vger.kernel.org

Is that still needed/used nowadays? I thought backports were picked up
automatically by the Fixes: or by AI-Magic?

Though [0] does imply it's still a preferred option.

[0] https://www.kernel.org/doc/html/v5.10/process/stable-kernel-rules.html

--
Kieran


> 
> ?
> 
>>> Fixes: 961d3b27 ("media: videobuf2: Fix length check for single plane dmabuf queueing")
>>> Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
>>> ---
>>>  drivers/media/common/videobuf2/videobuf2-v4l2.c | 3 +--
>>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
>>> index 96d3b2b2aa31..3f61f5863bf7 100644
>>> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
>>> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
>>> @@ -118,8 +118,7 @@ static int __verify_length(struct vb2_buffer *vb, const struct v4l2_buffer *b)
>>>  				return -EINVAL;
>>>  		}
>>>  	} else {
>>> -		length = (b->memory == VB2_MEMORY_USERPTR ||
>>> -			  b->memory == VB2_MEMORY_DMABUF)
>>> +		length = (b->memory == VB2_MEMORY_USERPTR)
>>>  			? b->length : vb->planes[0].length;
>>>  
>>>  		if (b->bytesused > length)
> 

