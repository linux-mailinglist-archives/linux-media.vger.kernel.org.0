Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DA77474DC0
	for <lists+linux-media@lfdr.de>; Tue, 14 Dec 2021 23:14:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231964AbhLNWOf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Dec 2021 17:14:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231579AbhLNWOe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Dec 2021 17:14:34 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72DC3C061574
        for <linux-media@vger.kernel.org>; Tue, 14 Dec 2021 14:14:34 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BC9948C4;
        Tue, 14 Dec 2021 23:14:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1639520073;
        bh=vL3to66SXy2hA8z3FUzZARSIe8kt0thdsY0j1jCb6i4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=t5GXKCO9kFvS1JdXCdTsNzoCV6DqFBKrQQ3jhxUntF5ztH7ZFdxdiDwM5NDKvizeB
         oa+b6aQlRwYn+lUfnD8LXIwM3TlHAkeCRcCFrSS21RJNhq074z4yR8SAhwBqtcDSI0
         AnTxINr2DaUl1lq2Kzs3HZCRcPHryoHrJJO+wHy8=
Date:   Wed, 15 Dec 2021 00:14:30 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org,
        hanlinchen@chromium.org, tfiga@chromium.org, hdegoede@redhat.com,
        kieran.bingham@ideasonboard.com, hpa@redhat.com
Subject: Re: [PATCH 4/5] media: entity: Add support for ancillary links
Message-ID: <YbkXRs/RUnc/JmAZ@pendragon.ideasonboard.com>
References: <20211213232849.40071-1-djrscally@gmail.com>
 <20211213232849.40071-5-djrscally@gmail.com>
 <YbkL2V24TFdA5KHx@paasikivi.fi.intel.com>
 <6929c5a8-67dc-77c6-459e-6ce26a08fb73@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6929c5a8-67dc-77c6-459e-6ce26a08fb73@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

Thank you for the patch.

On Tue, Dec 14, 2021 at 09:54:32PM +0000, Daniel Scally wrote:
> On 14/12/2021 21:25, Sakari Ailus wrote:
> > On Mon, Dec 13, 2021 at 11:28:48PM +0000, Daniel Scally wrote:
> >> Add functions to create and destroy ancillary links, so that they
> >> don't need to be manually created by users.
> >>
> >> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> >> ---
> >> Changes since the rfc:
> >>
> >> 	- (Laurent) Set gobj0 and gobj1 directly instead of the other union
> >> 	members
> >> 	- (Laurent) Added MEDIA_LNK_FL_IMMUTABLE to the kerneldoc for the new
> >> 	create function
> >>
> >>  drivers/media/mc/mc-entity.c | 30 ++++++++++++++++++++++++++++++
> >>  include/media/media-entity.h | 29 +++++++++++++++++++++++++++++
> >>  2 files changed, 59 insertions(+)
> >>
> >> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> >> index aeddc3f6310e..4e39e100ea03 100644
> >> --- a/drivers/media/mc/mc-entity.c
> >> +++ b/drivers/media/mc/mc-entity.c
> >> @@ -1052,3 +1052,33 @@ void media_remove_intf_links(struct media_interface *intf)
> >>  	mutex_unlock(&mdev->graph_mutex);
> >>  }
> >>  EXPORT_SYMBOL_GPL(media_remove_intf_links);
> >> +
> >> +struct media_link *media_create_ancillary_link(struct media_entity *primary,
> >> +					       struct media_entity *ancillary,
> >> +					       u32 flags)
> >> +{
> >> +	struct media_link *link;
> >> +
> >> +	link = media_add_link(&primary->links);

Not a candidate for this series, but returning an error pointer from
media_add_link() could be nice.

> >> +	if (!link)
> >> +		return ERR_PTR(-ENOMEM);
> >> +
> >> +	link->gobj0 = &primary->graph_obj;
> >> +	link->gobj1 = &ancillary->graph_obj;
> >> +	link->flags = flags | MEDIA_LNK_FL_ANCILLARY_LINK;
> >> +
> >> +	/* Initialize graph object embedded at the new link */

s/embedded at/embedded in/ ?

> >> +	media_gobj_create(primary->graph_obj.mdev, MEDIA_GRAPH_LINK,
> >> +			  &link->graph_obj);
> >> +
> >> +	return link;
> >> +}
> >> +EXPORT_SYMBOL_GPL(media_create_ancillary_link);
> >> +
> >> +void media_remove_ancillary_link(struct media_link *link)
> >> +{
> >> +	list_del(&link->list);
> >> +	media_gobj_destroy(&link->graph_obj);
> >> +	kfree(link);
> >> +}
> >> +EXPORT_SYMBOL_GPL(media_remove_ancillary_link);

