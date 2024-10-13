Return-Path: <linux-media+bounces-19511-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7B499BA21
	for <lists+linux-media@lfdr.de>; Sun, 13 Oct 2024 17:41:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E7B91C20ADD
	for <lists+linux-media@lfdr.de>; Sun, 13 Oct 2024 15:41:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB3511474B9;
	Sun, 13 Oct 2024 15:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hNyeuVnO"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12E8146D6A
	for <linux-media@vger.kernel.org>; Sun, 13 Oct 2024 15:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728834068; cv=none; b=Ou9OCfXnYrZybzdh1mSD2sjyH22rebIeWhjvXurY29rbbeWNu7fd8WsxXw7o9fWrtWV2q7f0vPrW27OqVM0Oeg69iXQa+QE4T/ZXFDCHDQt7czunoASNdhs0bVWbx/tc8DKvuYH6cydt5u01sK1P8tBL+Hz4etbd3+eTlm0y2PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728834068; c=relaxed/simple;
	bh=zVTuHMZQP3KbQj4Ww3QguRrmp2kgziWgJKdaJ4MFaIM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rW97MUP9mm2PFpVEXGEbMLL62LkA1ojkIDPHQ/yPKRF5bSQ3FWPN72DA5bKYyrXkQQis2mYErVTGPIidzaaZNsUCAeRBKe9QCBN1NYEb3sLKL6Gy7BBc+W6x65CwPnrCumbxwri5j+B+vGDp/v8H4SCYDp8nRXLlOUkQfGVKxU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hNyeuVnO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728834063;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oZIaPCQtLGHZndrLTFUOA2Mc9Rom1ioAkSUU56owIRQ=;
	b=hNyeuVnOFi+kmFen1dhc/NmzTqIaa1GZkkLrOCICdZP4iBQ2m5nOxXeM5ZqCOruQNb9UJO
	SCynfMTfXCAhSksUqYaVv16ZFtnik05Mk9UUK/eaEJek+T1Ymc7zXVRGv+kSSS1kI54gIC
	POeoEM1Vr/P4hqd0G5Q805sYyRIYzPs=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-151-xgIj2i2BOmWFDK_F8ZKecA-1; Sun,
 13 Oct 2024 11:41:02 -0400
X-MC-Unique: xgIj2i2BOmWFDK_F8ZKecA-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B47DB19560A2;
	Sun, 13 Oct 2024 15:41:00 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.70])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 82EAE19560AA;
	Sun, 13 Oct 2024 15:40:57 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	Robert Mast <rn.mast@zonnet.nl>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 0/4] media: atomisp: mt9m114: Make it work on Asus T100TA
Date: Sun, 13 Oct 2024 17:40:52 +0200
Message-ID: <20241013154056.12532-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

Hi All,

Since there is some interest in getting the mt9m114 camera to work on
the Asus T100TA:

https://github.com/jfwells/linux-asus-t100ta/issues/4
https://lore.kernel.org/platform-driver-x86/e0c8c98f-64ec-4297-bbc8-de489414515c@zonnet.nl/

I have spend some time this weekend poking at this resulting in this
series which makes things work somewhat.

Note that for now this will only work if you modify the BIOS settings
to change the ISP to be listed as a PCI device in lspci:

00:03.0 Multimedia controller: Intel Corporation Atom Processor Z36xxx/Z37xxx Series Camera ISP (rev 09)

If you do not have this in lspci then things will not work. The BIOS
does not allow changing this setting from its menu, so we need to
use the grub setup_var_3 command form a patched grub.

Note this requires your Asus T100TA to be at the latest v314 BIOS version,
this has not been tested with other versions!

Download grubia32.efi from here:

https://fedorapeople.org/~jwrdegoede/grub-efi-setup_var/grubia32.efi

Boot this once and then run:

setup_var_3 6f

If the ISP is not visible in lspci this should show 01 as value
for the 0x6f offset.

Now change this to 2:

setup_var_3 6f 02

and then reboot. After this the ISP should be visible in lspci.

For more details on how this works see:
https://hansdegoede.dreamwidth.org/25589.html

Note this series is just a quick hack, the proper fix would be to get
the new drivers/media/i2c/mt9m114 standard v4l2 driver to work and
atomisp does support standard v4l2 drivers for a while now.

I plan to take a shot at this as time permits, hopefully sometime
within a month but no promises.

Regards,

Hans


Hans de Goede (4):
  media: atomisp: Fix WARN_ON() in vb2_start_streaming() triggering
  media: atomisp: mt9m114: Disable V4L2_CID_3A_LOCK control
  media: atomisp: mt9m114: Add missing mutex_init() call
  media: atomisp: mt9m114: Fix fmt->code not getting set on try_fmt

 drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c | 13 +++++++++----
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c   |  5 ++++-
 2 files changed, 13 insertions(+), 5 deletions(-)

-- 
2.47.0


