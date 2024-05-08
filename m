Return-Path: <linux-media+bounces-11174-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE5E8C066C
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2024 23:41:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 979C3B20B18
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2024 21:41:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCFF213280C;
	Wed,  8 May 2024 21:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lsz0/nHU"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E88613175F;
	Wed,  8 May 2024 21:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715204458; cv=none; b=bFui7pBRZiqzad2scEWlHO0GIHiU+pGsleIrtg3WzdhFTGZqyBdQnLwwqU3XR2vUN0dV0GJdTe0uiymd9ARj0hdmETe+OdL4vKqnJtCKeqPWGbr7uNkd9DdpnBKd/OQfWavHnvSE3T54bYs+z4dED0w78KtHhEfW+UKzZoS94mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715204458; c=relaxed/simple;
	bh=sKGmOtVcUTdHHHyght00SZYPiUDaOQWYdoTQwpgcyyg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gk/6dh1CjzAJvpFlPkZNsOamdekQgIdDt3vIO9L16GPHVcBKtuTnSvkkLSmGOksYvHMSu2D2AqG+xB3UF+0Ne+PLKvpQ0h3o2roInaxQ1m7guGCNNGwMJZAL9E4WrHJNtXTQgAxknMSHMJyXFnntGICzXSOiD2zGoGkVtZUIrGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lsz0/nHU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3452716D4;
	Wed,  8 May 2024 23:40:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715204451;
	bh=sKGmOtVcUTdHHHyght00SZYPiUDaOQWYdoTQwpgcyyg=;
	h=From:To:Cc:Subject:Date:From;
	b=lsz0/nHUncOxIpC2IejWW9n8yIBAo7kjYj8/+8Xdgulg3KUt29Gv6coeUwpnboovS
	 kzln6X1JucIsAY+sj7OuEuW+P37MbHgU2MTlaF8tTTfHHssmmoPTAuA+p3VDArffzi
	 jM4zrwi2JYVgiCOMNSkNvWow8qjRq1eJro0DxBVA=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v4 0/3] media: v4l2-subdev: Support const-awareness in state accessors
Date: Thu,  9 May 2024 00:40:42 +0300
Message-ID: <20240508214045.24716-1-laurent.pinchart+renesas@ideasonboard.com>
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

Patch 1/3 first fixes a small documentation mistake. Patch 2/3 improves
the state accessors to support const states, in the same wait as the
recently introduced container_of_const() macro. The internal macro name
has been subject to a bit of bikeshedding already, so I think we're
reaching a final version. Patch 3/3 then shows how this can be used in
one driver.

Compared to v3, patch 1/3 is new, and patch 2/3 renames the new macro
and updates documentation.

Laurent Pinchart (3):
  media: v4l2-subdev: Fix v4l2_subdev_state_get_format() documentation
  media: v4l2-subdev: Provide const-aware subdev state accessors
  media: rkisp1: Mark subdev state pointers as const

 .../platform/rockchip/rkisp1/rkisp1-isp.c     |  8 +--
 .../platform/rockchip/rkisp1/rkisp1-resizer.c |  8 +--
 include/media/v4l2-subdev.h                   | 50 +++++++++++++------
 3 files changed, 42 insertions(+), 24 deletions(-)


base-commit: e695668af8523b059127dfa8b261c76e7c9cde10
-- 
Regards,

Laurent Pinchart