Non-static (and especially exported) functions must be declared in a
header file. You don't seem to use this function anywhere in this series
though, is it a leftover ?

> >> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> >> index fea489f03d57..f7b1738cef88 100644
> >> --- a/include/media/media-entity.h
> >> +++ b/include/media/media-entity.h
> >> @@ -1104,6 +1104,35 @@ void media_remove_intf_links(struct media_interface *intf);
> >>   * it will issue a call to @operation\(@entity, @args\).
> >>   */
> >>  
> >> +/**
> >> + * media_create_ancillary_link() - creates a link between two entities

s/link/ancillary link/

> >> + *
> >> + * @primary:	pointer to the primary &media_entity
> >> + * @ancillary:	pointer to the ancillary &media_entity
> >> + * @flags:	Link flags, as defined in
> >> + *		:ref:`include/uapi/linux/media.h <media_header>`
> >> + *		( seek for ``MEDIA_LNK_FL_*``)
> >> + *
> >> + *
> >> + * Valid values for flags:
> >> + *
> >> + * %MEDIA_LNK_FL_ENABLED
> >> + *   Indicates that the two entities are connected pieces of hardware that form
> >> + *   a single logical unit.
> >> + *
> >> + *   A typical example is a camera lens being linked to the sensor that it is
> >> + *   supporting.
> >> + *
> >> + * %MEDIA_LNK_FL_IMMUTABLE
> >> + *   Indicates that the link enabled state can't be modified at runtime. If
> >> + *   %MEDIA_LNK_FL_IMMUTABLE is set, then %MEDIA_LNK_FL_ENABLED must also be
> >> + *   set, since an immutable link is always enabled.
> >
> > What's the use case for both of the flags?
> >
> > I know the flags are there but what will they mean in practice for
> > ancillary links?
> 
> Within the kernel, I don't think they have any effect now (without patch
> #3 of this series the graph iteration would have tried to walk them). I
> mostly intended that they would be set so that future userspace users
> wouldn't be able to flag them as disabled.

How about removing the flags parameter, hardcoding both
MEDIA_LNK_FL_ENABLED and MEDIA_LNK_FL_IMMUTABLE inside the function, and
specifying in the userspace API documentation that both flags are always
set of ancillary links ?

Thinking a bit further, what would be the implications of changing this
rule in the future ? I don't know what use cases may require that, but
let's assume we start exposing mutable ancillary links, or mutable and
disabled ancillary links. How will existing userspace react to that, do
we need to specify rules in the uAPI documentation to tell userspace how
to prepare for the future ?

> >> + */
> >> +struct media_link *
> >> +media_create_ancillary_link(struct media_entity *primary,
> >> +			    struct media_entity *ancillary,
> >> +			    u32 flags);
> >> +
> >>  #define media_entity_call(entity, operation, args...)			\
> >>  	(((entity)->ops && (entity)->ops->operation) ?			\
> >>  	 (entity)->ops->operation((entity) , ##args) : -ENOIOCTLCMD)

-- 
Regards,

Laurent Pinchart
