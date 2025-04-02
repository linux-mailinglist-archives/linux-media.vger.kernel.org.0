Return-Path: <linux-media+bounces-29193-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF44A7889C
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 09:10:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 698B63A55D4
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 07:09:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10AFC2343D2;
	Wed,  2 Apr 2025 07:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ei2LYmz2"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F90233736;
	Wed,  2 Apr 2025 07:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743577688; cv=none; b=DQNNCSlxfW4Ch5BU+EGK4044SPgx4gq2/AInAeRovDw1TKxLufaGRgJswQ78/3L74I3ql5vu8qD/K6n3+Ol0BWzLUFFLtTygTZH+5kg9hNnFGVS2CW0NP0MBEdLNV5QbZjN4fZQoCBjsFpb66eMujo6ExL3Hl8IdZDeKXZTVMrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743577688; c=relaxed/simple;
	bh=wtHLJiYIWI8qlPwCMFuVGNMagth1T5fWPZ+oOrKc2iA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ImET9A1JGXXun1sO1qEDe7JH+JJHNv0NJJ++uoIc5oOR8qL9sWRxB5JiO9ExKZe1j6s2H9ul4l9VkVsfKU1oBfY1M5C4b4yf+ihAkXMnlt4TvwpIaC3ELlThm+5EoyKNtMlL2aszJfgW5HMWG04y175l8W3x/OyoQH7+23GyWDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ei2LYmz2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51B0EC4CEDD;
	Wed,  2 Apr 2025 07:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743577688;
	bh=wtHLJiYIWI8qlPwCMFuVGNMagth1T5fWPZ+oOrKc2iA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ei2LYmz2/fPHvHiR+TLt9UUelL7skuDHlxfVx2r/PSe+ro7kExx4TF+zegIcUWDDh
	 2ly1qqmDBeoMg3kp62QoGDaWAqEniW9Z9OWvKPfnoQ6KgMFTBERzQBi/Omu/r8Bi1w
	 zZ3iWM1tN91weW4PqlhuukzX7jwzi2qV0fIiHzHFYi+/DGffjfk1hTIdoLdTR1yzAd
	 UDaIuqqY1WOETVLeW9BGQPXgWIsXhpHi3L9cdoaDbeoTFV0UGjJ332YtgDZOMFLUMP
	 /poi9THdlSRjPMdB648iX7WBiiEqzUO0yqoYFMNMmcoUM7Ut28fU4YmCV49+wm+I0i
	 jtdXMSNcMsYpA==
Date: Wed, 2 Apr 2025 09:08:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc: Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] media: dt-bindings: Add ST VD55G1 camera sensor
 binding
Message-ID: <20250402-curvy-seriema-of-blizzard-b1c4d9@krzk-bin>
References: <20250401-b4-vd55g1-v2-0-0c8ab8a48c55@foss.st.com>
 <20250401-b4-vd55g1-v2-1-0c8ab8a48c55@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250401-b4-vd55g1-v2-1-0c8ab8a48c55@foss.st.com>

On Tue, Apr 01, 2025 at 01:05:58PM +0200, Benjamin Mugnier wrote:
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          data-lanes:
> +            items:
> +              const: 1

Not what I asked. Now you miss number of items. Just use the syntax I
proposed. Or was there any issue with it?

> +
> +          link-frequencies:
> +            maxItems: 1
> +            items:
> +              minimum: 125000000
> +              maximum: 600000000

Best regards,
Krzysztof


