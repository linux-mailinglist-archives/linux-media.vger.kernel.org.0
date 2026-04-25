Return-Path: <linux-media+bounces-59594-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMEcNYHs7GngdgAAu9opvQ
	(envelope-from <linux-media+bounces-59594-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 18:32:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5485F466E41
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 18:32:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B459E300B3D5
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 16:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D66A934E762;
	Sat, 25 Apr 2026 16:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rxhRMsIl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DE72147E6
	for <linux-media@vger.kernel.org>; Sat, 25 Apr 2026 16:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777134712; cv=none; b=r7MIaz3zLZpxpcKVGAcrJznV7x5xD8tKSRNszeYE9oZC2GruikHZSB0BcFmxbyDisLPWTM0yU2BZq3NYdsDT0DMP6Y5cbPsvf0y9RrCiWoCV4IEORttai9bgLoUm7nQiWNqKw1FQuQfafDDuFLPo1iev9j6dPRYBj0GRflcS8lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777134712; c=relaxed/simple;
	bh=mv3H+AyqqYV4F8o/lHb6gla8J73a/RvMxboQCjj13C8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T9fJbWMgNlEduC/g7Xw+vOqOoPP2MgPGYDq8gBR0W8BOvq5jTfGeJKwukZCcMi2/Ly4f6e6adf/aKKv29psm2z10nqpLUPaKHWZR75ADB7E4IdyXqPEPOGBAlyazSM1tyfVVDihyeGOpZ2fWIAm6rxC1l3q906phtYr+6YQRbKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rxhRMsIl; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1279eced0b9so13265570c88.0
        for <linux-media@vger.kernel.org>; Sat, 25 Apr 2026 09:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777134710; x=1777739510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2etDo6S5QLxsftodeIDSQ1hpnhwMdeQI8Kh/liV+PG4=;
        b=rxhRMsIlGQVonxvhnptD4n7yeOh6q/xI4giDvlNWjRqtwNjoPPMxpMpXFRnPROcLcg
         o9QRsqa2Q32ZE69Pt2W11sk6FmcDnSM0waIGv0+tOGRfu9nVCHORt9bOQ6mZniHX3HhI
         7lwg3v/J6L75l7D5mxmnAfobWihY7LuGEkrXgMYuAphlM+q+y/p5dem+XgpXEwSWenJH
         ccWfBZhKTEsAkCduh2LmL9h9FbnOwvVRHj2mHtD7OaCrnalbk6s8o410wYG0mgyjgs3k
         pvoVeq0QlYwP10YAtDQy3lonbM5c20d2KbMPHGH4y6aOWSjqyiSFuX6ThpL9IdvSnLar
         RpkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777134710; x=1777739510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2etDo6S5QLxsftodeIDSQ1hpnhwMdeQI8Kh/liV+PG4=;
        b=GAklONNfwB7v2W8eOuMl76XXftZxgLweYLhkZ5VqKyOXFpyxZ4gcj4Ea0qEDjDS2Qf
         I2SgMg1HbVbPx8qqT9PV2SefwVL6Efxe8KTO+8Go7ZzV+KtIrPVXt4nJfR8HPPh1zHiz
         vNXpGESc+Fn5dQBkQ+grk74UU+z9ihIjA7GTXjFbyeWCfZqAAeMLHqQyVmOl7TCZaN7s
         41gF/WgdSLkES3Gx8k6M6TAgmYMHx1KLGz/DTRLLd4qyCoFevtCJwrAya58d0ceUT5CB
         Gdjh/ogHezGLfOJfhMvUh5EIW65AKMW7uDiKl0FQOFIdR01UKFl6yj6qzNaHWrthBaHP
         2oew==
X-Forwarded-Encrypted: i=1; AFNElJ/n0pNf6xHNUVO1vBWNv+pyq7wYdAD3uhspersRKCse1YsUkrJQKSMzoGvxcn0BogrhqA/sAbPye1pe9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwttkoH+GmvRI/aYEiAl6s0e89TxKJOxkUEE20ADjEq2BFxEjjv
	Shy40ukghabDKlGKhNo4r3SkTDbfWn6JdsIDHt/JJ6Fdt1kvT4AY3zU+
X-Gm-Gg: AeBDietGjRISUgIsqTy6EolvUdpsvKAaaGwskV+Ka69ecGwLsHsptqo2WIXq3RcwYoc
	ddBtOJhxANZWpZh8CY75NlqY16GpLnbc33BX9ehnaEMxRvyv13wEdteifurQMacvGUU1aCaUHsf
	kiUwnwzTtVO5RvPrEkMASpRSCnvZJpi4n0Qa16UXZqZ9FfEn6cM3VUfLrtovP0Zb4ZX1t2MS7SE
	dyx3DRpqIa+dpVRdnWukYpNB77biRO1QWO/+Ubz4HDwdwgG9xG9+cze77zUSUgbX5bCq34Szri4
	qK5PHm9F95PYWU7WIlceyoX3TGKF7bZx4qXDy3yyGBp26Xm/KhziYOKsb4QhTY+pmINCPVuCEat
	qW9tLxn45emqE97JDoU1aURLk2LyAkbRtJaTisUav04ngy7u4Hp9jCLfZP3I5ziWiBWxOZy2OEg
	YD1Qpa2x+Oa7z2mofuXsLx7+rL0I4IOLXL/Q==
X-Received: by 2002:a05:7300:d70e:b0:2be:1f58:32a3 with SMTP id 5a478bee46e88-2e4878d65b0mr19573764eec.29.1777134709969;
        Sat, 25 Apr 2026 09:31:49 -0700 (PDT)
Received: from TC-LAPTOP.lan ([66.143.226.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53a4a8bd2sm35922547eec.11.2026.04.25.09.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 09:31:49 -0700 (PDT)
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
Subject: [PATCH v6 0/5] Enable cameras on Dell Latitude 5285 2-in-1
Date: Sat, 25 Apr 2026 09:31:40 -0700
Message-ID: <20260425163145.8474-1-tchatard@gmail.com>
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
X-Rspamd-Queue-Id: 5485F466E41
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,linux.intel.com,gmail.com,ideasonboard.com,rothemail.net];
	TAGGED_FROM(0.00)[bounces-59594-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

This series enables the front (OV5670/INT3479) and rear (OV8858/INT3477)
cameras on the Dell Latitude 5285 2-in-1 under Linux.

Changes since v5:
- Patch 2: Use a local 'tables' pointer before the gpiod_add/remove_
  lookup_table() loops so that neither call ends with a bare '(' (fixes
  checkpatch CHECK reported by the Media CI robot).
  Also restore the missing VSIO->avdd consumer for INT3479 (OV5670):
  the v4 refactor dropped this entry, leaving OV5670 without its analog
  supply and causing -EIO from ov5670_identify_module().

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


