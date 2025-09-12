Return-Path: <linux-media+bounces-42410-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A332BB54874
	for <lists+linux-media@lfdr.de>; Fri, 12 Sep 2025 11:55:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75A081C244CC
	for <lists+linux-media@lfdr.de>; Fri, 12 Sep 2025 09:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44D862877F7;
	Fri, 12 Sep 2025 09:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ciXidO3k"
X-Original-To: linux-media@vger.kernel.org
Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04E9287511
	for <linux-media@vger.kernel.org>; Fri, 12 Sep 2025 09:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757670922; cv=none; b=c/cQOjGSTYo4+2+H7s9N7aVteuL8EHHSMCAKApKaXihUkFXs8QmsxEqHK4JhY3uMuEEVhP1WBVTicznHQh+e+nmR77fJlg3pgdJlZtJFNCMm/WUnV764prAIjtGJC0bEO9KbzBi8JHHWQPaF0jKzz2eR3bWQnh7yGGBDz0dOKOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757670922; c=relaxed/simple;
	bh=W1vILrgpP/FdeDrJ+8SimvW5qPiWEjU/edFEPMKlZT4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LlSHaPr+1mpVHbdU5Al9MKhCNd4cNLXrycOG5baIosRGTQUJYG+1Ix4BXE9ZIcuM7OUEjREtZwP0zzGIL7npLU0LyTYb3psZYpVnEdsQHh2l6U1/xDP4xgm3/FQFUCUz/z+17t4GO403SDPzjIKXFXHEdfro0gyfgn9yIp8fhdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ciXidO3k; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Fri, 12 Sep 2025 15:25:11 +0530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1757670919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=w7IL/mpALj6qLrHJU00z8MPvosBdxtLLbhUmYQpi6SU=;
	b=ciXidO3k1X4cy3mBmju+vGk6UQ+Yt2j0uxMefFsSjQzkFqifUj+Pgo2EGo24w0A6PgLq2e
	EC7ZJDLHefncuRtZz88W2NzSWraIi0Ja5hBuFy8vQSkt9LHrtPnxRLlTqHvc38RXt8adYw
	Gb1SiIgfcS5bxIPR2awJJ4QPwAnKdOM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Jai Luthra <jai.luthra@linux.dev>
To: linux-media@vger.kernel.org, Hans Verkuil <hans@jjverkuil.nl>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Devarsh Thakkar <devarsht@ti.com>
Subject: [GIT PULL FOR v6.18] TI and Cadence CSI2RX drivers changes
Message-ID: <4wklgso7mjxss5nzrwtcwae6fm22snmw7zdx4lmdxs75tmklip@3w55xhfzkasw>
X-PGP-Key: http://jailuthra.in/files/public-key.asc
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Migadu-Flow: FLOW_OUT

Hi Hans, Mauro,

The following changes since commit ecba852dc9f4993f4f894ea1f352564560e19a3e:

  media: redrat3: use int type to store negative error codes (2025-09-11 08:46:10 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/jluthra.git tags/for-6.18-ti-j721e-csi2rx-signed

for you to fetch changes up to c694e74c651e79838e817a8c6644dc72cf80540d:

  media: ti: j721e-csi2rx: Support system suspend using pm_notifier (2025-09-12 14:37:56 +0530)

----------------------------------------------------------------
TI and Cadence CSI2RX driver changes:

- Multistream support for Cadence and TI CSI2RX
- Runtime PM support for Cadence and TI CSI2RX
- System suspend and resume support for TI CSI2RX
- Misc cleanups

----------------------------------------------------------------
Changhuang Liang (1):
      media: cadence: csi2rx: Support runtime PM

Jai Luthra (9):
      dt-bindings: media: ti,j721e-csi2rx-shim: Support 32 dma chans
      media: ti: j721e-csi2rx: separate out device and context
      media: ti: j721e-csi2rx: add a subdev for the core device
      media: ti: j721e-csi2rx: add support for processing virtual channels
      media: cadence: csi2rx: add multistream support
      media: ti: j721e-csi2rx: add multistream support
      media: ti: j721e-csi2rx: Submit all available buffers
      media: ti: j721e-csi2rx: Support runtime suspend
      media: ti: j721e-csi2rx: Support system suspend using pm_notifier

Pratyush Yadav (4):
      media: ti: j721e-csi2rx: prepare SHIM code for multiple contexts
      media: ti: j721e-csi2rx: allocate DMA channel based on context index
      media: ti: j721e-csi2rx: get number of contexts from device tree
      media: cadence: csi2rx: add get_frame_desc wrapper

Rishikesh Donadkar (2):
      media: ti: j721e-csi2rx: Remove word size alignment on frame width
      media: ti: j721e-csi2rx: Change the drain architecture for multistream

 Documentation/devicetree/bindings/media/ti,j721e-csi2rx-shim.yaml |   39 ++++++-
 drivers/media/platform/cadence/Kconfig                            |    1 +
 drivers/media/platform/cadence/cdns-csi2rx.c                      |  491 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---------------------
 drivers/media/platform/ti/Kconfig                                 |    1 +
 drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c             | 1167 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--------------------------------------------------
 5 files changed, 1300 insertions(+), 399 deletions(-)

--
Thanks,

Jai

