Return-Path: <linux-media+bounces-14954-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADA892F8FA
	for <lists+linux-media@lfdr.de>; Fri, 12 Jul 2024 12:30:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35ECC1F21E49
	for <lists+linux-media@lfdr.de>; Fri, 12 Jul 2024 10:30:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55ED114E2E8;
	Fri, 12 Jul 2024 10:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="SY8Fu3BY"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3415E1465AB;
	Fri, 12 Jul 2024 10:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720780209; cv=none; b=IIUJ/u7gTRRlwtd5QJJvTlfukhrwzKJa0YpR5DBkEt/i7UTbiKsIQ9F4JJC8AX/VAOJYV41Kze7EClO0Vz3BWmKgQGHduZJTjzMqA3TmiPahBOGOnSR8tM3+jXbIcx0a7Z1oiBOEU87krOcYlcp8Plxa6lZkR3/6XIDmhqTvSCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720780209; c=relaxed/simple;
	bh=cDmQGuuHf/kwKcRClfuGl4sZkWM2wjBKoyC5NH+2HmY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c+2ZVEvyNZZ02zy1sGAhVe8aa36qBcbIqK7gewjiOQv3MnecKsMafYVtbriL141zaJ3Yq4+2pFXmGUeGY/W3IaisFQJVxMad4uO/6o3CUDF7smevic4L7J7eNN+mo6LreZglOACv0GX/CaAmc0A0v3k85n1Ini+tNNcI6jFW8uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=SY8Fu3BY; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1720780206;
	bh=cDmQGuuHf/kwKcRClfuGl4sZkWM2wjBKoyC5NH+2HmY=;
	h=From:To:Cc:Subject:Date:From;
	b=SY8Fu3BYS77Lx1XaZ0/zSMnRW6T+uWcbWOdsEd8FGQlQ/D18Z6SiT9mTfRotZJyef
	 2xWT5+ThJXEyAe4kD/gn0e7GrUx/ttm/xJ9awJAZk9BKHCk5+8ojkoxSlVhSaOS3kj
	 0DB1W7IBNb4PjB6vVcpr5OQHlOcXdcPjoI1/zGJvs1Q1jsjzYZXvdFe8U5fqfXdTkI
	 jWYEzij6DPzybk6eKhfFkLGWebBxoZyc0MYLHBI2s0qE5ZxrccfjkBTzFHdhmVZNG1
	 +OlF/rkj+b+BCbRTom5FkDP3MtTYOJlXduLSbiA0UTEPFEW2k9KRYKBajfK0koBgES
	 6Gxd5QIrKdUqA==
Received: from benjamin-XPS-13-9310.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0A92C378045F;
	Fri, 12 Jul 2024 10:30:06 +0000 (UTC)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: mchehab@kernel.org,
	ezequiel@vanguardiasur.com.ar,
	hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v3 0/2] Enumerate all pixels formats
Date: Fri, 12 Jul 2024 12:29:58 +0200
Message-ID: <20240712103000.16655-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The goal of this series is to let userland applications enumerate
all the supported pixels formats of a stateless decoder without
setting all the possible codec-dependent control.
That offer a simplest solution for applications to discover
supported pixels formats and possibly let them doing smarter
choice between stateless decoders.

An example of how it can be used in GStreamer to discover the
supported pixels formats for stateless decoder is available here:
https://gitlab.freedesktop.org/benjamin.gaignard1/gstreamer/-/commits/v4l2codecs_enum_all_supported_formats?ref_type=heads

changes in version 3:
- Add a flag to inform userspace application that driver
  as take care of the flag.

changes in version 2:
- Clarify documentation.
- Only keep V4L2_FMT_FLAG_ALL_FORMATS flag in ioctl.

Benjamin
 
Benjamin Gaignard (2):
  media: videodev2: Add flags to unconditionnaly enumerate pixels
    formats
  media: verisilicon: Use V4L2_FMT_FLAG_ENUM_ALL_FORMATS flag

 .../media/v4l/dev-stateless-decoder.rst          |  6 ++++++
 .../userspace-api/media/v4l/vidioc-enum-fmt.rst  |  9 +++++++++
 .../media/videodev2.h.rst.exceptions             |  2 ++
 drivers/media/platform/verisilicon/hantro_v4l2.c | 16 +++++++++++++---
 drivers/media/v4l2-core/v4l2-ioctl.c             |  3 +++
 include/uapi/linux/videodev2.h                   |  2 ++
 6 files changed, 35 insertions(+), 3 deletions(-)

-- 
2.43.0


