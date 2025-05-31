Return-Path: <linux-media+bounces-33719-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 869F2AC9BB6
	for <lists+linux-media@lfdr.de>; Sat, 31 May 2025 18:32:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38F0B3AD3D2
	for <lists+linux-media@lfdr.de>; Sat, 31 May 2025 16:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 416D613CA97;
	Sat, 31 May 2025 16:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pLTFl+eV"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0427154C17
	for <linux-media@vger.kernel.org>; Sat, 31 May 2025 16:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748709117; cv=none; b=G46mR4k2e8wNZp4v2xgHsJIVgNojbXBfHKA1ZAWKvSjNHz6++QgF/wOmIwsunu7HAjTA388qMQqhPEiXPr46FD0JWNh5gtWoL6xzFHvJPDPEND/Va9vlL9MhjZlQodGM1e8at/VcgBWOhJnmqMb9WFSilESTxckTex0O06NtvHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748709117; c=relaxed/simple;
	bh=imsK3zOLm+g/zimUyT8A1+8gdFwth+sEqOsEXZq032c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qby644XYMnIctR4KZA4lu1vfQikV+3BA1t4p8+UKXei+t4hiUQjlo8rLl/yvAMe4NKk9DASmG8yeOhGUjcn4b1I8PUwg6Rn5MxHMr4Pj15EuRq08XSh/o5jx4ziVrCTm4F7cjvnH9azKFd4s4lIORz51f1nW4kmmfLrabGKqOn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pLTFl+eV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75964C4CEE3;
	Sat, 31 May 2025 16:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748709117;
	bh=imsK3zOLm+g/zimUyT8A1+8gdFwth+sEqOsEXZq032c=;
	h=From:To:Cc:Subject:Date:From;
	b=pLTFl+eV7J8i6DDJ89WvHhem1R9Je0vK1OJrTAljXPTfZhlpm75VhRIsYFGY3CNmM
	 CZpavKuzgNmawkP+CkWiRlmI4SgraQwNujn0NQH16ODG/D0cYbPBzL2tW677BQ+TQg
	 NB80Z19XtABZaoSV7LvvQR2k8xOXooVRzxTfxB8dDYjxRQINiTMBZll+IWPAu4nk3W
	 phuS0Q97sQmSfmsIofJg+ak05oKSqTCgffrNyt8GP9GyvEcDS8/2TsVOm+zE8P9nVm
	 tttdKpJzAECgqkvjBXnbtV3Y9zOFkJV1pb77BpUUjLa72u1a+gc1sM7cgED4wuGZ1V
	 WIfYg7kNI5kKA==
From: Hans de Goede <hansg@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mathis Foerst <mathis.foerst@mt.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>
Subject: [PATCH v2 00/12] media: mt9m114: Changes to make it work with atomisp devices
Date: Sat, 31 May 2025 18:31:35 +0200
Message-ID: <20250531163148.83497-1-hansg@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi All,

Here is v2 of my series to make the "mainline" mt9m114 driver work
on devices with an atomisp CSI2 receiver / ISP. This has been tested on
an Asus T100TA.

Changes in v2:
- Rebase on top of sailus/media_tree.git/fixes which now has 4 of
  the patches from Mathis': "MT9M114 driver bugfix and improvements"
  series, this avoids most of the conlicts between the 2 series
- Add Laurent's Reviewed-by to some of the patches
- Add select VIDEO_APTINA_PLL to Kconfig
- Use correct aptina_pll_limits
- After setting reset high wait 20 clk cycles before disabling
  the clk and regulators
- When bypassing the scalar make ifp_get_selection() / ifp_set_selection()
  fill sel->r with a rectangle of (0,0)/wxh and return 0 instead of
  returning -EINVAL

Regards,

Hans


Hans de Goede (12):
  media: aptina-pll: Debug log p1 min and max values
  media: mt9m114: Add support for clock-frequency property
  media: mt9m114: Use aptina-PLL helper to get PLL values
  media: mt9m114: Lower minimum vblank value
  media: mt9m114: Fix default hblank and vblank values
  media: mt9m114: Tweak default hblank and vblank for more accurate fps
  media: mt9m114: Avoid a reset low spike during probe()
  media: mt9m114: Put sensor in reset on power-down
  media: mt9m114: Fix scaler bypass mode
  media: mt9m114: Drop start-, stop-streaming sequence from initialize
  media: mt9m114: Return -EPROBE_DEFER if no endpoint is found
  media: mt9m114: Add ACPI enumeration support

 drivers/media/i2c/Kconfig      |   1 +
 drivers/media/i2c/aptina-pll.c |   2 +
 drivers/media/i2c/mt9m114.c    | 166 ++++++++++++++++++++++++---------
 3 files changed, 127 insertions(+), 42 deletions(-)


base-commit: 2a8e220f6a2bcd5828ab67c7cf194874590ede24
-- 
2.49.0


