Return-Path: <linux-media+bounces-50811-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DF3D280E4
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 20:25:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E2E633040A97
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 18:56:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 306573195F9;
	Thu, 15 Jan 2026 18:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RVD1cCd4"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5713B530D;
	Thu, 15 Jan 2026 18:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768503386; cv=none; b=CB5TDN/aHkbDJSWmm2mZjR3vKr6T4+A7BeBnPj/vAWAEn55bZpWEVa2rMBG+0JTXmKEl+gvq2Nt12qPTPOCaaEfxPE+mmAOtlJV9+NWp9g66mdS9dyfEjC5D2s5dUPIZcGoWlrXW9zez5+yg1wcufTwH+PVOvE7WGxBj1Z+9IeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768503386; c=relaxed/simple;
	bh=vBf0JsV6SssEAFVKDfTmL6XYzcy1PrASWotaLv5u8JU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B+cfR4LjcIkrDdKp3ZKcs8u+H6dSK4RjKyTfM7sbFtdTQv3MfzHmy38mSGBO4AhhWe1NrrXCrFHCM/Qsys2ls95xB9dJRXq7DxnajkvGWvvP5eIHbAptTGH7hSp8ULMkIXvb19bvCogyH1sW0D8eiJm7nalybpHa6mHsrCp/giA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RVD1cCd4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF0BBC116D0;
	Thu, 15 Jan 2026 18:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768503386;
	bh=vBf0JsV6SssEAFVKDfTmL6XYzcy1PrASWotaLv5u8JU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RVD1cCd4U03YZGWql2QzFw7wQITcAlUGQYPQxiJUOCCXSaNln+3BpkftguUH5A9Yd
	 jEe5gdmkMa1fjADwlJ9hkYZtqNKlrvDY4gKkjGoa1wh0C5Jefd4W8UGZX8BorINaGo
	 3Y34sO6Uc8IXQg371drJhHzZUFow9/0P7tH8NXuk5bl8UWYKGuFQPGIGPGHDSelTtR
	 aOeZRHSuz+l3pKvtVJiXcdNwCcONOAghse2cVJdwM2R6KLxEQ8NEQLuyFgBJKQYkAx
	 Uu1Om4/T6GH2xNjYotMIjgW/POHT8jxKyX2TDRgoj6EPYdbZ38PE9cULqXvtGrx7M+
	 i5PpYXgHoLCvQ==
Date: Thu, 15 Jan 2026 12:56:25 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tianping Fang <tianping.fang@mediatek.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bjorn Andersson <andersson@kernel.org>, linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: Fix I2C bus node names in examples
Message-ID: <176850338451.1006318.4420022691055686967.robh@kernel.org>
References: <20260114081322.53411-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114081322.53411-2-krzysztof.kozlowski@oss.qualcomm.com>


On Wed, 14 Jan 2026 09:13:23 +0100, Krzysztof Kozlowski wrote:
> I2C bus node names are expected to be just "i2c", if there is just one
> such node in given example.  Replace remaining bad examples with
> scripted:
> 
>   git grep -l '\si2c[0-9] {' Documentation/devicetree/ | xargs sed -i -e 's/i2c[0-9] {/i2c {/'
> 
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Like Rob's commit 20a72af11f41 ("dt-bindings: Fix SPI and I2C bus node
> names in examples"). I checked also for SPI.
> 
> Rebased on Rob's tree - can you pick it up directly? Applies also on
> linux-next, so I do not expect conflicts.
> ---
>  .../bindings/embedded-controller/lenovo,yoga-c630-ec.yaml       | 2 +-
>  Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml   | 2 +-
>  Documentation/devicetree/bindings/usb/ite,it5205.yaml           | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 

Applied, thanks!


