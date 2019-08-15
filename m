Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDD358ECF2
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 15:35:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732300AbfHONfL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 09:35:11 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:53505 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732206AbfHONfL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 09:35:11 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1hyFuC-00008G-Fy; Thu, 15 Aug 2019 15:35:04 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1hyFuB-0003cy-UO; Thu, 15 Aug 2019 15:35:03 +0200
Date:   Thu, 15 Aug 2019 15:35:03 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hans.verkuil@cisco.com, jacopo+renesas@jmondi.org,
        robh+dt@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@pengutronix.de,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 01/13] dt-bindings: connector: analog: add tv norms
 property
Message-ID: <20190815133503.4md4zhkz6jdrc66e@pengutronix.de>
References: <20190415124413.18456-1-m.felsch@pengutronix.de>
 <20190415124413.18456-2-m.felsch@pengutronix.de>
 <20190516162755.GN14820@pendragon.ideasonboard.com>
 <20190809055809.fm47nllixxfievre@pengutronix.de>
 <20190815123335.GB13823@pendragon.ideasonboard.com>
 <20190815125002.4354pq7deqwocxeo@pengutronix.de>
 <20190815130200.GJ13823@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190815130200.GJ13823@pendragon.ideasonboard.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 15:27:16 up 89 days, 19:45, 58 users,  load average: 0.02, 0.04,
 0.04
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 19-08-15 16:02, Laurent Pinchart wrote:
> Hi Marco,
> 
> On Thu, Aug 15, 2019 at 02:50:02PM +0200, Marco Felsch wrote:
> > On 19-08-15 15:33, Laurent Pinchart wrote:
> > > On Fri, Aug 09, 2019 at 07:58:09AM +0200, Marco Felsch wrote:
> > >> On 19-05-16 19:27, Laurent Pinchart wrote:
> > >>> On Mon, Apr 15, 2019 at 02:44:01PM +0200, Marco Felsch wrote:
> > >>>> Some connectors no matter if in- or output supports only a limited
> > >>>> range of tv norms. It doesn't matter if the hardware behind that
> > >>>> connector supports more than the listed formats since the users are
> > >>>> restriced by a label e.g. to plug only a camera into this connector
> > >>>> which uses the PAL format.
> > >>>> 
> > >>>> This patch adds the capability to describe such limitation within the
> > >>>> firmware. There are no format restrictions if the property isn't
> > >>>> present, so it's completely backward compatible.
> > >>> 
> > >>> Why is this needed ? It's not really a hardware property, is it ? What's
> > >>> the use case ?
> > >> 
> > >> Cause some hardware only support a limited range of formats to that
> > >> connector. Of course it is a hardware property. For example if a
> > >> customer wants to limit a connector to a specifc norm because the
> > >> hardware behind that connector only supports that format or is
> > >> restricted to that format.
> > > 
> > > Then it should be a DT property of the hardware behind that connector
> > > (or information hardcoded directly into that driver), shouldn't it ?
> > 
> > Why? The connector is the limiting factor and not the decoder/bridge
> > device behind that. Let me explain it a bit more in detail. Our customer
> > sells hardware boxes and cameras. The camera is connected to the box
> > using a custom plug. So it's guaranteed that only their cameras can be
> > connected to. Also the camera they are using supports only PAL. So the
> > PAL signal is the only one which can be received on that connector. The
> > TVP itself supports more than just PAL signals and has multiple inputs.
> > So there can be the use case that a hardware box supports two physical
> > connectors: e.g. connector-PAL, connector-NTSC. The TVP should be
> > limited to PAL signals if the connector-PAL is active or limited to NTSC
> > if the connector-NTSC is active.
> > 
> > Hopefully you see now why we should model it on the connector side and
> > not on the device behind that connector.
> 
> So it essentially means that if someone connects an NTSC camera on the
> PAL input with the same custom connector, the hardware will support it,
> right ? I don't think it's a hardware limitation of the connector in
> that case :-) And I don't think it belongs to DT. Userspace is probably
> where I would handle this type of policy.

What you describe here would be a 'user hack' because our customer sells
only PAL cameras. I think it is a connector limitation because the
connector can be labeld with "PAL only" and is rectangle and there can
be a round "NTSC only" connector. IMHO this is a hardware limiting
factor and no one would expect that a NTSC camera is working on a "PAL
only" labeld connector.

Regards,
  Marco

