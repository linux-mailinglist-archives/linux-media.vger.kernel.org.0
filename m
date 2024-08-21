Return-Path: <linux-media+bounces-16575-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6726D959F82
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2024 16:17:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 242C5285B15
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2024 14:16:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 325A81B2501;
	Wed, 21 Aug 2024 14:16:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F5F1AF4ED
	for <linux-media@vger.kernel.org>; Wed, 21 Aug 2024 14:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724249804; cv=none; b=qVxGSr5F2vSLAov3P479RQt/WMf1KCIcp/g4rZUzFBJvpAMznDMz+DjaB331mbZXUry39GjGbWNV8k5YZrCRApCx4deo6iL4ZAWgAsd4IkMItt+lMv8giUFt8kp4AXn3so6K1yVkcxkUBu+dJAOMcm/VS1lXiLnFAfwI1A1a4r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724249804; c=relaxed/simple;
	bh=JE6ajPyTl3KAfwZWs01wXQz07vF2hcoB/WDMGojnqBk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ru5c7EI2XsYwL7Np/UL8WDYmcnbSD9MhXZNTYIbXpUqEH0/pVlsG0SZ6B4JkB6YSmFcrOt0yoePhlFNymEeds1JXwXrCf6efiDGbksyskrUUWUEDcSSNdylGZ2SElrsg/Doc/uOhiSPPUiQo84Ko20mmDyi9/PDrL8zIXLUyvAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D630C32781;
	Wed, 21 Aug 2024 14:16:43 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
	dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 0/7] media: export InfoFrames to debugfs
Date: Wed, 21 Aug 2024 16:10:14 +0200
Message-ID: <cover.1724249420.git.hverkuil-cisco@xs4all.nl>
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

I tested the three adv drivers, and I hope to test the tc358743
driver at some point in the not too distant future :-)

I don't have a tda1997x available for testing, so I might decide
to just drop this.

It's RFC for now, but I think it is quite straightforward.

This is very useful for debugging received InfoFrames.

Regards,

	Hans

Hans Verkuil (7):
  media: v4l2-core: add v4l2_debugfs_root()
  media: v4l2-core: add v4l2_debugfs_if_alloc/free()
  media: i2c: adv7511-v4l2: export InfoFrames to debugfs
  media: i2c: adv7604: export InfoFrames to debugfs
  media: i2c: adv7842: export InfoFrames to debugfs
  media: i2c: tda1997x: export InfoFrames to debugfs
  media: i2c: tc358743: export InfoFrames to debugfs

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


