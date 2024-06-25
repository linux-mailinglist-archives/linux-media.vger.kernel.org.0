Return-Path: <linux-media+bounces-14105-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A5491676E
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2024 14:19:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C55091C247B6
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2024 12:19:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EAFB15250F;
	Tue, 25 Jun 2024 12:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="lgD+kFpv"
X-Original-To: linux-media@vger.kernel.org
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10EFB3F9CC
	for <linux-media@vger.kernel.org>; Tue, 25 Jun 2024 12:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719317965; cv=none; b=hlFVRDfak5Q0auWz6sPt+i7MFU/sxuWkm+csw5mjq67MxNMhjur0yVKli48V3N05J6zp+h41wF7VyFbpuBEeuy4jNjdK5zp4kPPHVxlnWnuQXdu6Up8sXY3JYW7wm3/kqyfF4r8vbCMNaPsLU8fv3CfRfpsLc17yUHYe5kpNDjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719317965; c=relaxed/simple;
	bh=WQmEUJf+pm25n3NOVmrDGmbxTXE+7Nk5eFtJeNr+Apk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uV8h6kwJKNRvT/Uv6gNpLvGj1uC1bn07qg7kDt2MFhK11M5Is2VC5edGurmZUOv65mrqBtNZm0dCm1+47POPWErTtCLfOQeyxkOmiOBfE17ZKWYpqaIp34ZhS7PGGV9LYkH5ag9nR8FbXMiUDffTEgpSi5gGNWm1rgMGITmt8p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=lgD+kFpv; arc=none smtp.client-ip=195.121.94.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
X-KPN-MessageId: 25173290-32ed-11ef-8845-005056abad63
Received: from smtp.kpnmail.nl (unknown [10.31.155.40])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 25173290-32ed-11ef-8845-005056abad63;
	Tue, 25 Jun 2024 14:19:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=content-type:from:to:subject:mime-version:date:message-id;
	bh=H5q/lmzc/plZ+yvzNHxYzdTlI3vw/l5f0C4UoKe7cfE=;
	b=lgD+kFpv+st/DzuoaWxFzJkjgeoM3QXat49phRtMKVZFu4ZXWKpIoT+BXZ/Ai/chnWXjUhSNQChdX
	 XjTN2KMaJWsV3N+CorOE9OsClCu2t5uHSd+p1lvZBANMj3jSZ9ISiJD/p9gPqT/c9f2ogeqv8iZCq+
	 mdZDV1nTksbSeMV92G2+t7+rop7tnTgFxEnGxwDzwEudav5JblSSPlIwbDjJtjWdzNx0rUVjMJXNt9
	 zCCM6CzsUKSOJS5al/pGrHlXOWIuRMd4eV87KGvxypLZtvaMSJZcMS20CgEf04eLg6w/tKdG/I8o/B
	 F3LIH3kaWBzSG5TauAn6cW2yKTlUajA==
X-KPN-MID: 33|JShudlvj9xAa3JVKCzPtFH9rn4SOdSoE8ER039EJUhY3t3JjpcY+1emwuZ46mEW
 YC2qia+d+OFSyp9q9GkCgo62l77hMHNqs/Xypit5H4vc=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|I6Ol2rhR4WwMcMZXRJBHedaZZJPFpLKnNMbidmWMIu42hHzp6G4OAWLH3AYKqNN
 F5EdSkCmp9Ex3/rscjxlZ4A==
Received: from [10.47.75.249] (unknown [173.38.220.48])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id 25b93d4d-32ed-11ef-9fe2-005056ab7584;
	Tue, 25 Jun 2024 14:19:20 +0200 (CEST)
Message-ID: <8ec33cfe-3098-487b-a050-88b0af0ce39c@xs4all.nl>
Date: Tue, 25 Jun 2024 14:19:19 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/8] media: uapi: Add Raspberry Pi PiSP Back End uAPI
Content-Language: en-US
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 David Plowman <david.plowman@raspberrypi.com>,
 Naushir Patuck <naush@raspberrypi.com>,
 Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@iki.fi>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20240531080707.34568-1-jacopo.mondi@ideasonboard.com>
 <20240531080707.34568-4-jacopo.mondi@ideasonboard.com>
 <baeb2085-1db2-4eb0-a399-a5a35672801c@xs4all.nl>
 <eg2k2zjqw5n65zdp33zpzpli5qrvtrsj5yykkn5e7wukoap5uv@adcsxiffppbg>
 <cb4763da-a5e3-4c95-9233-28605e0cbef2@xs4all.nl>
 <sryvilbnktnxwq5ww3ihfwclst5wxf3pqytbrmau7cl5peszfh@mxj7phhsolfx>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <sryvilbnktnxwq5ww3ihfwclst5wxf3pqytbrmau7cl5peszfh@mxj7phhsolfx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/25/24 14:11, Jacopo Mondi wrote:
