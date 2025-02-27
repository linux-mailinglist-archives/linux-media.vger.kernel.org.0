Return-Path: <linux-media+bounces-27121-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCF6A475E6
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 07:21:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AD913ADA74
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 06:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4182421B9DF;
	Thu, 27 Feb 2025 06:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="I6T6DoQy"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649A31DDD1;
	Thu, 27 Feb 2025 06:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740637263; cv=pass; b=I7HvZazhB+1ZxTNYAOOHzWPvxJFM5eaCMtKgmIuCX56bQkukB3VcaJAK75q9yb8vpBMQO1Ap6Rzi6SNZsKhErXDCVNnDROJVOANoIc4uGsXG3ZftkasbQgg61Aehsyp66kokzJmbpm4lrT2jHjdhM2EGyxZJfm2G68gzE63U1Yo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740637263; c=relaxed/simple;
	bh=QXFk6AMhbzhCA2gLl5st0ygMgRkWYmUuvZgfjp3wpRk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=OXX3gCMMLApSWThpKyQ9uscSzg838wIz8WHJelosrm+TUzxFXv4dh5vvu0FEHxWkqAPcFVmwlcJKJui/syEin/x6qaW+S+Sj3clDK3LriM7yyP4FCblNHWZDczECBNlsQn7DnkZELyMY4yi9sKcq6wPmolG3E5N8lST+B4Z0MGg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=I6T6DoQy; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1740637213; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CBj+2u58FaLlfXUL5r4ElOi/IpxDJUdL5DLsNEHNk0+UdTf0KDAKmpQs29KN2wHLP9/UUsQgiHaFf2mLEtRXdtkxAOFjk5p7D77egssavIxWXcksgod1qfC2e6z2J999I8dM2W7bPgdcWUTxk0toEcEOpEB0gdkCyyGg9VlroKU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1740637213; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ESKAXw1Tt8hbvdnODg8HBJ11zlfZzK9vXWlIshKQpnM=; 
	b=eyor/mD0YxxN/+q0uTnIbXdi7xJWvjgNigMgz8rS5ydyCPMv7a3KBmIsu7MBqRtIkI7mdjiR8uUqRA0dE/B/r3/YCZy4LUrU0muqSyeh93ziWKJoboj4caNWqbmFxTL7Z6APJZeNKyWwAtzNqkvQBx4hAmhFqpnGSEGmX3vGkzg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740637213;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:From:From:To:To:Cc:Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=ESKAXw1Tt8hbvdnODg8HBJ11zlfZzK9vXWlIshKQpnM=;
	b=I6T6DoQyMwenD8Jj/4OugRF2aKDRyqQsd/tTY6GcNUy4pt7BKeT4PEW00BiaVpz9
	fh+sT/lcbefoqcFBM6TegVOlcc3bkxh+DPX1SeXTVMpgetIWzaLT7nsc9ycU3ep1hw8
	GzLi3NENYsWzsPypocvxxDRm88OXIufDY7H8cSoo=
Received: by mx.zohomail.com with SMTPS id 1740637210671337.5440148916407;
	Wed, 26 Feb 2025 22:20:10 -0800 (PST)
Message-ID: <82e5a342-c82e-40c4-88a9-645a70420aa0@collabora.com>
Date: Thu, 27 Feb 2025 09:20:03 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 3/6] media: platform: synopsys: Add support for HDMI
 input driver
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Shreeya Patel <shreeya.patel@collabora.com>,
 Heiko Stuebner <heiko@sntech.de>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, jose.abreu@synopsys.com,
 nelson.costa@synopsys.com, shawn.wen@rock-chips.com,
 nicolas.dufresne@collabora.com,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: kernel@collabora.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Tim Surber <me@timsurber.de>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Diederik de Haas <didi.debian@cknow.org>
References: <20250227055025.766018-1-dmitry.osipenko@collabora.com>
 <20250227055025.766018-4-dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20250227055025.766018-4-dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 2/27/25 08:50, Dmitry Osipenko wrote:
> +struct hdmirx_cec *snps_hdmirx_cec_register(struct hdmirx_cec_data *data)
> +{
> +	struct hdmirx_cec *cec;
> +	unsigned int irqs;
> +	int ret;
> +
> +	/*
> +	 * Our device is just a convenience - we want to link to the real
> +	 * hardware device here, so that userspace can see the association
> +	 * between the HDMI hardware and its associated CEC chardev.
> +	 */
> +	cec = devm_kzalloc(data->dev, sizeof(*cec), GFP_KERNEL);
> +	if (!cec)
> +		return ERR_PTR(-ENOMEM);
> +
> +	cec->dev = data->dev;
> +	cec->irq = data->irq;
> +	cec->ops = data->ops;
> +	cec->hdmirx = data->hdmirx;
> +
> +	hdmirx_cec_update_bits(cec, GLOBAL_SWENABLE, CEC_ENABLE, CEC_ENABLE);
> +	hdmirx_cec_update_bits(cec, CEC_CONFIG, RX_AUTO_DRIVE_ACKNOWLEDGE,
> +			       RX_AUTO_DRIVE_ACKNOWLEDGE);
> +
> +	hdmirx_cec_write(cec, CEC_TX_COUNT, 0);
> +	hdmirx_cec_write(cec, CEC_INT_MASK_N, 0);
> +	hdmirx_cec_write(cec, CEC_INT_CLEAR, ~0);
> +
> +	cec->adap = cec_allocate_adapter(&hdmirx_cec_ops, cec, "snps-hdmirx",
> +					 CEC_CAP_DEFAULTS | CEC_CAP_MONITOR_ALL,
> +					 CEC_MAX_LOG_ADDRS);
> +	if (IS_ERR(cec->adap)) {
> +		dev_err(cec->dev, "cec adapter allocation failed\n");
> +		return ERR_CAST(cec->adap);
> +	}
> +
> +	/* override the module pointer */
> +	cec->adap->owner = THIS_MODULE;
> +
> +	ret = devm_add_action(cec->dev, hdmirx_cec_del, cec);
> +	if (ret) {
> +		cec_delete_adapter(cec->adap);
> +		return ERR_PTR(ret);
> +	}
> +
> +	irq_set_status_flags(cec->irq, IRQ_NOAUTOEN);
> +
> +	ret = devm_request_threaded_irq(cec->dev, cec->irq,
> +					hdmirx_cec_hardirq,
> +					hdmirx_cec_thread, IRQF_ONESHOT,
> +					"rk_hdmirx_cec", cec->adap);
> +	if (ret) {
> +		dev_err(cec->dev, "cec irq request failed\n");
> +		return ERR_PTR(ret);
> +	}
> +
> +	cec->notify = cec_notifier_cec_adap_register(cec->dev,
> +						     NULL, cec->adap);

It now occurred to me that this cec->notify also should be not needed
for this driver and *everything* related to CEC notifiers should be
removed. Hans, is this correct or I'm missing something?

-- 
Best regards,
Dmitry

