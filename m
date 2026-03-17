Return-Path: <linux-media+bounces-56004-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uC0WLP0TuWkmpQEAu9opvQ
	(envelope-from <linux-media+bounces-56004-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 09:42:37 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2595B2A5D06
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 09:42:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D6B513038A40
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 08:41:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B23939890F;
	Tue, 17 Mar 2026 08:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fy8OLmka"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CC139023D;
	Tue, 17 Mar 2026 08:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773736897; cv=none; b=ZsxmCSjUnJ+bcOUMRdlWEqkM/1IMaVOdeMUAfgs/Vw+W7kz1lhEA1k2q+xrByfhnj6oaUWfKLZT6kismNE2cPUCKeBj92hqCqZhblXeAkTrPy8c2hwRuEjlNlM/4xlrj491aEvJmenBHFHoiyr5SbtH32XxHjBOtENL5JELdPOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773736897; c=relaxed/simple;
	bh=PTJu7iPOEn7SeWEIfKSmDqJyWOq/q4peMR2VEhR3SMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VasMtClrvh7AFp60dtKv8wVI7WiYGIB8Bn/Px6zLluLQL6LFMOhCugbw9yN6khySssPuX4LhEJMvOBY4ne/zUAAqOhOqUgMdrBBJ1u5+JJszsTV+Aq5T5SWWVbaYn2a4NmeIB9nD0XpiZRf14y1dGLAGYLwh5sA//av571vXQv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fy8OLmka; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773736896; x=1805272896;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PTJu7iPOEn7SeWEIfKSmDqJyWOq/q4peMR2VEhR3SMU=;
  b=fy8OLmka7IZpcIMvASsEQqHKkdGX9q4bFXk0odR680+/utS97i16Gdfe
   8V99UVEap8rIZ/NUC7/FSz/4f8piyojGEYPLbAuhu+JwOE9hEcZsV3PqJ
   vmE9FV7dnh9BC9pJGGb90urpQUygizlPniVl897rkMXozCghhLnapRs6c
   2M18JoZdH900KNmqk/6Aa3hhGC5pE52cuqrif23kdMPbC/LTCrKHoIyIx
   QweNQEHANPBmQNgxnHBFQPSilc0926hKRfOCpeMGD0p/bSSomeFl+NmBn
   bmHaV13ilJL35uSEVgFMhw6hCo6Ik4c0MiyHVUte+2i0eYwjnR2I7GYjx
   w==;
X-CSE-ConnectionGUID: kTtwnZ/ORFCAA9OU9+Cz3w==
X-CSE-MsgGUID: YQXY5PHpS8GrWEAgqns53Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="74796288"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="74796288"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 01:41:35 -0700
X-CSE-ConnectionGUID: 3GhYgA/TS8mU8GS/Gl033Q==
X-CSE-MsgGUID: +gei1HHLQiGaAR2GKDriMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="252691923"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.106])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 01:41:33 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5D450121D04;
	Tue, 17 Mar 2026 10:41:32 +0200 (EET)
Date: Tue, 17 Mar 2026 10:41:32 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jai Luthra <jai.luthra@ideasonboard.com>
Subject: Re: [PATCH 3/3] media: subdev: Split
 v4l2_subdev_get_frame_desc_passthrough() into locked and unlocked
Message-ID: <abkTvGa5EQU4Zo8t@kekkonen.localdomain>
References: <20260312-frame-desc-passthrough-impro-v1-0-30f64d637a3a@ideasonboard.com>
 <20260312-frame-desc-passthrough-impro-v1-3-30f64d637a3a@ideasonboard.com>
 <abkKnm10SapsRPhe@kekkonen.localdomain>
 <78e4add8-c156-44d9-aa86-49bf87ce2398@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78e4add8-c156-44d9-aa86-49bf87ce2398@ideasonboard.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56004-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: 2595B2A5D06
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Moi,

