Return-Path: <linux-media+bounces-30338-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B36A8B955
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 14:41:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CCF771892127
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 12:41:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D6681F94D;
	Wed, 16 Apr 2025 12:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XE6cEdaZ"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3174C17BD9
	for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 12:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744807256; cv=none; b=qbrWu4vWFnyMtlYQqA8sinJ6N4crpOwfBUr2TZX55/OYurIj2/u01kjtjIlhYxLxFOXwXpDXPzNaeIIsqIpUycu8W51dqRk50ZSLEKVf9038hE33/JhiXNnolSOUPgIqZlEAdMlARVC1W6dfchuJK/pAnUYgmb3/CtwzejoDxJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744807256; c=relaxed/simple;
	bh=V4kwix84RJdrGaFEOvKqRdtYLu8ZLhHBpC0zGfeMwXM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mnWd5RC0Hy68l9w2g4RpUjF9JON36AWuJwm0NbtRpG9l08MnEoDfERzeIMun6QhQcbA7MdAb9BaciHrm6XM7mFy9LAVqQMl22D6cfpkvSgeJa/rQTNM6/bnzHLByJOyMwEXnCSYeF9JA2vSUNV2eqpM6ogUS3s2aSol/EnY9v4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XE6cEdaZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744807251;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EbfYVpEetSnP26cnAsrl6iv/VKID1PFTcC19qdohLLU=;
	b=XE6cEdaZmuXLh9f/Kx3wv7WE68np1HxoURZi0ZkWy/A5dI3LkpEBwSjakYW96BOkPfCL72
	gdrSbR7MB5g17j/5hvZemLe6Tx1HfsZLcbDUW2QpBuUHBIvaFjRiRFzEPswFOJN8cX76kk
	syw22n00/BqVcJuPuUC+p/PaXxyd4Dg=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-483-dXES9PpWNVWXTpnuTc8zCQ-1; Wed,
 16 Apr 2025 08:40:50 -0400
X-MC-Unique: dXES9PpWNVWXTpnuTc8zCQ-1
X-Mimecast-MFC-AGG-ID: dXES9PpWNVWXTpnuTc8zCQ_1744807248
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3D572180056F;
	Wed, 16 Apr 2025 12:40:48 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.44.34.142])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6A5CF195608F;
	Wed, 16 Apr 2025 12:40:43 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Dan Scally <djrscally@gmail.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hao Yao <hao.yao@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Duane <duanek@chorus.net>,
	platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v3 0/9] platform/x86: int3472: Add handshake pin support
Date: Wed, 16 Apr 2025 14:40:28 +0200
Message-ID: <20250416124037.90508-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Hi All,

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
Patches 2-8 Prepare + Implement the handshake GPIO
Patch   9   Is a small patch adding some extra debugging to GPIO remapping

Changes in v3:
- Add Andy's Reviewed-by to a few more patches
- Some comment & commit-message tweaks
- Add comment explaining value of 12 in GPIO_REGULATOR_SUPPLY_MAP_COUNT
- Add a comment to int3472/common.h explaining where the 2 ms comes from
- s/n_regulators/n_regulator_gpios/

Changes in v2:
- Add Andy's Reviewed-by to patches 1-3
- Address Andy's review remarks on patch 5
- Add 2 Tested-by tags to patch 8/9

This series applies on top of Torvald's latest master, for testing with
6.14 this patch needs to be cherry-picked first:
https://web.git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/commit/?id=81b251c66bdfe263fb5e7a16838512ddaeed77df

Regards,

Hans


Hans de Goede (9):
  platform/x86: int3472: Add skl_int3472_register_clock() helper
  platform/x86: int3472: Stop setting a supply-name for GPIO regulators
  platform/x86: int3472: Drop unused gpio field from struct
    int3472_gpio_regulator
  platform/x86: int3472: Rework AVDD second sensor quirk handling
  platform/x86: int3472: Make regulator supply name configurable
  platform/x86: int3472: Avoid GPIO regulator spikes
  platform/x86: int3472: Prepare for registering more than 1 GPIO
    regulator
  platform/x86: int3472: Add handshake pin support
  platform/x86: int3472: Debug log when remapping pins

 drivers/platform/x86/intel/int3472/Makefile   |   3 +-
 .../x86/intel/int3472/clk_and_regulator.c     | 164 ++++++------------
 drivers/platform/x86/intel/int3472/common.h   |  57 ++++--
 drivers/platform/x86/intel/int3472/discrete.c |  39 ++++-
 .../x86/intel/int3472/discrete_quirks.c       |  22 +++
 5 files changed, 154 insertions(+), 131 deletions(-)
 create mode 100644 drivers/platform/x86/intel/int3472/discrete_quirks.c

-- 
2.49.0


