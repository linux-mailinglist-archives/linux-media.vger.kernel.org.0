Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6061F2D335D
	for <lists+linux-media@lfdr.de>; Tue,  8 Dec 2020 21:27:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731385AbgLHUQN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Dec 2020 15:16:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731138AbgLHUPD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Dec 2020 15:15:03 -0500
Received: from hillosipuli.retiisi.eu (unknown [IPv6:2a01:4f9:c010:4572::e8:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9777CC0613CF;
        Tue,  8 Dec 2020 12:13:28 -0800 (PST)
Received: from valkosipuli.localdomain (unknown [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 1B531634C87;
        Tue,  8 Dec 2020 21:59:49 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1kmj9J-0000XJ-8G; Tue, 08 Dec 2020 21:59:49 +0200
Date:   Tue, 8 Dec 2020 21:59:49 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, robh+dt@kernel.org,
        bparrot@ti.com, mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 10/13] media: v4l2-fwnode: Update
 V4L2_FWNODE_CSI2_MAX_DATA_LANES to 8
Message-ID: <20201208195949.GB1167@valkosipuli.retiisi.org.uk>
References: <1607022002-26575-1-git-send-email-skomatineni@nvidia.com>
 <1607022002-26575-11-git-send-email-skomatineni@nvidia.com>
 <845dfd4a-fa11-625c-78a3-cc8adc68bfc7@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <845dfd4a-fa11-625c-78a3-cc8adc68bfc7@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Mon, Dec 07, 2020 at 11:47:38AM +0100, Hans Verkuil wrote:
> On 03/12/2020 19:59, Sowjanya Komatineni wrote:
> > Some CSI2 receivers support 8 data lanes.
> > 
> > So, this patch updates CSI2 maximum data lanes to be 8.
> > 
> > Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> > ---
> >  drivers/media/platform/ti-vpe/cal-camerarx.c | 2 +-
> >  include/media/v4l2-fwnode.h                  | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
> > index 806cbf1..47e2143 100644
> > --- a/drivers/media/platform/ti-vpe/cal-camerarx.c
> > +++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
> > @@ -534,7 +534,7 @@ static int cal_camerarx_parse_dt(struct cal_camerarx *phy)
> >  {
> >  	struct v4l2_fwnode_endpoint *endpoint = &phy->endpoint;
> >  	struct device_node *ep_node;
> > -	char data_lanes[V4L2_FWNODE_CSI2_MAX_DATA_LANES * 2];
> > +	char data_lanes[V4L2_FWNODE_CSI2_MAX_DATA_LANES];
> >  	unsigned int i;
> >  	int ret;
> >  
> 
> I'm not so sure about this change: it relies on the implicit knowledge that
> this cal driver can handle only 4 lanes max, so that doubling
> V4L2_FWNODE_CSI2_MAX_DATA_LANES is the same as the old 'V4L2_FWNODE_CSI2_MAX_DATA_LANES * 2'.
> 
> I think we should either keep the existing code (which means data_lanes
> is now larger than needed, so stack usage increases by 8 bytes), or perhaps
> create a new define for this driver like CAL_MAX_DATA_LANES and use that.
> 
> In my opinion the original code should just be kept, but I've CC-ed Laurent
> on this to hear what he thinks.

I further looked at the code there and it does *depend* on a particular
value of V4L2_FWNODE_CSI2_MAX_DATA_LANES. That needs to be fixed. This part
can (or should) be dropped from the patch though.

-- 
Regards,

Sakari Ailus
