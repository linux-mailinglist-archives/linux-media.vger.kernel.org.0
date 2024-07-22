Return-Path: <linux-media+bounces-15258-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B88939151
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 17:05:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E299BB214C4
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 15:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F0ED16DEBD;
	Mon, 22 Jul 2024 15:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="GQZpkDOB"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4A816CD1D;
	Mon, 22 Jul 2024 15:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721660733; cv=none; b=II3RSWnGve0upQeGGtbkWisbj90QYijkMt7giPNqmmUUBuHIbofOcT43Mu76wXeEnXjJLaSfU4suMZn3tZl1mXDhr5y+DfzYGEKxs8MwK1PHK+E8Z5m2EZGh0B+kKmNz/kkm1019/HWOEohA1Vi2WxdP7WLr8EccDdRm0LQqcpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721660733; c=relaxed/simple;
	bh=Q1hq1BqmmzXLyGaSkJtWC/+tCaQdpoOpOXqfqPFG/34=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U5yzFiDrSlCCbEO4obJO8eoqH0108LILA2nq0SNLIW2VyqBBeqzPwKh4ONHr7N9xQgjbZxG1vj9LI4iBqiDVDtdRIMSHrovKNCPWdFaDIbUwHFvcEuevKQxmkiKshRBpGuKCyPyQnWbfgDdRsstghkmlN1roeQT82y5A7DB9ppQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=GQZpkDOB; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721660729;
	bh=Q1hq1BqmmzXLyGaSkJtWC/+tCaQdpoOpOXqfqPFG/34=;
	h=From:To:Cc:Subject:Date:From;
	b=GQZpkDOBmVq0onkKV/Hiqb3KzRAEoXscvkKZnYwIgIx6C4+i1hDz/zw3kh4Rt+IYP
	 DufYTumrn90HK0m8whtTbWdPrWQTiM1wEoygG8Ljs8iHoNj8JCUFYt/q8oPgOlBm9c
	 Wg6Y1S1qeTNikAJWzBFFU+d7L9HR2CA+fTjCA6LmHlLOldOtW2ULrxzKWJz/lRmVbC
	 nN94xrlFQ08ZxxkwVdRKwzjPKCjwxSVRo7wgEwqIFDOWwS4aLCsSTBsSjamBgFPLvf
	 jl6DckYRwNPA8r2wiRcM+vfm4p9SRJwY1nEnxjj+ks6OCFMjb2F4eNriaMlP7QFsIn
	 SIxH0ZC7FWMkQ==
Received: from benjamin-XPS-13-9310.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id CE927378001E;
	Mon, 22 Jul 2024 15:05:28 +0000 (UTC)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: mchehab@kernel.org,
	ezequiel@vanguardiasur.com.ar,
	hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v5 0/3]  Enumerate all pixels formats
Date: Mon, 22 Jul 2024 17:05:20 +0200
Message-ID: <20240722150523.149667-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The goal of this series is to help userspace applications, like Gstreamer
or Chromium, to categorize decoders and so avoid trying to use decoder
that can't do the require task because it won't support the needed pixel
format.
As example, in today implementation we need to simulate 10 bit header
control to know if the driver support 10 bits pixel formats. With this
new flag it will simpler for userspace applications know if driver
support 10 bit pixel formats and if it is supported by userspace.

An example of how it can be used in GStreamer to discover the
supported pixels formats for stateless decoders is available here:
https://gitlab.freedesktop.org/benjamin.gaignard1/gstreamer/-/commits/v4l2codecs_enum_all_supported_formats?ref_type=heads

v4l2-compliance test of this flag:
https://gitlab.collabora.com/benjamin.gaignard/v4l-utils/-/tree/enum_all_formats?ref_type=heads

changes in version 5:
- Reset the proposal to follow Hans's advices
- Add new flag to be used with index field.
- Make vicodec and visl test driver use the new flag
- Doing the same for Verisilicon driver.

changes in version 4:
- Explicitly document that the new flags are targeting mem2mem devices.

changes in version 3:
- Add a flag to inform userspace application that driver
  as take care of the flag.

changes in version 2:
- Clarify documentation.
- Only keep V4L2_FMT_FLAG_ALL_FORMATS flag in ioctl.

Benjamin

Benjamin Gaignard (3):
  media: videodev2: Add flag to unconditionnaly enumerate pixels formats
  media: test-drivers: Use V4L2_FMT_FLAG_ENUM_ALL flag
  media: verisilicon: Use V4L2_FMT_FLAG_ENUM_ALL flag

 .../userspace-api/media/v4l/vidioc-enum-fmt.rst | 12 +++++++++++-
 .../media/videodev2.h.rst.exceptions            |  1 +
 .../media/platform/verisilicon/hantro_v4l2.c    | 17 ++++++++++++-----
 .../media/test-drivers/vicodec/vicodec-core.c   |  7 ++++---
 drivers/media/test-drivers/visl/visl-video.c    | 11 +++++++----
 include/uapi/linux/videodev2.h                  |  3 +++
 6 files changed, 38 insertions(+), 13 deletions(-)

-- 
2.43.0


