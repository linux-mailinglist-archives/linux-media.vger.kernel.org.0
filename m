Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90A1155ABC1
	for <lists+linux-media@lfdr.de>; Sat, 25 Jun 2022 19:34:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233056AbiFYRen (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Jun 2022 13:34:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231904AbiFYRem (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Jun 2022 13:34:42 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A034C13E82
        for <linux-media@vger.kernel.org>; Sat, 25 Jun 2022 10:34:40 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id ABA4731A;
        Sat, 25 Jun 2022 19:34:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656178477;
        bh=AxlcDAe2aaoGeQStKMnjGmN2Ky5OxO2XqqfaEsiv9dg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Y/WxETVdzSQPb2MOUc9OI8krW5R0AnL3/fd5ZN6tX1OxEHhElI5cYbiuQDRXxgTdA
         D3AClHWBT5Lnqc4I/WjFSddV7oRB8mEFjXZy3PG7gPI+L9jld8REur51hmal/F2Um9
         SEE55NbGopudKmt25m6cpB4OLtc10yXw1HC4uq/Q=
Date:   Sat, 25 Jun 2022 20:34:20 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     Paul Elder <paul.elder@ideasonboard.com>,
        linux-media@vger.kernel.org, dafna@fastmail.com, heiko@sntech.de,
        jeanmichel.hautbois@ideasonboard.com, jacopo@jmondi.org,
        helen.koike@collabora.com, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 37/55] media: mc-entity: Add a new helper function to get
 a remote pad
Message-ID: <YrdHHA9QBGncWd54@pendragon.ideasonboard.com>
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
 <20220614191127.3420492-38-paul.elder@ideasonboard.com>
 <e9b1b46f-e8a5-4481-e70f-d7355b828808@gmail.com>
 <69142509-842a-81e5-2bce-69e2dbb9e4d2@gmail.com>
 <Yq0C6an46kNX1RME@pendragon.ideasonboard.com>
 <936ea3d3-530e-1b7b-f96c-1407d3f24abd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <936ea3d3-530e-1b7b-f96c-1407d3f24abd@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan,

On Sat, Jun 18, 2022 at 10:35:12AM +0100, Daniel Scally wrote:
> On 17/06/2022 23:40, Laurent Pinchart wrote:
> > On Fri, Jun 17, 2022 at 11:33:03PM +0100, Daniel Scally wrote:
> >> On 17/06/2022 22:34, Daniel Scally wrote:
> >>> On 14/06/2022 20:11, Paul Elder wrote:
> >>>> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>>>
> >>>> The media_entity_remote_pad() helper function returns the first remote
> >>>> pad it find connected to a given pad. Beside being possibly ill-named
> >>>> (as it operates on a pad, not an entity) and non-deterministic (as it
> >>>> stops at the first enabled link), the fact that it returns the first
> >>>> match makes it unsuitable for drivers that need to guarantee that a
> >>>> single link is enabled, for instance when an entity can process data
> >>>> from one of multiple sources at a time.
> >>>>
> >>>> For those use cases, add a new helper function,
> >>>> media_entity_remote_pad_unique(), that operates on an entity and returns
> >>>> a remote pad, with a guarantee that only one link is enabled. To ease
> >>>> its use in drivers, also add an inline wrapper that locates source pads
> >>>> specifically. A wrapper that locates sink pads can easily be added when
> >>>> needed.
> >>>>
> >>>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>>> ---
> >>>>  Documentation/driver-api/media/mc-core.rst |  4 +-
> >>>>  drivers/media/mc/mc-entity.c               | 38 ++++++++++++++++++
> >>>>  include/media/media-entity.h               | 45 ++++++++++++++++++++++
> >>>>  3 files changed, 85 insertions(+), 2 deletions(-)
> >>>>
> >>>> diff --git a/Documentation/driver-api/media/mc-core.rst b/Documentation/driver-api/media/mc-core.rst
> >>>> index 02481a2513b9..a2d1e32e3abb 100644
> >>>> --- a/Documentation/driver-api/media/mc-core.rst
> >>>> +++ b/Documentation/driver-api/media/mc-core.rst
> >>>> @@ -186,8 +186,8 @@ is required and the graph structure can be freed normally.
> >>>>  
> >>>>  Helper functions can be used to find a link between two given pads, or a pad
> >>>>  connected to another pad through an enabled link
> >>>> -:c:func:`media_entity_find_link()` and
> >>>> -:c:func:`media_entity_remote_pad()`.
> >>>> +(:c:func:`media_entity_find_link()`, :c:func:`media_entity_remote_pad()` and
> >>>> +:c:func:`media_entity_remote_source_pad()`).
> >>>>  
> >>>>  Use count and power handling
> >>>>  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >>>> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> >>>> index 11f5207f73aa..1febf5a86be6 100644
> >>>> --- a/drivers/media/mc/mc-entity.c
> >>>> +++ b/drivers/media/mc/mc-entity.c
> >>>> @@ -9,6 +9,7 @@
> >>>>   */
> >>>>  
> >>>>  #include <linux/bitmap.h>
> >>>> +#include <linux/list.h>
> >>>>  #include <linux/property.h>
> >>>>  #include <linux/slab.h>
> >>>>  #include <media/media-entity.h>
> >>>> @@ -920,6 +921,43 @@ struct media_pad *media_entity_remote_pad(const struct media_pad *pad)
> >>>>  }
> >>>>  EXPORT_SYMBOL_GPL(media_entity_remote_pad);
> >>>>  
> >>>> +struct media_pad *
> >>>> +media_entity_remote_pad_unique(const struct media_entity *entity,
> >>>> +			       unsigned int type)
> >>>> +{
> >>>> +	struct media_pad *pad = NULL;
> >>>> +	struct media_link *link;
> >>>> +
> >>>> +	list_for_each_entry(link, &entity->links, list) {
> >>>> +		struct media_pad *local_pad;
> >>>> +		struct media_pad *remote_pad;
> >>>> +
> >>>> +		if (!(link->flags & MEDIA_LNK_FL_ENABLED))
> >>>> +			continue;
> >>> 
> >>> Does this need another guard here to make sure the link isn't an
> >>> ancillary link? Only likely to happen at least in the immediate future
> >>> where the entity represents a camera sensor, so possibly not applicable
> >>> here - I couldn't find where the new function is used in the series to
> >>> check. I _think_ it would actually work ok regardless...media_gobj
> >>> type-punning makes my brain ache, but I think the local_pad->entity ==
> >>> entity comparison would actually compare the entity->name member of the
> >>> entity at the end of an ancillary link to the entity parameter, not find
> >>> a match and so continue the loop without failing, but that feels a bit
> >>> sub-optimal.
> >> 
> >> Or perhaps a better approach would be to provide something like a
> >> "list_for_each_data_link()" iterator - the potential problem here (as
> >> with Quentin's recent issue with the rkisp1 driver) is the assumption
> >> that all links are data links, so maybe it's best to just guarantee that
> >> if we can.
> >> 
> > I agree with you, without a dedicated iterator, we're bound to repeat
> > the mistake over and over.
> >
> > Would you like to submit a patch to add that iterator, or should I ? I'd
> > name it for_each_media_entity_data_link() or something similar.
> 
> I've started one - I'll send it later (using your function name though,
> naming things was never my strong suit!)

I've modified this patch to skip non-data links manually, to avoid
depending on your series. If the iterator gets merged first, I'll update
the media_entity_remote_pad_unique() helper to use it.

> >>>> +
> >>>> +		if (type == MEDIA_PAD_FL_SOURCE) {
> >>>> +			local_pad = link->sink;
> >>>> +			remote_pad = link->source;
> >>>> +		} else {
> >>>> +			local_pad = link->source;
> >>>> +			remote_pad = link->sink;
> >>>> +		}
> >>>> +
> >>>> +		if (local_pad->entity == entity) {
> >>>> +			if (pad)
> >>>> +				return ERR_PTR(-ENOTUNIQ);
> >>>> +
> >>>> +			pad = remote_pad;
> >>>> +		}
> >>>> +	}
> >>>> +
> >>>> +	if (!pad)
> >>>> +		return ERR_PTR(-ENOLINK);
> >>>> +
> >>>> +	return pad;
> >>>> +}
> >>>> +EXPORT_SYMBOL_GPL(media_entity_remote_pad_unique);
> >>>> +
> >>>>  static void media_interface_init(struct media_device *mdev,
> >>>>  				 struct media_interface *intf,
> >>>>  				 u32 gobj_type,
> >>>> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> >>>> index a9a1c0ec5d1c..33d5f52719a0 100644
> >>>> --- a/include/media/media-entity.h
> >>>> +++ b/include/media/media-entity.h
> >>>> @@ -859,6 +859,51 @@ struct media_link *media_entity_find_link(struct media_pad *source,
> >>>>   */
> >>>>  struct media_pad *media_entity_remote_pad(const struct media_pad *pad);
> >>>>  
> >>>> +/**
> >>>> + * media_entity_remote_pad_unique - Find a remote pad connected to an entity
> >>>> + * @entity: The entity
> >>>> + * @type: The type of pad to find (MEDIA_PAD_FL_SINK or MEDIA_PAD_FL_SOURCE)
> >>>> + *
> >>>> + * Search for and return a remote pad of @type connected to @entity through an
> >>>> + * enabled link. If multiple (or no) remote pads match these criteria, an error
> >>>> + * is returned.
> >>>> + *
> >>>> + * The uniqueness constraint makes this helper function suitable for entities
> >>>> + * that support a single active source or sink at a time.
> >>>> + *
> >>>> + * Return: A pointer to the remote pad, or one of the following error pointers
> >>>> + * if an error occurs:
> >>>> + *
> >>>> + * * -ENOTUNIQ - Multiple links are enabled
> >>>> + * * -ENOLINK - No connected pad found
> >>>> + */
> >>>> +struct media_pad *
> >>>> +media_entity_remote_pad_unique(const struct media_entity *entity,
> >>>> +			       unsigned int type);
> >>>> +
> >>>> +/**
> >>>> + * media_entity_remote_source_pad - Find a remote source pad connected to an entity
> >>>> + * @entity: The entity
> >>>> + *
> >>>> + * Search for and return a remote source pad connected to @entity through an
> >>>> + * enabled link. If multiple (or no) remote pads match these criteria, an error
> >>>> + * is returned.
> >>>> + *
> >>>> + * The uniqueness constraint makes this helper function suitable for entities
> >>>> + * that support a single active source at a time.
> >>>> + *
> >>>> + * Return: A pointer to the remote pad, or one of the following error pointers
> >>>> + * if an error occurs:
> >>>> + *
> >>>> + * * -ENOTUNIQ - Multiple links are enabled
> >>>> + * * -ENOLINK - No connected pad found
> >>>> + */
> >>>> +static inline struct media_pad *
> >>>> +media_entity_remote_source_pad(const struct media_entity *entity)
> >>>> +{
> >>>> +	return media_entity_remote_pad_unique(entity, MEDIA_PAD_FL_SOURCE);
> >>>> +}
> >>>> +
> >>>>  /**
> >>>>   * media_entity_is_streaming - Test if an entity is part of a streaming pipeline
> >>>>   * @entity: The entity

-- 
Regards,

Laurent Pinchart
