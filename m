Return-Path: <linux-media+bounces-14103-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3599166B7
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2024 13:58:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0DE811C23451
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2024 11:58:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 088E614D712;
	Tue, 25 Jun 2024 11:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="lQYlB6rs"
X-Original-To: linux-media@vger.kernel.org
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB2014B96A
	for <linux-media@vger.kernel.org>; Tue, 25 Jun 2024 11:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719316680; cv=none; b=YAPG4PO0PHsmfyr7M+S+d6wudVwkE4Q07WsL0YXq7lHfhjahqThLzjIJeJ3DNVmos+62f1BZYtx7GSzY3lbagd8KwdVMZLqu8sbPCEuqkGGkwyHvUP1zoW21MusmOIdY6lqhZGR3u/c8y+oLxjYBQskD51gpg+QOEtvHvjABmYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719316680; c=relaxed/simple;
	bh=c82FqMTO1ZfOKIqHA0KgLgcdSEz921B9A93YjWyHSso=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rKtnEgMWgbHEtmdnNR2o30udddCs3LPE09zXXAlEPV/k3EJS4YUwJIdH+hkE1cIVOzFTZhNEI9NFqdSSu1KmXYN52lzCZ4VEVeH9riVKXS7AGoa2oiCaSHQpabFHmbqmbgRVoAXbM20difHFiEc8+JPYYa8fplvqU1RYKr9u8/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=lQYlB6rs; arc=none smtp.client-ip=195.121.94.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
X-KPN-MessageId: fef49862-32e9-11ef-adc1-005056994fde
Received: from smtp.kpnmail.nl (unknown [10.31.155.5])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id fef49862-32e9-11ef-adc1-005056994fde;
	Tue, 25 Jun 2024 13:56:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=content-type:from:to:subject:mime-version:date:message-id;
	bh=dqXH1RUwj1LYK4SyytEYny9kED6sa5DXjekCJj7IdBc=;
	b=lQYlB6rsA7RWSNUuOttPPQ8GFuzA0qlmCmCI0dalbwSz03qJQLcMvQUv/uhvJYonYgcxCZhio9PSN
	 2qyXr1dKk8WCN6fvGS0sUnWDDgoKxyWhgx9RxfHU0whJynKS6SoxyvTmRLneM2fhGvD3vdJpXHlFhy
	 2EewcV0oArvObF55PgnihaElwUuAy+HqWnAznDebWRYFfiGH3mmZkx86u2pcFybFn9n6avezUTTpy0
	 H0qmvVW993RpEk3mvY8ZMdRkdazVXmI/Zh3al+/RF60EE1GikJetWnC3MJODnmEiY6bQSUiytQRHUW
	 sMWnka71KI97iOd4z6DzaSffFxbp4eA==
X-KPN-MID: 33|l2UHxuO1nYtzTTr/EFBAdjnH9cKcj7l3du8zACtoL06DbshGak7BGjIlp7KKiXD
 T2KLsBQ8CBotDWl6hi8dwW+6uNy7EbzdQbbg/FN7YhdA=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|wwSaXCWPRiei6d1UUAIR5pOHp+pr2sbGu/5Wc+bEvfpIFewjrT1rdTkOZhPZVdk
 EOoG/UMp5vrQNLHlxyuD48g==
Received: from [10.47.75.249] (unknown [173.38.220.48])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id ffa5c985-32e9-11ef-8b56-00505699b758;
	Tue, 25 Jun 2024 13:56:47 +0200 (CEST)
Message-ID: <cb4763da-a5e3-4c95-9233-28605e0cbef2@xs4all.nl>
Date: Tue, 25 Jun 2024 13:56:46 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/8] media: uapi: Add Raspberry Pi PiSP Back End uAPI
Content-Language: en-US
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
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
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <eg2k2zjqw5n65zdp33zpzpli5qrvtrsj5yykkn5e7wukoap5uv@adcsxiffppbg>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/25/24 13:15, Jacopo Mondi wrote:
> Hello again,
> 
> On Mon, Jun 24, 2024 at 03:52:41PM GMT, Hans Verkuil wrote:
>> Hi Jacopo,
>>
>> On 31/05/2024 10:07, Jacopo Mondi wrote:
>>> Add the Raspberry Pi PiSP Back End uAPI header.
>>>
>>> The header defines the data type used to configure the PiSP Back End
>>> ISP.
>>>
>>> The detailed description of the types and of the ISP configuration
>>> procedure is available at
>>> https://datasheets.raspberrypi.com/camera/raspberry-pi-image-signal-processor-specification.pdf
>>>
>>> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>>> ---
>>>  MAINTAINERS                                   |   7 +
>>>  .../linux/media/raspberrypi/pisp_be_config.h  | 927 ++++++++++++++++++
>>>  .../linux/media/raspberrypi/pisp_common.h     | 199 ++++
>>>  3 files changed, 1133 insertions(+)
>>>  create mode 100644 include/uapi/linux/media/raspberrypi/pisp_be_config.h
>>>  create mode 100644 include/uapi/linux/media/raspberrypi/pisp_common.h
>>>
>>
>> <snip>
>>
>>> diff --git a/include/uapi/linux/media/raspberrypi/pisp_be_config.h b/include/uapi/linux/media/raspberrypi/pisp_be_config.h
>>> new file mode 100644
>>> index 000000000000..3eb4be03c5f4
>>> --- /dev/null
>>> +++ b/include/uapi/linux/media/raspberrypi/pisp_be_config.h
>>> @@ -0,0 +1,927 @@
>>
>> <snip>
>>
>>> +/**
>>> + * struct pisp_be_tiles_config - Raspberry Pi PiSP Back End configuration
>>> + * @tiles:	Tile descriptors
>>> + * @num_tiles:	Number of tiles
>>> + * @config:	PiSP Back End configuration
>>> + */
>>> +struct pisp_be_tiles_config {
>>> +	struct pisp_tile tiles[PISP_BACK_END_NUM_TILES];
>>> +	int num_tiles;
>>
>> Everything else is nicely __u8/16/32, and then there is suddenly an 'int'
>> where I would expect to see a __u32.
>>
>> I think a v10 is needed anyway (see next review), so it would be nice to
>> pick up this change for v10.
> 
> Sure I can change it.
> 
> While at it I passed ' struct pisp_be_tiles_config' through pahole.
> 
> struct pisp_be_tiles_config {
> 	struct pisp_tile           tiles[64];            /*     0 10240 */
> 	/* --- cacheline 160 boundary (10240 bytes) --- */
> 	__u32                      num_tiles;            /* 10240     4 */
> 	struct pisp_be_config      config;               /* 10244  6276 */
> 
> 	/* size: 16520, cachelines: 259, members: 3 */
> 	/* last cacheline: 8 bytes */
> };
> 
> if 'config' gets accessed by pointer on aarch64 it will result in an
> unaligned access ?

Where do you see that? AFAICT it is perfectly fine to have
a struct pisp_be_config pointer set to &foo.config.

Regards,

	Hans

> 
> Do we need to insert a 32 bits padding between 'num_tiles' and
> 'config' ?
> 
>>
>> Regards,
>>
>> 	Hans
>>
>>> +	struct pisp_be_config config;
>>> +} __attribute__((packed));
>>> +
>>> +#endif /* _UAPI_PISP_BE_CONFIG_H_ */
>>


