Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFD0DC02D1
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2019 12:01:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726441AbfI0KBN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Sep 2019 06:01:13 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:43537 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726284AbfI0KBN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Sep 2019 06:01:13 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iDn3f-00077L-4E; Fri, 27 Sep 2019 12:01:03 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1iDn3c-0001zI-IA; Fri, 27 Sep 2019 12:01:00 +0200
Date:   Fri, 27 Sep 2019 12:01:00 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hans.verkuil@cisco.com, jacopo+renesas@jmondi.org,
        robh+dt@kernel.org, laurent.pinchart@ideasonboard.com,
        devicetree@vger.kernel.org, kernel@pengutronix.de,
        linux-media@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v10 01/14] dt-bindings: connector: analog: add sdtv
 standards property
Message-ID: <20190927100100.hbi3csxzixi2kpej@pengutronix.de>
References: <20190830101646.6530-1-m.felsch@pengutronix.de>
 <20190830101646.6530-2-m.felsch@pengutronix.de>
 <d5906500-105e-d87d-6ac0-cc8cbd220283@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5906500-105e-d87d-6ac0-cc8cbd220283@xs4all.nl>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 11:58:48 up 132 days, 16:16, 87 users,  load average: 0.14, 0.09,
 0.07
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On 19-09-27 11:09, Hans Verkuil wrote:
> Hi Marco,
> 
> On 8/30/19 12:16 PM, Marco Felsch wrote:
> > Some connectors no matter if in- or output supports only a limited
> > range of sdtv standards. It doesn't matter if the hardware behind that
> > connector supports more than the listed formats since the users are
> > restriced by a label e.g. to plug only a camera into this connector
> > which uses the PAL format.
> > 
> > This patch adds the capability to describe such limitation within the
> > firmware. There are no format restrictions if the property isn't
> > present, so it's completely backward compatible.
> 
> I got this warnings:
> 
> WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.txt
> 
> I do think it makes sense to split this up into three patches: first
> adding the sdtv-standards.h, then the update to analog-tv-connector.txt
> and finally the videodev.h patch.

I knew this error but I ignored it becuase it mades no sense to me. I
can split it if you want.

Regards,
  Marco

