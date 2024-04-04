Return-Path: <linux-media+bounces-8683-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D09C8990F7
	for <lists+linux-media@lfdr.de>; Fri,  5 Apr 2024 00:04:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 97FD8B26761
	for <lists+linux-media@lfdr.de>; Thu,  4 Apr 2024 22:04:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCBC113C3D8;
	Thu,  4 Apr 2024 22:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HYNrNpJH"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80E982D90
	for <linux-media@vger.kernel.org>; Thu,  4 Apr 2024 22:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712268273; cv=none; b=JRkyyLoXAYaD6Iu+pgd3RwCcwD4T73fPmxhrlrrlZAxczTARooVubuu97yZjf+oFVpqfchylKVBJAY2Wb1sFnYzXFIiaWV3UftI+Rk4XgodP1bLaA9IfQvCTnghu9bxuVnM9dbJ3PbXioS2Icbc7Oust7744FgFV+ybvnJYfQvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712268273; c=relaxed/simple;
	bh=h+DpP32KIXjCBtv7JjiaxgeBIHnZEjySt6Mxd4ivso8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JHB8U2qFFPxNxxZQdgWfig+TzGgVjF4HNqW9vwMikcgK6rAlmOAmXAZcIHNWi98CoHyCY3/07rvvHMTGM1aFEAUOloDyrn2RghdElLhWF8mnZlqpHKzHNYPDgKTx4/Vob09CUxDcLc5TEoQGZorOsgJKiq7odkH3jKDV8EuyTBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HYNrNpJH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1FC7422A;
	Fri,  5 Apr 2024 00:03:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712268232;
	bh=h+DpP32KIXjCBtv7JjiaxgeBIHnZEjySt6Mxd4ivso8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HYNrNpJHy4S4YVHmI0rVZc4uLO69C5gTXXyy5HgDQP6lz7BuHnPfl10Bkxka8amR8
	 fFc7UJYTy3fztYURQIYyya+MDkmqkwdS87TfQWfQ5tVB1uvBYC+4HDhiWCibsnuf9x
	 sXLH+B6SEUaxskTgSv/4LwoPmlH1G4tykukX9fgQ=
Date: Fri, 5 Apr 2024 01:04:19 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, Gregor Jasny <gjasny@googlemail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [v4l-utils] [PATCH 1/8] utils: media-ctl: Print MUST_CONNECT pad
 flags
Message-ID: <20240404220419.GA22530@pendragon.ideasonboard.com>
References: <20240402000033.4007-1-laurent.pinchart@ideasonboard.com>
 <20240402000033.4007-2-laurent.pinchart@ideasonboard.com>
 <20240403084034.GA4168@pendragon.ideasonboard.com>
 <129d17fc-a26d-4b79-adef-f76b0e457c00@ideasonboard.com>
 <96853248-ff15-4676-a428-69889740bec3@xs4all.nl>
 <Zg8KxZDq9iOXshvk@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zg8KxZDq9iOXshvk@valkosipuli.retiisi.eu>

