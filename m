Return-Path: <linux-media+bounces-23477-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 546D49F31FD
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 14:52:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D1F41885279
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 13:52:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDB22205E11;
	Mon, 16 Dec 2024 13:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fIelLejl"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56356205E01
	for <linux-media@vger.kernel.org>; Mon, 16 Dec 2024 13:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734357133; cv=none; b=WKFprSUNys3NXzd2i5P411H67ljHyYGTWyUVFpTXT5JhfsT69A5SlnEen3Ncf58i3pdUS3QrN/L6N5/+fL0e1HkAKx3Iad/T0XXIrvZmAPsWrEqN0rlaiAbSIguK0OYqLBGwkcXPT+rAeG0+pRJAcaxI5ewKbMouLMC3fCtsERU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734357133; c=relaxed/simple;
	bh=A2YED6zAMf2K/yVvBSuaChuooHbqiaSuVzB2S8urlxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SYkI9dXSHKPQLOEtcirgrgOn2hXD+cj43fBT7soc9TTd3ypN1/ksQnHP+/vmee9nc66cB8ez/TsMcL5WcFZUQtToD0bim6GaD03z/T9DVixZoo6Qir8X2jJ6PSyIEAtg/lzsoylKEPpIwTutHFon/MFRtCE+1BPFdlLOmpukdJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fIelLejl; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id ED253675;
	Mon, 16 Dec 2024 14:51:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734357093;
	bh=A2YED6zAMf2K/yVvBSuaChuooHbqiaSuVzB2S8urlxQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fIelLejlXcYTGb9eIBAQVi2SRzS7LWow8K3XPiyYZni7CEJoXjUhF9cNKf5PNGNCj
	 XeccQVYkXnmLS4JXL5CSsv1Pa/xJw/WHKhBkezS7IJTvibpYSE4V3lmmMRBNo02/o+
	 0yZqLfZLcDLbdV3pbetJHM0BmFJa8b2R89uZBpXk=
Date: Mon, 16 Dec 2024 15:51:53 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, hverkuil@xs4all.nl
Subject: Re: [PATCH v7 3/5] media: Documentation: Update link frequency
 driver documentation
Message-ID: <20241216135153.GT32204@pendragon.ideasonboard.com>
References: <20241210075906.609490-1-sakari.ailus@linux.intel.com>
 <20241210075906.609490-4-sakari.ailus@linux.intel.com>
 <uk6uc7i3v6bpuphqvrhbkqisammkimgbgoas5g4tsakkcbj2jh@d4rss77am2c2>
 <Z1vfK0cUW9sgBPLt@kekkonen.localdomain>
 <20241215170240.GH9975@pendragon.ideasonboard.com>
 <Z1_fvqg5uuRLDt_A@kekkonen.localdomain>
 <20241216112026.GA24498@pendragon.ideasonboard.com>
 <Z2AXf51lqJMEi-aj@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z2AXf51lqJMEi-aj@kekkonen.localdomain>

On Mon, Dec 16, 2024 at 12:05:19PM +0000, Sakari Ailus wrote:
> On Mon, Dec 16, 2024 at 01:20:26PM +0200, Laurent Pinchart wrote:
> > On Mon, Dec 16, 2024 at 08:07:26AM +0000, Sakari Ailus wrote:
> > > On Sun, Dec 15, 2024 at 07:02:40PM +0200, Laurent Pinchart wrote:
> > > > On Fri, Dec 13, 2024 at 07:15:55AM +0000, Sakari Ailus wrote:
> > > > > On Thu, Dec 12, 2024 at 05:53:53PM +0100, Jacopo Mondi wrote:
> > > > > > On Tue, Dec 10, 2024 at 09:59:04AM +0200, Sakari Ailus wrote:
> > > > > > > Add the get_mbus_config() as the means for conveying the link frequency
> > > > > > > towards the receiver drivers.
> > > > > > >
> > > > > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > > > ---
> > > > > > >  Documentation/driver-api/media/tx-rx.rst | 4 ++++
> > > > > > >  1 file changed, 4 insertions(+)
> > > > > > >
> > > > > > > diff --git a/Documentation/driver-api/media/tx-rx.rst b/Documentation/driver-api/media/tx-rx.rst
> > > > > > > index dd09484df1d3..1430c330fd52 100644
> > > > > > > --- a/Documentation/driver-api/media/tx-rx.rst
> > > > > > > +++ b/Documentation/driver-api/media/tx-rx.rst
> > > > > > > @@ -49,6 +49,10 @@ Link frequency
> > > > > > >  The :ref:`V4L2_CID_LINK_FREQ <v4l2-cid-link-freq>` control is used to tell the
> > > > > > >  receiver the frequency of the bus (i.e. it is not the same as the symbol rate).
> > > > > > >
> > > > > > > +On devices where the link frequency isn't configurable, the link_freq field of
> > > > > > > +struct v4l2_mbus_config is recommended over controls for conveying the link
> > > > > > > +frequency to the downstream driver in the pipeline.
> > > > > > 
> > > > > > When read in its entirety, the paragraphs
> > > > > > 
> > > > > >  Link frequency
> > > > > >  ^^^^^^^^^^^^^^
> > > > > > 
> > > > > >  The :ref:`V4L2_CID_LINK_FREQ <v4l2-cid-link-freq>` control is used to tell the
> > > > > >  receiver the frequency of the bus (i.e. it is not the same as the symbol rate).
> > > > > > 
> > > > > >  On devices where the link frequency isn't configurable, the link_freq field of
> > > > > >  struct v4l2_mbus_config is recommended over controls for conveying the link
> > > > > >  frequency.
> > > > > > 
> > > > > > Sounds simpler without the last 7 words.
> > > > > > 
> > > > > > A nit and just tastes maybe
> > > > > 
> > > > > I used:
> > > > > 
> > > > > On devices where the link frequency isn't configurable, using the ``link_freq``
> > > > > field of struct v4l2_mbus_config is recommended over controls.
> > > > 
> > > > Is it a recommendation for the transmitter driver or the receiver driver
> > > > ? If it's a recommendation for the transmitter driver, does that mean it
> > > > should not implement V4L2_CID_LINK_FREQ in that case ? How about the
> > > > need to expose the link frequency to userspace when it's fixed ?
> > > 
> > > For the transmitter. Receivers do not implement get_mbus_config op. I can
> > > add a note on this.
> > 
> > They don't implement it, but they call it. I wasn't sure if this
> > documentation was from the point of view of the caller or callee. As you
> > mentioned separately that it's located in the transmitter section, that
> > makes it clearer, but we can also improve the test:
> > 
> > Drivers that have a fixed link frequency should report it through the
> > ``.get_mbus_config()`` subdev operation, in the``link_freq`` field of
> > struct v4l2_mbus_config, instead of through controls.
> 
> This isn't correct: the link frequency isn't fixed, it's just not
> user-configurable. How about:
> 
> Drivers that do not have user-configurable link frequency should report it
> through the ``.get_mbus_config()`` subdev pad operation, in the ``link_freq``
> field of struct v4l2_mbus_config, instead of through controls.

I'm OK with that.

> The ReST seems to be in line with the rest.

:-)

-- 
Regards,

Laurent Pinchart

