Return-Path: <linux-media+bounces-56425-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uIqfHZWQvGlU0gIAu9opvQ
	(envelope-from <linux-media+bounces-56425-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 01:11:01 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E77772D4639
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 01:11:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 100A830E6479
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 00:09:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8178034CDD;
	Fri, 20 Mar 2026 00:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B1Ax5rpy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C7727707
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 00:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773965395; cv=none; b=CRFHngpcIYz0GJ1GgfghGhYt32F1ydAg/HKNs/Ik043X0Yys96MxBPkWrMijOK5Jw3/ZzzWOXpGE50sQLP5C+IYMLxoudb/Yn7/CK0dWU1OXI1MsvfwA6tDssMerkLcSPfqMtQE8nqZ5Cp4tzRamY8fCUJMlv7BE9FAXpmJgqGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773965395; c=relaxed/simple;
	bh=hl5R1wSuFOIHerN8SJeEQSAJ9kXBeaQRyT3yG5kRwqY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VCznRv73aPp7TXSetWmiIJjTuAPOv+1iZIdNjgb0YfzzwnvMBCnvy+1hIxohs+NfTuRueQSvdDI+lDk4McIjP4xfun2mfHihNF5ndU4e/M6r2Tc0N12YHzc9lhaHc307WWEmCjS6l9gXhAQArIkEF/ltzy4A6OLbjNEzW0XMpKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B1Ax5rpy; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2c0bcd8f194so2138674eec.1
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 17:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773965393; x=1774570193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2kwwNcGSPXeBZpow/BgUByCuTFdk7AZ7r/FiRegFEZY=;
        b=B1Ax5rpyUeBlRINmzujNzJdmjctgK9MAYLbe/a8m+p1i3ea+wtkEUDLVG99KaCN0RP
         NBXjbea5nhMwGzW5Q9eYBe2iDgAPK+GARVdx1X7Xlmk6jhGglm5fRsUk0xlKv3o11+Td
         GQerxB221sUAc1EE3zkPqaqtizioXE88bFZen5YYqKn3k4yLbq2i9L4IzHK9TmH95/sN
         bnJUO4b2Ecs/TupVTGMJWg28wDOy/HZN6fPGVsczM8fsmvXyh0YudHQ1KWfG2HXoS3Fh
         jH55KmRnd8JhGuwv/jTTzKTgs7qTmQcumxBg7teD12ZyK9kUNgOXiJOAZApT5iv0NvM8
         T6qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773965393; x=1774570193;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2kwwNcGSPXeBZpow/BgUByCuTFdk7AZ7r/FiRegFEZY=;
        b=CnevKxJxLOShTRhcwS++dimMOT2hjNxA0IcM+Pa1zziqiXtQP3wbqPr7kVrxhM+9MC
         jgNqtWCMOwyYyWCYf7NP7Jdv9AP4oqlSdm51lKb2mflDHlRDXc8mkmoAa3zS0A2Pd4Hb
         FHHdB/KaAdzeqTJBxtFfPBIriP+utp4aYffg+pMXJMPhnf21pP1vvn3OMplgRoHnHzoa
         sY0VxD5mHuHpMvNMtMUK0Ak6RTA79Pm2BvR61WItwIS3RioqUb3AQENErMxehRTryZ9q
         VOKmIR66HdoiOoOrpUSjzLpEODsD1iGhjpc5Wu4mKd63cwVo0QEbWSWdS+zwWFUNCnZl
         Zzlw==
X-Gm-Message-State: AOJu0Ywqmbo2p1Yzkp+jAUYOFgP1th2WCW1vgSIAfT/+WMg0lzGuWjwc
	evUaEwZWLusZOBwk6M59aFTb6svWRFOIEY0AopERkroJsWLj23EM3Gpj
X-Gm-Gg: ATEYQzz+NLiqLyEenPamCvp3in/bJyuS2pNArr8DiBvtX7sHyeVZePVOSg2BwFF6xHb
	zYI2YtBOVB/rzwDfby5dSnGQS6hUVEWL2m7k9llhvEHzpe6Us7f7mD3Cuo48ZjcCXsKNJD4YdLc
	OHCte+sjnEFRkEYVPUFm5Lyki9aQ7V8POOvHh/hHygfLE0wzpZHz4EDvYBK6OZkkKA8SW1m0bH/
	2dhpDicobwBpR31rXGryZyNQVsG0a9R6uL6bcbCgEWeWW5SnPcU19qPz4f50fIx1BIflpoRmPh8
	4rBFSwvdWIfM5Yc+ih1w+Z/BtSNN/x+k1N8bvT38zFLcdETMBTYzDPg4JU48jexrzwz4GFiWQ6l
	A0TSh+/Ct2WLMylb/2HS1tdFM5rLw1xJ3n7nyUkmDtwwsHqFFNiCVvcQgwg3zwFiemaXrYIbWRW
	nMUVcytbJEAMNFYs/D+S8qFA==
X-Received: by 2002:a05:7301:e30:b0:2be:969:75f3 with SMTP id 5a478bee46e88-2c1097ae086mr557776eec.34.1773965392703;
        Thu, 19 Mar 2026 17:09:52 -0700 (PDT)
Received: from TC-LAPTOP.lan ([209.76.64.37])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b3253d0sm927960eec.29.2026.03.19.17.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 17:09:52 -0700 (PDT)
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
Subject: [PATCH 0/5] Enable dual cameras on Dell Latitude 5285 2-in-1
Date: Thu, 19 Mar 2026 17:09:28 -0700
Message-ID: <20260320000937.9177-1-tchatard@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56425-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,linux.intel.com,ideasonboard.com,rothemail.net];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tchatard@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.985];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E77772D4639
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Dell Latitude 5285 2-in-1 has two cameras:

  Front: OV5670 (ACPI INT3479, CSI-2 receiver 0)
  Back:  OV8858 (ACPI INT3477, CSI-2 receiver 1)

