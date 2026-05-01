Return-Path: <linux-media+bounces-60126-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OdBJDqQ9Gn/CAIAu9opvQ
	(envelope-from <linux-media+bounces-60126-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 01 May 2026 13:36:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F26C64AC14F
	for <lists+linux-media@lfdr.de>; Fri, 01 May 2026 13:36:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 568EF3026F10
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2026 11:32:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D466363C4C;
	Fri,  1 May 2026 11:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="P7THG5Cs"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43E03290C5
	for <linux-media@vger.kernel.org>; Fri,  1 May 2026 11:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777635177; cv=none; b=dgMu+yXIyFcN6Dp/EImW68BNIP9/4BL0lCDg8sScqOMkR5iDqnN6lGhMRZCa9PnesrNzux1rDeOnKIiNE9vWzDdufXp6u3JgcY4LCfu70OGV49NcRhqyadqCckuun8T5dJWQZx8jEHOB9Ux6KS3ERGn9/Bfv0Fcnk/aBnKLyTbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777635177; c=relaxed/simple;
	bh=lNE0nPjKixAgd1P12CjQb2oJjktRa0U2UO4AEVXrWtc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=g1KYynEIcIahw3FyJb/4eKZPqwZ44FEkBBBqt5smLzh606vPtnQAn+4p2Jn2UmJSpyZfgEz1M+OUTeGguScH3EzwXM0SUJFcNQ2Kcce9TK5oVPHeca7NxWyIVib8VbaNVnDg6tVAWPf/aJkPxgRQ20b3749f919uL/MZL6MXWSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=P7THG5Cs; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a40b2d26a1so1504742e87.0
        for <linux-media@vger.kernel.org>; Fri, 01 May 2026 04:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777635173; x=1778239973; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Io9wfmVyuN/9T/zzUi+4EApFsonZHuvDhFNcgPKwqIU=;
        b=P7THG5CsHpbEZxxKLFVqL6PPQwB7XoKXmw1XI7ZcRUrLmfLC7VO9/z8NxvpTERQ57V
         //RuIp88VhTef0zpoCevipVsABfZxFSJhTfNqf2qA0XDgj9/PgUg2WgCmSszHtJqPbqs
         VUDwJNYZxVYaAd3nqUOSn0vKwKnEFMpy4fJK8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777635173; x=1778239973;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Io9wfmVyuN/9T/zzUi+4EApFsonZHuvDhFNcgPKwqIU=;
        b=IjTPChjiyS0aEbvThbTQNA/+Jpa9igMccxXAFJBiR5YhX3Y1s9/Lc7zUaLprj0s+N4
         7QvcOYV70Bawaj5q+KmQAlevcjvnwU4r64vBWHZR4610N2BxJ/8Mmss1+SNRWVnTv3rR
         Z35p1eS6/lz4e4JkFCnMhQFdbfpu2AkDGj9ticeFz2QxRQOnLZ7GxOQhX2bq63bsseRK
         fHuNBupi2GzRP9nDzCLcMabtLfePcTmns0qK98u3jBWPdwg6zvk2jlY69KY14aJcT5Y3
         FQ92s8GFMwC1v6s5DFbenbIAGARfEU+DIwDhx8OKQnEE8EPZHodZkTa3x5K3xekYOc4J
         YlTw==
X-Gm-Message-State: AOJu0YyNEZyrMkA88qGYgRChiy+6rE24eIKVLcejDr/ipsVvWY5dJOFp
	nIE2BMsJMvnQKYHMCzUzRe8iISfb6qPHCy8dBu2x5tyecQ40uRhTPoPlj6Srra773g==
X-Gm-Gg: AeBDietI0w6j/Oit1dLHpeoEIg6LK5ZVOmXG+XJixHw7+lC0p4TstMQDNC846PnO/Sx
	/3Tiv4alq6/clfnV05MI5A0KlZpSND1Mvzb2FlxPzJz50edOUlLt/t8U6aQxJg/A//zzQqKNY12
	MbgD5/Q7vm0Uel+If0g7Xx23WKFLZkkf7JtrKJ7LBsGn9UCiY8ZR2fdHZ6yhUyKJDZwH6241bnl
	MC7mobl5Bv396qGBg1RIlDVUP7G/xjleZ3FfF3EU/pdFJVWF8uxzfe1sR61x/jKwPR5LC+uo4I4
	Xgl4RSVpygEU33QBsMR+UHUqhjwCRLFjQtKdww3um5RAPGUqpcAYpVnw18xTYTt4I7EtHb2NY8z
	RdFZTSFy3+BH+Zkd9HuGPgb5ZDjTaNXU6/66YjvMXY5WgbF1wDENTv1hIsDLnuUYJDqSd8ojH/J
	Vm6z2ILzuS/tUmSrCFJ4PeXtJvprKm3Zh953fs7caG7/sk+FQbulmMqMhewrQPVJLsUO4h/thti
	z0gqjULOJYhnOVJfyL+jEuFdKYO
X-Received: by 2002:a05:6512:31c5:b0:5a4:4cc:7a52 with SMTP id 2adb3069b0e04-5a8522d0d4cmr2841534e87.17.1777635173080;
        Fri, 01 May 2026 04:32:53 -0700 (PDT)
Received: from ribalda.c.googlers.com (52.163.228.35.bc.googleusercontent.com. [35.228.163.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c346c02sm429166e87.74.2026.05.01.04.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 04:32:51 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 0/6] media: Fix new smatch warnings
Date: Fri, 01 May 2026 11:32:45 +0000
Message-Id: <20260501-smatch-7-1-v2-0-a2fcfb2531ac@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF2P9GkC/23MSw7CIBSF4a00d+w1gA0WR92H6aDyKHdAMVCJp
 mHvYscO/5Ocb4dsE9kMt26HZAtlimsLcepA+3ldLJJpDYIJyXoxYA7zpj1ekaNRUgmljLloB+3
 wTNbR+8DuU2tPeYvpc9iF/9a/TOHIsJeDYsa5h+R81D7FQK9wjmmBqdb6BUdKOM6nAAAA
X-Change-ID: 20260428-smatch-7-1-d969299dd3cf
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Nas Chung <nas.chung@chipsnmedia.com>, 
 Jackson Lee <jackson.lee@chipsnmedia.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Keke Li <keke.li@amlogic.com>, Yong Zhi <yong.zhi@intel.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: F26C64AC14F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60126-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[chromium.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,samsung,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,chromium.org:dkim,chromium.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Current version of smatch triggers some warnings for the media tree.
Most of them are inoffensive, but we would like to have zero smatch
warnings.

drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:111 c3_isp_params_awb_wt() error: buffer overflow 'cfg->zone_weight' 768 <= u32max
drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:111 c3_isp_params_awb_wt() error: buffer overflow 'cfg->zone_weight' 768 <= u32max
drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:227 c3_isp_params_ae_wt() error: buffer overflow 'cfg->zone_weight' 255 <= u32max
drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:227 c3_isp_params_ae_wt() error: buffer overflow 'cfg->zone_weight' 255 <= u32max
drivers/media/v4l2-core/v4l2-dev.c:1036 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
drivers/media/v4l2-core/v4l2-dev.c:1043 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
drivers/media/v4l2-core/v4l2-dev.c:1101 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
drivers/media/platform/chips-media/wave5/wave5-vpuapi.c:588 wave5_vpu_dec_get_output_info() error: buffer overflow 'inst->frame_buf' 64 <= 127
drivers/staging/media/ipu3/ipu3-css-params.c:1792 imgu_css_cfg_acc_stripe() warn: 'acc->stripe.bds_out_stripes[0]->width - 2 * f' 4294967168 can't fit into 65535 'acc->stripe.bds_out_stripes[1]->offset'
drivers/media/i2c/adv7604.c:3672 adv76xx_probe() error: buffer overflow 'state->pads' 7 <= 4294967294
drivers/media/i2c/adv7604.c:3673 adv76xx_probe() error: buffer overflow 'state->pads' 7 <= u32max
drivers/media/i2c/mt9p031.c:799 mt9p031_s_ctrl() warn: assigning (-1952) to unsigned variable 'data'

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v2:
- Remove WARN_ON() in user triggerable checks.
- Add fixes for user triggerable errors.
- Remove pr_err in v4l-dev
- Link to v1: https://lore.kernel.org/r/20260428-smatch-7-1-v1-0-46890dffb611@chromium.org

---
Ricardo Ribalda (6):
      media: v4l2-dev: Add range check for vdev->minor
      media: i2c: mt9p031: Rewrite a bitwise mask
      media: i2c: adv7604: Add range checks for chip info
      media: chips-media: wave5: Add range checks for dec_output_info
      media: staging: ipu3-imgu: Add range check for imgu_css_cfg_acc_stripe
      media: amlogic-c3: Add validations for ae and awb config

 drivers/media/i2c/adv7604.c                             |  6 ++++++
 drivers/media/i2c/mt9p031.c                             |  2 +-
 drivers/media/platform/amlogic/c3/isp/c3-isp-params.c   |  4 ++++
 drivers/media/platform/chips-media/wave5/wave5-vpuapi.c | 11 +++++++++--
 drivers/media/v4l2-core/v4l2-dev.c                      |  5 +++++
 drivers/staging/media/ipu3/ipu3-css-params.c            |  8 ++++++--
 6 files changed, 31 insertions(+), 5 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260428-smatch-7-1-d969299dd3cf

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


