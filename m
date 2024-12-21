Return-Path: <linux-media+bounces-23978-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 887C69FA0C6
	for <lists+linux-media@lfdr.de>; Sat, 21 Dec 2024 14:20:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D9AE188D7CE
	for <lists+linux-media@lfdr.de>; Sat, 21 Dec 2024 13:20:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CC161F4E3B;
	Sat, 21 Dec 2024 13:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tTFNfN+m"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7544C1F0E3F;
	Sat, 21 Dec 2024 13:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734787220; cv=none; b=qlCBvgqPWfjj0VHL4BqOq2kuqOq+j7KuxsVVAPZP57pA5iRZEBCdlfybVeB0zi9YU9oi4+BGvW1QR8cHb6nZIucXYeQl1U2IHkpr5T1xAAY5bAvHKyOv8IW0Bx6LQfow9+1F5u8uOu2cSYenCjE8CdwouWsOHNa2Dhe1VPWbCBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734787220; c=relaxed/simple;
	bh=MxLu8r10iCr9LSm5i29qcvododEipLsUogw/NoF+peA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=tgAsQNOjwSTsYwmFWiMSS6d1h/mXeCzT16uEe5ZpxjyDlHZDabUlfPvWPGdVFzJJRQ1AkbAef8WsRiKsvFswfDvbspsOT8BHvFPpV9LiYgwakgb9mpnjeVs8aBIwRU5Xw5EGyslia8xXJFVDxQE5RN577FOsjx9pqQBF4bD5Qi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tTFNfN+m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76941C4CECE;
	Sat, 21 Dec 2024 13:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734787216;
	bh=MxLu8r10iCr9LSm5i29qcvododEipLsUogw/NoF+peA=;
	h=Date:From:To:Cc:Subject:From;
	b=tTFNfN+mU02zDC48SGMv1GL8gDfcYRfsmacVnh03IJDGKgcM78H6UCACz4aglyh7n
	 FFI0nHgTVpufmyFIWZLYcL9iWkrTRjUTxmL7dos0Z7aboJX1dggSWJx1qe3JGYjbA+
	 UrvKtgQjPFwsTjsKlLxVviH2q1zHmy91rpezOIU3ON9x6VmjweOpx+zuAjya919mOY
	 S4k3072ytqLBYQ8ivHqGqMmLVN29X3Mz+EIqNtG2quB4giNR+puKLNCAton5qBRj4u
	 eEo41dvFA/lkt+ViR0uTTQ3dq5Y+E7a9N3axFE7ggqDh5MlaQqhEQQneTcDlsO0/wm
	 Rg99CSGAYm9EA==
Date: Sat, 21 Dec 2024 14:20:12 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton
 <akpm@linux-foundation.org>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Sebastian Fricke
 <sebastian.fricke@collabora.com>
Subject: [GIT PULL for v6.13-rc4] media fixes
Message-ID: <20241221142012.3f43a036@foz.lan>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Linus,

Please pull from:
  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git tags/media/v6.13-3

For:
  - a clang build issue with mediatec vcodec:
  - a fix at dib3000mb write function missing data init

Regards,
Mauro

---


The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git tags/media/v6.13-3

for you to fetch changes up to 8b55f8818900c99dd4f55a59a103f5b29e41eb2c:

  media: mediatek: vcodec: mark vdec_vp9_slice_map_counts_eob_coef noinline (2024-12-13 17:51:35 +0100)

----------------------------------------------------------------
[GIT PULL for 6.13-rc4] media fixes

----------------------------------------------------------------
Arnd Bergmann (1):
      media: mediatek: vcodec: mark vdec_vp9_slice_map_counts_eob_coef noinline

Nikita Zhandarovich (1):
      media: dvb-frontends: dib3000mb: fix uninit-value in dib3000_write_reg

 drivers/media/dvb-frontends/dib3000mb.c                                | 2 +-
 .../media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c  | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

