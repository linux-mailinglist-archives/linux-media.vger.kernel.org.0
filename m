Return-Path: <linux-media+bounces-50703-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F71D1FB78
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 16:23:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9B745308B08E
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 15:20:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BA5C3815E5;
	Wed, 14 Jan 2026 15:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O3suYHIO"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD9239527A;
	Wed, 14 Jan 2026 15:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768404039; cv=none; b=jflPDuZTX4j4+F/1vX2bk30eQnd6dC6oYOTn9dqykUqAGcmiosekEM62FV4l2QzSW1LIZqg117ImWlOl9KpPwMVWeZ2HglV2CWohv6VJ/sdc+3kq9Kz6Ltp/SLPmqDMqnQkr44817I9+9HtOXipQYXnUP7Quube6tKlLtOiMV8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768404039; c=relaxed/simple;
	bh=OVl2jM8DWoJkriJoKyIrhjHZeVAyhkf4rDXTyia4IGg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=NRyEdeG+tFvDBHMl+sUy9YLNEmD/4q+Sobp66VLZpyv5cVd13xBHbRwZkTSJ37Wp3SqWTOeOo7qHvC956e3+i7J9XxCLJ9CioYwgkEhEGvsbRkmBKWvuA6GRz8dWoSAs/fYAt/zUn9/hUuVtXdnN/5vZPNAYRySpVVqJDMnCSsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O3suYHIO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B83AC16AAE;
	Wed, 14 Jan 2026 15:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768404038;
	bh=OVl2jM8DWoJkriJoKyIrhjHZeVAyhkf4rDXTyia4IGg=;
	h=Date:From:To:Cc:Subject:From;
	b=O3suYHIOA4GUY/+dTQv3dTNPMoNuUBfw6blbaM1/SKBYnBDWLSptKA4RjfNCJOSuQ
	 jcEY149HFc0VEkLCQPwsMqrGnfmuM6xXxVP1IR+cGSpmukBs/dESRDOh0qtTjhenbM
	 3JMJHsOwHHMHOsdCCJTVWV1UpJmbPMKmhqcjFhKancixF+wEttUehM+/A1RPmaM0ee
	 m9NFSPL2WNs8LFf7mGze9ARljLJmeUeueIIcujHHcpTm5owqVtnJj+I1//eOJaCpbo
	 +ibM4e7WMOclUkuRsmnbVbNsdAxRzkJrkQFVO0+9sOXGyQ+yJk4/NxMju0jRbVgyME
	 soZAqbS+HlbHQ==
Date: Wed, 14 Jan 2026 16:20:34 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton
 <akpm@linux-foundation.org>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: [GIT PULL for v6.19-rc6] media fixes
Message-ID: <20260114162034.0455f17b@foz.lan>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
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
	  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git tags/media/v6.19-3

for:
    - ov02c10: some fixes related to preserving bayer pattern and 
      horizontal control;
    - ipu-bridge: Add quirks for some Dell XPS laptops with inverted sensors;
    - mali-c55: Fix version identifier logic;
    - rzg2l-cru: csi-2: fix RZ/V2H input sizes on some variants.

Regards,
Mauro

---

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git tags/media/v6.19-3

for you to fetch changes up to 69d6c6fc79eb3a8309691250a3b0a9c1870c1f83:

  media: ov02c10: Remove unnecessary hflip and vflip pointers (2026-01-06 09:33:33 +0100)

Hans de Goede (5):
      media: ov02c10: Fix bayer-pattern change after default vflip change
      media: ov02c10: Adjust x-win/y-win when changing flipping to preserve bayer-pattern
      media: ov02c10: Fix the horizontal flip control
      media: ipu-bridge: Add DMI quirk for Dell XPS laptops with upside down sensors
      media: ov02c10: Remove unnecessary hflip and vflip pointers

Jacopo Mondi (4):
      media: Documentation: mali-c55: Use v4l2-isp version identifier
      media: mali-c55: Remove duplicated version check
      media: uapi: mali-c55-config: Remove version identifier
      media: rzg2l-cru: csi-2: Support RZ/V2H input sizes

 .../media/v4l/metafmt-arm-mali-c55.rst             |  2 +-
 drivers/media/i2c/ov02c10.c                        | 28 ++++++---------
 drivers/media/pci/intel/Kconfig                    |  2 +-
 drivers/media/pci/intel/ipu-bridge.c               | 29 +++++++++++++++
 .../media/platform/arm/mali-c55/mali-c55-params.c  |  7 ----
 .../media/platform/renesas/rzg2l-cru/rzg2l-csi2.c  | 41 ++++++++++++++--------
 include/uapi/linux/media/arm/mali-c55-config.h     |  9 -----
 7 files changed, 68 insertions(+), 50 deletions(-)

