Return-Path: <linux-media+bounces-42119-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CF5B4FFF6
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 16:48:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05FBA5E3145
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 14:48:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B29EF350841;
	Tue,  9 Sep 2025 14:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TR86SInN"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23B433EAF7;
	Tue,  9 Sep 2025 14:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757429308; cv=none; b=XF42HMRQZ0OzU1SYO//BTcZbynyHnVwNte9XqnRjaPb3BU0yO4rmwIqSfX9pORejqBeZwm9a+QDV9JeVs+/hbTjyGaKjjK4MpsKZM/TKfpRzQsdr6FyWv3PJytHZEAwPgsJMUKRsRhqS8x7iCD4Hj8gxhvWEg0BLTYSsn+yKqVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757429308; c=relaxed/simple;
	bh=itaJN2Uq8A2NcGuJPkmVwTNzlAgz/luBJuHshN21kZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R/IjW9A7bwA19dJxeH5S/cEhNdi/ptSBvgEFLEM3zE2foMLjdHGQsH6Qb1p2GuVQB395KRElw7ai6lSjrFDpYs3DXQZUtloYpy9fuvZjvIXgRcVXKJivrdzDrJolOO92UX1MP6Eoz9BOkghk04E6IM1tPzy9pn4EFmAc4gl0Yj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TR86SInN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A934C4CEFA;
	Tue,  9 Sep 2025 14:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757429307;
	bh=itaJN2Uq8A2NcGuJPkmVwTNzlAgz/luBJuHshN21kZ8=;
	h=From:To:Cc:Subject:Date:From;
	b=TR86SInNJCJlJHrvLqMwMRtjnIH/Hbbe5EEisKxw+swugTHPSIUrYuVzAVCTKMwFZ
	 sbacHnBmTwv1ggLSdOpTh5lrXGjIRHrEC/eP3xoAFYKOD2KbK3G3ard7hHaKBas39L
	 /sspHmKeD5IFbTJHaQdQHhU1I691O8srNMCEd9VEMZYI+G/Iv/6c9jOBNZcuZdyK8q
	 lR7R9uIOMGriiXCGCUFYnv6ogr8YEsYLAlkJB/dWJWUU5oC/Zujmr21gFII+ftJ9+c
	 p5rZKiVOLr+QfDKtEM9UhkpUAJA4VVREI+ZqIsmVXF9sEmVoM8+e5PoRBx8uythzFi
	 v303quUbx7aBg==
From: Hans de Goede <hansg@kernel.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Aleksandrs Vinarskis <alex@vinarskis.com>,
	platform-driver-x86@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 0/2] v4l2-subdev/int3472: Use "privacy" as con_id for the LED lookup
Date: Tue,  9 Sep 2025 16:48:21 +0200
Message-ID: <20250909144823.27540-1-hansg@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi All,

During DT-binding review for extending the V4L2 camera sensor privacy LED
support to systems using devicetree, it has come up that having a "-led"
suffix for the LED name / con_id is undesirable since it already is clear
that it is a LED:

https://lore.kernel.org/linux-media/0e030e7d-0a1a-4a00-ba18-ed26107d07fa@oss.qualcomm.com/

There was discussion about making an exception for "privacy-led" since
that is already used on x86/ACPI platforms, but I'm afraid that will set
a bad example which ends up being copy and pasted, so lets just drop
the "-led" prefix from the x86/ACPI side, which we can do since there
this is only an in-kernel "API".

Note both patches do need to be merged at the same time to avoid breakage.
Since the changes are tiny I think it would be best to just have Sakari
merge them both through the linux-media tree.

Ilpo can you give your ack for patch 2/2 getting merged through
the linux-media tree?

Regards,

Hans


Hans de Goede (2):
  media: v4l2-subdev: Use "privacy" as con_id when getting the privacy
    LED
  platform/x86: int3472: Use "privacy" as con_id for the LED lookup

 drivers/media/v4l2-core/v4l2-subdev.c    | 2 +-
 drivers/platform/x86/intel/int3472/led.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.51.0


