Return-Path: <linux-media+bounces-59573-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOkiM7NN7GnIXAAAu9opvQ
	(envelope-from <linux-media+bounces-59573-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 07:14:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5115D464FCF
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 07:14:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 53A4F3011867
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 05:14:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8B1A2874F5;
	Sat, 25 Apr 2026 05:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tCnCKXTf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1123322ACEB
	for <linux-media@vger.kernel.org>; Sat, 25 Apr 2026 05:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777094052; cv=none; b=oRjDOwOQFCKMCKM0MHiUdHa6al89YcaXZ0YaoRmNv4Rp8HGR6Ef7HLgnTBgIPuQjpwW/zvIdB1czcOOXybgl0zOsxwJVt3ak0kEbtMhYhD+6mfD9hFIyB+yqa3unlalhijZvyJlcR8BXbpZnll992bzIDI3f9zhKKvP3y4mIWPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777094052; c=relaxed/simple;
	bh=nZeGtYRSLY6cucwUIwuF6nFPb17OoDRtA4XEhku14aE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VKOcxCb6egsWRsGv8X/cfo0W7qfWrFGaKWaz2R4Pn6wfPX8G0cHBv8TL45OcoM/FkwWVIR2YcW6SL/rAdaSRmzTsc4ci6s4o5QDKYIgPUtzIKV4GmSXdU8JYakjx8EMau9Cpfq7BweiOvdRcM0BoYIIkfU8GEvyxbyCss4f3Qnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tCnCKXTf; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2e221a71e19so8383041eec.0
        for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 22:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777094050; x=1777698850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3+bcFhSUD53lUNeF9/7wLA9Hr80nicrqJCEzeH7/pag=;
        b=tCnCKXTfjBxwLP9VCw+8LyxVcyKor3S0QJUs7tpzlOPC60lmddDT4DFSssNrBmzLMl
         SfIxZPcv6G0FLuOXByYugxHvvwWSkf6jjZetcpiOwXgWPf/oIJhFw63kLDuhwCgvrA+d
         3841OPcB27TtuYbJYYDgaJs1Qyrm4H6qFZE/TRS7VNmwwgqZ6rKy6AzpcmUPHc9LznKV
         /DEUia9to8quvLSaxrlSlTn2EkV+Yk+o6idsLPz2RObMftDB5oBTqu7U91bcYR0Sbdfl
         hpnXviSrxacA7v3LVKaNc7oaaqGSRyrc2FsM2q1reCxamPqLJrOZAx6lvuLCEoaIzkKy
         OoBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777094050; x=1777698850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3+bcFhSUD53lUNeF9/7wLA9Hr80nicrqJCEzeH7/pag=;
        b=EIKEW43PKRppwWb4zcDnGntySiAopapYyxn+LRpO/9uhdOv/qZQXp48WoSvp39opEB
         8BQ4EFAr2iDf+C5uAJVwQb6io9U8OQGmAKIq9ro70Qt71OJeNjJiYVCXygM2HOIV8uXO
         WO88jQmsrBuhqDDalY1e9FwKykiYbYJDMIcwHu5hgcZCbnUb9qM9YYtM2EaYSDXvcDI4
         b3maGIjUe0y5oWkCQz/p9a7tGwtovp/lroafpYd3B4kC4Q5Rmzqxrv5e1wbLISmv7N3+
         HTTFjLUn3F5yOGp6QCSpzhwngDyqGCVvItd7gw4PuPxEiS3eI2MthNqSES8j/cBrBBRk
         gDkQ==
X-Forwarded-Encrypted: i=1; AFNElJ8yERXrjTa8BzpD71IHAIlskpgAhG/SlWkDw3zM1EQQWk3eaZl2LX1JSl5s6NEqVKTh8qpp4Gpz5z9Izg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yze/tUfk/HQNbwdIOYQiDpDP5UnGVK1w8ucfEkNFQlyffvIhAm6
	345jqoBkm+vkKlly1/cOSePk9VwKq/3FTV4Inv8BL8VNoSMYKDTpD8Ik
X-Gm-Gg: AeBDieskjxiavmbr50ZnXaVtf0zJ7VR9uoyzHXr8fSCn0ERUevQPXpgKW+qNSzTxJ6o
	AbksCxqnAxTfoW4lgK+yQ4rSTY/f8seqKx9VmkewkNLLAtWMpCbk1yzZtuQYJI/HEL0X/O/VCUb
	JAWSK8LQY86wSmmoIPOyav84hrsvHNvsV2+e7LrvPq64dAZ8HNqZspCYPwmgKhR355bqoSiRxj5
	sfepwAX4jcw8X4PMq2c9kLEdMQ9X6a2SdDYTLwYRBHOdohsSg102sz2KoHwunJnin6IYSPHWyB+
	Zo+IvWWD04w5zwx5fASRKIzsLGaKFWYkE9k5hJFdHxFX+pHaIICrj+8qKB+OVNXtwpuy0Sneole
	6EfhM3+5PUSLeB/3Xaw6jyYhe/MNgkmc+bgYa1PImQJzDeTXxdXGJ0tRndUtJ7bqUzQu1zeEW25
	hqOON8ErKlDPOUMmzkSaFpv8DMSyJpFoATRA==
X-Received: by 2002:a05:7301:f90:b0:2ea:7901:8d72 with SMTP id 5a478bee46e88-2ea79019c06mr7788018eec.17.1777094050005;
        Fri, 24 Apr 2026 22:14:10 -0700 (PDT)
Received: from TC-LAPTOP.lan ([66.142.131.45])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53ac84c38sm35973806eec.13.2026.04.24.22.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 22:14:09 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: hansg@kernel.org,
	lee@kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v5 0/5] Enable cameras on Dell Latitude 5285 2-in-1
