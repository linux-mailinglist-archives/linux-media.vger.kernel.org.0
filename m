Return-Path: <linux-media+bounces-39812-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD501B24989
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 14:31:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C347A727394
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 12:31:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C93811C84A2;
	Wed, 13 Aug 2025 12:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="QmjBnJNW"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6827439FF3
	for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 12:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755088301; cv=none; b=o2MvCUXzWNqMe2zmEZc5TvW6v+v+ABVDg7dxNGDEBYEno3dIat3BRtXXbWRqZIV9ZaBzr2uwwUYYp6ds0PQLV7su6QzehobASd+oOzUjXvrn7rqEfDAEGc4rD2Gn/IVxhNNAAmCiGhQ5QOJChGWwBTYkRF1evPXa5WcdwDFP1dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755088301; c=relaxed/simple;
	bh=kDCewk4ZLFp9DD7DsNl5qrh6Z9wDa5Eh5Q5NK+uniCs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CoPSWwRcrZUOJLGvMnmii+eaOHrJtKtO1kemMKo8tAtUGAVCdtOOGJ7mkW3xfVZA2jMdE9yPslG/eZaxsbIYesgYTEOgRWS+YQb3+NgZtLz3RiDSBksx7wrS6jRFvBJfcvNn/MwHR22sYSaFOuNytfb2bXhDHGrFuLPKFGbE9LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=QmjBnJNW; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1755088291; bh=kDCewk4ZLFp9DD7DsNl5qrh6Z9wDa5Eh5Q5NK+uniCs=;
	h=Date:From:To:Cc:Subject:From;
	b=QmjBnJNWN6X/8xErPehwJSthIur9Lg4xR/6USLC7ryJ5oCXFTmL5eLA6j9eTCfe9f
	 gZUWK6n145aQMJjZoLpFpn1Xuv6Tq32iDSJXZ8NCkCVJr6z1AZ135Xo2fX8h2G3T0C
	 C1tKZaZlN4Ow9LiMuJQwjwm407DM+z1dH5vTttiRR2np+VAnkECW6LH2TihgsMKO4E
	 8BqEqLbC5vNLA6lN6Vc5V3SFVkLGEi9amUJVzANWmQddXJ6aU59buYNIYrjBhZtXJ4
	 dw033ZYS0CgV2EiPeMgu9wCd9ejyXz4IvYikTsQhUquOCOUDjMUC3qr1qnWonC8S/E
	 taql0NTLSZrYw==
Received: by gofer.mess.org (Postfix, from userid 1000)
	id A97201000D4; Wed, 13 Aug 2025 13:31:31 +0100 (BST)
Date: Wed, 13 Aug 2025 13:31:31 +0100
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org
Cc: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
	Ma Ke <make24@iscas.ac.cn>
Subject: [GIT PULL FOR v6.18] rc core fixes
Message-ID: <aJyFo-ThKP93FpxI@gofer.mess.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hans, Mauro,

Some minor fixes for rc core.

Thanks,

Sean

The following changes since commit 078f1a7eb48eef9b3cb78bcd2254356f3a332358:

  media: staging: Rename second ioctl handlers argument to 'void *priv' (2025-08-13 08:34:02 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/seanyoung tags/v6.18a

for you to fetch changes up to aba3b9ef7dc5993f61d0cb411116ded31d4e1816:

  media: imon: Remove unused defines (2025-08-13 11:15:35 +0100)

----------------------------------------------------------------
v6.18a

----------------------------------------------------------------
Ma Ke (1):
      media: lirc: Fix error handling in lirc_register()

Sean Young (1):
      media: imon: Remove unused defines

Tetsuo Handa (2):
      media: imon: make send_packet() more robust
      media: imon: grab lock earlier in imon_ir_change_protocol()

 drivers/media/rc/imon.c     | 72 +++++++++++++++++++++++++--------------------
 drivers/media/rc/lirc_dev.c |  9 +++---
 2 files changed, 45 insertions(+), 36 deletions(-)

