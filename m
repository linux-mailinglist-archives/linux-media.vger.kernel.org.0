Return-Path: <linux-media+bounces-31496-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C96F0AA5F61
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 15:43:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E5EEE4C20EA
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 13:43:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11FE11C860F;
	Thu,  1 May 2025 13:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KV9+BSSM"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AA519C578
	for <linux-media@vger.kernel.org>; Thu,  1 May 2025 13:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746107017; cv=none; b=c/bU9wAsmbAu9YjfJSMsnW3M6fRWh100wLps6ill3K96dmlBFj+Znvh3x6oQ5LYa+oVipuTNd6k00tSfNKVIHykM+waPbU3pHUsImMwqilH8pY38qZQPc1oMKQbYR3eGwxTojlWQj1UHWB386dbDcH7OPYSTJecCRsuB1IntNaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746107017; c=relaxed/simple;
	bh=Fa2PhoeYrbUvAOt+pPzg2JTaXnbGV2tj86aOLwH/zkk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QenifgloyyXMJuRJpNAx7GI8c63Sej1292PWHl7cXzev64vaUzk+gpLc8wYzYBOZdaCZUP49LqJxPLL0CyyMiAqd3cmlUg3NGlhzpAvQdjN8fsgErnIHbkNtYYk/VjSa5p2ZMu2TcREUXQ1Bx9hRLuJP0Vz0Po33YP71HDlOb5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KV9+BSSM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746107013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=y2+kgPk/x9p8cKJuaNW3c2CfFJxJ6WS+0MPbmsMLbT0=;
	b=KV9+BSSMhjXMx+fqX/TBDYRTr9iVCJFVR4Aj8FLAuqh0KmwcagLkyPN99CTAQ7a26p4qgj
	caPkd03/OpzNmhn9b+Q5yNTaPG4reS0CxFjKszII1DYC8r2WaA8iYnekNj7iaGodW8JnWx
	CUpCPtOMCup0sIDmlbMk0mlU4eC7AqQ=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-192-HAjggSzIOiuOtwZp-Tnbgw-1; Thu,
 01 May 2025 09:43:27 -0400
X-MC-Unique: HAjggSzIOiuOtwZp-Tnbgw-1
X-Mimecast-MFC-AGG-ID: HAjggSzIOiuOtwZp-Tnbgw_1746107004
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 677391956087;
	Thu,  1 May 2025 13:43:24 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.44.32.142])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 232C21955F24;
	Thu,  1 May 2025 13:43:21 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 0/4] media: atomisp: Add support for using mainline mt9m114 driver
Date: Thu,  1 May 2025 15:43:08 +0200
Message-ID: <20250501134312.104711-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Hi All,

This patch series adds support to use the "mainline"
drivers/media/i2c/mt9m114.c driver, allowing us to drop the atomisp
specific atomisp-mt9m114 driver.

I've things working nicely on a Asus T100TA and I'll also post a series
with some small, necessary, mainline mt9m114 driver changes soon.

Despite the mainline mt9m114 driver changes not having landed yet this
series does already drop the atomisp-mt9m114 driver, in its current state
it is not really useful anyway and spending time on fixing it up is not
productive since we want to switch to the mainline driver ASAP.

Regards,

Hans


Hans de Goede (4):
  media: atomisp: Rename camera to sensor
  media: atomisp: Avoid deadlock with sensor subdevs with state_lock set
  media: atomisp: Add support for sensors with a separate ISP
    v4l2_subdev
  media: atomisp: Remove atomisp-mt9m114 driver

 drivers/staging/media/atomisp/i2c/Kconfig     |   12 -
 drivers/staging/media/atomisp/i2c/Makefile    |    1 -
 .../media/atomisp/i2c/atomisp-mt9m114.c       | 1612 ---------------
 drivers/staging/media/atomisp/i2c/mt9m114.h   | 1768 -----------------
 .../staging/media/atomisp/pci/atomisp_cmd.c   |   58 +-
 .../media/atomisp/pci/atomisp_compat_css20.c  |    2 +-
 .../staging/media/atomisp/pci/atomisp_csi2.c  |    2 +-
 .../media/atomisp/pci/atomisp_internal.h      |   10 +-
 .../staging/media/atomisp/pci/atomisp_ioctl.c |   30 +-
 .../staging/media/atomisp/pci/atomisp_v4l2.c  |   60 +-
 10 files changed, 112 insertions(+), 3443 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
 delete mode 100644 drivers/staging/media/atomisp/i2c/mt9m114.h


base-commit: 543f81b86cf4046c7454a05c741c491a4fac44dd
-- 
2.49.0