Date: Fri, 24 Apr 2026 22:13:37 -0700
Message-ID: <20260425051342.8960-1-tchatard@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <aehzn85IsUI-bcKW@kekkonen.localdomain>
References: <aehzn85IsUI-bcKW@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5115D464FCF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,linux.intel.com,gmail.com,ideasonboard.com,rothemail.net];
	TAGGED_FROM(0.00)[bounces-59573-lists,linux-media=lfdr.de];
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

This series enables the front (OV5670/INT3479) and rear (OV8858/INT3477)
cameras on the Dell Latitude 5285 2-in-1 under Linux.

Changes since v4 (addressing feedback from Sakari Ailus):
- Patch 1: Drop the data == &spt_i2c_info guard from the probe condition;
  the HID (INT3446) + DMI check is already precise enough.
- Patch 2: Revert n_consumers back to int (unsigned int broke the
  if (n_consumers < 0) error check on skl_int3472_fill_clk_pdata());
  restructure probe so ChromeOS and error cases return early from the
  switch and the Windows path follows as straight-line code after it.
- Patch 3: Correct the VIO description in the commit message and code
  comment; drop the inaccurate "no enable register" claim and instead
  document why VIO is kept always_on (voltage must match VSIO, no direct
  consumers).
- Patch 5: Drop the paragraph explaining the VSIO->dovdd mapping from
  the commit message (implementation detail belonging in patch 3);
  add an explanation for the dvdd/dovdd reorder in supply_names (core
  power stable before the I2C passthrough opens).
- Patch 4: Unchanged.

Tested on Ubuntu 25.10, kernel 6.17.0-22-generic.  Both cameras working
in Zoom, Chrome, and GNOME Camera via PipeWire.

Thierry Chatard (5):
  platform/x86: intel_lpss: add resource conflict quirk for Dell Latitude 5285
  platform/x86: int3472: tps68470: fix clock consumer registration for Dell Latitude 5285
  platform/x86: int3472: tps68470: add board data for Dell Latitude 5285
  media: ipu-bridge: add sensor configuration for OV8858 (INT3477)
  media: ov8858: add ACPI device ID INT3477


