Return-Path: <linux-media+bounces-14567-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A47925395
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2024 08:23:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 001E4B229DB
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2024 06:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA294130496;
	Wed,  3 Jul 2024 06:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PQiebCqZ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439E31DA32B;
	Wed,  3 Jul 2024 06:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719987814; cv=none; b=ZlEf4roZEwQhmu6+FHdDdJN2yQdLl25DlKMqaZeQatAjag//qpOk1PtzmsBl+WLH5hRzx2Dzfnj9s7evYC90lC33He0YLPcRRSFtko1H9xzx53tk4r6pc7F/JWyAoFwKKKCYomn/md2Y9pMyIRiSRykTsikC3P/RSln4QEUgQpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719987814; c=relaxed/simple;
	bh=NOPpPrTT+XA1IWATtadthssEOsqUiYP+j/C0vhzv8g0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=CHaUIz3YchxU5nH9G1OKFEsJcUBv2efWFDef8jHlyNcI8Sb6Ogc8humtu/MlYWH6iegHidmT7HTpl3w5h2+mwP20g/QNhjRr0+esMDG+oDMRjHvCfE+9ekbj8lW3YLpTaPQIRBtCf0fiWdPPaaiaW7aenfpzOHQaRNc/MJqLfKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PQiebCqZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E554C32781;
	Wed,  3 Jul 2024 06:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719987813;
	bh=NOPpPrTT+XA1IWATtadthssEOsqUiYP+j/C0vhzv8g0=;
	h=Date:From:To:Cc:Subject:From;
	b=PQiebCqZnsPczUBd4x+hV5DJom1qOM5cp3+GmcTuKX5MXwpoENRZqrySFcQJ4BrOL
	 Rrd3ROUE6esrQn2WSHKEYhklfM4ITlTEER3+2BqQjqGG8SWv012OSB58F5zJIQglED
	 DaBXOOvArNt16+sBo2K64H/t4vwfPsQRbRtUSNeAOEGxwE5r5iEneu2zjRm88gRmzZ
	 /iGfL6nU11Tf/1bDYmp+DB9qq6hOucbl9GqA6Xfh6v+SgnUcjdeJHV1WZOjjuYDvBd
	 6QuOekWJP1w9O3nMSYU7R2X4l6YEsfwo1R0s5fH+cBIHH9IulF2Bu8PD2d6SkX/47O
	 7rGDZgH6BSnZA==
Date: Wed, 3 Jul 2024 08:23:29 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton
 <akpm@linux-foundation.org>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: [GIT PULL for v6.10-rc7] media fixes
Message-ID: <20240703082329.20b1bc37@coco.lan>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
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
  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v6.10-3


For some fixes related to the IPU6 driver.

Regards,
Mauro

The following changes since commit 83a7eefedc9b56fe7bfeff13b6c7356688ffa670:

  Linux 6.10-rc3 (2024-06-09 14:19:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v6.10-3

for you to fetch changes up to fd404435d44b453d62afe77545b9252c2cc72c8a:

  media: ivsc: Depend on IPU_BRIDGE or not IPU_BRIDGE (2024-06-15 11:51:23 +0200)

----------------------------------------------------------------
media fixes for v6.10-rc7

----------------------------------------------------------------
Hao Ge (1):
      media: intel/ipu6: Fix a null pointer dereference in ipu6_isys_query_stream_by_source

Sakari Ailus (2):
      media: ipu6: Use the ISYS auxdev device as the V4L2 device's device
      media: ivsc: Depend on IPU_BRIDGE or not IPU_BRIDGE

 drivers/media/pci/intel/ipu6/ipu6-isys-video.c | 2 +-
 drivers/media/pci/intel/ipu6/ipu6-isys.c       | 2 +-
 drivers/media/pci/intel/ivsc/Kconfig           | 1 +
 3 files changed, 3 insertions(+), 2 deletions(-)


