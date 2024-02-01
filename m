Return-Path: <linux-media+bounces-4573-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B5ED084630D
	for <lists+linux-media@lfdr.de>; Thu,  1 Feb 2024 22:59:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64B3628CAD6
	for <lists+linux-media@lfdr.de>; Thu,  1 Feb 2024 21:59:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C041405FC;
	Thu,  1 Feb 2024 21:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EgnDh/T6"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED273FE36
	for <linux-media@vger.kernel.org>; Thu,  1 Feb 2024 21:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706824757; cv=none; b=F5HIB3/crDbV2+j7oMoSqVEHX2a/mbvNPD62B/zoEq20JYAzUYJthysURt3fdBILCEbEkPrJxIsgBbgNG36E6zZBXsuolVgB627MjpRsITcq9xT2JGdFaPLZ99dyZFCizPBCRJ7Eko+s7tP0gXKIjBZS+/63B88Gv34wiUMpeiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706824757; c=relaxed/simple;
	bh=45QWWocBG80uVbVT2rnIaenZfrFRJC4/meWbYnIgT+E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oqPsqG1GdWB9xFNBIyd4IBgGnqZcpV3HVtEfNlsU1NhCrt4sVn0XNNcrIP3RDtekK8h6DcfvtGakyzWpZO9Dive4Y7Asm1TYb7FjgmqNZpMbiV73qLMWEwg4pl+06lydOr7fN7aKkgke8PxS0Zjx7Bx7vnUoE9eQ4h4mWheU6Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EgnDh/T6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706824754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tvuKyLwuFHpPvBFLZJQagwjg9xXJi6wjzQ82Y2AeSCU=;
	b=EgnDh/T6huX+e2ttX4C9V1nh5267yrG23VAmY1q5EmXwNZJ9kegyTaF1sJ9P06div28dx0
	b8FIiNUVMH3K+iUNWdEd5bL8ICkg5Ugog8PKrYE6LR37RWV/n/SSlCGDVwQ81971P5ASCp
	vy4fKCBpyBh+1ifEnsk7rzfFliPLYzo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-syMPkkLIMjeFvF0IVfeSSg-1; Thu, 01 Feb 2024 16:59:11 -0500
X-MC-Unique: syMPkkLIMjeFvF0IVfeSSg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 49AA1185A782;
	Thu,  1 Feb 2024 21:59:11 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.90])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6CD3A3C2E;
	Thu,  1 Feb 2024 21:59:10 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	linux-media@vger.kernel.org
Subject: [PATCH 0/4] media: hi556: Add reset / clk / regulator support
Date: Thu,  1 Feb 2024 22:58:37 +0100
Message-ID: <20240201215841.153499-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1

Hi All,

This series makes the hi556 driver work on x86_64 devices where
the power-up / down sequence is not fully handled in ACPI (as
is done on chromebooks) but where instead the driver is expected
to do it itself

This has been successfully tested on a "HP Spectre x360 13.5 (2023)":
https://github.com/intel/ipu6-drivers/issues/202

Regards,

Hans


Hans de Goede (4):
  media: hi556: Return -EPROBE_DEFER if no endpoint is found
  media: hi556: Add support for reset GPIO
  media: hi556: Add support for external clock
  media: hi556: Add support for avdd regulator

 drivers/media/i2c/hi556.c | 95 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 88 insertions(+), 7 deletions(-)

-- 
2.43.0


