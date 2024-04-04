Return-Path: <linux-media+bounces-8680-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EBE898F7F
	for <lists+linux-media@lfdr.de>; Thu,  4 Apr 2024 22:17:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF8701F27623
	for <lists+linux-media@lfdr.de>; Thu,  4 Apr 2024 20:17:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6BF81350D6;
	Thu,  4 Apr 2024 20:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="QuU4CRJB"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791F913541E
	for <linux-media@vger.kernel.org>; Thu,  4 Apr 2024 20:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712261841; cv=pass; b=ju+vX/1W9dkZx4A0jjCHnOWJd3pu3YVdU68anSfZBHm3w8Jnf0REZIoLw5FTyMiflOhxV75ig0sSVjEfan8/ORCukou3U8CaaAyOzFzJV5PeAPgQ+H0e7HiGEUgkSrnc75yvbfLzd7Ux+w/rka/EFL9I2p819jIgKX/mKQT7tD0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712261841; c=relaxed/simple;
	bh=jCYA9TMOkYHNJIKQwxC4Aj2lXfEQNKOK4nk45VOgj0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tHlfXP2qO9p8ptAY2zQSIrYFpJTu5ub2p3gRZTQNd40gXPAO2iPvSCVZ0lWJfPycHiidJty7gXoc1nd/dK42PBHxZC2vQeHSLAXMuNFLogbgEhU6Sy8DYiIqCipEgoCUZBchEl7Fql56dDLvdFMFzU1JytHD8lu+PlnFKFt+jC0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=QuU4CRJB; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4V9Xw60skHz49Q20;
	Thu,  4 Apr 2024 23:17:10 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1712261830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hc3rbzmBmEnHj7o7RXBlFtxcs1aAC3GN5O2heU3qsRw=;
	b=QuU4CRJBehWR04kbLQNHI+tevSQV98RRAq2y9I3ocmle59IMTjvgp4xfoAyAr+EKDaIeEh
	YaJXLPqf/0QWWUBCKKeuOzPlKzzXlc32FeUI+C2ncV8PNKWrxhu95v39IjbZpi750z/J6u
	Er4MBriQUwUtKzB2mtXJk+C/HzzuVQU0WdulDEhLWSY8dHgad6SHbh0lPnLIZZ816lO9Qh
	2doCcQkyXFNyiihKIyqnMoS84a6fHwdAJKsKQtns2sJfWF7liVTobBqIGAzrMpDCjNA+sy
	u4U2eaxeiJ8s6sLQJKnq4/nGlAnpTEHtryZmecUsIYu3WmV0AXY0QFdt/zMttQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1712261830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hc3rbzmBmEnHj7o7RXBlFtxcs1aAC3GN5O2heU3qsRw=;
	b=ur0wQwNPL7XmpoyGAWHybmARnevmFwHnYzVWJimT59/UeAISk9Jrr4xm+NjFYH7figTFWI
	OlFiFlPNQb3Wjb86v+arbTD6mjpYgAQc42Kpy+bjzLJGIV0ZweUe9GDebDXp07Hby8/G7G
	tFKyl7NhPLMtqfbClUP8RmFIpYkRqMoV7OO1q1UegHRP/b9rCglSfzVrvF/eKvWCPTX3eA
	6QT2Vq6OGcymMhRy2ub+kDLeeEQYfteiDwYGJ3+oOCGsR/lI1YTdD7tIQpEwMvzuuLtZIx
	0zsb9B65gP1kuBSzNb/3uWRlkMZKb+OesHgsWVQiYYhjM6m3M6GG/2LLNiUXzQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1712261830; a=rsa-sha256;
	cv=none;
	b=P9YKIcCfNg2BjcU00PNLP89Yl9ffs1IPAwYHN6MR5Cpk4FUBApxoFRiTR1G3IB1kXJaE86
	8Cp4scz2q9Gse3YLYJCM1Vfh/5pMbSqO8RCXt475xieo2Suwd5E1epiFKdO0zcdJ7xHeqP
	ENFDPlVojdEULrPz+0h1fSIPUvypTvlv6XWcUOPO0T31XYu+xmkbCv7QQFjX2f5tb+navm
	9RpNTZH+Y5ho8VOnD6zonpFoorAzIAC+08jeam9p56rJtYbPaUZGgyWeFD+2NVMT3p+JTU
	oliiI16xKKgDNYVlAd1v6WnNWqdSj133wMzC2LEivznf7MYrJ90qwzrM3cAmIg==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id BE249634C93;
	Thu,  4 Apr 2024 23:17:09 +0300 (EEST)
Date: Thu, 4 Apr 2024 20:17:09 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, Gregor Jasny <gjasny@googlemail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [v4l-utils] [PATCH 1/8] utils: media-ctl: Print MUST_CONNECT pad
 flags
Message-ID: <Zg8KxZDq9iOXshvk@valkosipuli.retiisi.eu>
References: <20240402000033.4007-1-laurent.pinchart@ideasonboard.com>
 <20240402000033.4007-2-laurent.pinchart@ideasonboard.com>
 <20240403084034.GA4168@pendragon.ideasonboard.com>
 <129d17fc-a26d-4b79-adef-f76b0e457c00@ideasonboard.com>
 <96853248-ff15-4676-a428-69889740bec3@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <96853248-ff15-4676-a428-69889740bec3@xs4all.nl>

