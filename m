Return-Path: <linux-media+bounces-18959-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF8C98CD06
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 08:17:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 616F31F247FA
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 06:17:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA49384A52;
	Wed,  2 Oct 2024 06:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iLyXMNbv"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4042581;
	Wed,  2 Oct 2024 06:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727849821; cv=none; b=IP8jWZcggncFcl5a6jLDXWG9/0yHHQAJxzazhu2NusL+WEHlichXzCnMxDjbc8TeOReMQL7rtmpeOa+2VrIuK4KTexVD8+MnKN+J9vZSI2xSJVhDpk1+QO3vNOcRLT4NEhTub/s10by2+w3eJjWt3TIvgk1ZsJWtmSURev5lFSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727849821; c=relaxed/simple;
	bh=OFVg8fIX+xvAe6Xup+mksgw/mFNgnlC3BvGhOzQyrDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jKHlzMGKAHu9vdJIaCmOKdj4vxhtyrfcPgIzkRQbr9PbTx1rSfUFrLouNMC8JliOSlaJTbZbHgg5FSzhzY4LIwErNgubBBgVhMil1zoinasGlTSDBwWVCtgafXaKtJP8vW8lS06cT/TjsofGiabEUBcHAGL62VAMsHu/EGceEcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iLyXMNbv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0984DC4CEC5;
	Wed,  2 Oct 2024 06:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727849820;
	bh=OFVg8fIX+xvAe6Xup+mksgw/mFNgnlC3BvGhOzQyrDI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iLyXMNbv1KT7bPzjbpXv4QMhO1w1rXIDUdkZhmuUlQsWKLDCvm+7BtxCx9RoHw47s
	 74T1n1xcvfYY+EthltWB+a5O/q4YbFNkxppfWbeOOCBTtwmIHtcibRVKp+vwSfFPOV
	 P3uZQC7JbvZHYiiysotmf9pc+XMBu1pNwzLDAnnp+fkdS5CBXLzSvWR3JAkdmqEBRv
	 xWRwz9Ga5NFNGF/7AkQbzJEe1ILSYjO2IyhFF4zjrZQtz2KCt5KsiFJ0wjdR1yWAl6
	 8SKCXIgWWh+SBuPeXOIae/26j7w7XHF9OoI/eA4ygW5Gss4z097KiKcXpaHLw/3Izn
	 6AFCoKc7UD5rQ==
Date: Wed, 2 Oct 2024 08:16:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fei Shao <fshao@chromium.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Tiffany Lin <tiffany.lin@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 4/8] dt-bindings: media: mediatek,vcodec: Revise
 description
Message-ID: <sl5rrmqh3zwhaz4dfbcworgmluc5albeov2f4qmka4ih4phfhf@g7vs2bwhhd6l>
References: <20241001113052.3124869-1-fshao@chromium.org>
 <20241001113052.3124869-5-fshao@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241001113052.3124869-5-fshao@chromium.org>

On Tue, Oct 01, 2024 at 07:27:22PM +0800, Fei Shao wrote:
> Revise the description of MediaTek video decoder to improve wording, fix
> typos, simplify diagram, and extend the pipeline architecture used in
> newer MediaTek SoCs (MT8186 and MT8188).
> 
> Signed-off-by: Fei Shao <fshao@chromium.org>
> ---
> Feedback are welcome.
> I've tried my best to organize the existing information with some
> educated guesses, but there might be inaccuracies or gaps still.
> Please let me know if you have anything to add so we can make this more
> comprehensive. Thanks!
> 
> Changes in v2:
> New patch.
> 
>  .../media/mediatek,vcodec-subdev-decoder.yaml | 100 +++++++++++-------
>  1 file changed, 59 insertions(+), 41 deletions(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


