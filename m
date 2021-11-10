Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7558744C407
	for <lists+linux-media@lfdr.de>; Wed, 10 Nov 2021 16:05:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231731AbhKJPHy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Nov 2021 10:07:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232435AbhKJPHr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Nov 2021 10:07:47 -0500
Received: from lb1-smtp-cloud9.xs4all.net (lb1-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7045FC061766
        for <linux-media@vger.kernel.org>; Wed, 10 Nov 2021 07:04:59 -0800 (PST)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id kp9hmnY5MfwDFkp9kmGIOA; Wed, 10 Nov 2021 16:04:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1636556696; bh=d0Ms+8ejV6/sYQdky5fGt47lSfQbWzU2swiy9JItbnw=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=g4WN/VAZzXstc/xV4YlrkwpZscFtO/pudaq4RhtA0h9weawtBojMXvS4bq8NkHsi1
         ku7TSGkhKU5eKCyXUWMW8DXaVeaFmMXsqa21q5AjBQ3x0jRoCrQHlGhd+9xqNrx0qt
         qED25TXn37nJqskH4/65u3wJSq+Oq5eJFfySMojxsmBGyVWfo2+ervWCH/8n6ynnBX
         QfQ0tPxdTUM66IIe5vG/ENX9Dbc9nONksUS2uSziRUz5m+TQeEXf+aa3GZsgkdvWYI
         nGG6OrOttBn5flxg/7Mt0TCe3hhj6r0GeNxFKDeiZthkg1Syj4uZUtSfNaJnk4QGyd
         GzxAVL77NtLqw==
Subject: Re: [PATCH 2/2] media: videobuf2: add WARN_ON if bytesused is bigger
 than buffer length
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com, mchehab@kernel.org
References: <20211108193933.20369-1-dafna.hirschfeld@collabora.com>
 <20211108193933.20369-3-dafna.hirschfeld@collabora.com>
 <5efc3d13-9d25-d0ce-98c8-fe1563dd91e9@xs4all.nl>
 <YYvcE24qkaImq5xK@pendragon.ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <d17b1cd1-3152-307b-a40a-d5bfd9234b36@xs4all.nl>
Date:   Wed, 10 Nov 2021 16:04:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YYvcE24qkaImq5xK@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfEdeT7dDSEaurm7LCVEE6IuT3VA9g3FDgoQoyuF4BI1mdvCXJLmpFDoPx5IZGlqRFCYbX22emyIC4mPMHrQlHiicVlf7tT+Q374tCGdbXaCSffWQZqy8
 s5l4MMi+fyrtQ/khMROeSCOndQee4giGrYYcydOrX6/QQuzPMux887dxZ2vBwFAPNIWUlEH8+/BSIixQc/CV52cYUXoS1ADuR4qgeWcIk3dMHvux2448+muE
 zYU++L79l3B39sMbp0QNE07AMZAbnB7S9+Zckp02AW809ZidfuKNKP3ZTJycqEZCZQmMcAgV6fAR/MbQexpWPBQ6+NfTCx4Yhdpj5miyW0JvOxVgxKTE42WL
 r43Wy35ZuAhCrchJLh3ZLqZ52HGslXfGZJSHl6hirQeoXb5UHfzel1MbRRgBI/V/1z7Xi+Av
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/11/2021 15:49, Laurent Pinchart wrote:
> On Wed, Nov 10, 2021 at 09:58:02AM +0100, Hans Verkuil wrote:
>> On 08/11/2021 20:39, Dafna Hirschfeld wrote:
>>> In function vb2_set_plane_payload, report if the
>>> given bytesused is bigger than the buffer size.
>>>
>>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>>> ---
>>>  include/media/videobuf2-core.h | 4 +++-
>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
>>> index 2467284e5f26..ffaa1f3361c3 100644
>>> --- a/include/media/videobuf2-core.h
>>> +++ b/include/media/videobuf2-core.h
>>> @@ -1155,8 +1155,10 @@ static inline void *vb2_get_drv_priv(struct vb2_queue *q)
>>>  static inline void vb2_set_plane_payload(struct vb2_buffer *vb,
>>>  				 unsigned int plane_no, unsigned long size)
>>>  {
>>> -	if (plane_no < vb->num_planes)
>>> +	if (plane_no < vb->num_planes) {
>>> +		WARN_ON(size > vb->planes[plane_no].length);
>>
>> I would change this to:
>>
>> 		/*
>> 		 * size must never be larger than the buffer length, so
>> 		 * warn and clamp to the buffer length if that's the case.
>> 		 */
>> 		if (WARN_ON(size > vb->planes[plane_no].length))
>> 			size = vb->planes[plane_no].length;
> 
> Should this also be a WARN_ON_ONCE() ? If it occurs once there's a large
> risk it will occur very frequently, and flood the kernel log.

Good point. I agree with that.

Regards,

	Hans

> 
>>>  		vb->planes[plane_no].bytesused = size;
>>> +	}
>>>  }
>>>  
>>>  /**
> 

