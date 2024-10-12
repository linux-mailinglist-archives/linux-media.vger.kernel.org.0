Return-Path: <linux-media+bounces-19504-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F06699B68D
	for <lists+linux-media@lfdr.de>; Sat, 12 Oct 2024 20:10:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A137283347
	for <lists+linux-media@lfdr.de>; Sat, 12 Oct 2024 18:10:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B01001448DC;
	Sat, 12 Oct 2024 18:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VjwWB+JC"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84CD3FB8B;
	Sat, 12 Oct 2024 18:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728756608; cv=none; b=Cn+DvEJxXVEolMnqWn0Po4tNnjte7p9+X9pTOVQ100JJ4yQVr8fWyMc3+7DAd9wy2pXhJPLLprjg7iTX67LXl5etfP2t3DS9JHeSmaeSXHZA3wuH1xy1CLRGIhA2i9qX49IWHy9s4hjHt5wbCtymY2qMAJHgh203+gjv6fuARyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728756608; c=relaxed/simple;
	bh=RlGNorzjVHm9kw32mhWKejp/5jhHHRtlv3tETncOF3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ndg8YlEUSTKC3DT2S7/KXILl18ltz4jseQs8LZu0+1MDkVH6gk54vxMTdzKCbE9fFJTZ1CkYfAumPFl7kFO4oV99fmMPHEtfcFEOQjoUCvilCHlNV9PfZZwU2VPdh+mszovgybmnd2xmw6BFIkjW0H3gI8WY9P9SA+gUYYy8mGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=VjwWB+JC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [23.233.251.139])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5D0448BF;
	Sat, 12 Oct 2024 20:08:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1728756503;
	bh=RlGNorzjVHm9kw32mhWKejp/5jhHHRtlv3tETncOF3o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VjwWB+JCPWbNVUpOrXWSHqpG/vhlzui+J1ySviyDIbY/0GSxMVu03KKLu3NAAylrn
	 fmz+PvQUxEUv60r7nqGbPDuDtiptA+UrpLVzxu54bnzPGe06F1vQtQ3aUPrp60pmne
	 SB9w68HV2EmZW+LdxRbPlEhC+f8L0fBHEIetfCsQ=
Date: Sat, 12 Oct 2024 21:09:35 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	"Paul J. Murphy" <paul.j.murphy@intel.com>,
	Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Martin Hecht <martin.hecht@avnet.eu>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
	Ricardo Ribalda <ribalda@kernel.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Dongchun Zhu <dongchun.zhu@mediatek.com>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Todor Tomov <todor.too@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] media: dt-bindings: Use additionalProperties: false
 for endpoint: properties:
Message-ID: <20241012180935.GC5212@pendragon.ideasonboard.com>
References: <20241012-b4-linux-next-202041004-i2c-media-yaml-fixes-v1-0-a2bb12a1796d@linaro.org>
 <20241012-b4-linux-next-202041004-i2c-media-yaml-fixes-v1-2-a2bb12a1796d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241012-b4-linux-next-202041004-i2c-media-yaml-fixes-v1-2-a2bb12a1796d@linaro.org>

Hi Bryan,

Thank you for the patch.

On Sat, Oct 12, 2024 at 04:02:51PM +0100, Bryan O'Donoghue wrote:
> Some of our sensor schemas use unevaluatedProperities: false for endpoint:

s/unevaluatedProperities/unevaluatedProperties/

Same below.

