Return-Path: <linux-media+bounces-28155-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F003A5FFA8
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 19:43:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C1AB717829B
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 18:43:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C68AA1EF0AE;
	Thu, 13 Mar 2025 18:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BjVAtnXx"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A169D77104
	for <linux-media@vger.kernel.org>; Thu, 13 Mar 2025 18:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741891407; cv=none; b=EPYr/TYUlHIRsML0deiM6xRNaD+u/WRXA/NK+31uA9ELNVMzZ7++gls3QWWaEV8yuffb6v/kie4dldA30iefhNEz0bqT2eRz2/oILt3m6R7rRmw9Yjgbkfc0Zt7V0w0xCHm7MArHOZItVrFGCoK2Pzql3jTkr4dGw/wxYqkCU6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741891407; c=relaxed/simple;
	bh=nlmZY7aQRWb2garKQ9P5eWzqdGvqSuIvdQfwMi8x3dw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L+j7GYe6mLGsFJaIkCt0JXx+D37TKdwBhcpQjxO0XorMzn0E3awcd2UuPdsPuADmdixiKLBc8Ge9PN6YbFNnUgEDabg3mU2X4zBNwfi+5s8engioz+uZGA0WoNwKzT2vv7CYYQ+vK3hk5JNVQGaNjKmTnn1y4mD1nEGv0YLuu+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BjVAtnXx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741891404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kgSrIP6Orz3VwOvezJ3hmDyaWZUmg34R4CAMFKLfFY0=;
	b=BjVAtnXxpi6eyrWvipVMdAT6kcFHk0SkN92os9aMyV8bAyTmQX6yjgJNYOrWIE2K/F0KYK
	s2rALLB2/jeP8Tf1TO+YwsDkzXTWJpfiIpwdcMEAYRE+Y8UGOCqbvxZbwoIqSmvchF6nNi
	G/GYyc3gU6Wp6J9EHqyuca289nWhDvE=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-214-8skCefVmO6ysJ92nfvPGcg-1; Thu,
 13 Mar 2025 14:43:21 -0400
X-MC-Unique: 8skCefVmO6ysJ92nfvPGcg-1
X-Mimecast-MFC-AGG-ID: 8skCefVmO6ysJ92nfvPGcg_1741891399
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4992A180AB1C;
	Thu, 13 Mar 2025 18:43:19 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.45.224.5])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E4D2B300376F;
	Thu, 13 Mar 2025 18:43:15 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Ingvar Hagelund <ingvar@redpill-linpro.com>,
	Joachim Reichel <joachim.reichel@posteo.de>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Hao Yao <hao.yao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH v8 00/14] media: i2c: Add Omnivision OV02C10 sensor driver
Date: Thu, 13 Mar 2025 19:43:00 +0100
Message-ID: <20250313184314.91410-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Hi All,

Here is v8 of the patch to upstream the OV02C10 sensor driver originally
writen by Intel which Heimir has been working on upstreaming.

At Heimir's request I've taken over the upstreaming process. This new
version addresses all the review remarks from Sakari, Bryan and Stanislaw,
thank you all for the reviews.

While working on fixing the review remarks I've also found and fixed /
improved a bunch of other things myself.

All in all there are quite a few changes, therefor I've chosen to send this
as a patch series. I understand this cannot be merged in this form, I'll
squash everything back together for v9. There are 2 reasons for sending
this v8 as a series:

1. I don't have hardware to test. I hope that others can test this soon,
   if things don't work the idea is that people can apply my cleanups
   1 by 1 and then we will know which change has broken things.

2. There are other sensor drivers from Intel at:
   https://github.com/intel/ipu6-drivers/tree/master/drivers/media/i2c/
   which likely need similar changes. Doing this as an incremental series
   is also intended to document all the cleanups which likely need to be
   applied to other Intel drivers too.

Note to reviewers there are some suboptimal things in this series wrt
adding things and then later removing them again, like e.g. the use of
guard(mutex)(&ov02c10->mutex). I did not bother to fix this since this
will all get squashed together in v9 anyways.

If it is easier for reviewing I can also (at request) post a v9 immediately
with everything squashed together. Even then I still believe this
admittedly weird v8 is useful for the reasons given above.

Regards,

Hans


Hans de Goede (13):
  media: ov02c10: merge shared register settings into a shared
    reg_sequence array
  media: ov02c10: Fix hts for 2 lane mode
  media: ov02c10: Fix vts_min for 2 lane mode
  media: ov02c10: link-freq-index and pixel-rate fixes
  media: ov02c10: ov02c10_check_hwcfg() improvements
  media: ov02c10: CCI usage fixes
  media: ov02c10: Make modes lane-count independent
  media: ov02c10: Drop handshake pin support
  media: ov02c10: ov02c10_get_pm_resources() fixes
  media: ov02c10: Switch to {enable,disable}_streams
  media: ov02c10: Drop system suspend and resume handlers
  media: ov02c10: Switch to using the sub-device state lock
  media: ov02c10: Use v4l2_subdev_get_fmt() as
    v4l2_subdev_pad_ops.get_fmt()

Heimir Thor Sverrisson (1):
  media: i2c: Add Omnivision OV02C10 sensor driver

 drivers/media/i2c/Kconfig   |   10 +
 drivers/media/i2c/Makefile  |    1 +
 drivers/media/i2c/ov02c10.c | 1012 +++++++++++++++++++++++++++++++++++
 3 files changed, 1023 insertions(+)
 create mode 100644 drivers/media/i2c/ov02c10.c

-- 
2.48.1


