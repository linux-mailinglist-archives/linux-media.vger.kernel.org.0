Return-Path: <linux-media+bounces-30862-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5D1A99761
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 20:01:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 56048189FE65
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 18:02:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDE3A28CF6E;
	Wed, 23 Apr 2025 18:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="S75i8fgF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604EA266572;
	Wed, 23 Apr 2025 18:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745431304; cv=none; b=FPc+tk06FFsOGZWZc7LbBF63R9m+jLb5ieSug+mjT0I3R8TFbKWZEnTgUtMmZucY/pHcJHIputcOQeZlANv7rMYHhtt7Wm1Vl+1Ts7AhNgC4Q3RLJHEkrU/FkoTkBlplZDylyF5rrs/THoha/tIaPm5gSI6OU8/6SX/OMSaSm8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745431304; c=relaxed/simple;
	bh=g9AB/aDWRYjuAr19HwboGdY5EBOTatITlBiKctMx16E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f/Tb6pGNLNamcAuYqFv4ZdFLW2zyil7YbcbdzXXP6VyRRJ7g1Xhdu9ttt67ab5sYsw+MMt5ij6DhkCNAyhkif4TkPz1IyfNmmLVUho9v6w8Bo0LIWbHcezYS7ZqIwswgPg7mc2pmPMYjQpfBHYve7kj3yJNYdbhI7ncKm3bgjDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=S75i8fgF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E14D51AE2;
	Wed, 23 Apr 2025 20:01:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745431299;
	bh=g9AB/aDWRYjuAr19HwboGdY5EBOTatITlBiKctMx16E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S75i8fgF+DfsHY0fhywEUG0IM+HotIYy+iBGH1Zpo9AGpSwCxOj/lAAnSRQnVHgYm
	 k+ONrQByI+CpRVZ2tYTdo8kilZtLERwDLz4ijFHZaer5gC1Ync2n4xf7Wy9dTsP/lQ
	 cGSk7Uu30TkAvND5huquLbQRitHyNw9BBNo6lfcM=
Date: Wed, 23 Apr 2025 21:01:38 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mathis Foerst <mathis.foerst@mt.com>
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	manuel.traut@mt.com, mathis.foerst@zuehlke.com
Subject: Re: [PATCH v4 1/6] media: dt-bindings: mt9m114: Add slew-rate
 DT-binding
Message-ID: <20250423180138.GA2675@pendragon.ideasonboard.com>
References: <20250307093140.370061-1-mathis.foerst@mt.com>
 <20250307093140.370061-2-mathis.foerst@mt.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250307093140.370061-2-mathis.foerst@mt.com>

Hi Mathis,

Thank you for the patch.

On Fri, Mar 07, 2025 at 10:31:35AM +0100, Mathis Foerst wrote:
> The MT9M114 supports the different slew rates (0 to 7) on the output pads.
> At the moment, this is hardcoded to 7 (the fastest rate).
> The user might want to change this values due to EMC requirements.
> 
> Add the 'slew-rate' property to the MT9M114 DT-bindings for selecting
> the desired slew rate.
> 
> Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
> ---
>  .../devicetree/bindings/media/i2c/onnn,mt9m114.yaml      | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> index f6b87892068a..a89f740214f7 100644
> --- a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> @@ -70,6 +70,15 @@ properties:
>            - bus-type
>            - link-frequencies
>  
> +  slew-rate:

Shouldn't this be a vendor property, with a vendor prefix (i.e.
'onnn,slew-rate') ? There's a 'slew-rate' property defined in
Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml, but that's
for pin config nodes.

The rest looks good, so with this change (or without it if there's a
consensus we don't need a vendor prefix),

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Slew rate ot the output pads DOUT[7:0], LINE_VALID, FRAME_VALID and
> +      PIXCLK. Higher values imply steeper voltage-flanks on the pads.
> +    minimum: 0
> +    maximum: 7
> +    default: 7
> +
>  required:
>    - compatible
>    - reg

-- 
Regards,

Laurent Pinchart

