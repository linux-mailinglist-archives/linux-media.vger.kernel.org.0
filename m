Return-Path: <linux-media+bounces-47976-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE42C980C5
	for <lists+linux-media@lfdr.de>; Mon, 01 Dec 2025 16:28:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 710403A35B8
	for <lists+linux-media@lfdr.de>; Mon,  1 Dec 2025 15:28:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B782E32D0D4;
	Mon,  1 Dec 2025 15:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WiDNkItp"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BBD32C948
	for <linux-media@vger.kernel.org>; Mon,  1 Dec 2025 15:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764602873; cv=none; b=q/7/OkHK0ROX4Y9F39RWZHbIz/POHXc5uk+EEuwF96ypR42YBh9wE3lfY05ISOSrPDOaKZr3pGaWh16YEwZ3mH6+LkXe5kI015sxVfXHE9i9dJIFBBd/S0J85gtPE2u7BIWQjdHpN608WyT8Rwvz4x2oWvanHLGVZ3Ys1CilQ7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764602873; c=relaxed/simple;
	bh=Y5lthDoftkEWiUA013MD0XXwyhBvWoZme8GTjowySTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g29/o/6vB+ElwMVIdnmvexmkKSH+JfW+eBHRK+EaWZTQOGBDKWrX2O6acsnMsi7ifJNWkY+/7UMxDzSAvIQ4WpEdmoL/EpP7OmTd1RMJS9cirzgkFT0wk88+mw+VeutB1fcBUrAXOQSAm509XYMpL/PLpNnowPcZ65Y7mCfTv+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WiDNkItp; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764602871; x=1796138871;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Y5lthDoftkEWiUA013MD0XXwyhBvWoZme8GTjowySTo=;
  b=WiDNkItp2ZxgsZ+V4VGYTyFV6qsS5sQQu1LlLCJf92sjHBYVX8IoC9E5
   IN0POdOIWCfQ6apk2IUDssb/PYe0z0hN4CD5uGWp7fdBroRrApHalTN+h
   pIY/1mtsx9UF3usWL0FKmvXt57GEU9FLvDMcz+vRB2g4YmAkMNVoe8Jsg
   WlIUFiJjgdPmFIR7953lZ2sNhO8dejFvQJ3JEXtJ8v+EdWROQTaOLFoGw
   FsT+xgOzDt4xNgYbIk6YYtlhbGuwdc3fzGJ8UF/1ienMqIqmkg4jLdX7x
   TTqlQA5nGycZISw2V8ss0rhXnPCWebuzpf5Q7YVBZLN7khZBMm5i1OOZo
   g==;
X-CSE-ConnectionGUID: SSrzdI/zR36BlPLSWaEuwg==
X-CSE-MsgGUID: 4tAuJcQ1QM6t59GPb5zpoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="70157212"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="70157212"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 07:27:51 -0800
X-CSE-ConnectionGUID: o0SsgrlmQ5CuWPLH/EAc3Q==
X-CSE-MsgGUID: O0wUw0ElTDGxsj/5Be2EKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="193759528"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.19])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 07:27:49 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 4D08D11F8A6;
	Mon, 01 Dec 2025 17:27:52 +0200 (EET)
Date: Mon, 1 Dec 2025 17:27:52 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH 04/14] media: omap3isp: implement enum_fmt_vid_cap/out
Message-ID: <aS2z-PF8L11LPSYq@kekkonen.localdomain>
References: <cover.1760707611.git.hverkuil+cisco@kernel.org>
 <30813a3e81f2d8a6f42f637eba6fba2481b535cf.1760707611.git.hverkuil+cisco@kernel.org>
 <aPiOIoe24l5NNz6z@kekkonen.localdomain>
 <9cd8b533-95fb-4495-a67b-bdf5c7774a74@kernel.org>
 <aS19g3Z38hAAcBkw@kekkonen.localdomain>
 <beaf6c94-c705-476d-a12b-d7ef42c9244c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <beaf6c94-c705-476d-a12b-d7ef42c9244c@kernel.org>

Hi Hans,

