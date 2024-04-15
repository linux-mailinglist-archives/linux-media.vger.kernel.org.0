Return-Path: <linux-media+bounces-9390-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DB98A5120
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 15:24:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8CBC286967
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 13:24:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C3137317C;
	Mon, 15 Apr 2024 13:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RMgt/fjW"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC5571B40
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 13:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713186656; cv=none; b=u81UvStyWtLK7CSdNkuw65eBjjyvhDEW/+Vj+P1tyjJWQelh5wTygHiND5kioXi10DN/O4o5E+ha7u53IAPzdUES4+nWKBpoz3JUehPk1kp7Fu1PHiqrPr7jNBXmWN0IenzVB/T+5VDHezSROpDjtF8PWVH0kBSScmMGDm4eW2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713186656; c=relaxed/simple;
	bh=63D//pC1CuhTYcjB4YaWp9vz8P/MKBtVN+ytHgn5nkg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QuNpcDXq/CK7DTE6/Kt9CG2Z2JzAU06cNmkbo7dCGH7b/rSIPAPFoXGifOxXeQajKbOmK5jFakrHmuNrri503wwf+6fCkKRqWgy+EKHjWdkaJD8eX3SAQhJ4gWUZzRusQS5VYBon0VkR71BVl3UYmILSf25Fljti8Tj8wx/Y84k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RMgt/fjW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713186653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5i5DAlw8zfaWKUhZI7IdToJDDHTd+Tx014FjF+cmK9k=;
	b=RMgt/fjWeAcKxDrJeXGuwTWKkV4VTPPRw+O7pNmIiVxJoItIWEpk0rddukfhq4qi7MCKuW
	Xo8zz30oo4nbFFwVA9BHyx32oXs9jBSg3wtnbxdDZroM002A1kcbSbuRq19V0WLaOTEc7c
	c6JsZSjq9MuxY0iXX7GdC+Xbb+ZPrEY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-325-kwp-0XGTP2Sz0CMphRbDjQ-1; Mon, 15 Apr 2024 09:10:52 -0400
X-MC-Unique: kwp-0XGTP2Sz0CMphRbDjQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DAE85881E67;
	Mon, 15 Apr 2024 13:10:51 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E15F751EF;
	Mon, 15 Apr 2024 13:10:50 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v2 0/4] media: hi556: Add reset / clk / regulator support
Date: Mon, 15 Apr 2024 15:10:34 +0200
Message-ID: <20240415131038.236660-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5

Hi All,

Here is v2 of my patch-series to make the hi556 driver work on x86_64
devices where the power-up / down sequence is not fully handled in ACPI
(as is done on chromebooks) but where instead the driver is expected
to do it itself.

Changes in v2:
- Parse endpoint immediately after getting it and then immediately call
  fwnode_handle_put(ep) to avoid leaking the endpoint fwnode on errors

This has been successfully tested on a "HP Spectre x360 13.5 (2023)":
https://github.com/intel/ipu6-drivers/issues/202

Regards,

Hans


Hans de Goede (4):
  media: hi556: Return -EPROBE_DEFER if no endpoint is found
  media: hi556: Add support for reset GPIO
  media: hi556: Add support for external clock
  media: hi556: Add support for avdd regulator

 drivers/media/i2c/hi556.c | 105 +++++++++++++++++++++++++++++++++-----
 1 file changed, 93 insertions(+), 12 deletions(-)

-- 
2.44.0


