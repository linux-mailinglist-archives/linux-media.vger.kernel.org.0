Return-Path: <linux-media+bounces-39404-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37957B2015C
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 10:08:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D207C161677
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 08:07:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EAA52DA75F;
	Mon, 11 Aug 2025 08:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mp6fa7jD"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0367419E967;
	Mon, 11 Aug 2025 08:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754899651; cv=none; b=D41Lh4t1+PnMsWB8Op+rX0u9ltrE+3VVdKu8uKPa/9yMM9Cenox06UYNRTOXpexq30J4UfsBAUGMTUwCWkTiEmrE9fe11h4DORetmkMAsnplx1XAZ9NG5a1IWA/tmUXuLDZ+vykH1gIXJPjmU7e1QzTsI/UFroJjzZaHRtgTMms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754899651; c=relaxed/simple;
	bh=GuqQ/atb5C/6Edb5aI6yWEOFTf0z/YnBtztRgrCVmAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gAKpBa+w1nDmBSD3/iYEptmpW9WfYPSOGLCG0fOjzmYz/UL9vhJwB4O3uO+vCJ8KB48a6LnCzlnDiAT3FPy/dXtWK/t+cqftSYM5yPVGzzTQVcilT2grxVciMH466Q1OkDugnf0GOJRXnCGb5wKI350rTHW1HDGjW9PDuKLgotM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mp6fa7jD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C2B2C4CEED;
	Mon, 11 Aug 2025 08:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754899650;
	bh=GuqQ/atb5C/6Edb5aI6yWEOFTf0z/YnBtztRgrCVmAM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mp6fa7jDERrN/G7YvQ/8rhkiSLwHePAdcl0+RkXHp+qqiYYwYpl954Pv71jwNrYep
	 lK8ExOH0pn9/3KtUUaKbYyye+myHKQqp/xmV9ZGzq8Kgq4mTVEYxjnnRPxk6Ph5410
	 P8Ny/pN68yok512QV5RWaKHeK77mzPBFUMP+8iapRJ6mb8YjBDmVlOx7FlEAqlk1NW
	 5zBd+euPCNI6w1hd2ZDX9a6E1n5G+nOPplzRytvT+3UOpSXTtS8bCdT+tf3LNVGUXv
	 IBuTP+MZBeQ9828qrM84amxGzkFGVYHTPI0TipP0l/YPp+WP3Fdw/GhdUTqvSJyAc+
	 X5cqNytrdycFw==
Date: Mon, 11 Aug 2025 10:07:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kyrie Wu <kyrie.wu@mediatek.com>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>, 
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, Nathan Hebert <nhebert@chromium.org>, 
	Arnd Bergmann <arnd@arndb.de>, Irui Wang <irui.wang@mediatek.com>, 
	George Sun <george.sun@mediatek.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, 
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
Subject: Re: [PATCH v2 1/8] dt-bindings: media: mediatek: decoder: Add MT8189
 mediatek,vcodec-decoder
Message-ID: <20250811-archetypal-olive-doberman-ff0a31@kuoka>
References: <20250811032616.1385-1-kyrie.wu@mediatek.com>
 <20250811032616.1385-2-kyrie.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250811032616.1385-2-kyrie.wu@mediatek.com>

On Mon, Aug 11, 2025 at 11:26:08AM +0800, Kyrie Wu wrote:
> Add compatible for video decoder on MT8189 platform. Compared with
> former ICs, the MT8189 decoder use iommu to instead of smmu, and
> use scp architecture, the frequency is only 406MHZ, and cannot reach
> more than 700MHZ. At the same time, the decoder supports the vp9
> decoding protocol for the first time in single IC.
> 
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> ---
>  .../bindings/media/mediatek,vcodec-subdev-decoder.yaml           | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
> index 74e1d88d3056..1bb5a2485e4c 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
> @@ -77,6 +77,7 @@ properties:
>        - mediatek,mt8188-vcodec-dec
>        - mediatek,mt8195-vcodec-dec
>        - mediatek,mt8196-vcodec-dec
> +      - mediatek,mt8189-vcodec-dec

Misplaced.

Best regards,
Krzysztof


