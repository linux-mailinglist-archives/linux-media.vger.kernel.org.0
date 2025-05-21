Return-Path: <linux-media+bounces-32987-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E42ABECB1
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 09:05:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB8AF3A7138
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 07:04:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAC1B22B8C3;
	Wed, 21 May 2025 07:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iDMspO6P"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A9D23370A;
	Wed, 21 May 2025 07:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747811085; cv=none; b=W0GvXL9dVqKWw4VD8/VYG9uaQ/sCMdJCedW4BXHQM/bRfxEVVoDjOsDwYERhoXMaMIeeJp1jvgK4H/ak3JW7YjHX69rYkYnvJpBC2jzlq9zrQoITEWqI8ucobA5aJ2vGkbPRafqVowri5xGtNC9UsxuByNBsvp04RtUDmlBj7qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747811085; c=relaxed/simple;
	bh=rRJzzQvmbbQ9PvIlEeUG2481e8flDDWUv05t0aPKC40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zl9Fq5Vv+ENhrERXeRlOl9c0MbNJHB11vSupNvvuINcTHEZvt2TWADo8AiySG+FyUaAIrPoy+QfQvCM/4ehDmJj8PW54QvmONz+zF272fGPw/4TcAvy7PDH7FUhIg/nSUDRde4EWvcFoE/Bhg6jRnyRPLIuA/Saw1YR5ODiUo1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iDMspO6P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 315C9C4CEE4;
	Wed, 21 May 2025 07:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747811084;
	bh=rRJzzQvmbbQ9PvIlEeUG2481e8flDDWUv05t0aPKC40=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iDMspO6P8f9Sw2an17DiUgOTUW9EcIUq5t8wwx8mq/5Tt0dG740WLlPoWArBFo5HF
	 0/DdkmKBBn2T6jAZWLYWpjPNp+VJWFZWAu8DnGN0hJlxROWP0w7Tp2Sq038cRb1H63
	 pjs/Fo2ChUITXsmvgc+yjTwlCukG+6T4JBz367MY/bwhPvxqy3Z0M0LTyrpHjYwGnc
	 cnoK3n8ckTgAHfM865pOh+icHa1LwTcP5lUtpdxWzzf6YVvdQfDVukWooOEqvVZbyv
	 FOFG4pc5Mlo/rkAF8kHH2jgo2gMcu/G3eMfkmsUKUgc1NChmkLpNlzQYA31dxZxtsf
	 w7JLWUARMxemg==
Date: Wed, 21 May 2025 09:04:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kyrie Wu <kyrie.wu@mediatek.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v4 01/12] media: dt-bindings: mediatek,jpeg: Add
 mediatek, mt8196-jpgdec compatible
Message-ID: <20250521-friendly-hissing-tuna-a534d6@kuoka>
References: <20250521022322.27576-1-kyrie.wu@mediatek.com>
 <20250521022322.27576-2-kyrie.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250521022322.27576-2-kyrie.wu@mediatek.com>

On Wed, May 21, 2025 at 10:23:11AM GMT, Kyrie Wu wrote:
> Compared to the previous generation IC, the MT8196 uses SMMU
> instead of IOMMU and supports features such as dynamic voltage
> and frequency scaling. Therefore, add "mediatek,mt8196-jpgdec"
> compatible to the binding document.
> 
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


