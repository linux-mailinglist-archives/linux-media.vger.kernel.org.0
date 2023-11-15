Return-Path: <linux-media+bounces-367-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 071107EC287
	for <lists+linux-media@lfdr.de>; Wed, 15 Nov 2023 13:38:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B43F0281487
	for <lists+linux-media@lfdr.de>; Wed, 15 Nov 2023 12:38:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3773318053;
	Wed, 15 Nov 2023 12:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A3PIeiB+"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4457F1EB35
	for <linux-media@vger.kernel.org>; Wed, 15 Nov 2023 12:38:32 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2753AC8
	for <linux-media@vger.kernel.org>; Wed, 15 Nov 2023 04:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700051910;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Gerb354guZ6Hgg18Ujg20LrrXmMt/fWa/MZpQsozpCc=;
	b=A3PIeiB+BBJ8I3YSYtou+L5bg3Y76KZj9LapOBodMM8k/tJna9xSuLT7Y7ECZe4rk1FSod
	441rtgZLW+4srcrMc/WAC5VZKHRtu09brVNTwx9gaeQ5Fx03fSpYaEhQ72JpNQmlmj+I1F
	HoAkJPlTYUI/hEmJ/PPAlHPiWijnEeA=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-228-DU7x6w-ZMu2nIBL95MmoFw-1; Wed,
 15 Nov 2023 07:38:27 -0500
X-MC-Unique: DU7x6w-ZMu2nIBL95MmoFw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 03D60382156D;
	Wed, 15 Nov 2023 12:38:27 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.210])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 09BFF5028;
	Wed, 15 Nov 2023 12:38:25 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	linux-media@vger.kernel.org
Subject: [PATCH 0/2] media: ov2740: Add support for reset GPIO and external clock
Date: Wed, 15 Nov 2023 13:38:15 +0100
Message-ID: <20231115123817.196252-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5

Hi All,

On some ACPI platforms, such as Chromebooks the ACPI methods to
change the power-state (_PS0 and _PS3) fully take care of powering
on/off the sensor.

On other ACPI platforms, such as e.g. various ThinkPad models with
IPU6 + ov2740 sensor, the sensor driver must control the reset GPIO
and the sensor's clock itself.

This series adds support for having the driver control
an optional reset GPIO and an optional external clock.

Regards,

Hans


Hans de Goede (2):
  media: ov2740: Add support for reset GPIO
  media: ov2740: Add support for external clock

 drivers/media/i2c/ov2740.c | 60 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 58 insertions(+), 2 deletions(-)

-- 
2.41.0


