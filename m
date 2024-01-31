Return-Path: <linux-media+bounces-4509-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A27843EE8
	for <lists+linux-media@lfdr.de>; Wed, 31 Jan 2024 12:57:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF1FD1C222DF
	for <lists+linux-media@lfdr.de>; Wed, 31 Jan 2024 11:57:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 235827690F;
	Wed, 31 Jan 2024 11:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="U2J/zhKQ"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26E469E08
	for <linux-media@vger.kernel.org>; Wed, 31 Jan 2024 11:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706702230; cv=none; b=b9VBYZPscXKI+7FzSf/GD93QOAuMgJsECM+mEmyCwpFkjC9VafK8Fe5Ib3s3ISHdN1QHselEUQM8yDr93zWdEG9C5DrjwCxITb1U9futpePmKwjymzUr2gn9c9H3zeW/4j2EVvDWrXoMSihkX68kFRybRo2NDiR3Kgv7JJcQ/ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706702230; c=relaxed/simple;
	bh=cP69MkNuZr0cJWXTN1g0dBET+iwkWdQHvdhDPqk+mWY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nUcAd6rZtzF+2pILBCFHlBwimhHvYiT6V8yfqzOh466Y8X5vbAqIATNWC/fitTEr489aNtHLU8u9azbbzRY1DuZjEc/6Zgc9uUFPk9FppEGY5Zav+q6ANxn/dB0t+JWcwOpML3FzBx2b+6+q0ro8silAWgyINYHRY+NANitEYd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=U2J/zhKQ; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1706702220; bh=cP69MkNuZr0cJWXTN1g0dBET+iwkWdQHvdhDPqk+mWY=;
	h=Date:From:To:Subject:From;
	b=U2J/zhKQRKreVReD0f8ml9O5AdLWHbEqU7DefACcukdaeRQEm7Y2fJIRogeZPum1N
	 zZL4+jZyHlBJPbxZxG/AtBPcSt4FhFsRgS9m5nt9nLKTSWlrNK/FqrDdk2gMR5Znmw
	 WJIt8OfZG8T5KD0odYNvfJT0kCk0W/ZpZVT5C8ujrhFaxNF8GmyPLcGjsK78Nq+PHH
	 deHrudJqpYzieg1n7XTIyGSqilkVw4PgrhwAQC6nKwEw+Lop4Q2TiKc2hpK+NtCkup
	 UurDgsIzrEGL6/UhTVuMGr+y5PCVqocEiaj6ZTc0Oytt3iiXhLxbVV5Zasq9SK5EKC
	 h65Vfc813LF4A==
Received: by gofer.mess.org (Postfix, from userid 1000)
	id 2AF461000FA; Wed, 31 Jan 2024 11:57:00 +0000 (GMT)
Date: Wed, 31 Jan 2024 11:57:00 +0000
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org
Subject: [GIT PULL FOR v6.9] rc fixes
Message-ID: <Zbo1jDcilSELSntC@gofer.mess.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hans, Mauro,

A few simple fixes for rc core.

Please pull

The following changes since commit c8282f7b8523a4d37e5fefa220d93f2be06650e2:

  Merge tag 'v6.8-rc2' (2024-01-29 08:59:23 +0100)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v6.9a

for you to fetch changes up to e2a698a0023fd8bb22b76ab9517265be34ea34f3:

  media: pwm-ir-tx: Depend on CONFIG_HIGH_RES_TIMERS (2024-01-31 11:52:44 +0000)

----------------------------------------------------------------
v6.9a

----------------------------------------------------------------
Sean Young (2):
      media: rc: bpf attach/detach requires write permission
      media: pwm-ir-tx: Depend on CONFIG_HIGH_RES_TIMERS

Zhipeng Lu (1):
      media: ir_toy: fix a memleak in irtoy_tx

 drivers/media/rc/Kconfig        | 1 +
 drivers/media/rc/bpf-lirc.c     | 6 +++---
 drivers/media/rc/ir_toy.c       | 2 ++
 drivers/media/rc/lirc_dev.c     | 5 ++++-
 drivers/media/rc/rc-core-priv.h | 2 +-
 5 files changed, 11 insertions(+), 5 deletions(-)

