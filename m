Return-Path: <linux-media+bounces-52004-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDOCKquNgGkl+wIAu9opvQ
	(envelope-from <linux-media+bounces-52004-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 12:42:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD4FCBD8F
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 12:42:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4E55B30173A4
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 11:40:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3717F363C4E;
	Mon,  2 Feb 2026 11:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Nar/360p"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D38135B65F;
	Mon,  2 Feb 2026 11:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770032417; cv=none; b=DRKh1FGQ6PCEO3wCJAxBtuB8P2ivZV4rf/EUr2Wj+QQhpqX2um9t3YvLysIPEgIBbm03sqxhvySQUvJZEWN1FkQRwMjgSdNk3UsCsLBFUijN+ZqxOBnP7hSwIC8pYWAAhlasoEcSll97GwBk/BbMvs5ZV8R5j/wyLz8UjbrzLHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770032417; c=relaxed/simple;
	bh=cqeEIG3kDGj0U74pqTW4Z9ZYgMUO95CKHKK+Fhve+6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fd+2wyrq8+0HpIbEZtSsRzMA7WtwLHpC5TAzArAlYieQrvR/dPpef89e7BmafTmkRxxGU8XwC31i1fZMtO6IHTsqTNGIgV9W6qaLifA4EK0DlDCU6q5FUDFHOQaICSOytqvZGZR4VJLKEfJH+5A50yn/JjLMmR+lPwb/VEZKv9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Nar/360p; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 2A375492;
	Mon,  2 Feb 2026 12:39:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770032373;
	bh=cqeEIG3kDGj0U74pqTW4Z9ZYgMUO95CKHKK+Fhve+6k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nar/360pTd67N3cfsDrLPHlMtF1zQrCB4p/yYAq3QiHYSgKohArKxhF5dtYbJc1AO
	 Irk+FuaTVqwsuM4LjBxV1fPkm3MnSJ64s+4RLADY57NG8sb/WcuRXr5mH4WBE8TmkV
	 KL0udjcFFbY+cfteL2JDNbuODgBpc+srFwH+Wmck=
Date: Mon, 2 Feb 2026 13:40:12 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Gergo Koteles <soyer@irl.hu>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Oleksandr Natalenko <oleksandr@natalenko.name>,
	Jarkko Sakkinen <jarkko@kernel.org>, linux-media@vger.kernel.org,
	jani.nikula@linux.intel.com, anisse@astier.eu,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH] media: Virtual camera driver
Message-ID: <20260202114012.GA4173464@killaraus>
References: <20260201133342.335680-1-jarkko@kernel.org>
 <5073898.31r3eYUQgx@natalenko.name>
 <20260202001704.2419778a@foz.lan>
 <13939245.uLZWGnKmhe@natalenko.name>
 <20260202020214.2243acec@foz.lan>
 <0fc43020620f211a7962a819c617056fbb499d86.camel@irl.hu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0fc43020620f211a7962a819c617056fbb499d86.camel@irl.hu>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52004-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,huawei];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,ideasonboard.com:dkim,intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,chromium.org:email,astier.eu:email]
X-Rspamd-Queue-Id: 1FD4FCBD8F
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 12:36:44PM +0100, Gergo Koteles wrote:
> On Mon, 2026-02-02 at 02:02 +0100, Mauro Carvalho Chehab wrote:
> > On Mon, 02 Feb 2026 00:25:37 +0100
> > Oleksandr Natalenko <oleksandr@natalenko.name> wrote:
> > 
> > > Date: Mon, 02 Feb 2026 00:25:37 +0100
> > > From: Oleksandr Natalenko <oleksandr@natalenko.name>
> > > To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jarkko Sakkinen <jarkko@kernel.org>, linux-media@vger.kernel.org, jani.nikula@linux.intel.com, anisse@astier.eu, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Ricardo Ribalda <ribalda@chromium.org>, open list <linux-kernel@vger.kernel.org>
> > > Message-ID: <13939245.uLZWGnKmhe@natalenko.name>
> > > 
> > > On pondělí 2. února 2026 0:17:20, středoevropský standardní čas Mauro Carvalho Chehab wrote:
> > > > No. At the machine with the camera, obs can read from a V4L2 input,
> > > > generate a mpeg TS stream, and listen to a UDP port (for instance). 
> > > > 
> > > > At the remote machine, you can just pass the URL to ffmpeg.  
> > > 
> > > I can't, I have to feed the stream into Firefox somehow for it to see the stream as a virtual webcam.
> > 
> > Motioneye could be used on such scenario. It has a proper web
> > interface, allows multiple users to watch, has login control accepts
> > multiple cameras.
> > 
> 
> WebRTC in browsers isn't that bad. Firefox and Chrome also have
> PipeWire video support. 
> 
> If I understand correctly, it would be more forward-thinking to develop
> virtual camera support in PipeWire rather than in the kernel.

I don't think there's even a need for development in PipeWire

$ gst-launch-1.0 \
	videotestsrc ! \
	video/x-raw,format=YUY2 ! \
	pipewiresink mode=provide stream-properties="properties,media.class=Video/Source,media.role=Camera"

This gives me a virtual camera in Firefox. Extending the GStreamer
pipeline to get the video stream from the network should be quite
trivial.

-- 
Regards,

Laurent Pinchart

