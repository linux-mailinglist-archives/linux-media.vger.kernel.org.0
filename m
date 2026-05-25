Return-Path: <linux-media+bounces-62723-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLIDEVZtFGoTNQcAu9opvQ
	(envelope-from <linux-media+bounces-62723-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 17:40:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E9C5CC654
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 17:40:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 93F80301468C
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 15:40:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40B293EDE72;
	Mon, 25 May 2026 15:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tu7W9/g2"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A459D2E7F3A
	for <linux-media@vger.kernel.org>; Mon, 25 May 2026 15:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779723599; cv=none; b=rpNZKwZqodzhP2moxhyAw9tt2r+OIqf4x02SZyKmh71YPPOcm8iwg02IV02gSBmDmQZIuhDYautRUyiqNsOzeALUrD1k9nLhIpZ7VmD6lE7gjawYm339huj2hZe7kdvyj/RA8JyBsZ0OTSpqO40f7OA6YNBaAqB+er60JSt7tFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779723599; c=relaxed/simple;
	bh=6Mxi2ebcjnIAe3vY8mCbzvpLw7qlAGs3WqFRpvDWXeA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RtDPAVh4kdaBIo0+ZnximQA1jtZ6seOFsMExAB4bdbYpDUMgOyxwOLLLswJICFtYczlga1C+1Nu98jKAP/Ho4PZGpNysvkevp6oB2m02QBjMA4ErHPYdTPIPxLa8uqd+OdDmiRm13g2g03EhBGaImCS9ua+lV99tp9bO24ZxHVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tu7W9/g2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (84.134.69.85.rev.sfr.net [85.69.134.84])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 30E387FA;
	Mon, 25 May 2026 17:39:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1779723577;
	bh=6Mxi2ebcjnIAe3vY8mCbzvpLw7qlAGs3WqFRpvDWXeA=;
	h=Date:From:To:Cc:Subject:From;
	b=tu7W9/g2RRQgb2N8fjLG8yYUVVtfCuqUJjHp/0B1JHikMx9V50L64MfD6uRhFg9M5
	 +GWFOIv0hAzte2L9ocaMC4jzPLZEmkHoNLF5Vvh4Lp6SAhVTtnRn68vskPcN631rXO
	 OUIFbarnQQNSzWcbV0tOLtlTj4EEYfdcqwDJZbsQ=
Date: Mon, 25 May 2026 17:39:53 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: libcamera-devel@lists.libcamera.org
Cc: linux-media@vger.kernel.org,
	Barnabas =?utf-8?B?UMWRY3pl?= <barnabas.pocze@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Devarsh Thakkar <devarsht@ti.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Konstantin Babin <Konstantin.Babin@arm.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
	Simon Parri <simonparri@ganzeria.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Suresh Vankadara <svankada@qti.qualcomm.com>
Subject: [ANNOUNCEMENT] libcamera workshop 2026 - Logistics and agenda
Message-ID: <20260525153953.GA300256@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62723-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,ideasonboard.com,raspberrypi.com,ti.com,arm.com,linux.intel.com,ndufresne.ca,gmail.com,ganzeria.com,qti.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[15];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[openstreetmap.org:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: A7E9C5CC654
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello everybody,

I'm looking forward to seeing you all on Friday the 29th of May for the
libcamera workshop. Here is the agenda draft, along with logistics
information for on-site and remote attendees.

The workshop is organized as part of the "Embedded Week in Nice" ([1])
and will be located at the Radisson Blu Hotel Nice ([2]), four tram
stops away from the Embedded Recipes location. We will welcome you from
08:30 in "Salle Courants", which will be identified by the libcamera
logo.

As all workshop agendas, this is tentative and we will adjust the exact
timing depending on how the discussions progress.

09:00 - 09:15  Welcome and agenda bashing
09:15 - 10:00  libcamera roadmap and ongoing work (Kieran Bingham)
10:00 - 10:30  Break
10:30 - 11:15  Passing vendor settings to pipeline & IPA (Naush Patuck)
11:15 - 12:00  Control queues (David Plowman)
12:00 - 12:30  Camera module identification (Stefan Klug)
12:30 - 13:30  Lunch
13:30 - 14:15  Memory allocation & request management (Nicolas Dufresne)
14:15 - 15:00  Bayer reprocessing (David Plowman)
15:00 - 15:30  Break
15:30 - 16:15  ISP parameters synchronization (Jacopo Mondi)
16:15 - 17:00  Feedback on the state of GStreamer support (Nicolas Dufresne)
17:00 - 18:00  TBD

Each agenda item is listed with the name of the person who proposed it.
We expect those persons to introduce the topic (orally or with slides,
at your discretion) and drive the discussion.

We will use Jitsi Meet for remote access. The event will be accessible
at https://meet.jit.si/libcamera-workshop-nice-2026. We can however
not guarantee the quality of the network connection on site.

All times are in the CEST (UTC+2) time zone. If you plan to attend
remotely and are located in a time zone that makes the agenda items you
are most interested in occur at an inconvenient time, please let me know
and we will try to reorder the discussion topics.

Discussions will not be recorded, but the minutes of the workshop will
be posted to the mailing list after the event.

[1] https://embedded-recipes.org/2026/colo/#libcamera
[2] https://www.openstreetmap.org/relation/5130684

-- 
Regards,

Laurent Pinchart

