Return-Path: <linux-media+bounces-1198-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 113647FB683
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 11:01:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7DAE28237C
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 10:01:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D11A4C3BC;
	Tue, 28 Nov 2023 10:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aiaSxJ6F"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3567019B
	for <linux-media@vger.kernel.org>; Tue, 28 Nov 2023 02:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701165658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kKEzWBQ+iX8vifh4JHHZmPL2RuqTHuFa9xV6LO2UezA=;
	b=aiaSxJ6Fr+rulHjRpNEzLlqqKKEUKW4oZY2Egue7AlWz7h9/bezNvRTvEDNyJA+z4zcD6B
	JqMJeaHRXeD1tKu/5Hmtsd1hmYG4YXEoIc+D2j3eXOjwarfhrNwm2neDLZfZiqBoqsdBNb
	oWt5v++zANYiv/YG1O/LmLvIGWx0W4A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-445-2bL1HJtLMmGuQoc-YDj2Hg-1; Tue, 28 Nov 2023 05:00:55 -0500
X-MC-Unique: 2bL1HJtLMmGuQoc-YDj2Hg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8BC33185A789;
	Tue, 28 Nov 2023 10:00:54 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.244])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6099B20268D7;
	Tue, 28 Nov 2023 10:00:53 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v3 0/9] media: ov2740: reset GPIO, clk and 180 MHz link-frequency support
Date: Tue, 28 Nov 2023 11:00:38 +0100
Message-ID: <20231128100047.17529-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4

Hi All,

Here is v3 of my patch series to allow the mainline ov2740 driver to be
used on various Lenovo ThinkPad models using the IPU6 + ov2740 for their
camera. This series has been tested on a Lenovo ThinkPad X1 yoga gen 8
with both:

1. The out of tree IPU6 driver with Intel's proprietary userspace stack
2. The pending mainline IPU6 CSI2 receiver patches using raw bayer capture
   in combination with the WIP libcamera SoftISP code

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

 drivers/media/i2c/ov2740.c           | 387 +++++++++++++++++++++++----
 drivers/media/pci/intel/ipu-bridge.c |   2 +-
 2 files changed, 334 insertions(+), 55 deletions(-)

-- 
2.41.0


