Return-Path: <linux-media+bounces-54096-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oITbNoyYpWnXEgYAu9opvQ
	(envelope-from <linux-media+bounces-54096-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 15:02:52 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A34491DA4B6
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 15:02:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CD69D3023174
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2026 14:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45C1F3FB06D;
	Mon,  2 Mar 2026 14:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BWYnN6O8"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91C73F23DD
	for <linux-media@vger.kernel.org>; Mon,  2 Mar 2026 14:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772460130; cv=none; b=rcDuVCqoNfTW9Sp1x3ID0Zni9LWo/t+AStAqTJkawoFK3AOQUREkqtJpm+ZisdjlsNMkEHOfKgyzuT/VGd1xg1sBJKazFvQ/QL+Hj6UiG0KWdgY7pg1xaul04S1quc9CunwWkOFwbKa98DZyQt/GKriGVn9N/WMRtbl3dlE5MYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772460130; c=relaxed/simple;
	bh=3B2N7sez3thF2hYw4aqbeyWiXspqAcaKRj+OR/HobK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jhu/mUjnF8Aqq8tjn2awOQA3QsrRy5Gn7UMIfybL+i3zTtRnmjTciq0SUsPkksdPpdCn9k77Xr/sX7Uf0dCBstmtr6iLFlUjyMikTe4ogUnNdq1rbJIA2Y9Q/GPjQBf0SIwi7LgkmP8N0OoAM3ELponnwNSTwNys7rje+KyDMhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BWYnN6O8; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (unknown [83.245.248.187])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 3C575C6C;
	Mon,  2 Mar 2026 15:00:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1772460057;
	bh=3B2N7sez3thF2hYw4aqbeyWiXspqAcaKRj+OR/HobK4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BWYnN6O81etTd0bgaUImlT6+OKPSwaCa9Vk7y8SWHfnnngsyuXBnRB3P+1H60GyEi
	 b/rFW6/NKay7UMtXlhLPDrgcufggo1lKAIjFk821TBZX4nVWbK6he21kIAhmgNB/2G
	 ByFdxA7e57ZuX3wF8jf+DjVboNqVRbz+qG+aaNpo=
Date: Mon, 2 Mar 2026 15:01:54 +0100
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sean Young <sean@mess.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
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
	Maxime Ripard <mripard@kernel.org>
Subject: Re: [ANN] Media Summit on May 26th in Nice, France
Message-ID: <20260302140154.GA3360678@killaraus.ideasonboard.com>
References: <92e24f36-d189-4ba8-ad0b-43277bc1aabd@kernel.org>
 <2f0c3f41-93fa-4a1f-aad2-b59ebbc59909@kernel.org>
 <20260301150259.GD2860169@killaraus.ideasonboard.com>
 <77aff6321715c2141257d1f114c6bd70c7ac2d29.camel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <77aff6321715c2141257d1f114c6bd70c7ac2d29.camel@collabora.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-54096-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_TWELVE(0.00)[23];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: A34491DA4B6
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 08:55:05AM -0500, Nicolas Dufresne wrote:
> Hi,
> 
> Le dimanche 01 mars 2026 à 16:02 +0100, Laurent Pinchart a écrit :
> > I would also like to revive efforts to properly support dmabuf import
> > for multi-planar formats with configurable plane offsets (a.k.a. data
> > offsets), but I think this requires a champion to resume the work more
> > than a discussion at the media summit.
> 
> I haven't sent my RFC yet about that subject, that will probably be after
> Embedded World. But I think it can serve as example of "possible" way forward.
> And I believe the ChromeOS request should be cited. I think we need more then a
> champion to resume the work, since I personally don't believe in the ancient
> proposal from Collabora. I'd say plan for a little more time on this subject.

Maybe it could then make sense to brainstorm the topic during the media
summit.

> If possible, I would like to add to the agenda a short update related to Vulkan
> Video side of CODECs, what are the viable options for Linux Media and what is in
> preparation outside of our subsystem. The second aspect is informative as these
> discussion don't seem to lean toward our subsystem as the foundation. But I
> think its rather useful for everyone to understand why and what is included.

I'd be interested in hearing about that.

-- 
Regards,

Laurent Pinchart

