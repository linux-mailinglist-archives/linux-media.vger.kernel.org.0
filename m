Return-Path: <linux-media+bounces-2045-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0F580B371
	for <lists+linux-media@lfdr.de>; Sat,  9 Dec 2023 10:34:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C3AA2810DA
	for <lists+linux-media@lfdr.de>; Sat,  9 Dec 2023 09:34:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBDE511188;
	Sat,  9 Dec 2023 09:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="Xtplaw2D"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D0451A1
	for <linux-media@vger.kernel.org>; Sat,  9 Dec 2023 01:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1702114402; x=1702719202; i=wahrenst@gmx.net;
	bh=XMs3lW0NBWXqZmdKm4s2jgBdjD6wAB7lt+5QuwBbU/c=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=Xtplaw2DRn1eb43UgmBs0bhxUI1SgpFdclDAOE4nZjCUBLIHDM61pC/ZCG0uSUoH
	 7OMF/+CiV47U/JDYCkNdhRirK8H7HUKvJaNCvWXhtghqH5NMfVwErnp3GMU7Vp1Ux
	 qzPKkhUBAh6FU9NnSKe6KYpfAoThb3X40e8P3cyDII6jxmwO4ocsi/SzyHjrhN76O
	 uaZljErwH/CqaiqQR3xgtrIUYJsys0Bd5dpB+w7YzajiFtbFhtP+KsqIR2+Dm5l9W
	 tnUFXk+Bd5Iy9pvX+hIYNrGuLsCif79b0ManTLYwHytaSIWXq6qwb9Stczgc2PngI
	 Nj2f4aOI9tNaftiDyg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.130] ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MBUqL-1r4zoj2pQd-00D1tC; Sat, 09
 Dec 2023 10:33:22 +0100
Message-ID: <1adbbd28-bdd0-4c65-bc59-fc0b8d6d034a@gmx.net>
Date: Sat, 9 Dec 2023 10:33:21 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] staging: vc04_services: Drop vchiq_log_trace() in
 favour of dev_dbg
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Umang Jain <umang.jain@ideasonboard.com>, linux-staging@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Stefan Wahren
 <stefan.wahren@i2se.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dan Carpenter <error27@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 "Ricardo B . Marliere" <ricardo@marliere.net>
References: <20231205084157.73819-1-umang.jain@ideasonboard.com>
 <20231205084157.73819-4-umang.jain@ideasonboard.com>
 <46e42bbf-e99b-4e61-a207-35e150fe4fd2@gmx.net>
 <1883402c-edad-48b7-9081-32ec3538667b@suswa.mountain>
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <1883402c-edad-48b7-9081-32ec3538667b@suswa.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qb0a7K/bwRDQ65WdB1fw1eptivNDGViaAwPZR1DbMOSjXe7liUG
 rAMAGZab7AQl7CafTFUhBjSLCYFdv+2Kz+AB/Zs+vi2dDMS8WvtfT6EyPhyPF9isvVLzqLZ
 /j+vyhuToQOStJTzIwFg1gAnLM3HfEAQNeNvig1Vf4QAdEzhKBtqvQzNvK2HAk38I+XGstH
 fwnupBduSOhD44sBa6C0A==
