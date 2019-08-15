Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A60E88EB94
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 14:33:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731813AbfHOMds (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 08:33:48 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:44926 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731716AbfHOMds (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 08:33:48 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2A3F82AF;
        Thu, 15 Aug 2019 14:33:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1565872424;
        bh=Nyw1JCfJMrEtoxdvZKdVUUclQbz1d6UF+tgswVDWIrA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OxMu1xR6c32IJ0CfGHY4QT+eSwHSmkGUHli6DAw8TTHUu03bXKDd7G9jci/kE4sDk
         TfbA4RXqtdclPXCmNCz9jSur/y4tPWShLnCCgbffEY68JkztiYfbue2XHKaaqstlOr
         Lh7yG0R3Fc1VYhwwTcKJsaeoW1glVIDkeJIYdnNY=
Date:   Thu, 15 Aug 2019 15:33:35 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hans.verkuil@cisco.com, jacopo+renesas@jmondi.org,
        robh+dt@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@pengutronix.de,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 01/13] dt-bindings: connector: analog: add tv norms
 property
Message-ID: <20190815123335.GB13823@pendragon.ideasonboard.com>
References: <20190415124413.18456-1-m.felsch@pengutronix.de>
 <20190415124413.18456-2-m.felsch@pengutronix.de>
 <20190516162755.GN14820@pendragon.ideasonboard.com>
 <20190809055809.fm47nllixxfievre@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190809055809.fm47nllixxfievre@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marco,

On Fri, Aug 09, 2019 at 07:58:09AM +0200, Marco Felsch wrote:
> On 19-05-16 19:27, Laurent Pinchart wrote:
> > On Mon, Apr 15, 2019 at 02:44:01PM +0200, Marco Felsch wrote:
> > > Some connectors no matter if in- or output supports only a limited
> > > range of tv norms. It doesn't matter if the hardware behind that
> > > connector supports more than the listed formats since the users are
> > > restriced by a label e.g. to plug only a camera into this connector
> > > which uses the PAL format.
> > > 
> > > This patch adds the capability to describe such limitation within the
> > > firmware. There are no format restrictions if the property isn't
> > > present, so it's completely backward compatible.
> > 
> > Why is this needed ? It's not really a hardware property, is it ? What's
> > the use case ?
> 
> Cause some hardware only support a limited range of formats to that
> connector. Of course it is a hardware property. For example if a
> customer wants to limit a connector to a specifc norm because the
> hardware behind that connector only supports that format or is
> restricted to that format.

Then it should be a DT property of the hardware behind that connector
(or information hardcoded directly into that driver), shouldn't it ?

> > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > ---
> > > [1] https://patchwork.kernel.org/cover/10794703/
> > > 
> > > v6:
> > > - tvnorms.h: use tabs instead of spaces
> > > - tvnorms.h: add TVNORM_PAL and TVNORM_SECAM
> > > - tvnorms.h: drop rarely used TVNORM_ATSC_* norms
> > > 
> > > v2-v4:
> > > - nothing since the patch was squashed from series [1] into this
> > >   series.
> > > 
> > >  .../display/connector/analog-tv-connector.txt |  4 ++
> > >  include/dt-bindings/media/tvnorms.h           | 56 +++++++++++++++++++
> > >  2 files changed, 60 insertions(+)
> > >  create mode 100644 include/dt-bindings/media/tvnorms.h
> > > 
> > > diff --git a/Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt b/Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt
> > > index 0c0970c210ab..346f8937a0b7 100644
> > > --- a/Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt
> > > +++ b/Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt
> > > @@ -6,6 +6,9 @@ Required properties:
> > >  
> > >  Optional properties:
> > >  - label: a symbolic name for the connector
> > > +- tvnorms: limit the supported tv norms on a connector to the given ones else
> > > +           all tv norms are allowed. Possible video standards are defined in
> > > +           include/dt-bindings/media/tvnorms.h.
> > >  
> > >  Required nodes:
> > >  - Video port for TV input
> > > @@ -16,6 +19,7 @@ Example
> > >  tv: connector {
> > >  	compatible = "composite-video-connector";
> > >  	label = "tv";
> > > +	tvnorms = <(TVNORM_PAL_M | TVNORM_NTSC_M)>;
> > >  
> > >  	port {
> > >  		tv_connector_in: endpoint {
> > > diff --git a/include/dt-bindings/media/tvnorms.h b/include/dt-bindings/media/tvnorms.h
> > > new file mode 100644
> > > index 000000000000..058ab8414145
> > > --- /dev/null
> > > +++ b/include/dt-bindings/media/tvnorms.h
> > > @@ -0,0 +1,56 @@
> > > +/* SPDX-License-Identifier: GPL-2.0-only or X11 */
> > > +/*
> > > + * Copyright 2019 Pengutronix, Marco Felsch <kernel@pengutronix.de>
> > > + */
> > > +
> > > +#ifndef _DT_BINDINGS_MEDIA_TVNORMS_H
> > > +#define _DT_BINDINGS_MEDIA_TVNORMS_H
> > > +
> > > +/* one bit for each */
> > > +#define TVNORM_PAL_B		0x00000001
> > > +#define TVNORM_PAL_B1		0x00000002
> > > +#define TVNORM_PAL_G		0x00000004
> > > +#define TVNORM_PAL_H		0x00000008
> > > +#define TVNORM_PAL_I		0x00000010
> > > +#define TVNORM_PAL_D		0x00000020
> > > +#define TVNORM_PAL_D1		0x00000040
> > > +#define TVNORM_PAL_K		0x00000080
> > > +
> > > +#define TVNORM_PAL		(TVNORM_PAL_B  | \
> > > +				 TVNORM_PAL_B1 | \
> > > +				 TVNORM_PAL_G  | \
> > > +				 TVNORM_PAL_H  | \
> > > +				 TVNORM_PAL_I  | \
> > > +				 TVNORM_PAL_D  | \
> > > +				 TVNORM_PAL_D1 | \
> > > +				 TVNORM_PAL_K)
> > > +
> > > +#define TVNORM_PAL_M		0x00000100
> > > +#define TVNORM_PAL_N		0x00000200
> > > +#define TVNORM_PAL_Nc		0x00000400
> > > +#define TVNORM_PAL_60		0x00000800
> > > +
> > > +#define TVNORM_NTSC_M		0x00001000	/* BTSC */
> > > +#define TVNORM_NTSC_M_JP	0x00002000	/* EIA-J */
> > > +#define TVNORM_NTSC_443		0x00004000
> > > +#define TVNORM_NTSC_M_KR	0x00008000	/* FM A2 */
> > > +
> > > +#define TVNORM_SECAM_B		0x00010000
> > > +#define TVNORM_SECAM_D		0x00020000
> > > +#define TVNORM_SECAM_G		0x00040000
> > > +#define TVNORM_SECAM_H		0x00080000
> > > +#define TVNORM_SECAM_K		0x00100000
> > > +#define TVNORM_SECAM_K1		0x00200000
> > > +#define TVNORM_SECAM_L		0x00400000
> > > +#define TVNORM_SECAM_LC		0x00800000
> > > +
> > > +#define TVNORM_SECAM		(TVNORM_SECAM_B  | \
> > > +				 TVNORM_SECAM_D  | \
> > > +				 TVNORM_SECAM_G  | \
> > > +				 TVNORM_SECAM_H  | \
> > > +				 TVNORM_SECAM_K  | \
> > > +				 TVNORM_SECAM_K1 | \
> > > +				 TVNORM_SECAM_L  | \
> > > +				 TVNORM_SECAM_LC)
> > > +
> > > +#endif /* _DT_BINDINGS_MEDIA_TVNORMS_H */

-- 
Regards,

Laurent Pinchart
