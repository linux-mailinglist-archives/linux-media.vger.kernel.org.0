Return-Path: <linux-media+bounces-37249-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DEAAFFA42
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 08:58:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5590018967DA
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 06:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 904962877FF;
	Thu, 10 Jul 2025 06:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bf8fVuFb"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A4F230BE1
	for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 06:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752130672; cv=none; b=XAt4CsRyOqUWvc5+WuSSt6wzuYxxRwVwvxb7ioofhletrL7F/jjch1XOGz1JBzCvJSF1GawdHd/rjaW5FZSH3G/OPgVLA8FarLCSZxwrErVPsUjuhP87m3N584OKrMuGsCXuyttjFSCGGYeZ5Mo1tMSDgiX6hCIkt+yiI+KINs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752130672; c=relaxed/simple;
	bh=dm7mgqtzCyhhWEiznj9M5z1BLsMDEw4xgdFxd6V0Uhs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CHnj2AgYmKn+m/FMfaK/kIi6az3PaOBLQJNGhXlBTcbIg4Md7c8wdDwQo9iKE5kTBdlT9PJeMkQjvw+AECEVW8O3+7nocYUM6LqjD+wfhb38aDbZhKyPKw9CEV9+fAdqh3iaVTphK95MrsEZ5Xq4mMENBAYUBishekbUNWCqyUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bf8fVuFb; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752130671; x=1783666671;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dm7mgqtzCyhhWEiznj9M5z1BLsMDEw4xgdFxd6V0Uhs=;
  b=Bf8fVuFbzXwwHeMblI03cFj4gaOlw++fkwIUifbDsSvFW19gnEnhs/Xt
   WBCCgVm8Ib7BweWg32OnrGHtYC0qiZbDuj0VwMG7snpinycqRPB+FBmy/
   ak9edp3BA+SJsqghFjwHpwMfQ9QKNsovNyVcOIgCatk04hxh8VLFJZWQz
   4+VCsFE0Z03VgRyRVW8tWIOLxQTDoj74lwnNbuPWM7IOgj+BNIK+5jHBF
   5rYAwSlBRQf2Enob7nyWxZHoEXTgT0wO75IJNSeN842DkEZsdslVAbyb/
   o4K60BshSWgDdPFAoHsHFUQD3yTQbLBm/YyM7JdwxbwiGoyuUC62qWFCN
   Q==;
X-CSE-ConnectionGUID: fycGTBCSShK3l+rQgwbkoA==
X-CSE-MsgGUID: O6FFjrq8S4SkW2owxgJy3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="53513619"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="53513619"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 23:57:50 -0700
X-CSE-ConnectionGUID: hTfNawzMTLubTNbKGpg6Hw==
X-CSE-MsgGUID: GYIsxoz0RJ+oP1EQ2tSzjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="155633889"
Received: from opintica-mobl1 (HELO kekkonen.fi.intel.com) ([10.245.244.54])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 23:57:49 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 8C2691207A2;
	Thu, 10 Jul 2025 09:57:45 +0300 (EEST)
Date: Thu, 10 Jul 2025 06:57:45 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, bingbu.cao@linux.intel.com,
	stanislaw.gruszka@linux.intel.com, tian.shu.qiu@intel.com,
	tomi.valkeinen@ideasonboard.com
Subject: Re: [PATCH 05/13] media: v4l: Make media_entity_to_video_device()
 NULL-safe
Message-ID: <aG9kaXXtVOSVPNpF@kekkonen.localdomain>
References: <20250619081546.1582969-1-sakari.ailus@linux.intel.com>
 <20250619081546.1582969-6-sakari.ailus@linux.intel.com>
 <20250619152033.GG32166@pendragon.ideasonboard.com>
 <aFQ3c-fI29YZ7dEe@kekkonen.localdomain>
 <20250708115616.GE1821@pendragon.ideasonboard.com>
 <aG0I1eoY0gwgE85O@kekkonen.localdomain>
 <20250708161747.GA23181@pendragon.ideasonboard.com>
 <aG7K-xBVC8cmg3z6@kekkonen.localdomain>
 <20250709205449.GA22436@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709205449.GA22436@pendragon.ideasonboard.com>

On Wed, Jul 09, 2025 at 11:54:49PM +0300, Laurent Pinchart wrote:
> On Wed, Jul 09, 2025 at 08:03:07PM +0000, Sakari Ailus wrote:
> > Hi Laurent,
> > 
> > On Tue, Jul 08, 2025 at 07:17:47PM +0300, Laurent Pinchart wrote:
> > > On Tue, Jul 08, 2025 at 12:02:29PM +0000, Sakari Ailus wrote:
> > > > On Tue, Jul 08, 2025 at 02:56:16PM +0300, Laurent Pinchart wrote:
> > > > > On Thu, Jun 19, 2025 at 04:14:43PM +0000, Sakari Ailus wrote:
> > > > > > On Thu, Jun 19, 2025 at 06:20:33PM +0300, Laurent Pinchart wrote:
> > > > > > > On Thu, Jun 19, 2025 at 11:15:38AM +0300, Sakari Ailus wrote:
> > > > > > > > Make media_entity_to_video_device(NULL) return NULL, instead of an invalid
> > > > > > > > pointer value.
> > > > > > > > 
> > > > > > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > > > > ---
> > > > > > > >  include/media/v4l2-dev.h | 14 ++++++++++----
> > > > > > > >  1 file changed, 10 insertions(+), 4 deletions(-)
> > > > > > > > 
> > > > > > > > diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
> > > > > > > > index 1b6222fab24e..069c2f14b473 100644
> > > > > > > > --- a/include/media/v4l2-dev.h
> > > > > > > > +++ b/include/media/v4l2-dev.h
> > > > > > > > @@ -313,10 +313,16 @@ struct video_device {
> > > > > > > >   * media_entity_to_video_device - Returns a &struct video_device from
> > > > > > > >   *	the &struct media_entity embedded on it.
> > > > > > > >   *
> > > > > > > > - * @__entity: pointer to &struct media_entity
> > > > > > > > - */
> > > > > > > > -#define media_entity_to_video_device(__entity) \
> > > > > > > > -	container_of(__entity, struct video_device, entity)
> > > > > > > > + * @__entity: pointer to &struct media_entity, may be NULL
> > > > > > > > + */
> > > > > > > > +#define media_entity_to_video_device(__entity)				\
> > > > > > > > +	({								\
> > > > > > > > +		typeof (__entity) __me_to_vdev_ent = __entity;		\
> > > 
> > > This should be __me_vdev_ent to align the naming with
> > > media_entity_to_v4l2_subdev().
> > > 
> > > > > > > > +									\
> > > > > > > > +		__me_to_vdev_ent ? container_of(__me_to_vdev_ent,	\
> > > > > > > > +						struct video_device, entity) : \
> > > 
> > > And here you should write
> > > 
> > > 	__me_to_vdev_ent ?						   \
> > > 		container_of(__me_vdev_ent, struct video_device, entity) : \
> > > 		NULL;							   \
> > 
> > I'm fine wrap after '?' as well, but another wrap is needed due to
> > indentation in any case.
> 
> I didn't make it clear, my comment was about replicating the style of
> media_entity_to_v4l2_subdev().

Ok, I'll use that in v3.

-- 
Sakari Ailus

