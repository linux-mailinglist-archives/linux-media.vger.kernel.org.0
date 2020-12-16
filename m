Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 872E92DC2B3
	for <lists+linux-media@lfdr.de>; Wed, 16 Dec 2020 16:05:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726216AbgLPPFH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Dec 2020 10:05:07 -0500
Received: from mga12.intel.com ([192.55.52.136]:31627 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726073AbgLPPFH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Dec 2020 10:05:07 -0500
IronPort-SDR: Qeshe+Fw/hno/jPWPBgMSRDWz64lUetrovBvhpfyrACjRqwV9NcYNqX+e/xaKfw1uL0E+oKZsx
 iVGjSpWquMUA==
X-IronPort-AV: E=McAfee;i="6000,8403,9836"; a="154307638"
X-IronPort-AV: E=Sophos;i="5.78,424,1599548400"; 
   d="scan'208";a="154307638"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2020 07:03:20 -0800
IronPort-SDR: NPbfqqy1nk5QuQ/LyglqwVb1BVA5suFYSkwrsoPbLzKkoT82dcvFzQgvNkC9rMnBIBaxs36yBD
 8LaqNqcXOJaQ==
X-IronPort-AV: E=Sophos;i="5.78,424,1599548400"; 
   d="scan'208";a="342094155"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2020 07:03:17 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id AAA3320726; Wed, 16 Dec 2020 17:03:15 +0200 (EET)
Date:   Wed, 16 Dec 2020 17:03:15 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Rob Herring <robh@kernel.org>,
        Guennadi Liakhovetski <g.liakhovetski@gmx.de>,
        Maxime Ripard <mripard@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2 1/2] media: dt-bindings: Convert video-interfaces.txt
 properties to schemas
Message-ID: <20201216150315.GL26370@paasikivi.fi.intel.com>
References: <20201210211625.3070388-1-robh@kernel.org>
 <20201210211625.3070388-2-robh@kernel.org>
 <alpine.DEB.2.20.2012161113060.15676@axis700.grange>
 <20201216141210.GB651087@robh.at.kernel.org>
 <X9oYs43PzXbIXXs8@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X9oYs43PzXbIXXs8@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rob and Laurent,

On Wed, Dec 16, 2020 at 04:24:51PM +0200, Laurent Pinchart wrote:
> Hi Rob,
> 
> On Wed, Dec 16, 2020 at 08:12:10AM -0600, Rob Herring wrote:
> > On Wed, Dec 16, 2020 at 11:18:03AM +0100, Guennadi Liakhovetski wrote:
> > > Hi Rob,
> > > 
> > > Sorry for the delay! I didn't realise my ack was required for this patch.
> > > I won't object against the licence change, but please don't add me as a
> > > maintainer of
> > 
> > Okay, so that's an Ack?
> > 
> > > 
> > > On Thu, 10 Dec 2020, Rob Herring wrote:
> > > 
> > > [snip]
> > > 
> > > > diff --git a/Documentation/devicetree/bindings/media/video-interfaces.yaml b/Documentation/devicetree/bindings/media/video-interfaces.yaml
> > > > new file mode 100644
> > > > index 000000000000..7415a4df1576
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/media/video-interfaces.yaml
> > > > @@ -0,0 +1,344 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/media/video-interfaces.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Common bindings for video receiver and transmitter interface endpoints
> > > > +
> > > > +maintainers:
> > > > +  - Guennadi Liakhovetski <g.liakhovetski@gmx.de>
> > > 
> > > I did commit the original version of
> > > Documentation/devicetree/bindings/media/video-interfaces.txt but that was
> > > more than 8 years ago, I haven't worked in media / V4L for several years
> > > now, so, I don't think I can meaningfully maintain that file now.
> > 
> > Okay, I'll drop you.
> > 
> > Anyone else want to sign up? Laurent?
> 
> I'll likely regret this, but yes, you can sign me up :-)

Please add me, too.

-- 
Regards,

Sakari Ailus
