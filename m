Return-Path: <linux-media+bounces-21792-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B509D5B2B
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 09:42:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C6B721F22EB0
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 08:42:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E84519CC21;
	Fri, 22 Nov 2024 08:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="PD6FVlLl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f100.google.com (mail-wm1-f100.google.com [209.85.128.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7B2165EE6
	for <linux-media@vger.kernel.org>; Fri, 22 Nov 2024 08:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732264928; cv=none; b=Xqfy1Rr1oAXbo1j5XYONlENXW23mcCPeP1APV8B85UFItLglMqCb/xx4WMzf/zPqqygftBzACSVMjtAcTfdGBkd4X7TGLULSF8TFy7nm5Iq3jZ8e3DjHHjAn7dx89PU2vdK5lFYy9CIx0XL2ngFvFzD5XZEHBAjpJyctpLFA7Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732264928; c=relaxed/simple;
	bh=gyfCG79XiYVSu5E2XxIFQwPy9Pgyq7hGjGVSKc8+UQA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XbWLOT7g79EFNz9n55p6HJN2oHuV+zaPZMbKFcS9uTTbeg+QkkCjqY25Hi0gZpPb9P2dlQVyfzOm+pxte73/hIS//tNVnqv3QHgMjo07aCeiBtIhG0BG7yVmYrYpnM7EhAI5iw+ZEThLQiYZoJ/o8VkzdezPEpoH72As/jLGBbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=PD6FVlLl; arc=none smtp.client-ip=209.85.128.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wm1-f100.google.com with SMTP id 5b1f17b1804b1-431695fa98bso14877975e9.3
        for <linux-media@vger.kernel.org>; Fri, 22 Nov 2024 00:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1732264924; x=1732869724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rEi9zewFPs0DWCsnyF4sCjmoP2vBLTY2BvhGWxJf1X8=;
        b=PD6FVlLlpDMKA3JYfpaFQOWx2ie5mow/nf+9S8XyPrezi4ds/1zJ30ULstdtTkREFm
         gQhQp3pHDZCaaLshdyyGXR/IKepkeEUCKsafXiRuSaQzmTo11dl8jFj4cVTdoLSfyTY9
         Y/CEBwM4O2YGhqTTxAE/oLjM17amsoWObcF2J7Jt463SkW0ZWMzeS/xF2Je1+IBHNGYg
         a0BjpkPvQRgJHwt2M4RfbmRzxIEnl+pca0Kck4214l4q6NfTmNyl1DcWEDLqQepHUic4
         PPEq6KdJjqvfiRlXHUr7MVeaORvxNjZ1sRC1x3LyKPOSig25r+1QHVeYjTuJ+DB27Ath
         qd9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732264924; x=1732869724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rEi9zewFPs0DWCsnyF4sCjmoP2vBLTY2BvhGWxJf1X8=;
        b=Dpnng3oFPr+5a4c6AoqQNlZFwYtd1RpGsqhcBTENfbbASiZzuc7rk4ZyTohURvVqNO
         NGVWdKS+/rmnlC9v566kCRvxzV+SmlhJoJQJ97DNnsdoCDUtMe3w48+2qq9tAbtfBWey
         oUSzqgu4RoywhiJ9G22hZZiKRBrXmP//fjte8Ilz5ycDM/4aZHP4ySJGzDJhdQxWOnun
         asRPuokgGmmGxX1+8/eUKEfcBcj97Szdcsx2v0cbrK2Wu9MV7KFERxZr0NjTIgQ/5Gpf
         3/qNMDTdvFhGBchQpglVZWA86WtMOht/tIVwe1Kj+i6EMkoayms1s3jrz6vcq+QqqNwl
         I8Zw==
X-Gm-Message-State: AOJu0YxGyrIB9yv5gD1xAP6JKUT7YA92k6qcte99nwJ7QyG4D2EgKqr4
	umIRkVM1mBPC7MEfi1+kBcfHoP2ikXQIx/OXc/4XXAXz4lwdCG61LZhHx/63565hZsVDg+WBJs8
	IDs6fjeB2ae62mijV1cvuGTJsU65ysF6e
X-Gm-Gg: ASbGncspSb43rDOXQvNCnOznvt0BFZdUJnTGLBRihnmQdFAS6a0YFhFE92YOAlMhzov
	E37GAxd5Y2arGlSoHcwPIO3VBZhxkS73WeK9BKyXauq8cxKFRu6u1Kq+0PHXELqSH2huSXUEO8P
	/KS6fwHXxLoTUvK2LIAkK34Qb5RNV44drKj7F8HaFhUXh12nzQKzkRzd2AdE1gZGNDUcPxqBtbc
	0Q7OxpDyi4tGzD6oGf23HP9S/Eni+zTz3D7x2YZ06b39L4ytydZpPu5P0R4IK1wxw==
X-Google-Smtp-Source: AGHT+IHt2eHtin+KC/mW/m8nqn+k/IAFYJnYIBAS+qecAInjN1Uz6Zv5ysJMIl9yTRvi3sUILxl9g73+D7Yd
X-Received: by 2002:a05:600c:3547:b0:431:6052:48c3 with SMTP id 5b1f17b1804b1-433ce434edbmr17674015e9.16.1732264923575;
        Fri, 22 Nov 2024 00:42:03 -0800 (PST)
Received: from raspberrypi.com ([93.93.133.154])
        by smtp-relay.gmail.com with ESMTPS id 5b1f17b1804b1-433b464119csm3900725e9.47.2024.11.22.00.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 00:42:03 -0800 (PST)
X-Relaying-Domain: raspberrypi.com
From: Naushir Patuck <naush@raspberrypi.com>
To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>
Cc: linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jacopo.mondi@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Naushir Patuck <naush@raspberrypi.com>
Subject: [PATCH v1 0/5] media: bcm2835-unicam: Upstreaming various improvements
Date: Fri, 22 Nov 2024 08:41:47 +0000
Message-Id: <20241122084152.1841419-1-naush@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This patch series contain backports of several fixes/improvements taken from the
donwstream Raspberry Pi kernel tree:

Patch 1/5 improves the handling of frame sequence numbering.
Patch 2/5 allows userland clients to return CSI-2 unpacked formats from Unicam.
Patch 3/5 fixes an intermitent HW bug where the first frame shows corruption.
Patch 4/5 fixes a possibly HW overflow when using the dummy buffer.
Patch 5/5 improves the robustness of the interrupt handling, particulary during
fast framerate operation.

All these patches have been present in the downstream RPi tree for some time now
and have been validated by our users.

Thanks,
Naush

Naushir Patuck (5):
  drivers: media: bcm2835-unicam: Improve frame sequence count handling
  drivers: media: bcm2835-unicam: Allow setting of unpacked formats
  drivers: media: bcm2835-unicam: Disable trigger mode operation
  drivers: media: bcm2835-unicam: Fix for possible dummy buffer overrun
  drivers: media: bcm2835-unicam: Correctly handle FS + FE ISR condition

 .../media/platform/broadcom/bcm2835-unicam.c  | 81 +++++++++++++++----
 1 file changed, 66 insertions(+), 15 deletions(-)

-- 
2.34.1


