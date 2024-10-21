Return-Path: <linux-media+bounces-19971-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CC31E9A5D49
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 09:40:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06DB91C225EA
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 07:40:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFFA21E04B7;
	Mon, 21 Oct 2024 07:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BDMEv9Cd"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09249194A73;
	Mon, 21 Oct 2024 07:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729496398; cv=none; b=bMjPMz0qGt1gYv8YpiCwaEsC33JasETt7Dfi9aSa2Yls1Vspm4otzW+havRvb/Hqv4v9DEFaie95AH68O5KoGiPQAcrUSKw6IazODWpEb2TTTpS7zk+bJ8aismgCIyNnUYgegNMAWYPrSd1FvMugX/ou/HVwWHxGZ3Z4rj1XoyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729496398; c=relaxed/simple;
	bh=t7UAac/htt4W25ejQemVdCOasvKrcJlRzstvxEL64Sg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A53KN4ecms+aN6IAvnRofepXCchYtKjV6nK0egJaPIZu1suAuAerL7rIJsvmAWjCppyVng81ZvRNrbR1WpguNlrJnKK7Z1mcpuZGZ/jcOiBQPrWI6z1B+FPuV6wkbTI2R2rQO2KpeZK2Lurw4eeJMvgPsNOAHybiujOi5XmpNFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BDMEv9Cd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B34A9C4CEC3;
	Mon, 21 Oct 2024 07:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729496397;
	bh=t7UAac/htt4W25ejQemVdCOasvKrcJlRzstvxEL64Sg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BDMEv9Cd9HxMft6YXRpvVjtTrMfioKFRW4haEgoqv+DR6MV4NCJSHDjMy7iC4ZJP9
	 i+g9IrXdtSSzLCOA78mwb1s+7nT1/3XTkA2PinHuBoQkfJ5oGh8jNtvtgz9vhLO3Ym
	 +SsbKgOLme2Vt1Jc7COmGX9drY+ukMtNTKZbJdlkhW5ZeM+CC3jtZCOaH2Wq3eYLON
	 6cBH6mvf5gqybshixouMzvCO+0p0O8TCKddHG+Ij4/8il+u0wDsL+OAX8XjyFeBoSi
	 CT0x2QrNvq69EOx5BOp/a9F05nwULABHM770Gfp2zn15WfdnC717zSMnBokkAL+9VO
	 Gryg6knxtH4oA==
Date: Mon, 21 Oct 2024 09:39:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
	rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
	jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, quic_jesszhan@quicinc.com, 
	mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, catalin.marinas@arm.com, will@kernel.org, 
	sakari.ailus@linux.intel.com, hverkuil@xs4all.nl, tomi.valkeinen@ideasonboard.com, 
	quic_bjorande@quicinc.com, geert+renesas@glider.be, dmitry.baryshkov@linaro.org, 
	arnd@arndb.de, nfraprado@collabora.com, thierry.reding@gmail.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, sam@ravnborg.org, marex@denx.de, biju.das.jz@bp.renesas.com
Subject: Re: [PATCH v3 07/15] dt-bindings: display: lvds-data-mapping: Add
 30-bit RGB pixel data mappings
Message-ID: <zcqpk37cxe76jqui5k3yyi5tlsm63zhkpsktg7h655e7cvv42g@nlhd2s3h3a7f>
References: <20241021064446.263619-1-victor.liu@nxp.com>
 <20241021064446.263619-8-victor.liu@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241021064446.263619-8-victor.liu@nxp.com>

On Mon, Oct 21, 2024 at 02:44:38PM +0800, Liu Ying wrote:
> Add "jeida-30" and "vesa-30" data mappings that are compatible with JEIDA
> and VESA respectively.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v3:
> * New patch.
> 
>  .../bindings/display/lvds-data-mapping.yaml   | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


