Return-Path: <linux-media+bounces-13310-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 956EC909A41
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2024 00:32:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3694A283415
	for <lists+linux-media@lfdr.de>; Sat, 15 Jun 2024 22:32:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C369E69D31;
	Sat, 15 Jun 2024 22:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="OuDwpIHp"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5ADC38DC7;
	Sat, 15 Jun 2024 22:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718490728; cv=none; b=Vu9d1Hahs/hHCgQoR3pk5axiFjZvM4ADpmH2GZXO+7+vSNxNeoWiQj2V81HsBcZaIGB7jXGAP5c8Rbk+E6UqNKVIpUG+B7OtkRirgct14SSRaJAVoyIgx1zjcAswfUL0SfMnyssejy+I4QjC6gVX86OYeKEK8ZHWWJFMaAOwT/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718490728; c=relaxed/simple;
	bh=7XrSzKmwP52JgdaTxNDC5ItcCdg1ekFDgIZGwIYnShs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U3vGRN37MnyYdFCzj6dSBKXIebowdwaENp9fCWsTqWr+LbWyycCKSY8n0um1Mxm20F/ONlvfKEg8EhfI4xSVFd666nwlEFuc/8+2L5lAZUxreOYE1BpbN13CnBSZ/SiBrfMtGxgFKU5dhM9bo7A2ZvoSHxXZE3C4spFLPUAgBJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=OuDwpIHp; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718490725;
	bh=7XrSzKmwP52JgdaTxNDC5ItcCdg1ekFDgIZGwIYnShs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OuDwpIHpTYC6TNb5JC1Zk4EkLodvsgULeNI4dFtjeJpW96MmjrEzapMLUgxB6gT97
	 kObTwo2x56YIi+krngtB9zMao0Qejt2JsSNI/sAuVOciq66S70BdMvejN2PaIUC+VW
	 bLJoS6SeyweOGIcTEU0/Nygd6ycDdnFiOkgbrOH9Np3ygK6R/shxyQMOkATLQiCg4c
	 tK7GSixfcjWp2stA6j4JjhzOVYdqeD2uPAEYMucJkZuU/xpvlOvBq/HTXaw22TXXUS
	 xF4SNDw64xuWb8Y4svgtYAwcP3idWb3R36prYVi5u1VC9KEbEvkCOc8ItkCPWBxxam
	 QW87WAPsLHK1w==
Received: from [100.109.49.129] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dmitry.osipenko)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 744653780575;
	Sat, 15 Jun 2024 22:32:03 +0000 (UTC)
Message-ID: <b298efa3-ea5c-4ac5-9026-8bc09eea4c84@collabora.com>
Date: Sun, 16 Jun 2024 01:32:00 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: rockchip: Introduce the rkvdec2 driver
To: Detlev Casanova <detlev.casanova@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Dragan Simic <dsimic@manjaro.org>, Alexey Charkov <alchark@gmail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Diederik de Haas <didi.debian@cknow.org>, Andy Yan
 <andy.yan@rock-chips.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev
References: <20240615015734.1612108-1-detlev.casanova@collabora.com>
 <20240615015734.1612108-2-detlev.casanova@collabora.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20240615015734.1612108-2-detlev.casanova@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/15/24 04:56, Detlev Casanova wrote:
> +	pm_runtime_set_autosuspend_delay(&pdev->dev, 100);
> +	pm_runtime_use_autosuspend(&pdev->dev);
> +	pm_runtime_enable(&pdev->dev);
> +
> +	ret = clk_bulk_prepare_enable(ARRAY_SIZE(rkvdec2_clk_names), rkvdec->clocks);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Could not start clocks\n");
> +		return ret;
> +	}

Remove this clk_bulk_prepare_enable(), clocks are enabled by runtime-resume.


