Return-Path: <linux-media+bounces-52214-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ZATICTSug2lOswMAu9opvQ
	(envelope-from <linux-media+bounces-52214-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 21:38:12 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6966CEC7FA
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 21:38:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE488301692F
	for <lists+linux-media@lfdr.de>; Wed,  4 Feb 2026 20:38:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE27F436350;
	Wed,  4 Feb 2026 20:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XsCSsmi8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4659A27B4FA
	for <linux-media@vger.kernel.org>; Wed,  4 Feb 2026 20:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770237486; cv=none; b=PMI7vIWVnj+wQq9/IMYZsqO0wb4Srr+bTR03qQauxFGFXd5iA5u4RQGjRofr9ahuVQH3bN+VvU+wThpOvCL0L6oklUR5IZMeKV5vHeEcZgx5W5nssfP8owABdJNypZ1MN0D+o6Vtqx74NznyoM9MSIGbu4GjcwxHNMuTRccpcrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770237486; c=relaxed/simple;
	bh=6fDwmVAW6/Fl9YCWz62Y6IRoBJAdePVdW2D02zi87ms=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KN+OZA6qDd62Bwoz/TIaK+jH9Cy22Nh4TPUV1+irnDxxPtY0AdHjtBNf1WhQ28nvBIpj5JYzYp+rSoq4GvpfNOtXAZsivbxTX01t6quQjyuy435Zyma/pHfZaU5dC/Y9SRyyXA/PSflaZ+VGwoBnCZMsNTCvDeaSNKsjjuZ63TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XsCSsmi8; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a871c767f5so150335ad.0
        for <linux-media@vger.kernel.org>; Wed, 04 Feb 2026 12:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770237485; x=1770842285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a7T21dYj2jzVmcoQ827qdO5MM8xkWFryIH9pkRGT7qg=;
        b=XsCSsmi8C8uzFghcxG2miU7D+9XiYrfKnM6iHh7xk46hPlT6nPAYoFoUZyJUGJEFeC
         oPEVbL1iOn0h5lCi1uriWehDQpDtWHUdxFWlWSQGHDC2+jb1K7SqWfz3MtEvdui+yGEw
         bWrfrCWDVElPZQj+/DyVwfeANaBFOKI4T6IPjY/DwVea3bNPimlTCSZgoLrQcrSzCbLl
         E19F2MC1I00FEjzwNQympCDUKYF+pVr27X8MiOSqfAneEzfuEuGcYHYelFuWDAoLyYAv
         3n8s+Bb6ONWN8jx0FhiJ4t47oXMN1ZLWQeHR9NykHUTLFgRDGnkSup6t7G0UxQ6giNpU
         vMWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770237485; x=1770842285;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a7T21dYj2jzVmcoQ827qdO5MM8xkWFryIH9pkRGT7qg=;
        b=t18iSuGEQ/hTS5HfH01VGAi9CM3WuvglUaRKv7MZx812WCdS6uJWJpk6C9G46+x1G2
         y8X12GR/exIcRhod990knohowpzJfAOv31RVDCv94Tapngw+A/3X16sAcye1L28O0px7
         DSm5x0KRsATQ/pJ5JVxk0cjVq62aEJ3IzQGxsaj2ZXLFfxYsckyYzomrpYpN/nY/ev4m
         HhN8oGf5JVKSlLXi1YIzI1qfABhNig3lTpf+3RA61y5dW6cKvWlc0M/7bDmDsklW369z
         SNE5AHxIvEY8T9ButahPhkfdKeSN6qRpdG8yEHX/2LtCMCaACCRx4A7SUmtQa9kXHmuh
         mgwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWN3o0wuIx9CxgvbT0olP6EYUGoF/Ys8BNCziFvBsRyTkl7hmol+FLqy9JeLo0FOJB1bOAhvDA6sukivw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnRH5YHkuZopWEfNBbG3Tw9OgS+GCL+FPjgFJmJsIM/sk8tFDA
	XjRY6Bo1BvqfyhLGyi2pQuwTqn39LdT7ucrPtYLtyo13WVv2K1M41Hge
X-Gm-Gg: AZuq6aKr02CzmIPsuQSTdlUy2x318C5UhZZHOjf/mHHkmwBUVzxBrg+7vtPPy3RoS3M
	TLAx6lkUauwXfRWauFsFU2TerIhpwkJ58Pgif//xbsxMakevoSnEiSoP95yCTMtskkccK7Oyt1j
	teKIsKJA0iyCi0iJ2O/st7MrqmQKwR7nS5czg8390Irdj1snsA7X/cbmGxpXpRCCBps78bChyOD
	aOcSmPmhwWHaKsBZ9EtilOffyyIdKcz4TbUtoBrwq2MFA+jbovvqoJd1iXU9S6Ztwp35S3mdOQw
	cCAPG96/wyNXGaJaSif61rcS5KSWRY8yyWJkxCRp7ZrVRiUmEJzNhViTtiu36s0P6eOayL77DH8
	umOLii+AxJHqZ3vpQmjgslFziBjYHfS7Dqeso3QTWtYqwfw9dS3KJmiepRi14P1p5divSLnRgk8
	K2EQJ5C9N/zrDm85i0lpRdVPyWlo2hLmp05wXM6GtwFok2
X-Received: by 2002:a17:902:e54d:b0:2a7:8bf3:5674 with SMTP id d9443c01a7336-2a933ad47bdmr27761795ad.0.1770237485477;
        Wed, 04 Feb 2026 12:38:05 -0800 (PST)
Received: from FAIZEL-KB.. ([2001:569:5999:dc00:876b:c389:85e5:7957])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a933974884sm31136955ad.83.2026.02.04.12.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 12:38:04 -0800 (PST)
From: Faizel K B <faizel.kb@gmail.com>
To: Shuah Khan <skhan@linuxfoundation.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	libcamera-devel@lists.libcamera.org,
	Faizel K B <faizel.kb@gmail.com>
Subject: [PATCH v3 0/3] media: vimc: Add timing controls for fps config
Date: Wed,  4 Feb 2026 12:37:23 -0800
Message-ID: <20260204203726.1820226-1-faizel.kb@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-52214-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 6966CEC7FA
X-Rspamd-Action: no action

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


base-commit: c824345288d11e269ce41b36c105715bc2286050
-- 
2.43.0

