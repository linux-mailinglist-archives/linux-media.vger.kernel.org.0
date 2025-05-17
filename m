Return-Path: <linux-media+bounces-32658-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 01804ABA9C5
	for <lists+linux-media@lfdr.de>; Sat, 17 May 2025 13:41:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D5441B6245A
	for <lists+linux-media@lfdr.de>; Sat, 17 May 2025 11:41:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FBD01F63F9;
	Sat, 17 May 2025 11:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="freRL5Jm"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D016B1DE8B2
	for <linux-media@vger.kernel.org>; Sat, 17 May 2025 11:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747482082; cv=none; b=PnsaFvdnuiyKsU4LF2FVDXSzPzOHXJ++vdT9AV7/nRhhdCjy1/UYPW9/IQBzJED9/uLhQhRO/ftiqoVGzQoHwHh6wFd6y4qmmfuJpynGq6M5aNnK4kvSszLETfYBk32e6WsADKVA+IkHhy7t3pyL5KUtU4GLA6thDAyE09KU/v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747482082; c=relaxed/simple;
	bh=0v1Qxly4XbpH9R05dxT0o9FplWG+cb90xtFZgeHVdVI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ec47uSkMycXeMzLFROFD4kXYzo1reIUExvzdjtP+ftY5xgiSRMZ/TKeI06CbsSUu5w8ZY49QKKugGLjmZ3MCBa7X0WJyOeOVh5WpbKakuf63UrCmyo23pxmqzMlJwtJi5Geu+KTI6bF3VU0eAwQ5Jr0cCnNczSt98txnePoxFvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=freRL5Jm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747482079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aLMId0TzbQg32MWeehFM5MFmElv3RDP2SorEgKIM2uA=;
	b=freRL5Jmpt8y8VhOF5aWYlwTFq0nB9Pf435eG3OfYWm1p89/Yt6fJC6KXB+ursifrpXi96
	p32fJPhOQ8jtrZDrOloily0XvhI0qMq5bYQrm/L56LGLC+byEkCn+fiwfwgB/6TKvbV2U4
	ZgnLNYHWBtkmEZ6u/eSffMh6yM0d0Xg=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-621-GILM-56KOJet9XHefuPX4Q-1; Sat,
 17 May 2025 07:41:15 -0400
X-MC-Unique: GILM-56KOJet9XHefuPX4Q-1
X-Mimecast-MFC-AGG-ID: GILM-56KOJet9XHefuPX4Q_1747482074
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6BAD819560AE;
	Sat, 17 May 2025 11:41:14 +0000 (UTC)
Received: from x1.redhat.com (unknown [10.45.224.43])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 068E718003FC;
	Sat, 17 May 2025 11:41:09 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 00/23] media: atomisp: gc0310: Modernize and move to drivers/media
Date: Sat, 17 May 2025 13:40:43 +0200
Message-ID: <20250517114106.43494-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Hi All,

Here is a patch series to bring the staging atomisp gc0310 driver inline
with the expectations for new v4l2 raw camera sensor drivers and then
after this move it to drivers/media/i2c since it is now just another
normal modern v4l2 raw camera sensor driver.

I plan to send a pull-request for patches 1-22 to get added to
media-commiters/next once they are reviewed. After that Sakari can review
the final resulting gc0310.c file and merge the last patch moving it.

Regards,

Hans


Hans de Goede (23):
  media: atomisp: gc0310: Rename "dev" function variable to "sensor"
  media: atomisp: gc0310: Drop unused GC0310_FOCAL_LENGTH_NUM define
  media: atomisp: gc0310: Modify vblank value to run at 30 fps
  media: atomisp: gc0310: Switch to CCI register access helpers
  media: atomisp: gc0310: Use V4L2_CID_ANALOGUE_GAIN for gain control
  media: atomisp: gc0310: Add selection API support
  media: atomisp: gc0310: Add link-frequency and pixelrate controls
  media: atomisp: gc0310: Add vblank and hblank controls
  media: atomisp: gc0310: Add camera orientation and sensor rotation
    controls
  media: atomisp: gc0310: Limit max exposure value to mode-height +
    vblank
  media: atomisp: gc0310: Add check_hwcfg() function
  media: atomisp: gc0310: Fix power on/off sleep times
  media: atomisp: gc0310: Remove unused is_streaming variable
  media: atomisp: gc0310: Switch to {enable,disable}_streams
  media: atomisp: gc0310: Switch to using the sub-device state lock
  media: atomisp: gc0310: Implement internal_ops.init_state
  media: atomisp: gc0310: Use v4l2_subdev_get_fmt() as
    v4l2_subdev_pad_ops.get_fmt()
  media: atomisp: gc0310: Switch to using sd.active_state fmt
  media: atomisp: gc0310: Move and rename suspend/resume functions
  media: atomisp: gc0310: runtime-PM fixes
  media: atomisp: gc0310: Drop gc0310_get_frame_interval()
  media: atomisp: gc0310: Drop gc0310_g_skip_frames()
  media: Move gc0310 sensor drivers to drivers/media/i2c/

 MAINTAINERS                                   |   6 +
 drivers/media/i2c/Kconfig                     |  10 +
 drivers/media/i2c/Makefile                    |   1 +
 drivers/media/i2c/gc0310.c                    | 800 ++++++++++++++++++
 drivers/staging/media/atomisp/i2c/Kconfig     |   8 -
 drivers/staging/media/atomisp/i2c/Makefile    |   1 -
 .../media/atomisp/i2c/atomisp-gc0310.c        | 712 ----------------
 7 files changed, 817 insertions(+), 721 deletions(-)
 create mode 100644 drivers/media/i2c/gc0310.c
 delete mode 100644 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c

-- 
2.49.0


