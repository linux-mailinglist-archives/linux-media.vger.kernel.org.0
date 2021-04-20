Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 440BB365816
	for <lists+linux-media@lfdr.de>; Tue, 20 Apr 2021 13:50:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231251AbhDTLv0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 07:51:26 -0400
Received: from mga09.intel.com ([134.134.136.24]:34646 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231196AbhDTLvZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 07:51:25 -0400
IronPort-SDR: bs79ORzNY2lEEAwzx9VgRe0rBvOkBE/OO4vz1v4dei0PAFyiTcKfYLJGS7hLy7Un10MOHbQa4k
 ikuz9t9tcSlA==
X-IronPort-AV: E=McAfee;i="6200,9189,9959"; a="195605511"
X-IronPort-AV: E=Sophos;i="5.82,236,1613462400"; 
   d="scan'208";a="195605511"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2021 04:50:54 -0700
IronPort-SDR: Pep0+dShCH+KSHThVOCgCjaKhpDM4OI23u10wS9c+2V8Ct7v+VkMNDHRnNjijlfMSsMy1+FlMB
 w/LGwu+5JL+A==
X-IronPort-AV: E=Sophos;i="5.82,236,1613462400"; 
   d="scan'208";a="384045125"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2021 04:50:52 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 71134202EC;
        Tue, 20 Apr 2021 14:50:50 +0300 (EEST)
Date:   Tue, 20 Apr 2021 14:50:50 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v5 15/24] v4l: Add bus type to frame descriptors
Message-ID: <20210420115050.GO3@paasikivi.fi.intel.com>
References: <20210415130450.421168-1-tomi.valkeinen@ideasonboard.com>
 <20210415130450.421168-16-tomi.valkeinen@ideasonboard.com>
 <YHyHN2hWN1Hb3Gv1@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YHyHN2hWN1Hb3Gv1@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Sun, Apr 18, 2021 at 10:23:35PM +0300, Laurent Pinchart wrote:
> Hi Tomi and Sakari,
> 
> Thank you for the patch.
> 
> On Thu, Apr 15, 2021 at 04:04:41PM +0300, Tomi Valkeinen wrote:
> > From: Sakari Ailus <sakari.ailus@linux.intel.com>
> > 
> > Add the media bus type to the frame descriptor. CSI-2 specific
> > information will be added in next patch to the frame descriptor.
> 
> I'd squash the next patch with this one.
> 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > 
> > - Make the bus type a named enum
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  include/media/v4l2-subdev.h | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > index d0e9a5bdb08b..85977abbea46 100644
> > --- a/include/media/v4l2-subdev.h
> > +++ b/include/media/v4l2-subdev.h
> > @@ -340,12 +340,21 @@ struct v4l2_mbus_frame_desc_entry {
> >  
> >  #define V4L2_FRAME_DESC_ENTRY_MAX	4
> >  
> > +enum v4l2_mbus_frame_desc_type {
> > +	V4L2_MBUS_FRAME_DESC_TYPE_PLATFORM,
> > +	V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL,
> > +	V4L2_MBUS_FRAME_DESC_TYPE_CCP2,
> > +	V4L2_MBUS_FRAME_DESC_TYPE_CSI2,
> > +};
> 
> This should be documented. In particular, I have no idea what
> V4L2_MBUS_FRAME_DESC_TYPE_PLATFORM is. I also wonder if we shouldn't
> drop CCP2 (at least for now), does anyone use that anymore ?

I guess we don't need one here, not now at least.

I agree on the documentation.

> 
> > +
> >  /**
> >   * struct v4l2_mbus_frame_desc - media bus data frame description
> > + * @type: type of the bus (enum v4l2_mbus_frame_desc_type)
> >   * @entry: frame descriptors array
> >   * @num_entries: number of entries in @entry array
> >   */
> >  struct v4l2_mbus_frame_desc {
> > +	enum v4l2_mbus_frame_desc_type type;
> >  	struct v4l2_mbus_frame_desc_entry entry[V4L2_FRAME_DESC_ENTRY_MAX];
> >  	unsigned short num_entries;
> >  };
> 

-- 
Sakari Ailus
