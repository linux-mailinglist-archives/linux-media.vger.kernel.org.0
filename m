Return-Path: <linux-media+bounces-3113-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E2388820AFD
	for <lists+linux-media@lfdr.de>; Sun, 31 Dec 2023 11:31:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98E88281FF5
	for <lists+linux-media@lfdr.de>; Sun, 31 Dec 2023 10:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B63512573;
	Sun, 31 Dec 2023 10:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fA2VxsBD"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A4FB645
	for <linux-media@vger.kernel.org>; Sun, 31 Dec 2023 10:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704018671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mDh8dOmktcmj7w+yT3A1PZiQonA+Ubb3/s2sc3pjhy8=;
	b=fA2VxsBD3wkxEPvblsK5x5ptsBnkQtRMQiyfJUgoLD+ovDziU00NKhsRP/FpqWoHxPa+vr
	1BXrx2pQxRI6bPQen4K+fezuIwsF7rruXeEls4/GdQtx4GQJPETHUmcg0uu+LchRnBPpuZ
	rJNtVCIArtGsJpx/ipNCrCd+cUM9vbc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-509-iX8E2KdRPfW7DvuKR-TTiw-1; Sun, 31 Dec 2023 05:31:08 -0500
X-MC-Unique: iX8E2KdRPfW7DvuKR-TTiw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8F371831003;
	Sun, 31 Dec 2023 10:31:07 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.59])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F0264492BC6;
	Sun, 31 Dec 2023 10:31:05 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Kate Hsuan <hpa@redhat.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>,
	andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 00/15] media: atomisp: NULL pointer deref + missing firmware fixes
Date: Sun, 31 Dec 2023 11:30:42 +0100
Message-ID: <20231231103057.35837-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9

Hi All,

Here is a set of atomisp fixes I have been working on:

- The first commit in this series fixes the driver no longer
  working due to v4l2_subdev_state handling in media_stage/master

- Gracefully handle missing firmware:
  - Fix the driver crashing the system when the firmware is missing
  - Make the driver bind in power-managent-only mode when the firmware
    is missing so that the ISP is still properly turned off. This
    requires custom handling, not just standard PCI power-management.
    This allows the system to properly enter S0i3 with missing ISP
    firmware, allowing the atomisp driver to be used as a replacement
    for the pm-only drivers/platform/x86/atomisp/pm.c driver.

I am going to send out a pull-request to Mauro for this almost directly
after sending these patches to the list, leaving pretty much zero time
for review. Sorry about that, with the holidays the timing did not work
out very well.

If review finds any significant issues I'll do a set of follow up
patches to fix those.

Regards,

Hans


Hans de Goede (15):
  media: atomisp: Adjust for v4l2_subdev_state handling changes in 6.8
  media: atomisp: Refactor sensor crop + fmt setting
  media: atomisp: Remove s_routing subdev call
  media: atomisp: Remove remaining deferred firmware loading code
  media: atomisp: Drop is_valid_device() function
  media: atomisp: Call pcim_enable_device() and pcim_iomap_regions()
    later
  media: atomisp: Fix probe error-exit path
  media: atomisp: Fix atomisp_pci_remove()
  media: atomisp: Group cpu_latency_qos_add_request() call together with
    other PM calls
  media: atomisp: Fix probe()/remove() power-management
  media: atomisp: Replace atomisp_drvfs attr with using
    driver.dev_groups attr
  media: atomisp: Move power-management [un]init into
    atomisp_pm_[un]init()
  media: atomisp: Bind and do power-management without firmware
  media: atomisp: Remove unnecessary msleep(10) from
    atomisp_mrfld_power() error path
  media: atomisp: Update TODO

 drivers/staging/media/atomisp/TODO            |  10 -
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 133 ++++----
 .../media/atomisp/pci/atomisp_compat_css20.c  |   2 +-
 .../staging/media/atomisp/pci/atomisp_drvfs.c | 148 +++-----
 .../staging/media/atomisp/pci/atomisp_drvfs.h |   5 +-
 .../media/atomisp/pci/atomisp_internal.h      |   5 +-
 .../staging/media/atomisp/pci/atomisp_ioctl.c |  60 ++--
 .../staging/media/atomisp/pci/atomisp_v4l2.c  | 319 ++++++++----------
 .../media/atomisp/pci/ia_css_control.h        |  29 +-
 .../media/atomisp/pci/ia_css_firmware.h       |   6 +-
 drivers/staging/media/atomisp/pci/sh_css.c    |  33 +-
 11 files changed, 309 insertions(+), 441 deletions(-)

-- 
2.43.0


