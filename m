Return-Path: <linux-media+bounces-16348-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A83953682
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2024 17:02:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 07ABCB24E11
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2024 15:02:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E6381A7060;
	Thu, 15 Aug 2024 15:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i0rd/21J"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB15F19DF9C;
	Thu, 15 Aug 2024 15:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723734159; cv=none; b=RlxkBtMAeIxscwGqSwWViI8OpqOSK8X/pIpgj/7VNpkwUoQ45vksdkacmzID7qduTooTX+hthYsA3BP55eOjI4jtDCVXehLOGSIUblsKnXMrjwFWEQ8gi8FjvMie4VJRCzGgk8/rYOBzrYHj7g6aNZ6rlH2mC2qFvIhd7n0G5kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723734159; c=relaxed/simple;
	bh=Qi1DjTq9vVDqCeRuFOoVg6IgfHpg4V/a9iumQ8zlP8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=P2ZDHdAd27+C/gZuaZXgwH/hfhxEH4LhGKOffn3ZA6enmxKrAsz4B2aQL0d00hQzeqJyewHRkfzZ3228B5O0P/39BOJ+u96DH50FwuUPpPk8IZDrRb+c/t55ZROO5/m5sEPiYAM4SRrcHQ5P26K6GIkYYdop9aSVSTWcbiYfLvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i0rd/21J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E98BC32786;
	Thu, 15 Aug 2024 15:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723734159;
	bh=Qi1DjTq9vVDqCeRuFOoVg6IgfHpg4V/a9iumQ8zlP8Y=;
	h=Date:From:To:Cc:Subject:From;
	b=i0rd/21JE4X8c7Jb8hhTRiOvMzR86hBZMaB8M1FS7v8xZS7QdqYg1ZJWs3mLvnroT
	 18lgaQ81+yaOcHLj5XXVkBXVwW11SU/SoxNZ8c2//iSpo3v827mIo3VhjCT9XWRxXN
	 i7RW0bXrk93hc7nBt2vI+rhs/WeKplvC8o6gFE+r6rqGq3cHhYtSlGB7PckvmPL/4Y
	 bHOQ9fDof5EgSR7JIrbdYA6VPVl+hLtYa+7yT2t2/sfDgGJOOIGLA2Ryt60OeDM7VX
	 Py3D9iPAivtgHi91K9iqhuOCXGJi5Zo9c0FqiAudoQ2CakuYcafIuzKPaCcNWM3BuC
	 EuhLxaPxP/OOQ==
Date: Thu, 15 Aug 2024 17:02:35 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton
 <akpm@linux-foundation.org>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: [GIT PULL for v6.11-rc4] media fixes
Message-ID: <20240815170235.0ab77b44@foz.lan>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Linus,

Please pull from:
  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v6.11-3

For two regression fixes:
- fix atomisp support for ISP2400;
- fix dvb-usb regression for TeVii s480 dual DVB-S2 S660 board.

Regards,
Mauro

---


The following changes since commit e2ed53694e5356a55fd539a4d8dc56c2fa42b2ff:

  Merge tag 'tags/fixes-media-uvc-20230722' of git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git (2024-08-03 11:01:04 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v6.11-3

for you to fetch changes up to 63de936b513f7a9ce559194d3269ac291f4f4662:

  media: atomisp: Fix streaming no longer working on BYT / ISP2400 devices (2024-08-14 08:06:07 +0200)

----------------------------------------------------------------
media fixes for v6.11-rc4

----------------------------------------------------------------
Hans de Goede (1):
      media: atomisp: Fix streaming no longer working on BYT / ISP2400 devices

Sean Young (1):
      media: Revert "media: dvb-usb: Fix unexpected infinite loop in dvb_usb_read_remote_control()"

 drivers/media/usb/dvb-usb/dvb-usb-init.c           | 35 +++-------------------
 .../media/atomisp/pci/ia_css_stream_public.h       |  8 +++--
 .../staging/media/atomisp/pci/sh_css_internal.h    | 19 ++++++++++--
 3 files changed, 26 insertions(+), 36 deletions(-)


