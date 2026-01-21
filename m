Return-Path: <linux-media+bounces-51186-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INUyKI2CcGktYAAAu9opvQ
	(envelope-from <linux-media+bounces-51186-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 08:38:53 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EF252E78
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 08:38:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5AC8A407F94
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 07:38:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B260B44D020;
	Wed, 21 Jan 2026 07:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QXbswDHc"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDBA35B157;
	Wed, 21 Jan 2026 07:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768981118; cv=none; b=XWKcwjHOJUkYMk8BmWNhhCoSoiwz+ZRZaXt8Avh0QG4k3KpfYLakeDaLnY/eWUaD0fjrszXsZz7YFQ9OuqRSPB9wmRx8SWJ0I9CytCvGtBdwFKBvIAkRI32blw4DZ+4huCLIaeEJJdWvPbgAL1kHTONI/GxAA8/6Gi/FSj+laYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768981118; c=relaxed/simple;
	bh=UHc7ueUDCEpy7ONCEVksJtThb6F/H86H1QxSCpvVSrE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aesNaaKKVbePoOWelCmBBqYCHAMurQFHUW9nMa6YXIA6ZES8eQAneWdiyLf3r+EKcVaj6fI9nLDA18KEeYpjVp5Jg4QWfJwke4E80hOMFsJlBTf5KXeKUp9D+LxdyQrdDOg+B8cS8UcOGiJYmywA+pUt6E170SsNcT2N/uT4WMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QXbswDHc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 149D1593;
	Wed, 21 Jan 2026 08:38:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768981082;
	bh=UHc7ueUDCEpy7ONCEVksJtThb6F/H86H1QxSCpvVSrE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QXbswDHcnefj5ZQfKhOCecIJOeEUP6ozeU/a4T3uggWkTRDZUIWqZhbrH6Smd7xwp
	 /WUgtUaAgzddU9IUwdaOi62wKtv48NDAS6eNNliN3F5K6/SpxCN/DcPAmPK3MxwcLJ
	 XAnKlC0lnbJqafXmZWkBvrwAUozrl03ODI14XZ/U=
Message-ID: <8b8e603f-5d04-44ce-91ab-85df8fe0ae94@ideasonboard.com>
Date: Wed, 21 Jan 2026 09:38:29 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 06/19] media: ti: j721e-csi2rx: add a subdev for the
 core device
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, y-abhilashchandra@ti.com,
 devarsht@ti.com, s-jain1@ti.com, vigneshr@ti.com, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, p.zabel@pengutronix.de,
 conor+dt@kernel.org, hverkuil-cisco@xs4all.nl,
 changhuang.liang@starfivetech.com, jack.zhu@starfivetech.com,
 sjoerd@collabora.com, dan.carpenter@linaro.org, hverkuil+cisco@kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, jai.luthra@linux.dev, mripard@kernel.org,
 Rishikesh Donadkar <r-donadkar@ti.com>
