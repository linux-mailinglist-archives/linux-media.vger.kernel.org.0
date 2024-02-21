Return-Path: <linux-media+bounces-5582-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0B385E231
	for <lists+linux-media@lfdr.de>; Wed, 21 Feb 2024 16:58:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B73011F256B6
	for <lists+linux-media@lfdr.de>; Wed, 21 Feb 2024 15:58:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF2258120A;
	Wed, 21 Feb 2024 15:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="KDzLNgWA"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0D778B70
	for <linux-media@vger.kernel.org>; Wed, 21 Feb 2024 15:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708530956; cv=none; b=Vw81Ts7+QHlq982ultoJDB48uiPuUQ0+4pqs2pKWJ8S8pwnrN1SkPzShhf7pbnEqQbBbwFXwhfqJ0RPDEQbEFWL6cgCdJRaM/DKle+bZXPb/2vqO+yraGkcV76vtoXY+6nc4pPYp+LJf93nW6/7ev49fgssqSoqPKxEG08EcyyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708530956; c=relaxed/simple;
	bh=h1+ZGHKkTNoP9dkYM7eO/NzG0gnxlDJ3NEbzYW8menk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QmtpI6f4C1Qg7m1yAfh0MqAC8d2u91eKGsViiABLqVA0wxl1G/yuzoKad3rMQ28gwojkdhoa1yFTebeRK2RdBnz03ycMLHAucDC0KdrZgNbyplBdTQIoMG9dmU8/2zh/VaS/+574SHoBcEYsib4E4+Ilol7va43L2D6lg18j7Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=KDzLNgWA; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1708530953;
	bh=h1+ZGHKkTNoP9dkYM7eO/NzG0gnxlDJ3NEbzYW8menk=;
	h=From:To:Cc:Subject:Date:From;
	b=KDzLNgWAwycVwDUhGwM9ysXvcpp39oRiR9s0EAHStOyDIjKphh0F1Sf99Tpfri1ba
	 TTfkrIUIdzt/WpZRnRMC7LeU3wPANdh4B4c3NtkK9esoYIDxRFjHzl5mKwSvVb9Ryo
	 hQiAaw5nPxXgjK9kergYegBN3MK7+swHwPNmYgvnKx+EXeNCeoFPTbx2KZLi6crXY+
	 9N8jFRl8sm+e0VqFKdKHE4K2ny9Bc73zcE27pFxiDdWjME7QoR4U6YRUUjNniPu19N
	 GIHxyWCvVlp5juAwN7yRxIwsPmYzBgElNDtKTALdx+8G5zmJ4hCeRAEzv3MXn1zbcS
	 koQ9sYCEFaVRg==
Received: from benjamin-XPS-13-9310.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id F3E623780629;
	Wed, 21 Feb 2024 15:55:52 +0000 (UTC)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v8 0/2] v4l2-compliance: Add tests for REMOVE_BUFS
Date: Wed, 21 Feb 2024 16:55:49 +0100
Message-Id: <20240221155551.100156-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series add tests for this new field and VIDIOC_REMOVE_BUFS ioctl.

version 8:
- Rename structures, function and variables to use 'remove' instead of
  'delete.

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
  v4l2-utils: Add VIDIOC_REMOVE_BUFS ioctl
  v4l2-compliance: Add a test for REMOVE_BUFS ioctl

 include/linux/videodev2.h                   | 16 ++++
 utils/common/cv4l-helpers.h                 |  4 +
 utils/common/v4l-helpers.h                  | 27 ++++--
 utils/v4l2-compliance/v4l2-compliance.cpp   |  1 +
 utils/v4l2-compliance/v4l2-compliance.h     |  1 +
 utils/v4l2-compliance/v4l2-test-buffers.cpp | 99 +++++++++++++++++++++
 6 files changed, 143 insertions(+), 5 deletions(-)

-- 
2.40.1


