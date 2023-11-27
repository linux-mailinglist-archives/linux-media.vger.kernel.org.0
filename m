Return-Path: <linux-media+bounces-1166-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 947EB7FA7A5
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 18:10:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 35B5FB20DED
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 17:10:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A27A3714E;
	Mon, 27 Nov 2023 17:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EbLnZsQE"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914D736AE7
	for <linux-media@vger.kernel.org>; Mon, 27 Nov 2023 17:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D66DAC433C7;
	Mon, 27 Nov 2023 17:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701105019;
	bh=4pNVkXsiUaBtYFLdxjUUYPf4B8uYbv15Pz+1txLQMn4=;
	h=Date:From:To:Cc:Subject:From;
	b=EbLnZsQE2pr2I9TdOPXxdV/+Tzcz4G3Y8yrmEiUyuSMyM3OH2HnOETakq8wXyxR2K
	 mt32ZuiJWhHqnqhNpwFPEju9ePfsHb8Gbf+COIyK9vzRkw60ZVorsf8L7Jtn307weO
	 G6oDahmMQidYS0UL3CJHWdfvIW3lJqDE6ajDVejyYNBXiKcLd2rBCD99bzmPPSOkKD
	 Vos2bk/3BpJVARfWj/ftsE8lm8DvsAI74xYlu3geIugdRPSEd7PS4dr/hMDatITxoW
	 3oC3smZZExjhnmRknEJx+xA3MG1Vy78F6GT1iHxp5BBE26P42v3MO3yPOc7UaC/Ob2
	 31EB9Xz7TUWaA==
Date: Mon, 27 Nov 2023 18:10:13 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton
 <akpm@linux-foundation.org>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: [GIT PULL for v6.7-rc3] media fixes
Message-ID: <20231127181013.7fdc3484@coco.lan>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/me=
dia/v6.7-2

for you to fetch changes up to 32138be394e5d32c095a413949e6ab4875b2aec0:

  Merge tag 'media-renesas-fixes-20231113' of git://git.kernel.org/pub/scm/=
linux/kernel/git/pinchartl/linux.git (2023-11-16 14:28:44 +0100)

----------------------------------------------------------------
media fixes for v6.7-rc3

----------------------------------------------------------------
Arnd Bergmann (1):
      media: pci: mgb4: add COMMON_CLK dependency

Dan Carpenter (1):
      media: v4l2-subdev: Fix a 64bit bug

Hans Verkuil (1):
      Merge tag 'media-renesas-fixes-20231113' of git://git.kernel.org/pub/=
scm/linux/kernel/git/pinchartl/linux.git

Laurent Pinchart (1):
      media: vsp1: Remove unbalanced .s_stream(0) calls

Martin T=C5=AFma (1):
      media: mgb4: Added support for T200 card variant

 drivers/media/pci/mgb4/Kconfig                  |  1 +
 drivers/media/pci/mgb4/mgb4_core.c              | 20 ++++++++++++-----
 drivers/media/platform/renesas/vsp1/vsp1_pipe.c |  2 +-
 drivers/media/platform/renesas/vsp1/vsp1_rpf.c  | 10 +--------
 drivers/media/platform/renesas/vsp1/vsp1_rwpf.c |  8 +++++--
 drivers/media/platform/renesas/vsp1/vsp1_rwpf.h |  4 +++-
 drivers/media/platform/renesas/vsp1/vsp1_wpf.c  | 29 +++------------------=
----
 include/uapi/linux/v4l2-subdev.h                |  2 +-
 8 files changed, 31 insertions(+), 45 deletions(-)


