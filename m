Return-Path: <linux-media+bounces-55923-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGEbFX0LuGkWYQEAu9opvQ
	(envelope-from <linux-media+bounces-55923-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 14:54:05 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3859D29AD63
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 14:54:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 660163017DCC
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 13:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7D5139A7F3;
	Mon, 16 Mar 2026 13:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="b6kfgmPq"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5F93976B4;
	Mon, 16 Mar 2026 13:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773669239; cv=none; b=gtlQS1WMFMt+IvwgIPA97glqNi4EKBpEDKMmwxNt79ncaMCy9AdSQC/tpJuGEw0MjIQ/xWmh6DeTxXgelPPFycmwxl6/b2gmOYjV0Szk0TAZG76d/OJzMcj31qky90sqSGreXzc3AD83Bfz2oKiFc5FCbkac1k1VwDr/dbmTN3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773669239; c=relaxed/simple;
	bh=l7jqpAOj4gSiCcKC2p4qCCwyoXU+8KojYJAEGAYk01g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q/9Y9aIAR2YBhWrODiiQkf6Y1cYzCYHTocDXaMls4PirhAP4H0WgET5YhIoVk2qYoafKQrv1406W/YxZ1q3bM+nsdxVvChx5JFgjDdGtd9+fWhSf2UtA79z9uGVFBIdSpJ8ZC2yuhZR+/mn+cG5SNRsgyAVvmNkR4ClKGG4+qMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=b6kfgmPq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 8409CBD2;
	Mon, 16 Mar 2026 14:52:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773669162;
	bh=l7jqpAOj4gSiCcKC2p4qCCwyoXU+8KojYJAEGAYk01g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b6kfgmPqOqDuPpvx7+wy3hMk8tpgED/LCgKmLY47lPS5V89DHd32qq+LQMv4EmwW6
	 KpuKi8cqiB2/ae8N9lp4zdGvdoKVT0uA13rO4QWRJb46MhOWo0DJ+aDgUU1Zc5pOkK
	 3JHAvIPItAF7c4+y2jmyfp3BZQLgeJyVU5EiHIZ0=
Date: Mon, 16 Mar 2026 15:53:52 +0200
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Tommaso Merciai <tomm.merciai@gmail.com>,
	Martin Hecht <mhecht73@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Dongchun Zhu <dongchun.zhu@mediatek.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Todor Tomov <todor.too@gmail.com>,
	"Paul J. Murphy" <paul.j.murphy@intel.com>,
	Daniele Alessandrelli <daniele.alessandrelli@gmail.com>,
	Marco Felsch <kernel@pengutronix.de>,
	Lubomir Rintel <lkundrak@v3.sk>, linux-renesas-soc@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: dt-bindings: i2c: Drop redundant endpoint
 properties
Message-ID: <20260316135352.GA31616@killaraus.ideasonboard.com>
References: <20260316134533.56941-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260316134533.56941-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55923-lists,linux-media=lfdr.de,renesas];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,foss.st.com,jmondi.org,ideasonboard.com,ragnatech.se,linux.intel.com,raspberrypi.com,glider.be,linaro.org,mediatek.com,bootlin.com,theobroma-systems.com,intel.com,pengutronix.de,v3.sk,vger.kernel.org,bp.renesas.com];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,killaraus.ideasonboard.com:mid]
X-Rspamd-Queue-Id: 3859D29AD63
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello Krzysztof,

Thank you for the patch.

On Mon, Mar 16, 2026 at 02:45:34PM +0100, Krzysztof Kozlowski wrote:
> The "endpoint" node references video-interfaces.yaml schema with
> "unevaluatedProperties: false" which means that all properties from
> referenced schema apply.  Listing some of them with ": true" is simply
> redundant and does not make this code easier to read.

I think you know my opinion on this topic. I believe we would be better
off by turning "unevaluatedProperties: false" into
"additionalProperties: false" here, and keeping the list of applicable
properties. It brings value to device tree authors by telling which
properties are applicable to the device at hand. For instance ... (see
below)

> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../bindings/media/i2c/alliedvision,alvium-csi2.yaml      | 2 --
>  .../devicetree/bindings/media/i2c/galaxycore,gc0308.yaml  | 8 --------
>  .../devicetree/bindings/media/i2c/galaxycore,gc2145.yaml  | 3 ---
>  .../devicetree/bindings/media/i2c/maxim,max9286.yaml      | 3 ---
>  .../devicetree/bindings/media/i2c/maxim,max96712.yaml     | 1 -
>  Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml | 2 --
>  .../devicetree/bindings/media/i2c/ovti,og01a1b.yaml       | 2 --
>  .../devicetree/bindings/media/i2c/ovti,ov02a10.yaml       | 1 -
>  .../devicetree/bindings/media/i2c/ovti,ov5647.yaml        | 3 ---
>  .../devicetree/bindings/media/i2c/ovti,ov5648.yaml        | 2 --
>  .../devicetree/bindings/media/i2c/ovti,ov5675.yaml        | 4 +---
>  .../devicetree/bindings/media/i2c/ovti,ov7251.yaml        | 2 --
>  .../devicetree/bindings/media/i2c/ovti,ov8865.yaml        | 2 --
>  .../devicetree/bindings/media/i2c/ovti,ov9282.yaml        | 4 ----
>  .../devicetree/bindings/media/i2c/sony,imx334.yaml        | 4 ----
>  .../devicetree/bindings/media/i2c/sony,imx412.yaml        | 4 ----
>  .../devicetree/bindings/media/i2c/toshiba,tc358746.yaml   | 5 -----
>  17 files changed, 1 insertion(+), 51 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/alliedvision,alvium-csi2.yaml b/Documentation/devicetree/bindings/media/i2c/alliedvision,alvium-csi2.yaml
> index d3329e991d16..c2ae33532700 100644
> --- a/Documentation/devicetree/bindings/media/i2c/alliedvision,alvium-csi2.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/alliedvision,alvium-csi2.yaml
> @@ -35,8 +35,6 @@ properties:
>          unevaluatedProperties: false
>  
>          properties:
> -          link-frequencies: true
> -
>            data-lanes:
>              minItems: 1
>              items:
> diff --git a/Documentation/devicetree/bindings/media/i2c/galaxycore,gc0308.yaml b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc0308.yaml
> index 2bf1a81feaf4..fcf79f4c5a0d 100644
> --- a/Documentation/devicetree/bindings/media/i2c/galaxycore,gc0308.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc0308.yaml
> @@ -53,14 +53,6 @@ properties:
>          $ref: /schemas/media/video-interfaces.yaml#
>          unevaluatedProperties: false
>  
> -        properties:
> -          bus-width: true
> -          data-shift: true
> -          hsync-active: true
> -          vsync-active: true
> -          data-active: true
> -          pclk-sample: true
> -
>          required:
>            - bus-width
>  
> diff --git a/Documentation/devicetree/bindings/media/i2c/galaxycore,gc2145.yaml b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc2145.yaml
> index 9eac588de0bc..ccac2cb85d57 100644
> --- a/Documentation/devicetree/bindings/media/i2c/galaxycore,gc2145.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc2145.yaml
> @@ -58,9 +58,6 @@ properties:
>          $ref: /schemas/media/video-interfaces.yaml#
>          unevaluatedProperties: false
>  
> -        properties:
> -          link-frequencies: true
> -
>          required:
>            - link-frequencies
>  
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> index a37447256f8d..d806b821dae3 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> @@ -137,9 +137,6 @@ properties:
>              $ref: /schemas/media/video-interfaces.yaml#
>              unevaluatedProperties: false
>  
> -            properties:
> -              data-lanes: true
> -
>              required:
>                - data-lanes
>  
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> index 26f85151afbd..4b9afc73de62 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> @@ -67,7 +67,6 @@ properties:
>              unevaluatedProperties: false
>  
>              properties:
> -              data-lanes: true
>                bus-type:
>                  enum:
>                    - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
> diff --git a/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml b/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
> index 217b08c8cbbd..9ba8a17c62e0 100644
> --- a/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
> @@ -78,8 +78,6 @@ properties:
>          unevaluatedProperties: false
>  
>          properties:
> -          link-frequencies: true
> -          data-lanes: true
>            bus-type:
>              enum:
>                - 1 # CSI-2 C-PHY
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,og01a1b.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,og01a1b.yaml
> index ca57c01739d2..efdac2e91589 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,og01a1b.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,og01a1b.yaml
> @@ -64,8 +64,6 @@ properties:
>              items:
>                enum: [1, 2]
>  
> -          link-frequencies: true
> -
>          required:
>            - data-lanes
>            - link-frequencies
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> index 0e1d9c390180..b98260d5e6a3 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> @@ -81,7 +81,6 @@ properties:
>          unevaluatedProperties: false
>  
>          properties:
> -          link-frequencies: true
>            ovti,mipi-clock-voltage:
>              $ref: /schemas/types.yaml#/definitions/uint32
>              description:
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml
> index 2d7937a372a2..7a05a1eda58d 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml
> @@ -51,9 +51,6 @@ properties:
>          $ref: /schemas/media/video-interfaces.yaml#
>          unevaluatedProperties: false
>  
> -        properties:
> -          clock-noncontinuous: true
> -

