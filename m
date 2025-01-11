Return-Path: <linux-media+bounces-24645-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 980B2A0A2CA
	for <lists+linux-media@lfdr.de>; Sat, 11 Jan 2025 11:31:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E77E93AA3E5
	for <lists+linux-media@lfdr.de>; Sat, 11 Jan 2025 10:31:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 741C1190696;
	Sat, 11 Jan 2025 10:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X5kK1dwU"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C719FA55;
	Sat, 11 Jan 2025 10:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736591504; cv=none; b=Q34xQDrCL9QbgUQDcDGnNKzbXv/W6Pj0a/RjImRbRuWekNmc9UHWZ6SUjwgbjouiO3J4WgqOotIOCb/yx4HWi9iKe1UMrcb90NGOyvgvXPHvC19WWX1kZEO4rFTUIwyhRUBtfHjlKpwkDI90r/ucCWBGRC+6TJ7fRhhE2NBdo6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736591504; c=relaxed/simple;
	bh=6JsI7vDM5nZG58UdeKoU+Trnllvjbuz2Vyb5UX6CZgg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fspIcg3UdYIW2lM7qYTj4+vNSxBQ57JBTro7Rc8YCfvODU30SzfSHRUHsL/+Gog8YfIix90g4M6qCP4rLGzxcxPs1LqiUn3NEif9oOMXfAVyNBRGKfq3ZuWYNJZH4I0Duj3QeKFQcUVnlmob8uAel+OnDa3t4twrmEHEwh6zGEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X5kK1dwU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA52FC4CED2;
	Sat, 11 Jan 2025 10:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736591504;
	bh=6JsI7vDM5nZG58UdeKoU+Trnllvjbuz2Vyb5UX6CZgg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X5kK1dwUKIjrwKuElYh5xG3DgeWVPwLatce3CIQTZKra94ql/4g+S+ddpdVcHLw7K
	 hjESyznrWD2T0f4XrDJCRjF6vXmKhK6cFRG9g8drK5M1q/HhnFaEA7qq4xNCv6IeEV
	 xzZMWzbI22rWvWh9xfbpfAe9Cem5i2/FtDEJuF4Pu9vhEHFDb98q+Tk1OAx9vVCLYP
	 x9eMM6DKiIbnx84XCy6ejdGvFVDLdJ1UK3Ti9NvTmiLek3P95uTlD263HOCK+YdNjL
	 GPRY0TpG+pllSimFtOmrLm6iNiuw5FM4Q7GENHkpCvRVYAx6CxiQ4grEFJUFalgKbt
	 LHfMA65ORADJA==
Date: Sat, 11 Jan 2025 11:31:41 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Devarsh Thakkar <devarsht@ti.com>, 
	Jai Luthra <jai.luthra@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 17/19] media: dt-bindings: ti,ds90ub960: Add "i2c-addr"
 link property
Message-ID: <iet6yl4mloktmpm7ngkug2dgtddriot7qwrkgg6loqermj7f74@mzyg34r7f4pc>
References: <20250110-ub9xx-improvements-v1-0-e0b9a1f644da@ideasonboard.com>
 <20250110-ub9xx-improvements-v1-17-e0b9a1f644da@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250110-ub9xx-improvements-v1-17-e0b9a1f644da@ideasonboard.com>

On Fri, Jan 10, 2025 at 11:14:17AM +0200, Tomi Valkeinen wrote:
> From: Jai Luthra <jai.luthra@ideasonboard.com>
> 
> The serializer's I2C address on the FPD-Link bus is usually communicated
> to the deserializer once the forward-channel is established. But in some
> cases it might be necessary to program the serializer (over the
> back-channel) before the forward-channel is established.
> 
> This can be used e.g. to correct serializer configuration which
> otherwise would prevent the FC to be enabled.
> 
> Add a new optional property to specify the I2C address of the
> serializer.
> 
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Cc: devicetree@vger.kernel.org
> Cc: Rob Herring <robh@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>

Why only these folks? Why not all of the maintainers?

Anyway, Please drop the autogenerated scripts/get_maintainer.pl CC-entries from
commit msg. There is no single need to store automated output of
get_maintainers.pl in the git log. It can be easily re-created at any
given time, thus its presence in the git history is redundant and
obfuscates the log.

If you need it for your own patch management purposes, keep it under the
--- separator.

> ---
>  Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
> index 0b71e6f911a8..e17b508b6409 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
> @@ -75,6 +75,13 @@ properties:
>                address on the I2C bus where the deserializer resides are
>                forwarded to the serializer.
>  
> +          i2c-addr:
> +            $ref: /schemas/types.yaml#/definitions/uint32

Why isn't this part of reg, if that's the same device? If that is not
the same device, you are not expected to encode addresses of other
devices in this device. Address of 'foo' is not a property of device
'bar'. Phandles or graphs express relationships between devices.

Best regards,
Krzysztof


