Return-Path: <linux-media+bounces-50629-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA32D1BA12
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 23:46:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8C16C30383B7
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 22:46:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAB773557E2;
	Tue, 13 Jan 2026 22:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YR2vRJ/+"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430C42989BC
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 22:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768344360; cv=none; b=mnd6K93sig1sTFuS7le8+kaKPgO/EUROMXGBhSiGaWlJuR0L62al8Of71MWOGsCgUZdjsTCepyFxjbEQ4qSd3G0krFaJ3oJFc7CVDGmyYhyp/CA1hGVHy/xZY5fhYrF1AhVaJM6KmBbXttSRnzGqFaSfVbX+cK7MXuiZnKlIhg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768344360; c=relaxed/simple;
	bh=eRGlQMNUFb5HVPyvl1ddGj6N8XMbQjhroHtB1uKm//s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pKMfrZhsC+P5Q5FHBYUPB7R1dYI4GwO3VXVDReJh/nwqkJXWLeM8OVMFk98NWHqlblCTtxhB4H7GI+aGx68q5Eag6JzvqSYproTJGrJ541XKlXyG5B/mzsb+1HM7U54gqPMgqXKck2TSrw0sKR9j+1FQhyHBpFlo7r9IxCBKW58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YR2vRJ/+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAA6FC116C6;
	Tue, 13 Jan 2026 22:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768344359;
	bh=eRGlQMNUFb5HVPyvl1ddGj6N8XMbQjhroHtB1uKm//s=;
	h=From:To:Cc:Subject:Date:From;
	b=YR2vRJ/+LAryIhkSvqDN6+q4cax+0b7dMhEz15LIRlGdDUpXI6wzRINpZIwRlXYLo
	 2COxi3WtYHz35CZMGT0V7WK7Dueori6rOsdXlOvl09wiewViIlrypuFtXW5fImiWVz
	 RowxBljK3XcrH0hRGGNipZ6HbRWjlegQ2A/9NjZb+kQX/daZ13JKPNb+GLgOHn7DHO
	 ZBkKhHe1qn66DGHEjzv88xB/gDng+lkWSxUAxjTw8vEJ3P0UaNOS+2fG0b7KAV8cyF
	 XFVU5sBEwH0wgaQa6RCyY9i1+Qr4b0nUh1dU3GHU/7dkCEOqtWBbYvf9MM3cT3RE4/
	 Fj7F+aKoQsUQw==
From: bod@kernel.org
To: bod@kernel.org,
	linux-media@vger.kernel.org,
	hans@jjverkuil.nl
Cc: bryan.odonoghue@linaro.org
Subject: [GIT PULL FOR 6.20] Please pull av1-support
Date: Tue, 13 Jan 2026 22:46:00 +0000
Message-ID: <20260113224605.379291-1-bod@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bryan O'Donoghue <bod@kernel.org>

The following changes since commit 3aa9296a23ec41a8424e9a2346eea59fb6cb7d8c:

  media: i2c: add os05b10 image sensor driver (2026-01-12 08:43:11 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/bodonoghue.git tags/av1-support

for you to fetch changes up to bc42da5b9c0bdfd210387caf96ad6dea5642abfb:

  media: iris: Add internal buffer calculation for AV1 decoder (2026-01-13 09:45:52 +0000)

----------------------------------------------------------------
This tag contains the first addition of AV1 to the Kernel

- The AV1 pixel format is added to the uapi and v4l2 lists
- A small update is then made to Qualcomm's Iris transcoder
- The patches have been on-list and tested in the community
  everything looks good for merge.

----------------------------------------------------------------
Deepa Guthyappa Madivalara (5):
      media: uapi: videodev2: Add support for AV1 stateful decoder
      media: v4l2: Add description for V4L2_PIX_FMT_AV1 in v4l_fill_fmtdesc()
      media: iris: Add support for AV1 format in iris decoder
      media: iris: Define AV1-specific platform capabilities and properties
      media: iris: Add internal buffer calculation for AV1 decoder

 .../userspace-api/media/v4l/pixfmt-compressed.rst  |   8 +
 drivers/media/platform/qcom/iris/iris_buffer.h     |   2 +
 drivers/media/platform/qcom/iris/iris_ctrls.c      |   8 +
 drivers/media/platform/qcom/iris/iris_hfi_common.h |   3 +
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |  85 +++++-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   9 +
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  22 ++
 drivers/media/platform/qcom/iris/iris_instance.h   |   1 +
 .../platform/qcom/iris/iris_platform_common.h      |  13 +
 .../media/platform/qcom/iris/iris_platform_gen1.c  |  22 +-
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 159 +++++++++++
 drivers/media/platform/qcom/iris/iris_vdec.c       |  23 +-
 drivers/media/platform/qcom/iris/iris_vidc.c       |   1 +
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 299 ++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h | 116 ++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c               |   1 +
 include/uapi/linux/videodev2.h                     |   1 +
 17 files changed, 747 insertions(+), 26 deletions(-)

