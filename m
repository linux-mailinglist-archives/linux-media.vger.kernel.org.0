Return-Path: <linux-media+bounces-65745-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YVYCGUeOPmp7HwkAu9opvQ
	(envelope-from <linux-media+bounces-65745-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 16:35:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAE56CDFAA
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 16:35:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=OaYJp02L;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65745-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65745-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF6D830D94C7
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 14:33:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22C173F871B;
	Fri, 26 Jun 2026 14:33:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3903F6C2C;
	Fri, 26 Jun 2026 14:33:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782484396; cv=none; b=ctCZYxlZ9/T0vse5fY0V6v0E6nB1BSOMaXDx2HPm4axWmeQznNXiOMpnO1yMnt5SMx2EJ+k4tXi2M9Lue1JozrmrL+aXyTri3UGzN5wSv8/RLeITvXV2jKcT7z1jdackX+hy/TsSvlhLgB474T4oxWPsSXYoM1ESrLXWVyz3urw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782484396; c=relaxed/simple;
	bh=CZ0z/+7L9rBI6NAopwzlR5/H/pl2Sg7uOENYiAE89Ak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rHuySFXAb35QDQN0jMy/0BHkHd1VAh1inEzfVTI/+hRA3CFvNZORbTnABtcgU84homo5QXV0uvVzZKDfm0M4cBQAvJw4LZQ0GnKI0qPu4v6T/etBgdiz16K2A8adYsPkOdK04ZCVXQ+BdyijadoLxyrpxMRlU46EU10h9aTpiVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OaYJp02L; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EA78C174;
	Fri, 26 Jun 2026 16:32:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782484351;
	bh=CZ0z/+7L9rBI6NAopwzlR5/H/pl2Sg7uOENYiAE89Ak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OaYJp02L6ggXbNKJ/p2G+39jSfZv0m5HXuoGPk5gwlYg45jbwCXrNgBQABA/rtwSX
	 xHDRhxB62BtiG8pCegOGjkel7zkI0idDXw2VeWyHUqi/4jZXyDdxPGMcHS1nW7M8v5
	 aB8LSibRy+/Jc2bFx4uj682WX9fxn98nDwtTMMKI=
Date: Fri, 26 Jun 2026 17:33:10 +0300
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
Subject: Re: [PATCH v2 4/8] ARM: tegra: Convert to new media orientation
 definitions
Message-ID: <20260626143310.GF2363897@killaraus.ideasonboard.com>
References: <20260626-kbingham-orientation-v2-0-47178be927b4@ideasonboard.com>
 <20260626-kbingham-orientation-v2-4-47178be927b4@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260626-kbingham-orientation-v2-4-47178be927b4@ideasonboard.com>
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
	TAGGED_FROM(0.00)[bounces-65745-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:kieran.bingham@ideasonboard.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jacopo@jmondi.org,m:sakari.ailus@linux.intel.com,m:jimmy.su@intel.com,m:matthias.fend@emfend.at,m:mike.rudenko@gmail.com,m:dan.scally@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:michael.riesch@collabora.com,m:benjamin.mugnier@foss.st.com,m:sylvain.petinot@foss.st.com,m:paul.elder@ideasonboard.com,m:martin.kepplinger@puri.sm,m:quentin.schulz@theobroma-systems.com,m:tomm.merciai@gmail.com,m:clamor95@gmail.com,m:mailingradian@gmail.com,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:heiko@sntech.de,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linux@ew.tq-group.com,m:imx@lists
 .linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:mikerudenko@gmail.com,m:tommmerciai@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,killaraus.ideasonboard.com:mid,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DAAE56CDFAA

On Fri, Jun 26, 2026 at 01:07:56PM +0100, Kieran Bingham wrote:
> The orientation property for video interface devices now has definitions
> to prevent hardcoded integer values for the enum options.
> 
> Update the users throughout the nvidia device trees to use the new
> definitions.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>  arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi | 3 ++-
>  arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi    | 3 ++-
>  arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts                     | 4 +++-
>  arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi                      | 3 ++-
>  4 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi b/arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi
> index 892d718294dd..a7fdd194300c 100644
> --- a/arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi
> +++ b/arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi
> @@ -3,6 +3,7 @@
>  #include <dt-bindings/input/gpio-keys.h>
>  #include <dt-bindings/input/input.h>
>  #include <dt-bindings/media/video-interfaces.h>
> +#include <dt-bindings/media/video-interface-devices.h>
>  #include <dt-bindings/power/summit,smb347-charger.h>
>  #include <dt-bindings/thermal/thermal.h>
>  
> @@ -991,7 +992,7 @@ front-camera@48 {
>  			vdd-supply = <&vddio_cam>;
>  			vaa-supply = <&avdd_cam1>;
>  
> -			orientation = <0>; /* Front camera */
> +			orientation = <MEDIA_ORIENTATION_FRONT>;
>  
>  			assigned-clocks = <&tegra_car TEGRA30_CLK_VI_SENSOR>,
>  					  <&tegra_car TEGRA30_CLK_CSUS>;
> diff --git a/arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi b/arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi
> index bf1c3a31d406..76286e15684c 100644
> --- a/arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi
> +++ b/arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi
> @@ -3,6 +3,7 @@
>  #include <dt-bindings/input/gpio-keys.h>
>  #include <dt-bindings/input/input.h>
>  #include <dt-bindings/media/video-interfaces.h>
> +#include <dt-bindings/media/video-interface-devices.h>
>  #include <dt-bindings/thermal/thermal.h>
>  
>  #include "tegra30.dtsi"
> @@ -1262,7 +1263,7 @@ front-camera@48 {
>  			vdd-supply = <&vdd_1v8_cam>;
>  			vaa-supply = <&avdd_2v85_fcam>;
>  
> -			orientation = <0>; /* Front camera */
> +			orientation = <MEDIA_ORIENTATION_FRONT>;
>  
>  			assigned-clocks = <&tegra_car TEGRA30_CLK_VI_SENSOR>,
>  					  <&tegra_car TEGRA30_CLK_CSUS>;
> diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts b/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts
> index 896639599c12..28680063bcc0 100644
> --- a/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts
> +++ b/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts
> @@ -1,6 +1,8 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /dts-v1/;
>  
> +#include <dt-bindings/media/video-interface-devices.h>
> +
>  #include "tegra30-lg-x3.dtsi"
>  
>  / {
> @@ -132,7 +134,7 @@ front-camera@48 {
>  			vdd-supply = <&vt_1v8_front>;
>  			vaa-supply = <&vt_2v8_front>;
>  
> -			orientation = <0>; /* Front camera */
> +			orientation = <MEDIA_ORIENTATION_FRONT>;
>  
>  			assigned-clocks = <&tegra_car TEGRA30_CLK_VI_SENSOR>,
>  					  <&tegra_car TEGRA30_CLK_CSUS>;
> diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
> index 60e8a19aa70e..c58e3026a115 100644
> --- a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
> +++ b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
> @@ -4,6 +4,7 @@
>  #include <dt-bindings/input/input.h>
>  #include <dt-bindings/leds/common.h>
>  #include <dt-bindings/media/video-interfaces.h>
> +#include <dt-bindings/media/video-interface-devices.h>
>  #include <dt-bindings/mfd/max77620.h>
>  #include <dt-bindings/thermal/thermal.h>
>  
> @@ -1216,7 +1217,7 @@ rear-camera@10 {
>  			dvdd-supply = <&vdd_1v2_rear>;
>  			avdd-supply = <&vdd_2v7_rear>;
>  
> -			orientation = <1>; /* Rear camera */
> +			orientation = <MEDIA_ORIENTATION_REAR>;

This should be MEDIA_ORIENTATION_BACK. And you should compile all the
device trees the series touch.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  			rotation = <90>;
>  
>  			nvmem = <&m24c08>;

-- 
Regards,

Laurent Pinchart

