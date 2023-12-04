Return-Path: <linux-media+bounces-1543-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 950AA80332A
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 13:40:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A6181F21141
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 12:40:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA793241FC;
	Mon,  4 Dec 2023 12:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W14O8L7R"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA9B8191
	for <linux-media@vger.kernel.org>; Mon,  4 Dec 2023 04:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701693593;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1XAxPGVq4CuEZfAg8UFpH/iqs4ZYXLDRJqxMxUEBlKI=;
	b=W14O8L7Rf7uOa5pHYVrs1vjkfBylr2x84xBquyrJfltGrkuBWeRCDXgYIwDA3DA0pQuW70
	qrSLIDMRnQJPp86SnBLFY8v2EYfMKRN1CsVZR8kKmC7ObgBC1iQ0MTSltQo68zT+Jp0Dvm
	8yUCcBMbXHsV87pL9njTWmRlZW89Ba4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-441-BIMCkvwnM-aJzX7wWRUpXw-1; Mon, 04 Dec 2023 07:39:50 -0500
X-MC-Unique: BIMCkvwnM-aJzX7wWRUpXw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A0571811E7B;
	Mon,  4 Dec 2023 12:39:49 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.195.73])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5C69340C6EB9;
	Mon,  4 Dec 2023 12:39:48 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v4 0/9] media: ov2740: reset GPIO, clk and 180 MHz link-frequency support
Date: Mon,  4 Dec 2023 13:39:37 +0100
Message-ID: <20231204123947.5754-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2

Hi All,

Here is v4 of my patch series to allow the mainline ov2740 driver to be
used on various Lenovo ThinkPad models using the IPU6 + ov2740 for their
camera. This series has been tested on a Lenovo ThinkPad X1 yoga gen 8
with both:

1. The out of tree IPU6 driver with Intel's proprietary userspace stack
2. The pending mainline IPU6 CSI2 receiver patches using raw bayer capture
   in combination with the WIP libcamera SoftISP code

Changes in v4:
- Rebase on top of sailus/media_tree/master at commit
  79adb3adb331 ("media: stm32-dcmipp: STM32 DCMIPP camera interface driver")

Changes in v3:
- Add missing fwnode_handle_put() in error-exit-paths in patch 3/9

Changes in v2:
- Add patches 3-9 which add 180 MHz link-frequency support
- Fix code in patch 2/9 to stay in 80 chars limit

Regards,

Hans


Hans de Goede (9):
  media: ov2740: Add support for reset GPIO
  media: ov2740: Add support for external clock
  media: ov2740: Move fwnode_graph_get_next_endpoint() call up
  media: ov2740: Improve ov2740_check_hwcfg() error reporting
  media: ov2740: Fix hts value
  media: ov2740: Check hwcfg after allocating the ov2740 struct
  media: ov2740: Add support for 180 MHz link frequency
  media: ov2740: Add a sleep after resetting the sensor
  media: ipu-bridge: Change ov2740 link-frequency to 180 MHz

 drivers/media/i2c/ov2740.c           | 388 +++++++++++++++++++++++----
 drivers/media/pci/intel/ipu-bridge.c |   2 +-
 2 files changed, 334 insertions(+), 56 deletions(-)

-- 
2.43.0


