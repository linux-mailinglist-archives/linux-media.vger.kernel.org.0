Return-Path: <linux-media+bounces-13966-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AC3913409
	for <lists+linux-media@lfdr.de>; Sat, 22 Jun 2024 14:49:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3B052B210B4
	for <lists+linux-media@lfdr.de>; Sat, 22 Jun 2024 12:49:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16B1616EB6F;
	Sat, 22 Jun 2024 12:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="MuMWq+Td"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9CE15217E
	for <linux-media@vger.kernel.org>; Sat, 22 Jun 2024 12:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719060563; cv=none; b=H7NcTp+UP+T9wWL3TNzdIxzmJB4EFItepUGfMrje1EEVafG1SXcD+IiOlJSmZ5IgdhBjAm3Q2kvmHba5ngDlBCO0zVloov0wl05gj3Y6B799LHb4E1kqAwQSRMPvjVvw4NhXKUfqP1HrbdTX1rbSt09XEX8pJkzZg7F/hHHwk3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719060563; c=relaxed/simple;
	bh=yVaz8YkYuJdwqelrnG7+gZaR+ik/Hx9ape+zXJQkwRM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dOqPAy2je0iuJQbz7nMf4uJI1qm8lpYkKgdG/Zu59ig41nRr5GOO1cw6GpYzNRfc6SUGiZmieRG0wODej0g5mR7YuKJ7HUwwSVXlZO36QdgSV0TMnTHOT8y8BeV4r3Y7rkZJdDT1jHa/uB4dRw2wxA/Xzk9Uehu50SZ6+5BKmmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=MuMWq+Td; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1719060560;
	bh=yVaz8YkYuJdwqelrnG7+gZaR+ik/Hx9ape+zXJQkwRM=;
	h=Date:From:To:Subject:From;
	b=MuMWq+Tdrh0tql/TBMPB6miKhRXUFYBd1d7AZxvVoLHN5KogJhtPe4IGva6hrUZVF
	 4ZhHNzo12SpdAAwzMmfef3WsSDauoDg1I22lNKho9vF/L6AiJpIUxkSBDy/8EHg5Al
	 GakpjjfoDZmJrF68WKS6l86jdVeOQxUQShS9Gf0foNwcHqma3gSukRK9dFi4ExxbOi
	 XaKt7/EgI6f08V+dgzdlA2CBc5BwFY6ERz86J5LjxyPrYIOgLcf4x9He83VprnYzlL
	 2K01BLv5iYb4bUB7zrwSS3QIUE1UbybgbraPTzNsZlFTiL4pGvbDlMJNbLjdBpl02r
	 QlVEXp0VdI6YQ==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sebastianfricke)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id C924C3782163
	for <linux-media@vger.kernel.org>; Sat, 22 Jun 2024 12:49:19 +0000 (UTC)
Date: Sat, 22 Jun 2024 14:49:18 +0200
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: linux-media@vger.kernel.org
Subject: [GIT PULL FOR 6.11] Imagination E5010 JPEG encoder
Message-ID: <20240622124918.nmgqehtrunci4i6s@basti-XPS-13-9310>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline

Hey Hans & Mauro,

please pull.

The following changes since commit 6aa082910445aec6b1dc652a69c5178a555d8ca5:

   media: chips-media: wave5: support Wave515 decoder (2024-06-21 10:15:21 +0200)

are available in the Git repository at:

   https://gitlab.collabora.com/sebastianfricke/linux.git tags/for-6.11-e5010-jpeg-encoder_2

for you to fetch changes up to 0f32af528cb0971a2917c0fe16a58fc672dde904:

   media: verisilicon : Use exported tables from v4l2-jpeg for hantro codec (2024-06-22 10:53:59 +0200)

----------------------------------------------------------------
E5010 JPEG encoder

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
  .../media/platform/imagination/e5010-jpeg-enc.c    | 1632 ++++++++++++++++++++
  .../media/platform/imagination/e5010-jpeg-enc.h    |  168 ++
  .../media/platform/imagination/e5010-mmu-regs.h    |  311 ++++
  drivers/media/platform/verisilicon/Kconfig         |    1 +
  drivers/media/platform/verisilicon/hantro_jpeg.c   |  129 +-
  drivers/media/v4l2-core/v4l2-jpeg.c                |  116 ++
  include/media/v4l2-jpeg.h                          |   32 +
  18 files changed, 3278 insertions(+), 116 deletions(-)
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

