Return-Path: <linux-media+bounces-30440-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F12FA91A43
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 13:14:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 38EE517E1C3
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 11:14:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28E6C2376FC;
	Thu, 17 Apr 2025 11:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GQQlB98r"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D0E1E9B2C
	for <linux-media@vger.kernel.org>; Thu, 17 Apr 2025 11:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744888439; cv=none; b=dkNqm4cFUyEpCwrJOO2z3Ug6Z7Sa7siRxsy8k/fnvcUd6mIuujZhLSR3Zhb/Wqj8MhWYLjp1MYkbSr+OAX5Xmlds7oFhL7JR63k7IXWE/v/RZ2JWHKK5lyRzZDhkiU9vnWvwtd66T2mssbseyK/br4HZp50WF3IAmK7VhSouiY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744888439; c=relaxed/simple;
	bh=oXAe48222OVPSnh2Puk1LZqADaMcfHbIYCizGXvPwDg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XqI1jlLidaWaUBxlW1MW0S09H3IASfD3FzxBb1HU3fjcQ4xYnW7b2g84dXq83TUEg0VpB+wUF2mhq8ta7sy+RE1FrNHCBF79bFOijYdhzfVLUOKIO1pZ/ZvrAO0ABBIRqbf6vdfoi6wqJKdLHaAA/jOD8T+PZGcFCLwOzuB0Oho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GQQlB98r; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744888433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zsipBMVm71RwaCXZB/Cnrr8imY4FBOER2jZq0Smq+lE=;
	b=GQQlB98rwuQyk72WNmuUUWrrtlbmmTm4Z7kSDRgfvIPbsc1Dess/sLWegLb6y/To+ELiiF
	8WPIDnIbm14cPE5xIFffWFnnZFJoyqu1dimGURR9asAPYzkMxJ4SlxGjoVSZT1Pb5qDQEc
	LFVAJaNiABh7EHLctWwmCV0lXyph4RM=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-192-2cRNYBvbMGCI9nDuKMgjbQ-1; Thu,
 17 Apr 2025 07:13:50 -0400
X-MC-Unique: 2cRNYBvbMGCI9nDuKMgjbQ-1
X-Mimecast-MFC-AGG-ID: 2cRNYBvbMGCI9nDuKMgjbQ_1744888428
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2407E1956095;
	Thu, 17 Apr 2025 11:13:48 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.44.34.7])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 542F718002AD;
	Thu, 17 Apr 2025 11:13:43 +0000 (UTC)
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
Subject: [PATCH v4 0/9] platform/x86: int3472: Add handshake pin support
Date: Thu, 17 Apr 2025 13:13:28 +0200
Message-ID: <20250417111337.38142-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

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

Changes in v4:
- Add Andy's Reviewed-by to a few more patches
- At static_assert(GPIO_REGULATOR_SUPPLY_MAP_COUNT == 2) since the code
  assumes that
- Use unique error messages for power-enable vs handshake
  skl_int3472_register_regulator() failures
- Drop setting of constraints.enable_time. enable_time already gets set
  in struct regulator_desc (missed left-over from an older patch version)

Changes in v3:
- Add Andy's Reviewed-by to a few more patches
- Some comment & commit-message tweaks
- Add comment explaining value of 12 in GPIO_REGULATOR_NAME_LENGTH
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
 .../x86/intel/int3472/clk_and_regulator.c     | 167 ++++++------------
 drivers/platform/x86/intel/int3472/common.h   |  57 ++++--
 drivers/platform/x86/intel/int3472/discrete.c |  41 ++++-
 .../x86/intel/int3472/discrete_quirks.c       |  22 +++
 5 files changed, 158 insertions(+), 132 deletions(-)
 create mode 100644 drivers/platform/x86/intel/int3472/discrete_quirks.c

-- 
2.49.0


