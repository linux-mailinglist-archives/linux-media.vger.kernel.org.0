Return-Path: <linux-media+bounces-23788-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB129F7CAA
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 14:49:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8ED9F18924D3
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 13:49:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EE7A224AE2;
	Thu, 19 Dec 2024 13:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eAsR+jSp"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075F070816
	for <linux-media@vger.kernel.org>; Thu, 19 Dec 2024 13:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734616190; cv=none; b=WtmKa2eRg3AKscOJFt1XgPR16fj9qOnbL1Hjv8V5y/suUrR/J4HGgwBoK8nS2KKyImXJ6SE3uJcRmH250neeyfcuOmsIhu/wkKeAtSZeQnKmh/CCEyfK8J9pbB9FOqBwn1qLYHdb+/SAqKbp1zdvgcbK8mOrvuA5wUkEaIomIUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734616190; c=relaxed/simple;
	bh=ap5N26nifxVMNmTqKn/+MqCbiQWpc0sf0A6p6wm9s9s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hs2XLHuiHHE54yx73mGxOy8LTbyIMw9C3AugVOfO07BC2qFkevOZBEoDxcHIz6ed3uVGW7rPfZqBI/M8JbW3ZoGBfS4RDQ91OxfVTrnYybkJY9m8wkEE+1i+hRopWZZ/SE4tbenDi4lqk1eLgjh0+LvG9grf6cHbWBB6cn1NXB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eAsR+jSp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734616187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RiOicth7PshJAcsFSnS7CYdPvti/04yxVMfGsmPgARo=;
	b=eAsR+jSpzkPcxMJ4sBtTYmLgdD/xnuvSEtVvmceoPMu6spgFTYvOtNJKvCfA5Qie7EM84R
	skoKKZRPOkAuzH1jTJCsYcqP+6b3pVpECF+bSHXuZf0thxe8q5xtJJhBwfXRITm3SxM2K0
	XxmRzLzQuwRrNYNi2ufH9JN737aBQOk=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-170-dr-dm2mQNQe1XLpVvno-VA-1; Thu,
 19 Dec 2024 08:49:44 -0500
X-MC-Unique: dr-dm2mQNQe1XLpVvno-VA-1
X-Mimecast-MFC-AGG-ID: dr-dm2mQNQe1XLpVvno-VA
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 669801955D4B;
	Thu, 19 Dec 2024 13:49:43 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.60])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 97A9E1955F54;
	Thu, 19 Dec 2024 13:49:41 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jason Chen <jason.z.chen@intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 0/8] media: ov08x40: Various improvements
Date: Thu, 19 Dec 2024 14:49:32 +0100
Message-ID: <20241219134940.15472-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Hi All,

Here is a new ov08x40 patch series replacing my previous series:
https://lore.kernel.org/linux-media/20241012115236.53998-1-hdegoede@redhat.com/

I have not marked this as a v2 series since after rebasing on top
of Bryan O'Donoghue changes this essentially is a whole new series.

The below series has been tested on a HP Spectre x360 14-eu0xxx laptop,
but unfortunately the sensor will still not power-on (identify() fails
with -121) after this series.

Still I believe that these are all good improvements to have.

Bryan, can you test this on your ov08x40 setup and check that it does
not cause any regressions there?

Regards,

Hans


Hans de Goede (8):
  media: ov08x40: Properly turn sensor on/off when runtime-suspended
  media: ov08x40: Move fwnode_graph_get_next_endpoint() call up
  media: ov08x40: Get reset GPIO and regulators on ACPI platforms too
  media: ov08x40: Get clock on ACPI platforms too
  media: ov08x40: Move ov08x40_identify_module() function up
  media: ov08x40: Improve ov08x40_identify_module() error logging
  media: ov08x40: Improve ov08x40_[read|write]_reg() error returns
  media: ov08x40: Add missing ov08x40_identify_module() call on
    stream-start

 drivers/media/i2c/ov08x40.c | 157 +++++++++++++++++++-----------------
 1 file changed, 82 insertions(+), 75 deletions(-)

-- 
2.47.1


