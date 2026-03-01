Return-Path: <linux-media+bounces-54012-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0OE6EzNVpGmKeAUAu9opvQ
	(envelope-from <linux-media+bounces-54012-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 16:03:15 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E380D1D053B
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 16:03:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1D3F630066A6
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 15:03:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2DF82D0C7E;
	Sun,  1 Mar 2026 15:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FU9a6EMy"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95EC3203A0
	for <linux-media@vger.kernel.org>; Sun,  1 Mar 2026 15:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772377390; cv=none; b=RZxG164Btu/kkGdg/ov6P7jLV+tJzxUrXoO4Ada9wosHO5GjtiMAWPu1dF/5nZwqi94M2qdKLqrDPkKHWEaAjRNmQkT8eL3QnWiRVKTVTkbYEyImE9cNUcg6QZI0Rzc5WXf+ySkDnOmJ2wcYOewn5t8FCTXo2jBnZ/GJ12/W/Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772377390; c=relaxed/simple;
	bh=72fEdj4+6b8yMhVLPM7xV9wBLwmPkzC1LTkcCCUGDaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=siV+vps/OxgvOX3w2w7qhXjlopSebC6S7Zf8fqD5woiqtPKj+vcRk27EHbiUR4gliHtKcwOTh2e0dXQT8Zuk2w7OE7Cu3nOpt2kBA2lQ9iAPBqdDtQxc/jf2vuDE9VkmujBYJNTftYd4Z9EwnVLfcMhaDYkq47SKjCbb3VVUfGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FU9a6EMy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (unknown [83.245.248.187])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 8B348104C;
	Sun,  1 Mar 2026 16:02:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1772377321;
	bh=72fEdj4+6b8yMhVLPM7xV9wBLwmPkzC1LTkcCCUGDaQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FU9a6EMyeXENM3vr78B4XO3r33+83kCsJ8fINkNUQMW9LC5uj4dLv8E+RjAM8xzMS
	 Dye6Kw5krK5CbHTTQJHmL+IycrOZMlf6yDjJTjk7RPQarRkQLd5koiYQ/1TWC/B8/d
	 1FbNnNIsyiqSa6Rkv0OGpnG7eOL7ECqkLXkVcHcI=
Date: Sun, 1 Mar 2026 16:02:59 +0100
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sean Young <sean@mess.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Tomasz Figa <tfiga@chromium.org>,
	"Hu, Jerry W" <jerry.w.hu@intel.com>,
	Steve Cho <stevecho@chromium.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Hans de Goede <hansg@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Subject: Re: [ANN] Media Summit on May 26th in Nice, France
Message-ID: <20260301150259.GD2860169@killaraus.ideasonboard.com>
References: <92e24f36-d189-4ba8-ad0b-43277bc1aabd@kernel.org>
 <2f0c3f41-93fa-4a1f-aad2-b59ebbc59909@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2f0c3f41-93fa-4a1f-aad2-b59ebbc59909@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-54012-lists,linux-media=lfdr.de];
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
	RCPT_COUNT_TWELVE(0.00)[24];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ideasonboard.com:dkim,killaraus.ideasonboard.com:mid,embedded-recipes.org:url]
X-Rspamd-Queue-Id: E380D1D053B
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 10:12:12AM +0100, Hans Verkuil wrote:
> Hi all,
> 
> A gentle reminder to let me know by email if you will join this year's Media Summit.
> I only received 7 confirmations until now, so there is room for quite a few more.
> 
> Also, please reply to this email if you have topics that you would like to discuss.
> Just 'Reply All' to this announcement and give the topic title, a short description and
> a guesstimate of the time you need for your topic.

If there's an interest, I can present a summary of the ISP development
efforts since the last media summit.

Title: Status of ISP support in V4L2

Description: Summary of ISP-related development in V4L2 since the last
Linux Media Summit. This includes a brief overview of technical
developments, and a summary of the efforts to engage with vendors.

Time estimate: 15 minutes


I would also like to revive efforts to properly support dmabuf import
for multi-planar formats with configurable plane offsets (a.k.a. data
offsets), but I think this requires a champion to resume the work more
than a discussion at the media summit.

> And here is my topic:
> 
> Title: Discussion of the media subsystem development process
> 
> Description: Review of the multi-committer model: current status and next steps.
> Are there any bottlenecks, any ideas for improvements, w.r.t. the development process?
> 
> Guesstimate: 1 hour
> 
> Regards,
> 
> 	Hans
> 
> On 16/01/2026 14:29, Hans Verkuil wrote:
> > (Please pass this on to anyone you think might be interested in this!)
> > 
> > Hi all,
> > 
> > This year's Media Summit will be held on Tuesday May 26th the day before the
> > Embedded Recipes Conference in Nice, France:
> > 
> > https://embedded-recipes.org/2026/
> > 
> > The Media Summit will be held at Hotel Campanile and in the same meeting room
> > as last year (Nikaia):
> > 
> > https://nice-aeroport.campanile.com/en-us/
> > 
> > It is close to the Airport and to the Embedded Recipes venue.
> > 
> > The meeting room can hold up to 30 people and I will provide video conferencing support,
> > just like last year. The location and the meeting room was quite nice last year, so
> > I saw no need to change it.
> > 
> > That said, in-person participation is very much preferred. This yearly summit is meant
> > for active media developers to meet face-to-face and to discuss media subsystem issues.
> > 
> > And it is also a good opportunity to talk to each other during the Embedded Recipes
> > conference to discuss topics in a smaller group. But if you are an active media developer
> > and are really not able to attend in person, then remote participation is an option.
> > 
> > If you want to attend the meeting (either in person or remote), then send an email to me
> > directly. The deadline for in-person attendance is May 14 as the hotel needs to know the
> > final number of attendees by then.
> > 
> > There is no registration fee, the meeting room is sponsored by Cisco and Collabora, and
> > the lunch is sponsored by Ideas on Board! Many thanks to our sponsors, it's very much
> > appreciated.
> > 
> > If you have a topic that you want to discuss, just 'Reply All' to this announcement
> > and give the topic title, a short description and a guesstimate of the time you need
> > for your topic.
> > 
> > See last year's Media Summit Report as an example of what to expect:
> > 
> > https://lore.kernel.org/linux-media/21769183-ca57-4f8f-818a-6a1ad089298d@jjverkuil.nl/
> > 
> > This announcement goes out quite early for once, usually it takes a lot longer
> > to organize, but having it in the same place as before made life so much easier.
> > 
> > Regards,
> > 
> > 	Hans
> > 
> > PS: Be aware that May 24 and 25 are public holidays in France. So many shops may be
> > closed those days.

-- 
Regards,

Laurent Pinchart

