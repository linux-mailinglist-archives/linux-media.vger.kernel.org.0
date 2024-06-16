Return-Path: <linux-media+bounces-13341-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D184090A0BE
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 01:14:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E57BA1C20E19
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2024 23:14:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 319F473462;
	Sun, 16 Jun 2024 23:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vxEaWGjp"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFA21C6A8
	for <linux-media@vger.kernel.org>; Sun, 16 Jun 2024 23:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718579654; cv=none; b=bd9FV5Tfxc8kf4h0ghzml3cPTchponQ8HhRRyFjNr+Ve4FUzlNOWQI+XZkJ81++B8v0uYo1wTw4U7UiC4NNCyTNMjzLUxBPENfwogzf6lSHSkK+pI7gm1HdBxMX6gnkbdwR/mtKWYkOPtAp8MspzfIi4jaqIBcBV6AOEAu5vfKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718579654; c=relaxed/simple;
	bh=yS/vOBltHBoOxFyfLGZ3i9wEDHDZq3lQ77n5rKz/ap0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aGzK5+JSzm2rBsvDRoESn24v/D7BMV6zN7mla8DfZtAd/B9RwdeJ6SvoE848prv6i1PGn0II1I1TBCyBHD0P4KRAyEIGNgKVhnU5JtWLofluNEjR4TvafoOG+Ms5mSiitTuDJWIGl0PrY0TLZ2OQXFSjR1SNHzBY5Ux1edDLNNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vxEaWGjp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6BCF82D5;
	Mon, 17 Jun 2024 01:13:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718579635;
	bh=yS/vOBltHBoOxFyfLGZ3i9wEDHDZq3lQ77n5rKz/ap0=;
	h=From:To:Cc:Subject:Date:From;
	b=vxEaWGjp+Jbz/d8+Zz5PsssjBAwCG7lde49b4klnayxyZ3jDj1oai7jKkQd1W+Hc9
	 Dr/P+BRZfrki/gLgfnH0MEMY35Ga7ymmLpKVAojKbjaqbsw0zwQNqXEAHK9WKufmyy
	 eGlytS+BcNN4JCThsDGGjmmzXuyZ0T8+ZCbEqQGU=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v3 0/6] media: uvc: Probe PLF limits at start-up
Date: Mon, 17 Jun 2024 02:13:44 +0300
Message-ID: <20240616231350.6787-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This patch series is a new version of Ricardo's v2 that incorporate my
review feedback and squash v2 7/7 into the appropriate commits. I've
decided to send it as a new version to speed up merging.

As part of the squashing, patch 1/6 now implements a slightly different
filtering logic by ignoring mappings whose .filter_mapping() function
returns NULL. Apart from that, the series should be functionally
equivalento to v2.

The patches have been rebased on my UVC -next branch. The base commit
can be found in
git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git. If
this version is acceptable, I will add it to the branch and send a pull
request in the next few days.

Ricardo Ribalda (6):
  media: uvcvideo: Allow custom control mapping
  media: uvcvideo: Refactor Power Line Frequency limit selection
  media: uvcvideo: Probe the PLF characteristics
  media: uvcvideo: Cleanup version-specific mapping
  media: uvcvideo: Remove PLF device quirking
  media: uvcvideo: Remove mappings form uvc_device_info

 drivers/media/usb/uvc/uvc_ctrl.c   | 184 ++++++++++++++++-------------
 drivers/media/usb/uvc/uvc_driver.c | 131 --------------------
 drivers/media/usb/uvc/uvcvideo.h   |   8 +-
 3 files changed, 105 insertions(+), 218 deletions(-)


base-commit: 75007ad7544c3a4da6b670983fb41cc4cbe8e9b1
-- 
Regards,

Laurent Pinchart


