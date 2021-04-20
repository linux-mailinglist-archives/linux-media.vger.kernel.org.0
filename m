Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59798365C50
	for <lists+linux-media@lfdr.de>; Tue, 20 Apr 2021 17:38:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232859AbhDTPjD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 11:39:03 -0400
Received: from mga07.intel.com ([134.134.136.100]:61452 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232174AbhDTPjD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 11:39:03 -0400
IronPort-SDR: pCfw96DKKgv9YPTRRaIW8rURPJcgHEokVv71ojWKhmBhtre/6tMPp1hiCBE0lPPuX+A0eF2RrK
 sq3g/ZFDE+wg==
X-IronPort-AV: E=McAfee;i="6200,9189,9960"; a="259484622"
X-IronPort-AV: E=Sophos;i="5.82,237,1613462400"; 
   d="scan'208";a="259484622"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2021 08:38:31 -0700
IronPort-SDR: Cb1A1ZLXNX04Rza/MFS0E7YTOdlWtn5Xdrl7RGeVZFdCUpsyKGWVnnPfTGRiCTPEioQ2TBXAVn
 rBa3xWNe+muQ==
X-IronPort-AV: E=Sophos;i="5.82,237,1613462400"; 
   d="scan'208";a="423071028"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2021 08:38:30 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id EA9242051E;
        Tue, 20 Apr 2021 18:38:27 +0300 (EEST)
Date:   Tue, 20 Apr 2021 18:38:27 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] RFC: media: v4l2-subdev: add subdev-wide config struct
Message-ID: <20210420153827.GS3@paasikivi.fi.intel.com>
References: <20210409133659.389544-1-tomi.valkeinen@ideasonboard.com>
 <20210420153510.GR3@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210420153510.GR3@paasikivi.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A few more more mundane comments...

On Tue, Apr 20, 2021 at 06:35:10PM +0300, Sakari Ailus wrote:

...

> > +int v4l2_subdev_init_config(struct v4l2_subdev *sd, struct v4l2_subdev_config *cfg)
> >  {
> > -	struct v4l2_subdev_pad_config *cfg;
> >  	int ret;
> >  
> > -	if (!sd->entity.num_pads)
> > -		return NULL;
> > -
> > -	cfg = kvmalloc_array(sd->entity.num_pads, sizeof(*cfg),
> > -			     GFP_KERNEL | __GFP_ZERO);
> > -	if (!cfg)
> > -		return NULL;
> > +	if (sd->entity.num_pads) {
> > +		cfg->pad_configs = kvmalloc_array(sd->entity.num_pads, sizeof(*cfg->pad_configs),
> > +				     GFP_KERNEL | __GFP_ZERO);

Please also pay attention to line length and aligning arguments.

...

> > @@ -1093,20 +1097,17 @@ int v4l2_subdev_link_validate_default(struct v4l2_subdev *sd,
> >  int v4l2_subdev_link_validate(struct media_link *link);
> >  
> >  /**
> > - * v4l2_subdev_alloc_pad_config - Allocates memory for pad config
> > + * v4l2_subdev_init_config - initialize v4l2_subdev_config
> >   *
> > - * @sd: pointer to struct v4l2_subdev
> > + * Must call v4l2_subdev_uninit_config() when config is no longer needed.
> >   */
> > -struct
> > -v4l2_subdev_pad_config *v4l2_subdev_alloc_pad_config(struct v4l2_subdev *sd);
> > +int v4l2_subdev_init_config(struct v4l2_subdev *sd, struct v4l2_subdev_config *cfg);

This should be wrapped, too... there are some others as well in this patch
I think.

-- 
Sakari Ailus
