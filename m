Return-Path: <linux-media+bounces-45630-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3622C0C2DC
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 08:48:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2BCC218A2273
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 07:48:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 700882E228C;
	Mon, 27 Oct 2025 07:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wm0VWptc"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6EE35B131
	for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 07:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761551256; cv=none; b=XlQ+7+LN8p2or/BB0KeOfI8zvnlIbYd1Nkfbb4PvVoc4Sp+a3vU5z3M6BSQjkibi1FVYtJZJGQoQPYGT057iTC7dBeUmnFSU1rGTOPjZEFXFqSCFgH39Ol2XbWnSXGWQx42nLmJOhZdA20t5ZjPvgewa5DQ9b52zlIj97G2iTgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761551256; c=relaxed/simple;
	bh=2pWaqCd26bX0s5JlIn8HOA+4YKnf7WOJAoV8TtH7OmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NM//+HNyQ7Ko3mlyL/ELhSa1b8SUmZNOplaWu7Q3BtEfAnY7Xu11d5j1ThNnjs5NSYWpTKazjRiYZee+MP2hnaPAaBsu+9eDxYMYk9tEQK6vzULSvm4IML7WsywCBFWTzAT6iki/FQWJj8kG7/eCRMv+ZayFzm6OM8TwcV1YSjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wm0VWptc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [193.209.96.36])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 27FBC8BC;
	Mon, 27 Oct 2025 08:45:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761551145;
	bh=2pWaqCd26bX0s5JlIn8HOA+4YKnf7WOJAoV8TtH7OmM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wm0VWptcMvU8PHhUr6MHCAmRJqcpJmf5ssNJNIHsLE59CXnznt8yei7RADRdiPvEJ
	 2lsMVNEA/c5r6z2+xwjyt7kzKbWP3xenzERUR58YNAijJV82LbnjTgizQAptOb+3qI
	 ivpDnLhHMdojjHCRooHyj2K14vnQr9EDDJknUdIg=
Date: Mon, 27 Oct 2025 09:47:19 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Hans Verkuil <hans@jjverkuil.nl>, Hans de Goede <hansg@kernel.org>,
	Lili Orosz <lily@floofy.city>
Subject: Re: [PATCH v3] media: uvcvideo: Create an ID namespace for streaming
 output terminals
Message-ID: <20251027074719.GA1426@pendragon.ideasonboard.com>
References: <20251027024640.7205-1-laurent.pinchart@ideasonboard.com>
 <20251027025002.GA7552@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251027025002.GA7552@pendragon.ideasonboard.com>

On Mon, Oct 27, 2025 at 04:50:02AM +0200, Laurent Pinchart wrote:
> This should have been [PATCH v3], sorry about the missing version.

And should have carried

Tested-by: Lili Orosz <lily@floofy.city>

I should have gone to bed instead of sending the patch last night :-)

