Return-Path: <linux-media+bounces-27426-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7FBA4CEE3
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 23:59:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7CB9F3ABB2E
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 22:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4F2723BFA9;
	Mon,  3 Mar 2025 22:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Co9//dWp"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D22EC4;
	Mon,  3 Mar 2025 22:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741042744; cv=none; b=I1OqWWT5G5xEcrOgndYj3LtZmw64hluBP8BfpmhGsVNxlQFAIA4dVueeKj0p9X+EVQoexZc/AzH+jCJkpfXzwPJ7NQDwVu2d3H73lRNXVCjaD5SNN9wX4B65UH8NBQfxnwvCQrmn/njXAqjCzhZ3Zfjd3f134JB0y/4muBjQcBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741042744; c=relaxed/simple;
	bh=XbOH1fC1/MqVpPPDTqHt/Rol16iCZE4/cwigRDqrXss=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RWl1hqhVwZnHJLdAUpa3CcwoSAxTji9dvL1x48+lC/82fFCmsNSd2iihaoFbwrhD5xoutT4+svjr80GCCJ/vbsyA5d2WwD/hL0MYKl77KUykhR416Ikj2eABbLS0GrvzOQ+WnRSj58tsdN2NY1CP08lV/T5tOD3wOilOr5ujJXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Co9//dWp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id AB1D7C4CEE9;
	Mon,  3 Mar 2025 22:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1741042743; bh=XbOH1fC1/MqVpPPDTqHt/Rol16iCZE4/cwigRDqrXss=;
	h=From:Subject:Date:To:Cc:From;
	b=Co9//dWpARvtu9grWKQH/G7K2ze8qZhCuFrb9iPhp0EgFj+Mzxp/xhWLzc7JHtbQo
	 bPzLW4KmKAOznW7tRn3RW5ZWfIRwJrytoGFsuFHBvjSBMJ/Zd/isOvWT+2HV4UZ4eA
	 Pm4oKO7lBU9f5Ff3rmzq2dPgOI0wLKZfPI18fOc0=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FD38C282D0;
	Mon,  3 Mar 2025 22:59:03 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Subject: [PATCH 0/3] Add flash/strobe support for ov9282
Date: Mon, 03 Mar 2025 23:58:56 +0100
Message-Id: <20250303-ov9282-flash-strobe-v1-0-0fd57a1564ba@linux.dev>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADA0xmcC/0XMywrDIBCF4VcJs+6AmhoaX6Vk4WVMhKKtplIIe
 fdKQunyP3C+DQrlQAVUt0GmGkpIsQW/dGAXHWfC4FqDYEKynvWY6ihuAv1DlwXLmpMh1HYwjjE
 7OhqgPZ+ZfPgc6n06O9Pr3fD1HP+26g5ZCInm+sNnHSKS59Zpo6XxTlUO075/AURFWfKuAAAA
X-Change-ID: 20250303-ov9282-flash-strobe-ac6bd00c9de6
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Richard Leitner <richard.leitner@linux.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741042742; l=1479;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=XbOH1fC1/MqVpPPDTqHt/Rol16iCZE4/cwigRDqrXss=;
 b=tPsXSgcYuvu4Sx6vaJjj2l/fOFaX2Ujdxbk35Mtejtr68dD/w/VDfKMwsAOA2P9f9fUKvMzn9
 9hkSLXJOWU8DAZFP8SNmuPzXo4EUbzMSV+95eKEnfqIia+VIrINvDTk
X-Developer-Key: i=richard.leitner@linux.dev; a=ed25519;
 pk=8hZNyyyQFqZ5ruVJsSGBSPIrmJpfDm5HwHU4QVOP1Pk=
X-Endpoint-Received: by B4 Relay for richard.leitner@linux.dev/20250225
 with auth_id=350

This series adds basic flash/strobe support for ov9282 sensors using
their "hardware strobe output".

Apart from en-/disabling the flash/strobe output, setting a timeout
(duration of activated strobe per frame) is implemented. The calculation
of this timeout is only interpolated from various measurements, as no
documentation was found.

Further flash/strobe-related controls as well as a migration to v4l2-cci
helpers will likely be implemented in future series.

All register addresses/values are based on the OV9281 datasheet v1.53
(january 2019). This series was tested using an ov9281 VisionComponents
camera module.

Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
---
Richard Leitner (3):
      media: i2c: ov9282: add output enable register definitions
      media: i2c: ov9282: add led_mode v4l2 control
      media: i2c: ov9282: add strobe_timeout v4l2 control

 drivers/media/i2c/ov9282.c | 89 ++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 86 insertions(+), 3 deletions(-)
---
base-commit: f41427b3bdee7d9845b13a80c0d03882212f4b20
change-id: 20250303-ov9282-flash-strobe-ac6bd00c9de6
prerequisite-change-id: 20250225-b4-ov9282-gain-ef1cdaba5bfd:v1
prerequisite-patch-id: 86f2582378ff7095ab65ce4bb25a143eb639e840
prerequisite-patch-id: b06eb6ec697aaf0b3155b4b2370f171d0d304ae2
prerequisite-patch-id: b123047d71bfb9b93f743bbdd6893d5a98495801

Best regards,
-- 
Richard Leitner <richard.leitner@linux.dev>



