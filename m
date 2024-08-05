Return-Path: <linux-media+bounces-15778-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E3D947E78
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2024 17:46:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C72101C21D3C
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2024 15:46:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C80B315B125;
	Mon,  5 Aug 2024 15:46:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDEB7E101;
	Mon,  5 Aug 2024 15:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.14.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722872793; cv=none; b=Bct2nqnhmwra77GO16+mK9Earo35zmIsFAtN7GqYM5pLhz0swrXmwCFGzNLvAXVOtWcq8Ja1A3BMDfNqj8tOQGp2ErDSD/hIY3F6Lq4dv/Z87FsCVycFfPupv/dBHdD1W8caCR4zEVeGFboi1aH2hLVrQLXyC1I3jZ/tY+5d4h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722872793; c=relaxed/simple;
	bh=c7HXXvBTV5PGlRRhVIlLpfYS5XM04ZPwGWusUMtWg+w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RWEVeVSeOUZl5I+DoNThrJK1cAx99H3+Q1t4ZL/0doV5UxhYzfkp/pTrsDkOsbbdsQrZdY/VKXra1eb82TOBF5/63kVQ157r/TOp5Y7edaKq+FOrzCEIyrhEw9QnQJ8qJAIaww7MMeIZ3B05zZy+bbxqpxD91ltbTG9mjf7Q5Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org; spf=pass smtp.mailfrom=gpxsee.org; arc=none smtp.client-ip=37.205.14.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from mgb4.. (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id 043B65EB9C;
	Mon, 05 Aug 2024 17:41:02 +0200 (CEST)
From: tumic@gpxsee.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Martin=20T=C5=AFma?= <martin.tuma@digiteqautomotive.com>
Subject: [PATCH v6 0/4 RESEND] media: mgb4: YUV and variable framerate support
Date: Mon,  5 Aug 2024 17:40:50 +0200
Message-ID: <20240805154054.8633-1-tumic@gpxsee.org>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Martin Tůma <martin.tuma@digiteqautomotive.com>

Recent mgb4 FW update added support for the YUV image format and variable
framerates independent of the signal framerate. The following patches extend
the mgb4 driver with support for both features.

Changes in V6:
- Properly handle the timings when no signal is present.

Changes in V5:
- Removed surplus v4l2_format.type checks.
- Improved the patch descriptions.
- Splitted the frame rate limit patch into separate code/documentation parts.

Changes in V4:
- Splitted the output frame_rate handling fix from the variable frame rate
  addition patch.

Changes in V3:
- Use div_u64() for 64b division (fixes build error on ARM32)

Changes in V2:
- Added missing stride limit

Martin Tůma (4):
  media: mgb4: Add support for YUV image formats
  media: mgb4: Add support for V4L2_CAP_TIMEPERFRAME
  media: mgb4: Fixed signal frame rate limit handling
  media: admin-guide: mgb4: Outputs DV timings documentation update

 Documentation/admin-guide/media/mgb4.rst |  23 +-
 drivers/media/pci/mgb4/mgb4_core.c       |   2 +-
 drivers/media/pci/mgb4/mgb4_core.h       |   2 +
 drivers/media/pci/mgb4/mgb4_io.h         |  29 ++-
 drivers/media/pci/mgb4/mgb4_sysfs_out.c  |   9 +-
 drivers/media/pci/mgb4/mgb4_vin.c        | 193 +++++++++++---
 drivers/media/pci/mgb4/mgb4_vin.h        |   3 +-
 drivers/media/pci/mgb4/mgb4_vout.c       | 309 ++++++++++++++++++++---
 drivers/media/pci/mgb4/mgb4_vout.h       |   5 +-
 9 files changed, 482 insertions(+), 93 deletions(-)


base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
-- 
2.45.1


