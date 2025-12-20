Return-Path: <linux-media+bounces-49226-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EE91DCD2C45
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 10:34:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E1FF23011ED8
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 09:34:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9358E304BB4;
	Sat, 20 Dec 2025 09:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YnQt/gUr"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD12C2FE067;
	Sat, 20 Dec 2025 09:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766223266; cv=none; b=nSS85zs+EL6K+gU/ejmRh7jnJ+sWrjRR+qTA8aYCoPI1D1HtIs13Nsf09dSJhRyEU3ZO/q6Ex9WgYRVjz7hKw3K5/HeHvvIJYiBzPAW0Tj4niVv2BNmmHAPGbzvwQ4fGWdjJUYJgjUBEwfMS2TiTrXcigG4SLWwDvVPBOhOWRUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766223266; c=relaxed/simple;
	bh=eIyfjlT66Z7KZMioqTIcLRoNnJpoh8HRfoh4oqlm0qQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=beNVbr6UCH5Yfpm9StdLVMOJXEPFCT9nJFkCxriZeiqkT/GqeIZ2okaKeEeRJIP1NHTZRwO/BV+ABx2tCyPjeVMv5I+QdS5rZMeeR6aZXwHphZSvWIDBgsfzAf1OIs326jgYBQlQvjXMTc88boalyQRwDqQAcEJvlCpjb5//co8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YnQt/gUr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94BCBC4CEF5;
	Sat, 20 Dec 2025 09:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766223265;
	bh=eIyfjlT66Z7KZMioqTIcLRoNnJpoh8HRfoh4oqlm0qQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YnQt/gUrcZGskZZpV/DTEu6HW8WyedgO/EqRvoeRonOWfQsBHETo9w+wxcT6dTnl/
	 85oKA7QtUYAb7Pwk5OAcifycQ8Un28CYwE/NWF0IQNBSuWJD69ZGhHKp2kWvffg0io
	 ZqlmDXZTavHZ4yVTPPoQz5IhFNyrbjTwc0g2TZGlz5m9P4jITtkclkuQJyS7dVZVhE
	 qbW4IAhsu35ysHSJf95hYvzee7Zle/RO2saQNwhaa0Fuq40CHZsu/2+TUiqjazqLH9
	 WwCqoSKEMcKzZOUaqa6ZvrHZ55aLpHWZJAiAXf2G0ik2Xr21qz5/gI+vw89X1ENRXC
	 PZ+q2+Ohx3wtQ==
Date: Sat, 20 Dec 2025 10:34:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Hugues Fruchet <hugues.fruchet@foss.st.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] dt-bindings: media: st: dcmipp: add 'power-domains'
 property
Message-ID: <20251220-sociable-bald-partridge-7a67ab@quoll>
References: <20251219-stm32-mp2x-dcmipp-csi-power-domain-v1-0-a6edb2aa8154@foss.st.com>
 <20251219-stm32-mp2x-dcmipp-csi-power-domain-v1-4-a6edb2aa8154@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251219-stm32-mp2x-dcmipp-csi-power-domain-v1-4-a6edb2aa8154@foss.st.com>

On Fri, Dec 19, 2025 at 04:58:06PM +0100, Alain Volmat wrote:
> STM32 DCMIPP may be in a power domain which is the case for the
> STM32MP2x based boards.
> Allow a single 'power-domains' entry for STM32 DCMIPP.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
>  Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


