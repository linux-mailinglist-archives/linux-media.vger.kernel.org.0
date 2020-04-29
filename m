Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 229EB1BE9A9
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2020 23:13:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727027AbgD2VNI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Apr 2020 17:13:08 -0400
Received: from mga18.intel.com ([134.134.136.126]:41185 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726511AbgD2VNG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Apr 2020 17:13:06 -0400
IronPort-SDR: 7Kb6lvfhIJKW4z0130oXTvQ2kb2jA+iX7Ifa2UesLlXQIhaWhitjnIYfE7baP0a/csWwu1GN5K
 ldq6MoS7dNAw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2020 14:13:05 -0700
IronPort-SDR: blU/tQndDCGx0OZl7yAfey3pg6M8n88B+PKkVmaMgsH4bE2VLDguxz909px0SUZg4LKAhg+oli
 ktqsCRd5/jCQ==
X-IronPort-AV: E=Sophos;i="5.73,333,1583222400"; 
   d="scan'208";a="246970004"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2020 14:13:04 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id EB1392084B; Thu, 30 Apr 2020 00:12:31 +0300 (EEST)
Date:   Thu, 30 Apr 2020 00:12:31 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v5 02/23] media: entity: Modify default behavior of
 media_entity_get_fwnode_pad
Message-ID: <20200429211231.GL9190@paasikivi.fi.intel.com>
References: <20200420003930.11463-1-slongerbeam@gmail.com>
 <20200420003930.11463-3-slongerbeam@gmail.com>
 <20200429144203.GJ9190@paasikivi.fi.intel.com>
 <5fe3b06f-ec94-8acf-0741-a29912030447@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5fe3b06f-ec94-8acf-0741-a29912030447@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Steve,

On Wed, Apr 29, 2020 at 01:56:33PM -0700, Steve Longerbeam wrote:
> 
> 
> On 4/29/20 7:42 AM, Sakari Ailus wrote:
> > Hi Steve,
> > 
> > On Sun, Apr 19, 2020 at 05:39:09PM -0700, Steve Longerbeam wrote:
> > > Modify the default behavior of media_entity_get_fwnode_pad() (when the
> > > entity does not provide the get_fwnode_pad op) to first assume the entity
> > > implements a 1:1 mapping between fwnode port number and media pad index.
> > > 
> > > If the 1:1 mapping is not valid, e.g. the port number falls outside the
> > > entity's pad index range, or the pad at that port number doesn't match the
> > > given direction_flags, fall-back to the previous behavior that searches
> > > the entity for the first pad that matches the given direction_flags.
> > > 
> > > The previous default behavior can choose the wrong pad for entities with
> > > multiple sink or source pads. With this change the function will choose
> > > the correct pad index if the entity implements a 1:1 port to pad mapping
> > > at that port.
> > > 
> > > Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
> > > ---
> > >   drivers/media/mc/mc-entity.c | 25 ++++++++++++++++++++-----
> > >   include/media/media-entity.h |  6 ++++--
> > >   2 files changed, 24 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> > > index 12b45e669bcc..b1e0259a58c5 100644
> > > --- a/drivers/media/mc/mc-entity.c
> > > +++ b/drivers/media/mc/mc-entity.c
> > > @@ -370,22 +370,37 @@ int media_entity_get_fwnode_pad(struct media_entity *entity,
> > >   				unsigned long direction_flags)
> > >   {
> > >   	struct fwnode_endpoint endpoint;
> > > -	unsigned int i;
> > >   	int ret;
> > > +	ret = fwnode_graph_parse_endpoint(fwnode, &endpoint);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > >   	if (!entity->ops || !entity->ops->get_fwnode_pad) {
> > > +		unsigned int i;
> > > +
> > > +		/*
> > > +		 * for the default case, first try a 1:1 mapping between
> > > +		 * fwnode port number and pad index.
> > > +		 */
> > > +		ret = endpoint.port;
> > > +		if (ret < entity->num_pads &&
> > > +		    (entity->pads[ret].flags & direction_flags))
> > > +			return ret;
> > Given the 3rd patch, is this one still meant to be here?
> 
> It's true, it's not needed anymore, at least for imx, since all the imx
> devices have implemented get_fwnode_pad. I decided to leave it here anyway,
> since it does make some sense. But I have no problem removing it and
> possibly revisit this later.

Please.

We could remove the other heuristics and move it into drivers (perhaps with
a similar helper), but that's for later.

-- 
Regards,

Sakari Ailus
