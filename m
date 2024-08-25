Return-Path: <linux-media+bounces-16739-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E2095E5B1
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 01:25:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DBEAC1F2164A
	for <lists+linux-media@lfdr.de>; Sun, 25 Aug 2024 23:25:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FEA67711F;
	Sun, 25 Aug 2024 23:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lQ/zF7gO"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4858677F0B;
	Sun, 25 Aug 2024 23:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724628297; cv=none; b=RHXWDXR590dKTcuXSzp8vtKS4+3VGuBGF4MMmWoIIy6z9nEQrLKq4K72Fef/1GjSmSeF5QbUEvTDVyJR9fqfB5SDKHUFcMQ7X1/FDAXWycvZbiRNJjFsWHlE00brwH0wuuvyXSipPkSGhlL77ji7PsaCoFesLb9o36M4/rFvOxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724628297; c=relaxed/simple;
	bh=BtEmP7XCP89NdrFr0Te3lEv4YA76R/vK8gwWYECrkPE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rt9U9cUJ/pYYz0cfxKkclnU6T5BMxHqUV1YB7bkH3OyYl6+zSkQalriKksoNEGljfBlVIy6bSyEHUol6y16skaynqmb9Ftscw/f2wxApsetg3Lyvx/3rmw0fXFQ1USG5go2e0DjsRxZ6zpz4jx351ZgFN0DsNetNgwEJ0sH+lVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lQ/zF7gO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 86D063D5;
	Mon, 26 Aug 2024 01:23:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724628227;
	bh=BtEmP7XCP89NdrFr0Te3lEv4YA76R/vK8gwWYECrkPE=;
	h=From:To:Cc:Subject:Date:From;
	b=lQ/zF7gO5gAVWyVZibqH9wlvKPUGEabxFYCn6oOoWOxm4cDXglQTfwF2fr0elx56J
	 LCWBV+r/91cDXtX/m9OhB73vymiFYYOUrz+VipKoU8rbQf+VfFdvAax6z3YDqmIVpT
	 bL9zvY1iWehTKnQxt+zaej2VX39xNnMRZOoCxB+U=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: videobuf2: Drop minimum allocation requirement of 2 buffers
Date: Mon, 26 Aug 2024 02:24:49 +0300
Message-ID: <20240825232449.25905-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When introducing the ability for drivers to indicate the minimum number
of buffers they require an application to allocate, commit 6662edcd32cc
("media: videobuf2: Add min_reqbufs_allocation field to vb2_queue
structure") also introduced a global minimum of 2 buffers. It turns out
this breaks the Renesas R-Car VSP test suite, where a test that
allocates a single buffer fails when two buffers are used.

One may consider debatable whether test suite failures without failures
in production use cases should be considered as a regression, but
operation with a single buffer is a valid use case. While full frame
rate can't be maintained, memory-to-memory devices can still be used
with a decent efficiency, and requiring applications to allocate
multiple buffers for single-shot use cases with capture devices would
just waste memory.

For those reasons, fix the regression by dropping the global minimum of
buffers. Individual drivers can still set their own minimum.

Fixes: 6662edcd32cc ("media: videobuf2: Add min_reqbufs_allocation field to vb2_queue structure")
Cc: stable@vger.kernel.org
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/common/videobuf2/videobuf2-core.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 500a4e0c84ab..29a8d876e6c2 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -2632,13 +2632,6 @@ int vb2_core_queue_init(struct vb2_queue *q)
 	if (WARN_ON(q->supports_requests && q->min_queued_buffers))
 		return -EINVAL;
 
-	/*
-	 * The minimum requirement is 2: one buffer is used
-	 * by the hardware while the other is being processed by userspace.
-	 */
-	if (q->min_reqbufs_allocation < 2)
-		q->min_reqbufs_allocation = 2;
-
 	/*
 	 * If the driver needs 'min_queued_buffers' in the queue before
 	 * calling start_streaming() then the minimum requirement is

base-commit: a043ea54bbb975ca9239c69fd17f430488d33522
-- 
Regards,

Laurent Pinchart


