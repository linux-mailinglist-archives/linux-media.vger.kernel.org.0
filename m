Return-Path: <linux-media+bounces-25929-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E35A2F003
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 15:39:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 97B52161B0D
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 14:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11C5F23C39B;
	Mon, 10 Feb 2025 14:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YAztzmbD"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9F923C369
	for <linux-media@vger.kernel.org>; Mon, 10 Feb 2025 14:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739198248; cv=none; b=JV2Ca33P01v20Bf7QuCxTlDKHIp1NHVF5urXKxkxRMTJlSCZcoSjUcWDEnqf+7LAa63HQoNUc4L30NRa20rVdr+0VEOqNArGX23awGnBakJAoaFSXhDgf4Tp5/sJrWWmdiEJfAn+DJVx7BWo3/iyX50XNcX0LYgnB/S1Giq2Vew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739198248; c=relaxed/simple;
	bh=cmcGZdByBpIwWXiCFPQx7UlhtAnaLVdfFIV/Cjv4AqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zi65Wnz1+hAnwCLXHAsUvU0EIuboyxa8M1mRigo5Zndpr/Oj8aUZ6jknvM72MsQb5ftlYjTX+oUWHi2b2t3fe3v+yjZHHRG6HfRcO8Vl8zN3sKAI3h0CpAreyqEd4tCOpgna8L+ZP/wbhK2xhtwAGIV/zhpmPVC7QPjSPMfq8ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YAztzmbD; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739198247; x=1770734247;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cmcGZdByBpIwWXiCFPQx7UlhtAnaLVdfFIV/Cjv4AqU=;
  b=YAztzmbDjNNS7Lr7WS/iLnA9WB1BR13guIKZm/11Y4PGrREq+oYaGl3e
   MCVJzQ9/o9EQ151NEzXDme0umOdsOdAhoU2sJr0PUpb8TnLlIm+41LDLj
   RjUCfrIqbj5R9byklK2F4AQhF24bgYSjupQc82STjEwZQ16ZVKULg7O/+
   sSEEHl7vLDDLAT16McnfDMN7XJWytR76a4S6girwT2dBwTEJgv6RkB3di
   FgMGB3yVovQxQY9mjhWwwyEABalrm0dxYoENix217ctVBAwbHOs3tvxpX
   1SLnS+mcFqkY+CeVMX/AARfTHegtTd9d2TCylG3rz6XMtQP/dbXj3JZlz
   w==;
X-CSE-ConnectionGUID: W81VbkLVSHGS0C8EdCrp+Q==
X-CSE-MsgGUID: Lr1rtT7ET7SjJ6oq9L+1bw==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="50012408"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="50012408"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 06:37:26 -0800
X-CSE-ConnectionGUID: 6wYIR3EXSn2xKrAchxlTaA==
X-CSE-MsgGUID: Ll2p2A85SX6OAZ/aYZe3bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="112145091"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 06:37:20 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C5C5711F8D9;
	Mon, 10 Feb 2025 16:37:17 +0200 (EET)
Date: Mon, 10 Feb 2025 14:37:17 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
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
	Hans de Goede <hdegoede@redhat.com>
Subject: Re: [RFC v5 07/15] media: uapi: Add V4L2_CID_COLOUR_PATTERN for
 describing colour patterns
Message-ID: <Z6oPHQBiWRvduD8H@kekkonen.localdomain>
References: <20250203085853.1361401-1-sakari.ailus@linux.intel.com>
 <20250203085853.1361401-8-sakari.ailus@linux.intel.com>
 <d01e7921-4b50-47c5-8374-d55159a47cee@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d01e7921-4b50-47c5-8374-d55159a47cee@xs4all.nl>

Hi Hans,

On Mon, Feb 10, 2025 at 09:57:08AM +0100, Hans Verkuil wrote:
> Hi Sakari,
> 
> On 03/02/2025 09:58, Sakari Ailus wrote:
> > Add V4L2_CID_COLOUR_PATTERN to tell the camera sensor's native colour
> > pattern.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  .../userspace-api/media/v4l/ext-ctrls-image-source.rst | 10 ++++++++++
> >  drivers/media/v4l2-core/v4l2-ctrls-defs.c              |  1 +
> >  include/uapi/linux/v4l2-controls.h                     |  6 ++++++
> >  3 files changed, 17 insertions(+)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > index 71f23f131f97..fca729512b6f 100644
> > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > @@ -92,3 +92,13 @@ Image Source Control IDs
> >      representing a gain of exactly 1.0. For example, if this default value
> >      is reported as being (say) 128, then a value of 192 would represent
> >      a gain of exactly 1.5.
> > +
> > +``V4L2_CID_COLOUR_PATTERN (integer)``
> 
> Please use 'COLOR' instead of 'COLOUR' to be consistent with other color related
> control names. So do a search-and-replace for this in code and documentation.

Ack, I'll address this in v6.

-- 
Regards,

Sakari Ailus

