Return-Path: <linux-media+bounces-65749-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id egszBs+OPmqgHwkAu9opvQ
	(envelope-from <linux-media+bounces-65749-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 16:38:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 482946CDFF5
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 16:38:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=eYqkeYRS;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65749-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65749-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6264F306591D
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 14:36:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F19D3F88BA;
	Fri, 26 Jun 2026 14:36:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397E03F86EE;
	Fri, 26 Jun 2026 14:36:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782484566; cv=none; b=nVLLpH0TcSonBtyVdS9Yz8MT/ooAv+Z8ClZXvl7Qhwgxj2kwoSYUP1SZj64MNZvUmpUmP2jeX2/u2MTvvnHQWjm6BRJM1z3AV7cQbfnS0lCj3wFvG5r32ULNIEtf5fbPJ5Vqy7R2dOKDT+gKZKrhvesA+H7ZIs9sH2iWfbGzmIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782484566; c=relaxed/simple;
	bh=L/bQyk3vJs03mR2ZwU+MLBuzNtfqCwxohQXCb7O3J3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CsSGuNQfflT4/VZ7bgVDxHfWJ63kjMqs3xq9b7jLRle8tg0W5cBX6mmGYW7knndyvdTCMpOeHYD0lpEGjQWk1FCZRI8NbpeY08ZQ2gg444LJ46/Vgx6lFHYaGUh6oz1uEebwPRfuwrBW0S17p0Tn87m6ZerEbftiHP2RtPI4wwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=eYqkeYRS; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E9017174;
	Fri, 26 Jun 2026 16:35:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782484523;
	bh=L/bQyk3vJs03mR2ZwU+MLBuzNtfqCwxohQXCb7O3J3Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eYqkeYRSd43teSNRXv/vDdU/Ce6HQf2GLBUFAPzcO3m2fnGmShUrC4c/cFlYtwhip
	 6raVRHfj4JMI58MvRggsRHgZOLRG75sGwqlt8brKIXq3ijlIY9r/sZUsquwLwly0ik
	 TCfKzVp9Ejy+FVGFhrPqjtQpsdOO6BCQBgJHkdmY=
Date: Fri, 26 Jun 2026 17:36:02 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jimmy Su <jimmy.su@intel.com>,
	Matthias Fend <matthias.fend@emfend.at>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Martin Kepplinger <martin.kepplinger@puri.sm>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Richard Acayan <mailingradian@gmail.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux@ew.tq-group.com,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 8/8] arm64: dts: rockchip: Convert to new media
 orientation definitions
