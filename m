Return-Path: <linux-media+bounces-12916-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EC99032F2
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 08:47:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 706921C226A3
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 06:47:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69A6D171E44;
	Tue, 11 Jun 2024 06:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FU0bKomp"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F7A18641;
	Tue, 11 Jun 2024 06:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718088441; cv=none; b=IJek5BqIk22aGMj3iZxUbUx25zQBdmJ2Fvj5OW7Zsy7qq0mLxcZ3X+GBYpKTmfX8OInkTaeuWVn6T0STjqxp33n1XQgIZ3O/EgwBH2TovPyZmB2DkAS+7goHszpgbJirLcox8vtDYrjsnB/iBHVYuzAMIao8+zwPpFOe4yb6LHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718088441; c=relaxed/simple;
	bh=2HXB5eQC3xMm+Zm9CtyzEAOmLfWV97XhXikgJRPQCWE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oiTe4X+Tnm2bwLvQzyNq+USyFh67eWgVDTh9CftKoWp7KlvwYUEllHFj7Lqt1bRMHxbVXUnWTvNtNJm6dm3meOvBj/Pl2lb8JEeXgXmEjo2I7UkMxejFRamowOxCd2wW6oEM/wz6kTRqRskNN45+RHVOAN5qkjuuFiQOLla/snI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FU0bKomp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18376C2BD10;
	Tue, 11 Jun 2024 06:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718088441;
	bh=2HXB5eQC3xMm+Zm9CtyzEAOmLfWV97XhXikgJRPQCWE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FU0bKompzepEIXj5dkh5kHbIslBM5yVoeA89A02XJ7wCkDBDNMYIKtjFq9BRyqclZ
	 xVlCPRtKxkVPxJlXX7wFI0fkrEBIFbqhj8d25Pw82iVg82YpPRyqqmrktUna0koG99
	 nTzttudklQ+0txqUY6zNq2L+6nUtWQW1NEQh4jfuF771aHHzzPbIj4N3wQU7vuVW6S
	 PRk2MOcp3lzzIHC/lzbqLwJc4MEldHaYgJ6QQ7wfDbjx51VUSAac/0c9GcjFerw5jx
	 E9CKKon0hxFrKUPdGTM61DSdpywCOyOgLx6uTen8auwenvaFtHhgAXqSBwNjZiEKth
	 ERV8nunmx7P4A==
Message-ID: <1a13587c-28c1-4074-8b0f-7f663b308b65@kernel.org>
Date: Tue, 11 Jun 2024 08:47:15 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: vgxy61: Fix driver name
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240610150815.228790-1-benjamin.mugnier@foss.st.com>
 <20240610150815.228790-2-benjamin.mugnier@foss.st.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240610150815.228790-2-benjamin.mugnier@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/06/2024 17:08, Benjamin Mugnier wrote:
> From 'st-vgxy61' to 'vgxy61'.
> Align with other drivers to not use the vendor prefix.
> Also the vendor prefix is already mentioned in the device tree
> compatible string, being 'st,vgxy61', and does not need to be expressed twice.

What bindings have anything to do with driver name?

I think I made it clear last time.


> 
> Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> ---
>  .../media/i2c/{st,st-vgxy61.yaml => st,vgxy61.yaml}       | 6 +++---
>  Documentation/userspace-api/media/drivers/index.rst       | 2 +-
>  .../media/drivers/{st-vgxy61.rst => vgxy61.rst}           | 0
>  MAINTAINERS                                               | 8 ++++----
>  drivers/media/i2c/Kconfig                                 | 2 +-
>  drivers/media/i2c/Makefile                                | 2 +-
>  drivers/media/i2c/{st-vgxy61.c => vgxy61.c}               | 2 +-
>  7 files changed, 11 insertions(+), 11 deletions(-)
>  rename Documentation/devicetree/bindings/media/i2c/{st,st-vgxy61.yaml => st,vgxy61.yaml} (95%)
>  rename Documentation/userspace-api/media/drivers/{st-vgxy61.rst => vgxy61.rst} (100%)
>  rename drivers/media/i2c/{st-vgxy61.c => vgxy61.c} (99%)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml b/Documentation/devicetree/bindings/media/i2c/st,vgxy61.yaml
> similarity index 95%
> rename from Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml
> rename to Documentation/devicetree/bindings/media/i2c/st,vgxy61.yaml
> index 8c28848b226a..4e4c2c7ad168 100644
> --- a/Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/st,vgxy61.yaml
> @@ -2,7 +2,7 @@
>  # Copyright (c) 2022 STMicroelectronics SA.
>  %YAML 1.2
>  ---
> -$id: http://devicetree.org/schemas/media/i2c/st,st-vgxy61.yaml#
> +$id: http://devicetree.org/schemas/media/i2c/st,vgxy61.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
>  title: STMicroelectronics VGxy61 HDR Global Shutter Sensor Family
> @@ -23,7 +23,7 @@ description: |-
>  
>  properties:
>    compatible:
> -    const: st,st-vgxy61
> +    const: st,vgxy61

Why? No. NAK.


Best regards,
Krzysztof


