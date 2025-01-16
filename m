Return-Path: <linux-media+bounces-24851-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5025A14108
	for <lists+linux-media@lfdr.de>; Thu, 16 Jan 2025 18:43:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 143433A86DC
	for <lists+linux-media@lfdr.de>; Thu, 16 Jan 2025 17:43:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6880E22D4F2;
	Thu, 16 Jan 2025 17:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="MlgmPuEW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00FA924A7C6
	for <linux-media@vger.kernel.org>; Thu, 16 Jan 2025 17:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737049403; cv=none; b=qju/Pvgg3iJ1kaBMuO3rduYtTV/U+jxg5mjpPyTva7bk+mjPrc06WkcBIe3tVjDr6xU8v7WWxMG8akvU7ix0U5RxAMG10sUW9UH0rKziJ6DY9TiRrg0Iet3gQeKvdVzHGIkJ6ssO17UYPRzNyFnZOSKavLnb4UrM21BVKyz3phg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737049403; c=relaxed/simple;
	bh=Y1pabMmH7YRliAZs+Z4mKbj01MVj21blZMjM4JzAJxI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=G3KPd3pScZSloqiCxsDCc+2G8Zk3kAn3pLK51en+KMVRDJGCIE8c0cslN58y721jVq1ILgqVmKbm2WNIKZ/8j66+5v49gpqnlL0nK63oDV1uoNtxvg72bTrh+4c7mKPpz2H96ZjWsLfeADRqqQ47R6u7W1VZFVR6s0iXl7qSvkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=MlgmPuEW; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4363ae65100so12884925e9.0
        for <linux-media@vger.kernel.org>; Thu, 16 Jan 2025 09:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1737049399; x=1737654199; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j3YA9sHENksb0UryqGKUfuCuEETykxFTVTrMS3uSfjs=;
        b=MlgmPuEWbDmT0jjLEUD730OvrC42IQi5euz71ZDp3pKIwHh9uAX8mlakZY/EFbxH9j
         6yGjnBdJn9kZuhUBZ+BOyef88FHkDKrsuNA1iYDfnPvcz4ufkrXhaamqbIRyb43gIrN4
         AGJyLoW+Rm59aaUsxMQXYwkiJOqqexr0UTUW+IOZnTIydhxsiBJ6yuOquNFWEo0Dagrs
         2/oA7mMrSLUIq5riCoRz8Pq8glPa+cIfj4G2AGya/1x/OB0/BGLNlIEpS4t4Gk6PZCDi
         Co3eu5tpAEfGK9gwLaYATnHdgmxpXlhnTLIQM92DKgAWAq0fwYXyExcz0l998teo2ahZ
         mNlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737049399; x=1737654199;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j3YA9sHENksb0UryqGKUfuCuEETykxFTVTrMS3uSfjs=;
        b=HUurn4L/r+gTNifFrqd/ispsdImpHz73UAbYpqBeMh2ew7qy7JbhrnIdGwged7mcJD
         LorhIYP1Q/ZFFUPRObZkt0c8H/LvPNE30IqTAwlgGQ1iD8ilhXzRGeJoznaJhSuQK2GJ
         5VNIbINBgMhMP24zzR0efX3SZfrXOzCPfcRnbHcyzRvhyOHjFgJBCWdPM+NeSB+mNEaB
         lbj3w93g5F1d69lk/rLTAsdSmRYxpH4h8e1zBNs6xWOOssNgKW8JNHTRPBKyVZwreuXU
         slUzS0FmIWffLQYvdHIWpwxTyny46Bedu31R/Ml+Vcsxvb5EooaWK9/w913NBr/98HS9
         WfEw==
X-Forwarded-Encrypted: i=1; AJvYcCVYRMmbDWtt4K5O/IqiCwsSHzfWA2iN4j+kDnZ53ogEbQk3h1XD7rTgJVVBZmXixibueCu7yrgWecuI2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDkkFiG0BMBLapnHiHf0OJk4dqOKQFH3GsIomoPWztHkr6wPEV
	ZKZiPZ64y5b38/6Wq7YBCxnlOkh0sZ4ygahGcHkL7YncGrnEtTZp5YrtGPQ4jow=
