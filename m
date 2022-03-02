Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5CC54CA1EF
	for <lists+linux-media@lfdr.de>; Wed,  2 Mar 2022 11:13:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240929AbiCBKOi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Mar 2022 05:14:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239532AbiCBKOh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Mar 2022 05:14:37 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65DC53980A
        for <linux-media@vger.kernel.org>; Wed,  2 Mar 2022 02:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646216034; x=1677752034;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WnsP/MrDKhVqlVsFknsUpC++Q7+U0awSUpl1RRWCBzs=;
  b=UwIcXpnQeMtwm4sTgSqw6FpGxVIT8pGWgq+SSr1SOK5jPUBWKpDjwZ4A
   cPNatIeG/9INnFjlakU1Re/Yclsvco9fhsqlD6UL6GuufxJOAl9tWgBkU
   DP7m9HDWC0cKnUI9qN5BhlopTESMmczN3cyfbVGDwp3Zvs1PnlRj4WNQT
   zM2qI1psaq/DDtxeizZoxLsnpOdeGSIFNyvUpIosYGwBWV0QVBJp4aUKv
   w+jIJEkDDBRPvQL7IhlfGAjJes8u63yA8oxNm+HB0A9Bh3pf3VtsKe3Rb
   fsTydlYIpLGGU7oUXK6FUniH22ytUOqnIcRc6fK2X9bmva58askK6rIcm
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="316581490"
X-IronPort-AV: E=Sophos;i="5.90,148,1643702400"; 
   d="scan'208";a="316581490"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2022 02:13:54 -0800
X-IronPort-AV: E=Sophos;i="5.90,148,1643702400"; 
   d="scan'208";a="551188108"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2022 02:13:51 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 747662057F;
        Wed,  2 Mar 2022 12:13:49 +0200 (EET)
Date:   Wed, 2 Mar 2022 12:13:49 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH v5 5/6] media: subdev: add v4l2_subdev_call_state_active()
Message-ID: <Yh9DXR3uY1xzEBAq@paasikivi.fi.intel.com>
References: <20220301105548.305191-1-tomi.valkeinen@ideasonboard.com>
 <20220301105548.305191-6-tomi.valkeinen@ideasonboard.com>
 <Yh86mXXTqumlzlS6@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yh86mXXTqumlzlS6@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Moi,

On Wed, Mar 02, 2022 at 11:36:25AM +0200, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Tue, Mar 01, 2022 at 12:55:47PM +0200, Tomi Valkeinen wrote:
> > Add v4l2_subdev_call_state_active() macro to help calling subdev ops
> > that take a subdev state as a parameter. Normally the v4l2 framework
> > will lock and pass the correct subdev state to the subdev ops, but there
> > are legacy situations where this is not the case (e.g. non-MC video
> > device driver calling set_fmt in a source subdev).
> > 
> > As this macro is only needed for legacy use cases, the macro is added in
> > a new header file, v4l2-subdev-legacy.h.
> > 
> > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > ---
> >  include/media/v4l2-subdev-legacy.h | 42 ++++++++++++++++++++++++++++++
> >  1 file changed, 42 insertions(+)
> >  create mode 100644 include/media/v4l2-subdev-legacy.h
> > 
> > diff --git a/include/media/v4l2-subdev-legacy.h b/include/media/v4l2-subdev-legacy.h
> > new file mode 100644
> > index 000000000000..6a61e579b629
> > --- /dev/null
> > +++ b/include/media/v4l2-subdev-legacy.h
> > @@ -0,0 +1,42 @@
> > +/* SPDX-License-Identifier: GPL-2.0-or-later */
> > +/*
> > + *  V4L2 sub-device legacy support header.
> > + *
> > + *  Copyright (C) 2022  Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > + */
> > +
> > +#ifndef _V4L2_SUBDEV_LEGACY_H
> > +#define _V4L2_SUBDEV_LEGACY_H
> > +
> > +/**
> > + * v4l2_subdev_call_state_active - call an operation of a v4l2_subdev which
> > + *				   takes state as a parameter, passing the
> > + *				   subdev its active state.
> > + *
> > + * @sd: pointer to the &struct v4l2_subdev
> > + * @o: name of the element at &struct v4l2_subdev_ops that contains @f.
> > + *     Each element there groups a set of callbacks functions.
> > + * @f: callback function to be called.
> > + *     The callback functions are defined in groups, according to
> > + *     each element at &struct v4l2_subdev_ops.
> > + * @args: arguments for @f.
> > + *
> > + * This is similar to v4l2_subdev_call(), except that this version can only be
> > + * used for ops that take a subdev state as a parameter. The macro will get the
> > + * active state and lock it before calling the op, and unlock it after the
> 
> s/active state and/active state,/
> 
> > + * call.
> > + */
> > +#define v4l2_subdev_call_state_active(sd, o, f, args...)		\
> > +	({								\
> > +		int __result;						\
> > +		struct v4l2_subdev_state *state;			\
> > +		state = v4l2_subdev_get_active_state(sd);		\
> > +		if (state)						\
> > +			v4l2_subdev_lock_state(state);			\
> > +		__result = v4l2_subdev_call(sd, o, f, state, ##args);	\
> > +		if (state)						\
> > +			v4l2_subdev_unlock_state(state);		\
> > +		__result;						\
> > +	})
> > +
> > +#endif
> 
> I think
> 
> #endif /* _V4L2_SUBDEV_LEGACY_H */

I'll do these (plus the code block type change) when applying the patches
if there are no other comments to the series.

> 
> is the usual pattern. Apart from that,
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks!

-- 
Terveisin,

Sakari Ailus
