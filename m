Return-Path: <linux-media+bounces-15428-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7795693F08B
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 11:01:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D040EB21D71
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 09:01:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A291313B2A4;
	Mon, 29 Jul 2024 09:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ciST57DJ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBB47E782
	for <linux-media@vger.kernel.org>; Mon, 29 Jul 2024 09:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722243665; cv=none; b=d3FT8H4OMbPmuIOTqIBI9htFKK/e7jt9QjudZgeIPdjNIrDLQjkg0nDnEPFdSlm7AnWJzBH6iT5wBeUQkHVAiVyIqGZZNBGKlBng10BAWhYg/oyt3MQ/2YybQDAmOl8bdRi0u3O14OsQdRtRk5IKLS10NaeUx2vZGW0Jlf0cQFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722243665; c=relaxed/simple;
	bh=I8zYzcPdurvIGl7igAQ8MfsJOaLrZ21TCoAHzs+4iLk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aSDSP3639xiI0ImX3mTVR+QjRDR0VAwMGt79wWmhLX3o5lzZTZeeUy5IrB4IhrrAU1+wgs1hPXjMDOjYMs1QzDJU10laehgCNUUTDnYXwz3o0nbkyImrySsi/VJeRPYaXgg6u2+fHwlP8OotUmxsTGfUtQZ2eEcuXMJVWN2vi1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ciST57DJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A34ED63F;
	Mon, 29 Jul 2024 11:00:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1722243615;
	bh=I8zYzcPdurvIGl7igAQ8MfsJOaLrZ21TCoAHzs+4iLk=;
	h=Date:From:To:Cc:Subject:From;
	b=ciST57DJ0pyrfgRyak0Bm41NDbltNDKvvrtCqCW5nx22fkEJa6FrTfQ8oEqpaXP6p
	 +kjxWKogUURdBdBCz4XHhYhfqsZloYMFvn2fGRscahXKBrpFdxznKFGaCmSG9h3tF0
	 DUYMYC0vRdEowijXmisVQbD+bzOiBfxq6mhx8v+I=
Date: Mon, 29 Jul 2024 12:00:42 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: libcamera-devel@lists.libcamera.org
Cc: linux-media@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Interest for a libcamera workshop in Vienna - September 17th
Message-ID: <20240729090042.GA2725@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello everybody,

Following the success of our workshop in Brussels in February, we would
like to host another event in September.

We have evaluated different options, and opted for week 38 in Vienna.
The city will host during that week the Linux Media Summit (Monday the
16th, [1]), OSS Europe (Monday the 16th to Wednesday the 18th, [2]) and
the Linux Plumbers Conference (Wednesday the 18th to Friday the 20th,
[3]), and we expect that co-locating with those events will ease travel
for attendees of the libcamera workshop.

The week is already busy with camera-related events on Monday with the
Linux Media Summit, and on Thursday afternoon with the Complex Camera
micro-conference at LPC ([4]). We have therefore selected Tuesday the
17th for libcamera.

To help us plan the venue, could you please register your interest by
replying to this e-mail, either publicly, or in private to Kieran and me
? The event will be free of charge for attendees.

Please also let us know if you have any preferred discussion topics you
would like to include. We will draft and circulate an agenda in the next
few weeks.

[1] https://lore.kernel.org/all/ae3b6b11-c3ec-4a3d-8fa1-c91ef2f8e151@xs4all.nl/
[2] https://events.linuxfoundation.org/open-source-summit-europe/
[3] https://lpc.events/
[4] https://lpc.events/event/18/sessions/193/

-- 
Regards,

Laurent Pinchart

