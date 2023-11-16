Return-Path: <linux-media+bounces-420-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5D57ED8B2
	for <lists+linux-media@lfdr.de>; Thu, 16 Nov 2023 01:51:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF7E61F22F61
	for <lists+linux-media@lfdr.de>; Thu, 16 Nov 2023 00:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C40D810F0;
	Thu, 16 Nov 2023 00:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EDptMfqE"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C4C01B9;
	Wed, 15 Nov 2023 16:51:36 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 99697B9A;
	Thu, 16 Nov 2023 01:51:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1700095868;
	bh=18xXfXfw+tBl0xHCFm3jGrfNhRXP3Rv8yr93gRiQOkg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EDptMfqEsX+ghwRRlb6ihCUitYmpgij7FW5JBZjiU6pVDw20fKVzzuNyQeEzZMQWf
	 b14MmvoDtbjd+x8cWB78ZbxSgvmWBAcxBld64GMs11Q8mjAucfdSLQE5jicpeTueJZ
	 XH+awjkdPx0Z+oueccl59BgpJnACFgJprXOSZz7I=
Date: Thu, 16 Nov 2023 02:51:40 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mehdi Djait <mehdi.djait@bootlin.com>
Cc: krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
	conor+dt@kernel.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com, alexandre.belloni@bootlin.com,
	paul.kocialkowski@bootlin.com, dafna@fastmail.com,
	helen.koike@collabora.com, heiko@sntech.de,
	paul.elder@ideasonboard.com
Subject: Re: [PATCH] media: dt-bindings: media: rkisp1: Fix the port
 description for the parallel interface
Message-ID: <20231116005140.GB21041@pendragon.ideasonboard.com>
References: <20231115164407.99876-1-mehdi.djait@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231115164407.99876-1-mehdi.djait@bootlin.com>

Hi Mehdi,

Thank you for the patch.

On Wed, Nov 15, 2023 at 05:44:07PM +0100, Mehdi Djait wrote:
> The bus-type belongs to the endpoint's properties and should therefore
> be moved.
> 
> Fixes: 6a0eaa25bf36 ("media: dt-bindings: media: rkisp1: Add port for parallel interface")
> Signed-off-by: Mehdi Djait <mehdi.djait@bootlin.com>

Good catch.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../devicetree/bindings/media/rockchip-isp1.yaml      | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/rockchip-isp1.yaml b/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
> index e466dff8286d..afcaa427d48b 100644
> --- a/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
> +++ b/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
> @@ -90,15 +90,16 @@ properties:
>          description: connection point for input on the parallel interface
>  
>          properties:
> -          bus-type:
> -            enum: [5, 6]
> -
>            endpoint:
>              $ref: video-interfaces.yaml#
>              unevaluatedProperties: false
>  
> -        required:
> -          - bus-type
> +            properties:
> +              bus-type:
> +                enum: [5, 6]
> +
> +            required:
> +              - bus-type
>  
>      anyOf:
>        - required:

-- 
Regards,

Laurent Pinchart

