Return-Path: <linux-media+bounces-55555-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCI9EH5Js2n4UAAAu9opvQ
	(envelope-from <linux-media+bounces-55555-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 00:17:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BDA27B381
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 00:17:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 66E1F31066A6
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 23:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9261339E17E;
	Thu, 12 Mar 2026 23:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GGXIwHGn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA16239C013
	for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 23:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773357433; cv=none; b=poBW0wyGxgL2SAooPthxY0FcF6Ojrq708vtolbX3I4SaWKD/Pou09KNLTJ+G2hc3+I/xzulROcYOeMhqe22w7FVoxs8RL7PASuV+zzmmraWgoyfMcOqJTAoX01NFnYuQKAZhU6/CrO5Gk8Ju3aSpYb95sXfxJMVvC8tl2EgLVRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773357433; c=relaxed/simple;
	bh=j9PBq4uwayQwM0TyhsM+Eccxya0GHp+CWvzRrIA0guk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VS8vwpbnkX2r+hYSsep9pCrujZ0F5K7WvMFD5sIUSBRbHyz7f4KJaPLkmAG+vXvH7uoG83pUkT+qxSpkkOOQSDLvPAwCd35Pl3Wxyed9S4uVyAsiu1Q7Xa7tdLgb3qo74LAYrobh0YcnE2rFA4NzrHdsyJFLZnUwLUK9Zf+NN38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GGXIwHGn; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3538952a464so139272a91.2
        for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 16:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773357431; x=1773962231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jurnWtA9StuzZVJhN53xyykHE0SNK77Z7bUoT00rjeA=;
        b=GGXIwHGnr8OM2YrexTT1olVOXQc3mwLhSfgyOO8OmeJov4I/jL/69q16MqxEIWjggQ
         QcvPGm6o86Tu+5Kj5ReBIcDDZDi8MUjloeynQdu+p7eBNyNxglkZjqdulcIFSjJeYL04
         JlQRV1lvLv+XU4uBxb6k02tlbohPryjrmxPaBf/KGKlYNIQRcRBsn8MyY0K6YuKslpan
         AI12oDLbquZWKoGbswpMp3TyHzLe/4kTl/lEbz3QBYUNV7u4nOEdoXt9jETM1OVf3tmX
         VtFqx30Fw/ovXXvh3z691GlaPLg1Gg8IXkt5tzmFaUDuy6VJSyHOYfZzRVaJ4cD1bt7j
         Nw3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773357431; x=1773962231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jurnWtA9StuzZVJhN53xyykHE0SNK77Z7bUoT00rjeA=;
        b=C5VSobg3lQYicabv9EZGAjh4jNVYv+ftxqQmn7jYPLFGpmcT+XczvF7DEFzU/a+YTL
         JMbi7BlIIkEz1fbWSo+fYmXIfC8BjdMXelqU8pgSOsOF9vFEl3UQgyBneGzHdpiCCbOZ
         aWhPu9yYpxyeKg8BOhI1kGhYf49/ArpCsGzjpdl8X/Mn3/mXloHCwbnVuI0aWDOG8JZz
         FkBzCT2tXV6Kblz9D+xniS4Edgv2ulQIXB0znLgdmQkqZ6MDM9Xwng/xv6z4dJSzL8PZ
         b0BknDQfTJxNvl4O0n9aTnJDHhnOk6QhK58bqCSI1PD9gowqr8THKGjeMbZehtinGxjd
         rzkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwaYKlVXVOZlVgOwKRKQlHHOBbfEEOoDLVZ/mcsl5zWyaRab0IevDj/u1DuDBrTZnD6vbv/acivn/tnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzyfCTx6zCPK9BKlYqq+845cnqX2CceFd6X9H75GxFVv2H+JqIg
	id/UT6qb3/APSeVsIDSgvK4qxcM8UWTU5dna7dPqyNgUvWPutpuIi9r9
X-Gm-Gg: ATEYQzz81no5AjwmaUJW4BrzWo50JDWSlXF+i9OsM1thwgt783J/qplpIwoaTpzRPru
	nR49gjppYISk7jAMkOrT1qdiaBAIQ2t+1zQvy0XWMo58FVzEpd60sCM89G4VECO4yJZG/n0nTnA
	7niteOA1ov/KyrSQ+LQ3U0BFMtyWxTRC0nP2M4JwPa7Jwj615C8DcM6q9b+CVzi3fhntBGaw/NL
	Dv+m6ct6783dQFeIXyZQHjoT6U1RFLIYj/NoNzetrjhaPmLytNJ6CH9Flu7qyx3zlBp1BqH+Y4v
	uhM916SgElv9J9AB/SaNM7oi5Fs2ze9rC2s4kENscDulnp3JyLo7Voq6X2oELkAQkdhZemaSOWe
	DX1dr24EJ6rbua7IisYwsGzd8zi+o1j9J5XmVo0QBejBqg3Qn+ReN+LJuRPaD7XdluHqy6TMnX1
	pAB87eZ0XlpOkH8MIKo79GgSyDrUGD+zFIlM1kvjG0RRBSdHAVuh6ipgs=
X-Received: by 2002:a17:902:f546:b0:2ae:3b4f:e5b3 with SMTP id d9443c01a7336-2aecaa3f126mr7188265ad.4.1773357431134;
        Thu, 12 Mar 2026 16:17:11 -0700 (PDT)
Received: from FAIZEL-KB.. ([2001:569:5b64:e100:3685:315:53bf:61fc])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2aece81cde8sm619395ad.70.2026.03.12.16.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 16:17:10 -0700 (PDT)
From: Faizel K B <faizel.kb@gmail.com>
To: Shuah Khan <skhan@linuxfoundation.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	libcamera-devel@lists.libcamera.org,
	Faizel K B <faizel.kb@gmail.com>
Subject: [PATCH RESEND v3 0/3] media: vimc: Add timing controls for fps config
Date: Thu, 12 Mar 2026 16:16:13 -0700
Message-ID: <20260312231616.3590215-1-faizel.kb@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-55555-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,lists.libcamera.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[faizelkb@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 96BDA27B381
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Control frame timing of vimc sensor by adding support for V4L2 timing
controls (VBLANK, HBLANK, PIXEL_RATE). PIXEL_RATE and HBLANK are fixed as
readonly with default values. VBLANK is configurable.

First version patch attempted to implement direct frame rate control as
fraction. vimc sensor should have controls like real sensor to control the
framerate.

Changes in v3:
- Fixed 64-bit division on 32-bit architectures in vimc_calc_vblank()
  Reported-by: kernel test robot <lkp@intel.com>
  Closes: https://lore.kernel.org/oe-kbuild-all/202602031319.6Nd13RwV-lkp@intel.com/
  Closes: https://lore.kernel.org/oe-kbuild-all/202602031452.JzAaJ8BU-lkp@intel.com/
- Used do_div() for portable 64-bit division
- Link to v2: https://lore.kernel.org/linux-media/20260202194645.1287757-1-faizel.kb@gmail.com/

Changes in v2:
- Changed the patch subject to indicate timing control.
- Removed 'v4l2_fract' element from sensor struct
- Removed frameinterval functions for vimc_sensor_pad_ops
- Added PIXEL_RATE,HBLANK,VBLANK V4L2 Controls
- Added fps delay calculation based on timing controls
- Default PIXEL_RATE as 160 MHz. HBLANK as 800
- Default fps 30 for resolution up to 1920 * 1080 (2,073,600 pixels)
  above which the fps is 10 (PIXEL_RATE must be changed to support
  higher resolutions).
- Link to v1: https://lore.kernel.org/linux-media/cr4tjjlq53ezux7lzrusy4wb7ji26trwkipfkjl33kwv6z4ut7@r6hvuzki66bj/

Example usage:
  # Set vblank as 1000
  v4l2-ctl -d /dev/v4l-subdev0 --set-ctrl=vertical_blanking=1000

  # Capture and verify frame rate.
  # Real framerate depends on the CPU performance

  yavta /dev/video2 --capture=100

Faizel K B (3):
  media: vimc: sensor: Move vimc_sensor_device to common header
  media: vimc: sensor: Add pixel_rate,vblank and hblank configuration
  media: vimc: streamer: Apply sensor frame rate in streamer thread

 drivers/media/test-drivers/vimc/vimc-common.h |  41 +++++++
 drivers/media/test-drivers/vimc/vimc-sensor.c | 114 ++++++++++++++----
 .../media/test-drivers/vimc/vimc-streamer.c   |  33 ++++-
 3 files changed, 160 insertions(+), 28 deletions(-)


base-commit: f505e978d1a0442adbbde48aed38c084ddea6d6e
-- 
2.43.0


