Return-Path: <linux-media+bounces-57043-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJRxEFTvw2lJvAQAu9opvQ
	(envelope-from <linux-media+bounces-57043-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 15:21:08 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B24326A7C
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 15:21:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 67E4530C078E
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 14:07:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00FCC3CF677;
	Wed, 25 Mar 2026 14:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MFLRi4gF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B361346ACC
	for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 14:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774447659; cv=none; b=qC6C4m+yVvh0pSSsBZaPxApVdfUMJj/ka13kkhG7799U6JonO2+KeJKZlBA7QeZDMxJxpIaasAQSjV2mEUAAph8ziRY03lefF/4Zatwy8Wv/Z0WxP/4oCtno8jqwGqn5ixSR0DhFGC4hi7lDJChVf/2M3KumsFiplDVwVdGZBy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774447659; c=relaxed/simple;
	bh=LuOUL+Skc6HeyyxIPSmVmxRIf2FL396nvENRWieUjQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XPWGk7/r47BUuvyJOn0eEyfu8y4pwxZkSAzXt9SUa5OyX8WT4Ju1tquvHY7WmRsp1WY1uTdW8vFCU7rzcRVpxN7iIpPFGTVXMSdjZT0tbFM0Y6BQCSeOVWH6GJ694SN4CSt9Caia3+TMETyMkGXCnZLDa7C+5SFK47/YagVBIoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MFLRi4gF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 70D61121A;
	Wed, 25 Mar 2026 15:06:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774447578;
	bh=LuOUL+Skc6HeyyxIPSmVmxRIf2FL396nvENRWieUjQs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MFLRi4gF4GKSaOxiGLDRvtEaEngZRQJQAGMOuYNMh96Jrrw4qEW6sKWbCbRD1VmGJ
	 NiWQtqgp6brmHA1vo3mb4P4LmMN11P8xNgLQlZLrswsVgomolVuS6jSgqFTBPBkWix
	 0GzyG2TXzRcGziA4/DRM1XOS/ejIYNeJXJk+4uWk=
Date: Wed, 25 Mar 2026 16:07:35 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, David Heidelberg <david@ixit.cz>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v2 1/1] media: v4l2-subdev: Fail {enable,disable}_streams
 and s_streaming nicely
Message-ID: <20260325140735.GA2540687@killaraus.ideasonboard.com>
References: <20260323105655.743792-1-sakari.ailus@linux.intel.com>
 <20260323111042.GC1514659@killaraus.ideasonboard.com>
 <acEnjvwjW0QNu_1u@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <acEnjvwjW0QNu_1u@kekkonen.localdomain>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57043-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim,intel.com:email,ixit.cz:email]
X-Rspamd-Queue-Id: 92B24326A7C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 01:44:14PM +0200, Sakari Ailus wrote:
> On Mon, Mar 23, 2026 at 01:10:42PM +0200, Laurent Pinchart wrote:
> > On Mon, Mar 23, 2026 at 12:56:55PM +0200, Sakari Ailus wrote:
> > > If a sub-device does not set enable_streams() and disable_streams() pad
> > > ops while it sets the s_stream() video op to
> > > v4l2_subdev_s_stream_helper(), enabling or disabling streaming either way
> > > on the sub-device will result calling v4l2_subdev_s_stream_helper() and
> > > v4l2_subdev_{enable,disable}_streams() recursively, exhausting the stack.
> > > Return -ENOIOCTLCMD in this case to handle the situation gracefully.
> > 
> > This is not a valid use case, right ? Can we WARN() ?
> 
> Partly yes, and partly it requires a driver bug.
> 
> The CCS driver soon will differentiate its ops for source (scaler/binner
> and CSI-2 receiver) sub-device, but only pad ops, not video ops. This means
> that on non-source sub-devices the s_stream pad op is set to
> v4l2_subdev_s_stream_helper() while {enable,disable}_streams() pad ops are
> NULL.
> 
> It also takes a bug in the camss driver to trigger this -- it enables
> streaming on all sub-devices of the pipeline instead of the next upstream
> sub-device. That bug should be fixed but it's a separate issue.

Sounds like a candidate for a WARN() then, doesn't it ?

> > > Reported-by: David Heidelberg <david@ixit.cz>
> > > Fixes: b62949ddaa52 ("media: subdev: Support single-stream case in v4l2_subdev_enable/disable_streams()")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > > since v1:
> > > 
> > > - Better patch description.
> > > 
> > >  drivers/media/v4l2-core/v4l2-subdev.c | 16 ++++++++++------
> > >  1 file changed, 10 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > > index 831c69c958b8..f8ea4afc6cbb 100644
> > > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > > @@ -2334,11 +2334,13 @@ int v4l2_subdev_enable_streams(struct v4l2_subdev *sd, u32 pad,
> > >  
> > >  	/* Fallback on .s_stream() if .enable_streams() isn't available. */
> > >  	use_s_stream = !v4l2_subdev_has_op(sd, pad, enable_streams);
> > > -
> > > -	if (!use_s_stream)
> > > +	if (!use_s_stream) {
> > >  		state = v4l2_subdev_lock_and_get_active_state(sd);
> > > -	else
> > > +	} else {
> > > +		if (!v4l2_subdev_has_op(sd, video, s_stream))
> > > +			return -ENOIOCTLCMD;
> > >  		state = NULL;
> > > +	}
> > >  
> > >  	/*
> > >  	 * Verify that the requested streams exist and that they are not
> > > @@ -2435,11 +2437,13 @@ int v4l2_subdev_disable_streams(struct v4l2_subdev *sd, u32 pad,
> > >  
> > >  	/* Fallback on .s_stream() if .disable_streams() isn't available. */
> > >  	use_s_stream = !v4l2_subdev_has_op(sd, pad, disable_streams);
> > > -
> > > -	if (!use_s_stream)
> > > +	if (!use_s_stream) {
> > >  		state = v4l2_subdev_lock_and_get_active_state(sd);
> > > -	else
> > > +	} else {
> > > +		if (!v4l2_subdev_has_op(sd, video, s_stream))
> > > +			return -ENOIOCTLCMD;
> > >  		state = NULL;
> > > +	}
> > >  
> > >  	/*
> > >  	 * Verify that the requested streams exist and that they are not

-- 
Regards,

Laurent Pinchart

