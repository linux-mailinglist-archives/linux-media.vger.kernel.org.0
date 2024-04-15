Return-Path: <linux-media+bounces-9326-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 051AE8A4BBF
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 11:41:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B480C281E3F
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 09:41:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 069DC40BFE;
	Mon, 15 Apr 2024 09:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q9AOgY/H"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3246240856
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 09:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713174112; cv=none; b=WLx612I6Ju4w1NamnbuEd6ddVayNyaeSnqW8j11HAEEGD9HOKyEaZx603Z+IsERwWuHKyzJ0kz5EHlwkYDMqF9opmjqrGX0MQsW/uzwZfce6IlK1M6TV/G/bhu8H8Z4cCJmgxTiXcgr73Kl46M1PYrnR341KFKDiA98kEmkkEk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713174112; c=relaxed/simple;
	bh=+Whg0N5CPJDFWSpPbSNJyXERSm7/S0lUZzTAn3Dh/mo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AzPsuxhx/kWu4C5yMQWxb7JFFBy2cYtf6/i/tmTNI0LGJFine5a0vzWUr9GFARg8zpm8S2/knb52M/YrK+wULGUvzxwgcSodnX6jEZ74fCyIdW1fH5ej30Kv84tayNMNuFgImQwBWFDSIJEbeSDdWFyIvTfaAaBS9QSR+NKpnjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q9AOgY/H; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713174110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+joCRJStefc03h8GUw+RFMurbd3U0Kexe2ZLMwF66Zk=;
	b=Q9AOgY/HhXH/zdz/NvB7r7t+jlMAU9I/VpDzyb6Ib7dfnU7i9CHQTzG+Wr1ILZbxS74nUc
	DKW27ovPU8ijyvYPgnAhNAlqXN3x6/m12ngK09qnA63PeM+ChB7i/ULgzwp4/LaBwHl4+6
	nJ6hbEDIdrp2dPIWlpp75nQEgMR+s7I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-150-zGwce92PPMyv7uAfJWn6gA-1; Mon, 15 Apr 2024 05:41:46 -0400
X-MC-Unique: zGwce92PPMyv7uAfJWn6gA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D94E8007AD;
	Mon, 15 Apr 2024 09:41:46 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 90621492BC7;
	Mon, 15 Apr 2024 09:41:45 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-media@vger.kernel.org
Subject: [PATCH resend 0/4] media: hi556: Add reset / clk / regulator support
Date: Mon, 15 Apr 2024 11:41:29 +0200
Message-ID: <20240415094133.210580-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9

Hi All,

Because there have been 0 reactions to my original patch submission, here
is a resend of my patch-series to make the hi556 driver work on x86_64
devices where the power-up / down sequence is not fully handledin ACPI
(as is done on chromebooks) but where instead the driver is expected
to do it itself.

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
2.44.0


