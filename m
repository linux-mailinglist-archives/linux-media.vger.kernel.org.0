Return-Path: <linux-media+bounces-16658-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE7C95CE2F
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 15:42:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E9C41C20CB8
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 13:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53E38187FEF;
	Fri, 23 Aug 2024 13:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QzybVHHB"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4858046556;
	Fri, 23 Aug 2024 13:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724420516; cv=none; b=nr1Jzz1tHE3rvxx9EeJiotGAzZnqGYcc768j4J7gDh3Q2fAPyugTWZWubIfTB3rZLSgOeEXp82P2fqE77UG02zJz/qN5NNsocPmGVV4mynyejdcWD/Ycsxe6TDnUXpytiIbDHJToktdatt0J42QBYxWdpRQkM+4N2qFhpT+JDxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724420516; c=relaxed/simple;
	bh=DcbH1ytGyvetbs07ArAnIlrcd63r54L8mirr7tefb60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XkZPm+WUXCat85N+Gv8FRTSpx5DxTV4nY2DOIxR5EOQZBDg/UD/PIeACzJ5vyNUxRm3CdvgnScqyXkd7yDgxAmvnelzJS+5FrcwnLYHbMc0D/qoqyDf2St9oEGaZmZ2t7C9UwIIquqUKmY7nS6n+lD8KP+BxMw/VGLbeVfH3aCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QzybVHHB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B913E2D5;
	Fri, 23 Aug 2024 15:40:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724420449;
	bh=DcbH1ytGyvetbs07ArAnIlrcd63r54L8mirr7tefb60=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QzybVHHBzCbGRyYhrQmFK+CqU0P9cpNkR5QezUUaEir0AuByZhwywGwUN8gMLP9C1
	 q7iOqU8LW3S9mf7OaANDsQrQ35aQhKlpUqb2mSsfRXXC4LtNEaZuAQuiv1yTH05o3u
	 W6v6/LW8CoY0nKhXCNqPFE7s1SERH6pwDAzetqNk=
Date: Fri, 23 Aug 2024 16:41:51 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v5 5/6] dt-bindings: media: renesas,vin: Add binding for
 V4M
Message-ID: <20240823134151.GI26098@pendragon.ideasonboard.com>
References: <20240704161620.1425409-1-niklas.soderlund+renesas@ragnatech.se>
 <20240704161620.1425409-6-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240704161620.1425409-6-niklas.soderlund+renesas@ragnatech.se>

Hi Niklas,

Thank you for the patch.

On Thu, Jul 04, 2024 at 06:16:19PM +0200, Niklas Söderlund wrote:
> Document support for the VIN module in the Renesas V4M (r8a779h0) SoC.
> This device is compatible with the VIN module on the other Gen4 SoCs.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> * Changes since v3
> - State in commit message that device is compatible with the other Gen4
>   device.
> ---
>  Documentation/devicetree/bindings/media/renesas,vin.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,vin.yaml b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> index aa16f1528f2d..cf54176f4fbd 100644
> --- a/Documentation/devicetree/bindings/media/renesas,vin.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> @@ -56,6 +56,7 @@ properties:
>            - enum:
>                - renesas,vin-r8a779a0 # R-Car V3U
>                - renesas,vin-r8a779g0 # R-Car V4H
> +              - renesas,vin-r8a779h0 # R-Car V4M
>            - const: renesas,rcar-gen4-vin # Generic R-Car Gen4
>  
>    reg:

-- 
Regards,

Laurent Pinchart

