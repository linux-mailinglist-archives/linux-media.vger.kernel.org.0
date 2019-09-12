Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C344B1050
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2019 15:48:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732258AbfILNs1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Sep 2019 09:48:27 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:44657 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731791AbfILNs1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Sep 2019 09:48:27 -0400
Received: from [IPv6:2001:420:44c1:2577:24f7:5447:c5bf:b985] ([IPv6:2001:420:44c1:2577:24f7:5447:c5bf:b985])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 8PSPiQBThV17O8PSTiyxGG; Thu, 12 Sep 2019 15:48:25 +0200
Subject: Re: [RFC] V4L2 & Metadata: switch to /dev/v4l-metaX instead of
 /dev/videoX
To:     kieran.bingham@ideasonboard.com,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <f26a4eb0-7009-a25f-29bc-3a292d2d79e1@xs4all.nl>
 <60769f0c-506c-4057-00ce-f4c8620441c5@ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <74ddb26f-6b8d-993f-df5e-9db0353311bb@xs4all.nl>
Date:   Thu, 12 Sep 2019 15:48:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <60769f0c-506c-4057-00ce-f4c8620441c5@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfOpoPQeh20f/HGfBFkor1PYnSgOadOXsanSrEH/sXDiQzv2WRddB0U6NT7BmN0gwEc79iaOKxVaPJ/XfSXGn6tZZwKThtf1ckgbnBwZeXAz1/UMQagze
 JnY6j5dBmFKEPLPXcrgZGRZU4EAeecIcCod+79Xywz973fvRWwkI6uVWoBJy03qJesy8/VXB+X8uJU3JI92hWxCHzuExBCsLHrLEYjbEZTmCAZ2XvFQz8Vdv
 Man890WzB/GMh5jVkkgv5X10vMSZuFn1PaXLu0XfVwlvoOZ6xqo4VRR9gevKdnhZOdwGQx+AVlw3mbqx6Lca7FsDcYx4U/zrMk/Fb0fKISk=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/12/19 3:16 PM, Kieran Bingham wrote:
> Hi Hans,
> 
> On 12/09/2019 08:48, Hans Verkuil wrote:
>> Hi all,
>>
>> I am increasingly unhappy about the choice of /dev/videoX for metadata devices.
>>
>> It is confusing for end-users (especially w.r.t. the common uvc driver) and
>> if we want to change this, then we need to do it soon.
>>
>> This patch https://patchwork.linuxtv.org/patch/58693/ adds a new VFL_TYPE_METADATA
>> so at least drivers can now explicitly signal that they want to register a
>> metadata device.
>>
>> This also makes it possible to add a kernel config option that allows you
>> to select whether you want metadata devices to appear as videoX or v4l-metaX.
>> I would prefer to set it to v4l-metaX by default.
> 
> I think I prefer this separation (v4l-metaX).
> 
> Having metadata as a (separate) videoX seemed odd to me - but I only
> saw/was affected by the metadata topics when it was too late it seemed ...
> 
> 
>> We can also consider backporting this to the stable/long-term kernels.
>>
>> Metadata capture was introduced in 4.12 for the vsp1 driver, in 4.16 for the
>> uvc driver and in 5.0 for the staging ipu3 driver.
>>
>> Does someone remember the reason why we picked /dev/videoX for this in the
>> first place?
> 
> I've wondered why it's not a separate queue on the same video device -
> much like we have multiple queues for V4L2-M2M devices ....
> 
> The data is relative to the same frames coming from the main queue right ?
> 
> That might have been awkward to express through our device type flags
> though.

There can be only one receive queue and one transmit queue per device node.

Multiple receive queues (i.e. with different types) were allowed in the past,
but I don't think any driver ever implemented it as it was just too complicated.
Both in the driver and for the user.

> 
> Anyway, I thought the horse had bolted on this topic ?

Well, that's the question. For meta output it can certainly be changed since
only a staging driver uses it. For capture it is mainly the uvc driver that's
problematic, but I am not aware of any linux application in a distro that
uses metadata capture.

So with a new kernel option you can choose whether you want to keep the old
behavior or create v4l-meta device nodes instead.

I regularly get questions about what happened, and by no means all applications
properly check the capabilities of the video device nodes (yes, they should do
so, but in the past this never was an issue with your average desktop user).

Besides all that, it is just weird to have meta data arrive on a video node.
I expect video there.

Regards,

	Hans

> 
>  :-D
> 
> 
>> Regards,
>>
>> 	Hans
>>
> 
> 