On Thu, Apr 04, 2024 at 08:17:09PM +0000, Sakari Ailus wrote:
> On Wed, Apr 03, 2024 at 10:56:55AM +0200, Hans Verkuil wrote:
> > On 03/04/2024 10:43, Tomi Valkeinen wrote:
> > > On 03/04/2024 11:40, Laurent Pinchart wrote:
> > >> On Tue, Apr 02, 2024 at 03:00:26AM +0300, Laurent Pinchart wrote:
> > >>> From: Sakari Ailus <sakari.ailus@linux.intel.com>
> > >>>
> > >>> Print the MUST_CONNECT pad flag for each pad.
> > >>>
> > >>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > >>> ---
> > >>>   utils/media-ctl/media-ctl.c | 50 +++++++++++++++++++++----------------
> > >>>   1 file changed, 28 insertions(+), 22 deletions(-)
> > >>>
> > >>> diff --git a/utils/media-ctl/media-ctl.c b/utils/media-ctl/media-ctl.c
> > >>> index 2081f111f2db..1b40552253f1 100644
> > >>> --- a/utils/media-ctl/media-ctl.c
> > >>> +++ b/utils/media-ctl/media-ctl.c
> > >>> @@ -368,26 +368,6 @@ static const char *media_entity_subtype_to_string(unsigned type)
> > >>>       }
> > >>>   }
> > >>>   -static const char *media_pad_type_to_string(unsigned flag)
> > >>> -{
> > >>> -    static const struct {
> > >>> -        __u32 flag;
> > >>> -        const char *name;
> > >>> -    } flags[] = {
> > >>> -        { MEDIA_PAD_FL_SINK, "Sink" },
> > >>> -        { MEDIA_PAD_FL_SOURCE, "Source" },
> > >>> -    };
> > >>> -
> > >>> -    unsigned int i;
> > >>> -
> > >>> -    for (i = 0; i < ARRAY_SIZE(flags); i++) {
> > >>> -        if (flags[i].flag & flag)
> > >>> -            return flags[i].name;
> > >>> -    }
> > >>> -
> > >>> -    return "Unknown";
> > >>> -}
> > >>> -
> > >>>   static void media_print_topology_dot(struct media_device *media)
> > >>>   {
> > >>>       unsigned int nents = media_get_entities_count(media);
> > >>> @@ -525,6 +505,25 @@ static void media_print_pad_text(struct media_entity *entity,
> > >>>           v4l2_subdev_print_subdev_dv(entity);
> > >>>   }
> > >>>   +static unsigned int weight(uint32_t word)
> > >>> +{
> > >>> +    unsigned int w = 0, i;
> > >>> +
> > >>> +    for (i = 0; i < sizeof(word) << 3; i++, word >>= 1)
> > >>> +        w += word & 1U;
> > >>> +
> > >>> +    return w;
> > >>> +}
> > >>> +
> > >>> +static const char *comma(uint32_t flag, uint32_t prev_flags, uint32_t flags)
> > >>> +{
> > >>> +    static const char *empty = "", *comma = ", ";
> > >>> +    if (!(flag & flags))
> > >>> +        return empty;
> > >>> +
> > >>> +    return weight(prev_flags & flags) ? comma : empty;
> > >>
> > >> Unless I'm mistaken, we can write this
> > >>
> > >>     return prev_flags & flags ? comma : empty;
> > >>
> > >> and drop the weight function.
> 
> Correct. An earlier version of the patch used it and I forgot to remove it.
> 
> It should be possible to write this as:
> 
> static const char *comma(uint32_t flag, uint32_t prev_flags, uint32_t flags)
> {
> 	return flag & flags && prev_flags & flags ? ", " : "";
> }
> 
> This nicely demonstrates C operator precedence.
> 
> > >>
> > >>> +}
> > >>> +
> > >>>   static void media_print_topology_text_entity(struct media_device *media,
> > >>>                            struct media_entity *entity)
> > >>>   {
> > >>> @@ -567,8 +566,15 @@ static void media_print_topology_text_entity(struct media_device *media,
> > >>>       for (j = 0; j < info->pads; j++) {
> > >>>           const struct media_pad *pad = media_entity_get_pad(entity, j);
> > >>>   -        printf("\tpad%u: %s\n", j, media_pad_type_to_string(pad->flags));
> > >>> -
> > >>> +        printf("\tpad%u: %s%s%s%s%s\n", j,
> > >>> +               pad->flags & MEDIA_PAD_FL_SINK ? "Sink" : "",
> > >>> +               comma(MEDIA_PAD_FL_SOURCE, MEDIA_PAD_FL_SINK,
> > >>> +                 pad->flags),
> > >>> +               pad->flags & MEDIA_PAD_FL_SOURCE ? "Source" : "",
> > >>> +               comma(MEDIA_PAD_FL_MUST_CONNECT,
> > >>> +                 MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE,
> > >>> +                 pad->flags),
> > >>> +               pad->flags & MEDIA_PAD_FL_MUST_CONNECT ? "Must connect" : "");
> > >>
> > >> To be honest, this looks overly complicated. How about printing the
> > >> flags with a loop ?
> > > 
> > > I was just about to reply that this looks a bit too "smart" to me... I'd prefer just a simple loop here for readability's and maintainability's sake, even if it's not as optimal.
> > 
> > Same comment from me :-)
> 
> The above gets it done as a single printf call. Perhaps it doesn't matter
> much if it doesn't though, this isn't printk. Still do note that checking
> whether the commas will be printed isn't trivial so replacing this with a
> loop isn't necessarily making the code notably simpler.

See https://lore.kernel.org/linux-media/20240404220312.8019-1-laurent.pinchart@ideasonboard.com

-- 
Regards,

Laurent Pinchart

