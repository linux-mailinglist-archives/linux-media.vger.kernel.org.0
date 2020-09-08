Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57ED326122F
	for <lists+linux-media@lfdr.de>; Tue,  8 Sep 2020 15:53:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729670AbgIHNqM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Sep 2020 09:46:12 -0400
Received: from mga03.intel.com ([134.134.136.65]:49513 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729710AbgIHNmM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 8 Sep 2020 09:42:12 -0400
IronPort-SDR: 0GggaB84zipMNO6NtZKnvuOCJ2BryGGlyXbJ52jZOwWyMh+cdnvvzmIqlJl+O/eQum8SHOdmqx
 SijTU5DXKh/Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9737"; a="158152409"
X-IronPort-AV: E=Sophos;i="5.76,405,1592895600"; 
   d="scan'208";a="158152409"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2020 06:33:15 -0700
IronPort-SDR: c5uq3+eftDe+PxZ83L/kHzJCAvMcsIn/VkdyBIjZ5/3K9oj71lsh/qVQ02EBGapseQp4JzZ289
 X1TO3+j9cenA==
X-IronPort-AV: E=Sophos;i="5.76,405,1592895600"; 
   d="scan'208";a="336416585"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2020 06:33:13 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 81553205C8; Tue,  8 Sep 2020 16:33:11 +0300 (EEST)
Date:   Tue, 8 Sep 2020 16:33:11 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, kieran.bingham@ideasonboard.com,
        niklas.soderlund@ragnatech.se, jacopo@jmondi.org
Subject: Re: [PATCH 3/3] v4l2-fwnode: Document changes usage patterns of
 v4l2_fwnode_endpoint_parse
Message-ID: <20200908133311.GB19532@paasikivi.fi.intel.com>
References: <20200908085121.864-1-sakari.ailus@linux.intel.com>
 <20200908085121.864-4-sakari.ailus@linux.intel.com>
 <20200908125107.GK6047@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200908125107.GK6047@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Tue, Sep 08, 2020 at 03:51:07PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.

Thank you for the review!

> 
> On Tue, Sep 08, 2020 at 11:51:21AM +0300, Sakari Ailus wrote:
> > Document that it is possible to provide defaults for multiple bus types to
> > v4l2_fwnode_endpoint_parse and v4l2_fwnode_endpoint_alloc_parse. Also
> > underline the fact that detecting the bus type without bus-type property
> > is only for the old drivers.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  include/media/v4l2-fwnode.h | 18 ++++++++----------
> >  1 file changed, 8 insertions(+), 10 deletions(-)
> > 
> > diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
> > index d04f39b60096..ccaa5693df14 100644
> > --- a/include/media/v4l2-fwnode.h
> > +++ b/include/media/v4l2-fwnode.h
> > @@ -226,11 +226,10 @@ struct v4l2_fwnode_connector {
> >   * call this function once the correct type is found --- with a default
> >   * configuration valid for that type.
> >   *
> > - * As a compatibility means guessing the bus type is also supported by setting
> > - * @vep.bus_type to V4L2_MBUS_UNKNOWN. The caller may not provide a default
> > - * configuration in this case as the defaults are specific to a given bus type.
> > - * This functionality is deprecated and should not be used in new drivers and it
> > - * is only supported for CSI-2 D-PHY, parallel and Bt.656 buses.
> > + * It is also allowed to set @vep.bus_type to V4L2_MBUS_UNKNOWN. USING THIS
> > + * FEATURE REQUIRES "bus-type" PROPERTY IN DT BINDINGS. For old drivers,
> > + * guessing @vep.bus_type between CSI-2 D-PHY, parallel and Bt.656 busses is
> 
> While at it, s/Bt/BT/.

Yes.

> 
> > + * supported. NEVER RELY ON GUESSING @vep.bus_type IN NEW DRIVERS!
> 
> That's fairly clear :-)
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> I wonder if, as a further improvement, we should turn the enum
> v4l2_mbus_type into a bitfield, to let drivers tell which bus types they
> support. The helpers could then return an error if the bus type reported
> by the firmware doesn't match.

I agree. That'd be less work for the caller. That does require changing a
bunch of drivers though. Unless we add another field for that purpose, just
like the I²C framework did. I guess it's not necessary. Ideally it'd be
done so that trying to use it the old way would generate a compiler
warning.

-- 
Regards,

Sakari Ailus
