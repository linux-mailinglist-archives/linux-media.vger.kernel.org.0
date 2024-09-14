Return-Path: <linux-media+bounces-18293-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B50CB9793D1
	for <lists+linux-media@lfdr.de>; Sun, 15 Sep 2024 01:43:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DCBBF1C21230
	for <lists+linux-media@lfdr.de>; Sat, 14 Sep 2024 23:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D95A145A07;
	Sat, 14 Sep 2024 23:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hGxL/XwR"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15231754B
	for <linux-media@vger.kernel.org>; Sat, 14 Sep 2024 23:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726357424; cv=none; b=YQSi9bhl2Yif7Mv/BdV5ef4BL3ZNg4+SRt9d2b/Cf+s02pyYImunZ2dXlpxt8D0/joAjuFCg8WKuaf4FzgHa9Pit41HIKCjxg3c/nF2DHyPWra1UQ6MoxlaNX8eBz1I3+buVl/A1u9lPFQx9YchX3SggAB5Or1CJwfuhxJOOGhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726357424; c=relaxed/simple;
	bh=p+i8RUntqrtEv8g2yMfDA7ZOus5C0OAu8MGJJWnMauM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pfzHu3MxLl+USB2+oNOmZjQHY7dNBB/u6Ig3b6r7zmbPTCtZF6zT4Kq1AwmpM6J4HZokTFl4we3x59iJlM0PeaRicEGYTN60gXtMIs9G0lRIa0wcC/gCT+DNAHelFKhaZqOaEu1ceJZZDPYneI/cnqXPkualkBKYLAICBvIoJbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hGxL/XwR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (213-229-8-243.static.upcbusiness.at [213.229.8.243])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 24C8E219;
	Sun, 15 Sep 2024 01:42:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1726357334;
	bh=p+i8RUntqrtEv8g2yMfDA7ZOus5C0OAu8MGJJWnMauM=;
	h=Date:From:To:Cc:Subject:From;
	b=hGxL/XwRiDkB2cyoys4jZsfGC+kNuqE0FJAO/6H3OMgqoyyj+zqgf5d3eSYjPFHNL
	 K3o8CFu5biOkik/W2YNNpG8NPg2p+m1cCShHiwSz5MX2T4LSuCzO6lQG2LHG+p49XN
	 q41/ayLxao4kWc7ysKI01SBHJ8rJDojjcCEBkrUA=
Date: Sun, 15 Sep 2024 02:43:00 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: libcamera-devel@lists.libcamera.org
Cc: linux-media@vger.kernel.org
Subject: libcamera workshop in Vienna - September 17th - Agenda
Message-ID: <20240914234300.GA28657@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello,

Here's the agenda for the workshop on Tuesday. As all workshop agendas,
it's tentative and we will adjust the exact timing depending on how the
discussions progress.

09:00 - 09:15  Welcome and agenda bashing
09:15 - 10:00  Non-image data streams (Naush Patuck)
10:00 - 10:45  Per-stream controls (Naush Patuck)
10:45 - 11:15  Break
11:15 - 12:00  What and how we would like to achieve with software ISP
               in the foreseeable future (Milan Zamazal)
12:00 - 12:45  Post processing with pipeline handler (Jerry W Hu)
12:45 - 13:45  Lunch
13:45 - 14:30  libcamera and Khronos Kamaros (Suresh Vankadara)
14:30 - 15:15  Raw reprocessing API (Naush Patuck)
15:15 - 15:45  Break
15:45 - 16:30  Specify tuning file at camera open/acquire time (Naush
               Patuck)
16:30 - 17:15  Cache handling (Robert Mader)
17:15 - 18:00  TBD

Each agenda item is listed with the name of the person who proposed it.
We expect those persons to introduce the topic (orally or with slides,
at your discretion) and drive the discussion. We will take care of
topics proposed by people who unfortunately won't be able to attend.

We will use Jitsi Meet for remote access. The event will be accessible
at https://meet.jit.si/libcamera-workshop-vienna-2024. We can however
not guarantee the quality of the network connection on site.

All times are in the CEST (UTC+2) time zone. If you plan to attend
remotely and are located in a time zone that makes the agenda items you
are most interested in occur at an inconvenient time, please let me know
and we will try to reorder the discussion topics.

Discussions will not be recorded, but the minutes of the workshop will
be posted to the mailing list after the event.

-- 
Regards,

Laurent Pinchart


