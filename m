Return-Path: <linux-media+bounces-26261-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E54A395E0
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 09:45:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D0BA73B91B2
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 08:40:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B794A23536B;
	Tue, 18 Feb 2025 08:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ovEbdYsV"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C1722B8CA;
	Tue, 18 Feb 2025 08:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739867897; cv=none; b=WiPeAgbhOG1cWvgGxLd3S+VRjj8QueCP0HwjS+tEd3qOhPHP2bV34HnfXar5mZTLsRVcdGlZOLt1NPHNKEjqsfTIEbioLIaQHINFPdsII9NkXdeuKKi2AE6d+oqjmAPHl0KyhGFzcCBQVTSPxrfQ2EOxFZdKwUDqANh0Ipap65A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739867897; c=relaxed/simple;
	bh=SXsWRliWYDYiH9PM4qIThXGhAe8bWyeUA8MJ5BBmb20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l9GUuEnHu48UgKoLiRjAMK+aToLy5QTTYBjrao2U+MPwj3wQfj8aSncCzTrgGFqXToAc5uhHpD48p0LIbiDOgLGap1jeVvN5Qer4qHVd4GPdgDiYy+iFoW1XTpb5omZjggvW6tTSGIqBBqpaQermYHCxe5MJNB2nFpG/5Du21Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ovEbdYsV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EC68C4CEE6;
	Tue, 18 Feb 2025 08:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739867896;
	bh=SXsWRliWYDYiH9PM4qIThXGhAe8bWyeUA8MJ5BBmb20=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ovEbdYsVKuDVTr7JBMRtAHH4KoI8yoVZP/1EqGrjDqt7rPSb5xj9w1DZMlmZp+wVv
	 dxqEHj3odINWyjKeoPym36WYDkUMz8j5RONhNq8Cv3bPTOndbYRJWQfE3UMg8fgNtb
	 DzYIDgtRUVlY3284FLpW+dG0auo/8MvqcuVLbXgm2EgRkh1ZBWINjUDS/swk+jW8p1
	 i1MsKKpSrgZGgjb7Q2PLGIW4kJSKwSGSbpju89P4GnwXnU+xag+/opOxunrt2IZn1T
	 crVlrpYkb+fsvjJ42NfwTBz0p2iIQyOpBZWPZSUzuPS7DxGPoHFMO38M4fKPbDDwXj
	 zqGOXiojUW0eQ==
Date: Tue, 18 Feb 2025 09:38:12 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, mripard@kernel.org, mchehab@kernel.org, jai.luthra@linux.dev, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, devarsht@ti.com, 
	vaishnav.a@ti.com, r-donadkar@ti.com, u-kumar1@ti.com
Subject: Re: [PATCH v2 1/2] dt-bindings: media: cdns,csi2rx.yaml: Add
 optional interrupts for cdns-csi2rx
Message-ID: <20250218-honored-fascinating-cockle-81bd06@krzk-bin>
References: <20250217130013.2802293-1-y-abhilashchandra@ti.com>
 <20250217130013.2802293-2-y-abhilashchandra@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250217130013.2802293-2-y-abhilashchandra@ti.com>

On Mon, Feb 17, 2025 at 06:30:12PM +0530, Yemike Abhilash Chandra wrote:
> The Cadence CSI2RX IP exposes 3 interrupts [0] 12.7 camera subsystem.
> Enabling these interrupts will provide additional information about a CSI
> packet or an individual frame. So, add support for optional interrupts
> and interrupt-names properties.
> 
> [0]: http://www.ti.com/lit/pdf/spruil1
> 
> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> ---
> 
> Changes in v2:
> - Address Krzysztof's review comment to remove flexibility while adding
>   interrupts.
> 
>  .../devicetree/bindings/media/cdns,csi2rx.yaml         | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml b/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml
> index 2008a47c0580..f335429cbde9 100644
> --- a/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml
> +++ b/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml
> @@ -24,6 +24,16 @@ properties:
>    reg:
>      maxItems: 1
>  
> +  interrupts:
> +    minItems: 3

Drop, see other bindings.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


