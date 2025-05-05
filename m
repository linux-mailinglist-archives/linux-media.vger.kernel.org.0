Return-Path: <linux-media+bounces-31732-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BF6AA9DAC
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 23:00:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DFE4E17F071
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 21:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0B182701D9;
	Mon,  5 May 2025 21:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aNuLM8F7"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FEA26F464
	for <linux-media@vger.kernel.org>; Mon,  5 May 2025 21:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746478827; cv=none; b=WqKhLqgP/to8GECUeh7riybpcIiN7UZNrLPNfxyi39uNC3wtLVFi7k3oFKyi3v7DtZC0xcroMpyxKd2HSkl99EdfVubdgH/OeSwZ3BXynkBPN1Ce6MmTjxisJtrK++2LA19KWmkG/TTmnm5v84uBfqVDeEsFcCEkOYCpd8FrVpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746478827; c=relaxed/simple;
	bh=heYGpo0l+cVcEtuZ17qfUwen5eh63XX5fvoKewwSW5w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V5knDTbvychEcXZgyQ9yzztWn5RHLMu3KbRL+pH5Y5cHo81eelL9rwPrLPlyGP2qjZMLfUACdATjEnZp0FuO+u9F6eDJzqMJX9HMKjpJseb9ySytWY69f4ufcm+dQcHSpUxED8NcdEh4upIA7+FqcIyk3DPKAL2gdlBShmzCVXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aNuLM8F7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746478824;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OUWn1B7q5KlU5PNzEKLQMCbAK8xZun5A/8Zh2b4wD8s=;
	b=aNuLM8F74qtbyfJlNKpkBWHIRDJJ51mms7BgH17iRpcWeQLzGayQrP2RkrD0rTYSdhrd+s
	cMv+DDk9mC1SyMKDWrl5FqRiaPblFXy6V5b6ArWsbIU1FEokhmdBcsYhZMtOaiupa2fevi
	S0gMFzqyRdBgxgGNuaTZApK+wOYeaCM=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-642-TDpVrtdrNUqc__qrZgVxkg-1; Mon,
 05 May 2025 17:00:18 -0400
X-MC-Unique: TDpVrtdrNUqc__qrZgVxkg-1
X-Mimecast-MFC-AGG-ID: TDpVrtdrNUqc__qrZgVxkg_1746478817
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2CF8D180087A;
	Mon,  5 May 2025 21:00:17 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.45.224.24])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id AA660195608D;
	Mon,  5 May 2025 21:00:14 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 0/5] media: atomisp: stream start/stop error handling improvements
Date: Mon,  5 May 2025 23:00:03 +0200
Message-ID: <20250505210008.152659-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Hi All,

While working on the mt9m114 driver I introduced a problem where
the sensor's s_stream callback would fail, which turned out to be a good
test-case for the stream start/stop error handling in the atomisp driver.

This series is the result of fixing various error-handling issues which
popped up using this (and other) test-cases.

Regards,

Hans


Hans de Goede (5):
  media: atomisp: Move atomisp_stop_streaming() above
    atomisp_start_streaming()
  media: atomisp: Properly stop the ISP stream on sensor streamon errors
  media: atomisp: Stop pipeline on atomisp_css_start() failure
  media: atomisp: Always free MIPI / CSI-receiver buffers from
    ia_css_uninit()
  media: atomisp: Fix "stop stream timeout." error

 .../media/atomisp/pci/atomisp_compat_css20.c  |   2 +-
 .../staging/media/atomisp/pci/atomisp_fops.c  |   5 +-
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 129 ++++++++----------
 .../media/atomisp/pci/atomisp_subdev.h        |   3 -
 .../staging/media/atomisp/pci/ia_css_pipe.h   |   2 -
 .../pipeline/interface/ia_css_pipeline.h      |   1 -
 .../pci/runtime/pipeline/src/pipeline.c       |   2 -
 drivers/staging/media/atomisp/pci/sh_css.c    |  27 ----
 .../staging/media/atomisp/pci/sh_css_mipi.c   |  11 --
 .../staging/media/atomisp/pci/sh_css_mipi.h   |   2 -
 10 files changed, 62 insertions(+), 122 deletions(-)

-- 
2.49.0


