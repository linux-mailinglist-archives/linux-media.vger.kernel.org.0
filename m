Return-Path: <linux-media+bounces-4371-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D618841422
	for <lists+linux-media@lfdr.de>; Mon, 29 Jan 2024 21:23:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 369C21C24081
	for <lists+linux-media@lfdr.de>; Mon, 29 Jan 2024 20:23:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E6057605C;
	Mon, 29 Jan 2024 20:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="V0tA0hE+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D4E76043
	for <linux-media@vger.kernel.org>; Mon, 29 Jan 2024 20:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706559819; cv=none; b=bPe+sBXCxJBeucIDi8jSxkrj1u1VvyzDmFWAkyBEH8tnjyg8EUCLpU7VssjGUMuY019YvuT0MC5kTVZhcH/qmFJBpua7PHu+mdUoAV6fOdcO+IS0TQiAR3zZaGiyGtHNE3hgCFqexw5dM9n+LBUJiQthWOtLFsmU9OL8OsU6hUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706559819; c=relaxed/simple;
	bh=dM6ba2x4HwpYbtuGVDsq1HI2U36g/GnBYneODePkEGs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=B2QRz7byRgonCLv4pEyVzhg+zVfAdIBdxj5257+L4Ej2eTS5Y0HMhoLU7U71NTg1+Z21hqKMoTov6VXUYXimvJtCBZEoKQAxnnTBxW1mQ31B0E+DT1fiCPsvWC4SGX+e22W2lAYs3Tuj3tLnM0lMVCyuITSimvSFlvNOw6U2Dx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=V0tA0hE+; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-55f1102b300so1402202a12.2
        for <linux-media@vger.kernel.org>; Mon, 29 Jan 2024 12:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1706559815; x=1707164615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8QA+buKFMZTRG4ST0AJ8iQJWrU3caTyEcNko8bHD/ks=;
        b=V0tA0hE+4ee88e29+kX/7H9En2wHirm9xpVj1S2c4bRgDEq+aGLlciLRE0nhu1uR6b
         kAZ/Cr1zh/Xv7wh9aNxOj8Sl4xMLqhpApuXUHRuNK3YhONDP9ZJlxQKTFp6jvDBchBXB
         bYkxPC6CE2GsfAQ0g04M1QY70ADtMQwRH6F1FzLmtHnFdruBuDyjqNqR5EMdN4bufK1z
         4DJNz7dgYtIcPtELgov6rWq/tvHG3IkVcWXrSLqSWAdbyokLTpOC8PVOtxvUIqc3B1MX
         +scpUKQS3sQ+pDwEeIEVnI612cekUSVy0AbJMlCrneTW1lWR4camJMZQO6ZkqbcEOhQn
         yMvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706559815; x=1707164615;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8QA+buKFMZTRG4ST0AJ8iQJWrU3caTyEcNko8bHD/ks=;
        b=iQyiFzvsIbTqJOWwUm1MK6vkLS/nQCcjDWAR7sn5YQsAG2yuy0EI0m+IAQyhiIHMaC
         f4A030T+G5KEt/h63+okkak/xjx98pALQ8ob2HTaAEZLFSkAET/HhgNNLTKQqmrYeBC5
         6rt7ytUMvSKllaG9gwaKR5tkI3k/Ns8oPRqXXRDqzaQ3hGuKzpqqwcEGWn4w94HjxDcu
         dX1eCxoo00GUup0S8TEWwcsm+Uo1N3rqXYNCbtww8n5iWOoLr3zFiJrceFBGpF3O5mo6
         Cj/4ADAz2C8czidgLCzHsHzV6tDBm1dZ7NCyZB/srDEFSbZSFF6kfcHcqvSnkNuJQWgu
         iHfQ==
X-Gm-Message-State: AOJu0Yw62tcbjTsPx3rbLKRiM04dyTJe2MhyDRnJLeobtlOuQHPBY3ci
	ruAP3bNxKHUcrykmM+hCDozuLI47fnbK9P9xgGca/SZVoyc91qd53tX969v/JoE=
