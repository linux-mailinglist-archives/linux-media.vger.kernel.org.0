Return-Path: <linux-media+bounces-25314-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D460FA1DA44
	for <lists+linux-media@lfdr.de>; Mon, 27 Jan 2025 17:10:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82AB91882347
	for <lists+linux-media@lfdr.de>; Mon, 27 Jan 2025 16:10:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93E7B15B99E;
	Mon, 27 Jan 2025 16:10:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E1B13D521;
	Mon, 27 Jan 2025 16:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.14.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737994210; cv=none; b=QFQuPQ5a95lvGj1fuA+CVc2M8NcebhnotDyvUAqnTgUVXx8xFnE1HExFYiq+9hwNNf0d29o7VIqj+D5PzSOLFTTl2P+NoM1g+JOTlhpBGLrnqGxTMu4PRBY+J3A363gref/UXzyTTEmx9EMc84mIe4bCeeUY22v+6JN3aDOGS8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737994210; c=relaxed/simple;
	bh=AFFnsnqJ57xoZXnmmcTwW85+G561LrJ/pAtFNbNc+OY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RkbTeoiSoYHaWP4NX34JKoCSfwHK0CAxO00fRTv8xIP3PJolhhp8NxFyKka6qhUMasPhN3abgDFFG/NcpfrPVmKBe5g4lYI2FE6tA/ljz1jDo+0quZR6NQcnOuT+Cy/cp8EnW1+lBwjQwraqRTZ3Fd6As11gv2/fjjabfBpPlVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org; spf=pass smtp.mailfrom=gpxsee.org; arc=none smtp.client-ip=37.205.14.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from mgb4.. (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id 1D37B5075E;
	Mon, 27 Jan 2025 17:00:03 +0100 (CET)
From: tumic@gpxsee.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Martin=20T=C5=AFma?= <martin.tuma@digiteqautomotive.com>
Subject: [PATCH 0/2] Added support for new mgb4 GMSL modules
Date: Mon, 27 Jan 2025 16:59:55 +0100
Message-ID: <20250127155957.5254-1-tumic@gpxsee.org>
X-Mailer: git-send-email 2.48.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Martin Tůma <martin.tuma@digiteqautomotive.com>

Added support for new mgb4 GMSL modules variants.

Martin Tůma (2):
  media: mgb4: Added support for additional GMSL modules variants
  media: admin-guide: add mgb4 GMSL modules variants description

 Documentation/admin-guide/media/mgb4.rst |  4 +++-
 drivers/media/pci/mgb4/mgb4_core.c       | 13 +++++++++----
 drivers/media/pci/mgb4/mgb4_core.h       |  8 ++++++--
 3 files changed, 18 insertions(+), 7 deletions(-)


base-commit: 94794b5ce4d90ab134b0b101a02fddf6e74c437d
-- 
2.48.0


