Return-Path: <linux-media+bounces-42800-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0938DB896D2
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 14:21:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA3551C87F6E
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 12:22:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 118423101DC;
	Fri, 19 Sep 2025 12:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kcj1M3qn"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AFD30FF08
	for <linux-media@vger.kernel.org>; Fri, 19 Sep 2025 12:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758284505; cv=none; b=tr4beXAEYLIEuDcOqJv4vLuj2wvv7+PDr10B9kK1QR7PwgXopHDpGRJu8xP5iWJLUfGMMc3KOAthBWzbZur/S/NN571YwZzhCJrNITmFaP+wvvULZsARMRdypAHWHVyNbiXl94mwvNcsWrA2SulD7u3kmq0X+oHrfslj2eQrY3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758284505; c=relaxed/simple;
	bh=7c3/f6Lod8UpuaZuQfGYAJayG1yNoOrCzTU0Ab2/TNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m/cCWtPLRuCCwHJBa+QRFDS3qScvRhWVzYMOij9aDz1zlAQEBkWJDT0UX38X/nbM9Kn05j+4cXI7ByWjEarb122JqP2FPP+P/qEZbDnbIDjWmOePtX+eC2nAvyjg0Pz4lXhlXdLbL1iHMpxA7fTtTg45gNzyhEoKPiUcKcFRx+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kcj1M3qn; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758284503; x=1789820503;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7c3/f6Lod8UpuaZuQfGYAJayG1yNoOrCzTU0Ab2/TNc=;
  b=kcj1M3qnvC6zaJEIw+KNElPSTGw/g+EKL37unhUMs0dW/DCXHQlKgkkG
   SZXMKhMIWP1FxXxbyyIcIPfIXYGZ7bKOZU+/rNKI3E8HbmyRsKalxgljh
   gQ7jjKd71hV2zuqprP8QBvH1X/ZfSsTIUHv5kRLTxzdu58cgS7CJt9ZDP
   98Yuhcu4cLHmMv1M/GC+d54yGUzixK/4+AFu063vsscSdtL+lLbAXoKgI
   +Mli0qaaX8BOECx5fY1dR7x8dMTOWiq6F6/7Vp3qE/U2XnfrWytDIimg5
   S64gP0Hrokkl4QEEKU+58hN6Vg7YHqiiiZZq0TlcGerMDhbGXBHGliXGd
   Q==;
X-CSE-ConnectionGUID: A/wOf+5XQfu0DVH8cIwvJw==
X-CSE-MsgGUID: Mbrg3eotSe+9FxQjRwBMwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="78237155"
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="78237155"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 05:21:43 -0700
X-CSE-ConnectionGUID: O/QZUV8xRMGv6MH7yG2N6w==
X-CSE-MsgGUID: nMW8igO0TC2tKiWheIMrsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="180075837"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.108])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 05:21:27 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 3385F11F95D;
	Fri, 19 Sep 2025 15:21:24 +0300 (EEST)
Date: Fri, 19 Sep 2025 15:21:24 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	"Wang, Hongju" <hongju.wang@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v11 40/66] media: Document enable_streams and
 disable_streams behaviour
Message-ID: <aM1KxKtTM-PooU4l@kekkonen.localdomain>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-41-sakari.ailus@linux.intel.com>
 <20250903212935.GA3648@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903212935.GA3648@pendragon.ideasonboard.com>

Hi Laurent,

On Wed, Sep 03, 2025 at 11:29:35PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Mon, Aug 25, 2025 at 12:50:41PM +0300, Sakari Ailus wrote:
> > Document that enable_streams may start additional streams and
> > disable_streams may not disable requested streams if other related streams
> > are still enabled.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  include/media/v4l2-subdev.h | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > index 4b28086808c9..96a9c869ffb1 100644
> > --- a/include/media/v4l2-subdev.h
> > +++ b/include/media/v4l2-subdev.h
> > @@ -814,6 +814,10 @@ struct v4l2_subdev_state {
> >   *	V4L2_SUBDEV_CAP_STREAMS sub-device capability flag can ignore the mask
> >   *	argument.
> >   *
> > + *	Starting the requested streams may require starting additional
> > + *	streams. Streams that are started together due to hardware are called a
> > + *	stream group.
> 
> I initially interpreted this as meaning that, to start the requested
> streams at the hardware level, the caller may need to start additional
> streams. That is, the .enable_streams() call may not have any effect
> until other streams are also started by the caller.

Correct.

> 
> > + *
> >   * @disable_streams: Disable the streams defined in streams_mask on the given
> >   *	source pad. Subdevs that implement this operation must use the active
> >   *	state management provided by the subdev core (enabled through a call to
> > @@ -823,6 +827,9 @@ struct v4l2_subdev_state {
> >   *	Drivers that support only a single stream without setting the
> >   *	V4L2_SUBDEV_CAP_STREAMS sub-device capability flag can ignore the mask
> >   *	argument.
> > + *
> > + *	A stream is only disabled once all streams in the stream group are
> > + *	disabled.

> But this implies it's the other way around. A clarification is needed.
> Which behaviour are you trying to document ?

This should have been:

 *	A stream group is disabled when one or more streams in the stream
 *	group are disabled.

-- 
Kind regards,

Sakari Ailus