X-Gm-Gg: ASbGnctVZzrsNagLY2JGuPtsA+TQ/68uSwaRzNK/BDtEuCaeiem7FVa2ijmPkGwIqQg
	m7Inr72Z2kHvXsMoGC6xrrpxOKH4ueuvdFVivLYAw45Q2tuSREyBAX0RJ1zO1GTXByyDYWT0Nzb
	2Bghj4Dso4az+UZFbO1YgSHEItI9nhDPmcnBZz78OFkDC26hUSl4N1XGtN1F9zMjdSQYVAvy5PP
	FEug/u8EoR1CoS3NPhH+Pm8WLgNAt7zyrYKbNwCJMjYtWd3
X-Google-Smtp-Source: AGHT+IFFg7WzxkZ96chd2GKBiNfdxHJwqsZpwNamttgrdvRV/nHMQF4pIswJFdM4w5YK0/o5LGpL5g==
X-Received: by 2002:a05:600c:1da8:b0:436:6460:e67a with SMTP id 5b1f17b1804b1-436e889dff0mr256375695e9.25.1737049399283;
        Thu, 16 Jan 2025 09:43:19 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43890413053sm6302515e9.10.2025.01.16.09.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 09:43:18 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 0/3] media: imx415: Improvements for framerate and link
 frequency control
Date: Thu, 16 Jan 2025 17:43:08 +0000
Message-Id: <20250116-media-imx415-v2-0-735263f04652@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACxFiWcC/1XMPQ6DMAyG4asgz02VBAhqp96jYnDAFA/8yKkiE
 MrdmyJ16Pja+p4DAglTgHtxgFDkwMucw14K6EacX6S4zw1W21ob3aiJekbF01aZWtl+cA2SNfk
 DebIKDbyd3LPNPXJ4L7KfejTf6w+6/UPRKK1K5zw6tGWF/iEYVk8i+8rXbpmgTSl9AOViC0KuA
 AAA
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Michael Riesch <michael.riesch@wolfvision.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Gerald Loacker <Gerald.Loacker@wolfvision.net>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

The driver was using reverse engineered pixel rates, and had different
values for different link frequencies.
In common with the other Starvis sensors (eg imx290), this isn't
actually the situation, and the pixel array runs off a different
PLL to the MIPI block, and there is a FIFO between the two.

It's not quite so simple as HMAX is said to be in units of INCK,
not pixel clocks. Working through the various modes that appears that
even that is slightly wrong as it is units of a scaled INCK of
either 72MHz (for INCK = 24 or 72MHz) or 74.25MHz (for INCK = 27,
37.125, or 74.25MHz).

Rework the configuration so that the pixel rate is fixed, with the
different link frequencies adjusting the minimum hmax value so that
the FIFO doesn't overflow.

Switching between 2 and 4 data lanes also only changes the MIPI data
rate, so also can be handled by altering the minimum HMAX.

Once you've got HMAX / V4L2_CID_HBLANK represented sensibly, then
frame rate control through V4L2_CID_HBLANK and V4L2_CID_VBLANK is
trivial, so add in frame rate control too.
Exposure is set in lines (as usual), so amending VBLANK changes the
range for the exposure control.

This has been tested on a Pi5 with Waveshare "IMX415-98 IR-CUT Camera"
module (SKU 28524). That uses a 24MHz clock, so only the 360MHz and
720MHz link frequencies have been tested (other frequencies require
a 27, 37.125, or 74.25MHz clock input.

It'd be nice to add support for 12bit readout and windowed mode readout,
but those are a job for another day.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
Changes in v2:
- Fixed VBLANK fall-through for setting the exposure correctly
- Sorted the checkpatch complaint over using fallthrough; vs commenting
  why we're falling through.
- Corrected HMAX for 891Mbit/s mode. I now have a module with 37.125MHz
  clock, and have validated that.
- Link to v1: https://lore.kernel.org/r/20250109-media-imx415-v1-0-366ba6a234ab@raspberrypi.com

---
Dave Stevenson (3):
      media: i2c: imx415: Add read/write control of VBLANK
      media: i2c: imx415: Make HBLANK controllable and in consistent units
      media: i2c: imx415: Link frequencies are not exclusive to num lanes

 drivers/media/i2c/imx415.c | 182 +++++++++++++++++++++++----------------------
 1 file changed, 93 insertions(+), 89 deletions(-)
---
base-commit: 94794b5ce4d90ab134b0b101a02fddf6e74c437d
change-id: 20250107-media-imx415-2df67ae21107

Best regards,
-- 
Dave Stevenson <dave.stevenson@raspberrypi.com>


