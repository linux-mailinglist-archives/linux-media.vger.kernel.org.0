Return-Path: <linux-media+bounces-25250-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13075A1B0A6
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 08:04:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3FE8316C993
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 07:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03C231DAC9D;
	Fri, 24 Jan 2025 07:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="J8sPbWZL"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-78.smtpout.orange.fr [80.12.242.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9856433998;
	Fri, 24 Jan 2025 07:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737702252; cv=none; b=HLObpwsXQRkYIjPYRtaw/4C0adL6rrlzE0sayM0hTdd11mETpAsD3eyNm7ZOpS6KDo0RCVwL6fn+dN3S+8I92sBICc1wbslB4HsIDAWb1jjgxiY8++qehj1MdAezIZvhG0s41vcXeqqxMe+j3c31ctuc+btzmhX72nAfBnhYlxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737702252; c=relaxed/simple;
	bh=GgW2/D4yaq/fiGHy0bZN9IabtyRumJfW5G71kCpkooA=;
	h=Message-ID:Date:MIME-Version:Subject:References:From:To:Cc:
	 In-Reply-To:Content-Type; b=i3Vph0RI3Yr5O5DEbyHGbHrJz4+9dhkRtbIUpOzlPNkK7rLqm7VTfTBWQAUGEDHnQPMEGdO9TUhc66AOzm6NZQeF/TBQWMMmP8uq6bdhV1X1lXxcT5b0olfmnOv5Z33F+FfSQtOtkMrwGv1o4y/4kpqUGBKjiziKrsK7BWdLuss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=J8sPbWZL; arc=none smtp.client-ip=80.12.242.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id bDjStVgOWhA80bDjWtURpi; Fri, 24 Jan 2025 08:04:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1737702247;
	bh=dP36wT0+ULcEP3ejbuA9WU3UTE7UMDb+CYEKCW22q3k=;
	h=Message-ID:Date:MIME-Version:Subject:From:To;
	b=J8sPbWZLBAntJBxGTp+pSHiFdBNWrcMBuC6lMHFkld0X3qpFWV6rnfL9GUKZidrO2
	 8hXVP6SZDrMGFNqEjmWjl9Kec+Ykc0u0Q4VPJCpekJ+GKU3GVSUXLL+HrpXum/2ZfV
	 Mt0aAtI25sUflNlHJBg0LCoOhliJpGx+lnSoN7Kn5l4iRaEX0O8XR2q9coo5a6YmyR
	 Vgpcx06JX4rXNOSv5wcZod9bwZ79ZgJ9lUpyGUlBcjmEFqFRnWhXSC+N7bGfz0TcAB
	 HjuiW09sClZqOiFiAF8rezNOknc4b+pLz8kPf3xWGgXMWHQ9lcRHIukqSBZF6/vEpE
	 xt1+uFVwgEw8Q==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Fri, 24 Jan 2025 08:04:07 +0100
X-ME-IP: 90.11.132.44
Message-ID: <80e942c1-4814-4bd9-98cc-eeb0f5ee5a6b@wanadoo.fr>
Date: Fri, 24 Jan 2025 08:03:58 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] media: ox05b1s: Add support for Omnivision OS08A20
 raw sensor
References: <20250124001243.446511-1-mirela.rabulea@nxp.com>
 <20250124001243.446511-5-mirela.rabulea@nxp.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Mirela Rabulea <mirela.rabulea@nxp.com>
Cc: LnxRevLi@nxp.com, alain.volmat@foss.st.com,
 alexander.stein@ew.tq-group.com, alice.yuan@nxp.com,
 bryan.odonoghue@linaro.org, conor+dt@kernel.org,
 dave.stevenson@raspberrypi.com, devicetree@vger.kernel.org,
 festevam@denx.de, hdegoede@redhat.com, hverkuil-cisco@xs4all.nl,
 julien.vuillaumier@nxp.com, kieran.bingham@ideasonboard.com,
 krzk+dt@kernel.org, laurent.pinchart+renesas@ideasonboard.com,
 laurentiu.palcu@nxp.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, mchehab@kernel.org, mike.rudenko@gmail.com,
 robert.chiras@nxp.com, robh@kernel.org, sakari.ailus@linux.intel.com,
 umang.jain@ideasonboard.com, zhi.mao@mediatek.com
