Return-Path: <linux-media+bounces-52058-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MiyCsUAgWlyDgMAu9opvQ
	(envelope-from <linux-media+bounces-52058-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 20:53:41 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A25D0D1B
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 20:53:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 13E75301933D
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 19:47:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D3BE72627;
	Mon,  2 Feb 2026 19:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Im/8LxxK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7963A3093B6
	for <linux-media@vger.kernel.org>; Mon,  2 Feb 2026 19:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770061623; cv=none; b=BkmfZEUkF7jMKsRTDEAO/kX7QcyVWmi6eh6qKBJNfdjb9431gcRxMClVehC0LJldoUKApDotL40zT6MFLhmE3wxixVE9TH4MceGCpT/LzjYNfcw0rqGIamHhjByZMhCkR/gkAFivJIK/T09nAUYvZlavr7WqTAcePw/BLQV+0bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770061623; c=relaxed/simple;
	bh=g4IJQ9Z6Sv9I1/lw/CXPaNQz0s6n4tZGaDjLsPG8OMg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fG21t7ZibjqSM+3rzHkpASbbFMSGpPnxubHIrV6O57cAWTtwYX/rNyvXDm3SyMyOzrS3v2ehWyR+LBwXgvZCNnRAIYOfIo1WEeUKSpwkvY0NQk0SAGRmT9fw4DZD8pQpaP8SDvcajgtn3FJpOJNm6E+d9cF/npU/DkwPGV6vBnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Im/8LxxK; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-81f38d974e0so291316b3a.0
        for <linux-media@vger.kernel.org>; Mon, 02 Feb 2026 11:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770061621; x=1770666421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gKBywhbyvsHsK4xxnZ8wMlQDheLCuBl8QbDKL7rhuJ4=;
        b=Im/8LxxKl2DnkIiinAeRk7JmIKEnnakkGRFytC3Kb0fOWaoMh2yz6di7Y5JYk7dBtq
         GEIb1xsjJhtIHLAzDNGTs0tJ3OXLcYiQSWfJxI3qz5uSqqPv85/bWE7FXUSEdaX7rLe2
         dTkqfC5bD+UaFpM/wKaHNLx2kmjHhh/xp49MQs1lAmt33m6pozFLt/k0pH8lcOOh8iYT
         6EAlH5y2GTqd0lvs5ZJcf6+xxM11aqGxmEsd78qxIYm2Hpp+c4M+p/0pN+WNUoicZHE8
         iuUFJtFyjGVjgoWItk5CFj7CbM5RDsxhKK3YZOlkMvUFE6mYVrI0AjquG09PiMWg7pAC
         pkqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770061621; x=1770666421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gKBywhbyvsHsK4xxnZ8wMlQDheLCuBl8QbDKL7rhuJ4=;
        b=e4SKNPcoKrz34CqYCZWtnJ09CZ/wW57WEKT0ZAertYUpvr1KiM1DrsdTU696EV6n9m
         +Xqg35wdycBRCPqyh7ieqcltxprqxj1skUCup7jqfehMsVGz2aOlxfgxNaWJ9joXufa2
         UB1y9c0rdLRwL0ITydBzfe4NZIZ5VEQ+kPyxdjGovLxEh83awjPkehFdjbgrDPoDlqti
         sReXY96YdiogvoQCWdGhZmiZDQWFtLua+hZxUblmk8BJ/8qrj+dmzBaohW5ZIc7QXRrK
         tgZMY5Dv6RcHFvQY0dpbUNZp6sgxzKlC8n4LYs4jiEMPT9YuumoOsLkfPoNFIzoRS9JL
         ni/A==
X-Forwarded-Encrypted: i=1; AJvYcCUKqgmkCYK7a1CRWgcoX52tI1yJXpi18hYGkRZBIEMk29x+9d5zuX5t9TyeVtDHbvm7Iyh7rR1fVIgiTA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDzw1ROm0TaAJ89PkZMP/gtb1gqq3sdIqcEUayYf48gigTC0zz
	TMMxOVjyuu+sbC/Vj8j+6yVaSxqEJnTWK7L9DF6fV+cWEYeK6+EUAWkA
X-Gm-Gg: AZuq6aL/efoHrsGztUFpsApWTOx3Zzy9dRA9yJmcmD5/ZQuw7uF/Uy6HBnm2Z+Cpfw0
	udoaqsHYBa4Qoraz6G0xrqof/bkZ3ysIIhNNMOjafnsAUKJ4EVlnHCS6TsZTwuyKZj/sMdjpEL8
	6q0XZpcenVPEa9+2uNHJ5sZnslEXXWtxfBn9XnJvAI9+Yad6VzmUJ8R+DY6qP7zZ2reZoaG6kd8
	P0OHZLdWPpr5HIoKsFWMKMy1ZVgxl2+INU+0L95Gb/FGO7/1Ke9Uvpnu6VnuvfzvOH0K9J7JkY/
	mY0RQs2mTuWu8pH5lBB5r2EROBEjzwKBxSPApXfsVw+i6VvUC6r0tKCh+N1dBZ6nZvFOqK1uEIq
	8Vo1g2JnoMMCY9bK2BRUn9BOfog0dtHyhU0zW8s9BuPs1cGCcSBp+ml4M4Ka7usgd5kEX6X5MPV
	9dBEaDdpGMZ00WnPdyCATVGYz9IVN1fGQ0h2bJ0iJzJCY=
X-Received: by 2002:a05:6a00:bd13:b0:823:f55:b061 with SMTP id d2e1a72fcca58-823ab726087mr9422719b3a.3.1770061621542;
        Mon, 02 Feb 2026 11:47:01 -0800 (PST)
Received: from FAIZEL-KB.. ([2001:569:5999:dc00:af0:4465:b482:1e01])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-82379b1bc68sm16667416b3a.2.2026.02.02.11.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 11:47:00 -0800 (PST)
From: Faizel K B <faizel.kb@gmail.com>
To: Shuah Khan <skhan@linuxfoundation.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	libcamera-devel@lists.libcamera.org,
	Faizel K B <faizel.kb@gmail.com>
Subject: [PATCH v2 0/3] media: vimc: Add timing controls for fps config
Date: Mon,  2 Feb 2026 11:46:42 -0800
Message-ID: <20260202194645.1287757-1-faizel.kb@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-52058-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 42A25D0D1B
X-Rspamd-Action: no action

Control frame timing of vimc sensor by adding support for V4L2 timing
controls (VBLANK, HBLANK, PIXEL_RATE). PIXEL_RATE and HBLANK are fixed as
readonly with default values. VBLANK is configurable.

First version patch attempted to implement direct frame rate control as
fraction. vimc sensor should have controls like real sensor to control the
framerate.

- Link to v1: https://lore.kernel.org/linux-media/cr4tjjlq53ezux7lzrusy4wb7ji26trwkipfkjl33kwv6z4ut7@r6hvuzki66bj/

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
 drivers/media/test-drivers/vimc/vimc-sensor.c | 108 +++++++++++++-----
 .../media/test-drivers/vimc/vimc-streamer.c   |  33 +++++-
 3 files changed, 154 insertions(+), 28 deletions(-)


base-commit: c824345288d11e269ce41b36c105715bc2286050
-- 
2.43.0


