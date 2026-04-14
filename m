Return-Path: <linux-media+bounces-58758-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gCP5NSmD3ml9FQAAu9opvQ
	(envelope-from <linux-media+bounces-58758-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 20:10:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB673FD7E6
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 20:10:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 75AE1306EE3D
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 18:09:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 755D6313298;
	Tue, 14 Apr 2026 18:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kYKRxcLO"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65035310645
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 18:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776190191; cv=none; b=mQUQTwoMhmM8OAwOOPbKFsN9wCB385x6X1FWubZiZkocTmQdS0bN5PMlIu4Q0+4lcHs5NTkmoNBZ4mH76Oxp9HylKLRUzKoQSJZLooiPsh26JTFI/M+VAqcBhWHbaxM9a7AcAhgp7/lEIHtPz3Qpp4D6DZPUlXL2VVJOXI17pdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776190191; c=relaxed/simple;
	bh=mmnwV9+d2a04HZVp+TJmC1RODyLEP9dl/mGZDXSVfwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uvHm/kp18/ArM3eclP3S6AhAMC2yYkgMtefps8wCYLW3JZ1ftFgY5FE9NsgvBep+kMSyuuiK8dSy5q1rZNWHvLjTU4xtcwFasNsjAg3vXXvExaDc1EL3SVGtZ/TDUtXFAml3nnl+BudLlLsEllzXJbzU9WdG/xmrm/6EptslqLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kYKRxcLO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 8488F1849;
	Tue, 14 Apr 2026 20:08:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776190094;
	bh=mmnwV9+d2a04HZVp+TJmC1RODyLEP9dl/mGZDXSVfwA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kYKRxcLOhEVhWYTC7EtIKO1qiEmu8QyDAWPUyG58w5CPg+7KFt/9u1ZgzLz3oiLKV
	 2cBPh04t8ivjL2RUTQI2OoQER19C1fS/yB1bjYBW4d8GllSfbXnSEPsAfU/UlR8Ls3
	 Zl7bSOERKW45wO1vsUjEXa6weCoV0s7xPhxvNPU8=
Date: Tue, 14 Apr 2026 21:09:45 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sean Young <sean@mess.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Tomasz Figa <tfiga@chromium.org>, Steve Cho <stevecho@chromium.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Hans de Goede <hansg@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Brandon Brnich <b-brnich@ti.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Sven =?utf-8?Q?P=C3=BCschel?= <s.pueschel@pengutronix.de>,
	Devarsh Thakkar <devarsht@ti.com>,
	Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
	Jackson Lee <jackson.lee@chipsnmedia.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	"Padhi, Beleswar" <b-padhi@ti.com>,
	"Donadkar, Rishikesh" <r-donadkar@ti.com>,
	Rouven Czerwinski <rouven.czerwinski@linaro.org>
Subject: Re: [ANNv4] Media Summit on May 26th in Nice, France
Message-ID: <20260414180945.GL4061@killaraus.ideasonboard.com>
References: <20260413201907.GD4034@killaraus.ideasonboard.com>
 <becd4dc0fe49c9d63fa6b49aab5afb3c4cffa8af.camel@collabora.com>
 <20260413211602.GE4034@killaraus.ideasonboard.com>
 <b427dccb-d512-470f-9a42-0f9d153dd1b5@kernel.org>
 <CANiDSCtHpzVf7KEYoH+tA3RwN5kqQ=5CVp3WR-xPdCMpQ=2x6w@mail.gmail.com>
 <420e20b3-4264-4ab0-bb50-1ae60f6c837a@collabora.com>
 <20260414074230.GB4061@killaraus.ideasonboard.com>
 <CAFEp6-3yQGp5R-B5VajUsmszFOTCFggCXuUa_dyXXULp0bk7Dw@mail.gmail.com>
 <20260414084259.GC4061@killaraus.ideasonboard.com>
 <6e4f376fd3d1624a502cb6634e0f855af7d223f5.camel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6e4f376fd3d1624a502cb6634e0f855af7d223f5.camel@collabora.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-58758-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_TWELVE(0.00)[36];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6AB673FD7E6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 14, 2026 at 01:55:20PM -0400, Nicolas Dufresne wrote:
> Hey,
> 
> Le mardi 14 avril 2026 à 11:42 +0300, Laurent Pinchart a écrit :
> > Let's not reproduce the design mistakes made in the V4L2 M2M framework.
> > 
> > I also think you need to decouple the context handling and scheduling in
> > two separate components. They need to work together, but shouldn't be
> > bundled into a monolithic system. Very importantly, a driver should be
> > able to implement contexts with the multi-context helpers, and implement
> > custom scheduling itself.
> 
> Note that the v4l2_m2m_dev is juts miss-named, it does not wrap a specific dev
> instance anymore. I'll rename and clean that up eventually, but I agree its not
> meant for your purpose, and it will be a good fight to use. Its already a pretty
> big miss-fit for stateful codec, which don't really have the notion of "active
> central job". Jacopo's proposal is to have multi-context MC (as you already
> know), making the media device as the central source of context, so I think
> that's a path in the right direction.
> 
> But I'll be honest, I would see a future where we actually drop (or break down
> into pieces) VB2, which is I read you well, its not miss-aligned with your say.

I won't object :-) vb2 was designed as a midlayer, and that causes
headaches (I'm thinking in particular about how .start_streaming() is
delayed until buffers get queued). I have less issues with vb2 than with
the M2M midlayer, as vb2 gets less in the way, but I think we should
overall favour for new developments smaller helpers that drivers can
assemble based on their needs over monolithic midlayers.

-- 
Regards,

Laurent Pinchart

