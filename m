Return-Path: <linux-media+bounces-27632-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F7AA50015
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 14:16:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 004643B3F14
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 13:10:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 778E5248866;
	Wed,  5 Mar 2025 13:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gsz4fZvj"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06BE1E531;
	Wed,  5 Mar 2025 13:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741180103; cv=none; b=gDKRqi84mAIYqgsyTs+z85rSCJe1P1/Lep0ExSYa/cf7u6eh35LuBZtZ8V7OQ6r+wNn5LdQ9exerh+uUZFVS0zDK1Zrn3yWG6bpS0nGNMlWQVjDMcUM/gu9tTIsk57pGY3ucizFYEs2E8DMp+OeMoD9hRkIk7kPJhfQCwZ/VlCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741180103; c=relaxed/simple;
	bh=siWdAxhLrN0DI+R0aKzyG6rDmCVTF6VPwiS27Qnj7bo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I2TEn8Kb77i/0VYn4+/2fb6/8uA/mQ0LnOdOx7QHwP9GIRmAgzKFbhZO8m/f9ldBVt4pBme0iGi6Y6bJdKVQL3d7KKNg+E+0uuV6L4B0vw4tLHU7fShb4bHX/3AA2PNqGDNC8O63wFOpIBEERS09gKm8UiBdzGvP2OJhjGMfqj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gsz4fZvj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AC7EC4CEE2;
	Wed,  5 Mar 2025 13:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741180103;
	bh=siWdAxhLrN0DI+R0aKzyG6rDmCVTF6VPwiS27Qnj7bo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gsz4fZvjlpY05cQ6j3PtNhZ5OtCU4JHKj2P06Ci7UDvG3iU42zZgDbO0drBCG4b7r
	 wa+Z617+Si9135ApNkjEt7S1lA6MADR1toiWSuqjkLf0GcsiFiI1WR/0sycbDNmPj5
	 4B9TYzkBqMbkAIfBGVt3/3dLE2eHCGLIx/j55lwi8tzPOrJO6Vm+j8jD/MVVIUs/hO
	 SsEutbZ/MIskom8wFqLwcCuXG2pV5r+pt106i7dUHNHgLLxT3DBgCFRUutsFuliP1/
	 VnuIuDdX0PFkMaR15w1jyEnznoWkKDZXZI56dYWqu9aHuICFUuw6re2FhL0VHoq6IC
	 23ohHZ9ktRVow==
Date: Wed, 5 Mar 2025 07:08:21 -0600
From: Rob Herring <robh@kernel.org>
To: Mathis Foerst <mathis.foerst@mt.com>
Cc: linux-kernel@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	manuel.traut@mt.com, mathis.foerst@zuehlke.com
Subject: Re: [PATCH v3 1/6] media: dt-bindings: mt9m114: Add onnn,slew-rate
 DT-binding
Message-ID: <20250305130821.GA1374586-robh@kernel.org>
References: <20250305101453.708270-1-mathis.foerst@mt.com>
 <20250305101453.708270-2-mathis.foerst@mt.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305101453.708270-2-mathis.foerst@mt.com>

On Wed, Mar 05, 2025 at 11:14:48AM +0100, Mathis Foerst wrote:
> The MT9M114 supports the different slew rates (0 to 7) on the output pads.
> At the moment, this is hardcoded to 7 (the fastest rate).
> The user might want to change this values due to EMC requirements.
> 
> Add the 'onnn,slew-rate' property to the MT9M114 DT-bindings for selecting
> the desired slew rate.
> 
> Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
> ---
>  .../devicetree/bindings/media/i2c/onnn,mt9m114.yaml      | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> index f6b87892068a..c184bc04b743 100644
> --- a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> @@ -70,6 +70,15 @@ properties:
>            - bus-type
>            - link-frequencies
>  
> +  onnn,slew-rate:

Just 'slew-rate' which is already defined in the pinctrl binding.

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
> -- 
> 2.34.1
> 

