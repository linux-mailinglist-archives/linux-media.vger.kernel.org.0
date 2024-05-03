Return-Path: <linux-media+bounces-10673-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B088BA92C
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2024 10:46:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A53A01F22AA7
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2024 08:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3EEB14A0B6;
	Fri,  3 May 2024 08:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BKDT2m8L"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF5B1DFF4;
	Fri,  3 May 2024 08:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714725994; cv=none; b=nZGMgqwxvZmcccM1Yv+QJwfVkHV151hzmLzRutX0Z9rOAUly1FzHZaAFi1Z/NwLiPz/5ymz+hGcjGpOwZVnYTIV9ENJNG2OtvuUE6xleRfNqcQMm+npM9lgycRDnjcIq92ay7ZAOv+L1O+p3U/m8C+7Oqh6M7vWeMoFRt8Dj9F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714725994; c=relaxed/simple;
	bh=80j+8w+MaNNWk/WostRIVGk6yZr2hBPgfxVOKlTVXG8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dgGTOXDOfWXLOEx3aeoi1P0Uby712NZdYHNxF2LYq3JC3oo5vcNrsej0JHThbpJ9f5jv6vOSPwZl2ruYilHRk/c5kiwdDjKUnbl52r/mdruY9DDhWGWznP8AqIe6flUjqbQ2R8YPKGd2nY7QvZX8BHpdgL7JV3pSJD2HjV+K4Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BKDT2m8L; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-152-88-126.elisa-laajakaista.fi [91.152.88.126])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DAFEF593;
	Fri,  3 May 2024 10:45:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714725933;
	bh=80j+8w+MaNNWk/WostRIVGk6yZr2hBPgfxVOKlTVXG8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BKDT2m8Lw/zDvBNOlnNNjOhAB2Hepm0KsaHfsqYSs21XY53sDlaMm8F4HrQO026/h
	 oo94NTHY7zmrt7BKsPKW8mRVMLQJKFU3FytjulYR/wocj0KW7vEFruawQKckkHVqTH
	 qiD+ceuIOPm7N+u9zsULJ4X6aSpklfZIq+J1l+nI=