On Mon, Dec 01, 2025 at 02:44:44PM +0100, Hans Verkuil wrote:
> On 01/12/2025 12:35, Sakari Ailus wrote:
> > Hi Hans,
> > 
> > On Mon, Dec 01, 2025 at 09:40:58AM +0100, Hans Verkuil wrote:
> >> On 22/10/2025 09:56, Sakari Ailus wrote:
> >>> Hi Hans,
> >>>
> >>> On Fri, Oct 17, 2025 at 03:26:41PM +0200, Hans Verkuil wrote:
> >>>> Add missing ioctls. This makes v4l2-compliance happier:
> >>>>
> >>>> fail: v4l2-test-formats.cpp(516): pixelformat 59565955 (UYVY) for buftype 1 not reported by ENUM_FMT
> >>>> 	test VIDIOC_G_FMT: FAIL
> >>>> fail: v4l2-test-formats.cpp(516): pixelformat 59565955 (UYVY) for buftype 1 not reported by ENUM_FMT
> >>>> 	test VIDIOC_TRY_FMT: FAIL
> >>>> fail: v4l2-test-formats.cpp(516): pixelformat 56595559 (YUYV) for buftype 1 not reported by ENUM_FMT
> >>>> 	test VIDIOC_S_FMT: FAIL
> >>>>
> >>>> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> >>>> ---
> >>>>  drivers/media/platform/ti/omap3isp/ispvideo.c | 34 +++++++++++++++++++
> >>>>  1 file changed, 34 insertions(+)
> >>>>
> >>>> diff --git a/drivers/media/platform/ti/omap3isp/ispvideo.c b/drivers/media/platform/ti/omap3isp/ispvideo.c
> >>>> index 864d38140b87..77beea00d507 100644
> >>>> --- a/drivers/media/platform/ti/omap3isp/ispvideo.c
> >>>> +++ b/drivers/media/platform/ti/omap3isp/ispvideo.c
> >>>> @@ -652,6 +652,38 @@ isp_video_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
> >>>>  	return 0;
> >>>>  }
> >>>>  
> >>>> +static int
> >>>> +isp_video_enum_format(struct file *file, void *fh, struct v4l2_fmtdesc *f)
> >>>> +{
> >>>> +	struct isp_video *video = video_drvdata(file);
> >>>> +	unsigned int i, j;
> >>>> +	unsigned int skip_last_fmts = 1;
> >>>> +
> >>>> +	if (f->type != video->type)
> >>>> +		return -EINVAL;
> >>>> +
> >>>> +	/*
> >>>> +	 * The last two formats have the same pixelformat as the two
> >>>> +	 * formats before them, but they do have different mediabus
> >>>> +	 * codes. So to avoid reporting duplicate pixelformats we skip
> >>>> +	 * those two, provided f->mbus_code is 0.
> >>>> +	 */
> >>>> +	if (!f->mbus_code)
> >>>> +		skip_last_fmts += 2;
> >>>> +	for (i = 0, j = 0; i < ARRAY_SIZE(formats) - skip_last_fmts; i++) {
> >>>> +		if (f->mbus_code && formats[i].code != f->mbus_code)
> >>>> +			continue;
> >>>
> >>> How about, instead of the skip_last_fmts thingy, using this:
> >>>
> >>> 		/* Weed out pixelformats with the same mbus code. */
> >>> 		if (i && formats[i - 1].code == formats[i].code)
> >>> 			continue;
> >>
> >> Good idea, but it should be this:
> >>
> >>                /* Weed out duplicate pixelformats with different mbus codes */
> >>                if (!f->mbus_code && i &&
> >>                    formats[i - 1].pixelformat == formats[i].pixelformat)
> >>                        continue;
> > 
> > I think you shouldn't add !f->mbus_code check here, there's already a check
> > for that right after the for ... line.
> 
> Ah, no. If you search with non-zero f->mbus_code, then you want to
> see all matching formats for that mbus_code.
> 
> Without the '!f->mbus_code' condition you would incorrectly skip entries in
> the formats array.
> 
> E.g. if f->mbus_code is set to MEDIA_BUS_FMT_UYVY8_2X8, then it would fail to
> find V4L2_PIX_FMT_UYVY as a match.

Ack, sounds good.

-- 
Sakari Ailus

