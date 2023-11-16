Return-Path: <linux-media+bounces-453-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2A97EE49A
	for <lists+linux-media@lfdr.de>; Thu, 16 Nov 2023 16:48:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0EF98B20D2E
	for <lists+linux-media@lfdr.de>; Thu, 16 Nov 2023 15:48:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E2E3364BF;
	Thu, 16 Nov 2023 15:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ev+qQXOi"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17596D59;
	Thu, 16 Nov 2023 07:48:28 -0800 (PST)
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DF506660734C;
	Thu, 16 Nov 2023 15:48:25 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700149706;
	bh=qOGURixP10SKLR9eMJf0x73f6ugT8/gbvL3YowPyUCo=;
	h=From:To:Cc:Subject:Date:From;
	b=ev+qQXOisOTKnWgq1P8D8oEK9yX30W34JGRLzV4HX5MsrGgm5YSfT1TzKlVvs57sN
	 jBk6KH6DXlhwFAnLWXHB/J/NH2MvGglS/ROafXqXx8zTDgGQ8+WZsx19p3SrsoMg5F
	 /PwJvvgMErv+GUu7KnFg1TZMdE9xO2GWaJPnoNG99XheUvcgUFrpHjxZhTgTgqxFR9
	 ymC+EI1dQI66IedwlkqLLasg7uL6hGRYGeKzn0qkMvTzPvWDhrDR5Sg4RAZkfg8GBs
	 J93wjM93c473Jgzoq4nMovXzxh68aVPVQYttT5nW3me3sAFvu6FDEAOcJh4z0RnULv
	 KW8GoQcONBLTQ==
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Cc: Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	kernel@collabora.com
Subject: [RFC 0/6] H.264 stateless encoder RFC 0/6
Date: Thu, 16 Nov 2023 16:48:10 +0100
Message-Id: <20231116154816.70959-1-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Dear All,

This series adds uAPI for stateless H.264 encoding and an
accompanying driver using it.

It has been tested on an stm32mp25 and there exists
a gstreamer user:

https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/5676

example pipeline:

gst-launch-1.0 videotestsrc num-buffers=30 ! video/x-raw, format=YUY2 !
v4l2slh264enc ! filesink location=test.h264

Rebased onto v6.6 with:

- some patches from ST to actually run the hardware
- my previous VP8 statless encoding series
- VP8 support for H1 from Hugues Fruchet

In particular, this series depends on the latter, which can be
found here:

https://patchwork.linuxtv.org/project/linux-media/list/?series=11358

Here's a branch which contains everything needed to actually run:

https://gitlab.collabora.com/linux/for-upstream/-/tree/h264-enc-rfc-6.6

I kindly ask for comments.

Regards,

Andrzej Pietrasiewicz (6):
  media: verisilicon Correct a typo in
    H1_REG_ENC_CTRL2_DEBLOCKING_FILTER_MODE
  media: verisilicon: Correct a typo in H1_REG_MAD_CTRL_MAD_THRESHOLD
  media: verisilicon: Improve constant's name
  media: verisilicon: Update H1 register definitions
  media: uapi: Add H.264 stateless encoding uAPI
  media: verisilicon: Add H.264 stateless encoder

 drivers/media/platform/verisilicon/Makefile   |   1 +
 drivers/media/platform/verisilicon/hantro.h   |   3 +
 .../media/platform/verisilicon/hantro_drv.c   |  10 +
 .../platform/verisilicon/hantro_h1_h264_enc.c | 493 +++++++++++
 .../platform/verisilicon/hantro_h1_regs.h     |  20 +-
 .../platform/verisilicon/hantro_h1_vp8_enc.c  |   2 +-
 .../media/platform/verisilicon/hantro_h264.c  | 777 ++++++++++++++++++
 .../media/platform/verisilicon/hantro_hw.h    |  23 +
 .../platform/verisilicon/stm32mp25_venc_hw.c  |  22 +-
 drivers/media/v4l2-core/v4l2-ctrls-core.c     |  54 ++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |   9 +
 include/uapi/linux/v4l2-controls.h            |  85 ++
 include/uapi/linux/videodev2.h                |   2 +
 13 files changed, 1496 insertions(+), 5 deletions(-)
 create mode 100644 drivers/media/platform/verisilicon/hantro_h1_h264_enc.c

-- 
2.25.1


