Return-Path: <linux-media+bounces-59298-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2E8XNM2O6GmpMQIAu9opvQ
	(envelope-from <linux-media+bounces-59298-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 11:03:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E41443BBF
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 11:03:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C502300E381
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 09:03:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A2D937FF4D;
	Wed, 22 Apr 2026 09:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="U64TfnBo"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C46446B5
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 09:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776848583; cv=none; b=OGeusChj0THPfyloLEA16utaVxrG7XOdF5qXuGYOSizwlxMpwecFT/zikBjJKZfsQ7Yl3xnPNsd6H+JZO3rhm8g810NBi7dgukjllaFalLnI+Zi+hnIClC/i2kBI3uREHnXbeFVXfGLwfZuRaNLqHy1aAlNZ2sF5tHYqq8OFrwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776848583; c=relaxed/simple;
	bh=Kzv0kQS8vltNt9YG2PK6V0nMjGR84Bg5YNVciAOMszA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AfEr2Z70AjAUQ7X4woRcXM88ul5owtAdwpubgGnKVwMob5CVfgj6FmbxMRXfUxmyS1r8TFX0skPNlNevvbX3lKUUs69vCHAgIjAloOtqW2zTtfkHgf3UZGNjt7hXQGb29i1C11/08ZYP6CNncDtxmNcAStvD1qwUWl2RL4jtGFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=U64TfnBo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5C6D3227;
	Wed, 22 Apr 2026 11:01:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776848479;
	bh=Kzv0kQS8vltNt9YG2PK6V0nMjGR84Bg5YNVciAOMszA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U64TfnBo66XlA2cYPwMhA6v90S52ALRfNPoYZvq/5U0ML56oc/aOwt5TvCthVpYhf
	 ae0SMz3LfNAPa5Ckirx4JOq5u3CpD1DaL0L2P5DVVKJCFQYJZLdDCvncmueqPqBghi
	 pUBKS7xAM8t2emYcse9rGfc5gJnZEYhj7g2+i3Cc=
Date: Wed, 22 Apr 2026 12:02:56 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, hans@jjverkuil.nl,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v4 24/29] media: v4l2-subdev: Introduce
 v4l2_subdev_get_frame_desc()
Message-ID: <20260422090256.GA2807981@killaraus.ideasonboard.com>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
 <20260408153939.969381-25-sakari.ailus@linux.intel.com>
 <adjWaqk9qO7CWM5W@zed>
 <adykK0JxoIoZjWUT@kekkonen.localdomain>
 <20260416161654.GC1823068@killaraus.ideasonboard.com>
 <aedrEm-Mh21TnJ4N@kekkonen.localdomain>
 <20260421221817.GF2315844@killaraus.ideasonboard.com>
 <aeiGUIFh3UOp6ksw@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aeiGUIFh3UOp6ksw@kekkonen.localdomain>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59298-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,vger.kernel.org,jjverkuil.nl,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim,killaraus.ideasonboard.com:mid]
X-Rspamd-Queue-Id: 25E41443BBF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 22, 2026 at 11:26:56AM +0300, Sakari Ailus wrote:
> On Wed, Apr 22, 2026 at 01:18:17AM +0300, Laurent Pinchart wrote:
> > > > > > > +static int get_mipi_dt_for_mbus(u32 code)
> > > > 
> > > > v4l2_subdev_get_mipi_dt_for_mbus()
> > > > 
> > > > Or move the function to v4l2-common.c, name it mipi_csi2_dt_for_mbus()
> > > > and declare it in include/media/mipi-csi2.h.
> > > 
> > > How about calling it mipi_csi2_dt_for_mbus()? I think it can be located in
> > > v4l2-common.c for now, no need to add a separate file just for this; all
> > > users would effectively be related to V4L2 anyway.
> > 
> > Yes, that's what I proposed :-)
> 
> Well, that's good then. :-)
> 
> ...
> 
> > > > > > > +int v4l2_subdev_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> > > > > > > +			       struct v4l2_mbus_frame_desc *desc)
> > > > > > > +{
> > > > > > > +	struct v4l2_subdev_format subdev_fmt = {
> > > > > > > +		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
> > > > > > > +		.pad = pad,
> > > > > > > +	};
> > > > > > > +	int ret;
> > > > > > > +
> > > > > > > +	if (v4l2_subdev_has_op(sd, pad, get_frame_desc)) {
> > > > > > > +		unsigned int type = desc->type;
> > > > > > > +
> > > > > > > +		ret = v4l2_subdev_call(sd, pad, get_frame_desc, pad, desc);
> > > > > > > +
> > > > > > > +		if (desc->type != type)
> > > > > > > +			return -EINVAL;
> > > > 
> > > > I'd add a dev_err() here. There are .get_frame_desc() callers that check
> > > > if the returned type matches what they expect and log an error
> > > > otherwise. When using this helper the check can't be performed in the
> > > > callera any more, leading to possibly hard to debug issues if no message
> > > > is printed.
> > > 
> > > dev_err_once()?
> > 
> > Is there a need to limit it to printing the message once only ? It will
> > only occur if an incompatible source is connected, which shouldn't
> > happen in normal circumstances.
> 
> Yes, but still enables filling logs with that message. A single one in this
> case should be enough.

Is it user-triggerable without a serious bug in drivers ?

-- 
Regards,

Laurent Pinchart

