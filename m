Return-Path: <linux-media+bounces-7090-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF70287C067
	for <lists+linux-media@lfdr.de>; Thu, 14 Mar 2024 16:36:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E9440B22AAE
	for <lists+linux-media@lfdr.de>; Thu, 14 Mar 2024 15:36:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3E0F7428A;
	Thu, 14 Mar 2024 15:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Ft0AX5c/"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFD071749
	for <linux-media@vger.kernel.org>; Thu, 14 Mar 2024 15:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710430461; cv=none; b=qbvVgYZj0wuFxnT2HjPOEMeMJKupYd4GoWfcTXRrvXW/WoUnvaR00G5j9xnuGo0KCUJIKsgtRuUEggotUakyl9URQvyLVyKfvRBExame+DK/5UtSyK9TB7HuCTFwTwdK8RyuvoL7TYxvJidziXNLvoSNMoFfIkGOxgInVYf8Cdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710430461; c=relaxed/simple;
	bh=ze+OTj/0O1tY/YzEVA54Gg3S+HnJr3TeOTty5EWaPS0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bNZQkoPo4FxgKOsfhpuRm1yerwv/3+e0SYS2QHGep6+zvINVHBo8QsC7XdT2oaLF7zXlT5Y+gnY0ezPilvNgCYzjEtWsekdzpRH78OsiWIAqTl1HSk4NxOVJCR/Ft4QUWehuXGRoBf/TR+ZY+KWLQ8hBIavlbZCzDukg3g94FrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Ft0AX5c/; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710430458;
	bh=ze+OTj/0O1tY/YzEVA54Gg3S+HnJr3TeOTty5EWaPS0=;
	h=From:To:Cc:Subject:Date:From;
	b=Ft0AX5c/9K/YBERRhiPj4MuJEBx8hTVcm9Y9bVVx7qahdCXvneSEtguFVUA1Nn1yw
	 j4cJGvpmXk4E8y3UNLFKvuymmKt9HP0DA4iDlKfU3RfYYgMeYXpgo+ZhjkyYrYZp5f
	 msBZjU2CFw8NZjUjrGkidcPZrF6GRD02DupvOSseD9VShto7iI8MFkIOZWvnzDKXE2
	 3FN3Dvy+xr5Lx85PvrFsPxShbz+5Ibr5OR265rG9LpMM9O6+pU0l3OjsoPW0Bypngt
	 VMv+Q1KNKCmZtlS/thqJnc3PUQwhF4Q4grjflM63j6d8KRAbMuY+zfcldfn+kPpH7/
	 tVgSc5Kd8rFkA==
Received: from benjamin-XPS-13-9310.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0E7F6378209A;
	Thu, 14 Mar 2024 15:34:18 +0000 (UTC)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v9 0/2] v4l2-compliance: Add tests for REMOVE_BUFS
Date: Thu, 14 Mar 2024 16:34:13 +0100
Message-Id: <20240314153415.197534-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series add tests for this new field and VIDIOC_REMOVE_BUFS ioctl.

version 9:
- Add tests to check return values when count = 0.
- Add tests to check return values when attempt to remove
  again buffers.
- Call fail_on_test(q.reqbufs(node, 0)) at the end of the test.
- Do not print WARN if REMOVE_BUFS ioctl isn't supported
- Stop testing if CREATE_BUFS is supported.

version 8:
- Rename structures, function and variables to use 'remove' instead of
  'delete.

version 7:
- Remove "v4l2-compliance: Test queue maximum buffers allocation"
  patches because they have been merged.
- Remove V4L2_BUF_CAP_SUPPORTS_DELETE_BUFS to be aligned with
  the v18 of the kernel patches
- v4l_queue_querybufs() take care of a range of buffers.

Benjamin Gaignard (2):
  v4l2-utils: Add VIDIOC_REMOVE_BUFS ioctl
  v4l2-compliance: Add a test for REMOVE_BUFS ioctl

 include/linux/videodev2.h                   |  16 +++
 utils/common/cv4l-helpers.h                 |   4 +
 utils/common/v4l-helpers.h                  |  27 ++++-
 utils/v4l2-compliance/v4l2-compliance.cpp   |   1 +
 utils/v4l2-compliance/v4l2-compliance.h     |   1 +
 utils/v4l2-compliance/v4l2-test-buffers.cpp | 118 ++++++++++++++++++++
 6 files changed, 162 insertions(+), 5 deletions(-)

-- 
2.40.1


