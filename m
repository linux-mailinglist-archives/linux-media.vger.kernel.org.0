Return-Path: <linux-media+bounces-21442-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CA83D9C9686
	for <lists+linux-media@lfdr.de>; Fri, 15 Nov 2024 01:02:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 591EEB239A5
	for <lists+linux-media@lfdr.de>; Fri, 15 Nov 2024 00:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 334B72F2F;
	Fri, 15 Nov 2024 00:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PrqH0dPn"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD991E522;
	Fri, 15 Nov 2024 00:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731628921; cv=none; b=ZcV/kL+8MYzt52sXpPvC0EpAN0l3ioA5z5xmLtvhS6CMUnL1rDIwcqYyj+YiKp3R9OFYcgWgr6oCeXt5hk4XLzybmp458HMyHP0oi3RrTbaLC+AegfWx+e2g9tA6K5QQclv6UAdqwCL0r3hnMi5AEp1NuTB5/+0FdZQQBbANkJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731628921; c=relaxed/simple;
	bh=11Ae3SXZglfSECrgCD2E8kqCCDnvJWkPilN10xsoG4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tq/al83Dlo4BG46iACFMs8z0pwOT3qoI7ZvYB3uJxJYu2W1wb2Q5Oy4W2dY3YLqH6qDNBSYVmqav5F6ksYomGICXDXWPA0vXSd6j1zzMVeiEs6kY/o0EQp483S0jgjf9DvUML18DUWLmz0eosrPlkeHKyB84ENJPXkML0JQRrq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PrqH0dPn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 73633E0D;
	Fri, 15 Nov 2024 01:01:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731628904;
	bh=11Ae3SXZglfSECrgCD2E8kqCCDnvJWkPilN10xsoG4E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PrqH0dPnAHN3Sks9Lxwx+SyUY1PZgRCBHE1hKEVSGPkbc2TOJLoE67x8XlPTl19bz
	 2IZ1FjseqZH6R3hwh0Rg+Od1X89aiXiL08VvTAHLuUkHkCpAqQuJcxH6FqWQz7QrMv
	 vd2+6dxqBHLzD2R8qYrHwWHXhFh/w2uTfC7ricy8=
Date: Fri, 15 Nov 2024 02:01:50 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] media: dt-bindings: media: i2c: Add IMX462 to the
 IMX290 binding
Message-ID: <20241115000150.GJ26171@pendragon.ideasonboard.com>
References: <20241114-media-imx290-imx462-v1-0-c538a2e24786@raspberrypi.com>
 <20241114-media-imx290-imx462-v1-2-c538a2e24786@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241114-media-imx290-imx462-v1-2-c538a2e24786@raspberrypi.com>

Hi Dave,

Thank you for the patch.

On Thu, Nov 14, 2024 at 04:01:14PM +0000, Dave Stevenson wrote:
> IMX462 is the successor to IMX290, which is supportable by
> the existing IMX290 driver via a new compatible string.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

With one of the "media:" dropped from the subject line,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
> index bf05ca48601a..fa69bd21c8da 100644
> --- a/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
> @@ -33,6 +33,8 @@ properties:
>            - sony,imx290lqr # Colour
>            - sony,imx290llr # Monochrome
>            - sony,imx327lqr # Colour
> +          - sony,imx462lqr # Colour
> +          - sony,imx462llr # Monochrome
>        - const: sony,imx290
>          deprecated: true
>  

-- 
Regards,

Laurent Pinchart

