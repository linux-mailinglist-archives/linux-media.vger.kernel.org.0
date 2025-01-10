Return-Path: <linux-media+bounces-24625-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBCCA096CC
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 17:09:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79F6C3A6468
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 16:09:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08E2B212B28;
	Fri, 10 Jan 2025 16:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AF5WtDEM"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CFE20551F;
	Fri, 10 Jan 2025 16:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736525368; cv=none; b=dzS5Ubo8ge7wmX5WL+lziRzO05CmDt+LxqkpWG2aithHpQvejN2rqPxt5i79gnLDwmZs3eu2289J4IGSLqiaEFyXPtPS7RDfi+gDrA49eh7q3O4prIEH5neq+zGMNcfxOARGJiMDQ6Vi0tj88I3xLBUsGBXQHmzlEblzM5k2Bzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736525368; c=relaxed/simple;
	bh=hnfppjJPXYzlS/1Iy+hO8K84wAfcMf3nyQDwqrL9Wro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ge5QEmwStBImC8K8pQxEufFXkm1lZkkVGAOr71xjXFOnVoF1Z5zjhla486b32aEF8MyT/Db8uysiOclwX7BZGVfMeeOFcjh9kq0HtoEe77A0xFrg0/NhzUXE8rA1SWolgjYqd8g/GuKb1wa098KQnD2sS1PzXNMk8O/mePuIfyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AF5WtDEM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3E7BC4CED6;
	Fri, 10 Jan 2025 16:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736525368;
	bh=hnfppjJPXYzlS/1Iy+hO8K84wAfcMf3nyQDwqrL9Wro=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AF5WtDEMBy63P7oh051LxS5L+A/l9VeNkncyVA1c8hjHgJAsr+cy5rPX1o7nUVyUY
	 WpJrovgvCnCpPHj6HUKlV80kuk0HA3awQnEqeGYKI45+i/rdBsUFHFKsx6EQpHHOmu
	 jpjJMVc3evjp0m35pxWVcmNhg16oPk3ebcxRWwrOIPbwhJsMb1Lt8nMITBYMfG7lfI
	 iCTFXcmiNfUI9PdXGQjEtPh2yK8bIyahI3RF/QJmSME7YJxstR9FnB5PaPXEowhodS
	 a/pOIvR97RSZGjYxQnbELJUMu4xZAhq1dZKdXc7Y4yWWRVDxFXrjTKJSlPpstQ2M+M
	 rpAxMuSF8uz/A==
Date: Fri, 10 Jan 2025 10:09:26 -0600
From: Rob Herring <robh@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: hverkuil-cisco@xs4all.nl, mchehab@kernel.org, lars@metafoo.de,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH] media: dt-bindings: adv7180: Document the 'interrupts'
 property
Message-ID: <20250110160926.GA2966032-robh@kernel.org>
References: <20250109000503.45264-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109000503.45264-1-festevam@gmail.com>

On Wed, Jan 08, 2025 at 09:05:03PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> The ADV7180 family of chips have an INTRQ pin that can be connected
> to a SoC GPIO.
> 
> Allow the 'interrupts' property to be described to fix the following
> dt-schema warning:
> 
> camera@21: 'interrupt-parent', 'interrupts' do not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
>  Documentation/devicetree/bindings/media/i2c/adv7180.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/adv7180.yaml b/Documentation/devicetree/bindings/media/i2c/adv7180.yaml
> index 4371a0ef2761..572f06d12a39 100644
> --- a/Documentation/devicetree/bindings/media/i2c/adv7180.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/adv7180.yaml
> @@ -49,6 +49,8 @@ properties:
>        Indicates that the output is a BT.656-4 compatible stream.
>      type: boolean
>  
> +  interrupts: true
> +

How many interrupts are there?

>    port:
>      $ref: /schemas/graph.yaml#/$defs/port-base
>      unevaluatedProperties: false
> -- 
> 2.34.1
> 

