Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09FB91BE9AD
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2020 23:14:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726889AbgD2VOI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Apr 2020 17:14:08 -0400
Received: from mga03.intel.com ([134.134.136.65]:8384 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726511AbgD2VOI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Apr 2020 17:14:08 -0400
IronPort-SDR: QCP7qbW/ICsbnz+kKgtnuqyu6VocGh+/l1SJPi4xMJNnYlmpeL1rPo1bsnvmyeF4kGOiJloKFY
 dyEJ8ENVbkWQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2020 14:14:08 -0700
IronPort-SDR: /voPTyypNRjcr4YFqlz+Xfp9dFmdQmyDArVz8Zv595ery1S9IX7yTSaQdh8bvSMpVXi9QhvPHi
 53PYg6jdh2zw==
X-IronPort-AV: E=Sophos;i="5.73,333,1583222400"; 
   d="scan'208";a="293334001"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2020 14:14:06 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 505812084B; Thu, 30 Apr 2020 00:14:04 +0300 (EEST)
Date:   Thu, 30 Apr 2020 00:14:04 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v5 03/23] media: v4l2-subdev: add
 v4l2_subdev_get_fwnode_pad_default
Message-ID: <20200429211404.GM9190@paasikivi.fi.intel.com>
References: <20200420003930.11463-1-slongerbeam@gmail.com>
 <20200420003930.11463-4-slongerbeam@gmail.com>
 <20200429143946.GI9190@paasikivi.fi.intel.com>
 <62e91ae8-7099-6f1d-9c8a-9255d90c3db9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62e91ae8-7099-6f1d-9c8a-9255d90c3db9@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Steve,

On Wed, Apr 29, 2020 at 01:49:35PM -0700, Steve Longerbeam wrote:
> Hi Sakari,
> 
> On 4/29/20 7:39 AM, Sakari Ailus wrote:
> > Hi Steve,
> > 
> > On Sun, Apr 19, 2020 at 05:39:10PM -0700, Steve Longerbeam wrote:
> > > Add a convenience function that can be used as the .get_fwnode_pad
> > > operation for subdevices that map port numbers and pad indexes 1:1.
> > > The function verifies the endpoint is owned by the subdevice, and if
> > > so returns the endpoint port number.
> > > 
> > > Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
> > > ---
> > >   drivers/media/v4l2-core/v4l2-subdev.c | 25 +++++++++++++++++++++++++
> > >   include/media/v4l2-subdev.h           | 17 +++++++++++++++++
> > >   2 files changed, 42 insertions(+)
> > > 
> > > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > > index a376b351135f..d5b5cd7a6049 100644
> > > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > > @@ -696,6 +696,31 @@ const struct v4l2_file_operations v4l2_subdev_fops = {
> > >   };
> > >   #ifdef CONFIG_MEDIA_CONTROLLER
> > > +
> > > +int v4l2_subdev_get_fwnode_pad_default(struct media_entity *entity,
> > > +				       struct fwnode_endpoint *endpoint)
> > > +{
> > > +	struct fwnode_handle *ep;
> > > +	struct v4l2_subdev *sd;
> > > +
> > > +	if (!is_media_entity_v4l2_subdev(entity))
> > > +		return -EINVAL;
> > > +
> > > +	sd = media_entity_to_v4l2_subdev(entity);
> > > +
> > > +	fwnode_graph_for_each_endpoint(dev_fwnode(sd->dev), ep) {
> > > +		if (ep != endpoint->local_fwnode)
> > > +			continue;
> > If the purpose is just to check a given endpoint belongs to a device, could
> > it be done in a more simple way? E.g.:
> > 
> > 	fwnode = fwnode_graph_get_port_parent(endpoint->local_fwnode);
> > 	fwnode_handle_put(fwnode);
> > 
> > 	if (dev_fwnode(sd->dev) == fwnode)
> > 		return endpoint->port;
> > 
> > 	return -ENXIO;
> 
> Sorry you are right, I was stuck on confirming the endpoint itself is one of
> the devices endpoints, but yes, above is all that is needed to confirm the
> endpoint is owned by the device, I'll make that change.

Thanks.

Could you calso call the function e.g. v4l2_subdev_get_fwnode_pad_1_to_1 or
such? I presume there will be a few of these, and it depends on the device
what suits it.

-- 
Regards,

Sakari Ailus
