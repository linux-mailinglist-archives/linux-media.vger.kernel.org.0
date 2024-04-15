Return-Path: <linux-media+bounces-9320-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 489F68A4BAE
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 11:38:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DBA231F22A63
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 09:38:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87E16535AB;
	Mon, 15 Apr 2024 09:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Cip54ux/"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9719B4F61D
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 09:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713173842; cv=none; b=GYKwBxvtwP9FJp5PO0Fyu9zhhGAkfvABwRjGa6UA4fv/xQMYgL9OG2+Ee06He7y2XoN/Qi9DVzE5zp7+gVRuZdVKXeZ9BOGcnTjiZzCY/UPi2gsCiXHCaMcTmRRGdLSpRYuN+iXCkccNOcIOOjolnnj/fEw/mJUx478qZ5xEGks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713173842; c=relaxed/simple;
	bh=c1ZFYUFE4J5mxxQYlmoXiG3Ho8e/UCZMY09dyWDYOyM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XLhxDofEpmw9xMUnpW+3zzhTcoFVkD2RdcndOtmkAqbWIsRBdfOBMgPDDSWGVee0gDV60zRKkZfjfc652Fv00pzp92JLZRSpKeUQrT+ntqlOa2jnna8YJ2afsmVJirXQPihB1DKi1/etU6Hy4CmozZVsYkj4xKWPanUMDoTk4Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Cip54ux/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713173839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FtOfge+e5pq2XkBum53YS/Wmy3zk0rlLLV2WgqhBLis=;
	b=Cip54ux/s1E+vkYBpQ7Jonj1j5BUGMhP/C7s4RmufiAUYRgTPsKfBNVfIcSMGNN0KlpPy1
	zMM8k02+KnpeC/un1I81EySPAqxYg/VwOtbiEilSbCfjtN9/EhpzNGHQriLl1y8JmuAgrY
	4WvO2vVX8AcvC08TdXA3tx7U631DoSc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-519-JZtVVfZJO_6vlr9Mz4YNyg-1; Mon, 15 Apr 2024 05:37:16 -0400
X-MC-Unique: JZtVVfZJO_6vlr9Mz4YNyg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BA1661802CFF;
	Mon, 15 Apr 2024 09:37:15 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A5DE4C13FA1;
	Mon, 15 Apr 2024 09:37:14 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-media@vger.kernel.org
Subject: [PATCH resend 0/5] media: ov2680: Add all controls required by libcamera
Date: Mon, 15 Apr 2024 11:36:59 +0200
Message-ID: <20240415093704.208175-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8

Hi All,

Here is a resend of my patch-series to add all controls required by
libcamera to the ov2680 driver.

New in this resend is that all patches now have a:

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

So I believe that this is ready for merging now, please merge.

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
2.44.0


