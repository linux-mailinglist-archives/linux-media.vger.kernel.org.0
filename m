Return-Path: <linux-media+bounces-64501-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6wguB3+WKWrEaAMAu9opvQ
	(envelope-from <linux-media+bounces-64501-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 18:53:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6221766BB47
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 18:53:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=bQRz6czt;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64501-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64501-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E565932A49D7
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 16:48:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8B6C33D6D5;
	Wed, 10 Jun 2026 16:47:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E844D2E8B98;
	Wed, 10 Jun 2026 16:47:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781110076; cv=none; b=IQpM+z8a3D/w3TyWXj49Klw/1qXaDc8zi/fvUMgXjaLve/5usGGHMu0M/0JJQUXIlIWqCl9+PGnHqKza9Lg9O/ca64r1h286D1Ivj68CifWTmWHZGwlcELj8CgS+pyYLsKS5nUTmmdlvCHm+YIFd0oqxfmQo0fL0ESZ/Lc8BrVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781110076; c=relaxed/simple;
	bh=EPK3tsDP7MJ85z55tYMLTgK/U07/7rpBkB7b1Uy60oI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bfaUvIvWP+P0Chu0fLClYWrRsvMQ4XZCFVSO+BJ/rbF8W837O9zJTpkq//z4mJ519TP5ymvxyvAGwpF18Ync279MDZXeQKc+O45006vLIR52CIYAl8JfGIoS9LKOpidXVraS/QV3P8Ont8SEDPaRySOx42NDwy1vu+kbLZNarjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bQRz6czt; arc=none smtp.client-ip=213.167.242.64
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9FCDF517;
	Wed, 10 Jun 2026 18:47:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781110043;
	bh=EPK3tsDP7MJ85z55tYMLTgK/U07/7rpBkB7b1Uy60oI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bQRz6czt7COtbmKpgmfTE9daRxZwo1O3MtqNw5rc8cfNDcok/0yKa6dnYieTZgS1c
	 p7X7kp9J2+LDNIB21IK913LRvgVtrS+qbrAHSbmOG6q29LItA8K2OyytjJa302ErQc
	 88/Nz4AgyUcu5GF4AwwT+1RasYC7M3pOC4JB/dBo=
Date: Wed, 10 Jun 2026 18:47:49 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Xiaolei Wang <xiaolei.wang@windriver.com>, 
	Tarang Raval <tarang.raval@siliconsignals.io>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/3] media: rzg2l-cru: Remove unused kerneldoc description
Message-ID: <aimU6RyDK8gEjkeQ@zed>
References: <20260610-media-ci-7-2-v1-0-3c61a482a44e@chromium.org>
 <20260610-media-ci-7-2-v1-2-3c61a482a44e@chromium.org>
 <aimQ3ln0y0jxMWT3@zed>
 <CANiDSCs=90QH5V8RHFbZUvZMGEN4wz-D9ODHTWgdvyJ7ZS8haA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCs=90QH5V8RHFbZUvZMGEN4wz-D9ODHTWgdvyJ7ZS8haA@mail.gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64501-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:ribalda@chromium.org,m:jacopo.mondi@ideasonboard.com,m:dave.stevenson@raspberrypi.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:xiaolei.wang@windriver.com,m:tarang.raval@siliconsignals.io,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:dan.scally@ideasonboard.com,m:hverkuil+cisco@kernel.org,m:laurent.pinchart@ideasonboard.com,m:mchehab+huawei@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jacopo.mondi+renesas@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco,huawei,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[zed:mid,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:from_mime,vger.kernel.org:from_smtp,chromium.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6221766BB47

On Wed, Jun 10, 2026 at 06:35:36PM +0200, Ricardo Ribalda wrote:
> Hi Jacopo
>
> On Wed, 10 Jun 2026 at 18:30, Jacopo Mondi
> <jacopo.mondi@ideasonboard.com> wrote:
> >
> > Hi Ricardo
> >
> > On Wed, Jun 10, 2026 at 04:20:07PM +0000, Ricardo Ribalda wrote:
> > > The variable has been previously removed but not its kerneldoc.
> > >
> > > Also remove the leftover reference to state in the description of qlock.
> > >
> > > This patch fixes the following warning:
> > >
> > > Warning: drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h:164
> > > Excess struct member 'state' description in 'rzg2l_cru_dev'
> >
> > upsie
> >
> > indeed!
> >
> > >
> > > Fixes: 85d8820d4869 ("media: rzg2l-cru: Remove the 'state' variable")
> >
> > My only question is if this qualifies for stable or not...
> > Honestly, I would drop the Fixes tag here
>
> Yeah, I am not even sure myself
>
> On one hand, it might help other CIs down there have cleaner logs, it
> is very low risk, and I doubt that it will have any conflicts.
> On the other, what real user will benefit from this backport?
>
> I wrote in the cover that this can be dropped. I'd let more clever
> people decide :P
>

From Documentation/process/stable-kernel-rules.rst:

- It must either fix a real bug that bothers people or just add a device ID.
  To elaborate on the former:

  - It fixes a problem like an oops, a hang, data corruption, a real security
    issue, a hardware quirk, a build error (but not for things marked
    CONFIG_BROKEN), or some "oh, that's not good" issue.
  - Serious issues as reported by a user of a distribution kernel may also
    be considered if they fix a notable performance or interactivity issue.
    As these fixes are not as obvious and have a higher risk of a subtle
    regression they should only be submitted by a distribution kernel
    maintainer and include an addendum linking to a bugzilla entry if it
    exists and additional information on the user-visible impact.
  - No "This could be a problem..." type of things like a "theoretical race
    condition", unless an explanation of how the bug can be exploited is also
    provided.
  - No "trivial" fixes without benefit for users (spelling changes, whitespace
    cleanups, etc).

Are Documentation warnings considered "build errors" ?

> >
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> >
> > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> >
> > > ---
> > >  drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h | 2 --
> > >  1 file changed, 2 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > > index 5bf334e173d2..b426bc7898bf 100644
> > > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > > @@ -116,11 +116,9 @@ struct rzg2l_cru_info {
> > >   * @scratch_phys:    physical address of the scratch buffer
> > >   *
> > >   * @qlock:           protects @queue_buf, @buf_list, @sequence
> > > - *                   @state
> > >   * @queue_buf:               Keeps track of buffers given to HW slot
> > >   * @buf_list:                list of queued buffers
> > >   * @sequence:                V4L2 buffers sequence number
> > > - * @state:           keeps track of operation state
> > >   *
> > >   * @format:          active V4L2 pixel format
> > >   */
> > >
> > > --
> > > 2.54.0.1099.g489fc7bff1-goog
> > >
>
>
>
> --
> Ricardo Ribalda

