Return-Path: <linux-media+bounces-36140-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 09494AEBFFC
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 21:33:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6E2817B7AEE
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 19:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C58921ADC7;
	Fri, 27 Jun 2025 19:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nN3ouILS"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE12190477;
	Fri, 27 Jun 2025 19:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751052693; cv=none; b=k7FwCV9HSR7D9I2r87tkXRBnOW7Y+CV9d9tgkMGuUfJEq12AY3ivIUarfSdIdOd+0R6LYfHAsXYUrm4D5wv0ZBJAq3+JyicEF0Ar1pMEKGELc9716C7L40ULeR6cHhaP1nNvZl94E7+IoF/ZWqu2CT/VTbO2KXVWhPiWQpIhtEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751052693; c=relaxed/simple;
	bh=h3H+2X3zy5G2DWyjGN7MD6PlrTT6aVPN39antbwjtXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t1ok3fp3nMIqHLVHmtZhTNm0d7Lu2CCPeSKOmdnhTCNZTVYXXNGgKSedRXi3CwFoOXdOubJ4QJpBjeHcu6Gk/9rEK8bnAqyWrf21nA3DosAXSOSdy4V6Ddkx9QAQewRgi/ycSpIIEAKPfry26OW1mk2PJ5hH7ZgzMg1ZQZlmalg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nN3ouILS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCB42C4CEE3;
	Fri, 27 Jun 2025 19:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751052693;
	bh=h3H+2X3zy5G2DWyjGN7MD6PlrTT6aVPN39antbwjtXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nN3ouILSe4a9vGGNfo+5TMSucLczYwzFlj0Xw8+noUZYsSXS58hDkYj5wLr/AsJmv
	 f2xckTe28ssA0LRbcPUSoPc9FCYDN7XWMSWf2J3D9AoXly+yf9XXKmFD4PJK/V1rnE
	 EpkLsCywXZrZ+Rx7Sknjw/qxNtqSI/utppKZfPHGYHjlp7yfQE/0XiPkYq4BIN9QaN
	 UYTqsAQ7RjrGEwTwq2VLOMnu+eyCrN7TQpUmrVr26HP/Le/rwivsO8ODXMcfQj7F16
	 JUsws8azftM49yeQHO0uUDFHAt+a0VaQTWOODPxAq0HglJoQtI10BpHA8I003cQPMi
	 fH2wjGwU3DJHw==
Date: Fri, 27 Jun 2025 14:31:32 -0500
From: Rob Herring <robh@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Saravana Kannan <saravanak@google.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
	Jared Kangas <jkangas@redhat.com>,
	Mattijs Korpershoek <mkorpershoek@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v5 1/2] dt-bindings: reserved-memory: Introduce
 carved-out memory region binding
Message-ID: <20250627193132.GB4032621-robh@kernel.org>
References: <20250617-dma-buf-ecc-heap-v5-0-0abdc5863a4f@kernel.org>
 <20250617-dma-buf-ecc-heap-v5-1-0abdc5863a4f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617-dma-buf-ecc-heap-v5-1-0abdc5863a4f@kernel.org>

On Tue, Jun 17, 2025 at 02:25:40PM +0200, Maxime Ripard wrote:
> Some parts of the memory can be dedicated to specific purposes and
> exposed as a dedicated memory allocator.
> 
> This is especially useful if that particular region has a particular
> properties the rest of the memory doesn't have. For example, some
> platforms have their entire RAM covered by ECC but for a small area
> meant to be used by applications that don't need ECC, and its associated
> overhead.
> 
> Let's introduce a binding to describe such a region and allow the OS to
> create a dedicated memory allocator for it.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  .../bindings/reserved-memory/carved-out.yaml       | 49 ++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/reserved-memory/carved-out.yaml b/Documentation/devicetree/bindings/reserved-memory/carved-out.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..9ab5d1ebd9ebd9111b7c064fabe1c45e752da83b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reserved-memory/carved-out.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/reserved-memory/carved-out.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Carved-out Memory Region
> +
> +description: |

Don't need '|'.

> +  Specifies that the reserved memory region has been carved out of the
> +  main memory allocator, and is intended to be used by the OS as a
> +  dedicated memory allocator.

Other than the commit msg, it is completely lost that this is for 
ECC-less memory.

This description applies to CMA area as well. So what's the difference?

> +
> +maintainers:
> +  - Maxime Ripard <mripard@kernel.org>
> +
> +properties:
> +  compatible:
> +    const: carved-out

Isn't everything in reserved-memory a carve out for some purpose. I'm 
not sure if I'd add 'no ECC' or more along the lines of how this is 
used. The latter might be useful on platforms which can't disable ECC or 
don't have ECC at all.

> +
> +  reg:
> +    description: region of memory that is carved out.

Can be multiple regions? If not, need 'maxItems: 1'.


> +
> +allOf:
> +  - $ref: reserved-memory.yaml
> +  - not:
> +      required:
> +        - reusable
> +  - not:
> +      required:
> +        - no-map
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    reserved-memory {
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        memory@12340000 {
> +            compatible = "carved-out";
> +            reg = <0x12340000 0x00800000>;
> +        };
> +    };
> 
> -- 
> 2.49.0
> 

