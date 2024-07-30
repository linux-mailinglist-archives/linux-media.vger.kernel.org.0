Return-Path: <linux-media+bounces-15588-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 983F19420C7
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 21:41:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A8B551C22395
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 19:41:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68F0E18CC1A;
	Tue, 30 Jul 2024 19:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tFbRrZsj"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B295B18C905;
	Tue, 30 Jul 2024 19:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722368447; cv=none; b=algSenUFq1d0W1czXo0+vIdPx8VVZ9K0gF1E95hd39soB/a5/JHx0kQtwxFE3bcIfIRc/I2SiOjMafi3X6fkc+MXKD8bXlukDTw0K2CtV04SB3hEAhP8MHAsiFym+GnGPYIOldO5D8jKj/59yYhG4uvnMRqCooMu0EeYteuLpNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722368447; c=relaxed/simple;
	bh=yCM3/ONv7sgmKodDfOdg/vxVtJXbnZ+0yfS9M1BxH1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g7oxo/FXiwYTSxHc7NgG34CcJLgg0fvMzGDO8s+CAFewc3WrCBUbLJ6Tj8TlfRfwWaES01MrC6bMYxQKgf1n7PQc92DGxRmTzQOD5eFcJ42ehFIpNitSyk0cOWiObyO5SJ06quzlSEh1PmzVp08wFeEC4sHsB+zKtHBU+pPQjp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tFbRrZsj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3931C32782;
	Tue, 30 Jul 2024 19:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722368447;
	bh=yCM3/ONv7sgmKodDfOdg/vxVtJXbnZ+0yfS9M1BxH1w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tFbRrZsjbMby5+hIDPhgxWRFRmTymaan/SCi1u62rN7tx2gnrTKhOi7MP30Qv7xAV
	 m8248xGAjo4csrMjg922lr4p/Y3Uq0ent8tubJK9CV2333gYRPaWkjkQvJ04YkhUsZ
	 BSGToN6YDS2SWwpYVMjR3aNkdut/JEdbAfY036jpmwzarwrWvWvHPmXc4IPI0T1y6D
	 xEwrgaF4Ll6LX8pE2keyMuvLPL4gGTxWRgv6rumq1zkk2gsbUhuDGPmXYh6Nkum6DM
	 m48x6XYwftJ9rk5fWz8Ne6ICsXOFR9LPo0n/okn2COPkF3rY30LNKIr0oMKmGE35sf
	 upsN21EPgn9qg==
Date: Tue, 30 Jul 2024 13:40:45 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Julien Stephan <jstephan@baylibre.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Phi-bang Nguyen <pnguyen@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andy Hsieh <andy.hsieh@mediatek.com>
Subject: Re: [PATCH v6 2/5] dt-bindings: media: add mediatek ISP3.0 camsv
Message-ID: <172236844509.2029627.16667161113171422418.robh@kernel.org>
References: <20240729-add-mtk-isp-3-0-support-v6-0-c374c9e0c672@baylibre.com>
 <20240729-add-mtk-isp-3-0-support-v6-2-c374c9e0c672@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240729-add-mtk-isp-3-0-support-v6-2-c374c9e0c672@baylibre.com>


On Mon, 29 Jul 2024 16:48:01 +0200, Julien Stephan wrote:
> From: Phi-bang Nguyen <pnguyen@baylibre.com>
> 
> This adds the bindings, for the ISP3.0 camsv module embedded in
> some Mediatek SoC, such as the mt8365
> 
> Signed-off-by: Phi-bang Nguyen <pnguyen@baylibre.com>
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
>  .../bindings/media/mediatek,mt8365-camsv.yaml      | 109 +++++++++++++++++++++
>  MAINTAINERS                                        |   1 +
>  2 files changed, 110 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