> > >>>> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > >>>> Reviewed-by: Rob Herring <robh@kernel.org>
> > >>>> ---
> > >>>> [1] https://patchwork.kernel.org/cover/10794703/
> > >>>> 
> > >>>> v6:
> > >>>> - tvnorms.h: use tabs instead of spaces
> > >>>> - tvnorms.h: add TVNORM_PAL and TVNORM_SECAM
> > >>>> - tvnorms.h: drop rarely used TVNORM_ATSC_* norms
> > >>>> 
> > >>>> v2-v4:
> > >>>> - nothing since the patch was squashed from series [1] into this
> > >>>>   series.
> > >>>> 
> > >>>>  .../display/connector/analog-tv-connector.txt |  4 ++
> > >>>>  include/dt-bindings/media/tvnorms.h           | 56 +++++++++++++++++++
> > >>>>  2 files changed, 60 insertions(+)
> > >>>>  create mode 100644 include/dt-bindings/media/tvnorms.h
> > >>>> 
> > >>>> diff --git a/Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt b/Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt
> > >>>> index 0c0970c210ab..346f8937a0b7 100644
> > >>>> --- a/Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt
> > >>>> +++ b/Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt
> > >>>> @@ -6,6 +6,9 @@ Required properties:
> > >>>>  
> > >>>>  Optional properties:
> > >>>>  - label: a symbolic name for the connector
> > >>>> +- tvnorms: limit the supported tv norms on a connector to the given ones else
> > >>>> +           all tv norms are allowed. Possible video standards are defined in
> > >>>> +           include/dt-bindings/media/tvnorms.h.
> > >>>>  
> > >>>>  Required nodes:
> > >>>>  - Video port for TV input
> > >>>> @@ -16,6 +19,7 @@ Example
> > >>>>  tv: connector {
> > >>>>  	compatible = "composite-video-connector";
> > >>>>  	label = "tv";
> > >>>> +	tvnorms = <(TVNORM_PAL_M | TVNORM_NTSC_M)>;
> > >>>>  
> > >>>>  	port {
> > >>>>  		tv_connector_in: endpoint {
> > >>>> diff --git a/include/dt-bindings/media/tvnorms.h b/include/dt-bindings/media/tvnorms.h
> > >>>> new file mode 100644
> > >>>> index 000000000000..058ab8414145
> > >>>> --- /dev/null
> > >>>> +++ b/include/dt-bindings/media/tvnorms.h
> > >>>> @@ -0,0 +1,56 @@
> > >>>> +/* SPDX-License-Identifier: GPL-2.0-only or X11 */
> > >>>> +/*
> > >>>> + * Copyright 2019 Pengutronix, Marco Felsch <kernel@pengutronix.de>
> > >>>> + */
> > >>>> +
> > >>>> +#ifndef _DT_BINDINGS_MEDIA_TVNORMS_H
> > >>>> +#define _DT_BINDINGS_MEDIA_TVNORMS_H
> > >>>> +
> > >>>> +/* one bit for each */
> > >>>> +#define TVNORM_PAL_B		0x00000001
> > >>>> +#define TVNORM_PAL_B1		0x00000002
> > >>>> +#define TVNORM_PAL_G		0x00000004
> > >>>> +#define TVNORM_PAL_H		0x00000008
> > >>>> +#define TVNORM_PAL_I		0x00000010
> > >>>> +#define TVNORM_PAL_D		0x00000020
> > >>>> +#define TVNORM_PAL_D1		0x00000040
> > >>>> +#define TVNORM_PAL_K		0x00000080
> > >>>> +
> > >>>> +#define TVNORM_PAL		(TVNORM_PAL_B  | \
> > >>>> +				 TVNORM_PAL_B1 | \
> > >>>> +				 TVNORM_PAL_G  | \
> > >>>> +				 TVNORM_PAL_H  | \
> > >>>> +				 TVNORM_PAL_I  | \
> > >>>> +				 TVNORM_PAL_D  | \
> > >>>> +				 TVNORM_PAL_D1 | \
> > >>>> +				 TVNORM_PAL_K)
> > >>>> +
> > >>>> +#define TVNORM_PAL_M		0x00000100
> > >>>> +#define TVNORM_PAL_N		0x00000200
> > >>>> +#define TVNORM_PAL_Nc		0x00000400
> > >>>> +#define TVNORM_PAL_60		0x00000800
> > >>>> +
> > >>>> +#define TVNORM_NTSC_M		0x00001000	/* BTSC */
> > >>>> +#define TVNORM_NTSC_M_JP	0x00002000	/* EIA-J */
> > >>>> +#define TVNORM_NTSC_443		0x00004000
> > >>>> +#define TVNORM_NTSC_M_KR	0x00008000	/* FM A2 */
> > >>>> +
> > >>>> +#define TVNORM_SECAM_B		0x00010000
> > >>>> +#define TVNORM_SECAM_D		0x00020000
> > >>>> +#define TVNORM_SECAM_G		0x00040000
> > >>>> +#define TVNORM_SECAM_H		0x00080000
> > >>>> +#define TVNORM_SECAM_K		0x00100000
> > >>>> +#define TVNORM_SECAM_K1		0x00200000
> > >>>> +#define TVNORM_SECAM_L		0x00400000
> > >>>> +#define TVNORM_SECAM_LC		0x00800000
> > >>>> +
> > >>>> +#define TVNORM_SECAM		(TVNORM_SECAM_B  | \
> > >>>> +				 TVNORM_SECAM_D  | \
> > >>>> +				 TVNORM_SECAM_G  | \
> > >>>> +				 TVNORM_SECAM_H  | \
> > >>>> +				 TVNORM_SECAM_K  | \
> > >>>> +				 TVNORM_SECAM_K1 | \
> > >>>> +				 TVNORM_SECAM_L  | \
> > >>>> +				 TVNORM_SECAM_LC)
> > >>>> +
> > >>>> +#endif /* _DT_BINDINGS_MEDIA_TVNORMS_H */
> 
> -- 
> Regards,
> 
> Laurent Pinchart
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
