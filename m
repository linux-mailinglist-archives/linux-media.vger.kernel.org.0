Return-Path: <linux-media+bounces-27796-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7E0A5620D
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 08:53:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD1587A4F0B
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 07:52:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A5EE1AA7BF;
	Fri,  7 Mar 2025 07:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B2zT1gS6"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925811632C8;
	Fri,  7 Mar 2025 07:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741334010; cv=none; b=UCoV8hfkI+0r4PAGz//Br3D1gG/D6Tp9nt1EK0bm/fRECph6eefT0FMP+OkNNA4zV9x8KPqFCoiB12eMYg1qg+BBA/p/3kNirQWHObhXRQqjeDKZ5qR+OkpAIVSBfl65NYM0uUS4vUSiOCkIzwvQ2eP09IERZzL1tNCiyLm0ckA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741334010; c=relaxed/simple;
	bh=lTRXkcQG9Z1B5zmCxuNgpQ9Vtwor9EZ3D+xgKciSc/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ntwGncdXIu66yvfY575091329+76qo9c5xMMyKGhEOJ2kwa41035GbWdMSvKSrfL93PeY713atB2BalxvAGZ/hQJO0uBUfrDRZBPcFFIDOOVAZshbE/fMuDokwY3dUpeHnJYwGT2cusrZdPGyqyjbfVbnydFVQryaePe6V0iHJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B2zT1gS6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13B65C4CED1;
	Fri,  7 Mar 2025 07:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741334010;
	bh=lTRXkcQG9Z1B5zmCxuNgpQ9Vtwor9EZ3D+xgKciSc/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B2zT1gS6DJ5D50DqZd3GD9wAcgplYjmWgsvFHnzQW1x8kf9QLZYESHj3sd3d4Qtoo
	 Jq37CyYmeOraCNmW8lbW/vNyB3fvN9t3KpVpflN+a4AqEO2gTP9uzKr+x442QQaCtl
	 QNnAEAuLBsrE27hQ4Vglt83i8N+j4OKdjAx59msMqb96GMX72gceNwwe4Jyb2qtwSf
	 /qV1I6F+3ASeaQkt+6WqQWArYcmfoew64+Mo0gwu1nFY56KuHYZgyREp0j4h7MAllx
	 l1hJNJ6ObadqOLLz1GfJdNM+VkSjlsOyzN+kA5Cy8u53XOD3r93GSmN1wWoYZ2r4wZ
	 T9imrFN4M17pw==
Date: Fri, 7 Mar 2025 08:53:26 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michael Riesch <michael.riesch@wolfvision.net>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>, 
	Gerald Loacker <gerald.loacker@wolfvision.net>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Kever Yang <kever.yang@rock-chips.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Paul Kocialkowski <paulk@sys-base.io>, Alexander Shiyan <eagle.alexander923@gmail.com>, 
	Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v5 04/11] media: dt-bindings: media: add bindings for
 rockchip mipi csi host
Message-ID: <20250307-cunning-glorious-pig-80a99a@krzk-bin>
References: <20250306-v6-8-topic-rk3568-vicap-v5-0-f02152534f3c@wolfvision.net>
 <20250306-v6-8-topic-rk3568-vicap-v5-4-f02152534f3c@wolfvision.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250306-v6-8-topic-rk3568-vicap-v5-4-f02152534f3c@wolfvision.net>

On Thu, Mar 06, 2025 at 05:56:05PM +0100, Michael Riesch wrote:
> Add documentation for the Rockchip RK3568 MIPI CSI-2 Host unit.
> 
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> ---
>  .../bindings/media/rockchip,rk3568-mipi-csi.yaml   | 114 +++++++++++++++++++++
>  MAINTAINERS                                        |   1 +
>  2 files changed, 115 insertions(+)
> 

Same comments about subject.

> diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi.yaml
> new file mode 100644
> index 000000000000..900f5a32dab9
> --- /dev/null

...

> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/rk3568-cru.h>
> +    #include <dt-bindings/power/rk3568-power.h>
> +
> +    parent {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        csi: csi@fdfb0000 {
> +            compatible = "rockchip,rk3568-mipi-csi";
> +            reg = <0x0 0xfdfb0000 0x0 0x10000>;
> +            clocks = <&cru PCLK_CSI2HOST1>;
> +            phys = <&csi_dphy>;
> +            power-domains = <&power RK3568_PD_VI>;
> +            resets = <&cru SRST_P_CSI2HOST1>;
> +            status = "disabled";

Drop

> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;

Best regards,
Krzysztof