Hi Hans, Tomi,

On Wed, Apr 03, 2024 at 10:56:55AM +0200, Hans Verkuil wrote:
> On 03/04/2024 10:43, Tomi Valkeinen wrote:
> > On 03/04/2024 11:40, Laurent Pinchart wrote:
> >> Hi Sakari,
> >>
> >> Thank you for the patch.
> >>
> >> On Tue, Apr 02, 2024 at 03:00:26AM +0300, Laurent Pinchart wrote:
> >>> From: Sakari Ailus <sakari.ailus@linux.intel.com>
> >>>
> >>> Print the MUST_CONNECT pad flag for each pad.
> >>>
> >>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> >>> ---
> >>>   utils/media-ctl/media-ctl.c | 50 +++++++++++++++++++++----------------
> >>>   1 file changed, 28 insertions(+), 22 deletions(-)
> >>>
> >>> diff --git a/utils/media-ctl/media-ctl.c b/utils/media-ctl/media-ctl.c
> >>> index 2081f111f2db..1b40552253f1 100644
> >>> --- a/utils/media-ctl/media-ctl.c
> >>> +++ b/utils/media-ctl/media-ctl.c
> >>> @@ -368,26 +368,6 @@ static const char *media_entity_subtype_to_string(unsigned type)
> >>>       }
> >>>   }
> >>>   -static const char *media_pad_type_to_string(unsigned flag)
> >>> -{
> >>> -    static const struct {
> >>> -        __u32 flag;
> >>> -        const char *name;
> >>> -    } flags[] = {
> >>> -        { MEDIA_PAD_FL_SINK, "Sink" },
> >>> -        { MEDIA_PAD_FL_SOURCE, "Source" },
> >>> -    };
> >>> -
> >>> -    unsigned int i;
> >>> -
> >>> -    for (i = 0; i < ARRAY_SIZE(flags); i++) {
> >>> -        if (flags[i].flag & flag)
> >>> -            return flags[i].name;
> >>> -    }
> >>> -
> >>> -    return "Unknown";
> >>> -}
> >>> -
> >>>   static void media_print_topology_dot(struct media_device *media)
> >>>   {
> >>>       unsigned int nents = media_get_entities_count(media);
> >>> @@ -525,6 +505,25 @@ static void media_print_pad_text(struct media_entity *entity,
> >>>           v4l2_subdev_print_subdev_dv(entity);
> >>>   }
> >>>   +static unsigned int weight(uint32_t word)
> >>> +{
> >>> +    unsigned int w = 0, i;
> >>> +
> >>> +    for (i = 0; i < sizeof(word) << 3; i++, word >>= 1)
> >>> +        w += word & 1U;
> >>> +
> >>> +    return w;
> >>> +}
> >>> +
> >>> +static const char *comma(uint32_t flag, uint32_t prev_flags, uint32_t flags)
> >>> +{
> >>> +    static const char *empty = "", *comma = ", ";
> >>> +    if (!(flag & flags))
> >>> +        return empty;
> >>> +
> >>> +    return weight(prev_flags & flags) ? comma : empty;
> >>
> >> Unless I'm mistaken, we can write this
> >>
> >>     return prev_flags & flags ? comma : empty;
> >>
> >> and drop the weight function.

Correct. An earlier version of the patch used it and I forgot to remove it.

It should be possible to write this as:

static const char *comma(uint32_t flag, uint32_t prev_flags, uint32_t flags)
{
	return flag & flags && prev_flags & flags ? ", " : "";
}

This nicely demonstrates C operator precedence.

> >>
> >>> +}
> >>> +
> >>>   static void media_print_topology_text_entity(struct media_device *media,
> >>>                            struct media_entity *entity)
> >>>   {
> >>> @@ -567,8 +566,15 @@ static void media_print_topology_text_entity(struct media_device *media,
> >>>       for (j = 0; j < info->pads; j++) {
> >>>           const struct media_pad *pad = media_entity_get_pad(entity, j);
> >>>   -        printf("\tpad%u: %s\n", j, media_pad_type_to_string(pad->flags));
> >>> -
> >>> +        printf("\tpad%u: %s%s%s%s%s\n", j,
> >>> +               pad->flags & MEDIA_PAD_FL_SINK ? "Sink" : "",
> >>> +               comma(MEDIA_PAD_FL_SOURCE, MEDIA_PAD_FL_SINK,
> >>> +                 pad->flags),
> >>> +               pad->flags & MEDIA_PAD_FL_SOURCE ? "Source" : "",
> >>> +               comma(MEDIA_PAD_FL_MUST_CONNECT,
> >>> +                 MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE,
> >>> +                 pad->flags),
> >>> +               pad->flags & MEDIA_PAD_FL_MUST_CONNECT ? "Must connect" : "");
> >>
> >> To be honest, this looks overly complicated. How about printing the
> >> flags with a loop ?
> > 
> > I was just about to reply that this looks a bit too "smart" to me... I'd prefer just a simple loop here for readability's and maintainability's sake, even if it's not as optimal.
> 
> Same comment from me :-)

The above gets it done as a single printf call. Perhaps it doesn't matter
much if it doesn't though, this isn't printk. Still do note that checking
whether the commas will be printed isn't trivial so replacing this with a
loop isn't necessarily making the code notably simpler.

-- 
Regards,

Sakari Ailus

