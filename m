Return-Path: <linux-media+bounces-58500-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GAquL6e82GlVhggAu9opvQ
	(envelope-from <linux-media+bounces-58500-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 11:02:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 103923D4756
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 11:02:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 22D77300FC77
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 09:02:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F8203AE196;
	Fri, 10 Apr 2026 09:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Vlg1640U"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6C73AB27C
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 09:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775811746; cv=none; b=F+OckTpLl3QUPaMCBvkZ0MWFd16G17BWzTRczVGYH2CRB8kiaeLIB+zs+ZbAZnLpe0IeXUy8eVnNTeFc3YAr8FSsKSGiG0V0P+b0wRmrfJBXXHEYiv9gSJuYwghWpFy6kfebjFjZleuoCP+eYFq3W9gLTpZiC2fPmwf+CYhJKMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775811746; c=relaxed/simple;
	bh=98/AxvG6TrIsB3uYPTAV8V6Gx7JT9SblQXn1H4lHVJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tnR3Vmlcx3khLU9FzEZzfRDPSVm0lNLqW+g6p44MfJoQDRJepYavdsr+dQMGRpFLdpqFKNdMsxxCuoWr9AsXuNxCIz7+Nzphf/Qp5p3j+kZA1o7jdwtDvIk5Bhm2UTe/3gyPwV+vAvwixQ6YYw9Tu/9gmDa6J1x6MUvqA/QZmAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Vlg1640U; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7F4E91BA;
	Fri, 10 Apr 2026 11:00:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775811653;
	bh=98/AxvG6TrIsB3uYPTAV8V6Gx7JT9SblQXn1H4lHVJs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vlg1640UBl6YdNPBp147D8lsjzRq6nPMVCy1jsajG7jCrZ0EZ6K1AJYa438X3ZMN2
	 FCf+6D+C+B2/lFNBTZCSFOop8ED4ffZXd9hjtXQI1Yi5j/yhDo991kjbEQyLNUQN90
	 AV6YE74C4Gu/Ww1zn4XKQC1xDoI/GmLVLyu0Q53o=
Date: Fri, 10 Apr 2026 11:02:20 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	linux-media@vger.kernel.org, hans@jjverkuil.nl, laurent.pinchart@ideasonboard.com, 
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Tommaso Merciai <tomm.merciai@gmail.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Massot <julien.massot@collabora.com>, 
	Naushir Patuck <naush@raspberrypi.com>, "Yan, Dongcheng" <dongcheng.yan@intel.com>, 
	"Cao, Bingbu" <bingbu.cao@intel.com>, "Qiu, Tian Shu" <tian.shu.qiu@intel.com>, 
	Stefan Klug <stefan.klug@ideasonboard.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, 
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Ricardo Ribalda Delgado <ribalda@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, David Plowman <david.plowman@raspberrypi.com>, 
	"Yu, Ong Hock" <ong.hock.yu@intel.com>, "Ng, Khai Wen" <khai.wen.ng@intel.com>, 
	Jai Luthra <jai.luthra@ideasonboard.com>, Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v4 08/29] media: imx274: Remove redundant kernel-doc
 comments
Message-ID: <adi8gmI07F0efBIx@zed>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
 <20260408153939.969381-9-sakari.ailus@linux.intel.com>
 <adi5CH2yE4CLikVv@zed>
 <adi6yoeos-ClRh6V@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <adi6yoeos-ClRh6V@kekkonen.localdomain>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58500-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[ideasonboard.com,vger.kernel.org,jjverkuil.nl,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,intel.com:email]
X-Rspamd-Queue-Id: 103923D4756
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari

On Fri, Apr 10, 2026 at 11:54:34AM +0300, Sakari Ailus wrote:
> Hi Jacopo,
>
> Thank you for the review.
>
> On Fri, Apr 10, 2026 at 10:48:24AM +0200, Jacopo Mondi wrote:
> > Hi Sakari
> >
> > On Wed, Apr 08, 2026 at 06:39:17PM +0300, Sakari Ailus wrote:
> > > Remove kernel-doc comments from  regular callback functions. These
> > > comments have no information value.
> > >
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> >
> > This might be easy, but how is this related to metadata ?
> > This is a 29 patch series that prepares for an 89 patch series.
>
> Not directly, but not doing this now will require documenting the new
> arguments soon or we'd start getting warnings from the build. Writing
> documentation that shouldn't exist would be entirely non-productive work.
>

I see. Thanks for explaining

> >
> > review time is not free, piling stuff over stuff is a recipe for
> > making sure we'll never merge this.
> >
> > Anyway
> > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>
> Thank you.
>
> --
> Sakari Ailus