> properties: while other schemas use additionalProperties: false.
> 
> The effect of using unevaluatedProperities: false in this instance is that
> any property in media/video-interfaces.yaml can be considered in a dts for
> an endpoint.
> 
> Converting to additionalProperties: false and running DT checkers show that
> such a liberal policy is unnecessary.
> 
> We should have a consistent way of defining these properties if for no
> other reason than aid other developers in the preferred way of writing
> these schemas for media/i2c in the future.
> 
> Convert to additionalProperties: as a result remote-endpoint needs to be
> added to the property list for most sensors. In a few cases some
> additional properties clock data-lanes or clock-lanes need to be added too
> but, for-the-most-part remote-endpoint is the only missing property.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../devicetree/bindings/media/i2c/alliedvision,alvium-csi2.yaml     | 5 ++++-
>  Documentation/devicetree/bindings/media/i2c/galaxycore,gc05a2.yaml  | 4 +++-
>  Documentation/devicetree/bindings/media/i2c/galaxycore,gc08a3.yaml  | 4 +++-
>  Documentation/devicetree/bindings/media/i2c/galaxycore,gc2145.yaml  | 6 +++++-
>  Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml        | 4 +++-
>  Documentation/devicetree/bindings/media/i2c/imx219.yaml             | 6 +++++-
>  Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml           | 4 +++-
>  Documentation/devicetree/bindings/media/i2c/ovti,og01a1b.yaml       | 4 +++-
>  Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml       | 4 +++-
>  Documentation/devicetree/bindings/media/i2c/ovti,ov4689.yaml        | 4 +++-
>  Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml        | 5 ++++-
>  Documentation/devicetree/bindings/media/i2c/ovti,ov5675.yaml        | 3 ++-
>  Documentation/devicetree/bindings/media/i2c/ovti,ov7251.yaml        | 4 +++-
>  Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml        | 5 ++++-
>  Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml        | 4 +++-
>  Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml        | 4 +++-
>  Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml        | 4 +++-
>  Documentation/devicetree/bindings/media/i2c/sony,imx283.yaml        | 4 +++-
>  Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml        | 4 +++-
>  Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml        | 4 +++-
>  Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml        | 4 +++-
>  Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml        | 4 +++-
>  Documentation/devicetree/bindings/media/i2c/toshiba,tc358746.yaml   | 4 +++-
>  23 files changed, 75 insertions(+), 23 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/alliedvision,alvium-csi2.yaml b/Documentation/devicetree/bindings/media/i2c/alliedvision,alvium-csi2.yaml
> index d3329e991d1652936fcf671012b8018e4317ea40..ba166ecf4fcbb77efab69ebcbdb46f5666af8e77 100644
> --- a/Documentation/devicetree/bindings/media/i2c/alliedvision,alvium-csi2.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/alliedvision,alvium-csi2.yaml
> @@ -32,7 +32,7 @@ properties:
>      properties:
>        endpoint:
>          $ref: /schemas/media/video-interfaces.yaml#
> -        unevaluatedProperties: false
> +        additionalProperties: false
>  
>          properties:
>            link-frequencies: true
> @@ -45,9 +45,12 @@ properties:
>                - const: 3
>                - const: 4
>  
> +          remote-endpoint: true
> +
>          required:
>            - data-lanes
>            - link-frequencies
> +          - remote-endpoint
>  
>  required:
>    - compatible
> diff --git a/Documentation/devicetree/bindings/media/i2c/galaxycore,gc05a2.yaml b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc05a2.yaml
> index 0e7a7b5ac89f618e6cba0d86f6f7ea853e59ae1e..8b42440586aa8c853d8bf6046ccab0c3b23cb907 100644
> --- a/Documentation/devicetree/bindings/media/i2c/galaxycore,gc05a2.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc05a2.yaml
> @@ -44,7 +44,7 @@ properties:
>      properties:
>        endpoint:
>          $ref: /schemas/media/video-interfaces.yaml#
> -        unevaluatedProperties: false
> +        additionalProperties: false
>  
>          properties:
>            data-lanes:
> @@ -59,10 +59,12 @@ properties:
>                    - const: 2
>  
>            link-frequencies: true
> +          remote-endpoint: true
>  
>          required:
>            - data-lanes
>            - link-frequencies
> +          - remote-endpoint
>  
>      required:
>        - endpoint
> diff --git a/Documentation/devicetree/bindings/media/i2c/galaxycore,gc08a3.yaml b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc08a3.yaml
> index 51b8ece09c722e057fdb01b38d3e360e7604f39a..c15169ef901139411273e110523a311d87b4322e 100644
> --- a/Documentation/devicetree/bindings/media/i2c/galaxycore,gc08a3.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc08a3.yaml
> @@ -44,7 +44,7 @@ properties:
>      properties:
>        endpoint:
>          $ref: /schemas/media/video-interfaces.yaml#
> -        unevaluatedProperties: false
> +        additionalProperties: false
>  
>          properties:
>            data-lanes:
> @@ -59,10 +59,12 @@ properties:
>                    - const: 2
>  
>            link-frequencies: true
> +          remote-endpoint: true
>  
>          required:
>            - data-lanes
>            - link-frequencies
> +          - remote-endpoint
>  
>      required:
>        - endpoint
> diff --git a/Documentation/devicetree/bindings/media/i2c/galaxycore,gc2145.yaml b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc2145.yaml
> index 9eac588de0bc28d85f44663afe5472e35f1e652c..702625962d90ea7fafb4f4f4f865659097b51406 100644
> --- a/Documentation/devicetree/bindings/media/i2c/galaxycore,gc2145.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc2145.yaml
> @@ -56,13 +56,17 @@ properties:
>      properties:
>        endpoint:
>          $ref: /schemas/media/video-interfaces.yaml#
> -        unevaluatedProperties: false
> +        additionalProperties: false
>  
>          properties:
> +          data-lanes: true

