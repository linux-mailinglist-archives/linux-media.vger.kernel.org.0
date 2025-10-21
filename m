Return-Path: <linux-media+bounces-45105-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AACDBF4BBD
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 08:46:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EED744011ED
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 06:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D19C980C02;
	Tue, 21 Oct 2025 06:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EA9P/QE8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F03C1FC8;
	Tue, 21 Oct 2025 06:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761029182; cv=none; b=s77bR2kABrqp5rIDEMThmd4L6HQbMtXtiXPL8yHK3gjNvXwOYwT+T8dna1SBRO4HmxkRGBHYudsCS1Tao4PVYF2SRHtByuJCAXY8Eahz6r9QWbR7dylNGerioK/0shzw2RHxYcg41bnosoKTHUCMKQUv/bOfI1RKUxyxauu97x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761029182; c=relaxed/simple;
	bh=JREaNZbzupGZXtcSbhqhCOPT70HjQXfrl31LYnRJQiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mke6aftT60nkzz0lT0IgvjC+7THUEBGea7BHFJyIvHExhM+Rf8nlBj8vHb5xmhBv2rsIsfitc5hwLsDPqfZfEj6NZJtTJ6SbqBSqeODNnMR7BCa1fUGvwA7PraiWFQi6u4oYVVuinA1Ehpany/LDhUjSu6qRnKk3yNbxpJiWgHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EA9P/QE8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32066C4CEF1;
	Tue, 21 Oct 2025 06:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761029181;
	bh=JREaNZbzupGZXtcSbhqhCOPT70HjQXfrl31LYnRJQiA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EA9P/QE8+Uby2UuV6kIadCKV436kghXHsazUdTH0mAMAlD2C9XLCabts180N3IbeS
	 GsB3/l5d0E2C4m1SbJJ1oQAZnTc7SrsVQcGzKRrWbxADzeu/FGK5/J1EIWi8CrV8lu
	 UgzDrPN0ei5F0QwV+1yOtOvRJNRDnCYFO7VWTQboC5sXXYB1a9QRJYzuwjjyQOHXXY
	 9Ipko+5FNDKlN8qwEZshtzNCNytDwC/YSSjyEddLVqZCOzjwNcdTu6UDh0e+c0nl0/
	 Ok3Tis4Ny6OS0wc0vvnDq0+mWLfrlKPISHCwcOJwZ8mv54o2/BpWlrELs1zZRi1Cek
	 hWg4RGGLy9YYw==
Date: Tue, 21 Oct 2025 08:46:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Cc: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, hverkuil+cisco@kernel.org, sakari.ailus@linux.intel.com, 
	bparrot@ti.com, jai.luthra@ideasonboard.com, dale@farnsworth.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	u-kumar1@ti.com, Sukrut Bellary <sbellary@baylibre.com>
Subject: Re: [PATCH V4 3/4] dt-bindings: media: ti: vpe: Add support for
 Video Input Port
Message-ID: <20251021-small-fascinating-dachshund-c4227e@kuoka>
References: <20251015054010.3594423-1-y-abhilashchandra@ti.com>
 <20251015054010.3594423-4-y-abhilashchandra@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251015054010.3594423-4-y-abhilashchandra@ti.com>

On Wed, Oct 15, 2025 at 11:10:09AM +0530, Yemike Abhilash Chandra wrote:
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    vip1: video@48970000 {

Drop label, while at it.

> +        compatible = "ti,dra7-vip";
> +        reg = <0x48970000 0x1000>;
> +        interrupts = <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 392 IRQ_TYPE_LEVEL_HIGH>;
> +        ti,ctrl-module = <&scm_conf 0x534 0x0 0x2 0x1 0x3>;
> +
> +        ports {
> +              #address-cells = <1>;

You still have completely messed up indentation.

> +              #size-cells = <0>;
> +
> +              vin1a: port@0 {
> +                    reg = <0>;
> +
> +                    vin1a_ep: endpoint {

Best regards,
Krzysztof


