Return-Path: <linux-media+bounces-59842-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBtpGhGr8GnOWwEAu9opvQ
	(envelope-from <linux-media+bounces-59842-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 14:41:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDD5484FE3
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 14:41:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EFCB3300C332
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 12:41:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D26EF43CEFD;
	Tue, 28 Apr 2026 12:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="e9R6DWm5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0956F42EEC5
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 12:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777380084; cv=none; b=egIRQ6tsNfWh486MGveo5gg4yInEWHy5orpQF4hURkvVmEvHt+ULqvVYzMDf6ayS8feobY5YoLZAYEC1ry6wW0E4NCANmMGYyRjmeWsmWAvIdtQazjpa3ZOhJ6ziJ97rICUxePz3nmUIMLx7Mxl4we9SGWYGYt1PPfSahxheA+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777380084; c=relaxed/simple;
	bh=y2Qty4JaBo8ngXcVzl1XbUBhz18x+GuUcEApRBK6CVM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pZ9CZH/kaG5vyyXxr5kskI6eey+7fNm2XsteEOrDT9wA++AOkDVDKka+GWUe5Ee54plRiQmKULSu4xX/PSqCd258LbJsn/YUIndRW8/C5BtHQbL9avsrTayEnvxTliceLLwzZwdaSUmLDqRUObh1GD+Mi6jAq/Ll9dQtuBsfNHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=e9R6DWm5; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a3d42263e4so11242740e87.2
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 05:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777380075; x=1777984875; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ckYgYV47kPjoUmAXaUUXbyKF404Pki34Nnqg+80/hfc=;
        b=e9R6DWm5bw/4VTCCDlU7aBkq6jTMAAOl3U6nc5qIj26M77qqEcQt/L/O2kLUlVwXi1
         w7UtfeBg/X45JjNxvv+2bJOlCly4QygEaECbWf0boH9wYN16IN78VV5UDfLCZ3upLmVX
         /I2Uw2oGLHy3gOcZh96X945UYKpwTQ+ijxl7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777380075; x=1777984875;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ckYgYV47kPjoUmAXaUUXbyKF404Pki34Nnqg+80/hfc=;
        b=O5sK1wAyZA2U/RXU3qi25uJefunuCpAvwUIPlgf2zbapeUV1IBJQr1Xd/ys4iZI6l2
         yb/EieGhEPrDDj6Fdx0Ybze1V/iS1aUIDfcfqABclKVnXzmN0pAlbSAopef5WZzJBkNI
         KHuWkuZmOUPYmUeG5Uy+3A3MwsHL520a0WbvXpHjKEg7tfSEQkEORagAabCxRWIPY0qQ
         rZSy/uT4M3WaLd7ww+Octej9FdaLly7Ot+zO2drFzgv0xjQwG2vH9vEYROROJgbtclES
         ys+E1XfFp5dw58xpufyzzEhJO9c8nNSPeQ2Hf978pQKdVwQ8dmxL3FbI9JsMBM0x5H2r
         KAIA==
X-Gm-Message-State: AOJu0YxLpXj0Pi2nmh0IR7EQb/hzKEKgADnliV/NwBHnkiqI/uJcieRX
	3Enob6P+8DNgi6+qNEBWvPpBA0pFGTeRkLMOs3KvE3yrMYpkMdNdulq/VO1M4rpDgw==
X-Gm-Gg: AeBDietjy2C+osml4bPU6+N+Yo2eDLH5H25wh1wZaxHxFTyHCBCaPL5AHEVd3R4vxRs
	v9/UAFNRXSz0rfbB79+dRR6WiVylBgAKx7Pxa6bbUGHSeGjGz1gJydAf/Syy8mLPe3DKUksx96r
	fKqfbMPFphW9DZR8zAhptvd1Wo149/LGY/Luhw2MT2e0TEQmaHvurjgyk1TvN6USWzcdrOQZHoj
	0W46P+DkvodmIRhv8wagZdIaG4KoajHQZyx/w/tdKq1cfsrAV2FUSinf2ZuKZGmgAmz7vt8HQXr
	6W4RlBaARB2clGEfowFD7EpgWI9+RJooJq0oSgfMLVaC4RlhU3ScJFF0sgeJL7mMc9hoUL90G56
	B9rOmx2xBvSYaNwgKFWLiKBlf5ZD1jJscxge8IQLWbaLtebdrSGC7Q0bRFtOFutdDIwVP133RJ7
	IYMfezVDl5rCIYjMWTmaHz0C6PIlvgWc18rAbb2yO0x8SZHBZ/3fsS9oM/3dwy8uNGDv7+YMls+
	DcAQ04NKnZme9HFVIBWN3jSRQHH
X-Received: by 2002:a05:6512:3b12:b0:5a3:7528:6da1 with SMTP id 2adb3069b0e04-5a7462d2698mr1139729e87.0.1777380075075;
        Tue, 28 Apr 2026 05:41:15 -0700 (PDT)
Received: from ribalda.c.googlers.com (52.163.228.35.bc.googleusercontent.com. [35.228.163.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a7463f5fb5sm594617e87.38.2026.04.28.05.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 05:41:13 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/6] media: Fix new smatch warnings
Date: Tue, 28 Apr 2026 12:41:06 +0000
Message-Id: <20260428-smatch-7-1-v1-0-46890dffb611@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOKq8GkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEyML3eLcxJLkDF1zXUPdFEszSyNLy5QU4+Q0JaCGgqLUtMwKsGHRsbW
 1AMvtEE5cAAAA
X-Change-ID: 20260428-smatch-7-1-d969299dd3cf
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Nas Chung <nas.chung@chipsnmedia.com>, 
 Jackson Lee <jackson.lee@chipsnmedia.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Keke Li <keke.li@amlogic.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: EFDD5484FE3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-59842-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,chromium.org:dkim,chromium.org:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

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
 drivers/media/v4l2-core/v4l2-dev.c                      |  6 ++++++
 drivers/staging/media/ipu3/ipu3-css-params.c            |  8 ++++++--
 6 files changed, 32 insertions(+), 5 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260428-smatch-7-1-d969299dd3cf

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