We should have a more precise constraint here. The sensor supports
single or dual data lanes operation, so you can write

          data-lanes:
	    minItems: 1
	    items:
	      - const: 1
	      - const: 2

>            link-frequencies: true
> +          remote-endpoint: true
>  
>          required:
> +          - data-lanes
>            - link-frequencies
> +          - remote-endpoint
>  
>      required:
>        - endpoint
> diff --git a/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml b/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> index d18ead8f7fc43bfacc291aed85b5ca9166c46edb..52bb089bd67fd0f9b5464e068b8db0b8e4406b3d 100644
> --- a/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> @@ -52,7 +52,7 @@ properties:
>      properties:
>        endpoint:
>          $ref: /schemas/media/video-interfaces.yaml#
> -        unevaluatedProperties: false
> +        additionalProperties: false
>  
>          properties:
>            data-lanes:
> @@ -67,10 +67,12 @@ properties:
>                    - const: 2
>  
>            link-frequencies: true
> +          remote-endpoint: true
>  
>          required:
>            - data-lanes
>            - link-frequencies
> +          - remote-endpoint
>  
>  required:
>    - compatible
> diff --git a/Documentation/devicetree/bindings/media/i2c/imx219.yaml b/Documentation/devicetree/bindings/media/i2c/imx219.yaml
> index 07d088cf66e0bde362b12d3494e5c91a1dd96bf3..5f395cf04b95ca47d5e685b8c43b8265db6910ae 100644
> --- a/Documentation/devicetree/bindings/media/i2c/imx219.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/imx219.yaml
> @@ -52,7 +52,7 @@ properties:
>      properties:
>        endpoint:
>          $ref: /schemas/media/video-interfaces.yaml#
> -        unevaluatedProperties: false
> +        additionalProperties: false
>  
>          properties:
>            data-lanes:
> @@ -65,10 +65,14 @@ properties:
>                - const: 2
>  
>            clock-noncontinuous: true
> +          clock-lanes: true

This shouldn't be needed, as the sensor doesn't support clock lane
remapping. Could we drop the clock-lanes property from upstream device
tree sources instead ?

