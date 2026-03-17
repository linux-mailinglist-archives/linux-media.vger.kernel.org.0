Return-Path: <linux-media+bounces-55999-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +GKzLfkKuWk/ngEAu9opvQ
	(envelope-from <linux-media+bounces-55999-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 09:04:09 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BB52A5410
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 09:04:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 03C2030574A7
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 08:02:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18E9C3932FC;
	Tue, 17 Mar 2026 08:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EPHGYuvp"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D05346FD0;
	Tue, 17 Mar 2026 08:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773734563; cv=none; b=km7/JhMOTOmi2CgsISfl6b/AQ8BipLLtfnzqUgwTZIBxgQfwPtpKKoGG4Fm0nYFb0/b6gpkmzVsi0vd3/bqX47mdF8yRVIrk8L6ot7RuLzDbIvX+CTki42cm+S8j72Ssb/Bv6J/nA6HrQMFhrDhf4g6jC705FAEQGOuZEPZzCvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773734563; c=relaxed/simple;
	bh=MaYC2sAz881fbRaQaayYG5iK0ir3m5pGE6gCcjWZphw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RLWDq3RxI8q9el50zhKwCiKFhxJ4uRLaCqv3YgeeRxGr5hiQZqdFOV7KxYjBBxaSPpZSRt9Whu3BD3HvLor7kOVX5zsCVbA2Q36jJ+gbMNdYcaZB4NGUVvDS13k56we/3Bil65pC0wHC3OgS5fOc9JPyY6i++MbcWOmbpwXkGjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EPHGYuvp; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773734562; x=1805270562;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MaYC2sAz881fbRaQaayYG5iK0ir3m5pGE6gCcjWZphw=;
  b=EPHGYuvp9ILay0awVzB/YAd/k6ezbv/1YZRcp8AWFxTndkisFFN5zndc
   CdVRiO20pNcwQi8v2nyYleDVUz5aGLzAUne6uF+QYD4/NkuOjDyJzfvP9
   l1fwKWFvYE/PT5PoMrLl73BLxFtk4RAVn+Cw7uBw6VsBhEdfdcocdwh9p
   Z5rr8ZES1Ul2e+MAD0kQHvLzKMjHA47q0ub5amY9fioB2PLkyrozDIiAV
   RQLZn7gRBgfOqPXzczk3GqB5WyrQuXsrGYd3R754qdIfXDsfQVQxPco8k
   MIDkai1/TCSH8K3HdEjTevkUm5VLUP31tX5SzGIv9kHwJplphRTGxdyn/
   A==;
X-CSE-ConnectionGUID: GbTENIpMS6a39N15BSMUAg==
X-CSE-MsgGUID: /dCp/iorRFit0JclRWsEhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="86235934"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="86235934"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 01:02:42 -0700
X-CSE-ConnectionGUID: GX4EVMZ4S9yuPGTmYni5CA==
X-CSE-MsgGUID: h8EShYSfQCGm4wqmuPgKOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="222133967"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.106])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 01:02:40 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 114F0121D04;
	Tue, 17 Mar 2026 10:02:38 +0200 (EET)
Date: Tue, 17 Mar 2026 10:02:38 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jai Luthra <jai.luthra@ideasonboard.com>
Subject: Re: [PATCH 3/3] media: subdev: Split
 v4l2_subdev_get_frame_desc_passthrough() into locked and unlocked
Message-ID: <abkKnm10SapsRPhe@kekkonen.localdomain>
References: <20260312-frame-desc-passthrough-impro-v1-0-30f64d637a3a@ideasonboard.com>
 <20260312-frame-desc-passthrough-impro-v1-3-30f64d637a3a@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312-frame-desc-passthrough-impro-v1-3-30f64d637a3a@ideasonboard.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55999-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,ideasonboard.com:email,kekkonen.localdomain:mid]
X-Rspamd-Queue-Id: D0BB52A5410
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Moi,

On Thu, Mar 12, 2026 at 02:15:30PM +0200, Tomi Valkeinen wrote:
> The recently added v4l2_subdev_get_frame_desc_passthrough() can be used
> directly as an implementation for .get_frame_desc subdev op. However, in
> some cases the drivers may want to add some customizations, while the
> bulk of the work is still identical to what
> v4l2_subdev_get_frame_desc_passthrough() does. Current locking scheme
> makes this impossible to do properly.
> 
> Split v4l2_subdev_get_frame_desc_passthrough() into two functions:
> 
> v4l2_subdev_get_frame_desc_passthrough_locked(), which takes a locked
> subdev state as a parameter, instead of locking and getting the active
> state internally. Other than that, it does the same as
> v4l2_subdev_get_frame_desc_passthrough() used to do.
> 
> v4l2_subdev_get_frame_desc_passthrough(), which locks the active state
> and calls v4l2_subdev_get_frame_desc_passthrough_locked().
> 
> In other words, v4l2_subdev_get_frame_desc_passthrough() works as
> before, but drivers can now alternatively add custom .get_frame_desc
> code and call v4l2_subdev_get_frame_desc_passthrough().
> 
> An example use case is with DS90UB953 serializer: in normal use the
> serializer passes through everything, but when test-pattern-generator
> (TPG) is used, an internal TPG source is used. After this commit, the
> UB953 get_frame_desc() can lock the state, look at the routing table to
> see if we're in normal or TPG mode, then either call
> v4l2_subdev_get_frame_desc_passthrough_locked() if in normal mode, or
> construct a TPG frame desc if in TPG mode.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 46 ++++++++++++++++++++---------------
>  include/media/v4l2-subdev.h           | 38 +++++++++++++++++++++++++----
>  2 files changed, 59 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 2757378c628a..8b1a7f00c86b 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -2545,21 +2545,19 @@ int v4l2_subdev_s_stream_helper(struct v4l2_subdev *sd, int enable)
>  }
>  EXPORT_SYMBOL_GPL(v4l2_subdev_s_stream_helper);
>  
> -int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
> -					   unsigned int pad,
> -					   struct v4l2_mbus_frame_desc *fd)
> +int v4l2_subdev_get_frame_desc_passthrough_locked(struct v4l2_subdev *sd,
> +						  struct v4l2_subdev_state *state,
> +						  unsigned int pad,
> +						  struct v4l2_mbus_frame_desc *fd)
>  {
>  	struct media_pad *local_sink_pad;
>  	struct v4l2_subdev_route *route;
> -	struct v4l2_subdev_state *state;
>  	struct device *dev = sd->dev;
>  	int ret = 0;
>  
>  	if (WARN_ON(!(sd->entity.pads[pad].flags & MEDIA_PAD_FL_SOURCE)))
>  		return -EINVAL;
>  
> -	state = v4l2_subdev_lock_and_get_active_state(sd);

This variant appears to be unlocked rather than locked.

Could you instead use two underscores as a prefix to the same name? That's
an established practice.

-- 
Terveisin,

Sakari Ailus

