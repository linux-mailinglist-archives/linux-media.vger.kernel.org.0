Return-Path: <linux-media+bounces-16951-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 536929619C6
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 00:01:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A499286212
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 22:01:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A9231D4173;
	Tue, 27 Aug 2024 22:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="N1A6CEq0"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E904F1D2F72;
	Tue, 27 Aug 2024 22:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724796035; cv=none; b=bryRBAVfsjmCaaohuvMoWw68cDVZth9OmoNHQqjWVWRkpEdCNttoTjEl41eXKaKfi0wnl7MzpAB73dfDk7WbbsbFCufYl/Cy59yXkPPvGeSpAY8xEYU2m9BrOlYXUM9jHpsjoB6cE30/zjrCy636yHnlXSPX9NiN413R3NwuX64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724796035; c=relaxed/simple;
	bh=BqyL3j4zY4qz4IrzUDyigORGyftaEdNoNHgZnJSPbng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dIa+Di05AeXWKjG+Bjv2vn55DfChiy5nwj60RHRGqeIVk8t3FzwCtZERsyunkBctG3a2MgQ4uZoYldjwckB/lDMAcH6jC8QmQ9noPKFStUd/dM0JbG09P9UGIy2TXLES8vkVwZss5Wov6D4CpZzu+uZjozMZnte3taJza+a2Gr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=N1A6CEq0; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DC3474C9;
	Tue, 27 Aug 2024 23:59:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724795965;
	bh=BqyL3j4zY4qz4IrzUDyigORGyftaEdNoNHgZnJSPbng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N1A6CEq0fgp0F6k08YIQRxp7P/dhCuMU3EeVweNHtQpt8Zml4Ar6PjY6VwmvhRsHB
	 +kLdOjDxDR1qZHyRDqoK7t0rVNktu6Bb48nbGBl9OMQ53KxY4rHjgZE1MEalsclTQH
	 sKiVfbgBZoZX81ozya/5Cg+oXAan2VJgRwaJLSmk=
Date: Wed, 28 Aug 2024 01:00:28 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 4/6] media: rcar-isp: Add family compatible for R-Car
 Gen4 family
Message-ID: <20240827220028.GD30398@pendragon.ideasonboard.com>
References: <20240826144352.3026980-1-niklas.soderlund+renesas@ragnatech.se>
 <20240826144352.3026980-5-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240826144352.3026980-5-niklas.soderlund+renesas@ragnatech.se>

Hi Niklas,

Thank you for the patch.

On Mon, Aug 26, 2024 at 04:43:50PM +0200, Niklas Söderlund wrote:
> Add the Gen4 family compatible. This will be used instead of a SoC
> specific compatible for the new Gen4 SoC V4M. Two Gen4 boards (V3U and
> V4H) have already been added prior and their bindings need to be kept
> for backward compatibility.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Assuming 1/6 gets accepted,

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> * Changes since v1
> - Reworked to add a family compatible instead of V4M specific one.
> ---
>  drivers/media/platform/renesas/rcar-isp.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/platform/renesas/rcar-isp.c b/drivers/media/platform/renesas/rcar-isp.c
> index 4512ac338ca5..6504c7025a40 100644
> --- a/drivers/media/platform/renesas/rcar-isp.c
> +++ b/drivers/media/platform/renesas/rcar-isp.c
> @@ -429,8 +429,11 @@ static int risp_probe_resources(struct rcar_isp *isp,
>  }
>  
>  static const struct of_device_id risp_of_id_table[] = {
> +	/* Keep to be compatible with old DTS files. */
>  	{ .compatible = "renesas,r8a779a0-isp" },
> +	/* Keep to be compatible with old DTS files. */
>  	{ .compatible = "renesas,r8a779g0-isp" },
> +	{ .compatible = "renesas,rcar-gen4-isp" },
>  	{ /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, risp_of_id_table);

-- 
Regards,

Laurent Pinchart

