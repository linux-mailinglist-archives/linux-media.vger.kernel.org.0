Return-Path: <linux-media+bounces-19973-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A00A9A5D5D
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 09:43:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 035A81F20FEF
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 07:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 263221E0DEB;
	Mon, 21 Oct 2024 07:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LB912OwV"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D44440C;
	Mon, 21 Oct 2024 07:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729496614; cv=none; b=nJtl6kQN63c2luMDCSHMf08JSkf7PdLktj0ehMsTs8/A9Jy7g34qlURaCja9EwncQ4rBYjb9/2of7z5H3KvV+MMqoWrWPnTsO0DBP7ZySKp7eO5HDvJkZbdU7Vu69XYwAMH6i5apYtNQyHvI47I9Bv5yrC8tYzSSySi1/tsOZpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729496614; c=relaxed/simple;
	bh=NH5HPey058GB0TD3/kCCLHNV5gW+T94GSK3qrZ1VWiY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YlPKj5AuQMW82QTeKgVmUiizzjiyRPM5TpKQJ1T4jPVFlApKff55dGjq7fEo4GNshcXTCGhw7j0nROkKR0gzkLoWW5uizvz3YtqICllldKr5Nc/Nje/S4MdkFdeaiqqidKG8UyjANVR6IiPk/+w6P9XMM+iSYjBg4hJJpO+VA5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LB912OwV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC73CC4CEC3;
	Mon, 21 Oct 2024 07:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729496614;
	bh=NH5HPey058GB0TD3/kCCLHNV5gW+T94GSK3qrZ1VWiY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LB912OwVWVQBbCAUgaq4D1R/4Og6UCpREUBV4dKCf+HA9Zj1HV8KK0m4R4hcz7jJT
	 K2DNo2u9RJOAMvm8oGHCeIjoGOc82wg+Z/uAMrQF59mRFlxLrw/Dvtusk+/XPgHAbG
	 RwLfXTRZ8inyMo7QDAGkTp+Dl7LRT2sq8HZFZAyC/KHUw+3NxIc7+0N5f5fnHOPiYA
	 JpntmH9LClGKULiEDJwj1TkRzVY4R7wUl3i92nI205HTbxF3n2HVNy8GCQqdtHNXo0
	 aK46AjjWGwMFbpvJyvMWjlIdRfUwNt4W4wF1axsJUEV95dtWi6NYIoSBaoE0PD6Mhv
	 qL42rpN3KVVAA==
Date: Mon, 21 Oct 2024 09:43:30 +0200
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
Subject: Re: [PATCH v3 09/15] dt-bindings: display:
 panel-simple-lvds-dual-ports: Reference lvds-dual-ports.yaml
Message-ID: <3qrtknxsgxzyhwivd7d4eqqg7v6twgtczxotg7rhkdumjkl3p7@u2fso5hexiu4>
References: <20241021064446.263619-1-victor.liu@nxp.com>
 <20241021064446.263619-10-victor.liu@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241021064446.263619-10-victor.liu@nxp.com>

On Mon, Oct 21, 2024 at 02:44:40PM +0800, Liu Ying wrote:
> This schema documents LVDS panels with dual links.  lvds-dual-ports.yaml
> documents dual-link LVDS display common properties.  Reference the ports
> property defined in lvds-dual-ports.yaml to save lines.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v3:
> * New patch.  (Dmitry)
> 
>  .../panel/panel-simple-lvds-dual-ports.yaml   | 20 +------------------
>  1 file changed, 1 insertion(+), 19 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
> index 10ed4b57232b..e80fc7006984 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
> @@ -22,6 +22,7 @@ description: |
>    If the panel is more advanced a dedicated binding file is required.
>  
>  allOf:
> +  - $ref: /schemas/display/lvds-dual-ports.yaml#
>    - $ref: panel-common.yaml#

So dual link panels common binding does not fit here? sorry, this is
just introducing mess and confusion.

Best regards,
Krzysztof


