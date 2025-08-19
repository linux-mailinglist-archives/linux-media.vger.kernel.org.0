Return-Path: <linux-media+bounces-40236-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CC6B2BBAC
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 10:22:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F8015661A6
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 08:21:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37DF131158A;
	Tue, 19 Aug 2025 08:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PyQqMMTy"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF081A3A80;
	Tue, 19 Aug 2025 08:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755591705; cv=none; b=uD0F5+rFqJG5hj+LD8JHY+JAyl4Bfx+kRw+NPiZtYLY6OI8LHVLcrlWlFBrlvdtKf0djWjK48Kj0aLtcQzSFgv9/DY4QiWahV5dfh9fMmCqXcnC27Fy5LbsNhxCginRDCiU7tRhocXwunfcycVFLZNYgak8FuDPZiXHoNimE/uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755591705; c=relaxed/simple;
	bh=1codZMjwy5xEE8CHY9/RMsQlYxX0V78vrbjwQEP5T3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JtM+lOsvV2YoSyED9aMfeJiCQIDIJb8jZMHUOKHsKSkOCYUzMElSUrALHZoFTkiM+Vu8v/uAp10U4irw3KjgAE+00qh3OEGJtRjF5MjkTW3YeNj5V2ZJukpH29fZr9Z/hAeHbdNvbKiYx7MKcYiC3Stj0KwaSLenb4cULB5fpEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PyQqMMTy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D3BCC4CEF1;
	Tue, 19 Aug 2025 08:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755591705;
	bh=1codZMjwy5xEE8CHY9/RMsQlYxX0V78vrbjwQEP5T3Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PyQqMMTybgkseFEOXhaoT8120dHaCUYjo7O0AEle6hNoOMAOTd1UN36R/IGN/C6ft
	 z8QecOOvu5hVzqSUalPjJPR6lJybGs3B4PrFuHpjVtjXdKa4NBUmwr8D/zKw46Kg97
	 XKfAiBreyTirtxh/PeE811JFtSkJts/Cb03ELBJgUVcUWoZ+D+j3b8C3svENr06M3S
	 MqkaL9q5SmFUYzp5tdAQg5748YJpLgqr7TtQH7Qu/237DDZnmmA5VeIM2GTPXYdnF1
	 RULyucltPWYaQoLaPhHHjwWR8OCFncttIhZ8rppRPU6ZHqAmKYWM2LSszu9oJ/Y5A3
	 PlM+aMn+L7yVQ==
Date: Tue, 19 Aug 2025 10:21:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Aliaksandr Smirnou <support@pinefeat.co.uk>, mchehab@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: Pinefeat cef168 lens control board
Message-ID: <20250819-lilac-harrier-of-saturation-323586@kuoka>
References: <20250817130549.7766-1-support@pinefeat.co.uk>
 <20250817130549.7766-2-support@pinefeat.co.uk>
 <20250818-stark-unsocial-96d32a311cab@spud>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250818-stark-unsocial-96d32a311cab@spud>

On Mon, Aug 18, 2025 at 06:36:50PM +0100, Conor Dooley wrote:
> On Sun, Aug 17, 2025 at 02:05:48PM +0100, Aliaksandr Smirnou wrote:
> > Add the Device Tree schema and examples for the Pinefeat cef168 lens
> > control board. This board interfaces Canon EF & EF-S lenses with
> > non-Canon camera bodies, enabling electronic control of focus and
> > aperture via V4L2.
> > 
> 
> > Power supply is derived from fixed supplies via connector or GPIO
> > header. Therefore, the driver does not manage any regulator, so
> > representing any supply in the binding is redundant.
> 
> Wut? This doesn't make sense, you have supplies so they should be
> documented. The fact that they're shared with a bunch of other things on
> the SBC you're aiming the product at doesn't matter. What if someone

There is also some explanation at v2 discussion. I asked for that
because there is no known design (neither RPi or other boards having
compatible hat/connectors) which would have these supplies controllable.
Adding them now would mean you should make them also required (because
in fact they are), but since these are non-controllable there would be
just regulator-fixed with voltage and that's it. It's just bloat.

> doesn't use this sensor with an RPi and there is a dedicated regulator?

Unlikely but if ever such hardware appears, we can always add
regulators.

Best regards,
Krzysztof


