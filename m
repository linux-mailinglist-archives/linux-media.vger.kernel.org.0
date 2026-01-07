Return-Path: <linux-media+bounces-50104-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 311E0CFC6A5
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 08:41:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0FE3D3055710
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 07:35:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B49422C21F1;
	Wed,  7 Jan 2026 07:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nzoD4Gfi"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12CDB25F99B;
	Wed,  7 Jan 2026 07:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767771328; cv=none; b=BhzGBoTeC1da646xU8y81jBvn2lee3vDnKKZgtxJoKJ+duwspejQ/EMhpQoRkWLMghDGDFpti9F7W5qy8wi41jh/tXyt1tE6mkNiC7c7fFXwAOEweULoBgBCdaIneiVExfiFVMufMOX1KmP3d90j/vGJOinY3XC1vLYxdqA/H2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767771328; c=relaxed/simple;
	bh=JxK/sfpMBjul47uCw1GUClA/LRnvepcpBa/ZVdT9bSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jOqJATSK3mje5I+/QPnTnkg9to5BlcBsZkqyCfssOdMfGlGO054AAP14yhYhP4E4mEoYcmAlfUMZmOmru/9ZdN+/TP7EyH/qdP5hpNrlp5jINNkdqAVvpmEBxkN8tj9gZqiBAUsbfahskvfnnLnelm35D2F6LSvMjk3IMxq9FSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nzoD4Gfi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B454C4CEF7;
	Wed,  7 Jan 2026 07:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767771327;
	bh=JxK/sfpMBjul47uCw1GUClA/LRnvepcpBa/ZVdT9bSA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nzoD4Gfi6iBch8kWj2ojN9VLT+Z5tUj0XeONDF+EDWczaYgOXM1lrV1gfRDn9uZiR
	 tLgiRCflOdiTqYvgtCZpKK30svw4TaJO5a5ZhnSdnyZ3ag/jvpe439Z1m4tWuQvjzg
	 7NIBex9mGR4xkY6p99+NhaSF1pZLjWSoMHSKTdKBz+9tNMKaiaDQ/HHnmjbkz9dVtV
	 R+ie0DqZgw7qP6PsHD5IjrVw0T21eUHAtjpJxRBdqcewy4CZlYklHSZxdZVlaPSfHM
	 sHLoD0eHVcb/e3RpIQQTlgqVhfshjVKPhfibsB3c0H/7jVlCReOqZugD60i6iJ5rg1
	 dzMG67bVVRdgg==
Date: Wed, 7 Jan 2026 08:35:25 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Robert Mader <robert.mader@collabora.com>, 
	Bryan O'Donoghue <bod@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org
Subject: Re: [PATCH v6 1/5] dt-bindings: media: i2c: Add Sony IMX355
Message-ID: <20260107-aspiring-unselfish-dogfish-963c1e@quoll>
References: <20260107043044.92485-1-mailingradian@gmail.com>
 <20260107043044.92485-2-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260107043044.92485-2-mailingradian@gmail.com>

On Tue, Jan 06, 2026 at 11:30:40PM -0500, Richard Acayan wrote:
> The IMX355 camera sensor is a camera sensor that can be found as the
> front camera in some smartphones, such as the Pixel 3, Pixel 3 XL, Pixel
> 3a, and Pixel 3a XL. It already has a driver, but needs support for
> device tree. Document the IMX355 to support defining it in device tree.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  .../bindings/media/i2c/sony,imx355.yaml       | 115 ++++++++++++++++++
>  1 file changed, 115 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
> new file mode 100644
> index 000000000000..33d253ca0e4f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
> @@ -0,0 +1,115 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +

Drop blank line.

<form letter>
This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

Please read:
https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state why and what changed.
</form letter>

Read carefully last sentence above.

Best regards,
Krzysztof


