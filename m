Return-Path: <linux-media+bounces-265-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC54A7EA046
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 16:41:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 768CD280E43
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 15:41:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2333219F7;
	Mon, 13 Nov 2023 15:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="LmQZNs6m"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5622136C
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 15:41:11 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93949D67;
	Mon, 13 Nov 2023 07:41:10 -0800 (PST)
Received: from arisu.mtl.collabora.ca (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 56BD96606EE0;
	Mon, 13 Nov 2023 15:41:08 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699890069;
	bh=Ct0vREwCV/y48Ltfl5ZejvVpefPCrB296PF5Yd+AOXw=;
	h=From:To:Cc:Subject:Date:From;
	b=LmQZNs6mikEo7iX/OkglMpMY2mThLAIE2h0t3Rs5E+UGoFFU47Mar3EO2XQpHJefX
	 xA7B31YUvVK7+rPy9lZEDCj0tXZc/8mLNDMYQqgAfnTlX4YLdS7cd1I6msPI5Xyp1h
	 C+UaG3peq96JcMQ+iENs8Ljp9vGVqfXgrYIPJ4ij2C1j0iHdYA3yA7vbZNqmsL4nLO
	 tylmt5keTMLWHWbbJgRgQKtOzQp+g8qvKGG1aWuP0mCSdvVIXQFX03enz8eV3aXeRX
	 TkKRU39ITHU5OKYe3c3USBmcddQIvofYu7sm/Ccl5TdUV+3M5/2DcfIWsEP9hCx10F
	 o05m8PugfoTGA==
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: linux-media@vger.kernel.org,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Detlev Casanova <detlev.casanova@collabora.com>
Subject: [PATCH v2 0/2] visl: Add support for AV1
Date: Mon, 13 Nov 2023 10:39:57 -0500
Message-ID: <20231113154109.114488-1-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

AV1 support is missing in the visl test driver.
Add it and adapt documentation.

The traces are missing for some fields, basically:
- multi-dimensional arrays
- arrays of flags
- enums
which don't have a __print_* macro.

Changes since v1:
- Rebased on media_tree/master

Detlev Casanova (2):
  visl: Add AV1 support
  doc: visl: Add AV1 support

 Documentation/admin-guide/media/visl.rst      |   2 +
 drivers/media/test-drivers/visl/visl-core.c   |  21 ++
 drivers/media/test-drivers/visl/visl-dec.c    |  70 +++-
 drivers/media/test-drivers/visl/visl-dec.h    |   8 +
 .../media/test-drivers/visl/visl-trace-av1.h  | 314 ++++++++++++++++++
 .../test-drivers/visl/visl-trace-points.c     |   1 +
 drivers/media/test-drivers/visl/visl-video.c  |  18 +
 drivers/media/test-drivers/visl/visl-video.h  |   1 +
 drivers/media/test-drivers/visl/visl.h        |   1 +
 9 files changed, 435 insertions(+), 1 deletion(-)
 create mode 100644 drivers/media/test-drivers/visl/visl-trace-av1.h

-- 
2.41.0