>            link-frequencies: true
> +          remote-endpoint: true
>  
>          required:
> +          - data-lanes
>            - link-frequencies
> +          - remote-endpoint
>  
>  required:
>    - compatible
> diff --git a/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml b/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
> index f8ace8cbccdbac482ffba733d5b28a3a38aaf822..ce45bd8409597fa6989f632d68cd4aa1a468d152 100644
> --- a/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
> @@ -77,7 +77,7 @@ properties:
>      properties:
>        endpoint:
>          $ref: /schemas/media/video-interfaces.yaml#
> -        unevaluatedProperties: false
> +        additionalProperties: false
>  
>          properties:
>            link-frequencies: true
> @@ -87,11 +87,13 @@ properties:
>                - 1 # CSI-2 C-PHY
>                - 3 # CCP2
>                - 4 # CSI-2 D-PHY
> +          remote-endpoint: true
>  
>          required:
>            - link-frequencies
>            - data-lanes
>            - bus-type
> +          - remote-endpoint
>  
>  required:
>    - compatible
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,og01a1b.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,og01a1b.yaml
> index ca57c01739d2b93100a37db56255ab717c1197ff..9b3738956c482d8826bf64f557c2e91630ea9799 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,og01a1b.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,og01a1b.yaml
> @@ -55,7 +55,7 @@ properties:
>      properties:
>        endpoint:
>          $ref: /schemas/media/video-interfaces.yaml#
> -        unevaluatedProperties: false
> +        additionalProperties: false
>  
>          properties:
>            data-lanes:
> @@ -65,10 +65,12 @@ properties:
>                enum: [1, 2]
>  
>            link-frequencies: true
> +          remote-endpoint: true
>  
>          required:
>            - data-lanes
>            - link-frequencies
> +          - remote-endpoint
>  
>  required:
>    - compatible
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> index 67c1c291327b7febb6a039bf6f28c8dc1f32ed7f..b8db4be137085fe31ec2f076c7dc66b30bf0b66c 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> @@ -77,7 +77,7 @@ properties:
>      properties:
>        endpoint:
>          $ref: /schemas/media/video-interfaces.yaml#
> -        unevaluatedProperties: false
> +        additionalProperties: false
>  
>          properties:
>            link-frequencies: true
> @@ -88,9 +88,11 @@ properties:
>                the link speed defined by the 'link-frequencies' property.
>                If present, the value shall be in the range of 0-4.
>              default: 4
> +          remote-endpoint: true
>  
>          required:
>            - link-frequencies
> +          - remote-endpoint
>  
>      required:
>        - endpoint
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov4689.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov4689.yaml
> index d96199031b66c5c162a034824f195e277f2a1795..7499523a6e0fbd64b9b980333adaa14a0c40a33b 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov4689.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov4689.yaml
> @@ -61,7 +61,7 @@ properties:
>      properties:
>        endpoint:
>          $ref: /schemas/media/video-interfaces.yaml#
> -        unevaluatedProperties: false
> +        additionalProperties: false
>  
>          properties:
>            data-lanes:
> @@ -77,10 +77,12 @@ properties:
>                - items:
>                    - const: 1
>            link-frequencies: true
> +          remote-endpoint: true
>  
>          required:
>            - data-lanes
>            - link-frequencies
> +          - remote-endpoint
>  
>  required:
>    - compatible
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml
> index 622243cae03caa5d14aa312df40ef5907e190d2c..358c0422451f7faa8e0ebfc9226a5cfb087e3598 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml
> @@ -45,7 +45,7 @@ properties:
>      properties:
>        endpoint:
>          $ref: /schemas/media/video-interfaces.yaml#
> -        unevaluatedProperties: false
> +        additionalProperties: false
>  
>          properties:
>            link-frequencies: true
> @@ -54,9 +54,12 @@ properties:
>              minItems: 1
>              maxItems: 2
>  
> +          remote-endpoint: true
> +
>          required:
>            - data-lanes
>            - link-frequencies
> +          - remote-endpoint
>  
>  required:
>    - compatible
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5675.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5675.yaml
> index ad07204057f979ade534d29c99c3aff7372bd332..eff212524bf3c7b1ec6aa7e826d4318d58ba53a5 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov5675.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5675.yaml
> @@ -60,7 +60,7 @@ properties:
>      properties:
>        endpoint:
>          $ref: /schemas/media/video-interfaces.yaml#
> -        unevaluatedProperties: false
> +        additionalProperties: false
>  
>          properties:
>            data-lanes:
> @@ -69,6 +69,7 @@ properties:
>  
>            # Supports max data transfer of 900 Mbps per lane
>            link-frequencies: true
> +          remote-endpoint: true
>  
>  required:
>    - compatible
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov7251.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov7251.yaml
> index 2e5187acbbb89728cbb8a402559d24766198a3da..cbbe3c9ce151eb33d2b0cc1a44e6ebf66d9b59fa 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov7251.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov7251.yaml
> @@ -53,7 +53,7 @@ properties:
>      properties:
>        endpoint:
>          $ref: /schemas/media/video-interfaces.yaml#
> -        unevaluatedProperties: false
> +        additionalProperties: false
>  
>          properties:
>            clock-lanes:
> @@ -63,10 +63,12 @@ properties:
>              maxItems: 1
>  
>            link-frequencies: true
> +          remote-endpoint: true
>  
>          required:
>            - data-lanes
>            - link-frequencies
> +          - remote-endpoint
>  
>  required:
>    - compatible
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
> index 382d7de7a89bcea11be384a2a3800512994f9346..dd5c5715fdcfc00e6d851f375f41e4d077b92bc0 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
> @@ -45,7 +45,7 @@ properties:
>      properties:
>        endpoint:
>          $ref: /schemas/media/video-interfaces.yaml#
> -        unevaluatedProperties: false
> +        additionalProperties: false
>  
>          properties:
>            link-frequencies: true
> @@ -54,9 +54,12 @@ properties:
>              minItems: 1
>              maxItems: 4
>  
> +          remote-endpoint: true
> +
>          required:
>            - data-lanes
>            - link-frequencies
> +          - remote-endpoint
>  
>  required:
>    - compatible
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml
> index 38325cf318f7bd2cd60a4c7bbb6a65b54b855e26..dde4e7426bf00920f1bd9ed1bf4d8594932dedaf 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml
> @@ -51,15 +51,17 @@ properties:
>      properties:
>        endpoint:
>          $ref: /schemas/media/video-interfaces.yaml#
> -        unevaluatedProperties: false
> +        additionalProperties: false
>  
>          properties:
>            data-lanes: true
>            link-frequencies: true
> +          remote-endpoint: true
>  
>          required:
>            - data-lanes
>            - link-frequencies
> +          - remote-endpoint
>  
>      required:
>        - endpoint
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
> index 0162eec8ca993a7614d29908f89fa9fe6d4b545d..9b78ff6bd5f114c7f63ac90e71fa677445ddf702 100644
> --- a/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
> @@ -58,7 +58,7 @@ properties:
>      properties:
>        endpoint:
>          $ref: /schemas/media/video-interfaces.yaml#
> -        unevaluatedProperties: false
> +        additionalProperties: false
>  
>          properties:
>            data-lanes:
> @@ -73,10 +73,12 @@ properties:
>                    - const: 4
>  
>            link-frequencies: true
> +          remote-endpoint: true
>  
>          required:
>            - data-lanes
>            - link-frequencies
> +          - remote-endpoint
>  
>      additionalProperties: false
>  
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
> index f0f9726a2add89492b8c56e17ed607841baa3a0d..4cf49472c24f1b800f6d2e41b8716e2ac32f959a 100644
> --- a/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
> @@ -56,7 +56,7 @@ properties:
>      properties:
>        endpoint:
>          $ref: /schemas/media/video-interfaces.yaml#
> -        unevaluatedProperties: false
> +        additionalProperties: false
>  
>          properties:
>            data-lanes:
> @@ -71,10 +71,12 @@ properties:
>                    - const: 2
>  
>            link-frequencies: true
> +          remote-endpoint: true
>  
>          required:
>            - data-lanes
>            - link-frequencies
> +          - remote-endpoint
>  
>  required:
>    - compatible
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx283.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx283.yaml
> index e4f49f1435a5c2e6e1507d250662ea6ecbf3c7dc..75b78a3e925ed2fd09f56c8349d234a32739f141 100644
> --- a/Documentation/devicetree/bindings/media/i2c/sony,imx283.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx283.yaml
> @@ -48,7 +48,7 @@ properties:
>      properties:
>        endpoint:
>          $ref: /schemas/media/video-interfaces.yaml#
> -        unevaluatedProperties: false
> +        additionalProperties: false
>  
>          properties:
>            data-lanes:
> @@ -60,10 +60,12 @@ properties:
>                    - const: 4
>  
>            link-frequencies: true
> +          remote-endpoint: true
>  
>          required:
>            - data-lanes
>            - link-frequencies
> +          - remote-endpoint
>  
>      required:
>        - endpoint
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
> index bf05ca48601abda53d60a3d03aa556e7b8fd825b..e6aec7a1ba2b22a11111d19a61384f1200041df5 100644
> --- a/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
> @@ -71,7 +71,7 @@ properties:
>      properties:
>        endpoint:
>          $ref: /schemas/media/video-interfaces.yaml#
> -        unevaluatedProperties: false
> +        additionalProperties: false
>  
>          properties:
>            data-lanes:
> @@ -86,10 +86,12 @@ properties:
>                    - const: 4
>  
>            link-frequencies: true
> +          remote-endpoint: true
>  
>          required:
>            - data-lanes
>            - link-frequencies
> +          - remote-endpoint
>  
>      additionalProperties: false
>  
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
> index 872b8288948b2bba743f2365a55165181df156ae..d30ef330e5af225728d1a6c40b26050cd33ba4be 100644
> --- a/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
> @@ -38,15 +38,17 @@ properties:
>      properties:
>        endpoint:
>          $ref: /schemas/media/video-interfaces.yaml#
> -        unevaluatedProperties: false
> +        additionalProperties: false
>  
>          properties:
>            data-lanes: true
>            link-frequencies: true
> +          remote-endpoint: true
>  
>          required:
>            - data-lanes
>            - link-frequencies
> +          - remote-endpoint
>  
>      required:
>        - endpoint
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
> index 38bd1c7304a59bb5fea90954c1e4e626a7c86f2f..36c3a0ba7822475770cd903cec3343d31bb66520 100644
> --- a/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
> @@ -48,15 +48,17 @@ properties:
>      properties:
>        endpoint:
>          $ref: /schemas/media/video-interfaces.yaml#
> -        unevaluatedProperties: false
> +        additionalProperties: false
>  
>          properties:
>            data-lanes: true
>            link-frequencies: true
> +          remote-endpoint: true
>  
>          required:
>            - data-lanes
>            - link-frequencies
> +          - remote-endpoint
>  
>      required:
>        - endpoint
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
> index ece1e17fe34553671e61c965eb1833c5eb08131b..0bbdf657a8c0643ffe512ae04c14dfc8e6b4fc94 100644
> --- a/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
> @@ -50,15 +50,17 @@ properties:
>      properties:
>        endpoint:
>          $ref: /schemas/media/video-interfaces.yaml#
> -        unevaluatedProperties: false
> +        additionalProperties: false
>  
>          properties:
>            data-lanes: true
>            link-frequencies: true
> +          remote-endpoint: true
>  
>          required:
>            - data-lanes
>            - link-frequencies
> +          - remote-endpoint
>  
>      required:
>        - endpoint
> diff --git a/Documentation/devicetree/bindings/media/i2c/toshiba,tc358746.yaml b/Documentation/devicetree/bindings/media/i2c/toshiba,tc358746.yaml
> index 1c476b635b690865cff0882578d72b1db2dc7c50..367d669ad864ed6b2a8762f953f58e206c8c8194 100644
> --- a/Documentation/devicetree/bindings/media/i2c/toshiba,tc358746.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/toshiba,tc358746.yaml
> @@ -96,7 +96,7 @@ properties:
>          properties:
>            endpoint:
>              $ref: /schemas/media/video-interfaces.yaml#
> -            unevaluatedProperties: false
> +            additionalProperties: false
>  
>              properties:
>                data-lanes:
> @@ -105,10 +105,12 @@ properties:
>  
>                clock-noncontinuous: true
>                link-frequencies: true
> +              remote-endpoint: true
>  
>              required:
>                - data-lanes
>                - link-frequencies
> +              - remote-endpoint
>  
>      required:
>        - port@0
> 

-- 
Regards,

Laurent Pinchart

