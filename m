Return-Path: <linux-media+bounces-67567-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uhH8Ee8/VmrC2AAAu9opvQ
	(envelope-from <linux-media+bounces-67567-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 15:55:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A40AC75564B
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 15:55:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=EB2RsdUn;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67567-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67567-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C8DAD304B864
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 13:55:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90D4847B439;
	Tue, 14 Jul 2026 13:55:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D5A47A0AE
	for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 13:55:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784037336; cv=none; b=pjH/c9pTuIviBCEWddNl30fwfjj5mRt00I1IO2CuSaJokucVhOocYwieophjsYYsdEdaWbK0LrWfqvCvkbVzViXZRmABDNKOixCS4ml5WSzonAk3VFyaItsEYBB5q4PhEkfbOTe7ohTCSRjYuOT3pOJiZgAYXuEmdVZaDRDiAWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784037336; c=relaxed/simple;
	bh=P3qysX87QeXIBsdM7gaj9b0bB/06ZCq0HgXM1vDgKn4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J1JSTz9/qbIZGKT3cnHTllMWizVzLnYBG23QovHc+7tiDEw81ZnFTiKWHQGfhdjGieM2uOuzwk3OUYbC5XUiDgg71rhNYry4Mijd/QfrUPbfW6zC0A5DmuTElrbTkzlULNE8Rg5xSYQxG5bNGEydc+p5i2dUdnccVRjBYBZzryk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EB2RsdUn; arc=none smtp.client-ip=209.85.221.46
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47df440fcd5so2422184f8f.3
        for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 06:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784037332; x=1784642132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+JIukFjh0wd8SsV7ZDonyXXDChkpI+77plmkr974QFQ=;
        b=EB2RsdUnsHG3vZocJbRPE6sUGk2yyfMD6c4ad/SMxCrUChD3yyKnllqgKynl86rBDg
         ElKLHVGrO7VG+lZXN+BL9qUO4OaBwjFqGtFqTNBKmNfALhmrtGvjEySuaZegxdyPb1fe
         5FrPQEONBNRQ5k5mmkNRlRZ03Kqgl2Rdf6HWhvdW1XpfVQcSAk9PdFMMMcl+q7ZlwqjU
         sgpnrkeuwVrRYQVShS79LK1uT2J2wJhVshWoyYDiLOruMdVn0ZUqvyCN6TEeKL0L7yC+
         PawOLzEC8kS+w9iId8Nij64nDghocrAHAZzKA1btjMKfcvB+Snv35DkConlpSCR16os9
         D1Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784037332; x=1784642132;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+JIukFjh0wd8SsV7ZDonyXXDChkpI+77plmkr974QFQ=;
        b=OmjHDCBD5tNThRUDDgyuB4+vP3mpNttiCRbW6SCoN1me3JDZZorkdNRKnAXLhCqLiH
         Yj7/g4+dNAT+oW6pUjR+fl0llH7ZFwcbnM/W7Buflt2hyC9dByYj9nxVFN+rsEOtR1Iz
         yD3x3RI0Ai6cjzuuuMmT5s5d9SKW834WVMk5vbZlP1RRbsjCCYBqcCDPnXoQ1o1H959l
         sTyMtMybhvxnZcqG4XV6TxZ+RVPewdb1yviJj59Q9mn1UDb1QupBZCiRiVYxThPwgavZ
         CcD8TUkYvEni0XMPw1tCdOkJB60HIJaKfZeNSOOhKDtOOMG2/YK5cZPOL1as6Tf+SWC4
         n6iw==
X-Gm-Message-State: AOJu0YwjC8an58EqHMfezKEnZzAQHjvIPLelC4zFPY24PegR/4oYl6Lc
	XplxQWy/LDelhoJ7xKnx9AvVNvuuZREa3hbsce3LYBDRkgrUd0Q1i/5pur1yn2ga
X-Gm-Gg: AfdE7cmC25qKP21qCcy2q3geEy0msGGkes/ykcynjS8jQvIi6RtCXmbpeTG3OjvolUD
	Pjc5hjsQ9veTrX2jEXzbF/BG2+fv/Wb318n+PH2dHib6zbER4/8YwMHwnCiYaFjwFyI4h1N+2IW
	HaV2wKbi/XLQCXWDAt/R4pWrZGLSDa9Hgysg0pN/r6eVM2r1EHWlp/5tJKzy+dhLiTrVYSgMLHc
	y7x7J2N9LbTAjtQ0ve4njum/5v4SzBWDZO3xTrnaN5lS2MEcOummSnIhxvOKnOACIpFTqJ/42CX
	NYKoH8EzjAJ+yfgGLdx7Yym0xr5ToWQO30HsrXOucO5hk6ZbXJPqAVAqWbCPjUW+RK1toE/h6PE
	kTpPXMfEx1E1VFdSHDQH4qmiX8nucK0qWol4TEndhhBr7rmuNaKBqV28wJN0OGppPeXcQ3VfkOq
	s9ohFBap8re5T9Slo/NbyieiKY6+VWjOtC+ci0bQ==
X-Received: by 2002:a05:6000:4702:b0:473:1089:154f with SMTP id ffacd0b85a97d-47f2da506acmr15506056f8f.0.1784037332337;
        Tue, 14 Jul 2026 06:55:32 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:5d3a:fe75:c92c:e862:d851:dcd0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f47688f29sm6532296f8f.21.2026.07.14.06.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 06:55:31 -0700 (PDT)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [BUG] media: ipu-bridge: sensor fwnode graph not rebuilt on warm reload / hibernate-resume
Date: Tue, 14 Jul 2026 15:52:42 +0200
Message-ID: <20260714135242.125821-1-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67567-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:sakari.ailus@linux.intel.com,m:bingbu.cao@intel.com,m:dan.scally@ideasonboard.com,m:tian.shu.qiu@intel.com,m:mchehab@kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[fernandorimoli11@gmail.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[fernandorimoli11@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A40AC75564B

Hi all,

Reporting a bug (not a patch) in the Intel IPU6 / ipu-bridge sensor
setup. On IPU6 platforms an IPU6 sensor (e.g. ov5693) that depends on
the ipu-bridge software_node graph for its link-frequencies property
fails to re-probe after the intel-ipu6 stack is unloaded and reloaded.
This includes hibernate-resume when a sleep hook reloads the stack. The
cause is two interacting issues: the bridge only builds the graph on
the first cold probe, and intel-ipu6's .remove leaks the bridge's
software_nodes, so a later probe cannot rebuild them.

Affected hardware / software
============================

- Microsoft Surface Pro 9 (Intel, IPU6), front sensor ov5693 (ACPI
  OVTI5693).
- Rear sensor ov13858 is NOT affected. It reads link-frequencies from
  its own ACPI _DSD, so it does not depend on the bridge-injected
  property.
- Reproduced on linux-surface 6.19.8. Code paths below are quoted from
  mainline v7.2-rc2 (drivers/media/pci/intel/ipu-bridge.c,
  drivers/media/pci/intel/ipu6/ipu6.c, drivers/media/i2c/ov5693.c).
  Line numbers are indicative of v7.2-rc2.

Symptom
=======

After unloading and reloading the IPU6 stack:

  modprobe -r intel_ipu6_isys ov5693 intel_ipu6
  modprobe intel_ipu6 ; sleep 2 ; modprobe ov5693 intel_ipu6_isys

or after a hibernate-resume where a sleep hook does the same, the front
sensor fails to bind:

  ov5693 i2c-OVTI5693:00: supported link freq 419200000 not found
  ov5693 i2c-OVTI5693:00: probe error -22

and, if the whole intel-ipu6 module is unloaded and reprobed (e.g. PCI
remove+rescan):

  software_node_register: kobject_add_internal ... INT343E ... -EEXIST
  intel-ipu6 0000:00:05.0: Failed to register the IPU HID node
  intel-ipu6 0000:00:05.0: IPU6 bridge init failed (-17)

The sensors only recover on a full cold boot (empty software_node
registry).

Root cause
==========

(1) ipu_bridge_init() builds the swnode graph only once, and bails if
a graph already exists.

ipu_bridge_init() begins with:

  if (!ipu_bridge_check_fwnode_graph(dev_fwnode(dev)))
          return 0;

ipu_bridge_check_fwnode_graph() walks fwnode->secondary and returns 0
as soon as it finds any existing endpoint. So if a graph is already
present on the IPU device's fwnode chain, ipu_bridge_init() returns
immediately and builds nothing. The tell-tale "Connected %d cameras"
line is printed only on the cold path, never on a warm one. This is
correct for the intended lifecycle, but it means the graph is a
strictly cold-probe-time artifact.

(2) intel-ipu6's .remove does not tear the graph down, and the teardown
is not reachable.

ipu6_pci_remove() frees IRQ, MMU, firmware and bus devices, but never
unregisters the bridge's software_nodes (bridge->ipu_hid_node and the
per-sensor node groups). The only function that would do this,
ipu_bridge_unregister_sensors(), is static in ipu-bridge.c and is not
exported, so intel-ipu6 could not call it even if it tried.
set_secondary_fwnode(dev, ...) is likewise never undone.

Consequences:

- The INT343E / IPU-HID software_node and the sensor swnode groups leak
  in the global software_node registry when intel-ipu6 is unloaded.
- On the next probe, software_node_register(&bridge->ipu_hid_node)
  returns -EEXIST ("Failed to register the IPU HID node"), wedging the
  IPU6 core until a reboot clears the registry.
- Where the module is not fully unloaded but the sensor driver is
  reloaded, the stale graph is still attached, so (1) makes
  ipu_bridge_init() a no-op and the sensor's link-frequencies are never
  reinjected. ov5693 probe then fails with -EINVAL / -22.

Why hibernate makes this visible
================================

ov5693_check_hwcfg(), which reads link-frequencies from the fwnode,
runs only at probe time, not on the sensor's .resume. So a pure
resume-from-image (kernel state restored, no re-probe) is fine. The
failure is triggered by any path that re-probes the sensor against a
graph the bridge will not rebuild: a manual modprobe -r / modprobe, a
PCI remove+rescan, or a hibernate sleep hook that unloads and reloads
the IPU6 stack to work around other freeze-time issues on this platform
(the SP9 needs the IPU6 quiesced before the hibernate freeze; reloading
on resume then trips this).

Suggested fixes (for maintainer judgement; I am reporting, not
prescribing)
==============================================================

1. Make the bridge teardown reachable and call it on .remove. Export a
   counterpart to ipu_bridge_init() (e.g. ipu_bridge_exit()) that
   unregisters ipu_hid_node and the sensor node groups and clears the
   device's secondary fwnode, and call it from ipu6_pci_remove(). This
   fixes the -EEXIST leak and lets a warm reload rebuild the graph
   cleanly.

2. Or make ipu_bridge_init() idempotent in a way that repopulates a
   missing or partial graph rather than bailing on the mere presence of
   a stale one.

3. Independently, harden the sensor so a transiently-missing
   link-frequencies property is not fatal when the sensor supports
   exactly one link frequency. This is defensive, not a substitute for
   fixing the bridge.

Reproduce
=========

  # with both IPU6 cameras working:
  sudo modprobe -r intel_ipu6_isys ov5693 intel_ipu6
  sudo modprobe intel_ipu6 ; sleep 2 ; sudo modprobe ov5693 intel_ipu6_isys
  dmesg | grep -iE 'ov5693|Connected .* cameras|IPU HID|bridge init'
  # front sensor fails ("supported link freq 419200000 not found"),
  # and there is no "Connected N cameras" line.

---

Notes for reviewers (not part of the report body):

- I maintain a downstream DKMS ov5693 with the defensive fallback
  (suggestion 3) which makes the SP9 front camera survive
  hibernate-resume today. Happy to test any bridge-side fix on real SP9
  hardware.
- Related prior contribution: the OVTI5693 ACPI HID plus
  ipu_supported_sensors[] entry (Reviewed-by: Daniel Scally):
  https://lore.kernel.org/linux-media/20260708213633.18392-1-fernandorimoli11@gmail.com/

Thanks,
Fernando Rimoli