> Hi Hans
> 
> On Tue, Jun 25, 2024 at 01:56:46PM GMT, Hans Verkuil wrote:
>> On 6/25/24 13:15, Jacopo Mondi wrote:
>>> Hello again,
>>>
>>> On Mon, Jun 24, 2024 at 03:52:41PM GMT, Hans Verkuil wrote:
>>>> Hi Jacopo,
>>>>
>>>> On 31/05/2024 10:07, Jacopo Mondi wrote:
>>>>> Add the Raspberry Pi PiSP Back End uAPI header.
>>>>>
>>>>> The header defines the data type used to configure the PiSP Back End
>>>>> ISP.
>>>>>
>>>>> The detailed description of the types and of the ISP configuration
>>>>> procedure is available at
>>>>> https://datasheets.raspberrypi.com/camera/raspberry-pi-image-signal-processor-specification.pdf
>>>>>
>>>>> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>>>>> ---
>>>>>  MAINTAINERS                                   |   7 +
>>>>>  .../linux/media/raspberrypi/pisp_be_config.h  | 927 ++++++++++++++++++
>>>>>  .../linux/media/raspberrypi/pisp_common.h     | 199 ++++
>>>>>  3 files changed, 1133 insertions(+)
>>>>>  create mode 100644 include/uapi/linux/media/raspberrypi/pisp_be_config.h
>>>>>  create mode 100644 include/uapi/linux/media/raspberrypi/pisp_common.h
>>>>>
>>>>
>>>> <snip>
>>>>
>>>>> diff --git a/include/uapi/linux/media/raspberrypi/pisp_be_config.h b/include/uapi/linux/media/raspberrypi/pisp_be_config.h
>>>>> new file mode 100644
>>>>> index 000000000000..3eb4be03c5f4
>>>>> --- /dev/null
>>>>> +++ b/include/uapi/linux/media/raspberrypi/pisp_be_config.h
>>>>> @@ -0,0 +1,927 @@
>>>>
>>>> <snip>
>>>>
>>>>> +/**
>>>>> + * struct pisp_be_tiles_config - Raspberry Pi PiSP Back End configuration
>>>>> + * @tiles:	Tile descriptors
>>>>> + * @num_tiles:	Number of tiles
>>>>> + * @config:	PiSP Back End configuration
>>>>> + */
>>>>> +struct pisp_be_tiles_config {
>>>>> +	struct pisp_tile tiles[PISP_BACK_END_NUM_TILES];
>>>>> +	int num_tiles;
>>>>
>>>> Everything else is nicely __u8/16/32, and then there is suddenly an 'int'
>>>> where I would expect to see a __u32.
>>>>
>>>> I think a v10 is needed anyway (see next review), so it would be nice to
>>>> pick up this change for v10.
>>>
>>> Sure I can change it.
>>>
>>> While at it I passed ' struct pisp_be_tiles_config' through pahole.
>>>
>>> struct pisp_be_tiles_config {
>>> 	struct pisp_tile           tiles[64];            /*     0 10240 */
>>> 	/* --- cacheline 160 boundary (10240 bytes) --- */
>>> 	__u32                      num_tiles;            /* 10240     4 */
>>> 	struct pisp_be_config      config;               /* 10244  6276 */
>>>
>>> 	/* size: 16520, cachelines: 259, members: 3 */
>>> 	/* last cacheline: 8 bytes */
>>> };
>>>
>>> if 'config' gets accessed by pointer on aarch64 it will result in an
>>> unaligned access ?
>>
>> Where do you see that? AFAICT it is perfectly fine to have
>> a struct pisp_be_config pointer set to &foo.config.
> 
> 'config' is at 10244 bytes from the struct beginning. If accessed as
> u64 this is not 8-bytes aligned (which afaik is legit but more
> expensive on aarch64). But as the driver accesses it as
> 32-bits integers:

As far I know the 8 byte alignment is only relevant if you need to
read 8-byte values (u64 or pointers): those should be 8 byte aligned.
Which is why the compiler will add padding for a struct like this
on a 64 bit architecture:

	struct foo {
		u32 f1;
		u64 f2;
	};

After f1 there is a 4 byte hole.

But struct pisp_be_config doesn't contain any u64 or pointers, so there
is no need for aligning to 8 bytes.

Regards,

	Hans

> 
> 	unsigned int begin, end;
> 
> 	begin =	offsetof(struct pisp_be_config, global.bayer_order) /
> 		sizeof(u32);
> 	end = sizeof(struct pisp_be_config) / sizeof(u32);
> 	for (unsigned int u = begin; u < end; u++)
> 		pispbe_wr(pispbe, PISP_BE_CONFIG_BASE_REG + sizeof(u32) * u,
> 			  ((u32 *)job->config)[u]);
> 
> this should be fine yes
> 
>>
>> Regards,
>>
>> 	Hans
>>
>>>
>>> Do we need to insert a 32 bits padding between 'num_tiles' and
>>> 'config' ?
>>>
>>>>
>>>> Regards,
>>>>
>>>> 	Hans
>>>>
>>>>> +	struct pisp_be_config config;
>>>>> +} __attribute__((packed));
>>>>> +
>>>>> +#endif /* _UAPI_PISP_BE_CONFIG_H_ */
>>>>
>>
> 


