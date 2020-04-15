Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 094D91A8FCD
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 02:45:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407889AbgDOAnp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 20:43:45 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:39210 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407887AbgDOAnm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 20:43:42 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C7781521;
        Wed, 15 Apr 2020 02:43:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586911418;
        bh=a4tMpEbfop26maOFWO9qNYXEanaQDSNa+tMbiX5hcIo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=p8FXfzk+xEvshkoNCJrNe99FMPw5QES2ukJsUHhlDHiexZxEZLaF01BUhX+cIgzbH
         hwdvgZfaI1u9Gp8LVpxYao3tsm5TEIsMbn/1mFcU0WdKpf2T9PwW5XKbelDLSkgH4Z
         NPhBZGSw+GDyYTuMQ1aFC+buaW+TMZNJDTp9fw7I=
Date:   Wed, 15 Apr 2020 03:43:26 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v4 06/17] media: imx: mipi csi-2: Implement
 get_fwnode_pad op
Message-ID: <20200415004326.GX19819@pendragon.ideasonboard.com>
References: <20200303234256.8928-1-slongerbeam@gmail.com>
 <20200303234256.8928-7-slongerbeam@gmail.com>
 <20200414230729.GC27621@pendragon.ideasonboard.com>
 <20200414232036.GB27762@paasikivi.fi.intel.com>
 <6d8b82c4-be84-4722-4f5a-558b5ffe7b80@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6d8b82c4-be84-4722-4f5a-558b5ffe7b80@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Steve,

On Tue, Apr 14, 2020 at 04:50:55PM -0700, Steve Longerbeam wrote:
> On 4/14/20 4:20 PM, Sakari Ailus wrote:
> > On Wed, Apr 15, 2020 at 02:07:29AM +0300, Laurent Pinchart wrote:
> >> On Tue, Mar 03, 2020 at 03:42:45PM -0800, Steve Longerbeam wrote:
> >>> Implement get_fwnode_pad operation. If the endpoint is owned by the MIPI
> >>> CSI-2 receiver, return the endpoint's port number. The MIPI CSI-2 receiver
> >>> maps port numbers and pad indexes 1:1.
> >>>
> >>> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
> >>> ---
> >>>   drivers/staging/media/imx/imx6-mipi-csi2.c | 28 ++++++++++++++++++++++
> >>>   1 file changed, 28 insertions(+)
> >>>
> >>> diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
> >>> index fdd763587e6c..8500207e5ea9 100644
> >>> --- a/drivers/staging/media/imx/imx6-mipi-csi2.c
> >>> +++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
> >>> @@ -507,9 +507,37 @@ static int csi2_registered(struct v4l2_subdev *sd)
> >>>   				      640, 480, 0, V4L2_FIELD_NONE, NULL);
> >>>   }
> >>>   
> >>> +static int csi2_get_fwnode_pad(struct media_entity *entity,
> >>> +			       struct fwnode_endpoint *endpoint)
> >>> +{
> >>> +	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
> >>> +	struct csi2_dev *csi2 = sd_to_dev(sd);
> >>> +	struct fwnode_handle *csi2_ep;
> >>> +
> >>> +	/*
> >>> +	 * If the endpoint is one of ours, return the endpoint's port
> >>> +	 * number. This device maps port numbers and pad indexes 1:1.
> >>> +	 */
> >>> +	fwnode_graph_for_each_endpoint(dev_fwnode(csi2->dev), csi2_ep) {
> >>> +		if (endpoint->local_fwnode == csi2_ep) {
> >>> +			struct fwnode_endpoint fwep;
> >>> +			int ret;
> >>> +
> >>> +			ret = fwnode_graph_parse_endpoint(csi2_ep, &fwep);
> >>> +
> >>> +			fwnode_handle_put(csi2_ep);
> >>> +
> >>> +			return ret ? ret : fwep.port;
> >>> +		}
> >>> +	}
> >>> +
> >>> +	return -ENXIO;
> >>> +}
> >>
> >> As the 1:1 mapping is the common case, would it make sense to modify
> >> media_entity_get_fwnode_pad() accordingly when .get_fwnode_pad is not
> >> set ? The current behaviour is to return the first pad that matches the
> >
> > I also think this would make sense.
> 
> What do you think about https://patchwork.linuxtv.org/patch/60312/ ? I'm 
> planning to resurrect it for v5.

The approach looks good to me.

> >> requested direction, which could be preserved as a second-level fallback
> >> if the 1:1 mapping doesn't give the right direction (but I'm not sure
> >> there's a use case for that, the 1:1 mapping seems to be all we need if
> >> there's no specific .get_fwnode_pad implementation).
> >
> > I believe at least the smiapp driver breaks if you do that, so the current
> > behaviour should be retained (secondary to the 1:1 mapping).

-- 
Regards,

Laurent Pinchart
