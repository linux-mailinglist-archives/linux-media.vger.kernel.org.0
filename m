Return-Path: <linux-media+bounces-10961-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E404A8BDB06
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 08:03:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F61E2829CD
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 06:03:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F423F6DD0D;
	Tue,  7 May 2024 06:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GyIF6GgN"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895A7631;
	Tue,  7 May 2024 06:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715061816; cv=none; b=WVXRjE8Ev6jvH4hNMHGkCSWp7qLB+xccsY47CVn9843u6SPwcfCQuvYlDMKR+nlWXnvGisrYdkW+QFIKwq3YRHvIuj62M+zjw2pbe/bLh2/9uWwvj7+6G9z5uUFu2bLvajqZZ/u2WZ1nHWjB8jmq3lMb9cWKBi31Psmz8cZmVmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715061816; c=relaxed/simple;
	bh=hzw1wOyov0AIgxXRRO0rnUf/xHvzEM6thuNWtbDTq/U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rbShqamG0His7glFz6bGB3+ic26MHqnzOgopSJqOVaWzWOyAuDfpr0DvTfCWmuR2tX8EBLUVcJUizCv4EldCgG5DLq0MP5tftk+5JatnMyIFseeecpFQucqZ9NvmZ58EqXr8d177M6WmErnMlq3N37koZtdrlaUBrOUgjnHlDnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GyIF6GgN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 364A43D5;
	Tue,  7 May 2024 08:03:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715061809;
	bh=hzw1wOyov0AIgxXRRO0rnUf/xHvzEM6thuNWtbDTq/U=;
	h=From:To:Cc:Subject:Date:From;
	b=GyIF6GgNZkJ8xUxrJ3l/HnUYu+kVdsLKchMc9sBMsFv2D6zwxCIgk/9XVlOsNg0m4
	 0zKeSmW+wF+WFV0Cg6TGbuZaa7TooD8d3dZsLk8UmyEpEhd96RhGpzYGNkS+iONdPz
	 v6SlMilYjtklvEpb85gSVg26V1PJNOONrzZyywOc=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v2 0/2] media: v4l2-subdev: Support const-awareness in state accessors
Date: Tue,  7 May 2024 09:03:21 +0300
Message-ID: <20240507060323.26950-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

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

Compared to v1, patch 1/2 uses _Generic() in a single macro to wrap all
calls, instead of duplicating the _Generic() statement in all accessors.

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


