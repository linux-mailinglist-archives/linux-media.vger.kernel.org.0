Return-Path: <linux-media+bounces-3-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 823497E7EA1
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 18:46:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D5C7281465
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 17:46:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6766538DC8;
	Fri, 10 Nov 2023 17:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="tiqoqms4"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7C420B14
	for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 17:46:28 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ADA32812C
	for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 02:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1699611702; x=1700216502; i=wahrenst@gmx.net;
	bh=pDxBNkCtCkZS6G8VVFGb2hFThM0VDkxh3OXp+guyeQE=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=tiqoqms45cjSluer2tQFyKyGah+gnuoEPmDjvpd063Wyg6etaqmsZAIftb4MrujM
	 QMFslV7rIqGV26EzDrQmfYk1OSiNHOM8tQvNjjAt0Qd4ny0rWgM6FwGmpNGTn+es6
	 PE2Vm71ac3ZmP4UTou8HI1OebkNiybmQBFeOInOXT3EAeWi6KDZ6X3nIVFoUKDdqT
	 nxc4xbhkHTWrO50NAqH3xTekoYJLETEd1iA39SKNaiyWCb3KEvU91q2YzFKMIIl3V
	 /jKNBz9m1kHAgl1AcswqRMZnML/ByOrPoA8Y6bajNXUIQ6B5xvisYZ+bd+6llRR0+
	 g/8PSvGnxScf/FSsXw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.129] ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MryXN-1rn9e71rzZ-00nxZL; Fri, 10
 Nov 2023 11:21:42 +0100
Message-ID: <a122dc9a-724d-4f57-b0c2-0b6676a4ea83@gmx.net>
Date: Fri, 10 Nov 2023 11:21:41 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] staging: vc04_services: Do not pass NULL to
 vchiq_log_error()
To: Umang Jain <umang.jain@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dan Carpenter <error27@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Phil Elwell <phil@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20231107095156.365492-1-umang.jain@ideasonboard.com>
 <20231107095156.365492-6-umang.jain@ideasonboard.com>
 <20231107122551.GA3051@pendragon.ideasonboard.com>
 <20231107123627.GB3051@pendragon.ideasonboard.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20231107123627.GB3051@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:yeYVJSxIyCHzHks/8URM3J2LlpTNzRU1rKdr9itN57hIV5jnkfb
 tRHeL1geL+ZByl9Q5dvug6Lcf6IcCzFGX/odVAy5VdXhlnUoNh6iOtbAwg2HKSwpvXJ92WV
 8FEO8AOeGekSXEuqSJ06Eux6LQsEIYZtAmb2jwz+y1mtimbSEfqropPDv+EuFAPaCK3f24V
 OpeUb7JHPj4HarQ/C0mSg==
UI-OutboundReport: notjunk:1;M01:P0:YYWisDYw8xM=;hpFPDn/U9t8bI9F/lSJsdl6yvku
 +flBFMDOajNqb0nd8swkU9rFelaywO5q+o1NMxfgjrUlzfobLBKbVW9dBDS4IYZ6G3kHKKRfI
 bIwwwSajMn5L39yW8N51rhz5J76tzdEif/luJsA5xtqwyTY079YNawaHQPs9D80Nify95uAPo
 6niYudsKSpCxvHqYKNO22dbZqMPzj0lNXEqt1YSMFe9AtLlDn5M07OfjMphpP6PeXfx9hVMXU
 P40i5DO9aZitN65PcdkI7yqtfSiwZ9V0UiZvPZuvwU0U2u+oDndarAD/cAzGmqcY2PYn7G/bW
 wMeC7WgrYr14Zs/prv5PUMqTPz+hH1hF8mCIgry4Px3D4ucAX2NeuCkoy0/RmLs2ij1SAtIfQ
 9BMUlgkKWRkGSiQkg4K3ozEVsIhpTEzSZq9zhRWwIYinIFnkDReaeFD3BsN7KqjY34U+Y0yW9
 6iT50KeTIxJY+AweQbUKJEktHpygNtKJ2N6zRFLhC+MgwkjNgNgASLA8tro9dwCW5ReGFHbTT
 ANm40bO3sQXSMTf3JYMeP/Foez85PT8pW6FzS2vdIGGvUzKuJ3qBycbxF2bat4lqbfrS2A9c9
 sS4Ho8sbnyXs2R05OepZRZZxMoYmTcWhbWnZaRKvRkTAgd+nIBs9IJ6V7uuPpnTrClZufw3UU
 2N9JLtqMIDFqzWMV8OmBa9TftcT4yxekQR8EyTDRutnZY56MFVUVJ6qPvXU0juWfK+dwxUmFN
 bOJyeQt1PDECthW67xUCVJs1IGK+Dv8vusJxlS4S2D7kSwnq+WPNk+fCcIMF6UvLDZov4ifGl
 6oQxPoqeweOcYgPHBA4nOV3xKujptcWbMTt/Xn++RBiM1VfXnzqWt93gCzZfZrZpFEWyjwgOJ
 hZmRYyNQa1iH6Or4+x+D5CDxZvJfIIh9uMVYdwiGP/mWjmZLtMxdiATzJw/o0XvusYQ9wrxTw
 zbtIHQ==