Message-ID: <3d7396c0-7dad-4485-86d3-227843aee4c6@ideasonboard.com>
Date: Fri, 3 May 2024 11:46:28 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/19] media: adv748x: Use V4L2 streams
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20240430103956.60190-1-jacopo.mondi@ideasonboard.com>
 <20240430103956.60190-4-jacopo.mondi@ideasonboard.com>
 <20240502174051.GI15807@pendragon.ideasonboard.com>
 <zn6rpirerkwdfuoeasduiupjiv43fawecj73tqquudya5mndxm@wgdwjjwcs6kj>
 <20240503083156.GP4959@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 xsFNBE6ms0cBEACyizowecZqXfMZtnBniOieTuFdErHAUyxVgtmr0f5ZfIi9Z4l+uUN4Zdw2
 wCEZjx3o0Z34diXBaMRJ3rAk9yB90UJAnLtb8A97Oq64DskLF81GCYB2P1i0qrG7UjpASgCA
 Ru0lVvxsWyIwSfoYoLrazbT1wkWRs8YBkkXQFfL7Mn3ZMoGPcpfwYH9O7bV1NslbmyJzRCMO
 eYV258gjCcwYlrkyIratlHCek4GrwV8Z9NQcjD5iLzrONjfafrWPwj6yn2RlL0mQEwt1lOvn
 LnI7QRtB3zxA3yB+FLsT1hx0va6xCHpX3QO2gBsyHCyVafFMrg3c/7IIWkDLngJxFgz6DLiA
 G4ld1QK/jsYqfP2GIMH1mFdjY+iagG4DqOsjip479HCWAptpNxSOCL6z3qxCU8MCz8iNOtZk
 DYXQWVscM5qgYSn+fmMM2qN+eoWlnCGVURZZLDjg387S2E1jT/dNTOsM/IqQj+ZROUZuRcF7
 0RTtuU5q1HnbRNwy+23xeoSGuwmLQ2UsUk7Q5CnrjYfiPo3wHze8avK95JBoSd+WIRmV3uoO
 rXCoYOIRlDhg9XJTrbnQ3Ot5zOa0Y9c4IpyAlut6mDtxtKXr4+8OzjSVFww7tIwadTK3wDQv
 Bus4jxHjS6dz1g2ypT65qnHen6mUUH63lhzewqO9peAHJ0SLrQARAQABzTBUb21pIFZhbGtl
 aW5lbiA8dG9taS52YWxrZWluZW5AaWRlYXNvbmJvYXJkLmNvbT7CwY4EEwEIADgWIQTEOAw+
 ll79gQef86f6PaqMvJYe9QUCX/HruAIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRD6
 PaqMvJYe9WmFD/99NGoD5lBJhlFDHMZvO+Op8vCwnIRZdTsyrtGl72rVh9xRfcSgYPZUvBuT
 VDxE53mY9HaZyu1eGMccYRBaTLJSfCXl/g317CrMNdY0k40b9YeIX10feiRYEWoDIPQ3tMmA
 0nHDygzcnuPiPT68JYZ6tUOvAt7r6OX/litM+m2/E9mtp8xCoWOo/kYO4mOAIoMNvLB8vufi
 uBB4e/AvAjtny4ScuNV5c5q8MkfNIiOyag9QCiQ/JfoAqzXRjVb4VZG72AKaElwipiKCWEcU
 R4+Bu5Qbaxj7Cd36M/bI54OrbWWETJkVVSV1i0tghCd6HHyquTdFl7wYcz6cL1hn/6byVnD+
 sR3BLvSBHYp8WSwv0TCuf6tLiNgHAO1hWiQ1pOoXyMEsxZlgPXT+wb4dbNVunckwqFjGxRbl
 Rz7apFT/ZRwbazEzEzNyrBOfB55xdipG/2+SmFn0oMFqFOBEszXLQVslh64lI0CMJm2OYYe3
 PxHqYaztyeXsx13Bfnq9+bUynAQ4uW1P5DJ3OIRZWKmbQd/Me3Fq6TU57LsvwRgE0Le9PFQs
 dcP2071rMTpqTUteEgODJS4VDf4lXJfY91u32BJkiqM7/62Cqatcz5UWWHq5xeF03MIUTqdE
 qHWk3RJEoWHWQRzQfcx6Fn2fDAUKhAddvoopfcjAHfpAWJ+ENc7BTQROprNHARAAx0aat8GU
 hsusCLc4MIxOQwidecCTRc9Dz/7U2goUwhw2O5j9TPqLtp57VITmHILnvZf6q3QAho2QMQyE
 DDvHubrdtEoqaaSKxKkFie1uhWNNvXPhwkKLYieyL9m2JdU+b88HaDnpzdyTTR4uH7wk0bBa
 KbTSgIFDDe5lXInypewPO30TmYNkFSexnnM3n1PBCqiJXsJahE4ZQ+WnV5FbPUj8T2zXS2xk
 0LZ0+DwKmZ0ZDovvdEWRWrz3UzJ8DLHb7blPpGhmqj3ANXQXC7mb9qJ6J/VSl61GbxIO2Dwb
 xPNkHk8fwnxlUBCOyBti/uD2uSTgKHNdabhVm2dgFNVuS1y3bBHbI/qjC3J7rWE0WiaHWEqy
 UVPk8rsph4rqITsj2RiY70vEW0SKePrChvET7D8P1UPqmveBNNtSS7In+DdZ5kUqLV7rJnM9
 /4cwy+uZUt8cuCZlcA5u8IsBCNJudxEqBG10GHg1B6h1RZIz9Q9XfiBdaqa5+CjyFs8ua01c
 9HmyfkuhXG2OLjfQuK+Ygd56mV3lq0aFdwbaX16DG22c6flkkBSjyWXYepFtHz9KsBS0DaZb
 4IkLmZwEXpZcIOQjQ71fqlpiXkXSIaQ6YMEs8WjBbpP81h7QxWIfWtp+VnwNGc6nq5IQDESH
 mvQcsFS7d3eGVI6eyjCFdcAO8eMAEQEAAcLBXwQYAQIACQUCTqazRwIbDAAKCRD6PaqMvJYe
 9fA7EACS6exUedsBKmt4pT7nqXBcRsqm6YzT6DeCM8PWMTeaVGHiR4TnNFiT3otD5UpYQI7S
 suYxoTdHrrrBzdlKe5rUWpzoZkVK6p0s9OIvGzLT0lrb0HC9iNDWT3JgpYDnk4Z2mFi6tTbq
 xKMtpVFRA6FjviGDRsfkfoURZI51nf2RSAk/A8BEDDZ7lgJHskYoklSpwyrXhkp9FHGMaYII
 m9EKuUTX9JPDG2FTthCBrdsgWYPdJQvM+zscq09vFMQ9Fykbx5N8z/oFEUy3ACyPqW2oyfvU
 CH5WDpWBG0s5BALp1gBJPytIAd/pY/5ZdNoi0Cx3+Z7jaBFEyYJdWy1hGddpkgnMjyOfLI7B
 CFrdecTZbR5upjNSDvQ7RG85SnpYJTIin+SAUazAeA2nS6gTZzumgtdw8XmVXZwdBfF+ICof
 92UkbYcYNbzWO/GHgsNT1WnM4sa9lwCSWH8Fw1o/3bX1VVPEsnESOfxkNdu+gAF5S6+I6n3a
 ueeIlwJl5CpT5l8RpoZXEOVtXYn8zzOJ7oGZYINRV9Pf8qKGLf3Dft7zKBP832I3PQjeok7F
 yjt+9S+KgSFSHP3Pa4E7lsSdWhSlHYNdG/czhoUkSCN09C0rEK93wxACx3vtxPLjXu6RptBw
 3dRq7n+mQChEB1am0BueV1JZaBboIL0AGlSJkm23kw==
