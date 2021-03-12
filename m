Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 496D2338675
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 08:18:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230257AbhCLHRt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 02:17:49 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:51817 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229688AbhCLHRd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 02:17:33 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id Kc36ly3iU4ywlKc39l2HmC; Fri, 12 Mar 2021 08:17:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615533451; bh=OP2DhD6seMyRaLqWP0q7MnMJlB5gR26hw+PcsK0yWIc=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=tLByZYRECSZWIFR7o7aj8Mntim8uz7SqIuDzD1Un1ybytOnc1WFXaKx8Cfp7ch72j
         frtPbMQa6nIY5YH1+OY5npZUK+X5bwiZRxVUCRHTw8+dekq0ZMa++IkCqwyBsiRVUI
         qpixfLeohUBaUr3b/loRBW1he04f8hDkHWvgwA6rx2fnIoQez0QQPpoYDdg0//S9Vl
         lEIPta57nDS/RcHmMjSJZIX+KXeR5StS50bS787wJGnmeoI6m1SlNN53OMRor0PRF/
         bUgZ1ud8lJCGksePXzC6sBgO3fwsxCWR3NaqqzvnadT+hF/7UwUU8Pv0eQGtxMECdL
         1+EMsZKbknNqQ==
Subject: Re: [PATCH v2 6/6] media: uvcvideo: Set a different name for the
 metadata entity
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ricardo Ribalda <ribalda@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, senozhatsky@chromium.org
References: <20210311221946.1319924-1-ribalda@chromium.org>
 <20210311221946.1319924-7-ribalda@chromium.org>
 <YEqp/EkIUwOQhAN5@pendragon.ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <96245ed2-dd6f-ddc3-aa02-a9924f76bc76@xs4all.nl>
Date:   Fri, 12 Mar 2021 08:17:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YEqp/EkIUwOQhAN5@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfCijKaXrKF6v97+P2fdEcICG8bp0cwmL0k+fViWJfGPSKDz912TfFGypf9u7rdCdl+DsHy8ST4/R5mgESJkHJL70ITTuJnBo1sJn0X4Kjw6JILBIhmGm
 8ugFxN1qYm3rgLS0Z5pVHUpDE0frJDu2acmElfXtQS4n38NwLjT5A7eAC81ONDCRQ5Z//jbyVECJhYfDD1w9q1T8d5k1BQDX2MlCpS5QVHNB2Stdq/hCl55q
 TETuI2ugAGHrRLmCTFLcwCE6SngOn/KgCZ2nN2/8x2aNm35aZmef6sR7v1QBjcF/oLskDzs3D+gK7I1x4tGtT69AyJCn1++t7+p62iLVWr/j/h5s40JTDt0S
 n9Yyq7ohDoH+5Fqu6Kngx1IibFdyZK2ou0XKfXv1NXdiTwYh7l0EpOFKqHdQUr01TGzPV+fW
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/03/2021 00:38, Laurent Pinchart wrote:
> Hi Ricardo,
> 
> Thank you for the patch.
> 
> On Thu, Mar 11, 2021 at 11:19:46PM +0100, Ricardo Ribalda wrote:
>> All the entities must have a unique name.
>>
>> Fixes v4l2-compliance:
>> Media Controller ioctls:
>>                 fail: v4l2-test-media.cpp(205): v2_entity_names_set.find(key) != v2_entity_names_set.end()
>>         test MEDIA_IOC_G_TOPOLOGY: FAIL
>>                 fail: v4l2-test-media.cpp(394): num_data_links != num_links
>> 	test MEDIA_IOC_ENUM_ENTITIES/LINKS: FAIL
>>
>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>> ---
>>  drivers/media/usb/uvc/uvc_driver.c | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
>> index 30ef2a3110f7..47efa9a9be99 100644
>> --- a/drivers/media/usb/uvc/uvc_driver.c
>> +++ b/drivers/media/usb/uvc/uvc_driver.c
>> @@ -2199,7 +2199,10 @@ int uvc_register_video_device(struct uvc_device *dev,
>>  		break;
>>  	}
>>  
>> -	strscpy(vdev->name, dev->name, sizeof(vdev->name));
>> +	if (type == V4L2_BUF_TYPE_META_CAPTURE)
>> +		strscpy(vdev->name, "Metadata Videodev", sizeof(vdev->name));
>> +	else
>> +		strscpy(vdev->name, dev->name, sizeof(vdev->name));
> 
> A UVC device could contain multiple output terminals (either in the same
> chain or in different chains), which would still result in multiple
> entities having the same name. Could this be fixed at the same time ?
> You can use the unit ID of the output terminal to create unique names
> (and it would be nice if the video and metadata nodes has similar names,
> with "video" and "metadata" being the only difference between them).

I agree with Laurent. How about using something like this for the videodevs:

	snprintf(vdev->name, sizeof(vdev->name), "Meta %s", dev->name);

and:

	snprintf(vdev->name, sizeof(vdev->name), "Video %s", dev->name);

Regards,

	Hans

> 
>>  
>>  	/*
>>  	 * Set the driver data before calling video_register_device, otherwise
> 

