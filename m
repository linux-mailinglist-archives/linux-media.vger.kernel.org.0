Return-Path: <linux-media+bounces-25036-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D35AA17B82
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2025 11:26:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C04621880462
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2025 10:26:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 471D81F1906;
	Tue, 21 Jan 2025 10:25:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F291EE7D6
	for <linux-media@vger.kernel.org>; Tue, 21 Jan 2025 10:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737455104; cv=none; b=NhAx2yZNC0jGFqWYdH0nprqYqH0EGU2yed73sUvoBDk+mEfRSoIws2yl8fjlH1uWZXdvIv5IAr87oYD/gOmvuBwMF5O25EZbisI1Bm4TMiwiUmzKznQ2TyCq3fkDYnykU/cfYIuh+FFLDfw7MaJzYvJ/6s9HeyR+LVSIy+KWXWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737455104; c=relaxed/simple;
	bh=Ab8sJTZaJEhQ37cN7EhaCIN/k6QHMVe+tJDANAPNsJA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=BGZA556YT3K2RY4wr48b+QTFl9iH/cXOLNc4ov37G8Zzwl955FelXqpqQb4u5Lr1m+gFIAaRugCa14Ew4Oh1mY056FNtpABk8j3aMiliROtO2U+ZbUmdXGhIQpoku95Xs8NEA0xBOSdlffwVJvfiaAQrFI+ZoX/f8ghOD7RjVz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3DE9C4CEDF
	for <linux-media@vger.kernel.org>; Tue, 21 Jan 2025 10:25:03 +0000 (UTC)
From: Hans Verkuil <hverkuil@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: [PATCH 0/2] media: add support for the EDID EEODB
Date: Tue, 21 Jan 2025 11:21:40 +0100
Message-ID: <cover.1737454902.git.hverkuil@xs4all.nl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the HDMI Forum EDID Extension Override Data Block
by introducing the v4l2_num_edid_blocks() helper function.

Update the adv7511-v4l2 driver to use this new function. This
fixes adv7511 support for EDIDs using the EEODB as otherwise only the
first two blocks would be read.

Regards,

	Hans

Hans Verkuil (2):
  media: v4l2-dv-timings: add v4l2_num_edid_blocks() helper
  media: adv7511-v4l2: add support for the EEODB

 drivers/media/i2c/adv7511-v4l2.c          |  6 +++--
 drivers/media/v4l2-core/v4l2-dv-timings.c | 29 +++++++++++++++++++++++
 include/media/v4l2-dv-timings.h           |  1 +
 3 files changed, 34 insertions(+), 2 deletions(-)

-- 
2.45.2


