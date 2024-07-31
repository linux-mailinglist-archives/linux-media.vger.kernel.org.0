Return-Path: <linux-media+bounces-15639-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 296E3942F4D
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 14:56:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A828428EE1A
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 12:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E54831BD00B;
	Wed, 31 Jul 2024 12:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="xDuuPoE9"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3201B141B
	for <linux-media@vger.kernel.org>; Wed, 31 Jul 2024 12:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722430277; cv=none; b=YUbcFneffc95zxSncXg/Y2NYNP4xppz36v6CAD5t2Y1U4vLS5R3bJTjHBjqYolxiFQgm0q8FIrdOOl90/ItM5ZLNI5TiTF01nMFn9P+oLRMGOWLkxPTCnJ3HRtNgBK/44ow2TafmjN/wSkAanNdPZxpT51mxUgdEsrugHBSNMqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722430277; c=relaxed/simple;
	bh=Zr5SuBa6xQ0NEKENE1FOMYCN4p38nTS41wXLmGHsBoI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MfHvuv4IJgKFw5QStrDr4VKopRueHHRMS4NiXk2qmjxZ6Ma4oZETPxwJhsUutURMPdIiGIIBJDEuOz2SjpuauE25lNzg6Gi6nOJ9FmlN526lshpABoGVwaMLumIEhxNa/KRybjdVnOmu7mBP72YaV7T4xX3D2dWyqfN9GgMJVCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=xDuuPoE9; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722430273;
	bh=Zr5SuBa6xQ0NEKENE1FOMYCN4p38nTS41wXLmGHsBoI=;
	h=From:To:Cc:Subject:Date:From;
	b=xDuuPoE99VGlkQRkAwjeLJkX2/t89S+0HH95X71A9fD/NGMflRyB/RjQ7W5yeWh6V
	 Ycdp938JQ1xKxA0eMaKH5SfqumNFEAu0RzrKOPsqIQlRnOx9EmFhIWf71L7VLYSAv+
	 SZ+NOdfoC2PvBAuVhsU01SM7QztQ+BPFF+BeuCCAP4xw9mCxWa15ne8glxcM0PYFnk
	 iUVF+Bca3LvdTjI4l3Jws5CU1H/6OujRZd/085pwdftxGBTusFefe51fYD5YhO/VlD
	 FYwC8AtZBEzyIevpcu0G+CQMi4kl3oao71LYBZ8iwSWlYg9T8J8dmCVW9WX4gzc5s+
	 6GG8NAawQvtiA==
Received: from benjamin-XPS-13-9310.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9C6DC37821CA;
	Wed, 31 Jul 2024 12:51:13 +0000 (UTC)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v3 0/2] Add tests compliance tests about V4L2_FMTDESC_FLAG_ENUM_ALL flag usage
Date: Wed, 31 Jul 2024 14:51:06 +0200
Message-ID: <20240731125108.38407-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

V4L2_FMTDESC_FLAG_ENUM_ALL flag goal is to enumerate all
possible pixel format while ignoring the current configuration.
The series add tests for v4l2-compliance and v4l2-ctl tools.

v4l2-compliance will check is the flag is supported by drivers
and verify if the enumerated list is an upperset of VIDIO_ENUM_FMT
called without the flag.

Add 'all' supoption to vidcap --list-formats(-ext) options to use
V4L2_FMTDESC_FLAG_ENUM_ALL if supported by the driver.

As example, Verisilicon driver support the flag usage and give these
results:
./v4l2-ctl --list-formats -d 1
ioctl: VIDIOC_ENUM_FMT
	Type: Video Capture Multiplanar

	[0]: 'VT12' (Y/UV 4:2:0 (4x4 Linear))
	[1]: 'NV12' (Y/UV 4:2:0)

./v4l2-ctl --list-formats all -d 1
ioctl: VIDIOC_ENUM_FMT
	Type: Video Capture Multiplanar

	[0]: 'VT12' (Y/UV 4:2:0 (4x4 Linear))
	[1]: 'T010' (10-bit Y/UV 4:2:0 (4x4 Linear))
	[2]: 'NV12' (Y/UV 4:2:0)
	[3]: 'P010' (10-bit Y/UV 4:2:0)

so userspace can discover that it support 10-bit formats on capture
queue.
 
Benjamin Gaignard (2):
  v4l2-compliance: Add test for V4L2_FMTDESC_FLAG_ENUM_ALL flag
  v4l2-ctl-vidcap: Add option to enumerate all pixel formats

 include/linux/videodev2.h                   |  3 ++
 utils/common/cv4l-helpers.h                 |  5 ++-
 utils/v4l2-compliance/v4l2-test-formats.cpp | 35 +++++++++++++++++++++
 utils/v4l2-ctl/v4l2-ctl-meta.cpp            |  4 +--
 utils/v4l2-ctl/v4l2-ctl-overlay.cpp         |  2 +-
 utils/v4l2-ctl/v4l2-ctl-sdr.cpp             |  4 +--
 utils/v4l2-ctl/v4l2-ctl-vidcap.cpp          | 25 +++++++++++----
 utils/v4l2-ctl/v4l2-ctl-vidout.cpp          |  4 +--
 utils/v4l2-ctl/v4l2-ctl.cpp                 | 16 ++++++----
 utils/v4l2-ctl/v4l2-ctl.h                   |  4 +--
 10 files changed, 80 insertions(+), 22 deletions(-)

-- 
2.43.0


