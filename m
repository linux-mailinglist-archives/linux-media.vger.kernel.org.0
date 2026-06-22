Return-Path: <linux-media+bounces-65355-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id U6V8OQAROWr+mAcAu9opvQ
	(envelope-from <linux-media+bounces-65355-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 12:40:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 511E26AEC4C
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 12:40:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=ZS8eNCjt;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65355-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65355-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 38E0230305F4
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 10:39:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C91E37269A;
	Mon, 22 Jun 2026 10:39:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2404A371D14;
	Mon, 22 Jun 2026 10:39:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782124787; cv=none; b=XESWgxHhDRq6gd2CEcP6MsSKlRaDaVfCJR5PCu8JOVYq7EX5oTrgTuAJUzr2s4OFEJTSZU1QMPdAWWIIPP2pOuiVtt3YyRPdug09Wa6vfjP2GWYVINM+vGndyjhB1iXZHsXFnmXtwbeodiLlTzJYqgriBYBKgWMUasMCbZeK7LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782124787; c=relaxed/simple;
	bh=+PTHu8uYEliCG2hW2yliLhL6xDa49kA2IvmO9Lhe998=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VsljugEhHoLnPm0aYpcPVRTIorsdyxv5ymB+1yoYC+wXbSnGceqDksGSvVLg8km5ZX12t1KAArJgRbZULYgupQZ7FdwSMzvZPoFSVH6nBgaaxAvRYJch1GaMGmDK+XtGjyVLAQB3Yexi8AlvWF6BbpsKhLOQNEDn5aWCVH+F8EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZS8eNCjt; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6F886874;
	Mon, 22 Jun 2026 12:39:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782124746;
	bh=+PTHu8uYEliCG2hW2yliLhL6xDa49kA2IvmO9Lhe998=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZS8eNCjtod/txW3HsrSeFcQIPlJJkdazWEnVkM9m0vInO4nPG7UBveOhKFhiKPzat
	 uE2o64q3hbwjwxtfoNooVvG6KKn8eSp6j16o7cM//dEzQ5NcMXrWcyWGQuQHTMyl7B
	 dniiMVn5ovZpSBR7CbnBwBKPEf9rROkAVkdiDFMQ=
Date: Mon, 22 Jun 2026 13:39:42 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Riesch <michael.riesch@collabora.com>,
	Frank Li <Frank.Li@nxp.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Purism Kernel Team <kernel@puri.sm>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 2/8] media: v4l2-fwnode: Add common helper library for
 1-to-1 subdev registration
Message-ID: <20260622103942.GB3872967@killaraus.ideasonboard.com>
References: <20260617-imx8qxp_pcam-v5-0-7fa6c8e7fba7@nxp.com>
 <20260617-imx8qxp_pcam-v5-2-7fa6c8e7fba7@nxp.com>
 <ajMhZP5YHuQdhc5M@kekkonen.localdomain>
 <ajNwgq96WRrykE5I@SMW015318>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ajNwgq96WRrykE5I@SMW015318>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65355-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,collabora.com,nxp.com,posteo.de,gmail.com,puri.sm,pengutronix.de,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:Frank.li@oss.nxp.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:michael.riesch@collabora.com,m:Frank.Li@nxp.com,m:martink@posteo.de,m:rmfrfs@gmail.com,m:kernel@puri.sm,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 511E26AEC4C

Hi Frank,

On Wed, Jun 17, 2026 at 11:13:55PM -0500, Frank Li wrote:
> On Thu, Jun 18, 2026 at 01:36:20AM +0300, Sakari Ailus wrote:
> > On Wed, Jun 17, 2026 at 03:50:12PM -0400, Frank.Li@oss.nxp.com wrote:
> > > From: Frank Li <Frank.Li@nxp.com>
> > >
> > > Many V4L2 subdev drivers implement the same registration and media pad
> > > setup logic for simple pipelines consisting of a single sink pad and a
> > > single source pad. As a result, the same boilerplate code is duplicated
> > > across multiple drivers.
> > >
> > > Introduce a common helper library for 1-to-1 subdevs to encapsulate the
> > > registration, media entity initialization, and cleanup paths. Drivers
> > > can embed a struct v4l2_subdev_1to1 instance and use the provided helper
> > > APIs instead of open-coding the setup sequence.
> >
> > I appreciate your efforts in trying to reduce the amount of code drivers
> > need simply to get things done but I think there are a few issues with the
> > approach taken in this patch:
> >
> > - The new helpers aren't generic enough, but require two pads; one sink,
> >   one source.
> 
> It can cover many case already, there are many bridge type subdev. after
> glace of all code, many CSI2RX is type device. It should one kind important
> type/case, like sensors.
> 
> And I plan do 1 TO N replicator driver, which duplicate 1 sink pad to N
> source pad (with/without register config), plus exist video-mux driver,
> 
> It think It can cover more than 80% cases.
> 
> > You could provide special helpers for just this case, but
> >   right now it looks like that if there's something you need that the
> >   helper assumes you don't, you can't use the helper at all. In other
> >   words, more modularity would be nice.
> 
> We can add it later if need, which easy to replace 1to1 API, like I did
> for sensor one.
> 
> > - The new helper should work with the existing types and not add new types
> >   (struct v4l2_subdev_1to1).
> 
> May be save vep data into v4l2_subdev to avoid parse it every time. and
> enhence media_entity_pads_init() to avoid refer caller data.

I agree with Sakari about not introducing a new structure.

We could create a version of media_entity_pads_init() that allocates the
pads array dynamically (*not* with a devm_* function !), and free it in
media_entity_cleanup().

> >
> > - There should be a way to provide default V4L2 fwnode endpoint
> >   configuration as well as to validate the obtained configuration.
> 
> Do you means remote_bustype_cap_mask information get from a callback?
> 
> > I don't have a good proposal to address the above but at least one way I
> > can think of making error handling easier would be to use devm_() for
> > teardown in more places we to today. That certainly does have its own
> > issues though.
> 
> I tried it before, media and v4l2's clean up is not revised order of init.
> Sorry, I can't find original thread. I remember laurnet pinchart said there
> are order problem.
> 
> 1  v4l2_subdev_init()
> 2. v4l2_async_subdev_nf_init()
> 3. v4l2_async_nf_register()
> 4. media_entity_pads_init()
> 5  v4l2_async_register_subdev()
> 
> 
> v4l2_async_unregister_subdev(sd);
> v4l2_subdev_cleanup(sd);        // Not sure if it save to move to last step
> media_entity_cleanup(&sd->entity);
> v4l2_async_nf_unregister(&csi2->notifier);
> v4l2_async_nf_cleanup(&csi2->notifier);

The cleanup procedure is really bad, it's a known issue. Fixing that
involves resuming Sakari's work on life time management in V4L2.

-- 
Regards,

Laurent Pinchart

