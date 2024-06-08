Return-Path: <linux-media+bounces-12775-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 32426901259
	for <lists+linux-media@lfdr.de>; Sat,  8 Jun 2024 17:36:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51C751C20E1D
	for <lists+linux-media@lfdr.de>; Sat,  8 Jun 2024 15:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8406917967F;
	Sat,  8 Jun 2024 15:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O6anO2Yz"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFCE4524C4;
	Sat,  8 Jun 2024 15:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717860994; cv=none; b=TW4ode8+UrWMESZE6hGmRPRzUchW7pwxh8sqnJYCNt8tRHAAgS+i3BP7f7W5/6GDf+QdhPDgrGE/N/SR9D3i9WtiTG7Tw72ioJFiciBOk86XlRdRgV3p2Ye0JioPplBmgVOSoVYEScbQR030NG4DbsXac7LPWkN/2iIJxjXr2kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717860994; c=relaxed/simple;
	bh=PPltt7u92wnv+PxGs+e4EpDvJsH07LVd0WQfhfe5Un8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=MWpN0r2fPQXuqyEkXwAe1H7bWtxZsrBy+LA19mbeG8P2csDqaB15n3QmyAqMiBiprnIbda00idBZ4SEjk39SCJnxFXNt0rvxhB/JzFMf/5MQekNAQ8QCY5GQamDGE5XNSd8LnN4UIn9ZB9obyBk95JqeIXV3xXa9XYE0okcsDTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O6anO2Yz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24D72C2BD11;
	Sat,  8 Jun 2024 15:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717860993;
	bh=PPltt7u92wnv+PxGs+e4EpDvJsH07LVd0WQfhfe5Un8=;
	h=Date:From:To:Cc:Subject:From;
	b=O6anO2YzaaT7ptr+nugSZ/acFRti3oxWsLMR7/hRcp62tul7sVoJlGaqfvvYcYMsF
	 UiNm5lQnoajnMnltwyXA0aH0ES03sqQJb20UJ4UiF41ecnN+VzUIHF8nlHxdsSn3RJ
	 h7yxddSv1uE5Z9qd7pwtWRU1Moco/mHTh8zr9ZJu7mcPieomqKWhQXZKv8gNmEtXSl
	 Gkw3KZ7qhXShfFGE+5r3+XX2JR2X/6/suB4c5Joa6JMJO0IBA06G3JmsG0o08H8MK5
	 5Q9TU73DyH3bNhD0y0HYabAxn8GA3LfA6vpmR/A/oI8S9tF5AvqT4AX1wMfR6dr8+h
	 RbLXAjprBj0kg==
Date: Sat, 8 Jun 2024 17:36:28 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton
 <akpm@linux-foundation.org>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: [GIT PULL for v6.10-rc3] media fixes
Message-ID: <20240608173628.05f15fbc@coco.lan>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Please pull from:
  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/me=
dia/v6.10-2


For:
  - some fixes at the new ipu6 driver (and related fixes at mei csi driver);
  - fix a double debugfs remove logic at mgb4 driver;
  - a documentation fix.

Regards,
Mauro

---

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/me=
dia/v6.10-2

for you to fetch changes up to ffb9072bce200a4d004006e8b40c366933cf517b:

  media: intel/ipu6: add csi2 port sanity check in notifier bound (2024-05-=
30 16:34:59 +0200)

----------------------------------------------------------------
media fixes for v6.10-rc3

----------------------------------------------------------------
Bingbu Cao (3):
      media: intel/ipu6: fix the buffer flags caused by wrong parentheses
      media: intel/ipu6: update the maximum supported csi2 port number to 6
      media: intel/ipu6: add csi2 port sanity check in notifier bound

Christophe JAILLET (3):
      media: intel/ipu6: Fix some redundant resources freeing in ipu6_pci_r=
emove()
      media: intel/ipu6: Move isys_remove() close to isys_probe()
      media: intel/ipu6: Fix an error handling path in isys_probe()

Martin T=C5=AFma (1):
      media: mgb4: Fix double debugfs remove

Sakari Ailus (3):
      media: Documentation: v4l: Fix ACTIVE route flag
      media: mei: csi: Put the IPU device reference
      media: mei: csi: Warn less verbosely of a missing device fwnode

 .../userspace-api/media/v4l/dev-subdev.rst         |  2 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c     |  6 +-
 drivers/media/pci/intel/ipu6/ipu6-isys.c           | 71 +++++++++++++-----=
----
 drivers/media/pci/intel/ipu6/ipu6.c                |  5 +-
 drivers/media/pci/intel/ivsc/mei_csi.c             |  5 +-
 drivers/media/pci/mgb4/mgb4_core.c                 |  7 ++-
 6 files changed, 56 insertions(+), 40 deletions(-)


