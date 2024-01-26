Return-Path: <linux-media+bounces-4217-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C9083D96D
	for <lists+linux-media@lfdr.de>; Fri, 26 Jan 2024 12:35:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 02088B2CC63
	for <lists+linux-media@lfdr.de>; Fri, 26 Jan 2024 11:12:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DAEA1426E;
	Fri, 26 Jan 2024 11:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Xd/PvOUX"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31B614000
	for <linux-media@vger.kernel.org>; Fri, 26 Jan 2024 11:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706267530; cv=none; b=kwA3YpcqLp3xAtHHQH+1RPnVgbS4u7HtNbpZc5fOnZtxxxb67pSENXyihTLx+szBkSwfCwOxccLSH3k0Ddjj1P5gQCXumtZjiV4n3+9OK5or90Iv8KczD4oluaNM5tCENvHYLFznPOJlxyYAgpyh7MaZh7oYK6JiJnNA9lF0mIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706267530; c=relaxed/simple;
	bh=plwVjcnuW6ilU9+T4Esad136bn8o2WUrMq5ZcgQk7MQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UK5TvqV9hjbSZDDXfGkDO9amvOgiMOQQKHkrNsDliGkTWfV1dPqcbjbZKKHppnrD9/s+ibjV/d55Eh7UPIu6S7Cf3h0EhW7NwSVaIGjCF312rbE0WRKRaJZsFb+D3mDfZMUKDKvMHCI1qXaMDYFWJ5I9DyROWfUgqu/kzzPTA24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Xd/PvOUX; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706267527;
	bh=plwVjcnuW6ilU9+T4Esad136bn8o2WUrMq5ZcgQk7MQ=;
	h=From:To:Cc:Subject:Date:From;
	b=Xd/PvOUXZP3nkovUr9Ht6TSrS4H6QyJj373XfXcKtmdCa8QjAjYWIhIZWKoFIRBnI
	 /iqNBfpPC+W4NdiiuU3CWerY3s2owRnZg9b4HA8NjYUluZAcbNUo1B0hO+Em4KAgiR
	 6gfycc78JwxqasVpQI8aKwcvs7YqpEWvfPDZSek15dgUqwrelP64PJdsxqvBHjjwT6
	 oHexBjOHDuVdx+LByrscmlT354E3mayAdDqwwtN3GIpRhPVY2avBdfARZqKWYpIyxb
	 H6KSD3N8qsB9/GIhx2FPiD4+MQL5vC9ECrxgcWXbGLYQRh31NF2DN20LNy39DAO04X
	 RnKFprdTbrNbg==
Received: from benjamin-XPS-13-9310.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id F2B5337813CA;
	Fri, 26 Jan 2024 11:12:06 +0000 (UTC)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: hverkuil@xs4all.nl,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v7 0/2] v4l2-compliance: Add tests for DELETE_BUFS
Date: Fri, 26 Jan 2024 12:12:03 +0100
Message-Id: <20240126111205.136630-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series add tests for this new field and VIDIOC_DELETE_BUFS ioctl.

version 7:
- Remove "v4l2-compliance: Test queue maximum buffers allocation"
  patches because they have been merged.
- Remove V4L2_BUF_CAP_SUPPORTS_DELETE_BUFS to be aligned with
  the v18 of the kernel patches
- v4l_queue_querybufs() take care of a range of buffers.

version 6:
- fix compilation issue in "v4l2-compliance: Test queue maximum buffers allocation"

version 5:
- change g_max_buffers() to g_max_num_buffers().
- change v4l_queue_g_max_buffers() to v4l_queue_g_max_num_buffers().
- rename struct v4l_queue max_buffers field to max_num_buffers.
- fix V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS name in bufcap_def array.
- add V4L2_BUF_CAP_SUPPORTS_DELETE_BUFS in bufcap_def array.
- only test MMAP streaming mode.
- rework test code.
 
Benjamin Gaignard (2):
  v4l2-utils: Add VIDIOC_DELETE_BUFS ioctl
  v4l2-compliance: Add a test for DELETE_BUFS ioctl

 include/linux/videodev2.h                   | 15 ++++
 utils/common/cv4l-helpers.h                 |  4 +
 utils/common/v4l-helpers.h                  | 27 ++++--
 utils/v4l2-compliance/v4l2-compliance.cpp   |  1 +
 utils/v4l2-compliance/v4l2-compliance.h     |  1 +
 utils/v4l2-compliance/v4l2-test-buffers.cpp | 99 +++++++++++++++++++++
 6 files changed, 142 insertions(+), 5 deletions(-)

-- 
2.40.1


