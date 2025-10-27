Return-Path: <linux-media+bounces-45631-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C72C0C30F
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 08:52:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1EEE04F10AA
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 07:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 718CC2E4241;
	Mon, 27 Oct 2025 07:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jIV6Hm1L"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB542E3B07
	for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 07:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761551465; cv=none; b=Vgk6FKeYKJnY1u2EkEC5LNBIjhB+vB3GEGTVfcUcnxPqWlMCaNiZXI+jLghJ/B4eOF6kZgSVSuuVkbKDyQjnxcPbDXjbS7zE7NzLcVvy7ZF/+vq5j3H9nveXNloWXs8a9Cpq5JVFh6PecRel0eln+8ySMJgKithJ2GccMGh0rlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761551465; c=relaxed/simple;
	bh=ud+aRDtdqEOpqhCajFT1XNCEnFl1g9EwLGS8+qFBBdM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W9rQqDFkkY+EP+ZSAbLfo/P2iA31thWtp1fP4oLoSS39SCY2CQ0t2NeZq5rsnroryHAUXILV6gheaHPkgpNm8VppEmNXDydSuV+YO+gWTW+pP6ojmc/Xuscvrg/4tChxqBm36hJeWf5ZhNmLRjnt22kN8pvETQ1u6AnmC4BC6Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jIV6Hm1L; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-378e603f7e4so32991561fa.0
        for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 00:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1761551460; x=1762156260; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ro7RInfGJQ+0cp7k+QCXzdmH+m3h+x6FhvslA0GmClk=;
        b=jIV6Hm1LRZkhUpa2Bu8woxtF87zCn7q/k2L9Mp77F57OIqxEmv4R5S1W0G5P6jL58g
         EOa1shwa5Mw5zAKcSJyCB0XG4Ahd5U1s8MV2LK7VRN4FAcLLn/IYDMTugjbUu2XUGty9
         4/yrUP2AvN4MJxxuGN0JZA3uLdbkDMRC0dz+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761551460; x=1762156260;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ro7RInfGJQ+0cp7k+QCXzdmH+m3h+x6FhvslA0GmClk=;
        b=eK12Mqop5IdyjSC5fHhEHAhurkPg1ccVcyEPKnxipaifrFfWDpb1H04ykEyv9bwilP
         +yAoRbI+cFTgI2/ANhWT3OlaCa2VjWmKDqVB1JcZY6/VjlEKjdbRbamda6E4M0BmE5NU
         3YD4QJAYCxWoBU9ZnqyS9QDH623pPmqGBssWFxaddMkc+MSZk4qA5sRJZagMwWxWl/ds
         zyUF71GXnk6FdOl24AYANHThKicnN/8AvVVvRZ6HVThzouXHJmAyQKq7vSrY1mPPAe2I
         w/cff29vsNZT6qhZapo8EHYM9a/8uwjrKY87pwqsDnzTYZ5dh71VKV5M+9nBb8xX1w9L
         XsXw==
X-Gm-Message-State: AOJu0YwTcsPioyG9sdIphiJOJGWvegc4tvinyuEZilK3LaYT5yVaBaRK
	NRTpKmAbSfvhbR/seqXFPjeuRyF4NMf4GR0qJxZWOtSNgU8mm9JgMNZWYV+a9fxCsOdQwzmFFyM
	iT74=
X-Gm-Gg: ASbGncuKeLGKBJFJv5X3APPlOAjZiOrPWsoFpL9Zib4+YwqyhefMDZiYxILADvHN+BT
	icDDPq0/yLaCJU0xrUnedFDVcGIMQpcFDTLNovO1GA7rVdqTTO4Kb1iQXLGsx511j3bz6zun+Ux
	f1Z/quAdYicrfD3OFc2ErbkCtiLMd9TbGY6/CRV6tFH4rsZVvGvJEH4J/A8w2YI5JYGXmBO/OPW
	YNERw2Q9bjCClXutN0O01vyoRCiZWjzgMW6hEZDQEaMeqcf0IOfOC4S+wmUvLDi/UaOAf4i9XQV
	pXb2tReWlL+udm4zFWsVvBk/vvtgYwWQD60bMWa3+E2T+xb9OTA1FAkWP1k0YOEvi5lujAKNEc1
	CP6qL2CWZogKdPdiUHP2t/sTAEES6ycSDqrtjlDd4Jd0Gp0+nsDhcEt3UDK44DuZqdmP6/hERWa
	C0p0OZGTbbG2GZrBPNQfU5XGBWlFEkdH2laF0GWhp3OQ==
X-Google-Smtp-Source: AGHT+IG4wJ2EPrFi59m0xiBB2Rz/5VNjiSragQ++uwP98PFyRPfV6CszZwHLH9rxK6aWV1zcjtei0w==
X-Received: by 2002:a05:651c:12c3:b0:354:6fe9:8ad2 with SMTP id 38308e7fff4ca-37797a292a0mr117702541fa.24.1761551459836;
        Mon, 27 Oct 2025 00:50:59 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378ee09ca49sm18371371fa.13.2025.10.27.00.50.59
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 00:50:59 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-378e603f7e4so32991361fa.0
        for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 00:50:59 -0700 (PDT)
