Return-Path: <linux-media+bounces-16470-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E859569D2
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2024 13:50:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D63F61F235F8
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2024 11:50:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A034166F3E;
	Mon, 19 Aug 2024 11:47:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12687166F36
	for <linux-media@vger.kernel.org>; Mon, 19 Aug 2024 11:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724068071; cv=none; b=E1wpCu35U43Qs1LCiNMvZmPwl5+8lA8R0rkkQlH0vLa3f9gBOF8DAxfYPckMRKjcZj6CCEZFdz5UuShWgK+5UQBt/IpSfZATjQ8nhRtSMoli9DPYFH8JEI63E3cbxEOsYJdeXr5PIvRYHBkFAZ/0/4hK9kaT4R2AkG7WYMwr4YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724068071; c=relaxed/simple;
	bh=1iP86zE5blX2TpuBG1cexeitUPS5IZ/yX34pDzlEHA0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RzxFjK7KEJCI0jeytXVErKLiIWsvZPUgzp0rOx5ZRta2lDcm2YQ6TnBanLSAaHIfejDnvVrLLNWb8m5kEGR+AeMYI9dZ8Putit21eTg63WMnba2RBohqNjAPE08TQM0GkmH02loPfJ8Y855vsf7bK5a2z714FZOPae/QR4cgXBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE692C32782;
	Mon, 19 Aug 2024 11:47:49 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Erling Ljunggren <hljunggr@cisco.com>
Subject: [PATCH 0/3] v4l-utils: add support for V4L2_CAP_EDID
Date: Mon, 19 Aug 2024 13:45:41 +0200
Message-ID: <cover.1724067944.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for V4L2_CAP_EDID to v4l2-ctl and
v4l2-compliance.

This is for this series:

https://patchwork.linuxtv.org/project/linux-media/list/?series=13364

Regards,

	Hans

Hans Verkuil (3):
  videodev2.h: add CAP_EDID (DO NOT COMMIT)
  utils/common: add V4L2_CAP_EDID support
  v4l2-compliance: add support for V4L2_CAP_EDID

 include/linux/videodev2.h                     |  1 +
 utils/common/v4l2-info.cpp                    |  2 ++
 utils/v4l2-compliance/v4l2-compliance.cpp     | 17 ++++++++++++++---
 utils/v4l2-compliance/v4l2-test-io-config.cpp |  4 +++-
 4 files changed, 20 insertions(+), 4 deletions(-)

-- 
2.43.0