In-Reply-To: <20240503083156.GP4959@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/05/2024 11:31, Laurent Pinchart wrote:

>>>> +}
>>>> +
>>>> +/*
>>>>    * We use the internal registered operation to be able to ensure that our
>>>>    * incremental subdevices (not connected in the forward path) can be registered
>>>>    * against the resulting video path and media device.
>>>> @@ -109,6 +132,7 @@ static int adv748x_csi2_registered(struct v4l2_subdev *sd)
>>>>   }
>>>>
>>>>   static const struct v4l2_subdev_internal_ops adv748x_csi2_internal_ops = {
>>>> +	.init_state = adv748x_csi2_init_state,
>>>
>>> The .init_state() operation needs to be provided along with the call to
>>> v4l2_subdev_init_finalize() in patch 01/19.
>>
>> I'll squash, however even if it might be a requirement for having a
>> fully working implementation, not having init_state() will not lead to
>> any crash and maybe smaller incremental patches are easier to handle.
>>
>> 	if (sd->internal_ops && sd->internal_ops->init_state) {
>> 		/*
>> 		 * There can be no race at this point, but we lock the state
>> 		 * anyway to satisfy lockdep checks.
>> 		 */
>> 		v4l2_subdev_lock_state(state);
>> 		ret = sd->internal_ops->init_state(sd, state);
>> 		v4l2_subdev_unlock_state(state);
> 
> I think it's a mistake in the core to not require .init_state() for
> subdevs using the active state. Tomi, what do you think ?

If I'm not mistaken, the v4l2 rules say that a subdev configuration 
should always be a valid one (for that specific device). To fulfill 
that, you need .init_state().

So yes, I agree. This is probably one more thing that can be added to 
the "[PATCH v6 03/11] media: subdev: Add checks for subdev features".

  Tomi


