Return-Path: <linux-media+bounces-21678-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0249D3EBF
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 16:15:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 598CDB346ED
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 15:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C2D71D2F54;
	Wed, 20 Nov 2024 14:56:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A291D0954;
	Wed, 20 Nov 2024 14:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.14.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732114567; cv=none; b=D2mI1x/+O0dsLAqWuO0G20N+pGb8t5r3XWj51z1IXc4tKGZAvNV/Ih29JTTp7yQ4qD2MsBhzYPf/uQiOCVYlKAjY2lJPcfCw3tweqh2MDndN3Oete63JGvfIGmy9akXexwllO3EGj5zUj/9O6RXr33X29U4Kd7FzVEgcpUIkBA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732114567; c=relaxed/simple;
	bh=LOMUH9f8OOaRlajLNFhZpZQD0W9LzBpQ4Z1jI5PYUYU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XI01rcJgWytfDMdoo6sFoqgFfv8dYDWDqct/ab9qE/k4l6kSorZzbxfeOrVod190PIgoV+sW2BnFPqdqbOOsBg8Trku7+FVXUqF4wnGUQkZHo+LW+Pa7sP8oRmXSFfEEMgX1B7qh/CheUTVCA6SYiBQ/RSfIu1KIy5rvI7QKTKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org; spf=pass smtp.mailfrom=gpxsee.org; arc=none smtp.client-ip=37.205.14.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from mgb4.. (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id 9AD0B64194;
	Wed, 20 Nov 2024 15:48:54 +0100 (CET)
From: tumic@gpxsee.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Martin=20T=C5=AFma?= <martin.tuma@digiteqautomotive.com>
Subject: [PATCH 0/3] media: mgb4: driver code cleanup
Date: Wed, 20 Nov 2024 15:48:43 +0100
Message-ID: <20241120144846.2271-1-tumic@gpxsee.org>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Martin Tůma <martin.tuma@digiteqautomotive.com>

The following changes are small mgb4 driver cleanup patches that mostly unify
the code base of the input and output devices.

Martin Tůma (3):
  media: mgb4: Unify the outputs padding logic with the inputs
  media: mgb4: Unify register names in inputs/outputs
  media: mgb4: Defines cleanup

 drivers/media/pci/mgb4/mgb4_core.c     |  4 +++-
 drivers/media/pci/mgb4/mgb4_core.h     |  3 ---
 drivers/media/pci/mgb4/mgb4_sysfs_in.c | 12 ++++++------
 drivers/media/pci/mgb4/mgb4_vin.c      | 20 ++++++++++----------
 drivers/media/pci/mgb4/mgb4_vin.h      |  4 ++--
 drivers/media/pci/mgb4/mgb4_vout.c     | 14 ++++++--------
 6 files changed, 27 insertions(+), 30 deletions(-)


base-commit: 72ad4ff638047bbbdf3232178fea4bec1f429319
-- 
2.47.0


