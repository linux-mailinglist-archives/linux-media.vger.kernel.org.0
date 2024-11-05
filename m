Return-Path: <linux-media+bounces-20904-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B4F9BC996
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 10:51:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9DBB1F22C0D
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 09:51:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58EC81D0E26;
	Tue,  5 Nov 2024 09:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="H03Ncxyw"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2914B1CF297
	for <linux-media@vger.kernel.org>; Tue,  5 Nov 2024 09:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730800276; cv=none; b=U9ANJYLkCyHFT775tS6f+H99gb0OTNstUwOi4VEDZ5TFb1wnjwWFOHIEogc8NCF2o2xhcPhZG2GcDaMIBC7xbbKvqlf4K3zd2fmbR84wd1yb4/duKpraOCK92xzIskGh+Fd6+slpKQU+XOMezZJweUUsR/VGORzs72aeQTf49f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730800276; c=relaxed/simple;
	bh=xpqgCD7+ej9fagYt+sFuPaA2mXVkg6U597ynLL//+vs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o41rM3LZRlUXy8pFKjkEgyl9uNG8gBX4BKQT3osQfQo91MoYMOkB9Por6Kle62AtZIlyuP4p9XwOkb7sr0S/Gi+HLWLVuyJYEDbEm7Cx9JkzdZd2L8YQZoRmOFkEl6Q1Al2yd2DhsaIOEi5expk5ymwT6InkzwJzNavYg8Q+880=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=H03Ncxyw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0CE9421C;
	Tue,  5 Nov 2024 10:51:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730800262;
	bh=xpqgCD7+ej9fagYt+sFuPaA2mXVkg6U597ynLL//+vs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H03NcxywNcPcW28LTMLsYVHBJsbvKCXt6SHQmEkBKSrif4yl8Ng94kKpF00chXvoY
	 dRbj3F+nurOy1pLTz6HdcMDRCLgNWvivUAHBwbJ2TOxB10cEgK7G4PDtD7muxL5W3H
	 3DgeJ7p07InaNtaOSJfQVQsdCeKEhVPB4VWGBgro=
Date: Tue, 5 Nov 2024 11:50:58 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Wang, Hongju" <hongju.wang@intel.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"bingbu.cao@linux.intel.com" <bingbu.cao@linux.intel.com>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>
Subject: Re: [PATCH] media: intel/ipu6: Set the VC of the stream as the SOF
 event id
Message-ID: <20241105095058.GL27775@pendragon.ideasonboard.com>
References: <20241024032201.3867638-1-hongju.wang@intel.com>
 <Zxoh36bkJaDQIvME@kekkonen.localdomain>
 <CY8PR11MB7171773036C246F09DC2756EEF512@CY8PR11MB7171.namprd11.prod.outlook.com>
 <Zyh-Q7P2szvQxJ5z@kekkonen.localdomain>
 <20241104082503.GP2473@pendragon.ideasonboard.com>
 <CY8PR11MB717102F35BB74D8AEFD461F9EF522@CY8PR11MB7171.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CY8PR11MB717102F35BB74D8AEFD461F9EF522@CY8PR11MB7171.namprd11.prod.outlook.com>

On Tue, Nov 05, 2024 at 03:23:50AM +0000, Wang, Hongju wrote:
> On Monday, November 4, 2024 4:25 PM, Laurent Pinchart wrote:
> > On Mon, Nov 04, 2024 at 07:56:51AM +0000, Sakari Ailus wrote:
> > > On Mon, Nov 04, 2024 at 03:07:58AM +0000, Wang, Hongju wrote:
> > > > On Thursday, October 24, 2024 6:31 PM, Sakari Ailus wrote:
> > > > > On Thu, Oct 24, 2024 at 11:22:01AM +0800, Hongju Wang wrote:
> > > > > > In the virtual channel case, they should use v4l2_event.id to
> > > > > > distinguish SOF events of different streams. Therefore, we set
> > > > > > the virtual channel number of the stream as the SOF event ID. This number is unique.
> > > > > >
> > > > > > Signed-off-by: Hongju Wang <hongju.wang@intel.com>
> > > > > > ---
> > > > > >  drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 1 +
> > > > > >  1 file changed, 1 insertion(+)
> > > > > >
> > > > > > diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> > > > > > b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> > > > > > index 051898ce53f4..5ad426afa0f0 100644
> > > > > > --- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> > > > > > +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> > > > > > @@ -578,6 +578,7 @@ void ipu6_isys_csi2_sof_event_by_stream(struct ipu6_isys_stream *stream)
> > > > > >  		.type = V4L2_EVENT_FRAME_SYNC,
> > > > > >  	};
> > > > > >
> > > > > > +	ev.id = stream->vc;
> > > > > >  	ev.u.frame_sync.frame_sequence = atomic_fetch_inc(&stream->sequence);
> > > > > >  	v4l2_event_queue(vdev, &ev);
> > > > > >
> > > > >
> > > > > The id field in struct v4l2_event isn't used for the FRAME_SYNC
> > > > > event and also the virtual channel isn't communicated to the user space currently.
> > > >
> > > >   How to use the id field? User space should use SOF to do FRAME_SYNC,
> > > >   but the v4l2_event doesn't distinguish different streams. Do you have
> > > >   any good suggestions?
> > >
> > > Ah, now I think I do understand the problem. The events are produced by the
> > > CSI-2 receiver sub-device but there are multiple streams and the event
> > > isn't stream-aware?
> > >
> > > It's nice that the id field of the FRAME_SYNC event isn't in use for
> > > any other purpose. This should be taken into account in event
> > > subscription, too.
> > >
> > > I'll add a patch documenting this in the metadata series. Any thoughts?
> > 
> > I think we could use the id field for this purpose, but maybe not to
> > report the VC. Userspace isn't VC-aware, we should instead convert the VC
> > to a stream.
>
> Do you mean that we use a stream id? But which stream is used isn't fixed.
> Only when video streams on, we select a stream for it. Which sensor uses
> Which VC is fixed by sensor driver.  

The event isn't generated until you start streaming, so by that time you
should be able to convert the VC to a stream ID.

The VC can't easily be used by userspace, as there's no way for an
application to map VCs to streams. To make this API really usable, we
need something that applications can meaningfully use. I would like to
see a userspace implementation (ideally in libcamera) to showcase that
the API works as expected. 

> > > Cc Laurent and Hans.

-- 
Regards,

Laurent Pinchart

