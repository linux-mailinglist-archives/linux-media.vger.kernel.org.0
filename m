Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 052A536E9DB
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 13:58:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231490AbhD2L7E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Apr 2021 07:59:04 -0400
Received: from mga07.intel.com ([134.134.136.100]:54493 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230148AbhD2L7D (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Apr 2021 07:59:03 -0400
IronPort-SDR: DXUu8IUTIsyCzFKlZEvVDalojtycIg5hOcIol06K3dfULV9cWElx9OvqdFebPHla5ic1XhuvRH
 +gDe0gJG2NNQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9968"; a="260935610"
X-IronPort-AV: E=Sophos;i="5.82,259,1613462400"; 
   d="scan'208";a="260935610"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2021 04:58:15 -0700
IronPort-SDR: etz1iwJ82fz0hchlQ1kbha6NLqrlwJkS0LD/SB5gg2unCM6qJbttJQU/QjXXROMbmUNW2QWXSm
 3XWRsyt6yRpA==
X-IronPort-AV: E=Sophos;i="5.82,259,1613462400"; 
   d="scan'208";a="404094160"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2021 04:58:13 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 7408C201A6;
        Thu, 29 Apr 2021 14:58:11 +0300 (EEST)
Date:   Thu, 29 Apr 2021 14:58:11 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v5 15/24] v4l: Add bus type to frame descriptors
Message-ID: <20210429115811.GV3@paasikivi.fi.intel.com>
References: <20210415130450.421168-1-tomi.valkeinen@ideasonboard.com>
 <20210415130450.421168-16-tomi.valkeinen@ideasonboard.com>
 <YHyHN2hWN1Hb3Gv1@pendragon.ideasonboard.com>
 <20210420115050.GO3@paasikivi.fi.intel.com>
 <2f39d7b6-ccc4-1afb-d8b2-6e0d44a311b0@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2f39d7b6-ccc4-1afb-d8b2-6e0d44a311b0@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Apr 22, 2021 at 03:30:55PM +0300, Tomi Valkeinen wrote:
> On 20/04/2021 14:50, Sakari Ailus wrote:
> > Hi Laurent,
> > 
> > On Sun, Apr 18, 2021 at 10:23:35PM +0300, Laurent Pinchart wrote:
> > > Hi Tomi and Sakari,
> > > 
> > > Thank you for the patch.
> > > 
> > > On Thu, Apr 15, 2021 at 04:04:41PM +0300, Tomi Valkeinen wrote:
> > > > From: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > 
> > > > Add the media bus type to the frame descriptor. CSI-2 specific
> > > > information will be added in next patch to the frame descriptor.
> > > 
> > > I'd squash the next patch with this one.
> > > 
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > > 
> > > > - Make the bus type a named enum
> > > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > > ---
> > > >   include/media/v4l2-subdev.h | 9 +++++++++
> > > >   1 file changed, 9 insertions(+)
> > > > 
> > > > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > > > index d0e9a5bdb08b..85977abbea46 100644
> > > > --- a/include/media/v4l2-subdev.h
> > > > +++ b/include/media/v4l2-subdev.h
> > > > @@ -340,12 +340,21 @@ struct v4l2_mbus_frame_desc_entry {
> > > >   #define V4L2_FRAME_DESC_ENTRY_MAX	4
> > > > +enum v4l2_mbus_frame_desc_type {
> > > > +	V4L2_MBUS_FRAME_DESC_TYPE_PLATFORM,
> > > > +	V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL,
> > > > +	V4L2_MBUS_FRAME_DESC_TYPE_CCP2,
> > > > +	V4L2_MBUS_FRAME_DESC_TYPE_CSI2,
> > > > +};
> > > 
> > > This should be documented. In particular, I have no idea what
> > > V4L2_MBUS_FRAME_DESC_TYPE_PLATFORM is. I also wonder if we shouldn't
> > > drop CCP2 (at least for now), does anyone use that anymore ?
> > 
> > I guess we don't need one here, not now at least.
> > 
> > I agree on the documentation.
> 
> As it's the first one in the list, I think it really means "undefined", so
> that current users have a value there (I presume they initialize the struct
> to 0). Sakari?

I guess you could drop PLATFORM if there's no need for it now. In practice
PARALLEL is probably a good choice.

-- 
Sakari Ailus
