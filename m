Return-Path: <linux-media+bounces-915-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B117F6361
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 16:53:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 901A7B211FB
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 15:53:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 200363E486;
	Thu, 23 Nov 2023 15:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="lQzU/Vpe"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 013AAD5A;
	Thu, 23 Nov 2023 07:53:34 -0800 (PST)
Received: from arisu.hitronhub.home (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id ABA3E6607328;
	Thu, 23 Nov 2023 15:53:32 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700754813;
	bh=eQSQ9kZBc9hWlP0jIUGHqy0Ce7PCPO42UcQIm6uTYF4=;
	h=From:To:Cc:Subject:Date:From;
	b=lQzU/VpeLikRTi5CCQwZJ6Z7sGJrMWFJjkcpJOsCfPywHZFpLakXk3qW9ru4MZTBg
	 1EzKLb967gl5naJyLCkhgLEr9d+KZO0ki/DWvdOBACyUI48SQ/G9o6Bpup3H2O/hOF
	 KDi9Z5JSadGq6Rd+FVW1pk4thfLBba6/94gmt0V2ycdF/ahV1Qcz1MzeU2l04/Te2Z
	 CVagHW541tHMwgR3syYq1GEfxikG9TUendGRlDOQ4CHYBwOj81A8y401m/8aA46xqu
	 coo7S8fcevGEilI72r8d1KH8f+uK6eeSrwvkoC+aMqh1E1rbajW04pn6OU0RCOQMSa
	 qu6q8GBMTkbgQ==
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: linux-media@vger.kernel.org,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Detlev Casanova <detlev.casanova@collabora.com>
Subject: [PATCH v3 0/2] visl: Add support for AV1
Date: Thu, 23 Nov 2023 10:52:24 -0500
Message-ID: <20231123155342.56277-1-detlev.casanova@collabora.com>
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

Changes since v2:
- Fix the ref_frame indexing
Changes since v1:
- Rebased on media_tree/master

Detlev Casanova (2):
  visl: Add AV1 support
  doc: visl: Add AV1 support

 Documentation/admin-guide/media/visl.rst      |   2 +
 drivers/media/test-drivers/visl/visl-core.c   |  21 ++
 drivers/media/test-drivers/visl/visl-dec.c    |  72 +++-
 drivers/media/test-drivers/visl/visl-dec.h    |   8 +
 .../media/test-drivers/visl/visl-trace-av1.h  | 314 ++++++++++++++++++
 .../test-drivers/visl/visl-trace-points.c     |   1 +
 drivers/media/test-drivers/visl/visl-video.c  |  18 +
 drivers/media/test-drivers/visl/visl-video.h  |   1 +
 drivers/media/test-drivers/visl/visl.h        |   1 +
 9 files changed, 437 insertions(+), 1 deletion(-)
 create mode 100644 drivers/media/test-drivers/visl/visl-trace-av1.h

-- 
2.41.0


