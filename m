Return-Path: <linux-media+bounces-27191-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB40A49243
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 08:34:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 160F97A51FA
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 07:33:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5624E1C7B62;
	Fri, 28 Feb 2025 07:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RmKsU363"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADBEC1ABEC1;
	Fri, 28 Feb 2025 07:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740728066; cv=none; b=MDFRMcCEi5gSQzYwated7bi9CIwL5KHunYJ2CMFM9XPEIt360mJRuEcJ/bfqc1Rm32iIglzvDewLMIvwRRdqULFH+u0TAKSelR+a9C00XMBHD3k+T34/QHxbDox18JCg5L00oViqZgH0glYPqi+zQe8FIhkNfDzdFBFkQRAQVNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740728066; c=relaxed/simple;
	bh=diEmeHHPNUbjnmmbw+AYA93u/wLxCe9mouOJJdjuhiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HRVBwzCczt/6+/m7KpSWqMiX/c9ZrScw96L1dtZ0e5nOuSfVz6mjB4Ax5zHPeuxe9HiytV0tnTzNAlP/tKuRLwwqHICFKkwgmkQeRnsOY50dxIB7AsyW3pAjI2s9QYIP9HxxTws+stAUHaRoui9W9ttx552ovGZsW9PhANGyHrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RmKsU363; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C9BBC4CED6;
	Fri, 28 Feb 2025 07:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740728066;
	bh=diEmeHHPNUbjnmmbw+AYA93u/wLxCe9mouOJJdjuhiQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RmKsU363/1BFkxJRqerBpIgt2coXRuz7Wauh4dOmZgcNjS50DcciBLe+Sd1bA/WJa
	 CeCwsKpZ1qsZNqCHjnPQpbT6jOiJ3WQ5pw+uiVyCzcnPUEzCwgGqgehN7m2cwkHbC0
	 S4mGHWVpi6bVZ7KKlkIiM1zyZH2WQ3cL1lreWkWQNgxNgoHiwoFoaYF8otXBLlys4l
	 QujLfKIUHHa7NDiN9rWAv0y8czwEn/Gepj8FfG3fSqfTZYgbkcR42AQD9zoeTmhNep
	 st+bP2MkT5sILu1UbuwQwlUPg3t891oGwEnBynfo4tojTMOi7T/hs5/sIVd/X5ka6M
	 2gY70rV0Bf65Q==
Date: Fri, 28 Feb 2025 08:34:22 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, mripard@kernel.org, mchehab@kernel.org, jai.luthra@linux.dev, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, devarsht@ti.com, 
	vaishnav.a@ti.com, r-donadkar@ti.com, u-kumar1@ti.com
Subject: Re: [PATCH v4 1/2] dt-bindings: media: cdns,csi2rx.yaml: Add
 optional interrupts for cdns-csi2rx
Message-ID: <20250228-sandy-nightingale-of-improvement-6eef5a@krzk-bin>
References: <20250227082920.744908-1-y-abhilashchandra@ti.com>
 <20250227082920.744908-2-y-abhilashchandra@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250227082920.744908-2-y-abhilashchandra@ti.com>

On Thu, Feb 27, 2025 at 01:59:19PM +0530, Yemike Abhilash Chandra wrote:
> diff --git a/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml b/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml
> index 2008a47c0580..054ed4b94312 100644
> --- a/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml
> +++ b/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml
> @@ -24,6 +24,16 @@ properties:
>    reg:
>      maxItems: 1
>  
> +  interrupts:
> +    minItems: 1
> +    maxItems: 2
> +
> +  interrupt-names:
> +    minItems: 1
> +    items:
> +      - const: error_irq
> +      - const: irq

And how is this second interrupt in existing integrations?

This is supposed to be constrained per variant... which probably will
tell you that these are not optional now.

Best regards,
Krzysztof