... Without this, an integrator will need to dive into driver code to
know if non-continuous clock is usable for the device.

>  required:
>    - compatible
>    - reg
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml
> index 8028c8b107c4..ec53e55b2290 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml
> @@ -48,8 +48,6 @@ properties:
>          unevaluatedProperties: false
>  
>          properties:
> -          link-frequencies: true
> -
>            data-lanes:
>              minItems: 1
>              maxItems: 2
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5675.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5675.yaml
> index ad07204057f9..90b2c6d35df6 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov5675.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5675.yaml
> @@ -21,6 +21,7 @@ description: |
>  
>    This chip is programmable through I2C and two-wire SCCB. The sensor output
>    is available via CSI-2 serial data output (up to 2-lane).
> +  It supports max data transfer of 900 Mbps per lane.
>  
>  properties:
>    compatible:
> @@ -67,9 +68,6 @@ properties:
>              minItems: 1
>              maxItems: 2
>  
> -          # Supports max data transfer of 900 Mbps per lane
> -          link-frequencies: true
> -
>  required:
>    - compatible
>    - reg
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov7251.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov7251.yaml
> index 922996da59b2..0ad271a4bf39 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov7251.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov7251.yaml
> @@ -63,8 +63,6 @@ properties:
>            data-lanes:
>              maxItems: 1
>  
> -          link-frequencies: true
> -
>          required:
>            - data-lanes
>            - link-frequencies
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
> index 320b9aacbb8b..c535a5257a3e 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
> @@ -48,8 +48,6 @@ properties:
>          unevaluatedProperties: false
>  
>          properties:
> -          link-frequencies: true
> -
>            data-lanes:
>              minItems: 1
>              maxItems: 4
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml
> index 401c8613f840..20dc0885e30e 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml
> @@ -53,10 +53,6 @@ properties:
>          $ref: /schemas/media/video-interfaces.yaml#
>          unevaluatedProperties: false
>  
> -        properties:
> -          data-lanes: true
> -          link-frequencies: true
> -
>          required:
>            - data-lanes
>            - link-frequencies
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
> index 3842e5130463..e90ebe6a0a24 100644
> --- a/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
> @@ -40,10 +40,6 @@ properties:
>          $ref: /schemas/media/video-interfaces.yaml#
>          unevaluatedProperties: false
>  
> -        properties:
> -          data-lanes: true
> -          link-frequencies: true
> -
>          required:
>            - data-lanes
>            - link-frequencies
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
> index 5447ab0768a6..dec428d46937 100644
> --- a/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
> @@ -52,10 +52,6 @@ properties:
>          $ref: /schemas/media/video-interfaces.yaml#
>          unevaluatedProperties: false
>  
> -        properties:
> -          data-lanes: true
> -          link-frequencies: true
> -
>          required:
>            - data-lanes
>            - link-frequencies
> diff --git a/Documentation/devicetree/bindings/media/i2c/toshiba,tc358746.yaml b/Documentation/devicetree/bindings/media/i2c/toshiba,tc358746.yaml
> index 1c476b635b69..505c6d22ef7c 100644
> --- a/Documentation/devicetree/bindings/media/i2c/toshiba,tc358746.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/toshiba,tc358746.yaml
> @@ -78,8 +78,6 @@ properties:
>              unevaluatedProperties: false
>  
>              properties:
> -              hsync-active: true
> -              vsync-active: true
>                bus-type:
>                  enum: [ 5, 6 ]
>  
> @@ -103,9 +101,6 @@ properties:
>                  minItems: 1
>                  maxItems: 4
>  
> -              clock-noncontinuous: true
> -              link-frequencies: true
> -
>              required:
>                - data-lanes
>                - link-frequencies

-- 
Regards,

Laurent Pinchart

