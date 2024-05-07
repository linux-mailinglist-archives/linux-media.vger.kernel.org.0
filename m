Return-Path: <linux-media+bounces-11060-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5A48BE8A6
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 18:20:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D0691C22362
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 16:20:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5394916D335;
	Tue,  7 May 2024 16:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tIzknbWx"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012C616D31A;
	Tue,  7 May 2024 16:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715098759; cv=none; b=BGGa3eKM4vZWRZgOL3zC9SQ1lmg61tou6jen58Ba2PTkF7C6+ad6nGx76au1A46C9s1pUHYhnaaIpX/58BP04gdpWAQrYxumwY/5fDT0uKA8nFQNNic5ZbNkZ99ZgdNCf2aiwHPt2oEq8R8qPbaGC8FMs+hZVGzGuQAB5NUbevo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715098759; c=relaxed/simple;
	bh=LyGefRxD5xlo5lS4O2VUS5NUj0NvYAzLg/qt+y2QrF8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DExOQXOyg9fvkLc5UD8qIV0J+NDWA/WS+CwCVTQfgXFf7A+9WwLUsw6ObHiOk76GsEayMgVyv9d6fZhcBNWIC9dBSrU4N6mC0fisvrGi4kJFaQsVOvzd9ngTwKk2LLSUypa6OLrpR2rRLdqfj/7S/fENc32B/Lm+zYV7CxjOpJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tIzknbWx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 83E5222A;
	Tue,  7 May 2024 18:19:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715098753;
	bh=LyGefRxD5xlo5lS4O2VUS5NUj0NvYAzLg/qt+y2QrF8=;
	h=From:To:Cc:Subject:Date:From;
	b=tIzknbWx/NbgBwyRWq4x1yCkguBFgcV1+El+UOFK0JME/uHPmEKmrbpWSQFHjzApv
	 zZdkth+KyKA6HgY+1b6wOP6AMe4B00Rv2WxiKm2pGtbzoaHl6fu8KydYuzYDI44PPC
	 udOBuxJcVwPSdDos1q8OpWit3vAMFG4rkFyhPnNI=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v3 0/2] media: v4l2-subdev: Support const-awareness in state accessors
Date: Tue,  7 May 2024 19:19:05 +0300
Message-ID: <20240507161907.27747-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small patch series comes from a mild annoyance I experienced during
a recent patch review, where I wanted to ask for a pointer to a
v4l2_subdev_state used to access the state in a read-only fashion to be
made const. This wasn't possible as the state accessors functions take a
non-const state pointer, in order to return pointers to mutable formats
and selection rectangles.

Patch 1/2 improves the state accessors to support const states, in the
same wait as the recently introduced container_of_const() macro.
Bikeshedding of the internal macro and function names is expected. Patch
2/2 then shows how this can be used in one driver.

Compared to v2, patch 1/2 uses explicit types as _Generic() selectors,
and fixes an issue with the const cast of the value.

Laurent Pinchart (2):
  media: v4l2-subdev: Provide const-aware subdev state accessors
  media: rkisp1: Mark subdev state pointers as const

 .../platform/rockchip/rkisp1/rkisp1-isp.c     |  8 ++--
 .../platform/rockchip/rkisp1/rkisp1-resizer.c |  8 ++--
 include/media/v4l2-subdev.h                   | 40 +++++++++++++------
 3 files changed, 35 insertions(+), 21 deletions(-)


base-commit: e695668af8523b059127dfa8b261c76e7c9cde10
-- 
Regards,

Laurent Pinchart


