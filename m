Return-Path: <linux-media+bounces-26111-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5490A33A32
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2025 09:40:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A37511678B0
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2025 08:40:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90E7920C46A;
	Thu, 13 Feb 2025 08:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZXARDgdd"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37BC1EF08E;
	Thu, 13 Feb 2025 08:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739436047; cv=none; b=fkHCMk2cxA7KBtCkd9GD+Qf8hE+ktHHcwPI7XvJLrlLwCygDa/Az3UjC27i5F71bzjfK4Gxj5eh3fMf7j+HYDTo5wYwwm8mINquicNOXywkwHpNDmk8qkyoqmJhLBXSEAKYAxb2p0ghhuUuQ+9wmbVX1o+dxpZaV43gcGP4ijtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739436047; c=relaxed/simple;
	bh=YGYcP2FmKsgy9HgnE8UxulGQ674spwW+En1GZdlVwtg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G5sye0RmfZnGkPk9nWgqVe+rRK9J9GO+8dQfYomfIdig9h5l2fPFnVmLhqZdAb2spYm0Y/Uyj1tz+IjAsZW92gPbltyufOvbjEgrF48ar1CK16lVttBJ16GG7H7g53Yc54sc931WUkE0XW06qyVfYNl1xGiQ+7TWiGsi1rfCAEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZXARDgdd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57361C4CED1;
	Thu, 13 Feb 2025 08:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739436046;
	bh=YGYcP2FmKsgy9HgnE8UxulGQ674spwW+En1GZdlVwtg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZXARDgdd4NOLOVzh+oIQc0JC7bZUyY5J4n/BVkobvk/CiVDS9ngK5gbHObeGTrB6U
	 nnZ2hWlp3nnedyujRw4FG51xpYinE4m6vZxSgn7PMHgYJhPbXTp3R5rGen9/2p8/XB
	 5XfTwQl7bNAgF0M/CNXi1YDKqAOkCu1bqsEt0z+iRP0nYi6D0nVll45Xv7nw6kb5zr
	 GnzrgWOC6xAERg282tZcnzTrayAoeOx0o2dPzgf1LYi5DcFG5ZiqZ8VCCO/1+2sh5w
	 tHkcbB2XZy0wBEHXEO5mMp4r21U5P8kCHLdIQoUAladLnHyF8QfAC6sKZqsmHXPCRW
	 LE1W65TncC2Fg==
Date: Thu, 13 Feb 2025 09:40:42 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Pavel Machek <pavel@ucw.cz>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: dt-bindings: Convert Analog Devices ad5820 to DT
 schema
Message-ID: <20250213-tough-mink-of-freedom-2acd95@krzk-bin>
References: <20250209203940.159088-1-david@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250209203940.159088-1-david@ixit.cz>

On Sun, Feb 09, 2025 at 09:39:25PM +0100, David Heidelberg wrote:
> Convert the Analog Devices ad5820 to DT schema format.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> Needs: media: dt-bindings: media: i2c: align filenames format with standard

Well, it shouldn't. No need to rename the TXT file if you are going to
remove it in other patch,

> 
>  .../bindings/media/i2c/adi,ad5820.txt         | 28 ---------
>  .../bindings/media/i2c/adi,ad5820.yaml        | 62 +++++++++++++++++++
>  2 files changed, 62 insertions(+), 28 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/i2c/adi,ad5820.txt
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/adi,ad5820.yaml
> 

...

> +  reg:
> +    maxItems: 1
> +
> +  enable-gpios:
> +    maxItems: 1
> +    description:
> +      GPIO spec for the XSHUTDOWN pin. The XSHUTDOWN signal is active low,
> +      a high level on the pin enables the device.
> +
> +  VANA-supply:
> +    description: supply of voltage for VANA pin
> +
> +  "#io-channel-cells":
> +    const: 0

This wasn't in original binding, so needs explanation why in the commit
msg.

> +
> +required:
> +  - compatible
> +  - reg
> +  - VANA-supply
> +  - '#io-channel-cells'

use consistent quotes, either ' or "

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +            #address-cells = <1>;

Use 4 spaces for example indentation.

Best regards,
Krzysztof


