Return-Path: <linux-media+bounces-31660-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F40AAA85D1
	for <lists+linux-media@lfdr.de>; Sun,  4 May 2025 12:13:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9A0E189AD05
	for <lists+linux-media@lfdr.de>; Sun,  4 May 2025 10:14:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 413D319D8B2;
	Sun,  4 May 2025 10:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KVEma6h0"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D546FC13D
	for <linux-media@vger.kernel.org>; Sun,  4 May 2025 10:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746353627; cv=none; b=IRmilTsmonabSTfpLnujfSygRW+zS3//cSneX2H4NpGiFgTlr8c4pjkcO+HMfDdSa9j9Zz+5fFFzXcn/onBAutPXQGk8zMtZr5GtiH0k9to2EK5D3LDfXN2FIXGkv58Sf7DqkTv5KAK5pl/WRJ1tLo3MBxlfvOtQhFWSH4SUZQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746353627; c=relaxed/simple;
	bh=qBFwJV9+54J1ULvxVTu1VhV72jaRtY/FvBWB66U74k4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dDvwMloO+v2lD/NG544bqtvEmxaSmfB9sbRXndQulOTFZJyo2VXHRphKlm6q8h92ehsi+30AFK7Cca6OfK011SBvz1NKypOVt4RtVv/k9of7w0Ul8YtBxyn+HRcQLNvlZxxXYimLm+e+8u4+e/12J6KPDAE7VViCftHmZnEZsDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KVEma6h0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746353624;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5e+KdWopDKGrQ9PY+dg5imanFsLP5XlEqi83iIw5d8g=;
	b=KVEma6h0nZfqkFqhkMmKjr0cecEecBjF935khhhhNQEdoQ6L9u0MojOBHm1+SUW2XtHmNU
	gJ/+i8nJXSib8VAPNBIfiWUKEZqXLDI4MK59USNd23VWLmtYGFkxqaaakhaUaEAMwh3qpa
	on/jggLjaWeH/EJ3N5GAplOspBZUfr0=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-623-iXYlBuJ0NvOvqFsbZ3OSlw-1; Sun,
 04 May 2025 06:13:41 -0400
X-MC-Unique: iXYlBuJ0NvOvqFsbZ3OSlw-1
X-Mimecast-MFC-AGG-ID: iXYlBuJ0NvOvqFsbZ3OSlw_1746353620
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4EF3D19560AB;
	Sun,  4 May 2025 10:13:40 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.45.224.28])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 11BBC1800352;
	Sun,  4 May 2025 10:13:37 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathis Foerst <mathis.foerst@mt.com>,
	linux-media@vger.kernel.org
Subject: [PATCH 00/13] media: mt9m114: Changes to make it work with atomisp devices
Date: Sun,  4 May 2025 12:13:21 +0200
Message-ID: <20250504101336.18748-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Hi All,

Here is a series of patches to make the "mainline" mt9m114 driver work
on devices with an atomisp CSI2 receiver / ISP. This has been tested on
an Asus T100TA.

This allows dropping the atomisp specific atomisp-mt9m114 driver from
drivers/staging.

Chances are there are conflicts here with Mathis':
"[PATCH v4 0/6] MT9M114 driver bugfix and improvements"
series.

I'll expect there be some review comments on this series anyways,
so merging Mathis' series first is fine, then I'll rebase this
series on top for v2.

Regards,

Hans


Hans de Goede (13):
  media: aptina-pll: Debug log p1 min and max values
  media: mt9m114: Add support for clock-frequency property
  media: mt9m114: Use aptina-PLL helper to get PLL values
  media: mt9m114: Lower minimum vblank value
  media: mt9m114: Fix default hblank and vblank values
  media: mt9m114: Tweak default hblank and vblank for more accurate fps
  media: mt9m114: Update hblank and vblank defaults on pixel-array
    format changes
  media: mt9m114: Avoid a reset low spike during probe()
  media: mt9m114: Put sensor in reset on power-down
  media: mt9m114: Fix scaler bypass mode
  media: mt9m114: Drop start-, stop-streaming sequence from initialize
  media: mt9m114: Return -EPROBE_DEFER if no endpoint is found
  media: mt9m114: Add ACPI enumeration support

 drivers/media/i2c/aptina-pll.c |   2 +
 drivers/media/i2c/mt9m114.c    | 167 ++++++++++++++++++++++++---------
 2 files changed, 125 insertions(+), 44 deletions(-)

-- 
2.49.0