References: <20251230083220.2405247-1-r-donadkar@ti.com>
 <20251230083220.2405247-7-r-donadkar@ti.com>
 <ee8152c0-daf5-48dd-a2d1-2fafcfeca797@ideasonboard.com>
 <176845899846.9154.18009615769864845946@freya>
 <d9f3335a-d8f4-40cc-b4c4-a93b797a89fd@ideasonboard.com>
 <20260120232521.GE173080@killaraus>
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
In-Reply-To: <20260120232521.GE173080@killaraus>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-51186-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,linux.intel.com,ti.com,kernel.org,pengutronix.de,xs4all.nl,starfivetech.com,collabora.com,linaro.org,vger.kernel.org,linux.dev];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[ideasonboard.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,ideasonboard.com:mid,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: 53EF252E78
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 21/01/2026 01:25, Laurent Pinchart wrote:
> On Thu, Jan 15, 2026 at 02:56:21PM +0200, Tomi Valkeinen wrote:
>> On 15/01/2026 08:36, Jai Luthra wrote:
>>> Quoting Tomi Valkeinen (2026-01-14 20:51:49)
>>>> On 30/12/2025 10:32, Rishikesh Donadkar wrote:
>>>>> From: Jai Luthra <j-luthra@ti.com>
>>>>>
>>>>> With single stream capture, it was simpler to use the video device as
>>>>> the media entity representing the main TI CSI2RX device. Now with multi
>>>>> stream capture coming into the picture, the model has shifted to each
>>>>> video device having a link to the main device's subdev. The routing
>>>>> would then be set on this subdev.
>>>>>
>>>>> Add this subdev, link each context to this subdev's entity and link the
>>>>> subdev's entity to the source. Also add an array of media pads. It will
>>>>> have one sink pad and source pads equal to the number of contexts.
>>>>>
>>>>> Support the new enable_stream()/disable_stream() APIs in the subdev
>>>>> instead of s_stream() hook.
>>>>>
>>>>> Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
>>>>> Co-developed-by: Pratyush Yadav <p.yadav@ti.com>
>>>>> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
>>>>> Signed-off-by: Jai Luthra <j-luthra@ti.com>
>>>>> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
>>>>> ---
>>>
>>> [...]
>>>
>>>>> @@ -981,48 +1138,52 @@ static int ti_csi2rx_link_validate(struct media_link *link)
>>>>>       struct ti_csi2rx_ctx *ctx = container_of(vdev, struct ti_csi2rx_ctx, vdev);
>>>>>       struct ti_csi2rx_dev *csi = ctx->csi;
>>>>>       struct v4l2_pix_format *csi_fmt = &ctx->v_fmt.fmt.pix;
>>>>> -     struct v4l2_subdev_format source_fmt = {
>>>>> -             .which  = V4L2_SUBDEV_FORMAT_ACTIVE,
>>>>> -             .pad    = link->source->index,
>>>>> -     };
>>>>> +     struct v4l2_mbus_framefmt *format;
>>>>> +     struct v4l2_subdev_state *state;
>>>>>       const struct ti_csi2rx_fmt *ti_fmt;
>>>>> -     int ret;
>>>>>  
>>>>> -     ret = v4l2_subdev_call_state_active(csi->source, pad,
>>>>> -                                         get_fmt, &source_fmt);
>>>>> -     if (ret)
>>>>> -             return ret;
>>>>> +     state = v4l2_subdev_lock_and_get_active_state(&csi->subdev);
>>>>> +     format = v4l2_subdev_state_get_format(state, link->source->index, 0);
>>>>> +     v4l2_subdev_unlock_state(state);
>>>>>  
>>>>> -     if (source_fmt.format.width != csi_fmt->width) {
>>>>> +     if (!format) {
>>>>> +             dev_dbg(csi->dev,
>>>>> +                     "Skipping validation as no format present on \"%s\":%u:0\n",
>>>>> +                     link->source->entity->name, link->source->index);
>>>>> +             return 0;
>>>>
>>>> Isn't this an error?
>>>
>>> Well, the j7 shim subdev introduced here has immutable and active links to
>>> all the video nodes, for each DMA channel (taken from DT), many of which
>>> may be unused for certain setups, and thus there might not be any valid
>>> format on the subdev source pad corresponding to an unused video node.
>>>
>>> Jacopo had a similar comment on v2, see this discussion (grep for Mali):
>>> https://lore.kernel.org/linux-media/4mnlnsj4co3agvln4qsasmgvgwiyoo7yu2h5wyh4rmzzafhm5u@avhnbw7iknms/
>>>
>>> I know other drivers use a different approach with mutable links, so it
>>> would be good if you/Laurent/Sakari can give your opinions on if only one
>>> of these two approaches should be taken for multi-stream pipelines.
>>
>> I see.
>>
>> Well, I don't have a definite answer. With some thinking both options
>> make certain sense. It makes sense to keep the links immutable and
>> always enabled, as there's no configuration that can be done. On the
>> other hand, it makes sense to require the unused links to be disabled,
>> as, well, they are not used.
> 
> I'm not familiar with the implications this would have on this driver,
> but generally speaking, if a stream is added to the media pipeline by
> the pipeline build algorithm, then it is expected that applications
> would have configured it correctly. Streams that are not used are
> expected to be disabled if they would otherwise be added to the
> pipeline.
> 

I think the thing here is that the driver creates immutable
always-enabled media links between the videodevs and the first subdev.
Then, say, if only one stream is being used, only one of those links is
actually used, and for every other link the above check fails as there's
no stream, so no format.

In TI CAL driver the links were mutable, and unused links had to be
disabled. There it made sense as the links had to be configurable (there
were two PHYs). Here, there's no configuration needed, so immutable
links make sense, but then they're enabled even when actually not used.

 Tomi