Message-ID: <20260626143602.GJ2363897@killaraus.ideasonboard.com>
References: <20260626-kbingham-orientation-v2-0-47178be927b4@ideasonboard.com>
 <20260626-kbingham-orientation-v2-8-47178be927b4@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260626-kbingham-orientation-v2-8-47178be927b4@ideasonboard.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65749-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:kieran.bingham@ideasonboard.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jacopo@jmondi.org,m:sakari.ailus@linux.intel.com,m:jimmy.su@intel.com,m:matthias.fend@emfend.at,m:mike.rudenko@gmail.com,m:dan.scally@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:michael.riesch@collabora.com,m:benjamin.mugnier@foss.st.com,m:sylvain.petinot@foss.st.com,m:paul.elder@ideasonboard.com,m:martin.kepplinger@puri.sm,m:quentin.schulz@theobroma-systems.com,m:tomm.merciai@gmail.com,m:clamor95@gmail.com,m:mailingradian@gmail.com,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:heiko@sntech.de,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linux@ew.tq-group.com,m:imx@lists
 .linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:mikerudenko@gmail.com,m:tommmerciai@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[42];
	FREEMAIL_CC(0.00)[kernel.org,jmondi.org,linux.intel.com,intel.com,emfend.at,gmail.com,ideasonboard.com,collabora.com,foss.st.com,puri.sm,theobroma-systems.com,nvidia.com,nxp.com,pengutronix.de,glider.be,sntech.de,vger.kernel.org,ew.tq-group.com,lists.linux.dev,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:from_mime,killaraus.ideasonboard.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 482946CDFF5

On Fri, Jun 26, 2026 at 01:08:00PM +0100, Kieran Bingham wrote:
> The orientation property for video interface devices now has definitions
> to prevent hardcoded integer values for the enum options.
> 
> Update the users throughout the rockchip device trees to use the new
> definitions.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi                        | 3 ++-
>  arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-video-demo.dtso    | 3 ++-
>  arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts                | 5 +++--
>  .../boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam0.dtso      | 3 ++-
>  .../boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam1.dtso      | 3 ++-
>  5 files changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi b/arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi
> index 192791993f05..d58d6ee6241e 100644
> --- a/arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi
> @@ -6,6 +6,7 @@
>  /dts-v1/;
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/input/input.h>
> +#include <dt-bindings/media/video-interface-devices.h>
>  #include <dt-bindings/pinctrl/rockchip.h>
>  #include "px30.dtsi"
>  
> @@ -413,7 +414,7 @@ camera@36 {
>  		dvdd-supply = <&vcc_cam_dvdd>;
>  		dovdd-supply = <&vcc_cam_dovdd>;
>  		lens-focus = <&focus>;
> -		orientation = <0>;
> +		orientation = <MEDIA_ORIENTATION_FRONT>;
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&cif_clkout_m0 &cam_pwdn>;
>  		reset-gpios = <&gpio2 RK_PB0 GPIO_ACTIVE_LOW>;
> diff --git a/arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-video-demo.dtso b/arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-video-demo.dtso
> index 760d5139f95d..2168db9168a5 100644
> --- a/arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-video-demo.dtso
> +++ b/arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-video-demo.dtso
> @@ -16,6 +16,7 @@
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/leds/common.h>
> +#include <dt-bindings/media/video-interface-devices.h>
>  #include <dt-bindings/pinctrl/rockchip.h>
>  
>  &{/} {
> @@ -185,7 +186,7 @@ camera@36 {
>  		dvdd-supply = <&cam_dvdd_1v2>;
>  		dovdd-supply = <&cam_dovdd_1v8>;
>  		lens-focus = <&focus>;
> -		orientation = <0>;
> +		orientation = <MEDIA_ORIENTATION_FRONT>;
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&cif_clkout_m0>;
>  		reset-gpios = <&pca9670 6 GPIO_ACTIVE_LOW>;
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> index 8d26bd9b7500..6608c777f185 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> @@ -13,6 +13,7 @@
>  #include <dt-bindings/input/gpio-keys.h>
>  #include <dt-bindings/input/linux-event-codes.h>
>  #include <dt-bindings/leds/common.h>
> +#include <dt-bindings/media/video-interface-devices.h>
>  #include "rk3399-s.dtsi"
>  
>  / {
> @@ -455,7 +456,7 @@ wcam: camera@1a {
>  		reg = <0x1a>;
>  		clocks = <&cru SCLK_CIF_OUT>; /* MIPI_MCLK0, derived from CIF_CLKO */
>  		lens-focus = <&wcam_lens>;
> -		orientation = <1>; /* V4L2_CAMERA_ORIENTATION_BACK */
> +		orientation = <MEDIA_ORIENTATION_BACK>;
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&camera_rst_l>;
>  		reset-gpios = <&gpio1 RK_PA0 GPIO_ACTIVE_LOW>;
> @@ -487,7 +488,7 @@ ucam: camera@36 {
>  		clocks = <&cru SCLK_CIF_OUT>; /* MIPI_MCLK1, derived from CIF_CLK0 */
>  		clock-names = "xvclk";
>  		dovdd-supply = <&vcc1v8_dvp>;
> -		orientation = <0>; /* V4L2_CAMERA_ORIENTATION_FRONT */
> +		orientation = <MEDIA_ORIENTATION_FRONT>;
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&camera2_rst_l &dvp_pdn0_h>;
>  		powerdown-gpios = <&gpio2 RK_PB4 GPIO_ACTIVE_LOW>;
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam0.dtso b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam0.dtso
> index ee9ecf68a886..8c9a4a1181e4 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam0.dtso
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam0.dtso
> @@ -9,6 +9,7 @@
>  
>  #include <dt-bindings/clock/rockchip,rk3588-cru.h>
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/media/video-interface-devices.h>
>  #include <dt-bindings/pinctrl/rockchip.h>
>  
>  &{/} {
> @@ -50,7 +51,7 @@ imx415: camera-sensor@1a {
>  		avdd-supply = <&savdd_cam0>;
>  		clocks = <&cru CLK_MIPI_CAMARAOUT_M3>;
>  		dvdd-supply = <&sdvdd_cam0>;
> -		orientation = <2>; /* External */
> +		orientation = <MEDIA_ORIENTATION_EXTERNAL>;
>  		ovdd-supply = <&siovdd_cam0>;
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&cam0_rstn &mipim0_camera3_clk>;
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam1.dtso b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam1.dtso
> index 8a4cf3fdbf8e..0cc3d6a34cef 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam1.dtso
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam1.dtso
> @@ -9,6 +9,7 @@
>  
>  #include <dt-bindings/clock/rockchip,rk3588-cru.h>
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/media/video-interface-devices.h>
>  #include <dt-bindings/pinctrl/rockchip.h>
>  
>  &{/} {
> @@ -50,7 +51,7 @@ cam1_imx415: camera-sensor@1a {
>  		avdd-supply = <&savdd_cam1>;
>  		clocks = <&cru CLK_MIPI_CAMARAOUT_M4>;
>  		dvdd-supply = <&sdvdd_cam1>;
> -		orientation = <2>; /* External */
> +		orientation = <MEDIA_ORIENTATION_EXTERNAL>;
>  		ovdd-supply = <&siovdd_cam1>;
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&cam1_rstn &mipim0_camera4_clk>;

-- 
Regards,

Laurent Pinchart

