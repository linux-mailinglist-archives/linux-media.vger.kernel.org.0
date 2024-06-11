Return-Path: <linux-media+bounces-12961-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA1B90409B
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 17:56:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 869001F24D0D
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 15:56:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3DB240861;
	Tue, 11 Jun 2024 15:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="VF8MKQiG"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBFE3FBB3
	for <linux-media@vger.kernel.org>; Tue, 11 Jun 2024 15:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718121333; cv=none; b=qFdLpR4k0L/5zDB6dB6j7czIMlWm2+BSIeiWdWfjN+aah/7kma5vNoSgf/5HW+Jq53ucP5bTMdqLIq2eJyoGry4fsnUlOhWjuNNnweJpMrxMLUIOYo2NlQjAczzrjBQDVZOU2WnGNR/25FgHGsGt2/ncqwy6v/RhGzfnQguWvSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718121333; c=relaxed/simple;
	bh=95ZrQR9jLOcOhb8Tsw6b9E1PJ68Rvld03nwYIkq1zDo=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AyYPOiMeI7f28EM/V1NzFmBEA2HQmlQ8fnC9gY4NrzcPxbB8NDKOCssRqR6TYOw+zSemrHglL9IWanxW8rWU7H1P9Dgw4vZp47ocweqnVDN14ERKdI1kZe2XZpJ8Ig0cDaNBULH6DKSlJ3jTskvEPir7SHCsjKdFo3qwPADqL0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=VF8MKQiG; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718121330;
	bh=95ZrQR9jLOcOhb8Tsw6b9E1PJ68Rvld03nwYIkq1zDo=;
	h=Date:From:To:Subject:From;
	b=VF8MKQiGG0RkmXGvlBs1pG9pD9piRHNI2ELZXFbQRvB+CtJenP2cl61aWuwa3+qdM
	 P4T/HT8/DfmFDs5kba2E7uj5YMa7SFFwpOfF2Qda9hKki979fEbq0x6WmV2bgKYVJF
	 UhpU7+rj1zMbD2peJ4ZLbylwkuCABjn/NZtiK1q3N0Ptkf6h7CQDOneBQ2rpSRXz4A
	 AyuuejDgJgqi5iUUEomybiNIefrpj1jdFricrvBDuvIC0osT8UeC8EkykJfk18ijWZ
	 LWvnFjZGUWnGGL8D8ZasVr5aT8FGYLR1eSpcMJwqdLARPx4yOx9kLQm7czeb7ScaAe
	 R+tayiTzLdAPQ==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sebastianfricke)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id CEE4E37811D1
	for <linux-media@vger.kernel.org>; Tue, 11 Jun 2024 15:55:29 +0000 (UTC)
Date: Tue, 11 Jun 2024 17:55:28 +0200
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: linux-media@vger.kernel.org
Subject: [GIT PULL FOR 6.11] Imagination E5010 JPEG encoder
Message-ID: <20240611155528.mqmekz42cgs6jpdi@basti-XPS-13-9310>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline

Hey Hans & Mauro,

Doesn't include the math changes and
https://patchwork.linuxtv.org/project/linux-media/patch/20240607133253.3559339-1-devarsht@ti.com/
has to be taken separately, as discussed here:
https://patchwork.linuxtv.org/project/linux-media/patch/20240604105335.2257629-1-devarsht@ti.com/#158409

Please pull.

The following changes since commit 1034ead1a7333e65e516c583f757717f461eba43:

   media: amphion: Report the average QP of current encoded frame (2024-06-10 10:24:30 +0200)

are available in the Git repository at:

   https://gitlab.collabora.com/sebastianfricke/linux.git tags/for-6.11-e5010-jpeg-encoder

for you to fetch changes up to 78459ad3a98ff2a28ead2d8d750e2ef3d27d1acc:

   media: verisilicon : Use exported tables from v4l2-jpeg for hantro codec (2024-06-11 17:39:43 +0200)

----------------------------------------------------------------
Imagination E5010 JPEG encoder

----------------------------------------------------------------
Devarsh Thakkar (6):
       media: dt-bindings: Add Imagination E5010 JPEG Encoder
       media: imagination: Add E5010 JPEG Encoder driver
       media: v4l2-jpeg: Export reference quantization and huffman tables
       media: Documentation: Document v4l2-jpeg helper functions
       media: imagination: Use exported tables from v4l2-jpeg core
       media: verisilicon : Use exported tables from v4l2-jpeg for hantro codec

  .../bindings/media/img,e5010-jpeg-enc.yaml         |   75 +
  Documentation/driver-api/media/v4l2-core.rst       |    1 +
  Documentation/driver-api/media/v4l2-jpeg.rst       |   10 +
  MAINTAINERS                                        |    7 +
  drivers/media/platform/Kconfig                     |    1 +
  drivers/media/platform/Makefile                    |    1 +
  drivers/media/platform/imagination/Kconfig         |   13 +
  drivers/media/platform/imagination/Makefile        |    3 +
  .../media/platform/imagination/e5010-core-regs.h   |  585 +++++++
  .../media/platform/imagination/e5010-jpeg-enc-hw.c |  267 ++++
  .../media/platform/imagination/e5010-jpeg-enc-hw.h |   42 +
  .../media/platform/imagination/e5010-jpeg-enc.c    | 1641 ++++++++++++++++++++
  .../media/platform/imagination/e5010-jpeg-enc.h    |  168 ++
  .../media/platform/imagination/e5010-mmu-regs.h    |  311 ++++
  drivers/media/platform/verisilicon/Kconfig         |    1 +
  drivers/media/platform/verisilicon/hantro_jpeg.c   |  128 +-
  drivers/media/v4l2-core/v4l2-jpeg.c                |  162 +-
  include/media/v4l2-jpeg.h                          |   28 +
  18 files changed, 3329 insertions(+), 115 deletions(-)
  create mode 100644 Documentation/devicetree/bindings/media/img,e5010-jpeg-enc.yaml
  create mode 100644 Documentation/driver-api/media/v4l2-jpeg.rst
  create mode 100644 drivers/media/platform/imagination/Kconfig
  create mode 100644 drivers/media/platform/imagination/Makefile
  create mode 100644 drivers/media/platform/imagination/e5010-core-regs.h
  create mode 100644 drivers/media/platform/imagination/e5010-jpeg-enc-hw.c
  create mode 100644 drivers/media/platform/imagination/e5010-jpeg-enc-hw.h
  create mode 100644 drivers/media/platform/imagination/e5010-jpeg-enc.c
  create mode 100644 drivers/media/platform/imagination/e5010-jpeg-enc.h
  create mode 100644 drivers/media/platform/imagination/e5010-mmu-regs.h

