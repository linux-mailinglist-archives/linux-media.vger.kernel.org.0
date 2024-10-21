Return-Path: <linux-media+bounces-19972-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5790D9A5D58
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 09:43:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18A3F281BAD
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 07:43:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B81C11E0E03;
	Mon, 21 Oct 2024 07:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l/aQdz1b"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3661E0DCE;
	Mon, 21 Oct 2024 07:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729496577; cv=none; b=IziiRIQrCmWj1NKkZeWI2/tfHBkBvDy/rYoBJDO9WGjCDewTWW0rP04Vq5ZnZPAO3efA88/1yxovGWSxxm8nTd2wzn/4FsCkqji4OMlfWL9jne41TT+E9f8An7YAr1ITEzFspNvXjj4yNz4IFwiYxqeYnAa6x0R8XqoQNwTyUdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729496577; c=relaxed/simple;
	bh=ApqwmB7DQ5PPTRaBJTXoXsgPgMvSEcAFElebawzKHa0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WthEpWt9Bzn3ocxpENelBH9qKKEzs0OPjhR+FCUch65p43iELmnlIStGqy88uX2gl9qbThkEOLjU02Au7v1YzrxEj7F2h78z3QvrnSXw9OrmlYi7uuQerK4bmY95kl3k4vLhdWzf2ja04Y7Im6z8cA6/pb+eZUUnION9ekIhQi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l/aQdz1b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6668C4CEC3;
	Mon, 21 Oct 2024 07:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729496576;
	bh=ApqwmB7DQ5PPTRaBJTXoXsgPgMvSEcAFElebawzKHa0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l/aQdz1b6a1b5M0AGzZmsZsjDcJv5G4peieTIxabEOz9GwCBn+QvAtrft1tPGi/62
	 Xn9NGcr8Sf49RqsAr+DcT7Rw4LeaIZTyBG32z6hKGw+Yp0Q/lVO7gVJVE6f0ddBJGO
	 osv01D5hnfm29ch95ShbtTjnR87qpTDNkpY871ki4t+nhk0F8D0Rq6dssEuQJOYQdx
	 se1dk89om8Bs9ONh8wwZHVsOPH/HCiGaMAP7lRKrDcrQvXLAHTDSs9+EcCeMjjKkVy
	 g5WiBmqJJyk1/q0CXhHXb3UqYjBrnjYsh511r5ClNl3JyFGHYK/+a/ngVKKMt4khrk
	 E4jVoV8NrT8eg==
Date: Mon, 21 Oct 2024 09:42:52 +0200
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
Subject: Re: [PATCH v3 08/15] dt-bindings: display: Document dual-link LVDS
 display common properties
Message-ID: <y6xpffdtpd4baczoatbotghhes3owh44tzdqvdgv3id4jj6jhj@nrqjn6d3wndx>
References: <20241021064446.263619-1-victor.liu@nxp.com>
 <20241021064446.263619-9-victor.liu@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241021064446.263619-9-victor.liu@nxp.com>

On Mon, Oct 21, 2024 at 02:44:39PM +0800, Liu Ying wrote:
> Dual-link LVDS displays receive odd pixels and even pixels separately from
> dual LVDS links.  One link receives odd pixels and the other receives even
> pixels.  Some of those displays may also use only one LVDS link to receive
> all pixels, being odd and even agnostic.  Document common properties for
> those displays by extending LVDS display common properties defined in
> lvds.yaml.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v3:
> * New patch.  (Dmitry)
> 
>  .../bindings/display/lvds-dual-ports.yaml     | 76 +++++++++++++++++++
>  1 file changed, 76 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/lvds-dual-ports.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/lvds-dual-ports.yaml b/Documentation/devicetree/bindings/display/lvds-dual-ports.yaml
> new file mode 100644
> index 000000000000..0ac4c06d0a17
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/lvds-dual-ports.yaml
> @@ -0,0 +1,76 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/lvds-dual-ports.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Dual-link LVDS Display Common Properties
> +
> +maintainers:
> +  - Liu Ying <victor.liu@nxp.com>
> +
> +description: |
> +  This binding documents common properties for LVDS displays with dual LVDS

s/This binding documents//

But anyway there is a binding for common properties used in dual-link
panels: panel-common-dual. How is it different? Why this is not suitable
there? Why entirely different file name?

Best regards,
Krzysztof


