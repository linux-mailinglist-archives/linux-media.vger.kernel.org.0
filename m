Return-Path: <linux-media+bounces-45448-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 78327C03B93
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 00:54:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E86193AAFF0
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 22:53:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05D3C2BDC1B;
	Thu, 23 Oct 2025 22:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="Ld0msfZ0"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8804F29C326
	for <linux-media@vger.kernel.org>; Thu, 23 Oct 2025 22:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761260023; cv=none; b=ILURwobiFjsElyxpN3fuHMLRUWa2t2soAAaGvC+Gm09CTgG2TzcT+XC8w6muREK9qs9Opm5up+1gntRz8wyVTNvkvleMiaWKPCKMIrisUuNT3TSy6dv6IR8bjPowTymkjuAmGnPNeF8vv7r4e9JFDbL50RxGaHEn9RaMNzsJRBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761260023; c=relaxed/simple;
	bh=DCAF7TtHftTvDj1OSSV058dCzxlVEwOr29KkxAHMvfQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tz7vauCEi1sW+BOubK/EXPaAzRcuIUJ9ZNbLec52yma8k23+3824sFtj57PihUWOfKway47mhqVAtbiQbS4QvCvbNWHSE5YQfFASWqXUQP6rdPKk+HUMkJSOwijeh1ut01v6XIUCp5Ni5/wGloY5duLqNjaoR/R1rO9xV8caZss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=Ld0msfZ0; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1761260013;
 bh=AG2rFEpBv1gq95qUgCmaFP4trd4HB0CSXHRiD4voN58=;
 b=Ld0msfZ0tariHjuUPM5iQccX9hPHoj14dldgEM2PlnTKI8nVXvhZie8IjcLikHgbnEstYJ394
 foawQkYy7GfJ0e6hHa6Uf85bf7hSUOJXEz3pHY3YhYjhTA2zCFLdnIGEIK3jHW+PFIDQjTIxgzH
 B7rUxCOUJMaVty1rOLt5lIxDar4FgF8Z7UJ9oV36u/fpMh1i3UJOlBU+AK5sUvC4NkrZb5MxnUE
 RztFEhIqdUQdvzaugZHS9+0hZE07AWiemB4lFv/wTxviRYZOlMofnRdnFPt4Y6K+kt4dcj7waDy
 4h5C3bmt7/9UfNpvlgQaRQDyFIXFI18nq8xExlJ5OX+A==
X-Forward-Email-ID: 68fab1e82a3297951990cdf1
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.3.0
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <d28c81b0-3d50-46f7-876e-d634bcab2cd0@kwiboo.se>
Date: Fri, 24 Oct 2025 00:53:20 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/15] media: rkvdec: Add H264 support for the VDPU381
 variant
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Heiko Stuebner <heiko@sntech.de>, Ricardo Ribalda <ribalda@chromium.org>,
 Hans Verkuil <hverkuil@kernel.org>, Hans de Goede <hansg@kernel.org>,
 Yunke Cao <yunkec@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 James Cowgill <james.cowgill@blaize.com>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Diederik de Haas <didi.debian@cknow.org>, linux-kernel@vger.kernel.org
References: <20251023214247.459931-1-detlev.casanova@collabora.com>
 <20251023214247.459931-13-detlev.casanova@collabora.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20251023214247.459931-13-detlev.casanova@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Detlev,

On 10/23/2025 11:42 PM, Detlev Casanova wrote:
> This decoder variant is found in Rockchip RK3588 SoC family.
> 
> Like for rkvdec on rk3399, it supports the NV12, NV15, NV16 and NV20
> output formats and level up to 5.1.
> 
> The maximum width and height have been significantly increased
> supporting up to 65520 pixels for both.
> 
> Also make sure to only expose the first core and ignore the other
> until mutli-core is supported.
> 
> Fluster score for JVT-AVC_V1 is 129/135.
> 
> Tested-by: Diederik de Haas <didi.debian@cknow.org>  # Rock 5B
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>  .../media/platform/rockchip/rkvdec/Makefile   |   1 +
>  .../rockchip/rkvdec/rkvdec-h264-common.h      |   2 +
>  .../rockchip/rkvdec/rkvdec-vdpu381-h264.c     | 469 ++++++++++++++++++
>  .../rockchip/rkvdec/rkvdec-vdpu381-regs.h     | 427 ++++++++++++++++
>  .../media/platform/rockchip/rkvdec/rkvdec.c   | 127 +++++
>  .../media/platform/rockchip/rkvdec/rkvdec.h   |   4 +
>  6 files changed, 1030 insertions(+)
>  create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c
>  create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-regs.h

[snip]

> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> index f043b07c8e7d..bc3e35b82a11 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c

[snip]

> +/*
> + * Some SoCs, like RK3588 have multiple identical VDPU cores, but the
> + * kernel is currently missing support for multi-core handling. Exposing
> + * separate devices for each core to userspace is bad, since that does
> + * not allow scheduling tasks properly (and creates ABI). With this workaround
> + * the driver will only probe for the first core and early exit for the other
> + * cores. Once the driver gains multi-core support, the same technique
> + * for detecting the first core can be used to cluster all cores together.
> + */
> +static int rkvdec_disable_multicore(struct rkvdec_dev *rkvdec)
> +{
> +	struct device_node *node = NULL;
> +	const char *compatible;
> +	bool is_first_core;
> +	int ret;
> +
> +	/* Intentionally ignores the fallback strings */
> +	ret = of_property_read_string(rkvdec->dev->of_node, "compatible", &compatible);
> +	if (ret)
> +		return ret;
> +
> +	/* The first compatible and available node found is considered the main core */
> +	do {
> +		node = of_find_compatible_node(node, NULL, compatible);
> +		if (of_device_is_available(node))
> +			break;
> +	} while (node);
> +
> +	if (!node)
> +		return -EINVAL;
> +
> +	is_first_core = (rkvdec->dev->of_node == node);
> +
> +	of_node_put(node);
> +
> +	if (!is_first_core) {
> +		dev_info(rkvdec->dev, "missing multi-core support, ignoring this instance\n");
> +		return -ENODEV;
> +	}
> +
> +	return 0;
> +}

The addition of rkvdec_disable_multicore should probably be split into a
separate patch.

Please leave some more time for review before sending next version. I
will try to do a more in depth review of this series this weekend, more
feedback will follow.

Regards,
Jonas

[snip]

