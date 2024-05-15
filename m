Return-Path: <linux-media+bounces-11483-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9388C67F2
	for <lists+linux-media@lfdr.de>; Wed, 15 May 2024 15:57:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F0581F23E59
	for <lists+linux-media@lfdr.de>; Wed, 15 May 2024 13:57:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8817A13F01A;
	Wed, 15 May 2024 13:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="efVBkvUH"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF39564CFC;
	Wed, 15 May 2024 13:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715781462; cv=none; b=owzGd6nCFo01V7F4cXOW7IXZki1wDxFSTyBrCyX7HRCJc2cH+GjUReRoO+I6v4RhAe9FDYI6UU5Ai7vc1WHlwBKJpvfKuvIB5UbgxNNEGgQr5AggyHQdAHVkUYeHFJ1vlUi8HFwA+L8DluSXn+ag3yT+NU62p6CunXVkcp0F/ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715781462; c=relaxed/simple;
	bh=0Om0EsLkpFBVKkvz9olitc46qsiUdNn1/n5ZWkf37uM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TBABM0fYwaENUMPvXAAN5Zr++U6jxKSe8rw6OFcQoGP3xpRzISCRJ+dmr8sFh/wkqV3v0jjO7UeMYhrg+wKR8Hf5mZKGs9w/mYQm9Uc2e7dsEe6BTqPnHHUNOL3u9SYwYN7mrqgre6YzZLlEuhQKKvx3f74iXqjLEK+tLW9TGQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=efVBkvUH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 029F0C116B1;
	Wed, 15 May 2024 13:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715781461;
	bh=0Om0EsLkpFBVKkvz9olitc46qsiUdNn1/n5ZWkf37uM=;
	h=From:Subject:Date:To:Cc:From;
	b=efVBkvUHMwvEPS9v5viutvHv7Nwmm+sJx1bgg68pjDdL5tQOBfNrGoz42YlvUCiAj
	 kn9/Q2v6QxgRiNb+6xYMD68qCd3reid6n/aqHUK1/+u2URPhCIsEV/12vnr3ycQvhH
	 0X615sQhaDfm/PRn0AnpVG2lmlq4fRLOXY2gH6Yal52hYHSmyhf+K+pMjXbHKAP6/u
	 CnZ59ZBD4F6zQ+ImRB82ZBpf4m/Is/rzzkq/FbSk/XwB7v0qyM3VAREipiMF3oxUIk
	 hZJcPiSda5+9Wpt+dsWVmhoHvv5Ce8HWDlr5HjCVBPxAidyY1xdcYyuZosqcDBUqa5
	 bW1opPrItcBIA==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 0/8] dma-buf: heaps: Support carved-out heaps and ECC
 related-flags
Date: Wed, 15 May 2024 15:56:55 +0200
Message-Id: <20240515-dma-buf-ecc-heap-v1-0-54cbbd049511@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACe/RGYC/x3MQQqAIBBA0avIrBtIS6iuEi1Mx5pFJkoRhHdPW
 r7F/y9kSkwZJvFCopszn6FCNgLsbsJGyK4aVKv6VkuN7jC4Xh7JWtzJRFSD6aR0yo49Qc1iIs/
 Pv5yXUj7AlIV2YgAAAA==
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Mattijs Korpershoek <mkorpershoek@baylibre.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2381; i=mripard@kernel.org;
 h=from:subject:message-id; bh=0Om0EsLkpFBVKkvz9olitc46qsiUdNn1/n5ZWkf37uM=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGku+50Tp5XnH/PUiwzWiHWN5qhb6TVvj+JzU9WQlR+vH
 hINFfXtmMrCIMzJICumyPJEJuz08vbFVQ72K3/AzGFlAhnCwMUpABO5OZWxzoZzzf/AWs7XRS8b
 b2ve+P/28/yayTKc7TP4yu8EKcs9T/BblnA2Ni96fpTEgzBOSf0PjA0bdl68zBtx8n3vjmrdCjb
 5sNayFR9yDVdVeth++TrprFWp9qWS08IBj13Lo87oGvAt+QUA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

Hi,

This series is the follow-up of the discussion that John and I had a few
months ago here:

https://lore.kernel.org/all/CANDhNCquJn6bH3KxKf65BWiTYLVqSd9892-xtFDHHqqyrroCMQ@mail.gmail.com/

The initial problem we were discussing was that I'm currently working on
a platform which has a memory layout with ECC enabled. However, enabling
the ECC has a number of drawbacks on that platform: lower performance,
increased memory usage, etc. So for things like framebuffers, the
trade-off isn't great and thus there's a memory region with ECC disabled
to allocate from for such use cases.

After a suggestion from John, I chose to start using heap allocations
flags to allow for userspace to ask for a particular ECC setup. This is
then backed by a new heap type that runs from reserved memory chunks
flagged as such, and the existing DT properties to specify the ECC
properties.

We could also easily extend this mechanism to support more flags, or
through a new ioctl to discover which flags a given heap supports.

I submitted a draft PR to the DT schema for the bindings used in this
PR:
https://github.com/devicetree-org/dt-schema/pull/138

Let me know what you think,
Maxime

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Maxime Ripard (8):
      dma-buf: heaps: Introduce a new heap for reserved memory
      of: Add helper to retrieve ECC memory bits
      dma-buf: heaps: Import uAPI header
      dma-buf: heaps: Add ECC protection flags
      dma-buf: heaps: system: Remove global variable
      dma-buf: heaps: system: Handle ECC flags
      dma-buf: heaps: cma: Handle ECC flags
      dma-buf: heaps: carveout: Handle ECC flags

 drivers/dma-buf/dma-heap.c            |   4 +
 drivers/dma-buf/heaps/Kconfig         |   8 +
 drivers/dma-buf/heaps/Makefile        |   1 +
 drivers/dma-buf/heaps/carveout_heap.c | 330 ++++++++++++++++++++++++++++++++++
 drivers/dma-buf/heaps/cma_heap.c      |  10 ++
 drivers/dma-buf/heaps/system_heap.c   |  29 ++-
 include/linux/dma-heap.h              |   2 +
 include/linux/of.h                    |  25 +++
 include/uapi/linux/dma-heap.h         |   5 +-
 9 files changed, 407 insertions(+), 7 deletions(-)
---
base-commit: a38297e3fb012ddfa7ce0321a7e5a8daeb1872b6
change-id: 20240515-dma-buf-ecc-heap-28a311d2c94e

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>


