Return-Path: <linux-media+bounces-16714-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6E995E065
	for <lists+linux-media@lfdr.de>; Sun, 25 Aug 2024 01:32:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0EC9B1F21DB5
	for <lists+linux-media@lfdr.de>; Sat, 24 Aug 2024 23:32:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B306143C65;
	Sat, 24 Aug 2024 23:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="eQppZXtD"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1615139FE5
	for <linux-media@vger.kernel.org>; Sat, 24 Aug 2024 23:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724542359; cv=none; b=GvCGoDfzxUfZmTklAgVB+0r7MnFNrwcl/U77yDixdemtqrojjyL29sgjqmYNphqGOzMqTM4BQYsTdC8S547on36Av+Af0eU2SNWk1bmH3D/ApUfphX2oUd9LiBx1Mi7jyml3i1RknCwuqNDSFIkI9el+cbtK4JhuvElkKx1HirE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724542359; c=relaxed/simple;
	bh=DxVYUpL3B+ZG1wyy62ozTTniGeglmK2umSmO3SK9QHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X5lbRFTqrWau3zAq18rmNmcMW1WLAhehsYmfMR1G4Qci3FsSo0CoPL1E+ZDkhLU0zpdwDUKxjDd06m0eFxy0Gg2RH0gDdM538IXp8C4IDGZaDL2h2XMTZ9o+2yAgXGU5nSfypGOghzcN1H1QisfU7JLPStz2mgJU876t1DDfGvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=eQppZXtD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 82ABD512;
	Sun, 25 Aug 2024 01:31:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724542291;
	bh=DxVYUpL3B+ZG1wyy62ozTTniGeglmK2umSmO3SK9QHQ=;
	h=Date:From:To:Cc:Subject:From;
	b=eQppZXtD2/oTgI7ZCRigum209meEa5BksgMl3ImrM+MiS3pFi43y4rq+VPg/eQrrY
	 r/i+rG2CKB/PRzi5gSa97fUlJPCv7yeu59uEAINq1e2RjAC29pustThuB2e2U0uMPW
	 sV1fQEUklIeWJXfbyfDINALe6uveeOOU7XIo/X9c=
Date: Sun, 25 Aug 2024 02:32:33 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [GIT PULL FOR v6.12] Miscellaneous IMX patches
Message-ID: <20240824233233.GB9543@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello Mauro, Hans,

The following changes since commit a043ea54bbb975ca9239c69fd17f430488d33522:

  Merge tag 'next-media-rkisp1-20240814' of git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git (2024-08-14 17:18:47 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git tags/next-media-imx-20240825

for you to fetch changes up to 4fb5babe965768daf497503f4082e74abd1c0fed:

  media: imx8mq-mipi-csi2: Switch to RUNTIME/SYSTEM_SLEEP_PM_OPS() (2024-08-23 16:55:30 +0300)

CI has passed: https://gitlab.freedesktop.org/linux-media/users/pinchartl/-/pipelines/1256967.

----------------------------------------------------------------
Improvements to i.MX media drivers:

- Switch to RUNTIME/SYSTEM_SLEEP_PM_OPS() for better compile testing of
  the imx-mipi-csis and imx8mq-mipi-csi2 drivers
- Improve real time behaviour of imx-mipi-csis by avoiding logging while
  holding a spin lock

----------------------------------------------------------------
Fabio Estevam (2):
      media: imx-mipi-csis: Switch to RUNTIME_PM_OPS()
      media: imx8mq-mipi-csi2: Switch to RUNTIME/SYSTEM_SLEEP_PM_OPS()

Matthias Fend (1):
      media: imx-mipi-csis: avoid logging while holding spinlock

 drivers/media/platform/nxp/imx-mipi-csis.c    | 19 +++++++++++--------
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 17 ++++++++---------
 2 files changed, 19 insertions(+), 17 deletions(-)

-- 
Regards,

Laurent Pinchart

