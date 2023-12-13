Return-Path: <linux-media+bounces-2297-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B794810C36
	for <lists+linux-media@lfdr.de>; Wed, 13 Dec 2023 09:17:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B74B128171C
	for <lists+linux-media@lfdr.de>; Wed, 13 Dec 2023 08:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E59DD1D69B;
	Wed, 13 Dec 2023 08:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="l5T91vhV"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [IPv6:2a00:1098:ed:100::25])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50B7A8E
	for <linux-media@vger.kernel.org>; Wed, 13 Dec 2023 00:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702455448;
	bh=0NvZHos419I9SAl0RfORGyada4gZQBPLnVlwEiR1jBo=;
	h=Date:From:To:Subject:From;
	b=l5T91vhVQ3IeRQ7BXM2r6EtmU/ejBOH81uEEp/gmNvoI4iImNnJ6odzoNHSN5GdDl
	 6e5gKbVch4eyBvVmLX8G6mvS/UqY40mpqyoiEWT0rUz8pt6aaH/VQna5cVPu7Hv45q
	 wPe+BCTVzizkvDDQEOR3qsh/74yTJV6sAbp5tCQ3YgvGadP83fo6kCvW0zER1yHvjE
	 nDCXYeWA5nlPO9jwACL5wpZFeTu771OLhUOyO8V0Bf+GsBfYfJpK194vBaK9t8vTjO
	 F6sAylNcGVme5XkfyYdDRPb/91AHDKV4I3zSBYKZikS5zX0tKHyjdMd6ZfxtorFMwI
	 ahtcqMcwwus6A==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sebastianfricke)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 72E65378145A
	for <linux-media@vger.kernel.org>; Wed, 13 Dec 2023 08:17:28 +0000 (UTC)
Date: Wed, 13 Dec 2023 09:17:27 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: linux-media@vger.kernel.org
Subject: [GIT PULL FOR 6.8] Wave5 fixes
Message-ID: <20231213081727.ojhf2lztuecwukye@basti-XPS-13-9310>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline

Hey Hans & Mauro,

here are a couple of simple fixes for the recently merged Wave5 driver.

Please pull.

The following changes since commit c2a8653c197d67f8ad563f5417f2e9bcaad913f3:

   media: venus: core: Set up secure memory ranges for SC7280 (2023-12-12 08:54:54 +0100)

are available in the Git repository at:

   https://gitlab.collabora.com/sebastianfricke/linux tags/for-6.8-7.1-signed

for you to fetch changes up to ab924d8a4e153f915b62bcc9660427679dd3d816:

   media: chips-media: wave5: Requires GENERIC_ALLOCATOR (2023-12-13 09:00:18 +0100)

----------------------------------------------------------------
Wave5 Fixes for 6.8

Multiple small fixes found after merging the driver.

----------------------------------------------------------------
Colin Ian King (1):
       media: chips-media: wave5: Fix spelling mistake "bufferur" -> "buffer"

Dan Carpenter (1):
       media: chips-media: wave5: Remove duplicate check

Lukas Bulwahn (1):
       media: MAINTAINERS: Correct file entry in WAVE5 VPU CODEC DRIVER

Mattijs Korpershoek (1):
       media: chips-media: wave5: Fix panic on decoding DECODED_IDX_FLAG_SKIP

Randy Dunlap (1):
       media: chips-media: wave5: Requires GENERIC_ALLOCATOR

  MAINTAINERS                                              | 2 +-
  drivers/media/platform/chips-media/wave5/Kconfig         | 1 +
  drivers/media/platform/chips-media/wave5/wave5-hw.c      | 3 ---
  drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c | 2 +-
  drivers/media/platform/chips-media/wave5/wave5-vpuapi.c  | 2 +-
  5 files changed, 4 insertions(+), 6 deletions(-)

  Greetings,
  Sebastian

