Return-Path: <linux-media+bounces-16780-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B11A495EF69
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 13:05:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0CAD1C22F54
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 11:05:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4BC215534E;
	Mon, 26 Aug 2024 11:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CtJ5UVN9"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBF715531A;
	Mon, 26 Aug 2024 11:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724670291; cv=none; b=dmZXWJ2P8/AQHxIuxsDMR3U/j+8m2okKH0qDDQfjvfbXa+WHsRXBs0ydUvd8/JpVT9oQVVekqiAJk6aI4mPnypuFsbQqx2vgxr/mP1rf3Cqmdil3zZfJ2948XVyoKtEwY/KMDWLBy62Qgli9aktCoLk9qLoiJueJ48901lGpurM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724670291; c=relaxed/simple;
	bh=2WvVXAlgR6hFVxDqgFaJMyO5Bzv/CRoY35e4IWOH72I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gzPm48myiWk89VMUWJ+j/OtigPkTyoeNHBsF6jsgxTsx6v264Kyw36e+wJvfBnz2tioVrkUVPvglFI3Bgnrhp3adtd56ehaNu+rZef5tyViBN79xRybYNJrXIAWINIHFPavxLI+54fNvk1RJsXUkrl28G/xcjew4me+WYcrto+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CtJ5UVN9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-156-87-48.elisa-laajakaista.fi [91.156.87.48])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5EC6C741;
	Mon, 26 Aug 2024 13:03:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724670221;
	bh=2WvVXAlgR6hFVxDqgFaJMyO5Bzv/CRoY35e4IWOH72I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CtJ5UVN9XU6uwULDRVfa6thAQu9/nHgh+fHFs0+TC6KcRthCQ3C7t9HN3Jo/tQ2SE
	 DAgTNtCgz39vqWrcYFdoV2aJEHBCL7Y0IFuhAB+PUnb2ICPyLV2wKukgJ+oZId5vk1
	 vzPFomzWFtJaAiGOMh8la5wIEPLneqXTRhZ2Uixc=
Message-ID: <2d9c3516-442f-4e41-8620-cc0eaf9b1f03@ideasonboard.com>
Date: Mon, 26 Aug 2024 14:04:44 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] media: sun4i_csi: Don't use
 v4l2_subdev_link_validate() for video device
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-media@vger.kernel.org
Cc: Chen-Yu Tsai <wens@csie.org>, Eugen Hristev
 <eugen.hristev@collabora.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Maxime Ripard <mripard@kernel.org>, Sakari Ailus <sakari.ailus@iki.fi>,
 linux-renesas-soc@vger.kernel.org, linux-sunxi@lists.linux.dev
References: <20240822154531.25912-1-laurent.pinchart+renesas@ideasonboard.com>
 <20240822154531.25912-4-laurent.pinchart+renesas@ideasonboard.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
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
In-Reply-To: <20240822154531.25912-4-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 22/08/2024 18:45, Laurent Pinchart wrote:
> The v4l2_subdev_link_validate() function is a helper designed to
> validate links whose sink is a subdev. When called on a link whose sink
> is a video device, it only prints a warning and returns. Its usage in
> the sun4i_csi driver is wrong, leaving the link from the sub4i_csi
> subdev to the capture video device unvalidated.
> 
> Planned improvements to the v4l2_subdev_link_validate() function will
> turn the warning into an error, breaking the sun4i_csi driver. As an
> interim measure, move the warning to the sun4i_csi driver in a custom
> validation handler, and drop the call to the helper.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Acked-by: Chen-Yu Tsai <wens@csie.org>
> ---
>   drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> index dbb26c7b2f8d..d07e980aba61 100644
> --- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> +++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> @@ -35,8 +35,15 @@ struct sun4i_csi_traits {
>   	bool has_isp;
>   };
>   
> +static int sun4i_csi_video_link_validate(struct media_link *link)
> +{
> +	dev_warn_once(link->graph_obj.mdev->dev,
> +		      "Driver bug: link validation not implemented\n");
> +	return 0;
> +}
> +
>   static const struct media_entity_operations sun4i_csi_video_entity_ops = {
> -	.link_validate = v4l2_subdev_link_validate,
> +	.link_validate = sun4i_csi_video_link_validate,
>   };
>   
>   static const struct media_entity_operations sun4i_csi_subdev_entity_ops = {

I fear this might just leave it broken, but I don't have a better idea.

Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

  Tomi


