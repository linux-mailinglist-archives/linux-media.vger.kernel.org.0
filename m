Return-Path: <linux-media+bounces-42178-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6186EB51456
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 12:48:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8EFCB1C80AA4
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 10:48:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9169319859;
	Wed, 10 Sep 2025 10:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s6kZZ0lv"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9C5313E1C;
	Wed, 10 Sep 2025 10:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757501228; cv=none; b=lRuWnLCHfig5HqbGY2vrf5iDMF+K5nfz+mIHi7VxDkGqY6gFlmYOmsch1i+8SoI8IhGqpeywe+skx1cRmCC+CeGCreAzhXa/UpshL9+4XBPiNGRMn0Ygi9K2X1V78A6NlM20UMQCmb6t+/EQqMn9mHxagfDLHzHVvwnCvBzWE/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757501228; c=relaxed/simple;
	bh=wW4Mk9Etc/ZIMAOPIRilUTH8F/criGnmnjuULWNp3FA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=chi/5WwHFnRvAcyKGYyDt/KFHr+GUhc9orePUvCx2az8i9wfXHVD3lZpmcZAwdNMxxKzOK4oXhI5DqlFpFcQ+jiVepGk/u2jGfueStO4EbRHP1GnSdFYjZLkFIHvduITrUorWc7HYM4w53SHn/0NGvFrxdHtqSfw635QxYDIp6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s6kZZ0lv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5B95C4CEF0;
	Wed, 10 Sep 2025 10:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757501227;
	bh=wW4Mk9Etc/ZIMAOPIRilUTH8F/criGnmnjuULWNp3FA=;
	h=From:To:Cc:Subject:Date:From;
	b=s6kZZ0lvvqtdGowC6EprdNCAlnEUCz0QAgErP6S5vZTQLwn11Tq2rxmF9Ni0Sq9M5
	 7GrAzpby2ITQHaNqBB0rPGjIcBtQNVWAD5cbuUh92+HHPkp+10DedYJPs+I/8MokDe
	 lvPE2KE4/evslEmrNju4s4TcgfZ0TxivkL5Nef73JD+DRaoej/djFTi/c9wzyqhXE8
	 6B4QFOW/djtxqnFjT+YQJTKWEUnJr52T8yJMSRlVtYSw2sD2hsleYIu+eicYuQDgO4
	 zR9Ff/RRlDxL52DBbe24cn079NZQWNe51O8wUu8yCzBhtDTc+oHq3oapHMvi6Fhlbi
	 5E2xZc8ALZQ4Q==
From: Hans de Goede <hansg@kernel.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Aleksandrs Vinarskis <alex@vinarskis.com>,
	platform-driver-x86@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH v2 0/1] v4l2-subdev/int3472: Use "privacy" as con_id for the LED lookup
Date: Wed, 10 Sep 2025 12:47:01 +0200
Message-ID: <20250910104702.7470-1-hansg@kernel.org>
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

Changes in v2:
- Squash the changes into a single patch changing both places where
  "privacy-led" is used to "privacy" in one go

Ilpo can you give your ack for this patch getting merged through
the linux-media tree?

Regards,

Hans



Hans de Goede (1):
  media: v4l2-subdev / pdx86: int3472: Use "privacy" as con_id for the
    privacy LED

 drivers/media/v4l2-core/v4l2-subdev.c    | 2 +-
 drivers/platform/x86/intel/int3472/led.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.51.0


