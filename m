Return-Path: <linux-media+bounces-29937-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 95683A84701
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 16:56:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 624E37A8D8B
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 14:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B389528FFDA;
	Thu, 10 Apr 2025 14:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NF6ykLkL"
X-Original-To: linux-media@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7952857C0;
	Thu, 10 Apr 2025 14:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744296807; cv=none; b=pu6FBdwjvMJPeUx5VvLUQiBIT5VoLZw2efwUuHAVUxkna9kw58N8cg9xadpPf6X3RGkAqUCuetcvwOJBN54LVLiN0GTnZI/qca53Wzvt+K7X1pFc5xTL4IMnNti+vkcEdiUDbL0i1l+pwcVVvTBiUJpA59tq/zHqe4oY9nFpV0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744296807; c=relaxed/simple;
	bh=4Vji/GfcxFWxhSbyxw7eJusyE4bs1XmFVkDlbNLqi70=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nxM/FEU9zvRFv7zrmhFg51x5Hzt3zCwmtsd0jy7VE1CNvuihUBGqGN1PQJBGuMp6CZpnf2GEFBmkOaFt6hM81ItDrXqaJaXxGR+qWyvl3SF8ouOFwpsbBlaHZp48i3WAtJD1dVy/Di09yLtZHcjoEXzEsKxXjAN6eM18g6VVx0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NF6ykLkL; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 61F6E44332;
	Thu, 10 Apr 2025 14:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744296801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XACrmFtTTu8N1uzmt+oqhVkqMDjPP2HTNmYVXTmY2dU=;
	b=NF6ykLkLs1mpP3vFcinXnQ4UgHn6oyDIvl+/g3UPJhGU3vw6NaAOXzzzKd0oG7WymyiYBP
	dwCxqXoZKYRlHPLzPkvVODFRETsrQXJC8TWb9PLZPA//LNW9VA++zsi4HB4HOvyQRVTq3o
	iPSxkKU5hDbDVzY7MoyqxMzjowP++qoK0Z1d0YwB8liPGKKS/2NWLoa72n046kXNjuHrEq
	DFoG8kWwH3GMEUp9VBoWx/fcrefgFMkXlB+uCc6Sl2rJnQEdpKcG8dNMg2BFbKQfnzfgmz
	9xOGv9UNDARU2O7BzJULt44+8Peyvq53zQGzI3z0C4LOnTpQOc12503/yCd53g==
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
Subject: [PATCH 0/3] uio/dma-buf: Give UIO users access to DMA addresses.
Date: Thu, 10 Apr 2025 16:53:17 +0200
Message-Id: <20250410-uio-dma-v1-0-6468ace2c786@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF3b92cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEwML3dLMfN2U3ERdyyQDQ8NUy1TzNIMkJaDqgqLUtMwKsEnRsbW1AFK
 fJGlZAAAA
X-Change-ID: 20250408-uio-dma-9b011e9e7f0b
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 Bastien Curutchet <bastien.curutchet@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdelvddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthejredtredtjeenucfhrhhomhepuegrshhtihgvnhcuvehurhhuthgthhgvthcuoegsrghsthhivghnrdgtuhhruhhttghhvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedvhfegudetkeffheffleehhfejvefhvdetfeefheettdfgkeegueekleeuvdejfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrdegvddrheegngdpmhgrihhlfhhrohhmpegsrghsthhivghnrdgtuhhruhhttghhvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeelpdhrtghpthhtohepshhumhhithdrshgvmhifrghlsehlihhnrghrohdrohhrghdprhgtphhtthhopegthhhrihhsthhirghnrdhkohgvnhhighesrghmugdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrg
 hdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnrghrohdqmhhmqdhsihhgsehlihhsthhsrdhlihhnrghrohdrohhrghdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsggrshhtihgvnhdrtghurhhuthgthhgvthessghoohhtlhhinhdrtghomh
X-GND-Sasl: bastien.curutchet@bootlin.com

Hi all,

Many UIO users performing DMA from their UIO device need to access the
DMA addresses of the allocated buffers. There are out-of-tree drivers
that allow to do it but nothing in the mainline.

I know DMA shouldn't be handled by userspace but, IMHO, since UIO
drivers exist, it would be better if they offered a way of doing this.

This patch series use the dma-heap framework which already allows
userspace to allocate DMA buffers. I tried to avoid 'polluting' the
existing heaps to prevent inappropriate uses of this new feature by
introducing a new UIO heap, which is the only one implementing this
behavior.

PATCH 1 allows the creation of heaps that don't implement map/unmap_buf
operations as UIO heap doesn't use them.
PATCH 2 adds the DMA_BUF_IOCTL_GET_DMA_ADDR which transmits the DMA
addresses to userspace.
PATCH 3 implements the UIO heap.

It has been tested with the uio_pci_generic driver on a PowerPC.

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
Bastien Curutchet (3):
      dma-buf: Allow heap that doesn't provide map_buf/unmap_buf
      dma-buf: Add DMA_BUF_IOCTL_GET_DMA_ADDR
      uio: Add UIO_DMABUF_HEAP

 drivers/dma-buf/dma-buf.c    |  29 +++++++++--
 drivers/uio/Kconfig          |   9 ++++
 drivers/uio/Makefile         |   1 +
 drivers/uio/uio.c            |   4 ++
 drivers/uio/uio_heap.c       | 120 +++++++++++++++++++++++++++++++++++++++++++
 include/linux/dma-buf.h      |   1 +
 include/linux/uio_driver.h   |   2 +
 include/uapi/linux/dma-buf.h |   1 +
 8 files changed, 164 insertions(+), 3 deletions(-)
---
base-commit: 5f13fa25acaa4f586aaed12efcf7436e004eeaf2
change-id: 20250408-uio-dma-9b011e9e7f0b

Best regards,
-- 
Bastien Curutchet <bastien.curutchet@bootlin.com>


