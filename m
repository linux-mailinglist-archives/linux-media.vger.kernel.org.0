Return-Path: <linux-media+bounces-12796-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 91552901936
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 03:23:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2EB8D1F21A6E
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 01:23:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76E2D1876;
	Mon, 10 Jun 2024 01:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="u0IDqLhP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464D81860
	for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 01:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717982581; cv=none; b=kHfe6FAenvOtQg0i7kfKzFlboeYb8cJ6e67mUADoqlQeLkyaTTPoaoMfUkM6551XZ3+5ZfTrdtjSI3j42/7nE6ynSM9a7VDukpOgA5nATjEm916ximRhVbJGyTj9x0LlZ41gc1TmQ7ZWEGHlQI1DKzL15BYr4c2wCWF4Su5t+cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717982581; c=relaxed/simple;
	bh=24IU3gPO62sk/Fsq1UlG4fvcMuDlYKh4oEFIdu5bpeY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hggXh9CBS28MHC6KEkxysEBsYTscyH6OcfQiMrCR1BEB/LtYf0uBviQVRVQnSHj12kB818w30NCpa8Dv6Nlf9sc2b1VmFbyWGReCwFUJvPOkgskv7jvS38csKPjq8ws1oqrenL6mU7s23zJHhtJSRaL5aJuhUYwGehcYDs0iAK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=u0IDqLhP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 642DB230;
	Mon, 10 Jun 2024 03:22:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1717982566;
	bh=24IU3gPO62sk/Fsq1UlG4fvcMuDlYKh4oEFIdu5bpeY=;
	h=From:To:Cc:Subject:Date:From;
	b=u0IDqLhPgWp7ZFW4urLlPEL+BzoYKCCHoKFUdmZNTmRuij/H4OVj8Z5fLn1l6r6cI
	 7FLx0QcsyNdKJ+DmcSmTZyy8cEMn6O+ZBHajOk2wia8bjYuKPDNDHMZEJE0bt5UsIz
	 qmZtBgk3RUphwoGOTg9In3SPhH0hsT7fAuJeCN3U=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [v4l-utils] [PATCH v1 0/3] media-ctl: Add support for subdev TRY state
Date: Mon, 10 Jun 2024 04:22:35 +0300
Message-ID: <20240610012238.30462-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This small patch series extends media-ctl to support subdev TRY states.
Doing so allows retrieving the default state of subdevs, or trying
configurations.

The approach is quite straightforward: patch 1/3 replaces the hardcoded
ACTIVE state in libv4l2subdev with a 'which' argument, patch 2/3 does
the same for the internal functions of media-ctl, and patch 3/3 adds a
-W/--which argument to media-ctl. When the argument is not set, the
ACTIVE state is selected, preserving the existing behaviour.

Laurent Pinchart (3):
  libv4l2subdev: Extend API with 'which' argument where missing
  utils: media-ctl: Prepare for TRY state support
  utils: media-ctl: Support accessing the subdev TRY state

 utils/media-ctl/libv4l2subdev.c | 65 +++++++++++++++++++++------------
 utils/media-ctl/media-ctl.c     | 37 +++++++++++--------
 utils/media-ctl/options.c       | 18 ++++++++-
 utils/media-ctl/options.h       |  1 +
 utils/media-ctl/v4l2subdev.h    | 49 ++++++++++++++++++++++---
 5 files changed, 123 insertions(+), 47 deletions(-)


base-commit: f4cf30a8b50f54210e181ecadbffaee4ce088e5e
-- 
Regards,

Laurent Pinchart