UI-OutboundReport: notjunk:1;M01:P0:R6bXRr6+8CI=;AFPboodsA6U5QZ7dNAdJ/u1i3qB
 5i0VSbmw5fl9m0rPemFqPedFHBt7hHcrqpb2tUzrMeKzcrWvVykJ+wdlGtF95lDeMxJmDbuty
 OZsiX9hbYeFQtG+tW1S7hV1dlwFh9jwqKLQ+m60zqakMpGQGeduHxXilxvWbN9Q/i1WcKfAsa
 CRoSzbb3bQfRkVNo66LS7FKKPvwma5BsAN0L48Qm5XU8GSiij7caYs7xZuJR2QTO/UXTATc3V
 ZobXaBO66z0OYyHj14/3zcNLAiVd/cGSIhv2d6DNxyYM8dTGayFVUtNOX2iONK1ELh+pSQXDh
 ImEZxtycEPmdp0SaxudN/8vjwZqahRTT8WVLbZF9bB+Q/fpFYG9S7SKmAboUhrZzDQH7hjwr0
 sQGkYg5zlDiPVcie9VsuuHS74Va17cByZ1ZeP8oe7PjhH3PRM4Wd8qaGJ8Udi7k4l4WFjSZ2u
 qMtXrlPaF+5qDSmoEhTvubw5NvCMNzFM4IHCsTJLEUGIclXK+XxRCO7nuVgx3Uj0d2NZfh6pD
 2IYbMbGwZNSEynvBblJ1dxDKQGiOO3YAPmxA5VHYzmAotgdBWTTyixZd2LsU/gyAB4EmFxW+6
 e6akmBxeK1Og6wAzXfg7m/t+Z35aR/5gq5MamY8AFXBfl347eSEJqKGtskqHoSG0cK+DV9HUZ
 hySgttu3BNTmegalByhKaeVO/b5b+vsL8Lp5bH/hE+FDXSDN9yFOq11bcYjNiGX/I956d6oHt
 RMn+Wd4zV/O+7N8U7AVoy7AG6crELzxwnqLYUpKUCrwv6EULTi+8CBCdRKoRl2dZiWwyGMUOL
 4mqNKlJKiLFYBPD87Zyq4AiRH5CtePN6RvYv4Tq02l51znR3PRYsnm0SQ7xFGiULHN6z5KPZo
 OVrJ1PbOcjnTm85bKEb69hC1jmuANmNCdc8G8Cwy8GGwSjgqk/BJdqeh1vBTm4obJrGOM9r1M
 +OwHGGHZLAiPzTysEQ6KxRVrfVo=

Hi Dan,

Am 09.12.23 um 07:27 schrieb Dan Carpenter:
> On Fri, Dec 08, 2023 at 01:08:04PM +0100, Stefan Wahren wrote:
>>> @@ -1425,7 +1416,7 @@ vchiq_use_internal(struct vchiq_state *state, st=
ruct vchiq_service *service,
>>>    	}
>>>
>>>    out:
>>> -	vchiq_log_trace(state->dev, VCHIQ_SUSPEND, "%s exit %d", __func__, r=
et);
>>> +	dev_dbg(state->dev, "suspend: exit %d\n", ret);
>> In case we want to keep this kind of debug messages, i prefer to have a
>> common format:
>>
>> returning %d vs exit %d
> Someone was trying to make ftrace track return values...  Whatever
> happened with that work?
this feature has been merged, but it doesn't seem to be available for arm:

find -name Kconfig | xargs grep HAVE_FUNCTION_GRAPH_RETVAL
./kernel/trace/Kconfig:config HAVE_FUNCTION_GRAPH_RETVAL
./kernel/trace/Kconfig:=C2=A0=C2=A0=C2=A0 depends on HAVE_FUNCTION_GRAPH_R=
ETVAL
./arch/x86/Kconfig:=C2=A0=C2=A0=C2=A0 select HAVE_FUNCTION_GRAPH_RETVAL=C2=
=A0=C2=A0=C2=A0 if
HAVE_FUNCTION_GRAPH_TRACER
./arch/arm64/Kconfig:=C2=A0=C2=A0=C2=A0 select HAVE_FUNCTION_GRAPH_RETVAL =
if
HAVE_FUNCTION_GRAPH_TRACER
./arch/s390/Kconfig:=C2=A0=C2=A0=C2=A0 select HAVE_FUNCTION_GRAPH_RETVAL
./arch/riscv/Kconfig:=C2=A0=C2=A0=C2=A0 select HAVE_FUNCTION_GRAPH_RETVAL =
if
HAVE_FUNCTION_GRAPH_TRACER
./arch/loongarch/Kconfig:=C2=A0=C2=A0=C2=A0 select HAVE_FUNCTION_GRAPH_RET=
VAL if
HAVE_FUNCTION_GRAPH_TRACER

These debug messages are only in the error path, so i'm not sure if
someone what to hunt bugs by searching all that return values without
knowing which function is possibly affected.
>
> regards,
> dan carpenter
>


