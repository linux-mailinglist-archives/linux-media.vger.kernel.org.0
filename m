Return-Path: <linux-media+bounces-56600-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HfqEsOlvmlIVgMAu9opvQ
	(envelope-from <linux-media+bounces-56600-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 15:05:55 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AFD2E5AF9
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 15:05:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7FDD6300FC67
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 14:05:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 977F73876A1;
	Sat, 21 Mar 2026 14:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B5zceznP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D60D318BA8
	for <linux-media@vger.kernel.org>; Sat, 21 Mar 2026 14:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774101948; cv=pass; b=SN2CaTaC2UXL5udM9IV8DXjXVVqxk5gnxSJY22a2uEAq7G5fDrTgOTIprbVV8fFeBM8HNXmeloy3XPzSRECZnowoaBagQq3rWGih0TWkBDp0zbPxgQ60zAUTxKMA8brtV6pma3jxBXtnVyoDpNDvPu692udu7faZUn/AzCsHv70=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774101948; c=relaxed/simple;
	bh=gder0KOwfhBwR5ZPhqq+MpmsgMUntkf0GfMxSa8KxSI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=FyMlO8Mo4i5SalEqixrgxFzmqVJoBwKmdgpGwlcG/GEHuC/DvA9/5UFoV43KjUEdrIn5GGtJPrFF7Oiqzyx4lCkl759x9nHHyCEpd+6KgV+qzqMCWdhvqfB//qLp1hVpnl6tS/8W1vR46jlGSkNDPmXK7FKk1YIU9m3qxEWSIyw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B5zceznP; arc=pass smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-12732e6a123so2533926c88.1
        for <linux-media@vger.kernel.org>; Sat, 21 Mar 2026 07:05:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774101942; cv=none;
        d=google.com; s=arc-20240605;
        b=LRg2wyV+mKgyOVLD2CkUUTklFpRb0FLoiIdd2QHQstGQexNOocdoVLuvXicFgdALrN
         6eP8MfC+x2vB9jdIlxp1Cx4zcPgy4oH2xp5pELfabO935kP4IUQvNzangpmnKtaQPx/j
         bmjY0ibKJRKy+XSDzdgtdSaf6TdYkIAZ68GfC2BTLvM+ctjR8ZYNZP9v5okQom591StB
         mlEnqdjdtJG8xzee8fUyPeZJepjKerJOPTL1DR30elSGFPpbXZEHIdhi/UQxQQDpq7pt
         1pIQJuOBtd6MvhOxHhmYEGY5WeI3yOrdFcgVwMRJbllmxVNB0OqFvbXJY82DDI0r+ghI
         evyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=/RdzYopuqZ3GAhpN15xymUn4VHKgp/mMLXpkTQTkDAs=;
        fh=SU795pxvbz7te3NlCp9O6Omcw55DnlV0ZvdG7H1h/7A=;
        b=fb1956PkIQjXRCiOYeTjRLth4QfsiYQNJdacYL8uAStiNka0gtWjn/dGQBlpFbhULX
         sjL920DI/zikdepki1w+2D0R/UkJ3XlrxC1zs54YOn/gqhCmSf15Mj5VcCdFhp4wg650
         KtLPOMf4C6aT4Yq3Y5osKaUNXleHhdf3vaKQ8LSWvKMvbdEec2ft0kA3nnPFW90oFSSN
         XSy+WbBymTzxxDE+NuTvFMmXCRJY0fwRyQ9apujmNruRHbWxzE/Km9ayG9Qlfm0iVvq0
         tq9an8iwiqOtKU8VCQwg94g5GrN2dfPkbFFztFqtwHwzexNP2dmNovVpAymsbYWV9j0s
         J9tA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774101942; x=1774706742; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/RdzYopuqZ3GAhpN15xymUn4VHKgp/mMLXpkTQTkDAs=;
        b=B5zceznPX1b9gVcpMXIpx2PTvmsJY822xthC2CaDvoDnCsq6/iiI1h4mR3hm5Gp6WJ
         cP0+jufbkpE+ykpAkmFj6vaEvcTkckw9XiDYtiOhjqqVVXik1qEgE3/WmcpplUyhdmn/
         hNkCfIsE5afKn7/JmpuThxOVktGhrtbU5FPioo9C6CDD0S/uoYj7xva5YUV0whO5P5B6
         bRTuLUJIPVWhiZrCFXkdglODxBkqxlwL/FaCFTr7S7DQOyL2p/5ChoY3QZFktKD2dEEj
         iR6aVqoK9NfalFSEFjG49oErIlTC2MdIWLNCqUI35UqUdxrX4V2nMfuVcYrpbNkv1lne
         nvYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774101942; x=1774706742;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/RdzYopuqZ3GAhpN15xymUn4VHKgp/mMLXpkTQTkDAs=;
        b=SZD9jEljRy1OHEdqGs09oR43NKNqVt2cw5MV93WXkpccJHloxX+Y/iF+Df2x45Y4Z0
         MzDAK2Cr5+W7f7vG/H9CAgRs2ZJjVjXcRxeOGtLD7MozmUpnStEqx+nnKyTXOYJlIO7L
         lFS2vyZ+7oCss5UdR2ib/Rrssneu4WGTTGrKbx9YTkpWxUMsDpRbnK+n70CW0SnvAo54
         H0TWZxqyEcHrBoG7rXfEy8HcdD9HhkPlnrsaHghOmfYS9970SncuYHcXXQCSnN6IICek
         kdA9mld23g6Hpsd8MSl8SqBVoCfHFSacYlmGCqo+2pUzqf3qHzopdTmOCOLXSi6qTcaY
         IJkg==
X-Gm-Message-State: AOJu0YwncEVGOttKyx5VMwIzYoTH4AKCx/aKVN0LAKDtY4GSbofEMTM+
	O+/mcyj0qvTiDbB/4GnlQMKHVu0hXCk5EyvnXQL4UdpA2ZkNhEAR4018G1S+A1oJfeuvyE+mBjH
	FEEQNQp/SDtwGMU4+nDRg/uaQWqO43X0aB6PM
X-Gm-Gg: ATEYQzycsuU1m8VLYAQeMghzSmpi4i4HCg9KGVVgJF4FsBWAOCKuyJjZvqTwm4yaFRx
	P1hnHefSmGYIDxE1yAck8wcwFFccncPpEF+4Gg9dHOUFnjj/9ELgPsKJ7lUdm5mUw+kIYuilVXA
	4FZ1Mxk7gQwWPU51b3NpsBC+jDZrkvDxIWsZQ3yoyJzDuSlm3vcOxenGbeh0nUp22lBQamtW6Zn
	l4wvieTWpIcUoi0CyOsBk8Pm+U94QmPH8V8YAJUrh/9uFmVFqYbx74xpuHqi7EyJu6TKSSSuoQ0
	z9Tdh5fy
X-Received: by 2002:a05:7022:22b:b0:11b:ec5f:1c37 with SMTP id
 a92af1059eb24-12a72686c9dmr3728445c88.18.1774101942017; Sat, 21 Mar 2026
 07:05:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Filippo Veneri <filippo.veneri@gmail.com>
Date: Sat, 21 Mar 2026 15:05:31 +0100
X-Gm-Features: AaiRm51E8Rit7ARZiLNF_eJ-srcQCS1kmP_r2-zPDi4N1kJ2S_4EhACY5TObm6k
Message-ID: <CALfsO8jG4MUR7W0QrWZUSCkqUOQnpAGmB9GwgkTg9rhDEdjNuQ@mail.gmail.com>
Subject: [BUG] media: intel: ipu6/ivsc camera fails after hibernate on Dell
 Latitude 9430, stale INT343E software node (-EEXIST) Hello,
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@intel.com>
Cc: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56600-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[filippoveneri@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: A1AFD2E5AF9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

I would like to report a hibernate/resume issue affecting the
in-kernel Intel IPU6/IVSC camera stack on a Dell Latitude 9430.

System
------
Laptop: Dell Latitude 9430
BIOS: 1.37.0 (11/25/2025)
Distro: Arch Linux
Kernel: 6.19.8-arch1-1
Camera sensor: ov02c10
Userspace test: libcamera / qcam 0.7.0

Relevant kernel modules in use
------------------------------
intel_ipu6
intel_ipu6_isys
ivsc_csi
ivsc_ace
mei_vsc
mei_vsc_hw
ov02c10

I do not appear to have any out-of-tree IPU6/IVSC DKMS modules installed.
The only related package is:
  intel-ivsc-firmware r13.3377801-1

Problem summary
---------------
The camera works after a cold boot.

After resuming from hibernate, the camera no longer works. qcam reports:
  "No camera detected"

At that point, reloading the camera modules does not recover the device.
In the failing post-hibernate state, the kernel eventually reports duplicate
software-node registration for INT343E and the IPU/IVSC probe fails
with -EEXIST.

What I tested
-------------
1. After a fresh boot, the following unload/reload sequence works and the camera
   still works afterwards:

   sudo modprobe -rv -w 5000 intel_ipu6_isys intel_ipu6 ov02c10
ivsc_csi ivsc_ace mei_vsc mei_vsc_hw
   sudo modprobe -v mei_vsc_hw
   sudo modprobe -v mei_vsc
   sudo modprobe -v ivsc_ace
   sudo modprobe -v ivsc_csi
   sleep 1
   sudo modprobe -v intel_ipu6
   sudo modprobe -v intel_ipu6_isys
   sudo modprobe -v ov02c10

   So a normal runtime unload/reload after cold boot seems OK.

2. After hibernate resume, the same module reload sequence does not recover the
   camera.

3. I also tried removing/rescanning the IPU PCI device after hibernate:

   echo 1 | sudo tee /sys/bus/pci/devices/0000:00:05.0/remove
   sleep 1
   echo 1 | sudo tee /sys/bus/pci/rescan

   After that, I still get the duplicate INT343E software-node failure.

Observed logs
-------------
In the failing post-hibernate case I observed messages like:

  intel-ipu6 0000:00:05.0: IPU6 in non-secure mode
  vsc-tp spi-INTC1094:00: wakeup firmware failed ret: -110
  intel_vsc intel_vsc: silicon stepping version is 0:2
  ivsc_csi intel_vsc-92335fcf-3203-4472-af93-7b4453ac29da: mei-csi
probed without device fwnode!

After remove/rescan or reprobe in the broken state:

  sysfs: cannot create duplicate filename '/kernel/software_nodes/INT343E'
  kobject: kobject_add_internal failed for INT343E with -EEXIST, don't
try to register things with the same name in the same directory.
  intel-ipu6 0000:00:05.0: Failed to register the IPU HID node
  intel-ipu6 0000:00:05.0: error -EEXIST: IPU6 bridge init failed
  intel-ipu6 0000:00:05.0: probe with driver intel-ipu6 failed with error -17
  ivsc_csi intel_vsc-92335fcf-3203-4472-af93-7b4453ac29da: probe with
driver ivsc_csi failed with error -17

One failing journal excerpt:

  Mar 21 14:46:45 omega kernel: sysfs: cannot create duplicate
filename '/kernel/software_nodes/INT343E'
  Mar 21 14:46:45 omega kernel: ipu_bridge_init+0x152/0xe30 [ipu_bridge]
  Mar 21 14:46:45 omega kernel: ipu6_pci_probe+0x530/0xc40 [intel_ipu6]
  Mar 21 14:46:45 omega kernel: kobject: kobject_add_internal failed
for INT343E with -EEXIST, don't try to register things with the same
name in the same directory.
  Mar 21 14:46:45 omega kernel: intel-ipu6 0000:00:05.0: Failed to
register the IPU HID node
  Mar 21 14:46:45 omega kernel: intel-ipu6 0000:00:05.0: error
-EEXIST: IPU6 bridge init failed
  Mar 21 14:46:45 omega kernel: intel-ipu6 0000:00:05.0: probe with
driver intel-ipu6 failed with error -17
  Mar 21 14:47:12 omega kernel: sysfs: cannot create duplicate
filename '/kernel/software_nodes/INT343E'
  Mar 21 14:47:12 omega kernel: Workqueue: events mei_cl_bus_rescan_work [mei]
  Mar 21 14:47:12 omega kernel: ipu_bridge_init+0x152/0xe30 [ipu_bridge]
  Mar 21 14:47:12 omega kernel: mei_csi_probe+0x54/0x2f0 [ivsc_csi]
  Mar 21 14:47:12 omega kernel: mei_cl_device_probe+0x74/0xc0 [mei]
  Mar 21 14:47:12 omega kernel: mei_cl_bus_rescan_work+0x325/0x3e0 [mei]
  Mar 21 14:47:12 omega kernel: kobject: kobject_add_internal failed
for INT343E with -EEXIST, don't try to register things with the same
name in the same directory.
  Mar 21 14:47:12 omega kernel: pci 0000:00:05.0: Failed to register
the IPU HID node
  Mar 21 14:47:12 omega kernel: ivsc_csi
intel_vsc-92335fcf-3203-4472-af93-7b4453ac29da: probe with driver
ivsc_csi failed with error -17

Expected result
---------------
The camera should continue to work after hibernate resume, or at least recover
cleanly after reprobe/module reload.

Actual result
-------------
After hibernate resume, the camera is not detected. Subsequent reprobe/reload
attempts can fail with duplicate software-node registration for INT343E and
IPU/IVSC probe errors (-EEXIST / -17).

Notes
-----
Because a fresh-boot unload/reload works, this does not look like a generic
module dependency or early boot ordering problem. It appears to be specific to
the hibernate/resume path.

Please let me know if I should collect any additional logs, enable
dynamic debug,
or test a specific patch.

Thanks,
filippo veneri

