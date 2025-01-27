Return-Path: <linux-media+bounces-25306-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AECC3A1D512
	for <lists+linux-media@lfdr.de>; Mon, 27 Jan 2025 12:04:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBF253A50D4
	for <lists+linux-media@lfdr.de>; Mon, 27 Jan 2025 11:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BEAF1FCFCA;
	Mon, 27 Jan 2025 11:04:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2468A7603F
	for <linux-media@vger.kernel.org>; Mon, 27 Jan 2025 11:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737975864; cv=none; b=BxMGnF8IcSpYNY/asXV6BVGZqjwtl5IVmshIE7B/2SRZplZ3hFg8AJkwcZ6nun14B2+jBTR+Ah5E/YJU4JaGBAitYsjgMgFIE89fo4yDvLuk1xnvUFNL6ljJ165h/RGYQdjK+VjhDz86VuNCZzgLgb/DyPI5aya3IScRu9XrQ78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737975864; c=relaxed/simple;
	bh=g7UFAGdqI7hJxs7XQ+uiPB9aV1scnYQdlPkbLgji7Jo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=j5Dmd09JXxJFleJcW0+GYOgG72XZgttGa7LLud1z/OsoT8ZRGZWPhzLVdRPeT5bX5CI3Iiy/x9jv9SZSqiA9mM/0xcIt3r6Iu8rpQ71VXa91QiLmN24T63u8Pq62cTSlPj0PQOYD2rcfNQRZIjp0j5mJ+H7MEQt/lAp5do2atCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33163C4CEE2
	for <linux-media@vger.kernel.org>; Mon, 27 Jan 2025 11:04:23 +0000 (UTC)
From: Hans Verkuil <hverkuil@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: [PATCHv2 0/2] media: add support for the EDID EEODB
Date: Mon, 27 Jan 2025 12:03:11 +0100
Message-ID: <cover.1737975793.git.hverkuil@xs4all.nl>
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

Changes since v1:

- add lots of comments to the v4l2_num_edid_blocks helper. There
  are a lot of constants there, so those needed proper comments.

Hans Verkuil (2):
  media: v4l2-dv-timings: add v4l2_num_edid_blocks() helper
  media: adv7511-v4l2: add support for the EEODB

 drivers/media/i2c/adv7511-v4l2.c          |  6 ++--
 drivers/media/v4l2-core/v4l2-dv-timings.c | 36 +++++++++++++++++++++++
 include/media/v4l2-dv-timings.h           |  1 +
 3 files changed, 41 insertions(+), 2 deletions(-)

-- 
2.45.2


