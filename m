Return-Path: <linux-media+bounces-1040-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A13C7F92F8
	for <lists+linux-media@lfdr.de>; Sun, 26 Nov 2023 15:15:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 76293B20E63
	for <lists+linux-media@lfdr.de>; Sun, 26 Nov 2023 14:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78844D2E4;
	Sun, 26 Nov 2023 14:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MgthKIr7"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECF7118F
	for <linux-media@vger.kernel.org>; Sun, 26 Nov 2023 06:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701008128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CODh0FGTpgQjb/FGNVjEN7KYlSKrJ3lQZOp1nZJIM9M=;
	b=MgthKIr7R/whU/Xevt8ydLJLs8TMJvf7mjjnKOzlyaWSgu4Hc+jWgscKmp1LbQ7WCevUMq
	DGmFCkeTOcGQoY6Xf/Z5agsJf112Y/C9VCjSIS/21cEYJp8eMJhhx3ewS94q2WReGNc4HK
	ATdaCmT6HdfqjWOyGoa4X8t2kNxIuPE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-eWwF4nsmPqKOFHjz3vNikg-1; Sun, 26 Nov 2023 09:15:24 -0500
X-MC-Unique: eWwF4nsmPqKOFHjz3vNikg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 683EE856F61;
	Sun, 26 Nov 2023 14:15:24 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.41])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6A1782026D33;
	Sun, 26 Nov 2023 14:15:23 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v2 0/9] media: ov2740: reset GPIO, clk and 180 MHz link-frequency support
Date: Sun, 26 Nov 2023 15:15:08 +0100
Message-ID: <20231126141517.7534-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4

Hi All,

Here is v2 of my ov2740 patch series. The big change in v2 is adding
a bunch of new patches (patch 3 - 9) to add support for 180 MHz
link-frequency.

These new patches allow the mainline ov2740 driver to be used on
various Lenovo ThinkPad models using the IPU6 + ov2740 for their
camera. This series has been tested on a Lenovo ThinkPad X1 yoga gen 8
with both:

1. The out of tree IPU6 driver with Intel's proprietary userspace stack
2. The pending mainline IPU6 CSI2 receiver patches using raw bayer capture
   in combination with the WIP libcamera SoftISP code

Besides the new patches there is a small change in patch 2/9
to stay within the 80 chars limit.

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

 drivers/media/i2c/ov2740.c           | 375 +++++++++++++++++++++++----
 drivers/media/pci/intel/ipu-bridge.c |   2 +-
 2 files changed, 326 insertions(+), 51 deletions(-)

-- 
2.41.0


