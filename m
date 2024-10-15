Return-Path: <linux-media+bounces-19638-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D4499DDC8
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 07:57:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3F2DEB220D7
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 05:57:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C06B317E016;
	Tue, 15 Oct 2024 05:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xt60iYJ3"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20468173357;
	Tue, 15 Oct 2024 05:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728971826; cv=none; b=qU3gWd0fkPb1TEV+jTmd087ul6Re645zPg3Jko/lYn5AEEmGnpoG7uFwj2Jz2YHoe6fz/o8WIXQxBWQhfmfk2OFOz51GgKtBR5TalJZiyffT5Nm8+4PdRNu4jI1QjVNuWV2sLUTwgQ9UKz8ARSOmtbIhstj2ib2IMj/RzFu0t48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728971826; c=relaxed/simple;
	bh=jh3FS2NplQHmnYRTMHu/6cEeELYhB+WGx4QCqrWjDCI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UCvde8ASlEMJnAx6nNYtpNigXQ9R0RUuXKUeWfDpXxBVc3m+0MJCvqwUcXnzaH/wxNdftaDcQn+TLFxNmC6nQ2dKcr21tyLC77GsT4T+gcXHPpg90JLdh3T4ii0UI0rcOnJeyrTjwCoku0UKg00tRMP41gN7RXHPh507g1SlJbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xt60iYJ3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 815B9C4CEC7;
	Tue, 15 Oct 2024 05:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728971825;
	bh=jh3FS2NplQHmnYRTMHu/6cEeELYhB+WGx4QCqrWjDCI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xt60iYJ3Entkh3D5XzExsObjSiudTP7BXRUFl8zaqxvYcbf92zXDuxJDqZAdval0v
	 cNWZ9x55Uymj3qL64yQ6XCme6i3gDafRRGNXKXcGKIA+8ELf857FwBMsbGlKKAh0/M
	 UmdfFgGbF8/in9C74/+sm6ms/KmYwkxS/pd1SY4wysx2yp+jRTcJtpsIa9WHDs27uK
	 fx5NxbE4XRhlZTH9M9kA6yLUL2BHaRymvHs5m8jgRdiLp2xJ6/hEUt56uQABBigDKK
	 e4rp+W5YTRpVvX2F+MfaFdza+pRWqlhTuMhfHqdCEkUDeTjQQ9mkhiIsgR/U+oUmqT
	 yqvai6eUrQaAw==
Date: Tue, 15 Oct 2024 07:57:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: guoniu.zhou@oss.nxp.com
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com, 
	jacopo@jmondi.org, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] dt-bindings: media: nxp,imx8-isi: Add i.MX8ULP
 ISI compatible string
Message-ID: <zkcihcydz4xsr7htmiy5gvatc7ojpgn66jhc6ki744pb4qz7r7@4aokg7rd422p>
References: <20241014093312.1588304-1-guoniu.zhou@oss.nxp.com>
 <20241014093312.1588304-3-guoniu.zhou@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241014093312.1588304-3-guoniu.zhou@oss.nxp.com>

On Mon, Oct 14, 2024 at 05:33:14PM +0800, guoniu.zhou@oss.nxp.com wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
> 
> Add the compatible string support for i.MX8ULP ISI.
> 
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


