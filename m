Return-Path: <linux-media+bounces-18635-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57308987312
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 13:49:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 189B4287F53
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 11:49:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB12714C59B;
	Thu, 26 Sep 2024 11:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hWlUtrd2"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B969216D33F
	for <linux-media@vger.kernel.org>; Thu, 26 Sep 2024 11:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727351310; cv=none; b=Tj4KnhwOnr2TBgjKQi86ESks66pAK8MNZBPM5gnH7Sh5/p2d0L8T0pJs4paEUuetkMmu2ndT3v5lG3OVy6sgS2wD/gWTaaa+JQg9I2DnIzrDsqHlS921/w5XyAZp0yRy25Qae2M1f1kgZ3TeZIXxJpYDsVchpo0HNHvDJVgu2Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727351310; c=relaxed/simple;
	bh=ja1hGFV8JVAUbp2qgrWoco/kNqCxhfatdJQbe9k8aew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pDggIW+s2f0EWtXyNOf6QfX1f0+vL9W5FswtsgO+Ooln6nNaLBMogr6MXlcmcsU10oj7jamdcxeftoAfi50yEsZtsOsVwyKQ5vaqe5UsVHvCW4tn0D7FmlJxtuA/NFyg9BJ4yx5mc9LLQBNnYyuHcsoFA2iHjdzfGakMFYDeyHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hWlUtrd2; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727351309; x=1758887309;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ja1hGFV8JVAUbp2qgrWoco/kNqCxhfatdJQbe9k8aew=;
  b=hWlUtrd2NXK8ZlckPq28MIqACyjJQUL7wpPKgOz20megv3DDfNdQVFIo
   QBbiTmCwoF4u8QqC4G8MqTC8W02fVng6HVTlnV0eTTYK9mnJJ0ImaFsjU
   lPYa7QhDyHtky7Gi37J2pfqUjVNN9ISZF0joV29065XnUU8Odl/hlacTg
   L2ndmEy3xMqXukxz1O8MToBPZpTzoTJ1yYooNYki10sMhnC3F22TOBJU4
   UlssRjl12vHdNOUxoFEmgbzQ2tXV2PiSGyjlLGafRmSbCjbQk6LztTzQx
   IF2qJKceCCfoqFcqUs7b5M91Jb96nyAI5TQ/5J4wNGhnIoCoNQjm6QsP4
   Q==;
X-CSE-ConnectionGUID: lshUros2Q3GL7hmnMlmQoA==
X-CSE-MsgGUID: sXqvmQ4RTcuHmXWJItMBlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="37582821"
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; 
   d="scan'208";a="37582821"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 04:48:28 -0700
X-CSE-ConnectionGUID: boB5jPh7SAK/JIGof3Pq9w==
X-CSE-MsgGUID: XA72ZF8XSYqr3T7rK3OSag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; 
   d="scan'208";a="77045018"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 04:48:22 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id D113011F843;
	Thu, 26 Sep 2024 14:48:19 +0300 (EEST)
Date: Thu, 26 Sep 2024 11:48:19 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Martin Hecht <martin.hecht@avnet.eu>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Alain Volmat <alain.volmat@foss.st.com>, Sean Young <sean@mess.org>,
	Steve Cho <stevecho@chromium.org>, Tomasz Figa <tfiga@chromium.org>,
	Hidenori Kobayashi <hidenorik@chromium.org>,
	"Hu, Jerry W" <jerry.w.hu@intel.com>,
	Suresh Vankadara <svankada@qti.qualcomm.com>,
	Devarsh Thakkar <devarsht@ti.com>, r-donadkar@ti.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Salahaldeen Altous <salahaldeen.altous@leica-camera.com>
Subject: Re: [ANN] Media Summit September 16th: Final Agenda (v7)
Message-ID: <ZvVKA3wYERfgrh9f@kekkonen.localdomain>
References: <20240925195843.GK30399@pendragon.ideasonboard.com>
 <902b2828-5eb8-4741-90af-8e42f1240e86@xs4all.nl>
 <ZvUpuopPY8lwBHEm@kekkonen.localdomain>
 <20240926121914.69b47a50@foz.lan>
 <20240926102448.GA21788@pendragon.ideasonboard.com>
 <ZvU49mrccFlKDhD0@kekkonen.localdomain>
 <20240926104022.GD21788@pendragon.ideasonboard.com>
 <CANiDSCvMmd0eQCWHj6rt0u8nu0uVnDbYT=GJsobxHGOHE74DZw@mail.gmail.com>
 <ZvU9c4bYhMSXbIbD@kekkonen.localdomain>
 <CANiDSCv5Tsh=rq7M0CBT7tODEzsnK+P5zBuwu9QwnsCU2S=zsw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiDSCv5Tsh=rq7M0CBT7tODEzsnK+P5zBuwu9QwnsCU2S=zsw@mail.gmail.com>

Hi Ricardo,

On Thu, Sep 26, 2024 at 12:59:35PM +0200, Ricardo Ribalda wrote:
> Hi
> 
> On Thu, 26 Sept 2024 at 12:54, Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
> > Hi Ricardo,
> >
> > On Thu, Sep 26, 2024 at 12:46:49PM +0200, Ricardo Ribalda wrote:
> > > > > > I'd argue that even a missing SoB may not be a cause for rebase if it's
> > > > > > an accident, but that's not worth debating because CI will make sure
> > > > > > this never happens.
> > > > >
> > > > > Does it?
> > > > >
> > > > > checkpatch.pl checks should just be warnings. And that should probably
> > > > > stay. Sob: and From: being different isn't necessarily that far-fetched as
> > > > > having an address in .mailmap may change From: field but not Sob:,
> > > > > resulting in a checkpatch.pl warning.
> > > > >
> > > > > I wonder if checkpatch.pl should know about .mailmap actually, currently it
> > > > > doesn't. I could send a patch.
> > > >
> > > > We have an explicit check in the CI to ensure that both the author and the
> > > > committer have a SoB line. It's not base on checkpatch.pl. Ricardo,
> > > > could you confirm this ?
> > >
> > > CI checks that there are at least 2 committers that agree with the
> > > code (SoB, Reviewed-by or Ack-by)
> > > https://gitlab.freedesktop.org/linux-media/media-ci/-/blob/main/lib/test-trust.py?ref_type=heads
> > >
> > > We also have a separate check for SoB:
> > > https://gitlab.freedesktop.org/linux-media/media-ci/-/blob/main/test-media-patchstyle.sh?ref_type=heads#L61
> >
> > This script appears to be also ignoring .mailmap.
> test-trust does not ignore mailmap:
> https://gitlab.freedesktop.org/linux-media/media-ci/-/blob/main/lib/test-trust.py?ref_type=heads#L56

Ack, nice!

> 
> Do you see any scenario where the committer and the author are
> different users? "git commit" will set the same value for boths
> I am not against to modify the code if we find that usecase

Not apart from the From: e-mail address change due to .mailmap.

-- 
Kind regards,

Sakari Ailus