> On Mon, Oct 27, 2025 at 04:46:40AM +0200, Laurent Pinchart wrote:
> > From: Ricardo Ribalda <ribalda@chromium.org>
> > 
> > Some devices, such as the Grandstream GUV3100 and the LSK Meeting Eye
> > for Business & Home, exhibit entity ID collisions between units and
> > streaming output terminals.
> > 
> > The UVC specification requires unit and terminal IDs to be unique, and
> > uses the ID to reference entities:
> > 
> > - In control requests, to identify the target entity
> > - In the UVC units and terminals descriptors' bSourceID field, to
> >   identify source entities
> > - In the UVC input header descriptor's bTerminalLink, to identify the
> >   terminal associated with a streaming interface
> > 
> > Entity ID collisions break accessing controls and make the graph
> > description in the UVC descriptors ambiguous. However, collisions where
> > one of the entities is a streaming output terminal and the other entity
> > is not a streaming terminal are less severe. Streaming output terminals
> > have no controls, and, as they are the final entity in pipelines, they
> > are never referenced in descriptors as source entities. They are
> > referenced by ID only from innput header descriptors, which by
> > definition only reference streaming terminals.
> > 
> > For these reasons, we can work around the collision by giving streaming
> > output terminals their own ID namespace. Do so by setting bit
> > UVC_TERM_OUTPUT (15) in the uvc_entity.id field, which is normally never
> > set as the ID is a 8-bit value.
> > 
> > This ID change doesn't affect the entity name in the media controller
> > graph as the name isn't constructed from the ID, so there should not be
> > any impact on the uAPI.
> > 
> > Although this change handles some ID collisions automagically, keep
> > printing an error in uvc_alloc_new_entity() when a camera has invalid
> > descriptors. Hopefully this message will help vendors fix their invalid
> > descriptors.
> > 
> > Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Co-developed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> > This patch should be merged on top of a revert of commit 758dbc756aad
> > ("media: uvcvideo: Use heuristic to find stream entity"), once that
> > commit is merged in the -next branch of the media tree.
> > 
> > Changes since v2:
> > 
> > - Improve commit message and comment block
> > 
> > Changes in v2:
> > 
> > - Change Macro name
> > - Apply quirk only to TT_STEAMING
> > - Add missing suggested by
> > - uvc_stream_for_terminal
> > - Note, v2 has not been tested yet in real hardware, only v1.
> > - Link to v1: https://lore.kernel.org/r/20251022-uvc-grandstream-laurent-v1-1-0925738a3484@chromium.org
> > ---
> >  drivers/media/usb/uvc/uvc_driver.c | 39 ++++++++++++++++++++++++------
> >  drivers/media/usb/uvc/uvcvideo.h   |  3 ++-
> >  2 files changed, 34 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index fb6afb8e84f0..aa3e8d295e0f 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -165,8 +165,10 @@ static struct uvc_entity *uvc_entity_by_reference(struct uvc_device *dev,
> >  	return NULL;
> >  }
> >  
> > -static struct uvc_streaming *uvc_stream_by_id(struct uvc_device *dev, int id)
> > +static struct uvc_streaming *uvc_stream_for_terminal(struct uvc_device *dev,
> > +						     struct uvc_entity *term)
> >  {
> > +	u16 id = UVC_HARDWARE_ENTITY_ID(term->id);
> >  	struct uvc_streaming *stream;
> >  
> >  	list_for_each_entry(stream, &dev->streams, list) {
> > @@ -810,10 +812,12 @@ static struct uvc_entity *uvc_alloc_new_entity(struct uvc_device *dev, u16 type,
> >  	}
> >  
> >  	/* Per UVC 1.1+ spec 3.7.2, the ID is unique. */
> > -	if (uvc_entity_by_id(dev, id)) {
> > -		dev_err(&dev->intf->dev, "Found multiple Units with ID %u\n", id);
> > +	if (uvc_entity_by_id(dev, UVC_HARDWARE_ENTITY_ID(id)))
> > +		dev_err(&dev->intf->dev, "Found multiple Units with ID %u\n",
> > +			UVC_HARDWARE_ENTITY_ID(id));
> > +
> > +	if (uvc_entity_by_id(dev, id))
> >  		id = UVC_INVALID_ENTITY_ID;
> > -	}
> >  
> >  	extra_size = roundup(extra_size, sizeof(*entity->pads));
> >  	if (num_pads)
> > @@ -969,6 +973,7 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
> >  	struct usb_host_interface *alts = dev->intf->cur_altsetting;
> >  	unsigned int i, n, p, len;
> >  	const char *type_name;
> > +	unsigned int id;
> >  	u16 type;
> >  
> >  	switch (buffer[2]) {
> > @@ -1107,8 +1112,28 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
> >  			return 0;
> >  		}
> >  
> > +		id = buffer[3];
> > +
> > +		/*
> > +		 * Some devices, such as the Grandstream GUV3100, exhibit entity
> > +		 * ID collisions between units and streaming output terminals.
> > +		 * Move streaming output terminals to their own ID namespace by
> > +		 * setting bit UVC_TERM_OUTPUT (15), above the ID's 8-bit value.
> > +		 * The bit is ignored in uvc_stream_for_terminal() when looking
> > +		 * up the streaming interface for the terminal.
> > +		 *
> > +		 * This hack is safe to enable unconditionally, as the ID is not
> > +		 * used for any other purpose (streaming output terminals have
> > +		 * no controls and are never referenced as sources in UVC
> > +		 * descriptors). Other types output terminals can have controls,
> > +		 * so limit usage of this separate namespace to streaming output
> > +		 * terminals.
> > +		 */
> > +		if (type & UVC_TT_STREAMING)
> > +			id |= UVC_TERM_OUTPUT;
> > +
> >  		term = uvc_alloc_new_entity(dev, type | UVC_TERM_OUTPUT,
> > -					    buffer[3], 1, 0);
> > +					    id, 1, 0);
> >  		if (IS_ERR(term))
> >  			return PTR_ERR(term);
> >  
> > @@ -2105,8 +2130,8 @@ static int uvc_register_terms(struct uvc_device *dev,
> >  		if (UVC_ENTITY_TYPE(term) != UVC_TT_STREAMING)
> >  			continue;
> >  
> > -		stream = uvc_stream_by_id(dev, term->id);
> > -		if (stream == NULL) {
> > +		stream = uvc_stream_for_terminal(dev, term);
> > +		if (!stream) {
> >  			dev_info(&dev->intf->dev,
> >  				 "No streaming interface found for terminal %u.",
> >  				 term->id);
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index ed7bad31f75c..3f2e832025e7 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -41,7 +41,8 @@
> >  #define UVC_EXT_GPIO_UNIT		0x7ffe
> >  #define UVC_EXT_GPIO_UNIT_ID		0x100
> >  
> > -#define UVC_INVALID_ENTITY_ID          0xffff
> > +#define UVC_HARDWARE_ENTITY_ID(id)	((id) & 0xff)
> > +#define UVC_INVALID_ENTITY_ID		0xffff
> >  
> >  /* ------------------------------------------------------------------------
> >   * Driver specific constants.
> > 
> > base-commit: ea299a2164262ff787c9d33f46049acccd120672

-- 
Regards,

Laurent Pinchart

