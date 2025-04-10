Return-Path: <linux-media+bounces-29861-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7B8A839A3
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 08:44:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81AB68C3C00
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 06:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCC93204596;
	Thu, 10 Apr 2025 06:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ej1Zai1Y"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB85204086;
	Thu, 10 Apr 2025 06:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744267231; cv=none; b=oHNbFegFakdv5ptz2hjNQpZb3IeUm4BlvTv/cRZBEoPrTWYtoSpjH3WBZ4gi9H8yqwXzhfyjmCSdo2ZlykSx4sbE1uIO4ZUfY4Hhzjcwfr5hHCzrtduaCNy7L2U+3JTUoo3CRO8y7Qu8RirBEzX3McPVPMQpY0SQHm2M0rd8yn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744267231; c=relaxed/simple;
	bh=hIrIzISFokOzyuHO5ayNIza6AlGr5DkwM1e92dAAE2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ld6nYBA1yBM/ruCxxJb6npDbup3AwP72yJytW5Lww5CqwFfMf4MDmYgqJiUWTUFkEfztAvWsF7fXT16AcCJWh/K1aHqkINJy+/KOEEOorcyd6hHpWj1/ZmyTsLckTQQ+QyIAAF75RqeFIPBn7VMTAo3+Lw/JMs4TbO2vw2ImtgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ej1Zai1Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F84BC4CEDD;
	Thu, 10 Apr 2025 06:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744267230;
	bh=hIrIzISFokOzyuHO5ayNIza6AlGr5DkwM1e92dAAE2U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ej1Zai1YttQ06yOc6v3zdnUZYvEFWXJrVClrHT1ZQummIb2GUBXGA1wB9ELRMN6Lz
	 mGRfCbth9VDTacPbP4RDiTG1wZQGu/gSVxdxS8mIgWLrGW08OF5yz3LHdUZcPzx+BE
	 6ye/x9HxOplyiqeQLEOY7Vml2MSxYqiJGJmCcDBrCHqaOo25kVuH7vrZAdobNwAQIl
	 oemdhfF5sN8erOUFTxwOvzMtPLz8GWy6/IwmclwIwftQUQieFj9P51c3crthoRV3nj
	 2nUwxZ5pFrhWA50A/bGumIiQ6Cg2DO75nC5agKObJGIOUAw0Su3poPac9pY12BHSgY
	 Gi4HfPwL/DsUA==
Date: Thu, 10 Apr 2025 08:40:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "kyrie.wu" <kyrie.wu@mediatek.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 02/12] dt-bindings: mediatek: Add mediatek,
 mt8196-jpgenc compatible
Message-ID: <20250410-new-zippy-elephant-54bbcb@shite>
References: <20250410063006.5313-1-kyrie.wu@mediatek.com>
 <20250410063006.5313-3-kyrie.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250410063006.5313-3-kyrie.wu@mediatek.com>

On Thu, Apr 10, 2025 at 02:29:55PM GMT, kyrie.wu wrote:
> Add mediatek,mt8196-jpgenc compatible to binding document.
> 
> Signed-off-by: kyrie.wu <kyrie.wu@mediatek.com>

Same comments.

Also: missing media prefix in subject.

Please use subject prefixes matching the subsystem. You can get them for
example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

Best regards,
Krzysztof


