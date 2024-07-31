Return-Path: <linux-media+bounces-15627-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 92973942A9B
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 11:35:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3A5D1C23E98
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 09:35:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 405781AB501;
	Wed, 31 Jul 2024 09:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="UnGzK5hq"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049191A7F7B;
	Wed, 31 Jul 2024 09:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722418506; cv=none; b=caSBIvqm3E95O2gvCktAw8XyrEzv/nWVciEOWVfgLyBa6vZS0OO4EMvj9DvFV5lA9IeFkfUMEWDBDyjnOD0gKlb+NI+owlgXO83iO40ddYb12GWkuUc1Tlf2BLFfvifsFCErYAvsIgCRdRS85y6c6m3SbM0A8OezHFWe0hQwZnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722418506; c=relaxed/simple;
	bh=522OCaLBepPZdA3Df4XfI5NOBNuvYEXSia6TXrN+dFU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GFf87Ano8oUZCv73762kwy4/+tgZQ0tzwF3MiMQ2aCO+fCg022mmFWfEhtyf41SgVqLiSml5DZ7UK/sj+ivX6AwywNikagzXIRNfFIzw7tFE1P821cqv60t+zEljprJpqGvvoXA5DCbiLHJSJCpmVQ5S+mRBLDkFttDsphKssS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=UnGzK5hq; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722418503;
	bh=522OCaLBepPZdA3Df4XfI5NOBNuvYEXSia6TXrN+dFU=;
	h=From:To:Cc:Subject:Date:From;
	b=UnGzK5hqrXdmznRjXEqGR4q3P3z5Achii6oZ9REBMQlRLqvJ+df1Put49CQFw/pFP
	 oj53J46dJDJpAkiQPkc6RH/3TVCwDcAwOnx8V64eXgyzz60HceXUPvGAPwlIvbkqV3
	 ztvJ+aMCjwRZE5g5UQFRh/bGKCSbhgaKO1BqjdZbPLOJRriXaDuUAzHjvzCkGvn4rW
	 xFUA+fPkmtRgcKK1r58zi9ikXq2NTGsbO8eeacbfTHCM6eT0Zlr0yA1Mo03TKDg8Fj
	 Av2QH0AYS8aVDzDEyfnakl+yNQRcc9Tq8zFhtNepfGGHCCwrnXk3TFpenLyqP9bVFO
	 bT7EOv3l3kfwg==
Received: from benjamin-XPS-13-9310.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E879C3780BC9;
	Wed, 31 Jul 2024 09:35:02 +0000 (UTC)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: mchehab@kernel.org,
	ezequiel@vanguardiasur.com.ar,
	hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v6 0/3] Enumerate all pixels formats
Date: Wed, 31 Jul 2024 11:34:54 +0200
Message-ID: <20240731093457.29095-1-benjamin.gaignard@collabora.com>
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
https://gitlab.collabora.com/benjamin.gaignard/v4l-utils/-/commits/enum_all_formats_v2

change in version 6:
- Change flag name.
- Improve documentation.
- Improve visl driver to enumerate one more pixel format when the flag
  is used.

changes in version 5:
- Reset the proposal to follow Hans's advices
- Add new flag to be used with index field.
- Make vicodec and visl test driver use the new flag
- Doing the same for Verisilicon driver.
 
Benjamin Gaignard (3):
  media: videodev2: Add flag to unconditionally enumerate pixel formats
  media: test-drivers: Use V4L2_FMTDESC_FLAG_ENUM_ALL flag
  media: verisilicon: Use V4L2_FMTDESC_FLAG_ENUM_ALL flag

 .../media/v4l/vidioc-enum-fmt.rst             | 16 ++++++++++++++-
 .../media/videodev2.h.rst.exceptions          |  1 +
 .../media/platform/verisilicon/hantro_v4l2.c  | 18 ++++++++++++-----
 drivers/media/test-drivers/visl/visl-video.c  | 20 +++++++++++++++++--
 include/uapi/linux/videodev2.h                |  3 +++
 5 files changed, 50 insertions(+), 8 deletions(-)

-- 
2.43.0


