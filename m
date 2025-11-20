Return-Path: <linux-media+bounces-47496-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D0EC7428F
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 14:22:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id C5EE430661
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 13:20:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AF6C33A719;
	Thu, 20 Nov 2025 13:15:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F39F226CF7;
	Thu, 20 Nov 2025 13:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.14.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763644548; cv=none; b=a7MMcrCB2pvnoxK5McOYAAElW+VSwk6SjgOlgKNR3poi5u3FG1Ce18dyZi83IOnGiDGJ4O2TpKnFrw5ViMsNLozEP67U7wTrtgn08f72qBOLEC4pBEkwyKAD6LxqnpDkvjBN7mJQYG8jEf3l8U/D9ITM30auqppdA6LWTE9fN6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763644548; c=relaxed/simple;
	bh=xGXfiOu4aNejFDyPRAbYnueevtAohRQat1osIrufqXc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LzBGV8oMUgNzc6ON5+vSy5isSMxCC2Pb83ytCbsA55AoLGFq1DDCk0jsQs15HkMW5uX5p1b1NV4Y08oj526yIyvLRwaeYYwOmJmFBnsXncy7lQws6f/MDPeLuDI80jDhladCohKgNMAePnRKdEUNWGVUZgU+44xhfkzwrObQvpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org; spf=pass smtp.mailfrom=gpxsee.org; arc=none smtp.client-ip=37.205.14.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from mgb4.digiteq.red (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id 59312339A0;
	Thu, 20 Nov 2025 14:08:37 +0100 (CET)
From: tumic@gpxsee.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Martin=20T=C5=AFma?= <martin.tuma@digiteqautomotive.com>
Subject: [PATCH v3 0/3] media: pci: mgb4: Add support for GMSL1 and GMSL-coax modules
Date: Thu, 20 Nov 2025 14:08:24 +0100
Message-ID: <20251120130827.1882-1-tumic@gpxsee.org>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Martin Tůma <martin.tuma@digiteqautomotive.com>

This patches add support for two new mgb4 card modules - GMSL1 and
GMSL3-coax. The GMSL3-coax module is a variant of the already supported
GMSL3 module with a coaxial interface instead of a twisted-pair interface.
The GMSL1 module is completely new and requires a separate FW type as well.

Changes from v2 to v3:
* fixed oldi_lane_width_show() returning empty string with GMSL1 modules
* unified the default GMSL3c deserializer I2C setup with the chip wiring
  (the GMSL3c modules have a different HW setup than the twisted-pair
  modules).

Changes from v1 to v2:
* Properly use NULL instead of 0.
* Fixed missing "media" prefix in patch #2.

Martin Tůma (3):
  media: pci: mgb4: Add support for GMSL1 modules
  media: pci: mgb4: Add support for GMSL3 coaxial modules
  Documentation: admin-guide: media: mgb4: Add GMSL1 & GMSL3-coax
    modules info

 Documentation/admin-guide/media/mgb4.rst | 11 ++-
 drivers/media/pci/mgb4/mgb4_core.c       | 22 +++++-
 drivers/media/pci/mgb4/mgb4_core.h       | 16 ++--
 drivers/media/pci/mgb4/mgb4_sysfs.h      |  6 +-
 drivers/media/pci/mgb4/mgb4_sysfs_in.c   | 49 ++++++++++---
 drivers/media/pci/mgb4/mgb4_sysfs_out.c  | 38 ++++++++--
 drivers/media/pci/mgb4/mgb4_vin.c        | 93 +++++++++++++++++-------
 drivers/media/pci/mgb4/mgb4_vout.c       | 64 +++++++++++-----
 8 files changed, 221 insertions(+), 78 deletions(-)


base-commit: 1a31cb2782104969e48c7ce7e4fc06e403fcb5cf
-- 
2.51.2