X-Received: by 2002:a2e:bc28:0:b0:376:3a83:4269 with SMTP id
 38308e7fff4ca-37797ad9211mr108113241fa.47.1761551458804; Mon, 27 Oct 2025
 00:50:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251027024640.7205-1-laurent.pinchart@ideasonboard.com>
 <20251027025002.GA7552@pendragon.ideasonboard.com> <20251027074719.GA1426@pendragon.ideasonboard.com>
In-Reply-To: <20251027074719.GA1426@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 27 Oct 2025 08:50:46 +0100
X-Gmail-Original-Message-ID: <CANiDSCvMu=RgdHK2T-JbN0eF-BFBovwG=dHUYvQcw2DPFk7A7Q@mail.gmail.com>
X-Gm-Features: AWmQ_bnsmbhqDJrYM6bGOAn_fnsmmWqJGXDcL7kSvPwgl5Yuo1bj2C7Y5zKMyXo
Message-ID: <CANiDSCvMu=RgdHK2T-JbN0eF-BFBovwG=dHUYvQcw2DPFk7A7Q@mail.gmail.com>
Subject: Re: [PATCH v3] media: uvcvideo: Create an ID namespace for streaming
 output terminals
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Hans Verkuil <hans@jjverkuil.nl>, 
	Hans de Goede <hansg@kernel.org>, Lili Orosz <lily@floofy.city>
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

On Mon, 27 Oct 2025 at 08:47, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Mon, Oct 27, 2025 at 04:50:02AM +0200, Laurent Pinchart wrote:
> > This should have been [PATCH v3], sorry about the missing version.
>
> And should have carried
>
> Tested-by: Lili Orosz <lily@floofy.city>
>
> I should have gone to bed instead of sending the patch last night :-)

And a Link to the previous version after the --- would also be very welcome :P
https://lore.kernel.org/linux-media/20251022-uvc-grandstream-laurent-v2-1-8c5c20d6c571@chromium.org/




