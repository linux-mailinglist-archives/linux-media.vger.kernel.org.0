Return-Path: <linux-media+bounces-60816-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GAE7OJqb/Gk6RwAAu9opvQ
	(envelope-from <linux-media+bounces-60816-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 16:03:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 702854E9C72
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 16:03:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E9ECE30599FC
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 13:58:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A4B23FAE19;
	Thu,  7 May 2026 13:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rpOPtBxR"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EE115ECCC
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 13:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778162284; cv=none; b=VtFTP2yFwsrf6GfbrwWcBwcEjWL1trC9Ez6EVO3Pi7R979vhvvM+iAVCs9JkdQ3oQ2WrdShWpypAdlLb8GS5OczKtOHkxAnvJgSYLc/7RkKwppQGg+gb8X3I1GDGfyDY+95oytWmxXQ+pEGrxcH60cBHbAZjpjuDdGXo1uxanfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778162284; c=relaxed/simple;
	bh=EyDlH0JmOYKCHiTUBUxYm5itE+mSwb/11ZNMbrjidgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sPt4FGM4WD/pQU57RHXClI4S3EaOkfcZh6KXqOt8zqf3hMpcNXW8ry+6Z10qEoayxFxM1ahNoxskPCnyN4y/E9CrP3n4KAGvKcQpP6fMzLK+iYukNnUi2G4ZM7Mj27nQLAc0JEUdJWfIWsydMbp4k2g7n+KHLfYdtKo5N10JuDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rpOPtBxR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 06FB29CE;
	Thu,  7 May 2026 15:57:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778162277;
	bh=EyDlH0JmOYKCHiTUBUxYm5itE+mSwb/11ZNMbrjidgM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rpOPtBxRpi0Kqrxeo+e3GSuPWI805LAgHYyrXBntmohpu+R8mkUsJq5aE9f0v2WDF
	 lzf7qEX0ufnwNBWGVK/+s/UOzUatJY6ii2QdmUfGI0LRYCbqdCRXmHnFGFo+HdvzIC
	 IK5D+opn38SovLzO+UoYiNywoxYwvbuLMlpN6feA=
Date: Thu, 7 May 2026 16:57:59 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: Arash Golgol <arash.golgol@gmail.com>, linux-media@vger.kernel.org,
	yong.deng@magewell.com, mchehab@kernel.org, wens@kernel.org,
	jernej.skrabec@gmail.com, samuel@sholland.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v1 3/3] media: sun6i-csi: capture: Support MC-centric
 format enumeration
Message-ID: <20260507135759.GH1938994@killaraus.ideasonboard.com>
References: <20260217064050.18388-1-arash.golgol@gmail.com>
 <20260217064050.18388-4-arash.golgol@gmail.com>
 <afx-UNHAYcfqCOMQ@collins>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <afx-UNHAYcfqCOMQ@collins>
X-Rspamd-Queue-Id: 702854E9C72
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,magewell.com,kernel.org,sholland.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-60816-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,ideasonboard.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,killaraus.ideasonboard.com:mid]
X-Rspamd-Action: no action

On Thu, May 07, 2026 at 01:58:08PM +0200, Paul Kocialkowski wrote:
> Le Tue 17 Feb 26, 10:10, Arash Golgol a écrit :
> > Extend vidioc_enum_fmt to support MC-centric enumeration by filtering
> > pixel formats based on the provided mbus code. Advertise MC I/O support
> > on the video device to reflect its intended usage within a media graph.
> > 
> > Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
> > ---
> >  .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 38 +++++++++++++++++--
> >  1 file changed, 35 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> > index dd06d4c116e0..f54d7a6397be 100644
> > --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> > +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> > @@ -327,6 +327,21 @@ static bool sun6i_csi_capture_format_match(u32 pixelformat, u32 mbus_code)
> >  	return false;
> >  }
> >  
> > +static const u32 *sun6i_csi_capture_pixelformat_find(u32 mbus_code)
> 
> I am not a big fan of returning a pointer here. We can safely assume
> that a valid pixel format will be non-zero (it's a fourcc), so I would
> just return the pixelformat directly and 0 for invalid cases.

I agree. The rest of the patch looks fine. With this addressed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> > +{
> > +	unsigned int i;
> > +
> > +	for (i = 0; i < ARRAY_SIZE(sun6i_csi_capture_format_matches); i++) {
> > +		const struct sun6i_csi_capture_format_match *match =
> > +			&sun6i_csi_capture_format_matches[i];
> > +
> > +		if (match->mbus_code == mbus_code)
> > +			return &match->pixelformat;
> > +	}
> > +
> > +	return NULL;
> > +}
> > +
> >  /* Capture */
> >  
> >  static void
> > @@ -729,11 +744,27 @@ static int sun6i_csi_capture_enum_fmt(struct file *file, void *priv,
> >  				      struct v4l2_fmtdesc *fmtdesc)
> >  {
> >  	u32 index = fmtdesc->index;
> > +	u32 mbus_code = fmtdesc->mbus_code;
> > +	const u32 *pixelformat;
> > +
> > +	/* MC-centric or Video-node-centric */
> > +	if (mbus_code) {
> > +		/* There is only one pixelformat for a mbus_code. */
> > +		if (index)
> > +			return -EINVAL;
> > +
> > +		pixelformat = sun6i_csi_capture_pixelformat_find(mbus_code);
> > +	} else {
> > +		if (index >= ARRAY_SIZE(sun6i_csi_capture_formats))
> > +			return -EINVAL;
> > +
> > +		pixelformat = &sun6i_csi_capture_formats[index].pixelformat;
> > +	}
> >  
> > -	if (index >= ARRAY_SIZE(sun6i_csi_capture_formats))
> > +	if (!pixelformat)
> >  		return -EINVAL;
> >  
> > -	fmtdesc->pixelformat = sun6i_csi_capture_formats[index].pixelformat;
> > +	fmtdesc->pixelformat = *pixelformat;
> >  
> >  	return 0;
> >  }
> > @@ -1065,7 +1096,8 @@ int sun6i_csi_capture_setup(struct sun6i_csi_device *csi_dev)
> >  
> >  	strscpy(video_dev->name, SUN6I_CSI_CAPTURE_NAME,
> >  		sizeof(video_dev->name));
> > -	video_dev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
> > +	video_dev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING |
> > +				 V4L2_CAP_IO_MC;
> >  	video_dev->vfl_dir = VFL_DIR_RX;
> >  	video_dev->release = video_device_release_empty;
> >  	video_dev->fops = &sun6i_csi_capture_fops;

-- 
Regards,

Laurent Pinchart

