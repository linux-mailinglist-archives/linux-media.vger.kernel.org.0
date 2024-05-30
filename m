Return-Path: <linux-media+bounces-12254-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0AB8D4F21
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 17:32:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D084E1F24040
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 15:32:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D82F187562;
	Thu, 30 May 2024 15:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="qiHkBxHL"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7988617624E
	for <linux-media@vger.kernel.org>; Thu, 30 May 2024 15:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717083125; cv=none; b=FpZ7XHg/b51xmR74Dnbt5BoPekR4znQ0JtdT5jeS2WkSUclXm0XxTTvZrACFKSdDt/EwykaGbRT74fZ0FvUPlPCyZljDpIU8MyL24yGQ2qsPqbM0HNcQQy0RGIOjb3Bn4CdMXCDB5H/ne6kHttGdh5Dc1HjqphbIPlpXVoGcRII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717083125; c=relaxed/simple;
	bh=T0qXQBcywKEP18a5u0mHdJ2+YDURG9I5hj1axdekV/k=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=beXEKRaADAeNgcu4AcMmUCPirJ/IGnlq4lBosT0hkmsVlDlT73wr03mOlaCqVH6XfST73jXl5mXTN/svuKZHUyiDrAMDxCTWrFeBsCVfuZZdMjAsl3JG3KoKTx04hRtiWfL+Qd2r90RqhFQODVce0TEsv297kGVrI2mrQMwDs/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=qiHkBxHL; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1717082704; bh=T0qXQBcywKEP18a5u0mHdJ2+YDURG9I5hj1axdekV/k=;
	h=Date:From:To:Subject:From;
	b=qiHkBxHL9XR6JOeimq8acGgolh9SwYvhXCs3kTvNlQ+qKVQDa1WVQkamp9aIVCcpz
	 eaKChMT/l8YHMsewka0Uupdrm8s0ADRynSzj6Eu7zpFnpsV0EyOXAlLE8TpMUwcHhk
	 qvf/439m9WeD3c7xe3n29A+o/v8Iwk97eH3+CmAiPEcpksGyDmq/YaIHg7BBkawmHU
	 uBVKr5pCB3Dpb5ipMq1gHhRM0olmnA+bQ+KoMS+idUtJ/sIDLRODKTaBkO0IaJYH1j
	 g0wp2NWJr2zFsa4yq5gAMN10siCrsfndkCpDsOTDgYzuMrn2HU8KMRHFDpf66ACGPb
	 KRxet42WHpgKA==
Received: by gofer.mess.org (Postfix, from userid 1000)
	id D555D1009EC; Thu, 30 May 2024 16:25:04 +0100 (BST)
Date: Thu, 30 May 2024 16:25:04 +0100
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org
Subject: [GIT PULL FOR v6.11] Small fixes
Message-ID: <ZliaUF6-yARHKqur@gofer.mess.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v6.11a

for you to fetch changes up to b504729d013f309a46487b3a45258f30d45c4a74:

  media: imon: Fix race getting ictx->lock (2024-05-29 17:56:11 +0100)

----------------------------------------------------------------
v6.11a

----------------------------------------------------------------
Ricardo Ribalda (1):
      media: imon: Fix race getting ictx->lock

Sean Young (1):
      media: mceusb: No need for vendor/product ID in name

Zheng Yejian (1):
      media: dvb-usb: Fix unexpected infinite loop in dvb_usb_read_remote_control()

 drivers/media/rc/imon.c                  |  5 +----
 drivers/media/rc/mceusb.c                | 11 ++--------
 drivers/media/usb/dvb-usb/dvb-usb-init.c | 35 ++++++++++++++++++++++++++++----
 3 files changed, 34 insertions(+), 17 deletions(-)

