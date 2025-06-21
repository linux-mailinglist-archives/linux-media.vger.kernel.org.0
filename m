Return-Path: <linux-media+bounces-35528-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8160BAE296E
	for <lists+linux-media@lfdr.de>; Sat, 21 Jun 2025 16:23:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20FEC1897E6F
	for <lists+linux-media@lfdr.de>; Sat, 21 Jun 2025 14:23:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D814E1991DD;
	Sat, 21 Jun 2025 14:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="i8rMPC0l"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A35EAC6;
	Sat, 21 Jun 2025 14:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750515816; cv=none; b=hW6bkcrwd92uIDkkh1Gxi2FfxvRRDPSh2o+KGWm3ezsUNGRjNjTKpC05p1nfv9Hl9br4WMi1nQNpqoV3SgBjqUvG6g7JUBrGkFyNq037KZDR1OjA+T6uUKxIniEYsvdMLoIceS1cY5SDR2ihpqWdGYXB0uhnY7h8OYVxzmsBjJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750515816; c=relaxed/simple;
	bh=9X11Q5xppWHkVzzWlRnS3XXcKyky3uW7NnCIal+uUU0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KnKse9+8FzA7v+f6YjKG8eNMkPS+kMp8pPDXZrAxeXnH9wlcS3sRuLWWOa84KVGQqkvCr/e7krNb8qGOjt4AXJ8BaGv+9gpHUMe9sMUkc+siGxNaGbLSb1TP7nOP/aMQb5q+7KXmjzPfTGb6qWFu7VqVpirFJklvYMtVJULhhE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=i8rMPC0l; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750515806;
	bh=9X11Q5xppWHkVzzWlRnS3XXcKyky3uW7NnCIal+uUU0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=i8rMPC0lgJCdheF47QVC4kGCe3t6g8sS0ljLNZZjrkus+XFOZJlQDbq5byd8ufiWP
	 6G86sATxHvWLaQLpPkD5IFmSkOE631QQP6FpruZnXMoF6U1XYQcfvmfUIBogoLln2A
	 +1cf0/oZC7/VKjSq3YuaOOvZgYq2hj7Zb8b6/Jc+hEnpeUaBTM1o3g6V5EV2hlRhbu
	 W1x97ONOOzYEOZv+zmy4qm9QLgkOUAQgZI2JKdJNWb+m30myWZQkcWVfeplLbQAWdK
	 Hj2rKAoYH0nnwRRF75T/xU0bdJftzctY1pTidd71rJHlueGbl/87rjvzu8tWASgT4d
	 5g6+WnJnKo3lg==
Received: from [10.40.0.100] (185-251-200-162.lampert.tv [185.251.200.162])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9ABCC17E046C;
	Sat, 21 Jun 2025 16:23:24 +0200 (CEST)
Message-ID: <0eb440d8-fdc3-4ceb-8856-cda43afde4d1@collabora.com>
Date: Sat, 21 Jun 2025 16:23:23 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 19/55] media: i2c: imx415: Use the v4l2 helper for
 obtaining the clock
To: Mehdi Djait <mehdi.djait@linux.intel.com>,
 laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com
Cc: akinobu.mita@gmail.com, stanislaw.gruszka@linux.intel.com,
 hdegoede@redhat.com, arnd@arndb.de, alain.volmat@foss.st.com,
 andrzej.hajda@intel.com, benjamin.mugnier@foss.st.com,
 dave.stevenson@raspberrypi.com, hansg@kernel.org, hverkuil@xs4all.nl,
 jacopo.mondi@ideasonboard.com, jonas@kwiboo.se,
 kieran.bingham@ideasonboard.com, khalasa@piap.pl,
 prabhakar.csengg@gmail.com, mani@kernel.org, m.felsch@pengutronix.de,
 martink@posteo.de, mattwmajewski@gmail.com, matthias.fend@emfend.at,
 mchehab@kernel.org, naush@raspberrypi.com, nicholas@rothemail.net,
 nicolas.dufresne@collabora.com, paul.elder@ideasonboard.com,
 dan.scally@ideasonboard.com, pavel@kernel.org, petrcvekcz@gmail.com,
 rashanmu@gmail.com, ribalda@chromium.org, rmfrfs@gmail.com,
 zhengsq@rock-chips.com, slongerbeam@gmail.com, sylvain.petinot@foss.st.com,
 s.nawrocki@samsung.com, tomi.valkeinen@ideasonboard.com,
 umang.jain@ideasonboard.com, zhi.mao@mediatek.com,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <cover.1750352394.git.mehdi.djait@linux.intel.com>
 <0cc24a56cfdd04b871f06a12c30e40bf1012935e.1750352394.git.mehdi.djait@linux.intel.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <0cc24a56cfdd04b871f06a12c30e40bf1012935e.1750352394.git.mehdi.djait@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mehdi,

Thanks for your patch!

On 6/19/25 19:59, Mehdi Djait wrote:
> devm_clk_get() fails on ACPI-based platforms, where firmware does not
> provide a direct reference to the clock producer.
> 
> Replace devm_clk_get() with the new v4l2 helper
> devm_v4l2_sensor_clk_get() that works on both DT- and ACPI-based
> platforms to retrieve a reference to the clock producer from firmware.
> 
> Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
> 
> diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
> index 9f37779bd611..f7897660f44f 100644
> --- a/drivers/media/i2c/imx415.c
> +++ b/drivers/media/i2c/imx415.c
> @@ -1251,7 +1251,7 @@ static int imx415_parse_hw_config(struct imx415 *sensor)
>  		return dev_err_probe(sensor->dev, PTR_ERR(sensor->reset),
>  				     "failed to get reset GPIO\n");
>  
> -	sensor->clk = devm_clk_get(sensor->dev, "inck");
> +	sensor->clk = devm_v4l2_sensor_clk_get(sensor->dev, "inck");

Matthias Fend discovered a while ago that the driver is not in agreement
with the DT binding, which does not require a certain clock name.
However, the corresponding patch [0] has not landed in v6.16-rc1 AFAIK.

Can we translate the line above directly to
    sensor->clk = devm_v4l2_sensor_clk_get(sensor->dev, NULL);
?

Best regards,
Michael

>  	if (IS_ERR(sensor->clk))
>  		return dev_err_probe(sensor->dev, PTR_ERR(sensor->clk),
>  				     "failed to get clock\n");


[0] https://lore.kernel.org/all/20250514-imx415-v1-1-bb29fa622bb1@emfend.at/

