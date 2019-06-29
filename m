Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 770C65A9CA
	for <lists+linux-media@lfdr.de>; Sat, 29 Jun 2019 11:14:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726884AbfF2JOD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 Jun 2019 05:14:03 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:37993 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726818AbfF2JOD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Jun 2019 05:14:03 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud7.xs4all.net with ESMTPA
        id h9Qjh6jrP2g2jh9QmhegYe; Sat, 29 Jun 2019 11:14:01 +0200
Subject: Re: [PATCH v7 0/3] media: v4l2-subdev: Verify arguments in
 v4l2_subdev_call()
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@fsdn.se>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190520212747.368-1-jmkrzyszt@gmail.com>
 <20190629032817.GQ32581@bigcity.dyn.berto.se>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <859e0e85-f09c-f143-e4f8-2ff1f4cf04c1@xs4all.nl>
Date:   Sat, 29 Jun 2019 11:13:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190629032817.GQ32581@bigcity.dyn.berto.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfNqVc+Sy6bjEMOPneC0xOnJOBzdfDknbFBMiM/tdG3gNu1++KyGQwC2WFwMs4SEqa55kGaKiXRAh5aiqNPoeBkoXetbLAh2f1dsZ4ATZSrFluM26ilf0
 npzyqWniac1TXDLbRTroWYNyuqb1L0hGoqMJii9DaLlNqC9vjTPnqo5mQ026rKjgSx5QdUcZaT6xTMy/VIA7TARKfcXEp+8qDd9rgFiMVS3jaPmD97w+junu
 qDqjtJzElyNZngblRzMa/biFHdHv4gTRmp1kOfpe2oU+Nd28uC5wfF8xsWD29MqYJi31bxvspHYBx2QVm471KZyQuEfMVIpIhavlCM4NFxo6oMoN1DJKW/E2
 GPilQ96g
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/29/19 5:28 AM, Niklas Söderlund wrote:
> Hi,
> 
> This patch breaks rcar-vin. I'm sorry I did not find out before it was 
> merged as a8fa55078a7784a9 ("media: v4l2-subdev: Verify arguments in 
> v4l2_subdev_call()").
> 
> The problem is that rcar-vin calls enum_mbus_code in its bound callback.  
> At this point call_enum_mbus_code() is invoked which then calls 
> check_pad(). At this point sd->entity.graph_obj.mdev is not set so the 
> check if (pad > 0) fails and the binding of the subdevice in rcar-vin 
> fails.
> 
> I'm not sure how to best solve this, suggestions are appreciated. I see 
> two options, move the call to enum_mbus_code from the bound to the 
> complete callback or make sure the mdev is associated with the subdev 
> before the bound callback is invoked. I don't like the former as I think 
> the complete callback should be removed ;-)

I don't think check_pad() should check mdev. Try this instead:

static inline int check_pad(struct v4l2_subdev *sd, __u32 pad)
{
#if defined(CONFIG_MEDIA_CONTROLLER)
	if (sd->entity.num_pads)
	        return pad >= sd->entity.num_pads ? -EINVAL : 0;
#endif
	/* allow pad 0 on subdevices not registered as media entities */
	return pad ? -EINVAL : 0;
}

If the subdev defines pads, then sd->entity.num_pads is non-zero and it can
be used to check the pad value, otherwise it should just only accept pad 0.

And it shouldn't depend on mdev, since that (as you discovered) may not be
set yet.

Regards,

	Hans

> 
> On 2019-05-20 23:27:44 +0200, Janusz Krzysztofik wrote:
>> Correctness of format type (try or active) and pad ID parameters passed
>> to subdevice operation callbacks is now verified only for IOCTL calls.
>> However, those callbacks are also used by drivers, e.g., V4L2 host
>> interfaces.
>>
>> Since both subdev_do_ioctl() and drivers are using v4l2_subdev_call()
>> macro while calling subdevice operations, move those parameter checks
>> from subdev_do_ioctl() to v4l2_subdev_call().  Also, add check for
>> non-NULL pointers, including pad config if V4L2_SUBDEV_FORMAT_TRY is
>> requested.
>>
>> Having that done, we can avoid taking care of those checks inside
>> drivers.
>>
>> Janusz Krzysztofik (3):
>>   media: v4l2-subdev: Verify arguments in v4l2_subdev_call()
>>   media: v4l2-subdev: Verify v4l2_subdev_call() pointer arguments
>>   media: v4l2-subdev: Verify v4l2_subdev_call() pad config argument
>>
>>  drivers/media/v4l2-core/v4l2-subdev.c | 268 +++++++++++++++++---------
>>  include/media/v4l2-subdev.h           |   6 +
>>  2 files changed, 188 insertions(+), 86 deletions(-)
>>
>> Changelog:
>> v6->v7:
>> Changes suggested by Sakari - thanks!
>> - never succeed pad check on media entities with pad_num == 0,
>> - allow pad 0 on subdevies not registered as media entities.
>>
>> v5->v6:
>> - rename wrappers to call_something() as suggested by Sakari - thanks!
>> - make check_ functions inline - also on Sakari's suggestion, thanks!
>> - drop patch 2/4 and remove WARN_ONs from remaining patches to avoid
>>   kernel WARNs on non-kernel bugs - thanks Hans for pointing this out!
>>
>> v4->v5:
>> - a few coding style and code formatting changes,
>> - require CONFIG_MEDIA_CONTROLLER, not CONFIG_VIDEO_V4L2_SUBDEV_API,
>>   for a valid pad ID check,
>> - perform pad ID check only if at least one pad is configured so
>>   drivers which don't configure pads are not affected if built with
>>   CONFIG_MEDIA_CONTROLLER defined,
>> - issue kernel warnings on invalid parameters (new patch - 2/4),
>> - validate pointers before using them (new patch - 3/4).
>>
>> v3->v4:
>> - fix 'struct' keyword missing from patch 2/2,
>> - fix checkpatch reported style issue in patch 2/2
>> Sorry for that.
>>
>> v2->v3:
>> - add patch 2/2 with pad config check,
>> - adjust continuation line alignments in patch 1/2 to match those
>>   used in 2/2.
>>
>> v1->v2:
>> - replace the horrible macro with a structure of wrapper functions;
>>   inspired by Hans' and Sakari's comments - thanks!
>>
>> -- 
>> 2.21.0
>>

