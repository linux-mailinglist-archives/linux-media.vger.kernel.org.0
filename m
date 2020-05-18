Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 027361D781B
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2020 14:06:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726940AbgERMGP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 May 2020 08:06:15 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:38087 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726448AbgERMGO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 May 2020 08:06:14 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id aeX2jyeMjhEkraeX6jegmB; Mon, 18 May 2020 14:06:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1589803572; bh=Aix+sL8aZ1hfIyMkWAREUgDqPnTdJrfg2H3UNGW1I7E=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=cHAfXMgr4M7IDbkjjfXnCQ4L2BN1llrqZcFWaw78yhxAQuO4lXHDFt4XvoH6397wS
         3xcTewK1GS8PpXD6L9oOV7xs7meRJxNXycsdziSj5XWvZaTnJD0+JiWAoGk+7QLnb5
         xOzADM0XPo8/rXK8yQ4Q0hug8vvy+c8S69N1BNahKu/2YdVoxlJxlvUzz0ohg77bRg
         ZkoCgyarLbxWmi8NqxVhdDBcJUHgT58eAeX4aUwAYnynJLMsac0NlDzYJww82RqpWC
         WGO06a6H8Ux+zXnL0kzyPpsaVxk/o1SyPW+/RDCOhJpxWfeo/2cb6seSSou8LHHhBo
         iD1Umls/FnRUw==
Subject: Re: [PATCH v2 06/34] staging: vc04_services: Add new vc-sm-cma driver
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Naushir Patuck <naush@raspberrypi.com>
References: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
 <20200504092611.9798-7-laurent.pinchart@ideasonboard.com>
 <4e42a593f16614e913613150a90e851acbfcaa8c.camel@suse.de>
 <CAPY8ntB3RCwzCzj+v0QEQp19f-X7tgfhFZ_DK3-LUiWXGK0eNA@mail.gmail.com>
 <20200508001119.GI5838@pendragon.ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <4057ae9a-eccb-1f7f-254e-54ac2c49a4f7@xs4all.nl>
Date:   Mon, 18 May 2020 14:06:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200508001119.GI5838@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfME+txAun8PtJCBF5DSxVrWHaFaSlWt5CSWJ6iNxwPuVyqwk2xOWqSSkQU47vnIgJ/p4oneZNklUNBiWjnx4rLYQonA51qyPVBdZ++T/1uuan8hhaYRW
 LXeqJV3So4zNhKe3mLRtZWfCBF5xfAaZYP3NldDYr/xbNfzCWHXEo7xcm9GCP2IEkrx8VsPbg1pIsujmiu9GGywlnTMQC8NStOKmi1LZtCmbvsqTCSGF+Sbi
 JHvNeIJqm5A3XNB2g9D63qi+roF1vCd36fuLiloQuD6ce3lmVRHmXDqUk0XkGllIxZzQfaS2ft5UBQqeycbP08GttcOkxwpg3FzBrKcBJ6a5D+cs5mLGRq+r
 /17SFNAmvaoutefwe7suUT4KUzNPSqUWTGpyqIONcel9sMtMPfH2LZGlKrAE+kz/urq8WMWIvY0LtaFaWJ4k7vkmEfcK1wh4jA2pwCXWQywj/NaJHEoMGKAE
 xo/zzm7cG6J7za5xM1g7n9+q9uOpFh9R9qssHQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 08/05/2020 02:11, Laurent Pinchart wrote:
> Hi Dave,
> 
> On Wed, May 06, 2020 at 08:24:38PM +0100, Dave Stevenson wrote:
>> On Wed, 6 May 2020 at 19:04, Nicolas Saenz Julienne wrote:
>>> On Mon, 2020-05-04 at 12:25 +0300, Laurent Pinchart wrote:
>>>> From: Dave Stevenson <dave.stevenson@raspberrypi.org>
>>>>
>>>> Add Broadcom VideoCore Shared Memory support.
>>>>
>>>> This new driver allows contiguous memory blocks to be imported
>>>> into the VideoCore VPU memory map, and manages the lifetime of
>>>> those objects, only releasing the source dmabuf once the VPU has
>>>> confirmed it has finished with it.
>>>
>>> I'm still digesting all this, but a question came up, who is using the
>>> ioctls?
>>
>> We have a userspace library that uses it [1].
>> It is used by things like MMAL to share buffers between the VPU and
>> ARM, rather than having to get VCHI to copy all the data between
>> mirrored buffers.
>>
>> I think what has happened here is that Laurent has picked up the
>> version of the driver from the top of our downstream kernel tree.
>> For libcamera and the ISP driver, we need a significantly smaller
>> feature set, basically import of dmabufs only, no allocations or cache
>> management. For the ISP driver it's mainly dmabuf import from
>> videobuf2 for the image buffers, but there's also a need to pass in
>> lens shading tables which are relatively large. With a small amount of
>> rework in libcamera, we can make it so that we use dma-buf heaps to do
>> the allocation, and pass in a dmabuf fd to the ISP driver to then map
>> onto the VPU. That removes all the ioctls handling from this driver.
>>
>> Downstream we do have other use cases that want to be able to do other
>> functions on shared memory, but that too should be reworkable into
>> using dma-buf heaps for allocations, and vcsm only handles importing
>> dmabufs via an ioctl. All that can be hidden away in the vcsm library,
>> so applications don't care.
>> We've also got some legacy code kicking around, as there was
>> originally a version of the driver that mapped the VPU's memory blocks
>> to the ARM. That's why the vcsm library has two code paths through
>> almost every function - one for each driver.
>>
>> Laurent: What's your view? Halt the review this particular patch for
>> now and rework, or try and get this all integrated?
>> Mainline obviously already has dma-buf heaps merged, whilst I have a
>> PR cherry-picking it back into our downstream 5.4. The main reason it
>> hasn't been merged is that I haven't had a test case to prove it
>> works. The rework should be relatively simple, but will need small
>> updates to both libcamera and ISP driver.
> 
> My preference would be to go for a solution based on dma-buf heap right
> away for mainline, to minimize the code going into staging. There's no
> hurry there, and I can help integrating the changes in libcamera if
> needed.

So just to be clear, these vc-sm-cma ioctls will disappear in the next version?

I had the same question while reviewing this as Nicolas had :-)

Regards,

	Hans

> 
>> [1] https://github.com/raspberrypi/userland/tree/master/host_applications/linux/libs/sm
>>
>>>> Driver upported from the RaspberryPi BSP at revision:
>>>> 890691d1c996 ("staging: vc04_services: Fix vcsm overflow bug when
>>>> counting transactions")
>>>> forward ported to recent mainline kernel version.
>>>>
>>>> Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
>>>> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
>>>> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
>>>> ---
>>>>  drivers/staging/vc04_services/Kconfig         |    2 +
>>>>  drivers/staging/vc04_services/Makefile        |    1 +
>>>>  .../include/linux/broadcom/vc_sm_cma_ioctl.h  |  114 ++
>>>>  .../staging/vc04_services/vc-sm-cma/Kconfig   |   10 +
>>>>  .../staging/vc04_services/vc-sm-cma/Makefile  |   13 +
>>>>  drivers/staging/vc04_services/vc-sm-cma/TODO  |    1 +
>>>>  .../staging/vc04_services/vc-sm-cma/vc_sm.c   | 1732 +++++++++++++++++
>>>>  .../staging/vc04_services/vc-sm-cma/vc_sm.h   |   84 +
>>>>  .../vc04_services/vc-sm-cma/vc_sm_cma_vchi.c  |  505 +++++
>>>>  .../vc04_services/vc-sm-cma/vc_sm_cma_vchi.h  |   63 +
>>>>  .../vc04_services/vc-sm-cma/vc_sm_defs.h      |  300 +++
>>>>  .../vc04_services/vc-sm-cma/vc_sm_knl.h       |   28 +
>>>>  12 files changed, 2853 insertions(+)
>>>>  create mode 100644
>>>> drivers/staging/vc04_services/include/linux/broadcom/vc_sm_cma_ioctl.h
>>>>  create mode 100644 drivers/staging/vc04_services/vc-sm-cma/Kconfig
>>>>  create mode 100644 drivers/staging/vc04_services/vc-sm-cma/Makefile
>>>>  create mode 100644 drivers/staging/vc04_services/vc-sm-cma/TODO
>>>>  create mode 100644 drivers/staging/vc04_services/vc-sm-cma/vc_sm.c
>>>>  create mode 100644 drivers/staging/vc04_services/vc-sm-cma/vc_sm.h
>>>>  create mode 100644 drivers/staging/vc04_services/vc-sm-cma/vc_sm_cma_vchi.c
>>>>  create mode 100644 drivers/staging/vc04_services/vc-sm-cma/vc_sm_cma_vchi.h
>>>>  create mode 100644 drivers/staging/vc04_services/vc-sm-cma/vc_sm_defs.h
>>>>  create mode 100644 drivers/staging/vc04_services/vc-sm-cma/vc_sm_knl.h
> 

