Return-Path: <linux-media+bounces-51448-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBLcGVN4dGmn5wAAu9opvQ
	(envelope-from <linux-media+bounces-51448-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 24 Jan 2026 08:44:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B667CD5E
	for <lists+linux-media@lfdr.de>; Sat, 24 Jan 2026 08:44:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7BA773002F7C
	for <lists+linux-media@lfdr.de>; Sat, 24 Jan 2026 07:44:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DEF51F5821;
	Sat, 24 Jan 2026 07:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aNecShl8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59853EBF1E
	for <linux-media@vger.kernel.org>; Sat, 24 Jan 2026 07:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769240651; cv=none; b=jJT9wC2SvrRg4tRMl4a6ulXVdZLCKkWSPMpg6+/mmnl/PDFhz/qKYvCekD4H84nLSA4iZpZmjBNpv800flkrzxA4KmDg2GGS9RwwOQSnRU9ZzUsuRT0G++mF3NOWKBxjGV5JwVeaR4c126/Y7g+dOpKaTQ/8c4n4i9eHh0ZSpgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769240651; c=relaxed/simple;
	bh=Y5Mk1IqZRLusQwylevT/mB1eLhGZs8J2Z/vxYxGnBr0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FdS7g1Z8HYp+nFi6csogFApzSuSMSfUGxhIeWgxPcqyy9ava4+tLWPJtrBchRsUKu9n7rIQKNc1z/+zNr6ziZI/5mYgFfAOANP0XDd9WYgJ1F1WWe6OxKaHKmeOLx6rL7AWZe9ood5pIls+kdITtoen7BzzC5Q5qAH2Ys7uiJaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aNecShl8; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c633984fbeeso974044a12.0
        for <linux-media@vger.kernel.org>; Fri, 23 Jan 2026 23:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769240650; x=1769845450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K7JGsH9wGffokGtMGdj6DlQvzFbTzNsISCbbIOZJcCY=;
        b=aNecShl8aO95d9HdJhGQGwUJBZSWnp2JuF1hQWQ6HrDEfAr/EfIH3A8DZtdYk8Nghn
         VyDZ4265aLLEVFOdPUKPzOvOMTLYApZqi87WzSRLbCX4viobT7qg1rgCU7F0W1IttgG5
         0GjSot9/jj2vfXa90OxYh6FHDTF1JqW4SGNQPdQ6jTFX73VXyCoLH85YR/0TS5LCq+2/
         wb8xtNSBaYT0Faer2fGQhu0C0ySUd+fO4z60n+CaCitakZzjWlyKZ25bUfuRA9lAeMkX
         Vt3vVDkEpRkWNsrkRSb+hJhCpNqmmVp+6NQtlKQ74rvSNQ5it8V4+sfwjaq0Z+O584GY
         WcDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769240650; x=1769845450;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K7JGsH9wGffokGtMGdj6DlQvzFbTzNsISCbbIOZJcCY=;
        b=eN3ookuRnGs41BaCiwjDrzNvlrtzTmElQgDNI6hxbf2ycjVsd3DNq0j9fRIO2SEUdU
         vP1i/ZVoA+jpCf/xfDngZpVWnWZW9f6CD4FZH6c8iwIfsPlMUVkM2FbyMXZwOjOlh5lv
         BxY2ieHqDfEPAjN6DTHY3At2IGIMYHPy5huy8MBT/ttuokc7jA8DHc7f333umaXHO+G8
         VDHrwjh4CDqyH5/Sg/gkIPxAjiFVt51XXbn1d8t4f+SCxgAWY3Wa+Lc9Hy7muRysvmB2
         Y7ix+16rKNKxCcik3ooz3NluL6Gq6hciCGG3HJg8qIEyWwK/aaSxubmOkx8yvtPUwQ9G
         vm+g==
X-Gm-Message-State: AOJu0YwXnrhdbn9BInp22g3CWmsb0DCoEaLd4bjT42m/iGOMgQ68zsiN
	lFwqlcIOt6rxKtkj8u36VVOG21Te8uvKN49nQnNBbrVz/+uKKQch73sWlZ1A3tHk
X-Gm-Gg: AZuq6aIdvWZBWq6y9z1VD/X68u6zC6DInhZkTr1o61obagMtHvQ55KgENZd1a9UUxjN
	ez4Zov+1x8A2OhVifmKSSGkgscUxlXz735GVu6em+kQE1hZf2A5FwUFLhMx8cWFmjI57oCa2qo4
	eyksKiBZlZS1wKFDONKbzdO6D2JGAAp1cZoNOWSQGg0OKFDmVC2+ZHqLwxpFku6iab24UcOmMMV
	dhWKc8Gox1c3iqo4EpKjGAmenooPbAhqhnDHVSDvSbhy4X0kNnQSWLBUT7577k+XVvjmxznKQ7r
	WNLO2zNf7i9bYf4QQUkkxewgn+mDjTwFKeBcs/cI9aFQ03LXG8XqrKWp/ZQmjASrVLxfQn0Di9L
	34KlSoZ0ofserIFUF7QaxhDFFekHz3VFMGtCY8oupzVcRjI/zLeIdpEPgSEbWJXQZpj3vxp1eBl
	5QiRwHebQETyrsoHafbal2x8T1hPIS9pxKmz8tsEegoTeHIm3YJAh0gmNr
X-Received: by 2002:a17:903:b83:b0:2a0:a33d:1385 with SMTP id d9443c01a7336-2a7d2f7ebdamr88795325ad.17.1769240649720;
        Fri, 23 Jan 2026 23:44:09 -0800 (PST)
Received: from saikiran-Yoga-Slim-7-14Q8X9 ([2402:e280:3d17:646:1ce:3fd2:e11e:72d7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c635a42a626sm3653985a12.31.2026.01.23.23.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 23:44:09 -0800 (PST)
From: Saikiran <bjsaikiran@gmail.com>
To: linux-media@vger.kernel.org
Cc: hansg@kernel.org,
	bod@kernel.org,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	Saikiran <bjsaikiran@gmail.com>
Subject: [PATCH 0/2] Fix OV02C10 camera color and stability issues
Date: Sat, 24 Jan 2026 13:13:38 +0530
Message-ID: <20260124074402.7165-1-bjsaikiran@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51448-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bjsaikiran@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 60B667CD5E
X-Rspamd-Action: no action

This series fixes critical color rendition and stability issues with the
OV02C10 camera sensor on Snapdragon X Elite platforms, specifically tested
on the Lenovo Yoga Slim 7x (x1e80100).

Relationship to other patch series:
------------------------------------
This is part of a coordinated effort to fully enable the OV02C10 camera
on Snapdragon X Elite:

1. **Device tree enablement** (by Aleksandrs Vinarskis - Unknown):
   - Fix RGB camera regulator supplies (avdd/dvdd/dovdd)
   - Enable camera privacy indicator LED
   - To be submitted to devicetree@vger.kernel.org

2. **Driver fixes for color and basic stability** (this series):
   - Fix incorrect Bayer pattern causing green tint
   - Fix race condition causing crashes on removal
   - Fix reset timing causing initialization failures

3. **Driver fixes for power cycling stability** (submitted Jan 24):
   - Fix qcom-camss pipeline lock leak
   - Add error checking in disable_streams
   - Enforce cool-down period to prevent brownout
   - Submitted separately, currently under review

All three series are complementary and address different aspects of
camera functionality. This series (2) can be reviewed independently
and benefits all OV02C10 platforms, not just x1e80100.

Issues fixed in this series:
-----------------------------
1. Incorrect Bayer pattern (SBGGR10 → SGRBG10)
   - Symptom: Severe green color tint in all captured images
   - Impact: Camera produces completely unusable images
   - Cause: Driver reports wrong pixel format to userspace
   - Testing: Compared all 4 Bayer patterns, only SGRBG10 produces
              natural colors on this hardware

2. Race condition in ov02c10_remove()
   - Symptom: Kernel oops with "Execute from non-executable memory"
   - Impact: System crashes when camera application closes or sensor removed
   - Cause: v4l2_ctrl_handler and media_entity freed before device powered off
   - Trigger: Concurrent userspace access during removal (PipeWire/WirePlumber)

3. Insufficient reset timing margins
   - Symptom: "master 1 queue 0 timeout" CCI I2C errors during initialization
   - Impact: Camera fails to initialize intermittently (10-20% failure rate)
   - Cause: Sensor microcontroller needs longer boot time than driver provides
   - Fix: Assert reset 2ms→5ms, post-reset delay 5ms→20ms

Without these fixes, even with correct power management, the camera produces
green-tinted unusable images and crashes during normal operations.

Testing:
--------
All patches tested together on Linux 6.19-rc5:
- libcamera/qcam: Color accuracy verification with test patterns
- Browser WebRTC: Vivaldi, Firefox, Brave camera permission flows
- PipeWire/WirePlumber: System integration testing
- Stress testing: 100+ camera open/close/remove cycles

Hardware tested:
- Lenovo Yoga Slim 7x (Snapdragon X Elite x1e80100)
- OmniVision OV02C10 2MP RGB camera sensor

Note on testing order:
The complete camera stack requires all patches, but these driver fixes
were validated by:
1. Applying Aleksandrs' DTS patches locally (hardware enablement)
2. Testing this series (fixes green tint and crashes)
3. Testing with brownout series (prevents power cycling issues)

Result: Fully functional camera with natural colors and stable operation.

Saikiran (2):
  media: i2c: ov02c10: Fix incorrect Bayer pattern to SGRBG10
  media: i2c: ov02c10: Fix race condition in remove and relax reset
    timings

 drivers/media/i2c/ov02c10.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

--
2.51.0

