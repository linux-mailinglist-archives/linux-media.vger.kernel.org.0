Return-Path: <linux-media+bounces-28726-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC8AA7067E
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 17:16:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EBFB01634D5
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 16:14:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7284925D8E8;
	Tue, 25 Mar 2025 16:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y5U72Cnp"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CED025A351
	for <linux-media@vger.kernel.org>; Tue, 25 Mar 2025 16:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742919252; cv=none; b=bvmT8Ec0Zpm47Q0EscN4AarifK4jRfEBQ4lnxH3zv84RMmMyrRfOXwVBXM51w8LzldL1lYXxXqj52jVg7YA3VTRRganDfHdDSE1MIPdCKM25cRfjIGf1iIwAFe+quOtDgHhKQmRwzaV/0VT/w4B9ykTbfgGgl19429lqF0ykd1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742919252; c=relaxed/simple;
	bh=X4fLaiEfQCIm2PSn/YWEi92HKYjJ2iM17SBkJ8IpL/M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QNaNzgd3SOJe4gkNfra3SFrBCS8QD3xDdh2W8FCPmOhhAy+vjLN4UEjMj/QWPkQxw3VfqwbBAbDdQeDv2YbgR2B2BN4XL0qI/+40n7A/uIXHLYrTuYmu0vRw4axMeDlQK9B4oU0f69fj/KkOcRYiQqcljjKFz/l/ytZbhfzCaaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y5U72Cnp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742919250;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=H/EsX8uTQNO6K3/yNjPPo3yfThFUcxiCC8Iu923/z80=;
	b=Y5U72CnpMPn/i2WBtznmDNvOfV3z26Ke3dE2V1EW8b9P707RB/nWTwQLz8zIjF/O52namc
	kzQU0fEwBcAWcOdhSWAL6n4isyPSx74ZbVJziUxx+XeP84b1z94vh+i8GduIvW6ShXDvOF
	cw7TRaaCkbubbuCtkfeAkWm+G/XfNv8=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-178-Wu0QKsuKORSWeL6a-sQvrw-1; Tue,
 25 Mar 2025 12:14:04 -0400
X-MC-Unique: Wu0QKsuKORSWeL6a-sQvrw-1
X-Mimecast-MFC-AGG-ID: Wu0QKsuKORSWeL6a-sQvrw_1742919243
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6E4B6187DB94;
	Tue, 25 Mar 2025 16:13:50 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.44.32.136])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2DA9A180A802;
	Tue, 25 Mar 2025 16:13:46 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Dan Scally <djrscally@gmail.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hao Yao <hao.yao@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH 0/8] platform/x86: int3472: Add handshake pin support
Date: Tue, 25 Mar 2025 17:13:32 +0100
Message-ID: <20250325161340.342192-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

New Intel Meteor Lake based laptops with IPU6 cameras have a new type 0x12
pin defined in the INT3472 sensor companion device which describes
the sensor's GPIOs.

This pin is primarily used on designs with a Lattice FPGA chip which is
capable of running the sensor independently of the main CPU for features
like presence detection. This pin needs to be driven high to make the FPGA
run the power-on sequence of the sensor. After driving the pin high
the FPGA "firmware" needs 25ms to comlpete the power-on sequence.

This series implements support for this by modelling the handshake GPIO
as a GPIO driven 'dvdd' regulator with an enable-time of 25 ms, also see:

https://lore.kernel.org/platform-driver-x86/59f672c3-6d87-4ec7-9b7f-f44fe2cce934@redhat.com/

Patch   1   Is an unrelated cleanup which I had lying around
Patches 2-7 Prepare + Implement the handshake GPIO
Patch   8   Is a small patch adding some extra debugging to GPIO remapping

This series applies on top of pdx86/for-next, for testing with 6.14 this
patch needs to be cherry-picked first:
https://web.git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/commit/?id=81b251c66bdfe263fb5e7a16838512ddaeed77df

Regards,

Hans


Hans de Goede (8):
  platform/x86: int3472: Add skl_int3472_register_clock() helper
  platform/x86: int3472: Stop setting a supply-name for GPIO regulators
  platform/x86: int3472: Drop unused gpio field from struct
    int3472_gpio_regulator
  platform/x86: int3472: Rework AVDD second sensor quirk handling
  platform/x86: int3472: Make regulator supply name configurable
  platform/x86: int3472: Prepare for registering more then 1 GPIO
    regulator
  platform/x86: int3472: Add handshake pin support
  platform/x86: int3472: Debug log when remapping pins

 drivers/platform/x86/intel/int3472/Makefile   |   3 +-
 .../x86/intel/int3472/clk_and_regulator.c     | 163 ++++++------------
 drivers/platform/x86/intel/int3472/common.h   |  45 +++--
 drivers/platform/x86/intel/int3472/discrete.c |  37 +++-
 .../x86/intel/int3472/discrete_quirks.c       |  22 +++
 5 files changed, 139 insertions(+), 131 deletions(-)
 create mode 100644 drivers/platform/x86/intel/int3472/discrete_quirks.c

-- 
2.49.0


