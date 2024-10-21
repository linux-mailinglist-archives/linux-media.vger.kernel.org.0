Return-Path: <linux-media+bounces-20000-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 135AF9A8FD8
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 21:33:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF6C8281C4D
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 19:33:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEF971FBF41;
	Mon, 21 Oct 2024 19:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XxvmOwlB"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D931D0F73;
	Mon, 21 Oct 2024 19:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729539176; cv=none; b=qfNKsIcTXF8G6R0TIRGUD5U0WPT42EZ7xPMHdldKaN7HjMVioF+oIzDmX32LJdbz8/prrTl7U00bCenQYaWnN3h/k+T6xQB+8Q3JdGxLE3xCC3w8WsO4Cl/uRdkypN0VcDZEuPHPV2RfwHOHom/obW/26/PgG3S9lHmDRFDVFIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729539176; c=relaxed/simple;
	bh=gD0ZzmIV4/MlGmBFySRwVIU98Rh6f1sZhpdiCLGXqRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hcgsnIuxCKeRfB8YDQ0P9aRBRHUo38TfgtwRuUnqPq5sF79YZG1msk/ucSv6HY6uxZoWZa/3ORPHejcxWcQqkeK01oNCirwquZOvbHmCCp+rdHivBqyUhX8mq3wIrJrlR0l7c05847/LVpPLSx426LCMdv7TZ6hZqeyV+Y+HKJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XxvmOwlB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 565E5C4CEC3;
	Mon, 21 Oct 2024 19:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729539175;
	bh=gD0ZzmIV4/MlGmBFySRwVIU98Rh6f1sZhpdiCLGXqRc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XxvmOwlBbLAX+xo8z1ab8vZL4BACarSmTkN6zt0cPNNSShyJMRr+DJyyfrMjdQ669
	 pTRTgse8o7rOOFXN061RSxBGlZ8P6b2lC6ygE3Loj5BzBjBsW4wk4UCGkJRLHcjQ5i
	 H4ZSC+i6vNs6XTKAmunYtdmYFzRImMJ7O800DbTt/ZCqqE9pWdIIDXuoTO47AgFmPl
	 C6J2Z1J5Yk3vy5q4ynjhwstIeZv5TI7utkBC4W3RbeHoZiFw8JzjncjUFXgmAdbGzR
	 sq66sy8LKoQcL1gfEw+IG2PbqaGVPyWNTJ+lc4ifiQEWSX4s00sudm6CaGXzmKGTJJ
	 4SQucOUubnD4g==
Date: Mon, 21 Oct 2024 14:32:54 -0500
From: Rob Herring <robh@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, andrzej.hajda@intel.com,
	neil.armstrong@linaro.org, rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, krzk+dt@kernel.org, conor+dt@kernel.org,
	quic_jesszhan@quicinc.com, mchehab@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	catalin.marinas@arm.com, will@kernel.org,
	sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
	tomi.valkeinen@ideasonboard.com, quic_bjorande@quicinc.com,
	geert+renesas@glider.be, dmitry.baryshkov@linaro.org, arnd@arndb.de,
	nfraprado@collabora.com, thierry.reding@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com, sam@ravnborg.org,
	marex@denx.de, biju.das.jz@bp.renesas.com
Subject: Re: [PATCH v3 08/15] dt-bindings: display: Document dual-link LVDS
 display common properties
Message-ID: <20241021193254.GA1000195-robh@kernel.org>
References: <20241021064446.263619-1-victor.liu@nxp.com>
 <20241021064446.263619-9-victor.liu@nxp.com>
 <y6xpffdtpd4baczoatbotghhes3owh44tzdqvdgv3id4jj6jhj@nrqjn6d3wndx>
 <8f63ae16-f484-401c-a3e7-6c12a2343cc3@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f63ae16-f484-401c-a3e7-6c12a2343cc3@nxp.com>

On Mon, Oct 21, 2024 at 04:19:52PM +0800, Liu Ying wrote:
> On 10/21/2024, Krzysztof Kozlowski wrote:
> > On Mon, Oct 21, 2024 at 02:44:39PM +0800, Liu Ying wrote:
> >> Dual-link LVDS displays receive odd pixels and even pixels separately from
> >> dual LVDS links.  One link receives odd pixels and the other receives even
> >> pixels.  Some of those displays may also use only one LVDS link to receive
> >> all pixels, being odd and even agnostic.  Document common properties for
> >> those displays by extending LVDS display common properties defined in
> >> lvds.yaml.
> >>
> >> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> >> ---
> >> v3:
> >> * New patch.  (Dmitry)
> >>
> >>  .../bindings/display/lvds-dual-ports.yaml     | 76 +++++++++++++++++++
> >>  1 file changed, 76 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/display/lvds-dual-ports.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/display/lvds-dual-ports.yaml b/Documentation/devicetree/bindings/display/lvds-dual-ports.yaml
> >> new file mode 100644
> >> index 000000000000..0ac4c06d0a17
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/display/lvds-dual-ports.yaml
> >> @@ -0,0 +1,76 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/display/lvds-dual-ports.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Dual-link LVDS Display Common Properties
> >> +
> >> +maintainers:
> >> +  - Liu Ying <victor.liu@nxp.com>
> >> +
> >> +description: |
> >> +  This binding documents common properties for LVDS displays with dual LVDS
> > 
> > s/This binding documents//
> 
> Ack.
> 
> > 
> > But anyway there is a binding for common properties used in dual-link
> > panels: panel-common-dual. How is it different? Why this is not suitable
> > there? Why entirely different file name?
> 
> This one references lvds.yaml, which allows data-mapping and data-mirror.
> They are not something common for dual-link panels.
> 
> Also, this one is supposed to cover all dual-link LVDS displays including
> display panels and display bridges, while pane-common-dual.yaml is for
> panels only.

That's all fine, but refactor what is there, don't just duplicate 
things.

If we have the same property name defined (with a type) in 2 or more 
places, then that's a problem.

Rob

