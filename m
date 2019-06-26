Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B44A056499
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2019 10:29:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727065AbfFZI3A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jun 2019 04:29:00 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:56555 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726768AbfFZI3A (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jun 2019 04:29:00 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud8.xs4all.net with ESMTPA
        id g3IUh3pZq7KeZg3IYhhXiN; Wed, 26 Jun 2019 10:28:58 +0200
Subject: Re: [PATCH] staging/most/video: set device_caps in struct
 video_device
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andrey Shvetsov <andrey.shvetsov@k2l.de>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <bf6e19b5-095c-ecac-fddb-91a1a65a2dee@xs4all.nl>
 <20190626081942.GA4605@kroah.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <191388bd-b9f2-420f-52d2-755c3397569c@xs4all.nl>
Date:   Wed, 26 Jun 2019 10:28:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190626081942.GA4605@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfKElLXQ4R51AUOmqYRj2OaDamRfUFAFSYfZlihVmNnEeeKEpneT9By2PZdpwFui5QGM+Vi/9CrRY/JB45/2fYThHwkTo9MaXVnMGwG4eSfSuIwx8+Lym
 LUkDHS3rsKWmR+7sNky0zL8JgFZnp5goANycuBJMSdDRZG6AunR24YRGsUn6zbJVgclsY3o/Extbe8G5+QSohDcoC+qxdtSjARM6F6i+XAnWn5SJD3DOzWDA
 Eye8ttNETP3pCczDeZJI8A==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/26/19 10:19 AM, Greg Kroah-Hartman wrote:
> On Wed, Jun 26, 2019 at 09:52:49AM +0200, Hans Verkuil wrote:
>> Instead of filling in the struct v4l2_capability device_caps
>> field, fill in the struct video_device device_caps field.
>>
>> That way the V4L2 core knows what the capabilities of the
>> video device are.
>>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> ---
>> Hi Andrey,
>>
>> I noticed this new staging V4L2 driver. FYI, please CC any future patches to
>> this driver to the linux-media@vger.kernel.org mailinglist as well so we can
>> review it. I'll post a review of this driver later today as well. In the
>> meantime, I'd like to get this patch in since during the upcoming 5.4 cycle
>> we will require that the device_caps field of struct video_device is set
>> correctly.
>>
>> Greg, do you want to take this patch? After Andrey Acks it, of course.
> 
> Yes, I will be glad to take it.

I'll post a v2 in a minute :-)

While reviewing the driver I found another issue in this code.

Regards,

	Hans

> 
> thanks,
> 
> greg k-h
> 

