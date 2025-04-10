Return-Path: <linux-media+bounces-29860-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CF4A83994
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 08:41:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B4884A3A08
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 06:40:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C37D20468C;
	Thu, 10 Apr 2025 06:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m2Ao9rgO"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DC01BF37;
	Thu, 10 Apr 2025 06:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744267197; cv=none; b=IN/43E9iDI17ymAz1ZkoFDD6GzE9qJgcmklKuuiVRA9btX8F7ZLIMb06rrrmJxL5UBDSm3qX0NDSUlCwVTn7LHytbcxvPrnL7086nIrvQonD9Is6nkHNcercIV58jHN/jEVPCDVOSASTgpAI0aSDVWH9pmT9ZTe+qy/ewtTJ1/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744267197; c=relaxed/simple;
	bh=qIxq6rm05hndLmxdtwm+Juf9aChyLKD49TOqyEtT0AA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lv+vocmMurTN5ych92LhFaZ6NoGS23lAUjK2VZb/nRiE6F5GlMV7aotKlx1YvmVyRBkVjeuZcswxHHRABfqrYKBBlt0HHcfraZ87zmW9Aj85h7BL5gchTuNZKXYepSCfpqjN46ngi02e7eTLneiABauZ1Qs/ZDNuatae1pkjj7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m2Ao9rgO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 564BDC4CEDD;
	Thu, 10 Apr 2025 06:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744267196;
	bh=qIxq6rm05hndLmxdtwm+Juf9aChyLKD49TOqyEtT0AA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m2Ao9rgOsYNPb8Y95yxbhe2W68oV3pEjBBTB9tPTAxCjARjQ6MEskgNwtqxD3UMji
	 e00nFQc40dFUn2VWNXCLc0nOkt61LjcHseDXQnIT7TJloTiTidNJzNWPdKOUF5JzC9
	 UNIT/vXrecs37PLOH6ncJDREtCFfP2MpIixRRKFy82q2lnlCXyWrffLTRkao8GJvwR
	 sZ0pDYyZ19dI0S8qpost5vtxwxabVZU2q9d2kQpQDx7R3Qwgfi3/KBiUCjtKG5pDsN
	 AiI3S3nwFIeBdFCPmdby8MxSYWkKVaP2zipAbLkdm60lpY55VAlC2dzbfF/MTXuFHW
	 XqHB1dE4rw9tw==
Date: Thu, 10 Apr 2025 08:39:54 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "kyrie.wu" <kyrie.wu@mediatek.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 01/12] dt-bindings: mediatek: Add mediatek,
 mt8196-jpgdec compatible
Message-ID: <20250410-wandering-righteous-hound-ac5edd@shite>
References: <20250410063006.5313-1-kyrie.wu@mediatek.com>
 <20250410063006.5313-2-kyrie.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250410063006.5313-2-kyrie.wu@mediatek.com>

On Thu, Apr 10, 2025 at 02:29:54PM GMT, kyrie.wu wrote:
> Add mediatek,mt8196-jpgdec compatible to binding document.
> 
> Signed-off-by: kyrie.wu <kyrie.wu@mediatek.com>

Usual mediatek comment - looks like copy paste of username. Please reach
to your colleagues how to fix it.

> ---
>  .../bindings/media/mediatek,mt8195-jpegdec.yaml           | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
> index e5448c60e3eb..28a9a9bfdbf8 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
> @@ -14,7 +14,9 @@ description:
>  
>  properties:
>    compatible:
> -    const: mediatek,mt8195-jpgdec
> +    enum:
> +      - mediatek,mt8195-jpgdec
> +      - mediatek,mt8196-jpgdec

And devices are not compatible?

Best regards,
Krzysztof


