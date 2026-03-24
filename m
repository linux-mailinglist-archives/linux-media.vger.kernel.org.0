Return-Path: <linux-media+bounces-56918-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPNEL+IFw2lKnwQAu9opvQ
	(envelope-from <linux-media+bounces-56918-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 22:45:06 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2008231CF94
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 22:45:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 835CB316A874
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 21:42:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15989361DC9;
	Tue, 24 Mar 2026 21:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IX46Ptnf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52AF236166A
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 21:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774388525; cv=none; b=jGoDqVIAWJKD/leGAxLTAlulnSOg9Vc+Aq1wKIsJiL6RS6cwilKiZwUc/kg6EPsBOzQlYkdCJc5m6FX6dB/uC3AeFyLexhlhCROsJukgz6e//J9pjLqf6ysdfE6O2b0Es6SXPetscmwq4cimI7oDxH3HspXsiOGWNYMVJd7OrJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774388525; c=relaxed/simple;
	bh=d8nRjqoDIwJbqKxF5GWzJrcsC0Ax6LqGNMy61f3bzMo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nKIGH9siB4buLVZd+TyLM1F9ySP06pCJo4FdxxH7uXWbETRqKXDF0D7Cv38KVCCeYe0b2VT8uWiIw1QxHE3eKcj14jOswjqv6DLU11sTBd6GZNDYef92TNE11CoAbQmrfsFmKCTHTiXKfZGemMuS/dY8rJvUQiGaqULaaNikzNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IX46Ptnf; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2c0bb213b16so10433522eec.0
        for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 14:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774388523; x=1774993323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kZErExxVrhQfzXmsDYKwyIHQCAZOmsLcP7GeXuAtDUQ=;
        b=IX46PtnfT/g4zjjmKPUXwSkV+a4wLeY/+FRUqC6OoCH6VzWqP2+yH/sMZUXRzKBx7n
         p1rS1TJoMcGSUXnwbCnPDKJeQimJpJ5vVaFXvp2RGcPWmq1VK+89WLbsFY5UYrUYLRsU
         rx3NkHrErz3Fpt6FaSpj7QaSn9rct1w88YktHeoIR/nBfDWv+AQikob8qKQ+RIcGM7+6
         WyeLW45Ml0sH4wC8IrjUQ+qSMBhdjBK7Oh1Lx1nzGC6m1Bg3rYmeyQO7buOt+GAdq8FS
         dDriM4FIXo2f6TO/sWePY8N06K7wXM5aIf32wyHp3TFGZZW1x3HuLJd9VzUdZlFxF5jz
         hlfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774388523; x=1774993323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kZErExxVrhQfzXmsDYKwyIHQCAZOmsLcP7GeXuAtDUQ=;
        b=eVhFx9tG1nlQ7HXptHDoYNAeQ2nwZCj7hyJ+k6FRV1owSAx+io+/Xjw4T17J+JY/yT
         1W+Vkx/aKbbgd//b1bvZX7UAHFcAoamjbV+YqgS025eEPSS5Y2xEUp6VFabVJR8F9fQE
         PPtXygfBWsyAykQuMBNolawtu4aqjn4jkTP+l6zRF9y2+iHdRYBBhSki8YnG+Lj7H3RN
         gH4wJUoVz1fhGIbyGzc2XRBh7rUAiumzdMNigDxDzVno3AcgomDRSdfoFQdCk/kTWHY2
         X9hJCEg29ok7KtXFq/fNPhZk5TbIuaoafyb2yzDmUtHecgfcWQLFFog+uUdVmyAO6NZo
         2csg==
X-Gm-Message-State: AOJu0Yw9z4Gu2CHu7fQQYHN8edv2tuGhYx+Fizltt1i/IoPz+KqH8Xth
	6PWu7m2VNKJkpK7eLiGxMnv1RHdIjO/1wIeHQyyJIqU5T5fSj7Myhn2r
X-Gm-Gg: ATEYQzx+6C+H7g7BrDSqrTqDsN0SG0qaXV8OFEmB65rZZjPuX/JT/AUsfu9BVt2LHhZ
	tMTwOkNn+BAVOIBGRIuNLZFnm4d7THiK0VDBslvFphdWAAOPkfvpXdlCogNMRl7tTKY8EN1LS4P
	5+9vds8DzccHA/k26uFRdCjaHijssBnp9wz+qe8E+DLs2/nn6Wo65R7Hl2xzlT8rf7AwfRTOUJ6
	b0bAjuBJpIS0lpbbQheni20P0/XoZXEeCm1ETtdqi2RcaFLkKLtp/iiAarY+Cz9f3R6XNdoX33V
	ImXkz7sv+vewuxyZrW1MvtxffpUZwsOm4lm0gjNKkfmY/UInfRamyV7GSU9DLZoGKHRDb2G7kyB
	Qaax+t1CJ43b9GrYRZQHa19Ze3kRoV850iVagqtyD93OSaimFVolyPLfHkUnoUBH1yzvuaGv2q9
	G1pHc5MahgBIznQ8/U1HQG5WVXj2dmHtdZ
X-Received: by 2002:a05:7301:4e0b:b0:2c1:4b1d:a472 with SMTP id 5a478bee46e88-2c15d3fb1e1mr527524eec.29.1774388523085;
        Tue, 24 Mar 2026 14:42:03 -0700 (PDT)
Received: from TC-LAPTOP.lan ([209.76.64.37])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c1536aa870sm3284180eec.2.2026.03.24.14.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 14:42:02 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	lee@kernel.org,
	djrscally@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v2 0/5] Enable dual cameras on Dell Latitude 5285 2-in-1