In-Reply-To: <20250124001243.446511-5-mirela.rabulea@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 24/01/2025 à 01:12, Mirela Rabulea a écrit :
> This is an 8 megapixel raw10/raw12 sensor with HDR capabilities.
> HDR mode control is supported, with one HDR mode: staggered HDR
> with 2 exposures on separate virtual channels. However, for now,
> only one exposure (VC 0) is accessible via get_frame_desc.
> 
> Supported resolutions:
>     - 1920 x 1080 @ 60fps (SBGGR10, no HDR)
>     - 1920 x 1080 @ 30fps (SBGGR10, HDR)
>     - 3840 x 2160 @ 30fps (SBGGR12, no HDR)
>     - 3840 x 2160 @ 15fps (SBGGR12, HDR)
>     - 3840 x 2160 @ 30fps (SBGGR10, no HDR)
>     - 3840 x 2160 @ 15fps (SBGGR10, HDR)
> 
> Signed-off-by: Mirela Rabulea <mirela.rabulea-3arQi8VN3Tc@public.gmane.org>

...

> +/* Common register configuration for Omnivision OS08A20 raw camera */
> +struct ox05b1s_reg os08a20_init_setting_common[] = {
> +	{ 0x3605, 0x50 },
> +	{ 0x3610, 0x39 },
> +	{ 0x375e, 0x0b },
> +	{ 0x5001, 0x42 },
> +	{ 0x5005, 0x00 },
> +	{ /* sentinel*/ },

No need for ending comma.
The struct could maybe be const.

> +};
> +
> +/* Common register configuration for Omnivision OS08A20 10 bit */
> +struct ox05b1s_reg os08a20_init_setting_10bit[] = {
> +	{ 0x031e, 0x09 },
> +	{ 0x3609, 0xb5 },
> +	{ 0x3660, 0x43 },
> +	{ 0x3706, 0x35 },
> +	{ 0x370a, 0x00 },
> +	{ 0x370b, 0x98 },
> +	{ 0x3709, 0x49 },
> +	{ /* sentinel*/ },

No need for ending comma.
The struct could maybe be const.

> +};
> +
> +/* Common register configuration for Omnivision OS08A20 12 bit */
> +struct ox05b1s_reg os08a20_init_setting_12bit[] = {
> +	{ 0x031e, 0x0a },
> +	{ 0x3609, 0xdb },
> +	{ 0x3660, 0xd3 },
> +	{ 0x3706, 0x6a },
> +	{ 0x370a, 0x01 },
> +	{ 0x370b, 0x30 },
> +	{ 0x3709, 0x48 },
> +	{ /* sentinel*/ },

No need for ending comma.
The struct could maybe be const.

> +};
> +
> +/* Mode specific register configurations for Omnivision OS08A20 raw camera */
> +
> +/* OS08A20 3840 x 2160 @30fps BGGR10 no more HDR */
> +struct ox05b1s_reg os08a20_init_setting_4k_10b[] = {
> +	{ 0x3821, 0x04 }, /* mirror */
> +	{ 0x4837, 0x10 }, /* PCLK PERIOD */
> +	{ /* sentinel*/ },

No need for ending comma.
The struct could maybe be const.

> +};
> +
> +/* OS08A20 3840 x 2160 @30fps BGGR12 */
> +struct ox05b1s_reg os08a20_init_setting_4k_12b[] = {
> +	{ 0x3821, 0x04 }, /* mirror */
> +	{ 0x4837, 0x10 }, /* PCLK PERIOD */
> +	{ /* sentinel*/ },

No need for ending comma.
The struct could maybe be const.

> +};
> +
> +/* OS08A20 1920 x 1080 @60fps BGGR10 */
> +struct ox05b1s_reg os08a20_init_setting_1080p_10b[] = {
> +	{ 0x3814, 0x03 }, /* X INC ODD */
> +	{ 0x3816, 0x03 }, /* Y INC ODD */
> +	{ 0x3820, 0x01 }, /* vertical bining */
> +	{ 0x3821, 0x05 }, /* mirror, horizontal bining */
> +	{ 0x4837, 0x16 }, /* PCLK PERIOD */
> +	{ /* sentinel*/ },

No need for ending comma.
The struct could maybe be const.

> +};
 > +
 > +struct ox05b1s_reglist os08a20_reglist_4k_12b[] = {

The struct could maybe be const.

 > +	{
 > +		.regs = os08a20_init_setting_common
 > +	}, {
 > +		.regs = os08a20_init_setting_12bit
 > +	}, {
 > +		.regs = os08a20_init_setting_4k_12b
 > +	}, {
 > +		/* sentinel */
 > +	}
 > +};
 > +
 > +struct ox05b1s_reglist os08a20_reglist_1080p_10b[] = {

The struct could maybe be const.

 > +	{
 > +		.regs = os08a20_init_setting_common
 > +	}, {
 > +		.regs = os08a20_init_setting_10bit
 > +	}, {
 > +		.regs = os08a20_init_setting_1080p_10b
 > +	}, {
 > +		/* sentinel */
 > +	}
 > +};
 > +
 >   /*
 >    * Register configuration for Omnivision OX05B1S raw camera
 >    * 2592X1944_30FPS_FULL_RGBIr 2592 1944

CJ