Hi Umang,

Am 07.11.23 um 13:36 schrieb Laurent Pinchart:
> On Tue, Nov 07, 2023 at 02:25:52PM +0200, Laurent Pinchart wrote:
>> On Tue, Nov 07, 2023 at 04:51:52AM -0500, Umang Jain wrote:
>>> vchiq_add_connected_callback() logs using vchiq_log_error() macro,
>>> but passes NULL instead of a struct device pointer. Fix it.
>>>
>>> vchiq_add_connected_callback() is not used anywhere in the vc04_servic=
es
>>> as of now. It will be used when we add new drivers(VC shared memory an=
d
>>> bcm2835-isp), hence it kept as it is for now.
>>>
>>> Fixes: 1d8915cf8899 ("staging: vc04: Convert vchiq_log_error() to use =
dynamic debug")
>>> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
>>> ---
>>>   .../vc04_services/interface/vchiq_arm/vchiq_connected.c       | 4 ++=
=2D-
>>>   .../vc04_services/interface/vchiq_arm/vchiq_connected.h       | 4 ++=
+-
>>>   2 files changed, 5 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_c=
onnected.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_conne=
cted.c
>>> index b3928bd8c9c6..21f9fa1a1713 100644
>>> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connecte=
d.c
>>> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connecte=
d.c
>>> @@ -27,7 +27,7 @@ static void connected_init(void)
>>>    * be made immediately, otherwise it will be deferred until
>>>    * vchiq_call_connected_callbacks is called.
>>>    */
>>> -void vchiq_add_connected_callback(void (*callback)(void))
>>> +void vchiq_add_connected_callback(struct vchiq_device *device, void (=
*callback)(void))
>>
>> You're changing the prototype of the function, but the patch doesn't
>> update any user. If the function is unused, it looks like you can drop
>> it instead. Looking at the rest of the vchiq_connected.c file, I think
>> you can actually drop the whole file.
>
> Except that the vc-sm-cma driver will use it. I'm curious though, that
> driver will have no way to acquire a pointer to a vchiq_device, so I
> don't see how this will be usable. pr_err() may be a better pick here.

in case there is currently no user, but vc-sm-cma will be then i'm
convinced that moving this driver into staging before vchiq is out is a
good idea.

AFAIK your main goal is to get bcm2835-isp into mainline, so it would be
faster to have it in staging, so everyone could fix the style issues.

My initial concern about importing new drivers was that after moving it
into staging nobody wants to finish the job. But currently i've a good
feeling that vchiq is on a good way.

Best regards

>
>>>   {
>>>   	connected_init();
>>>
>>> @@ -39,7 +39,7 @@ void vchiq_add_connected_callback(void (*callback)(v=
oid))
>>>   		callback();
>>>   	} else {
>>>   		if (g_num_deferred_callbacks >=3D MAX_CALLBACKS) {
>>> -			vchiq_log_error(NULL, VCHIQ_CORE,
>>> +			vchiq_log_error(&device->dev, VCHIQ_CORE,
>>>   					"There already %d callback registered - please increase MAX_CAL=
LBACKS",
>>>   					g_num_deferred_callbacks);
>>>   		} else {
>>> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_c=
onnected.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_conne=
cted.h
>>> index 4caf5e30099d..e4ed56446f8a 100644
>>> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connecte=
d.h
>>> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connecte=
d.h
>>> @@ -1,10 +1,12 @@
>>>   /* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
>>>   /* Copyright (c) 2010-2012 Broadcom. All rights reserved. */
>>>
>>> +#include "vchiq_bus.h"
>>> +
>>>   #ifndef VCHIQ_CONNECTED_H
>>>   #define VCHIQ_CONNECTED_H
>>>
>>> -void vchiq_add_connected_callback(void (*callback)(void));
>>> +void vchiq_add_connected_callback(struct vchiq_device *device, void (=
*callback)(void));
>>>   void vchiq_call_connected_callbacks(void);
>>>
>>>   #endif /* VCHIQ_CONNECTED_H */
>

