Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A697E3C3DB7
	for <lists+linux-media@lfdr.de>; Sun, 11 Jul 2021 17:49:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236218AbhGKPvq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 11 Jul 2021 11:51:46 -0400
Received: from mga04.intel.com ([192.55.52.120]:37626 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234738AbhGKPvq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 11 Jul 2021 11:51:46 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10042"; a="208061824"
X-IronPort-AV: E=Sophos;i="5.84,231,1620716400"; 
   d="scan'208";a="208061824"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2021 08:48:59 -0700
X-IronPort-AV: E=Sophos;i="5.84,231,1620716400"; 
   d="scan'208";a="568285144"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2021 08:48:56 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id DAB34203A8;
        Sun, 11 Jul 2021 18:48:53 +0300 (EEST)
Date:   Sun, 11 Jul 2021 18:48:53 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: Re: [PATCH v7 21/27] v4l: subdev: routing kernel helper functions
Message-ID: <20210711154853.GD3@paasikivi.fi.intel.com>
References: <20210524104408.599645-1-tomi.valkeinen@ideasonboard.com>
 <20210524104408.599645-22-tomi.valkeinen@ideasonboard.com>
 <YLwI5shcJwdd7uTz@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YLwI5shcJwdd7uTz@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Sun, Jun 06, 2021 at 02:29:42AM +0300, Laurent Pinchart wrote:
> > +{
> > +	int ret;
> > +
> > +	routing->which = state ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
> 
> I think we could simplify this if we mandate subdev drivers to embed an
> instance of v4l2_subdev_state for the active state. We could then drop
> the .get_routing() operation. We could actually drop the .get_fmt()
> operation too, but that would be a long term goal. As .get_routing() is
> new, I'd rather not introduce it, and push drivers that need routing
> support to use v4l2_subdev_state.

Sounds good to me.

-- 
Sakari Ailus
