Return-Path: <linux-media+bounces-59226-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDNlKHqj52nw+QEAu9opvQ
	(envelope-from <linux-media+bounces-59226-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 18:19:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1335243D3F0
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 18:19:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 793023088B8B
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 16:12:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 053D0363C6F;
	Tue, 21 Apr 2026 16:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VdypU76m"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1CB2DEA68
	for <linux-media@vger.kernel.org>; Tue, 21 Apr 2026 16:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776787947; cv=none; b=JSAOtITXyA0WRHkfraSKdukYiZK5OweVHyJ3JhB33e9vAYvXqdnasgW3TuuC6cVa/iaN75swu5SPfS5EDU0g+dr2S75/W1mu/DJyXgJy6eO0I8peqNG9C/0tH/jeuY3+Bd3EQ97NlErvxqT0y1JjKm0l4qiru3Ch0EeSmJBWqF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776787947; c=relaxed/simple;
	bh=nZ/4SK5gNBZvIzhgoaRV+l8KxVSUKBiRiN+Eu8d5+nI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RtjCzTDIOEM6DFndWPnY2+vgHrn3Y+J6GU77JAjHTzUzdbjzzNThO9DAc6v6NqzftnXeQmHYZIZJm4M9Vmz5LLwNiN/RHi4Z0if0ti7+LHRRMfB24xVao+RxXx6VEItufHlUD/ZkQfHBe+sgZqYGDi4QaylNxJjrBn0V1XCxBgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=VdypU76m; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 602075B2;
	Tue, 21 Apr 2026 18:10:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776787844;
	bh=nZ/4SK5gNBZvIzhgoaRV+l8KxVSUKBiRiN+Eu8d5+nI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VdypU76mdeu8knWsDsumu6KE/JosZBlo7e9akg8t88AXsO3ttxXnQfkDbfdpWr9C3
	 3f64cGfRqyzY2piun0sr9lCKYDVPyf+f721D3PRf8Y6fJ6EqrurYhjjE6fktk4TE0+
	 VYUxzS4LwCkEAZNqHwYzZCCF3aWlLXFodgmHoDCY=
Date: Tue, 21 Apr 2026 19:12:20 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
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
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v4 27/29] media: v4l2-subdev: Add
 v4l2_subdev_call_ci_active_state
Message-ID: <20260421161220.GC2360857@killaraus.ideasonboard.com>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
 <20260408153939.969381-28-sakari.ailus@linux.intel.com>
 <20260416173821.GA1824072@killaraus.ideasonboard.com>
 <aeegCr3fF5cb770c@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aeegCr3fF5cb770c@kekkonen.localdomain>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59226-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,ideasonboard.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: 1335243D3F0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 07:04:26PM +0300, Sakari Ailus wrote:
> On Thu, Apr 16, 2026 at 08:38:21PM +0300, Laurent Pinchart wrote:
> > On Wed, Apr 08, 2026 at 06:39:36PM +0300, Sakari Ailus wrote:
> > > Add v4l2_subdev_call_ci_active_state(), to call sub-device pad ops that
> > > take struct v4l2_subdev_client_info pointer as an argument.
> > 
> > If we drop the client info parameter from .get_fmt(), the only driver
> > calling this new macro will be
> > drivers/media/platform/ti/cal/cal-video.c. I would just pass NULL
> > explicitly there and drop this patch.
> 
> That'd make the arguments for set_fmt and get_fmt different. I'm not sure
> if that'd be a problem in practice, perhaps not.

All drivers should eventually implement .get_fmt() using the
v4l2_subdev_get_fmt() helper. There should be no need for client info
there.

> I could imagine in the end we'll need to include the client flags in more
> callbacks than set_fmt(). It might not be a bad idea to add them to all pad
> ops. Of course we could revisit this later when needed.

We should really minimize addition of new client caps flags, and really,
really try to implement them all in the subdev core.

-- 
Regards,

Laurent Pinchart

