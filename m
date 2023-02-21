Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A616469E095
	for <lists+linux-media@lfdr.de>; Tue, 21 Feb 2023 13:42:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234664AbjBUMmj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Feb 2023 07:42:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233901AbjBUMmh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Feb 2023 07:42:37 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AC50166CB;
        Tue, 21 Feb 2023 04:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676983356; x=1708519356;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qdSAFaUWp6AvhtEnnIj1yeelAd4itBgU8TC7d7tUjeI=;
  b=gQ+9VuhWDnTarRLQ76/+M3IZna57jk2dVOgkyEGmnMrBSX83E/b1Ki5y
   2CLqFkKPg4RgTO5/gHepmdDHKXybBFWF2CHUFAVEYZ79MTyLaHrfxRAc0
   RpbF7+sYUYO8bgVC0z0ai1xxFFW8NUFThWjndDXPLr3bZw7Wqv/P8kBVR
   qn02ynHO9zngSzMFe9QE8pvtHwbE48Q9+2D7bTOMI5gn/P08CyYRSpipl
   tDJKwTHC7igLnyRvPhqmpef/OR9S0jTVj2cQebXCuZRMSqumKvGKxfOmS
   wnDi2qFF7gD6LFtF6XkN6+SolmxPWewo0oBZIvd6BMDh5t5QtZP+fHbZA
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="320751456"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="320751456"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 04:42:35 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="649165040"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="649165040"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 04:42:34 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 505861202B1;
        Tue, 21 Feb 2023 14:42:31 +0200 (EET)
Date:   Tue, 21 Feb 2023 14:42:31 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] media: dt-bindings: media: i2c: Add MT9M114
 camera sensor binding
Message-ID: <Y/S8N0c8W/qQtjOj@kekkonen.localdomain>
References: <20220207012055.15158-1-laurent.pinchart@ideasonboard.com>
 <20220207012055.15158-2-laurent.pinchart@ideasonboard.com>
 <YgKfdR72TNavj68v@paasikivi.fi.intel.com>
 <YgK6xAgAVHUSsQND@pendragon.ideasonboard.com>
 <YggZqM81nCJcv4vZ@paasikivi.fi.intel.com>
 <YggwuBlEmjzhxYt1@pendragon.ideasonboard.com>
 <Y/QHzsYzwDG2uclC@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y/QHzsYzwDG2uclC@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Tue, Feb 21, 2023 at 01:52:46AM +0200, Laurent Pinchart wrote:
> > > > > > +        properties:
> > > > > > +          bus-type:
> > > > > > +            enum: [4, 5, 6]
> > > > > 
> > > > > With bus-type 5, shouldn't you have the parallel interface sync signal
> > > > > polarity properties? Possibly also others if the hardware supports them.
> > > > 
> > > > As far as I can tell, the hardware has fixed polarities for all signals.
> > > > Both hsync and vsync (called LINE_VALID and FRAME_VALID here) are active
> > > > high.
> > > 
> > > Right, then you won't need these.
> > > 
> > > What about the link-frequencies property?
> > 
> > That's something I've meant to ask, should the link-frequencies property
> > be specified for parallel buses too, or only CSI-2 ?
> 
> Any feedback on this ?

Yes.

It very likely matters there as well but probably less so than on CSI-2.

link-frequencies isn't specific to CSI-2 either.

> 
> > We also need to document how a DT writer should select the link
> > frequencies. The process is complicated, saying that the property is
> > required without explaining how the values can be computed (EMC
> > constraints aside, just from a functional point of view) isn't nice. If
> > you explain this to me, I can put it in a patch :-)
> 
> Or on this ? :-)

Generally the hardware people will tell you this when it matters. :-) But
on a development board you can probably have anything the hardware
supports.

I guess we could add a few words on this to e.g.
Documentation/driver-api/media/camera-sensor.rst .

Most drivers will support a few frequencies only and sometimes the vendor,
due to someone needing it, provides another configuration with a different
frequency. Many sensors also have datasheets that are precise enough to
calculate this yourself.

-- 
Regards,

Sakari Ailus