On Tue, Mar 17, 2026 at 10:37:12AM +0200, Tomi Valkeinen wrote:
> Hi,
> 
> On 17/03/2026 10:02, Sakari Ailus wrote:
> > Moi,
> > 
> > On Thu, Mar 12, 2026 at 02:15:30PM +0200, Tomi Valkeinen wrote:
> >> The recently added v4l2_subdev_get_frame_desc_passthrough() can be used
> >> directly as an implementation for .get_frame_desc subdev op. However, in
> >> some cases the drivers may want to add some customizations, while the
> >> bulk of the work is still identical to what
> >> v4l2_subdev_get_frame_desc_passthrough() does. Current locking scheme
> >> makes this impossible to do properly.
> >>
> >> Split v4l2_subdev_get_frame_desc_passthrough() into two functions:
> >>
> >> v4l2_subdev_get_frame_desc_passthrough_locked(), which takes a locked
> >> subdev state as a parameter, instead of locking and getting the active
> >> state internally. Other than that, it does the same as
> >> v4l2_subdev_get_frame_desc_passthrough() used to do.
> >>
> >> v4l2_subdev_get_frame_desc_passthrough(), which locks the active state
> >> and calls v4l2_subdev_get_frame_desc_passthrough_locked().
> >>
> >> In other words, v4l2_subdev_get_frame_desc_passthrough() works as
> >> before, but drivers can now alternatively add custom .get_frame_desc
> >> code and call v4l2_subdev_get_frame_desc_passthrough().
> >>
> >> An example use case is with DS90UB953 serializer: in normal use the
> >> serializer passes through everything, but when test-pattern-generator
> >> (TPG) is used, an internal TPG source is used. After this commit, the
> >> UB953 get_frame_desc() can lock the state, look at the routing table to
> >> see if we're in normal or TPG mode, then either call
> >> v4l2_subdev_get_frame_desc_passthrough_locked() if in normal mode, or
> >> construct a TPG frame desc if in TPG mode.
> >>
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> >> ---
> >>  drivers/media/v4l2-core/v4l2-subdev.c | 46 ++++++++++++++++++++---------------
> >>  include/media/v4l2-subdev.h           | 38 +++++++++++++++++++++++++----
> >>  2 files changed, 59 insertions(+), 25 deletions(-)
> >>
> >> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> >> index 2757378c628a..8b1a7f00c86b 100644
> >> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> >> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> >> @@ -2545,21 +2545,19 @@ int v4l2_subdev_s_stream_helper(struct v4l2_subdev *sd, int enable)
> >>  }
> >>  EXPORT_SYMBOL_GPL(v4l2_subdev_s_stream_helper);
> >>  
> >> -int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
> >> -					   unsigned int pad,
> >> -					   struct v4l2_mbus_frame_desc *fd)
> >> +int v4l2_subdev_get_frame_desc_passthrough_locked(struct v4l2_subdev *sd,
> >> +						  struct v4l2_subdev_state *state,
> >> +						  unsigned int pad,
> >> +						  struct v4l2_mbus_frame_desc *fd)
> >>  {
> >>  	struct media_pad *local_sink_pad;
> >>  	struct v4l2_subdev_route *route;
> >> -	struct v4l2_subdev_state *state;
> >>  	struct device *dev = sd->dev;
> >>  	int ret = 0;
> >>  
> >>  	if (WARN_ON(!(sd->entity.pads[pad].flags & MEDIA_PAD_FL_SOURCE)))
> >>  		return -EINVAL;
> >>  
> >> -	state = v4l2_subdev_lock_and_get_active_state(sd);
> > 
> > This variant appears to be unlocked rather than locked.
> 
> The variant expects locked parameters, thus "locked". This is widely

From the name I'd expect otherwise. But...

> used at least on DRM drivers.

it maybe used in DRM for that but this isn't DRM. :-)

> 
> > Could you instead use two underscores as a prefix to the same name? That's
> > an established practice.
> I can do that, although I don't personally like it. Double underscore
> hints at an internal function, something that shouldn't be called
> normally, whereas this is not internal or anything to avoid.

Or know what you're doing. You could add a lockdep annotation while at it.

-- 
Sakari Ailus

