Return-Path: <linux-media+bounces-5316-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC988588AA
	for <lists+linux-media@lfdr.de>; Fri, 16 Feb 2024 23:34:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90CD41C21428
	for <lists+linux-media@lfdr.de>; Fri, 16 Feb 2024 22:34:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCD2A14AD12;
	Fri, 16 Feb 2024 22:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K9GjvFxM"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A43313AA57
	for <linux-media@vger.kernel.org>; Fri, 16 Feb 2024 22:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708122775; cv=none; b=NTBqZWq9qEOalPmn12FTdjfiFUk2wPWGnYxhnPnztAPYXPq5TRcZZiokDspLF0ylil+RStbK8FYxr9hQdZjXMwHHrcPWaIHGyVgBgr+UhixnBUBu3tpj9Lflk+yqpgq9ZJVE2WRgsJXhaHeR2Xy1FjW+KtNmyiS5yIUNHUFbqGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708122775; c=relaxed/simple;
	bh=+r7T5kIMy6gQGJ/VuAO2/BugcmxqluY81aijOrERSf0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m12dFfFZdpf9nIHp0EqeeH3xK6Vmw1j2ErLVnR88eXrXKo+1mdq8jg2oO7uUc05QQn/cJXivRfXdL2pFo9S3/uK+HNuLO0F+iKy1bLvx4mNbYf7lnJ1daRnJu4Ck0DzFpWnUzkonARd6K517jyz0yuhzoCTw+TsqoBMZ6FvLuWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K9GjvFxM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708122772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Hy6p/oEWixdH+IpmRl0VMCG2DS29xFSNY2hmYo1BUJw=;
	b=K9GjvFxMfGrca9561nkF9xDQ5z4DiDkcwSh2Tb3Y6iz27TBQgcRsdb639EengIBFRHLLgj
	c71SkClu9rw11Q/LZXBSDCsFSNnyqPksnqkKKn+vdGBEK3fEwI8NKpmJvzIL2XCvry9Rpd
	+7RRHx8Hu/gbqo5/q83eLn+N90QtcqE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-115-rPUEB8KwP2msGrq_c2ULJQ-1; Fri, 16 Feb 2024 17:32:47 -0500
X-MC-Unique: rPUEB8KwP2msGrq_c2ULJQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1C152828CE5;
	Fri, 16 Feb 2024 22:32:47 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.87])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 53B04C0335E;
	Fri, 16 Feb 2024 22:32:46 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 0/5] media: ov2680: Add all controls required by libcamera
Date: Fri, 16 Feb 2024 23:32:32 +0100
Message-ID: <20240216223237.326523-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8

Hi All,

This patch-series adds all controls required by libcamera to the ov2680
driver.

This has been tested together with the atomisp using the simple
pipelinehandler. This should also work in IPU3 based devices with
an ov2680.

Note the vblank control new default value after a mode-set call 
has been chosen so as to preserve the old behavior of always
running at 30 fps, so as to not change behavior for any existing
use-cases.

Regards,

Hans


Hans de Goede (5):
  media: ov2680: Stop sending more data then requested
  media: ov2680: Drop hts, vts ov2680_mode struct members
  media: ov2680: Add vblank control
  media: ov2680: Add hblank control
  media: ov2680: Add camera orientation and sensor rotation controls

 drivers/media/i2c/ov2680.c | 82 +++++++++++++++++++++++++++++---------
 1 file changed, 63 insertions(+), 19 deletions(-)

-- 
2.43.0


