Return-Path: <linux-media+bounces-58736-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0DUVFzEZ3mmFnAkAu9opvQ
	(envelope-from <linux-media+bounces-58736-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 12:38:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A369C3F8D30
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 12:38:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 38CFE3059FE6
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 10:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAAF935A952;
	Tue, 14 Apr 2026 10:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Mrf4yW+J"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869D73D6CD7;
	Tue, 14 Apr 2026 10:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776162806; cv=none; b=gcZC53G4f3ofwlvjRk8n3mwfBPgnR3zIGFvusM66mYf/fMGvsbBq70bH/AHwENOTkX/gVlZvJQ6SwNFckuzdvI9tfIW1A205uPI0c7Ge/OY7Yr0T8I2C7HYd8DDPa8KEIZebNX4z/I08GttTKuM2F8/QFeJEAMmlXXPIpZRScZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776162806; c=relaxed/simple;
	bh=j3gm+iLaEL8WRuEuzb9NdgT+b7ApkWWcUYD4kvbV65I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ewvZza7NNyeMJnEy0Q/9vI/3bdTAHC3J/u9gw6PaNQ4rXWuM3O/GxAnzs1ijPpOEON8PtEbXnRj2En7G8hsmXihPqMyIsRJp3XrPYhMapUL8e8NqpYT8vZvp4v+ox2MQBQQFWBB5HUXdV9tiv4q/0uj0Txa4RoCU8psIGJXwWWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Mrf4yW+J; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 6A0DD225;
	Tue, 14 Apr 2026 12:31:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776162704;
	bh=j3gm+iLaEL8WRuEuzb9NdgT+b7ApkWWcUYD4kvbV65I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mrf4yW+JqdwljbE9dioHm1NkWf6A+TsdMU4TP7Z925URtyRd9lxzpqgatsOWwyyLQ
	 9hR5mCbhMoerdcKEuD42bv0C7QZKG3XuXuvvaiCA/ez5oAhkRQfXdMngEuQJYpmZR3
	 CWYKr8TpXQPqrBH/i8ixQ1dbBZEhmApL8sbe9jfM=
Date: Tue, 14 Apr 2026 13:33:15 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] media: i2c: add os02g10 image sensor driver
Message-ID: <20260414103315.GA1023076@killaraus.ideasonboard.com>
References: <20260414084952.217215-1-elgin.perumbilly@siliconsignals.io>
 <20260414084952.217215-3-elgin.perumbilly@siliconsignals.io>
 <20260414092758.GE4061@killaraus.ideasonboard.com>
 <MA0P287MB2178FAA81D07B561FA68014988252@MA0P287MB2178.INDP287.PROD.OUTLOOK.COM>
 <20260414095727.GF4061@killaraus.ideasonboard.com>
 <PN3P287MB1829155B216E557C7DF7B6778B252@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PN3P287MB1829155B216E557C7DF7B6778B252@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58736-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[siliconsignals.io:email,ideasonboard.com:dkim,killaraus.ideasonboard.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A369C3F8D30
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 14, 2026 at 10:19:23AM +0000, Tarang Raval wrote:
> > On Tue, Apr 14, 2026 at 09:43:32AM +0000, Elgin Perumbilly wrote:
> > > > On Tue, Apr 14, 2026 at 02:19:45PM +0530, Elgin Perumbilly wrote:
> > > > > Add a v4l2 subdevice driver for the Omnivision os02g10 sensor.
> > > > >
> > > > > The Omnivision os02g10 is a CMOS image sensor with an active array size of
> > > > > 1920 x 1080.
> > > > >
> > > > > The following features are supported:
> > > > > - Manual exposure an gain control support
> > > > > - vblank/hblank control support
> > > > > - vflip/hflip control support
> > > > > - Test pattern control support
> > > > > - Supported resolution: 1920 x 1080 @ 30fps (SBGGR10)
> > > > >
> > > > > Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
> > > > > Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>
> > > > > ---
> > > > >  MAINTAINERS                 |    1 +
> > > > >  drivers/media/i2c/Kconfig   |   10 +
> > > > >  drivers/media/i2c/Makefile  |    1 +
> > > > >  drivers/media/i2c/os02g10.c | 1039 +++++++++++++++++++++++++++++++++++
> > > > >  4 files changed, 1051 insertions(+)
> > > > >  create mode 100644 drivers/media/i2c/os02g10.c
> > >
> > > I have added a new function, os02g10_set_framefmt, which dynamically sets
> > > the mode register.
> > >
> > > Please let me know if I have missed anything or if further changes are
> > > needed.
> >
> > You also need to drop the supported_modes array, and implement support
> > for .set_selection().
> 
> Are you suggesting that we should drop the array below?

Correct.

> static const struct os02g10_mode supported_modes[] = {
>     {
>         .width = 1920,
>         .height = 1080,
>         .vts_def = 1246,
>         .hts_def = 1082,
>         .exp_def = 1100,
>         .x_start = 2,
>         .y_start = 6,
>     },
> };
> 
> If we remove this, how would we provide mode-specific parameters such as VTS?

Those should be computed by the driver based on the format and crop
rectangle configured by userspace.

-- 
Regards,

Laurent Pinchart