X-Google-Smtp-Source: AGHT+IETGB+AFgPofgFxiy09dTmzqQ7BzupeOQ/NuMTc2gGkAMd8OhNl3PVB4cTC15tE8X2SZyZW+g==
X-Received: by 2002:a17:906:410b:b0:a35:e63d:dcfa with SMTP id j11-20020a170906410b00b00a35e63ddcfamr1717365ejk.7.1706559815102;
        Mon, 29 Jan 2024 12:23:35 -0800 (PST)
Received: from sleipner.berto.se (p4fcc8c6a.dip0.t-ipconnect.de. [79.204.140.106])
        by smtp.googlemail.com with ESMTPSA id mc4-20020a170906eb4400b00a338fedb9ebsm4316386ejb.54.2024.01.29.12.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 12:23:34 -0800 (PST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/6] media: rcar-vin: Make use of multiple connections in v4l-async
Date: Mon, 29 Jan 2024 21:22:48 +0100
Message-ID: <20240129202254.1126012-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

Since the addition of Gen3 support to rcar-vin the driver have worked
around the limitation in v4l-async that a subdevice could only be bound
to one notifier. This was needed as each VIN instance can be connected
to the same CSI-2 receiver and each capture a different virtual channel.

The workaround was implemented as a single notifier that was registered
by the last VIN driver instance to attach to the device, and
unregistered by the last VIN driver instance to go away. This lead to a
lot of complexities as the driver had to synchronize between them at
different points in the life-cycle (probe, v4l-async complete, remove,
etc).

To complicate things even more some VIN instances had access to its own
private parallel interface that also needed to be a part of the media
graph. This lead to some VIN driver instances having to deal with one
private notifier for the parallel interface and interacting with the
shared group notifier.

The limitation in v4l-async have now been addressed by [1]. This
simplify things quiet a bit for drivers and this series removes the
concept of a shared group notifier and implements a single notifier for
each VIN instance. This single notifier covers both the parallel
interface for the VIN instances that have it and all shared subdevices
that are readable for each VIN. This also simplify the media link
creation.

This series depends on a fix to the v4l-async multiple connections 
posted separately in [2]. Without this fix the probe order can cause 
regressions in functionality if the rcar-vin is not probed after all 
subdevices it depends on.

Patch 1-4 are small preparation patches getting small things out of the 
way while patch 6 is a small post cleanup patch. Patch 5 is the real 
work in this series, it's a bit large but most of it is removal of code 
no longer needed.

Tested on R-Car Gen2 (M2), Gen3 (H3, M3N, V3M), Gen4 (V4H) with latest 
v4l2-compilance and other VIN specific tests without regressions.

The work is based on the latest media-next/master branch.

1. commit 28a1295795d8 ("media: v4l: async: Allow multiple connections
   between entities")

2. [PATCH] media: v4l: async: Fix completion of chained subnotifiers
   https://lore.kernel.org/linux-media/20240129195954.1110643-1-niklas.soderlund+renesas@ragnatech.se/T/#u

Niklas Söderlund (6):
  media: rcar-vin: Move media graph pointers to device info
  media: rcar-vin: Simplify remote source type detection
  media: rcar-vin: Fold simple functions into only caller
  media: rcar-vin: Register the media device together with the group
  media: rcar-vin: Remove the shared group notifier
  media: rcar-vin Rename notifier helper functions

 .../platform/renesas/rcar-vin/rcar-core.c     | 639 +++++++-----------
 .../platform/renesas/rcar-vin/rcar-dma.c      |  48 +-
 .../platform/renesas/rcar-vin/rcar-v4l2.c     |  44 +-
 .../platform/renesas/rcar-vin/rcar-vin.h      |  34 +-
 4 files changed, 289 insertions(+), 476 deletions(-)

-- 
2.43.0


