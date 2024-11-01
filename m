Return-Path: <linux-media+bounces-20708-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2279B967A
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 18:22:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 635251F21533
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 17:22:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96E291CB530;
	Fri,  1 Nov 2024 17:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oltbq8yl"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49741BD9DC;
	Fri,  1 Nov 2024 17:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730481713; cv=none; b=pfuBpFeeOv9c1luok3VE01pBV6YgAk7zcWt191FkHGfMb1Hl8br9jQIRNWszb5L1QEmi4Y/jz2/WlkR6JO9XeoAv5xsU9GuNM6y9UwFfUVfCZ28bbkXFHyZWm54DmlXFAudDMblZygcqqWQNkBxsA/Ms5lsxGnXiYmprG4S8kR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730481713; c=relaxed/simple;
	bh=3A2/E11RnZgbKpQM60gPR6/16KeHF4eQh342j9UDESM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MkrLzUD70IVL13e40WOPWG4fOWgyvqIkh7XEltswcB7iR4Rpx7hUdhZVuRVhlLBg9rx6JMLizTYHf4SpZPgTNrU4fEFvxqotS8mg79wSHhlDYuOkH3efZdtHIFc+BV8BUF8fI95ljQ0e0z7aVez3m6z/SpAcX+/oxcVuSrgGrJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oltbq8yl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EB98C4CECD;
	Fri,  1 Nov 2024 17:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730481712;
	bh=3A2/E11RnZgbKpQM60gPR6/16KeHF4eQh342j9UDESM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Oltbq8yl/+NgUCRoK5gDXZ6TqGHRBXXNP0l8DZunO8JLxAsOlx04a2jPRDnpDwNaz
	 Uij8n+ekZoW3LkB/iapCqXKieuqN3HpmXQaR54bKDfs8yhZ7v9aEsNYAxPVmTRO0nb
	 1zWngrKGYJ+7tvVXm6145d4H13gbQWqbvYk20ZJ/eXjK/koeWE8gStyXHWNlWZZzRY
	 vKdWq+p01gxF+1j0ruIM74qz7+e+THH9S2zLTzdYwEJ1Ct7ScITRPJKyzgw3WHNikK
	 mjQyfL6nBYAuXO4iwFYRC2ip56c1drrEEKtD3ihVOhBj3Sqq0xpjNQQibLKTaLeTgE
	 i5GJwlmmFCynQ==
Date: Fri, 1 Nov 2024 12:21:50 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: devicetree@vger.kernel.org, tzimmermann@suse.de,
	jernej.skrabec@gmail.com, imx@lists.linux.dev,
	tomi.valkeinen@ideasonboard.com, airlied@gmail.com, jonas@kwiboo.se,
	catalin.marinas@arm.com, will@kernel.org, mripard@kernel.org,
	shawnguo@kernel.org, hverkuil@xs4all.nl,
	maarten.lankhorst@linux.intel.com, festevam@gmail.com,
	quic_bjorande@quicinc.com, sakari.ailus@linux.intel.com,
	linux-arm-kernel@lists.infradead.org, biju.das.jz@bp.renesas.com,
	s.hauer@pengutronix.de, geert+renesas@glider.be,
	thierry.reding@gmail.com, neil.armstrong@linaro.org, marex@denx.de,
	mchehab@kernel.org, simona@ffwll.ch, linux-media@vger.kernel.org,
	conor+dt@kernel.org, kernel@pengutronix.de,
	prabhakar.mahadev-lad.rj@bp.renesas.com, krzk+dt@kernel.org,
	Laurent.pinchart@ideasonboard.com, arnd@arndb.de, sam@ravnborg.org,
	andrzej.hajda@intel.com, rfoss@kernel.org,
	dmitry.baryshkov@linaro.org, quic_jesszhan@quicinc.com,
	nfraprado@collabora.com, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 09/13] dt-bindings: display: bridge: Add ITE IT6263
 LVDS to HDMI converter
Message-ID: <173048170995.3772353.5460654511674582491.robh@kernel.org>
References: <20241028023740.19732-1-victor.liu@nxp.com>
 <20241028023740.19732-10-victor.liu@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028023740.19732-10-victor.liu@nxp.com>


On Mon, 28 Oct 2024 10:37:36 +0800, Liu Ying wrote:
> Document ITE IT6263 LVDS to HDMI converter.
> 
> Product link:
> https://www.ite.com.tw/en/product/cate1/IT6263
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v4:
> * Require dual-lvds-odd-pixels or dual-lvds-even-pixels DT properties for
>   port@1.
> * Drop "data-mirror: true"(30-bit LVDS data bit order is not reversed).
> 
> v3:
> * Reference lvds-dual-ports.yaml.  (Dmitry)
> * Add data-mapping DT property.  (Dmitry, Biju)
> * Allow data-mirror.
> * Drop ite,lvds-link-num-data-lanes DT property.  (Dmitry, Biju)
> 
> v2:
> * Document number of LVDS link data lanes.  (Biju)
> * Simplify ports property by dropping "oneOf".  (Rob)
> 
>  .../bindings/display/bridge/ite,it6263.yaml   | 250 ++++++++++++++++++
>  1 file changed, 250 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


