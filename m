Return-Path: <linux-media+bounces-39833-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D03B2554A
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 23:25:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F27E9A5A20
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 21:25:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50A022EFD8D;
	Wed, 13 Aug 2025 21:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pAH/72oH"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11CF28D8DA
	for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 21:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755120315; cv=none; b=XuXoYZlBbslWVXjVlzGKocrwmLWnUlpsrMxEWg6fYYVTfgPuhzDbWvqyLGuRGEj2UsgzyXj7osO7GbIrloRga0L3vDIXkgrIRG2vQdR0WoRYeRtIrdpaL8mT6q2RPQUCxR0tug3cI+pth+Rzn5wq5pas+yGTcO5nLYhFgLzykAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755120315; c=relaxed/simple;
	bh=CkT54CRblH1F+6eGF7vyDkkegZAjjR2e/2MQz6Cq0XU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IdMe+a7IXmKxk7fUyA5cEq0rs+iIXzHyyq2aMAaMvhg5eA+6yMUHBGSkjTsbzQyRnZIoLyetP7fPP3R8pJMn6+lZ/04tRRKqWYFAOYaMHrfubS1llhxRLVK840l/Zq0tJSdrEFDatRr618wIW3TckYe6VmuSaM6CM+YcuYZ/m6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pAH/72oH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id E5A6DF89;
	Wed, 13 Aug 2025 23:24:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755120257;
	bh=CkT54CRblH1F+6eGF7vyDkkegZAjjR2e/2MQz6Cq0XU=;
	h=From:To:Cc:Subject:Date:From;
	b=pAH/72oHusIMzR+RktSQgmXJLEEvGdeGXw3s6oErfAhYl2RXs3YaQZTuPOHOq7BCy
	 5cNX4evSnRfim5pjlTFmvnVAvx0nc6I4nsMmLjPthRBuDBIKtE2+xuZvgkmHLbmP9O
	 daMzB9xuuCOnChiKxa+Ir7VbT/I8KoxShlx7vc3E=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Richard Leitner <richard.leitner@linux.dev>,
	imx@lists.linux.dev
Subject: [PATCH v2 0/2] media: nxp: imx8-isi: fix streaming cleanup on release
Date: Thu, 14 Aug 2025 00:24:49 +0300
Message-ID: <20250813212451.22140-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This patch series fixes an issue initially reported by Richard in [1],
with a proposed fix. I've recommended an alternative approach, and gave
it a try.

Patch 1/2 fixes streaming cleanup on release. Patch 2/2 then cleans up
the driver a bit by dropping an unneeded structure field.

The changes have been tested by opening and closing the video device
while streaming in another process. I have also tested suspend/resume
during streaming.

[1] https://lore.kernel.org/linux-media/20250709-imx8-isi-release-fix-v1-1-c47c659ce1a6@linux.dev/

Laurent Pinchart (1):
  media: nxp: imx8-isi: Drop mxc_isi_video.is_streaming field

Richard Leitner (1):
  media: nxp: imx8-isi: Fix streaming cleanup on release

 .../platform/nxp/imx8-isi/imx8-isi-core.h     |   3 +-
 .../platform/nxp/imx8-isi/imx8-isi-video.c    | 156 +++++++-----------
 2 files changed, 57 insertions(+), 102 deletions(-)


base-commit: 078f1a7eb48eef9b3cb78bcd2254356f3a332358
-- 
Regards,

Laurent Pinchart


