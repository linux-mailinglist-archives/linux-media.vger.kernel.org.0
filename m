Return-Path: <linux-media+bounces-18284-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 45906978C1C
	for <lists+linux-media@lfdr.de>; Sat, 14 Sep 2024 02:28:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C39D81F25838
	for <lists+linux-media@lfdr.de>; Sat, 14 Sep 2024 00:28:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FC6D1FDA;
	Sat, 14 Sep 2024 00:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Pz/yJxxR"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170111C2E
	for <linux-media@vger.kernel.org>; Sat, 14 Sep 2024 00:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726273680; cv=none; b=PBVZkj2zzDGYYu/EvbeUZJkscvVMriixdqdYgH4TumI+tsMs+wpjcApw531yq2yIbGdRf02P9UB9JeXn0z6kIn6h7UtvERfThPwt+whFEmDYZsTj9+fk6KyCqz/9InGovureiUolBtF2eeLU4sT30GcGGy0jD14rgo5RjqSD9X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726273680; c=relaxed/simple;
	bh=DyHGYEYKhF7rzubNA4Le8NcSJw4dLMlDq6XyizDiJgI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ovP0LbAJYBY8KDxlKc+XS2dT/411kMYlzPOBWObi0pToo2iPDEEVtgxZe2ex2liUUU2DoXZqk5qxBcxt9gOt9NBjTB2D7sEnwH+hUuZA1C1x3hQe59beCXTl3oRGFlolsX8FOUWEAfGjwUxr1s634tm/0o6KwlcK1HA9DuYxx4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Pz/yJxxR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (213-229-8-243.static.upcbusiness.at [213.229.8.243])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CFEF93A4;
	Sat, 14 Sep 2024 02:26:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1726273597;
	bh=DyHGYEYKhF7rzubNA4Le8NcSJw4dLMlDq6XyizDiJgI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pz/yJxxRRe/CgZ79RVTKIgpaO4z7mIz4RSQ3tAr80beqgInFpA9AAWexvEzlPhhLy
	 04mOpUVB9p9z6X8kqjkXu6rp3/uU7tOzWXVDG+wL4QbU8XwH7tIALwJKA5gxvpNdse
	 bJUhDjtJOgsGkRR2b2XC72f3wUBnXFCtz0pas1Jc=
Date: Sat, 14 Sep 2024 03:27:22 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>,
	Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org,
	hverkuil@xs4all.nl
Subject: Re: [PATCH] yavta: Format type errors for non x86 arches
Message-ID: <20240914002722.GA29370@pendragon.ideasonboard.com>
References: <20230920125939.1478-1-ricardo@ribalda.com>
 <ZQruPPVjqbWXAGmL@valkosipuli.retiisi.eu>
 <CAPybu_04iU75nFm3Misv9qQajzGKu9jmLvTX2nwsLn3AAZcdtg@mail.gmail.com>
 <CAMrC3HsbgV23hAQ0T9_97XkhKwn07WOfinXSQ14wZT8SgTfd2g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMrC3HsbgV23hAQ0T9_97XkhKwn07WOfinXSQ14wZT8SgTfd2g@mail.gmail.com>

On Tue, Apr 02, 2024 at 03:59:56PM +0200, Ricardo Ribalda wrote:
> Hi Laurent
> 
> I can see that you updated yavta recently...
> 
> Any chance that you can take a look at this?

Patch applied, sorry for the delay.

> On Fri, Oct 20, 2023 at 9:07 AM Ricardo Ribalda Delgado
> <ricardo@ribalda.com> wrote:
> >
> > @Laurent Pinchart
> >
> > Friendly Ping :)
> >
> > On Wed, Sep 20, 2023 at 10:06 PM Sakari Ailus <sakari.ailus@iki.fi> wrote:
> > >
> > > Hi Ricardo,
> > >
> > > Thanks for the update.
> > >
> > > On Wed, Sep 20, 2023 at 02:59:39PM +0200, Ricardo Ribalda wrote:
> > > > mipsel64el, ppc64el, ia64, ppc64, sparc64 and x32 have different lenghts
> > > > for long long ints, which result in some compilation errors.
> > > >
> > > > Lets add some castings and inttypes macros to help the compiler deal with
> > > > this.
> > > >
> > > > We have to use the castings, because kernel types (__u64 et al) does not
> > > > seem to be compatible with inttypes macros.
> > > >
> > > > Signed-off-by: Ricardo Ribalda <ricardo@ribalda.com>
> > >
> > > It'd be great to address this in the kernel. The kernel UAPI integer types
> > > have been around for a very long time so there could be issues in doing
> > > that, too.
> > >
> > > Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > >
> > > --
> > > Kind regards,
> > >
> > > Sakari Ailus

-- 
Regards,

Laurent Pinchart

