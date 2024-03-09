Return-Path: <linux-media+bounces-6758-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A100D8771E0
	for <lists+linux-media@lfdr.de>; Sat,  9 Mar 2024 16:15:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5BBCE1F21649
	for <lists+linux-media@lfdr.de>; Sat,  9 Mar 2024 15:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 830F344364;
	Sat,  9 Mar 2024 15:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="GqdYyw6F"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DBA2C853
	for <linux-media@vger.kernel.org>; Sat,  9 Mar 2024 15:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709997332; cv=none; b=MAoE2nAdX+XCc14hXpkkpfioAGAAUpOmptzP8mkTf0tgx4iXYzdvV07gvcQvOCJ435IMIsTTB4qBGUjNpGWuY+HTG4/zf3mUal/LP6bWJSK5NXmc1JhtmNdP7TSKsI1A8U0FNLgfx9cSYrGOeNUq6BF0LM8nestIPcxifuEQz7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709997332; c=relaxed/simple;
	bh=Emx6ojdwuVF9J+umH6hC9sen8fN1D5xWROxjVikzX3k=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CnoShkh+vkHSu2kxgkZ6p3+qsZqKjk/L6uaJmoRupBtG0nIuBqlA/XWeXmBQ5TKj6/AqDyNsJO47uQsnhhAomHAyC4ko/+oAd6UeG5CijTVJXPJriV1ur+Ny4ulnFNlp/DH6RkawNRTcp1EoRVcKIZkMWrER70Qr6ndUhUfFIJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=GqdYyw6F; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709997329;
	bh=Emx6ojdwuVF9J+umH6hC9sen8fN1D5xWROxjVikzX3k=;
	h=Date:From:To:Subject:From;
	b=GqdYyw6FeLqz+3VgVFzMTeCcY1jwEUeRRGy5EuxWGnQQaMYi3bJezFqcbriZ+AnHA
	 MeOcCwVhPCFfu5Y+sX3a4h8qQdLYF8j9F1jf3FasIXtnJzfV2f54ZHgmIMnd5uITBQ
	 f+27YuXcsYCxGOLqzT7OBfaMZgWaVG28PktFLiCDovMnkRZ/60743ZnercmTqPP1Xh
	 7yceUYJ6FCpMwbpFXrqHkgNIOCd/zzRnm8Pli0782XWNFHKL2XVjsSNxyJ9fN12PUW
	 5DSEgua2mQsUZNJzteH8g4dxAfhG68GFnD5IQyaQaThE8u/DMvTBI3BAFPHrffxPMB
	 6w7eKVXIJFqlg==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sebastianfricke)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7FD803781FE9
	for <linux-media@vger.kernel.org>; Sat,  9 Mar 2024 15:15:29 +0000 (UTC)
Date: Sat, 9 Mar 2024 16:15:28 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: linux-media@vger.kernel.org
Subject: [GIT PULL FOR 6.9] Imagination E5010 JPEG encoder
Message-ID: <20240309151528.ayphvdpnj2crvycv@basti-XPS-13-9310>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline

Hey Hans & Mauro,

These patches add support for the Imagination E5010 JPEG encoder.

Please pull.

The following changes since commit b14257abe7057def6127f6fb2f14f9adc8acabdb:

   media: rcar-isp: Disallow unbind of devices (2024-03-07 16:35:13 +0100)

are available in the Git repository at:

   https://gitlab.collabora.com/sebastianfricke/linux.git tags/for-6.9-e5010-jpeg-encoder

for you to fetch changes up to 146a5dc5f8baee4178a1cdfa483aa3c94273ce5e:

   media: imagination: Add E5010 JPEG Encoder driver (2024-03-09 16:10:43 +0100)

----------------------------------------------------------------
Adds support for the E5010-JPEG-encoder

----------------------------------------------------------------
Devarsh Thakkar (3):
       media: dt-bindings: Add Imagination E5010 JPEG Encoder
       media: jpeg: Add reference quantization and huffman tables
       media: imagination: Add E5010 JPEG Encoder driver

  .../bindings/media/img,e5010-jpeg-enc.yaml         |   75 +
  MAINTAINERS                                        |    7 +
  drivers/media/platform/Kconfig                     |    1 +
  drivers/media/platform/Makefile                    |    1 +
  drivers/media/platform/imagination/Kconfig         |   12 +
  drivers/media/platform/imagination/Makefile        |    3 +
  .../media/platform/imagination/e5010-core-regs.h   |  585 ++++++++
  .../media/platform/imagination/e5010-jpeg-enc-hw.c |  267 ++++
  .../media/platform/imagination/e5010-jpeg-enc-hw.h |   42 +
  .../media/platform/imagination/e5010-jpeg-enc.c    | 1553 ++++++++++++++++++++
  .../media/platform/imagination/e5010-jpeg-enc.h    |  169 +++
  .../media/platform/imagination/e5010-mmu-regs.h    |  311 ++++
  include/media/jpeg-enc-reftables.h                 |  112 ++
  include/media/jpeg.h                               |    4 +
  14 files changed, 3142 insertions(+)
  create mode 100644 Documentation/devicetree/bindings/media/img,e5010-jpeg-enc.yaml
  create mode 100644 drivers/media/platform/imagination/Kconfig
  create mode 100644 drivers/media/platform/imagination/Makefile
  create mode 100644 drivers/media/platform/imagination/e5010-core-regs.h
  create mode 100644 drivers/media/platform/imagination/e5010-jpeg-enc-hw.c
  create mode 100644 drivers/media/platform/imagination/e5010-jpeg-enc-hw.h
  create mode 100644 drivers/media/platform/imagination/e5010-jpeg-enc.c
  create mode 100644 drivers/media/platform/imagination/e5010-jpeg-enc.h
  create mode 100644 drivers/media/platform/imagination/e5010-mmu-regs.h
  create mode 100644 include/media/jpeg-enc-reftables.h

