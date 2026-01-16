Return-Path: <linux-media+bounces-50892-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A063D31791
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 14:03:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A2AAC3068F8C
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 13:02:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7C892472B6;
	Fri, 16 Jan 2026 13:02:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18AD7238C07;
	Fri, 16 Jan 2026 13:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.14.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768568566; cv=none; b=Lb1XkMCC8F0HLX619umwJpWRm/cMJotS95PNbw70TXjjZAbkZrqTkRowQkU7RCbPplkfWoqn4/9jXyDirZdq7THnYtiCX6rLfU+kkkgXsZ4dKjk2grRsKwJ0NiXd2fMCokKK0fypY4uXP/J7w8Q2Tbnx1edeIr8zHJtxClaz6nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768568566; c=relaxed/simple;
	bh=EfHuqVf1XPh8q6hBbrjc7QjZ6vKNraTeevWRKg7i//0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kU6RIjVNTlBj6pXjPwCbKRuwpFfFwrpmGUEuefkDTV99HlKil57Dgk5KKX/SpEyMi1TUf8L/dLGk9HbkkGpSKMTzhAMXZdzNjvHPBIHFvfztmajYYYPgHeXn6+vr/eUoybvoQzO1pZLmYrPCCGUhGlQNN0DSoIwq+JIk0rR7IT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org; spf=pass smtp.mailfrom=gpxsee.org; arc=none smtp.client-ip=37.205.14.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from localhost (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id ABCAA789FF;
	Fri, 16 Jan 2026 13:56:12 +0100 (CET)
From: tumic@gpxsee.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Martin=20T=C5=AFma?= <martin.tuma@digiteqautomotive.com>
Subject: [PATCH RESEND v3 0/3] media: pci: mgb4: Add support for GMSL1 and GMSL-coax modules
Date: Fri, 16 Jan 2026 13:55:52 +0100
Message-ID: <20260116125555.5287-1-tumic@gpxsee.org>
X-Mailer: git-send-email 2.52.0
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
2.52.0


