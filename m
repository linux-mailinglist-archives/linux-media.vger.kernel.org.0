Return-Path: <linux-media+bounces-23442-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A28A9F24DD
	for <lists+linux-media@lfdr.de>; Sun, 15 Dec 2024 18:03:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 11B451885FBD
	for <lists+linux-media@lfdr.de>; Sun, 15 Dec 2024 17:03:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F318F1ACDE8;
	Sun, 15 Dec 2024 17:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="O+lM0Auo"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FB71AAA24
	for <linux-media@vger.kernel.org>; Sun, 15 Dec 2024 17:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734282180; cv=none; b=T0E+HxLKr28WzR8iMq81/nlLXWBqpbOIxp3Mah4aq0k8V9Fu9Le6L9qNVy+OmV8IVQKVRv0rzEI6vyQ+WQRBPG1JFCMmrRfXke8c7CDLjA0fqvuyhbxdjzfUH0B2VvOoZHE0u5iA9PepP7YIWID94en+yJai3Bshmys8iT4Mevc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734282180; c=relaxed/simple;
	bh=1hSNCw4ldIrWj/f+0J4gDrZMvdGFfgyzloKyglEkduk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hSOsJOD1VQrwZcvyk/h8pHHhUk8Vb/yWbjxFvI7YZJXId/DsM3wtEC/+iul4gTSF1icFB/JqhVCsbI5uqZazt+oiVFxsisc1xl0yKGyl3nZfxQhJf+1RIKhq2nA4+sfFfK+tQs08RB5nIrxQyfLcb6RryX5t5IrMnJU2qDT3510=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=O+lM0Auo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 08C6799F;
	Sun, 15 Dec 2024 18:02:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734282141;
	bh=1hSNCw4ldIrWj/f+0J4gDrZMvdGFfgyzloKyglEkduk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O+lM0Auoz2joIiDo7SqrtxaYuJL2k8Q6fp/IiMLhh/qzF7N89g18uhiR8CDxiG0y/
	 EPRIuIyuLMzGegg8wMhvN1sYYVitxICy/daxaLlcZ1fk+5XEash9vKcg8BWqHJ0tv6
	 bAYjE7sIMVEJgiqI3TgDk62JYN42ZLbotJEQyP5s=
Date: Sun, 15 Dec 2024 19:02:40 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, hverkuil@xs4all.nl
Subject: Re: [PATCH v7 3/5] media: Documentation: Update link frequency
 driver documentation
Message-ID: <20241215170240.GH9975@pendragon.ideasonboard.com>
References: <20241210075906.609490-1-sakari.ailus@linux.intel.com>
 <20241210075906.609490-4-sakari.ailus@linux.intel.com>
 <uk6uc7i3v6bpuphqvrhbkqisammkimgbgoas5g4tsakkcbj2jh@d4rss77am2c2>
 <Z1vfK0cUW9sgBPLt@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z1vfK0cUW9sgBPLt@kekkonen.localdomain>

On Fri, Dec 13, 2024 at 07:15:55AM +0000, Sakari Ailus wrote:
> On Thu, Dec 12, 2024 at 05:53:53PM +0100, Jacopo Mondi wrote:
> > On Tue, Dec 10, 2024 at 09:59:04AM +0200, Sakari Ailus wrote:
> > > Add the get_mbus_config() as the means for conveying the link frequency
> > > towards the receiver drivers.
> > >
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > >  Documentation/driver-api/media/tx-rx.rst | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/Documentation/driver-api/media/tx-rx.rst b/Documentation/driver-api/media/tx-rx.rst
> > > index dd09484df1d3..1430c330fd52 100644
> > > --- a/Documentation/driver-api/media/tx-rx.rst
> > > +++ b/Documentation/driver-api/media/tx-rx.rst
> > > @@ -49,6 +49,10 @@ Link frequency
> > >  The :ref:`V4L2_CID_LINK_FREQ <v4l2-cid-link-freq>` control is used to tell the
> > >  receiver the frequency of the bus (i.e. it is not the same as the symbol rate).
> > >
> > > +On devices where the link frequency isn't configurable, the link_freq field of
> > > +struct v4l2_mbus_config is recommended over controls for conveying the link
> > > +frequency to the downstream driver in the pipeline.
> > 
> > When read in its entirety, the paragraphs
> > 
> >  Link frequency
> >  ^^^^^^^^^^^^^^
> > 
> >  The :ref:`V4L2_CID_LINK_FREQ <v4l2-cid-link-freq>` control is used to tell the
> >  receiver the frequency of the bus (i.e. it is not the same as the symbol rate).
> > 
> >  On devices where the link frequency isn't configurable, the link_freq field of
> >  struct v4l2_mbus_config is recommended over controls for conveying the link
> >  frequency.
> > 
> > Sounds simpler without the last 7 words.
> > 
> > A nit and just tastes maybe
> 
> I used:
> 
> On devices where the link frequency isn't configurable, using the ``link_freq``
> field of struct v4l2_mbus_config is recommended over controls.

Is it a recommendation for the transmitter driver or the receiver driver
? If it's a recommendation for the transmitter driver, does that mean it
should not implement V4L2_CID_LINK_FREQ in that case ? How about the
need to expose the link frequency to userspace when it's fixed ?

I think the documentation needs further clarification to clearly explain
what transmitters should do and what receivers should do.

> > 
> > I like where this is going!
> > 
> > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

-- 
Regards,

Laurent Pinchart

