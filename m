Return-Path: <linux-media+bounces-17216-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E9916965A04
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 10:20:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 286011C22542
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 08:20:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 931D316BE18;
	Fri, 30 Aug 2024 08:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S6pf6yW2"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F1313D53E;
	Fri, 30 Aug 2024 08:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725006020; cv=none; b=eQeqBYElxGA3qtF4haOCWEj91L/0MTSjts+v5eExYhWHMckIDkY61+g/+k6s9qbs9Z2W9+uAMjCz90HQOy8z/C6QEVLRSRwqRlk3WRY2GEOgtpWn5QUwqerS9qDxthcjXNxe4+KF0SARyOYenbQXB+yP/Y+cR1DFIHRmFQh5NKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725006020; c=relaxed/simple;
	bh=8BnN5DBF5PyD8ejLqZl3nUmYt2pMYCYaD3RZT+KL8Js=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S45P59TyM6HyGpNYyg7oYI/HIRFHifMFUgErjtLNh+aiIJeBBCukFAdob06Hc15NT8HZdekSgl34Pgi68s2eutAUrpeRxA3UqVvLlv54lWKMHu5dTZLwzPmjoTL9vUwa2x9iTDBa2g8jIY8qz3t9NLgUaKgS2W5FiMXn8vUKKzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S6pf6yW2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E93A5C4CEC2;
	Fri, 30 Aug 2024 08:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725006019;
	bh=8BnN5DBF5PyD8ejLqZl3nUmYt2pMYCYaD3RZT+KL8Js=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S6pf6yW2mEYxVJ8pMscwAphZR8+YV89giq2YbpUBupjpdXp7czVUvq3xG7G9XnRRH
	 zw9ou5Lps/5xdysFVs4DY9PKf2t7oaoQAbZwp4bWCMp+6SlBwTrbYTMWbPKudpor5P
	 zDCFaVZK7RIAlxf8qVydbijUBKgYCvOZlGTQHoYjCmidvs6ShU4NyaQnBiLIbI2vuj
	 htfEL+cm2DaqDVqoCsYSJCBVRtteeljSo2+z7tzzWcc/c68Xbj7Xhmy06B8zOxapOL
	 zf+1CsvX2G7hRz+n5ZIEfixA+8M/2DBMCQygmQMVcgSoUvfiUP6+Lt2dZ6xUvH5inO
	 jtqr7UnuG+dtA==
Date: Fri, 30 Aug 2024 10:20:17 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Olivier Masse <olivier.masse@nxp.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
	"T . J . Mercier" <tjmercier@google.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Sumit Garg <sumit.garg@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [RFC PATCH 3/4] dt-bindings: reserved-memory: add
 linaro,restricted-heap
Message-ID: <3bqb6mktkvbdl6h4eekad4mpjhyvzx7mjidhnanboygbwu2asz@6ros56bp6isd>
References: <20240830070351.2855919-1-jens.wiklander@linaro.org>
 <20240830070351.2855919-4-jens.wiklander@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240830070351.2855919-4-jens.wiklander@linaro.org>

On Fri, Aug 30, 2024 at 09:03:50AM +0200, Jens Wiklander wrote:
> From: Olivier Masse <olivier.masse@nxp.com>
> 
> DMABUF reserved memory definition for OP-TEE secure data path feature.
> 
> Signed-off-by: Olivier Masse <olivier.masse@nxp.com>
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>  .../linaro,restricted-heap.yaml               | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reserved-memory/linaro,restricted-heap.yaml
> 
> diff --git a/Documentation/devicetree/bindings/reserved-memory/linaro,restricted-heap.yaml b/Documentation/devicetree/bindings/reserved-memory/linaro,restricted-heap.yaml
> new file mode 100644
> index 000000000000..0ab87cf02775
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reserved-memory/linaro,restricted-heap.yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/reserved-memory/linaro,restricted-heap.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Linaro Secure DMABUF Heap
> +
> +maintainers:
> +  - Olivier Masse <olivier.masse@nxp.com>
> +
> +description:
> +  Linaro OP-TEE firmware needs a reserved memory for the
> +  Secure Data Path feature (aka SDP).
> +  The purpose is to provide a restricted memory heap which allow
> +  the normal world OS (REE) to allocate/free restricted buffers.
> +  The TEE is reponsible for protecting the SDP memory buffers.
> +  TEE Trusted Application can access restricted memory references
> +  provided as parameters (DMABUF file descriptor).

And what is the difference from regular reserved memory? Why it cannot
be used?

> +
> +allOf:
> +  - $ref: "reserved-memory.yaml"

It does not look like you tested the bindings, at least after quick
look. Please run  (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).
Maybe you need to update your dtschema and yamllint.

> +
> +properties:
> +  compatible:
> +    const: linaro,restricted-heap
> +
> +  reg:
> +    description:
> +      Region of memory reserved for OP-TEE SDP feature
> +
> +  no-map:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      Avoid creating a virtual mapping of the region as part of the OS'
> +      standard mapping of system memory.
> +
> +unevaluatedProperties: false

This goes after "required:" block.

> +
> +required:
> +  - compatible
> +  - reg
> +  - no-map
> +
> +examples:
> +  - |
> +  reserved-memory {
> +    #address-cells = <2>;
> +    #size-cells = <2>;
> +
> +    sdp@3e800000 {
> +      compatible = "linaro,restricted-heap";
> +      no-map;
> +      reg = <0 0x3E800000 0 0x00400000>;

lowercase hex

Best regards,
Krzysztof


