Return-Path: <linux-media+bounces-65744-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id awmUNbaNPmpYHwkAu9opvQ
	(envelope-from <linux-media+bounces-65744-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 16:33:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D36AE6CDF28
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 16:33:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=TMnTkzMv;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65744-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-65744-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 57965302E723
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 14:31:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD61A3F8883;
	Fri, 26 Jun 2026 14:31:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870A93F4DC0;
	Fri, 26 Jun 2026 14:31:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782484287; cv=none; b=cPfLC6Od2kpxBECvbMAFLIITvFTh/Cmmi1QY9x2O0pZ/Xw9OJt+zhMy5ZNCny3l+hIEeW0GG/ALs5RCa5HP6jeCF5H9o6GTyeUmsQWnD+vjeAPxFhXx60Je9h5rgd+rtvRa6kv1gDoizhS1juAav4U4RZ6IWWJCyPbCqVBNbpSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782484287; c=relaxed/simple;
	bh=sJ/tExaSCQZH/G1ZdmBqdgm66+iDkMVW52aWnWzp0/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IY52v5MJB2UN9kxVXcEia8dvM44i+vzFWt9Zh0iqFndNNr7HtvmXJdTN2VjxNtXdq5bkcNVjGolUjMqBKWj7b1IQKCanevYNgcCM0YsI0AH0JAFYCppgh1k1g2ufqAOtwBznvcAshbKZIcKvgXuHbvmqonY/mLpsqmUdtjHtqxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TMnTkzMv; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7BEF6174;
	Fri, 26 Jun 2026 16:30:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782484242;
	bh=sJ/tExaSCQZH/G1ZdmBqdgm66+iDkMVW52aWnWzp0/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TMnTkzMvTyjW8sMvg/Xym4e/hJK+Obabv/0BpBwOAQ6NJpP4Tvlqdf8qnP9rgKq+3
	 9Ol8nH/QMMTDC0cNC+3ixZSuDKpXDn7cXXZ6GL+GCu3rKsW7S/e894EwV6Tg+ilTYL
	 f/yzlr37FJCQLy0B76gE5Ckbx2OVD3ElFuLQPjJA=
Date: Fri, 26 Jun 2026 17:31:22 +0300
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
Subject: Re: [PATCH v2 3/8] dt-bindings: media: i2c: Utilise
 video-interface-devices enums
Message-ID: <20260626143122.GE2363897@killaraus.ideasonboard.com>
References: <20260626-kbingham-orientation-v2-0-47178be927b4@ideasonboard.com>
 <20260626-kbingham-orientation-v2-3-47178be927b4@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260626-kbingham-orientation-v2-3-47178be927b4@ideasonboard.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65744-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,killaraus.ideasonboard.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D36AE6CDF28

On Fri, Jun 26, 2026 at 01:07:55PM +0100, Kieran Bingham wrote:
> The orientation property for video interface devices now has definitions
> to prevent hardcoded integer values for the enum options.
> 
> Update the existing examples throughout the bindings documentation for
> camera sensors.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml   | 3 ++-
>  Documentation/devicetree/bindings/media/i2c/ovti,ov08d10.yaml  | 3 ++-
>  Documentation/devicetree/bindings/media/i2c/ovti,ov4689.yaml   | 3 ++-
>  Documentation/devicetree/bindings/media/i2c/ovti,ov5675.yaml   | 3 ++-
>  Documentation/devicetree/bindings/media/i2c/ovti,ov5693.yaml   | 3 ++-
>  Documentation/devicetree/bindings/media/i2c/ovti,ov64a40.yaml  | 3 ++-
>  Documentation/devicetree/bindings/media/i2c/sony,imx111.yaml   | 3 ++-
>  Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml   | 3 ++-
>  Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml   | 3 ++-
>  Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml     | 3 ++-
>  Documentation/devicetree/bindings/media/i2c/st,vd56g3.yaml     | 3 ++-
>  Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml | 3 ++-
>  12 files changed, 24 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml b/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> index 1a57f2aa1982..b7bc6ba26e6e 100644
> --- a/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> @@ -86,6 +86,7 @@ unevaluatedProperties: false
>  examples:
>    - |
>      #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/media/video-interface-devices.h>
>  
>      i2c {
>          #address-cells = <1>;
> @@ -102,7 +103,7 @@ examples:
>              vddio-supply = <&reg_camera_vddio>;
>              reset-gpios = <&gpio1 25 GPIO_ACTIVE_LOW>;
>              shutdown-gpios = <&gpio5 4 GPIO_ACTIVE_LOW>;
> -            orientation = <0>;
> +            orientation = <MEDIA_ORIENTATION_FRONT>;
>              rotation = <0>;
>  
>              port {
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov08d10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov08d10.yaml
> index 6f2017c75125..b9c61395b24f 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov08d10.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov08d10.yaml
> @@ -69,6 +69,7 @@ examples:
>    - |
>      #include <dt-bindings/gpio/gpio.h>
>      #include <dt-bindings/media/video-interfaces.h>
> +    #include <dt-bindings/media/video-interface-devices.h>
>  
>      i2c {
>          #address-cells = <1>;
> @@ -84,7 +85,7 @@ examples:
>              avdd-supply = <&ov08d10_vdda_2v8>;
>              dvdd-supply = <&ov08d10_vddd_1v2>;
>  
> -            orientation = <2>;
> +            orientation = <MEDIA_ORIENTATION_EXTERNAL>;
>              rotation = <0>;
>  
>              reset-gpios = <&gpio 1 GPIO_ACTIVE_LOW>;
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov4689.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov4689.yaml
> index d96199031b66..fcd617848ce3 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov4689.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov4689.yaml
> @@ -96,6 +96,7 @@ unevaluatedProperties: false
>  examples:
>    - |
>      #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/media/video-interface-devices.h>
>  
>      i2c {
>          #address-cells = <1>;
> @@ -114,7 +115,7 @@ examples:
>              powerdown-gpios = <&pio 107 GPIO_ACTIVE_LOW>;
>              reset-gpios = <&pio 109 GPIO_ACTIVE_LOW>;
>  
> -            orientation = <2>;
> +            orientation = <MEDIA_ORIENTATION_EXTERNAL>;
>              rotation = <0>;
>  
>              port {
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5675.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5675.yaml
> index ad07204057f9..6df62fd0c0c0 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov5675.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5675.yaml
> @@ -85,6 +85,7 @@ examples:
>    - |
>      #include <dt-bindings/clock/px30-cru.h>
>      #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/media/video-interface-devices.h>
>      #include <dt-bindings/pinctrl/rockchip.h>
>  
>      i2c {
> @@ -108,7 +109,7 @@ examples:
>              dovdd-supply = <&vcc_2v8>;
>  
>              rotation = <90>;
> -            orientation = <0>;
> +            orientation = <MEDIA_ORIENTATION_FRONT>;
>  
>              port {
>                  ucam_out: endpoint {
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5693.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5693.yaml
> index 3368b3bd8ef2..5732657e1484 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov5693.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5693.yaml
> @@ -103,6 +103,7 @@ examples:
>    - |
>      #include <dt-bindings/clock/px30-cru.h>
>      #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/media/video-interface-devices.h>
>      #include <dt-bindings/pinctrl/rockchip.h>
>  
>      i2c {
> @@ -126,7 +127,7 @@ examples:
>              dovdd-supply = <&vcc_2v8>;
>  
>              rotation = <90>;
> -            orientation = <0>;
> +            orientation = <MEDIA_ORIENTATION_FRONT>;
>  
>              port {
>                  ucam_out: endpoint {
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov64a40.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov64a40.yaml
> index 2b6143aff391..24787c9aa155 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov64a40.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov64a40.yaml
> @@ -72,6 +72,7 @@ unevaluatedProperties: false
>  examples:
>    - |
>        #include <dt-bindings/gpio/gpio.h>
> +      #include <dt-bindings/media/video-interface-devices.h>
>  
>        i2c {
>            #address-cells = <1>;
> @@ -87,7 +88,7 @@ examples:
>                powerdown-gpios = <&gpio1 9 GPIO_ACTIVE_HIGH>;
>                reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
>                rotation = <180>;
> -              orientation = <2>;
> +              orientation = <MEDIA_ORIENTATION_EXTERNAL>;
>  
>                port {
>                    endpoint {
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx111.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx111.yaml
> index 20f48d5e9b2d..56fb5f18f07b 100644
> --- a/Documentation/devicetree/bindings/media/i2c/sony,imx111.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx111.yaml
> @@ -69,6 +69,7 @@ examples:
>    - |
>      #include <dt-bindings/gpio/gpio.h>
>      #include <dt-bindings/media/video-interfaces.h>
> +    #include <dt-bindings/media/video-interface-devices.h>
>  
>      i2c {
>          #address-cells = <1>;
> @@ -84,7 +85,7 @@ examples:
>              dvdd-supply = <&camera_vddd_1v2>;
>              avdd-supply = <&camera_vdda_2v7>;
>  
> -            orientation = <1>;
> +            orientation = <MEDIA_ORIENTATION_BACK>;
>              rotation = <90>;
>  
>              nvmem = <&eeprom>;
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
> index 6050d7e7dcfe..b4a88eaa7ef2 100644
> --- a/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
> @@ -74,6 +74,7 @@ examples:
>    - |
>      #include <dt-bindings/clock/qcom,camcc-sdm845.h>
>      #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/media/video-interface-devices.h>
>  
>      i2c {
>          #address-cells = <1>;
> @@ -98,7 +99,7 @@ examples:
>              pinctrl-0 = <&cam_front_default>;
>  
>              rotation = <270>;
> -            orientation = <0>;
> +            orientation = <MEDIA_ORIENTATION_FRONT>;
>  
>              port {
>                  cam_front_endpoint: endpoint {
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
> index 7c11e871dca6..69a37ff68db3 100644
> --- a/Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
> @@ -86,6 +86,7 @@ unevaluatedProperties: false
>  examples:
>    - |
>      #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/media/video-interface-devices.h>
>  
>      i2c {
>          #address-cells = <1>;
> @@ -98,7 +99,7 @@ examples:
>              clocks = <&clock_cam>;
>              dvdd-supply = <&vcc1v1_cam>;
>              lens-focus = <&vcm>;
> -            orientation = <2>;
> +            orientation = <MEDIA_ORIENTATION_EXTERNAL>;
>              ovdd-supply = <&vcc1v8_cam>;
>              reset-gpios = <&gpio_expander 14 GPIO_ACTIVE_LOW>;
>              rotation = <180>;
> diff --git a/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml b/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml
> index 060ac6829b66..db9f0c15576c 100644
> --- a/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml
> @@ -105,6 +105,7 @@ unevaluatedProperties: false
>  examples:
>    - |
>      #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/media/video-interface-devices.h>
>  
>      i2c {
>          #address-cells = <1>;
> @@ -123,7 +124,7 @@ examples:
>              reset-gpios = <&gpio 5 GPIO_ACTIVE_LOW>;
>              st,leds = <2>;
>  
> -            orientation = <2>;
> +            orientation = <MEDIA_ORIENTATION_EXTERNAL>;
>              rotation = <0>;
>  
>              port {
> diff --git a/Documentation/devicetree/bindings/media/i2c/st,vd56g3.yaml b/Documentation/devicetree/bindings/media/i2c/st,vd56g3.yaml
> index c6673b8539db..48db22ca4a7e 100644
> --- a/Documentation/devicetree/bindings/media/i2c/st,vd56g3.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/st,vd56g3.yaml
> @@ -107,6 +107,7 @@ unevaluatedProperties: false
>  examples:
>    - |
>      #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/media/video-interface-devices.h>
>  
>      i2c {
>          #address-cells = <1>;
> @@ -125,7 +126,7 @@ examples:
>              reset-gpios = <&gpio 5 GPIO_ACTIVE_LOW>;
>              st,leds = <6>;
>  
> -            orientation = <2>;
> +            orientation = <MEDIA_ORIENTATION_EXTERNAL>;
>              rotation = <0>;
>  
>              port {
> diff --git a/Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml b/Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml
> index bc339a7374b2..4a66cb711372 100644
> --- a/Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml
> @@ -173,6 +173,7 @@ examples:
>    - |
>      #include <dt-bindings/gpio/gpio.h>
>      #include <dt-bindings/media/video-interfaces.h>
> +    #include <dt-bindings/media/video-interface-devices.h>
>  
>      i2c {
>          #address-cells = <1>;
> @@ -196,7 +197,7 @@ examples:
>              vddgpio-0-supply = <&vsys_v4p2>;
>              vddgpio-1-supply = <&vsys_v4p2>;
>  
> -            orientation = <0>;
> +            orientation = <MEDIA_ORIENTATION_FRONT>;
>              rotation = <0>;
>  
>              sensors {

-- 
Regards,

Laurent Pinchart