>
> > On Mon, Oct 27, 2025 at 04:46:40AM +0200, Laurent Pinchart wrote:
> > > From: Ricardo Ribalda <ribalda@chromium.org>
> > >
> > > Some devices, such as the Grandstream GUV3100 and the LSK Meeting Eye
> > > for Business & Home, exhibit entity ID collisions between units and
> > > streaming output terminals.
> > >
> > > The UVC specification requires unit and terminal IDs to be unique, and
> > > uses the ID to reference entities:
> > >
> > > - In control requests, to identify the target entity
> > > - In the UVC units and terminals descriptors' bSourceID field, to
> > >   identify source entities
> > > - In the UVC input header descriptor's bTerminalLink, to identify the
> > >   terminal associated with a streaming interface
> > >
> > > Entity ID collisions break accessing controls and make the graph
> > > description in the UVC descriptors ambiguous. However, collisions where
> > > one of the entities is a streaming output terminal and the other entity
> > > is not a streaming terminal are less severe. Streaming output terminals
> > > have no controls, and, as they are the final entity in pipelines, they
> > > are never referenced in descriptors as source entities. They are
> > > referenced by ID only from innput header descriptors, which by
> > > definition only reference streaming terminals.
> > >
> > > For these reasons, we can work around the collision by giving streaming
> > > output terminals their own ID namespace. Do so by setting bit
> > > UVC_TERM_OUTPUT (15) in the uvc_entity.id field, which is normally never
> > > set as the ID is a 8-bit value.
> > >
> > > This ID change doesn't affect the entity name in the media controller
> > > graph as the name isn't constructed from the ID, so there should not be
> > > any impact on the uAPI.
> > >
> > > Although this change handles some ID collisions automagically, keep
> > > printing an error in uvc_alloc_new_entity() when a camera has invalid
> > > descriptors. Hopefully this message will help vendors fix their invalid
> > > descriptors.
> > >
> > > Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Co-developed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > > This patch should be merged on top of a revert of commit 758dbc756aad
> > > ("media: uvcvideo: Use heuristic to find stream entity"), once that
> > > commit is merged in the -next branch of the media tree.
> > >
> > > Changes since v2:
> > >
> > > - Improve commit message and comment block
> > >
> > > Changes in v2:
> > >
> > > - Change Macro name
> > > - Apply quirk only to TT_STEAMING
> > > - Add missing suggested by
> > > - uvc_stream_for_terminal
> > > - Note, v2 has not been tested yet in real hardware, only v1.
> > > - Link to v1: https://lore.kernel.org/r/20251022-uvc-grandstream-laurent-v1-1-0925738a3484@chromium.org
> > > ---
> > >  drivers/media/usb/uvc/uvc_driver.c | 39 ++++++++++++++++++++++++------
> > >  drivers/media/usb/uvc/uvcvideo.h   |  3 ++-
> > >  2 files changed, 34 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > > index fb6afb8e84f0..aa3e8d295e0f 100644
> > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > @@ -165,8 +165,10 @@ static struct uvc_entity *uvc_entity_by_reference(struct uvc_device *dev,
> > >     return NULL;
> > >  }
> > >
> > > -static struct uvc_streaming *uvc_stream_by_id(struct uvc_device *dev, int id)
> > > +static struct uvc_streaming *uvc_stream_for_terminal(struct uvc_device *dev,
> > > +                                                struct uvc_entity *term)
> > >  {
> > > +   u16 id = UVC_HARDWARE_ENTITY_ID(term->id);
> > >     struct uvc_streaming *stream;
> > >
> > >     list_for_each_entry(stream, &dev->streams, list) {
> > > @@ -810,10 +812,12 @@ static struct uvc_entity *uvc_alloc_new_entity(struct uvc_device *dev, u16 type,
> > >     }
> > >
> > >     /* Per UVC 1.1+ spec 3.7.2, the ID is unique. */
> > > -   if (uvc_entity_by_id(dev, id)) {
> > > -           dev_err(&dev->intf->dev, "Found multiple Units with ID %u\n", id);
> > > +   if (uvc_entity_by_id(dev, UVC_HARDWARE_ENTITY_ID(id)))
> > > +           dev_err(&dev->intf->dev, "Found multiple Units with ID %u\n",
> > > +                   UVC_HARDWARE_ENTITY_ID(id));
> > > +
> > > +   if (uvc_entity_by_id(dev, id))
> > >             id = UVC_INVALID_ENTITY_ID;
> > > -   }
> > >
> > >     extra_size = roundup(extra_size, sizeof(*entity->pads));
> > >     if (num_pads)
> > > @@ -969,6 +973,7 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
> > >     struct usb_host_interface *alts = dev->intf->cur_altsetting;
> > >     unsigned int i, n, p, len;
> > >     const char *type_name;
> > > +   unsigned int id;
> > >     u16 type;
> > >
> > >     switch (buffer[2]) {
> > > @@ -1107,8 +1112,28 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
> > >                     return 0;
> > >             }
> > >
> > > +           id = buffer[3];
> > > +
> > > +           /*
> > > +            * Some devices, such as the Grandstream GUV3100, exhibit entity
> > > +            * ID collisions between units and streaming output terminals.
> > > +            * Move streaming output terminals to their own ID namespace by
> > > +            * setting bit UVC_TERM_OUTPUT (15), above the ID's 8-bit value.
> > > +            * The bit is ignored in uvc_stream_for_terminal() when looking
> > > +            * up the streaming interface for the terminal.
> > > +            *
> > > +            * This hack is safe to enable unconditionally, as the ID is not
> > > +            * used for any other purpose (streaming output terminals have
> > > +            * no controls and are never referenced as sources in UVC
> > > +            * descriptors). Other types output terminals can have controls,
> > > +            * so limit usage of this separate namespace to streaming output
> > > +            * terminals.
> > > +            */
> > > +           if (type & UVC_TT_STREAMING)
> > > +                   id |= UVC_TERM_OUTPUT;
> > > +
> > >             term = uvc_alloc_new_entity(dev, type | UVC_TERM_OUTPUT,
> > > -                                       buffer[3], 1, 0);
> > > +                                       id, 1, 0);
> > >             if (IS_ERR(term))
> > >                     return PTR_ERR(term);
> > >
> > > @@ -2105,8 +2130,8 @@ static int uvc_register_terms(struct uvc_device *dev,
> > >             if (UVC_ENTITY_TYPE(term) != UVC_TT_STREAMING)
> > >                     continue;
> > >
> > > -           stream = uvc_stream_by_id(dev, term->id);
> > > -           if (stream == NULL) {
> > > +           stream = uvc_stream_for_terminal(dev, term);
> > > +           if (!stream) {
> > >                     dev_info(&dev->intf->dev,
> > >                              "No streaming interface found for terminal %u.",
> > >                              term->id);
> > > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > > index ed7bad31f75c..3f2e832025e7 100644
> > > --- a/drivers/media/usb/uvc/uvcvideo.h
> > > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > > @@ -41,7 +41,8 @@
> > >  #define UVC_EXT_GPIO_UNIT          0x7ffe
> > >  #define UVC_EXT_GPIO_UNIT_ID               0x100
> > >
> > > -#define UVC_INVALID_ENTITY_ID          0xffff
> > > +#define UVC_HARDWARE_ENTITY_ID(id) ((id) & 0xff)
> > > +#define UVC_INVALID_ENTITY_ID              0xffff
> > >
> > >  /* ------------------------------------------------------------------------
> > >   * Driver specific constants.
> > >
> > > base-commit: ea299a2164262ff787c9d33f46049acccd120672
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

