Return-Path: <linux-media+bounces-26702-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2EEA4109C
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 18:56:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D16113B3AB2
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 17:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D946D15667B;
	Sun, 23 Feb 2025 17:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="UAcVW5eY"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-76.smtpout.orange.fr [80.12.242.76])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A248815D1;
	Sun, 23 Feb 2025 17:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740333357; cv=none; b=V8oZ7gFXU+NLqHnocUl66uRm2ej/CS5MbsqcahHUKQU1R5hug+Fn0hrLvm+51IqC9zBk+hnP9yJPbb27y++z4T1wOTwfcnOuJ4JwpZWeqNv71acZifMm0VXYvMfjYlt+vT+5p9Zjbe7pvlTSPjPre5Op9g7s4S8XbtksHcT9s2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740333357; c=relaxed/simple;
	bh=BTbID0THI6s3PoeAeD0pO4w2T1yv9jSev5ASf56zXUY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g2I+BgfHeSW0xS7cKB2+OU79lGpV0xAVIPloGuS3HAiZ31Kd1kLJ1Y0ylHhVE/0AvqCWhVBBUC/hMZwoZ6wiMijHyGC5CoUM93OzXqlavM6HO4th+Xu1R1Gy7nX5nncAFFVYt5CYYrginLZX5N/qo7l4ypGmp1sm/NOU7L72Kjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=UAcVW5eY; arc=none smtp.client-ip=80.12.242.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id mGBYtahoV2PZMmGBctmSWh; Sun, 23 Feb 2025 18:54:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1740333286;
	bh=5bcIn2euEhstjs3cIQxm4V7rjLzP65GLYsksBTypYt8=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=UAcVW5eYbQTubiwlBFI5YDqjbsh4A/6H/ONbTE6N6YmgCCnAbFKt3pLnd1JjpQj0I
	 S5xkcynu8Z1wu0uwViuzEOXKAbAP0qojuSegpIOJi4HiNBUXpCn/tP8AUcKwS0FK/2
	 IvHCWlNRmV8IbgwBSOS6xCyshPmLlTDQHxAnTOhbWWw2DRgvm/dq5st/XS6OfDql6Y
	 Ozv2iX+MkSVWQ9S//mQe3e40q+HGB7faEC3l/nbnbiTndUxG0vrbrChOy5z6kKP+hk
	 EzZNuAXDzY2yjW6x8GVB98kWifElDTDzBeqw973DbQXQJEx1zmlJ9VHm597nbIqjaV
	 a9NPVqokxd6Dw==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Sun, 23 Feb 2025 18:54:46 +0100
X-ME-IP: 90.11.132.44
Message-ID: <88b02c37-6741-459b-b966-d6d58d1f9b6f@wanadoo.fr>
Date: Sun, 23 Feb 2025 18:54:36 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/6] media: platform: synopsys: Add support for HDMI
 input driver
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Shreeya Patel <shreeya.patel@collabora.com>, Heiko Stuebner
 <heiko@sntech.de>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, jose.abreu@synopsys.com, nelson.costa@synopsys.com,
 shawn.wen@rock-chips.com, nicolas.dufresne@collabora.com,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: kernel@collabora.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Tim Surber <me@timsurber.de>
References: <20250223173019.303518-1-dmitry.osipenko@collabora.com>
 <20250223173019.303518-5-dmitry.osipenko@collabora.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250223173019.303518-5-dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 23/02/2025 à 18:30, Dmitry Osipenko a écrit :
> From: Shreeya Patel <shreeya.patel@collabora.com>
> 
> Add initial support for the Synopsys DesignWare HDMI RX
> Controller Driver used by Rockchip RK3588. The driver
> supports:
>   - HDMI 1.4b and 2.0 modes (HDMI 4k@60Hz)
>   - RGB888, YUV422, YUV444 and YCC420 pixel formats
>   - CEC
>   - EDID configuration
> 
> The hardware also has Audio and HDCP capabilities, but these are
> not yet supported by the driver.
> 
> Co-developed-by: Dingxian Wen <shawn.wen@rock-chips.com>
> Signed-off-by: Dingxian Wen <shawn.wen@rock-chips.com>
> Signed-off-by: Shreeya Patel <shreeya.patel@collabora.com>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Hi,

> +	hdmirx_dev->dev = dev;
> +	dev_set_drvdata(dev, hdmirx_dev);
> +
> +	ret = hdmirx_parse_dt(hdmirx_dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = hdmirx_setup_irq(hdmirx_dev, pdev);
> +	if (ret)
> +		return ret;

 From here, should of_reserved_mem_device_release() be called in the 
error handling path, as done in the remove function?

> +
> +	hdmirx_dev->regs = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(hdmirx_dev->regs))
> +		return dev_err_probe(dev, PTR_ERR(hdmirx_dev->regs),
> +				     "failed to remap regs resource\n");

...

> +static const struct of_device_id hdmirx_id[] = {
> +	{ .compatible = "rockchip,rk3588-hdmirx-ctrler" },
> +	{ },

Unneeded trailing comma after a terminator.

> +};
> +MODULE_DEVICE_TABLE(of, hdmirx_id);

...

> +	ret = cec_register_adapter(cec->adap, cec->dev);
> +	if (ret < 0) {
> +		dev_err(cec->dev, "cec register adapter failed\n");
> +		cec_unregister_adapter(cec->adap);

Is it needed to call cec_unregister_adapter() when 
cec_register_adapter() fails?

> +		return NULL;
> +	}
> +
> +	irqs = CECTX_LINE_ERR | CECTX_NACK | CECRX_EOM | CECTX_DONE;
> +	hdmirx_cec_write(cec, CEC_INT_MASK_N, irqs);
> +

CJ