> Regards,
> 
> 	Hans
> 
> > 
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > ---
> > [1] https://patchwork.kernel.org/cover/10794703/
> > 
> > v10:
> > - fix typo within comment s/TV_STD_*/SDTV_STD_*/
> > 
> > v8:
> > Hi Rob,
> > 
> > I dropped your r b tag becuase of the changes I made in this version.
> > Please can you have look on it again? Luckily this would be the last
> > time ;-)
> > 
> > - move definition to include/dt-bindings/display
> > - rename tvnorms.h to sdtv-standards.h
> > - TVORMS_* -> SDTV_STD_*
> > - add sync comments
> > - adapt commit message
> > - fix bindings documentation
> > 
> > v7:
> > I kept Robs r b tag because I only changed the example and extended
> > TVNORM_* macros.
> > 
> > - fix some style issues
> > - add TVNORM_NTSC, TVNORM_525_60 and TVNORM_625_50
> > 
> > v6:
> > - tvnorms.h: use tabs instead of spaces
> > - tvnorms.h: add TVNORM_PAL and TVNORM_SECAM
> > - tvnorms.h: drop rarely used TVNORM_ATSC_* norms
> > 
> > v2-v4:
> > - nothing since the patch was squashed from series [1] into this
> >   series.
> > 
> >  .../display/connector/analog-tv-connector.txt |  6 ++
> >  include/dt-bindings/display/sdtv-standards.h  | 76 +++++++++++++++++++
> >  include/uapi/linux/videodev2.h                |  4 +
> >  3 files changed, 86 insertions(+)
> >  create mode 100644 include/dt-bindings/display/sdtv-standards.h
> > 
> > diff --git a/Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt b/Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt
> > index 0c0970c210ab..883bcb2604c7 100644
> > --- a/Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt
> > +++ b/Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt
> > @@ -6,16 +6,22 @@ Required properties:
> >  
> >  Optional properties:
> >  - label: a symbolic name for the connector
> > +- sdtv-standards: limit the supported TV standards on a connector to the given
> > +                  ones. If not specified all TV standards are allowed.
> > +                  Possible TV standards are defined in
> > +                  include/dt-bindings/display/sdtv-standards.h.
> >  
> >  Required nodes:
> >  - Video port for TV input
> >  
> >  Example
> >  -------
> > +#include <dt-bindings/display/sdtv-standards.h>
> >  
> >  tv: connector {
> >  	compatible = "composite-video-connector";
> >  	label = "tv";
> > +	sdtv-standards = <(SDTV_STD_PAL | SDTV_STD_NTSC)>;
> >  
> >  	port {
> >  		tv_connector_in: endpoint {
> > diff --git a/include/dt-bindings/display/sdtv-standards.h b/include/dt-bindings/display/sdtv-standards.h
> > new file mode 100644
> > index 000000000000..fbc1a3db2ea7
> > --- /dev/null
> > +++ b/include/dt-bindings/display/sdtv-standards.h
> > @@ -0,0 +1,76 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only or X11 */
> > +/*
> > + * Copyright 2019 Pengutronix, Marco Felsch <kernel@pengutronix.de>
> > + */
> > +
> > +#ifndef _DT_BINDINGS_DISPLAY_SDTV_STDS_H
> > +#define _DT_BINDINGS_DISPLAY_SDTV_STDS_H
> > +
> > +/*
> > + * Attention: Keep the SDTV_STD_* bit definitions in sync with
> > + * include/uapi/linux/videodev2.h V4L2_STD_* bit definitions.
> > + */
> > +/* One bit for each standard */
> > +#define SDTV_STD_PAL_B		0x00000001
> > +#define SDTV_STD_PAL_B1		0x00000002
> > +#define SDTV_STD_PAL_G		0x00000004
> > +#define SDTV_STD_PAL_H		0x00000008
> > +#define SDTV_STD_PAL_I		0x00000010
> > +#define SDTV_STD_PAL_D		0x00000020
> > +#define SDTV_STD_PAL_D1		0x00000040
> > +#define SDTV_STD_PAL_K		0x00000080
> > +
> > +#define SDTV_STD_PAL		(SDTV_STD_PAL_B		| \
> > +				 SDTV_STD_PAL_B1	| \
> > +				 SDTV_STD_PAL_G		| \
> > +				 SDTV_STD_PAL_H		| \
> > +				 SDTV_STD_PAL_I		| \
> > +				 SDTV_STD_PAL_D		| \
> > +				 SDTV_STD_PAL_D1	| \
> > +				 SDTV_STD_PAL_K)
> > +
> > +#define SDTV_STD_PAL_M		0x00000100
> > +#define SDTV_STD_PAL_N		0x00000200
> > +#define SDTV_STD_PAL_Nc		0x00000400
> > +#define SDTV_STD_PAL_60		0x00000800
> > +
> > +#define SDTV_STD_NTSC_M		0x00001000	/* BTSC */
> > +#define SDTV_STD_NTSC_M_JP	0x00002000	/* EIA-J */
> > +#define SDTV_STD_NTSC_443	0x00004000
> > +#define SDTV_STD_NTSC_M_KR	0x00008000	/* FM A2 */
> > +
> > +#define SDTV_STD_NTSC		(SDTV_STD_NTSC_M	| \
> > +				 SDTV_STD_NTSC_M_JP	| \
> > +				 SDTV_STD_NTSC_M_KR)
> > +
> > +#define SDTV_STD_SECAM_B	0x00010000
> > +#define SDTV_STD_SECAM_D	0x00020000
> > +#define SDTV_STD_SECAM_G	0x00040000
> > +#define SDTV_STD_SECAM_H	0x00080000
> > +#define SDTV_STD_SECAM_K	0x00100000
> > +#define SDTV_STD_SECAM_K1	0x00200000
> > +#define SDTV_STD_SECAM_L	0x00400000
> > +#define SDTV_STD_SECAM_LC	0x00800000
> > +
> > +#define SDTV_STD_SECAM		(SDTV_STD_SECAM_B	| \
> > +				 SDTV_STD_SECAM_D	| \
> > +				 SDTV_STD_SECAM_G	| \
> > +				 SDTV_STD_SECAM_H	| \
> > +				 SDTV_STD_SECAM_K	| \
> > +				 SDTV_STD_SECAM_K1	| \
> > +				 SDTV_STD_SECAM_L	| \
> > +				 SDTV_STD_SECAM_LC)
> > +
> > +/* Standards for Countries with 60Hz Line frequency */
> > +#define SDTV_STD_525_60		(SDTV_STD_PAL_M		| \
> > +				 SDTV_STD_PAL_60	| \
> > +				 SDTV_STD_NTSC		| \
> > +				 SDTV_STD_NTSC_443)
> > +
> > +/* Standards for Countries with 50Hz Line frequency */
> > +#define SDTV_STD_625_50		(SDTV_STD_PAL		| \
> > +				 SDTV_STD_PAL_N		| \
> > +				 SDTV_STD_PAL_Nc	| \
> > +				 SDTV_STD_SECAM)
> > +
> > +#endif /* _DT_BINDINGS_DISPLAY_SDTV_STDS_H */
> > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> > index 530638dffd93..bc7acade02a0 100644
> > --- a/include/uapi/linux/videodev2.h
> > +++ b/include/uapi/linux/videodev2.h
> > @@ -1208,6 +1208,10 @@ struct v4l2_selection {
> >  
> >  typedef __u64 v4l2_std_id;
> >  
> > +/*
> > + * Attention: Keep the V4L2_STD_* bit definitions in sync with
> > + * include/dt-bindings/display/sdtv-standards.h SDTV_STD_* bit definitions.
> > + */
> >  /* one bit for each */
> >  #define V4L2_STD_PAL_B          ((v4l2_std_id)0x00000001)
> >  #define V4L2_STD_PAL_B1         ((v4l2_std_id)0x00000002)
> > 
> 
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