Neither camera works on a stock kernel.  This series fixes four
independent problems that must all be resolved for both cameras to
function.

Problem 1 — I2C4 host adapter missing (front camera only)

The BIOS ACPI table exposes both an ACPI GEXP device and the I2C4
controller (INT3446) claiming the same MMIO region.  The kernel
rejects INT3446 with a resource conflict and the I2C bus that
carries the OV5670 is never brought up.  Patch 1 adds a DMI quirk
to apply QUIRK_IGNORE_RESOURCE_CONFLICTS for INT3446 on this machine.

Problem 2 — ACPI _DEP returns wrong dependency (front camera only)

With the I2C bus available, the OV5670 device is still not created
by ipu_bridge because _DEP on INT3479 returns the root PCI bus
handle instead of the INT3472 (PMIC) handle.  Root cause: the BIOS
leaves three GNVS fields (C0TP, L0CL, L1CL) initialised to zero.
Patch 2 patches these bytes to 0x02 in the TPS68470 probe path,
before ipu_bridge evaluates _DEP, restoring the correct dependency
chain.

The GNVS physical address is discovered at run time by scanning the
raw AML of the DSDT (and any SSDTs) for the GNVS SystemMemory
OperationRegion definition.  The parsed address is then mapped with
acpi_os_map_memory(), which is safe because ACPI NVS memory is
reserved by the firmware and already mapped by the OS.  No
hard-coded physical addresses are used.

Problem 3 — No TPS68470 board data for this platform (both cameras)

The int3472 driver has no entry for the Dell 5285, so it does not
configure the PMIC regulators and GPIOs for either camera.  Patch 3
adds the full supply map and GPIO lookup tables for both sensors.

A key detail: the OV8858 sits behind the TPS68470 secondary I2C
passthrough (S_I2C_CTL, register 0x43), which is gated by the VSIO
regulator.  VSIO is therefore marked always_on so the passthrough
is active from PMIC probe time.

Problem 4 — OV8858 not supported (back camera only)

Two driver-level gaps remain after the platform is configured:
  - ipu_bridge does not know INT3477, so it skips the sensor when
    enumerating CSI-2 receivers (patch 4).
  - The ov8858 driver has no ACPI match entry for INT3477 and does
    not request the vsio supply that enables S_I2C_CTL (patch 5).

Testing
-------
Tested on a Dell Latitude 5285 2-in-1 running Ubuntu 25.10 with
kernel 6.17.0-19-generic.  After applying all five patches:

  $ cam -l
  Available cameras:
  1: Internal front camera (\_SB_.PCI0.LNK0)   [OV5670 / INT3479]
  2: Internal back camera  (\_SB_.PCI0.LNK1)   [OV8858 / INT3477]

Relevant kernel log:
  int3472-tps68470: Dell 5285 GNVS fix at 0xaae22000: C0TP=0x02 L0CL=0x00 L1CL=0x00 -> 0x02
  ipu3-cio2: Connected 2 cameras
  ov8858: regulators enabled (avdd=1 dvdd=1 dovdd=1 vsio=1)
  ov8858: Detected OV8858 sensor, revision 0xb2

Patches 1–3 touch platform/x86 and mfd drivers; patches 4–5 touch
media drivers.  All five patches are needed for a fully working
system, but each patch is self-contained and bisect-safe.

Thierry Chatard (5):
  platform/x86: intel_lpss: add resource conflict quirk for Dell Latitude 5285
  platform/x86: int3472: tps68470: fix GNVS clock fields for Dell Latitude 5285
  platform/x86: int3472: tps68470: add board data for Dell Latitude 5285
  media: ipu-bridge: add sensor configuration for OV8858 (INT3477)
  media: ov8858: add ACPI device ID INT3477 and vsio power supply

 .../x86/intel/int3472/tps68470_board_data.c   | 163 ++++++++++++++++++
 drivers/media/i2c/ov8858.c                    |  10 ++++++++-
 drivers/media/pci/intel/ipu-bridge.c          |   2 ++
 drivers/mfd/intel-lpss-acpi.c                 |  32 +++++++++++++++++++++++++++++++
 drivers/platform/x86/intel/int3472/tps68470.c | 179 ++++++++++++++++++
 5 files changed, 386 insertions(+), 1 deletion(-)

--
2.51.0


