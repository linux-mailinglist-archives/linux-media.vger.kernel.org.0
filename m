Return-Path: <linux-media+bounces-23929-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2C69F94A9
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 15:41:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D2D716A788
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 14:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 031462185A7;
	Fri, 20 Dec 2024 14:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Vd//jdpZ"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A00204567
	for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 14:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734705708; cv=none; b=IjLdjfRLnxZYY6JqNk4oFLgLqVGY+fd6Pb0Lxbk+taouYggqzZzZE88CWa1CeklMCJKHBqW0Hkvyh6rdb+mUmIURWmCHRPL99iSXH93KmZuWWG794QuvN6nXQvvRbOV8EtIEZJlx4WYxkGEkwWM8i2xCJn7zNiF8Fu9XkA3+t+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734705708; c=relaxed/simple;
	bh=mNa1HwmxrlSl2pOeGibgBiMRGuUtOZuZTeJvSxWjCLk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aP4k8ob+8PDfWFtlzpYmd1Y1lkHq10cNzfu/56NHHHk9Mj6AuIrFsALxNlz7ailpWpVK4MNOmxc+Lth1jwU98CFncnG2APkILzMswAf41BT6LcGvNpSMMH4lQz6dWOdgSC7gc5Z41NhCrXw+A1EscqFLJb4pQ/d8+mWwQVo5FpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Vd//jdpZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734705705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ESZH60p2NEdM8ZTtd7DUTRSi146jiO4I5WJ/5z+vO/g=;
	b=Vd//jdpZ0DLXvKv3QODRHGFYMf8UV2oxpFKj/pG1upsIKvom/SuAgoixHC3ZfpwisbF72G
	4NNmByDfybknylh3488TnShbiUACu/eJWdHVCrMIgxjyZOOidISi+JL3KsK+/CZ9cGoK0E
	Y90lkHsFTpqHtOkUue15/14H1tUpwQA=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-612-E4tS4yt5MeWzVK0eein-SQ-1; Fri,
 20 Dec 2024 09:41:42 -0500
X-MC-Unique: E4tS4yt5MeWzVK0eein-SQ-1
X-Mimecast-MFC-AGG-ID: E4tS4yt5MeWzVK0eein-SQ
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3705A195608C;
	Fri, 20 Dec 2024 14:41:41 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.74])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6059E19560AD;
	Fri, 20 Dec 2024 14:41:39 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jason Chen <jason.z.chen@intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH v2 00/10] media: ov08x40: Various improvements
Date: Fri, 20 Dec 2024 15:41:20 +0100
Message-ID: <20241220144130.66765-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

Hi All,

Here is v2 of my ov08x40 series with various ov08x40 improvements
aimed at getting the ov08x40 driver to work on x86_64/ACPI platforms.

Changes in v2:
- Fix the brownpaper bag bug swapping the suspend/resume arguments
  to the DEFINE_RUNTIME_DEV_PM_OPS() macro. Many thanks to Bryan for
  catching this
- Add Bryan's Tested-by to patches 1-8
- Add 2 logging improvement patches which I posted as follow up
  patches to v1, so these now can run through CI too

Here is v1 of the series:
https://lore.kernel.org/linux-media/20241219134940.15472-1-hdegoede@redhat.com/

Regards,

Hans


Hans de Goede (10):
  media: ov08x40: Properly turn sensor on/off when runtime-suspended
  media: ov08x40: Move fwnode_graph_get_next_endpoint() call up
  media: ov08x40: Get reset GPIO and regulators on ACPI platforms too
  media: ov08x40: Get clock on ACPI platforms too
  media: ov08x40: Move ov08x40_identify_module() function up
  media: ov08x40: Improve ov08x40_identify_module() error logging
  media: ov08x40: Improve ov08x40_[read|write]_reg() error returns
  media: ov08x40: Add missing ov08x40_identify_module() call on
    stream-start
  media: ov08x40: Add missing '\n' to ov08x40_check_hwcfg() error
    messages
  media: ov08x40: Don't log ov08x40_check_hwcfg() errors twice

 drivers/media/i2c/ov08x40.c | 185 ++++++++++++++++++------------------
 1 file changed, 95 insertions(+), 90 deletions(-)

-- 
2.47.1