Date: Tue, 24 Mar 2026 14:41:24 -0700
Message-ID: <20260324214129.17300-1-tchatard@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260320000937.9177-1-tchatard@gmail.com>
References: <20260320000937.9177-1-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,linux.intel.com,ideasonboard.com,rothemail.net];
	TAGGED_FROM(0.00)[bounces-56918-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tchatard@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2008231CF94
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Changes in v2:
- patch 2: split trailing statements in aml_parse_int() onto separate
  lines (checkpatch); add kernel-doc @param descriptions to
  aml_parse_int(), dell5285_gnvs_from_table(), and dell5285_gnvs_find()
  (kernel test robot); add Reported-by/Closes tags
- patch 3: wrap long lines in commit message (checkpatch)

The Dell Latitude 5285 2-in-1 has two cameras (OV5670 front, OV8858
rear) connected through a TPS68470 PMIC/clock/GPIO hub. All five patches
are required for a working system; each is self-contained and
bisect-safe.

Hardware topology
-----------------
  Front camera:  OV5670 (ACPI INT3479), I2C4 / INT3446
  Rear camera:   OV8858 (ACPI INT3477), I2C2 / i2c_designware.3
  PMIC:          TPS68470 (ACPI INT3472:05), addr 0x4D, on I2C2
  ISP:           Intel IPU3 (ipu3_cio2 + ipu3-imgu)

The OV8858 is daisy-chained behind the TPS68470 S_I2C passthrough port.
The TPS68470 VSIO regulator controls S_I2C_CTL (reg 0x43); marking it
always_on keeps the passthrough active from boot so OV8858 is reachable
on I2C2 at probe time.

Four problems must be fixed in combination:

patch 1/5 - intel_lpss: The BIOS claims the same MMIO region for both
  GEXP and INT3446 (I2C4). Without this quirk the kernel rejects INT3446
  as a resource conflict and the front camera's I2C bus never comes up.

patch 2/5 - GNVS fixup: With I2C4 available, ipu_bridge still does not
  create the front camera client because _DEP on INT3479 returns the
  root PCI bus instead of the INT3472 handle. Root cause: BIOS leaves
  GNVS fields C0TP, L0CL, L1CL at zero. Fix: scan DSDT/SSDTs for the
  GNVS OperationRegion at TPS68470 probe time and write 0x02 (19.2 MHz)
  into all three fields before ipu_bridge evaluates _DEP.

patch 3/5 - TPS68470 board data: No board data existed for this machine,
  so no PMIC regulators or GPIOs were configured for either sensor.

patch 4/5 - ipu-bridge: INT3477 (OV8858) was unknown to ipu_bridge, so
  it was skipped at CSI-2 enumeration.

patch 5/5 - ov8858 driver: No ACPI match for INT3477, and the driver did
  not request the vsio supply needed by the S_I2C passthrough.

Tested on Dell Latitude 5285 2-in-1, Ubuntu 25.10, kernel 6.17.0-19.
Both cameras appear in libcamera and are usable in applications.
Note: the IPU3 IMGU can only run one pipeline at a time, so front and
rear camera use is mutually exclusive.

Thierry Chatard (5):
  platform/x86: intel_lpss: add resource conflict quirk for Dell
    Latitude 5285
  platform/x86: int3472: tps68470: fix GNVS clock fields for Dell
    Latitude 5285
  platform/x86: int3472: tps68470: add board data for Dell Latitude 5285
  media: ipu-bridge: add sensor configuration for OV8858 (INT3477)
  media: ov8858: add ACPI device ID INT3477 and vsio power supply

 drivers/mfd/intel-lpss-acpi.c                 |  32 +++
 drivers/media/i2c/ov8858.c                    |  10 +-
 drivers/media/pci/intel/ipu-bridge.c          |   2 ++
 drivers/platform/x86/intel/int3472/tps68470.c | 201 ++++++++++++++++++
 .../x86/intel/int3472/tps68470_board_data.c   | 163 ++++++++++++++
 5 files changed, 407 insertions(+), 1 deletion(-)

base-commit: 6de23f81a4be5ee86a4df4fde0ca0c7bf67aecd1
--
2.51.0

