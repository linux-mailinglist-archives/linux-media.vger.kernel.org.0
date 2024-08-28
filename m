Return-Path: <linux-media+bounces-17035-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2AB962A2B
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 16:26:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 404F71F257BA
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 14:26:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8E1118B469;
	Wed, 28 Aug 2024 14:26:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D76189F52
	for <linux-media@vger.kernel.org>; Wed, 28 Aug 2024 14:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724855177; cv=none; b=dPZwZBt7Ac0uAK07RG+VN4ABiaV6xe7LfMssNzm7DylkrkJPRovzRm2I03/j3ODk1E5MTZQGhq6m+rsHcMxCKWYvYzjKpZhiy7FysbCknHkLKE17TMoFIyOin3Ks7h1TuZYRmDBqpbgMvoKtV1cWS3vd25mhWxrvJp1qmkSuR7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724855177; c=relaxed/simple;
	bh=LE7g1VRvA6FhlMMb0EXZxZmbYc5OlwZKrMHFgHwxUMY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YlFkFzss7aYrvDgSneS+MtNhWGkqydU/XAlhYy4UCyldNA9ribaoL8o/rpPp7nzqjFsZlyiMFZL2qpFzEQ3AAsJj6qUQU5IJw+9LzQ9p7LJuGucbqpDWZi08q9V/qdvWr8ooEsojfaQ9JmvZsIWbcKXAlMOLjyDVmH10TYkFNOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11F07C4CEDF;
	Wed, 28 Aug 2024 14:26:15 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
	dri-devel@lists.freedesktop.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 0/7] media: export InfoFrames to debugfs
Date: Wed, 28 Aug 2024 16:24:06 +0200
Message-ID: <cover.1724855053.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Maxime added support for exporting InfoFrames to debugfs for drm,
and this series does the same for the media subsystem.

I used the same names for the InfoFrames as the drm implementation
does, and the format is the same as well. And edid-decode can be
used to parse the InfoFrames and do conformity checking.

The first two patches add helpers for this to the core framework,
and the next 5 patches add support for this to the HDMI drivers.

I tested the three adv drivers, and Dave Stevenson tested the tc358743
driver.

I don't have a tda1997x available for testing, so I might decide
to just drop that patch.

This is very useful for debugging received InfoFrames.

Regards,

	Hans

Hans Verkuil (7):
  media: v4l2-core: add v4l2_debugfs_root()
  media: v4l2-core: add v4l2_debugfs_if_alloc/free()
  media: i2c: adv7511-v4l2: export InfoFrames to debugfs
  media: i2c: adv7604: export InfoFrames to debugfs
  media: i2c: adv7842: export InfoFrames to debugfs
  media: i2c: tc358743: export InfoFrames to debugfs
  media: i2c: tda1997x: export InfoFrames to debugfs

 drivers/media/i2c/adv7511-v4l2.c          |  91 +++++++++++++---
 drivers/media/i2c/adv7604.c               |  90 ++++++++++++----
 drivers/media/i2c/adv7842.c               | 120 ++++++++++++++++------
 drivers/media/i2c/tc358743.c              |  36 ++++++-
 drivers/media/i2c/tda1997x.c              |  50 ++++++++-
 drivers/media/v4l2-core/v4l2-dev.c        |  14 +++
 drivers/media/v4l2-core/v4l2-dv-timings.c |  63 ++++++++++++
 include/media/v4l2-dev.h                  |  15 +++
 include/media/v4l2-dv-timings.h           |  48 +++++++++
 9 files changed, 455 insertions(+), 72 deletions(-)

-- 
2.43.0


