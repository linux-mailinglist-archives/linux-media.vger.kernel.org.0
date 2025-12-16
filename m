Return-Path: <linux-media+bounces-48915-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC23CC4038
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 16:43:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 16DE930456E6
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 15:42:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AC3836921B;
	Tue, 16 Dec 2025 15:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MuJyvKtr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4602D231A41
	for <linux-media@vger.kernel.org>; Tue, 16 Dec 2025 15:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765899749; cv=none; b=sDovp74Umz7/ex0xpEvuJvf6QSFo1q93IsLqy7jFENFyPL0sEJvufdXnn1ne1r1KN0bYKf8a3tAFGg0H0xVgUoW0BJlvp2DShrL2SqN2AttWgPI9VCsSajoy6pJ608qnW5CGr/aeBLetbD3kqcwSVUXC/ZO4euzl6hGUMoBeGTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765899749; c=relaxed/simple;
	bh=GjTksOg/GY9xK/089E43Pg2FZR+qAF/QxOIBzlDRHrA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZcpsPCBTLdWLU4nQ8SXp88xBK7PRE/fQBGQxuzRXSArRD2nwaNiMc4KxEZcoCv2ThkhSPgfYIbF9/XKuxcL0Ft/Tr/ZECq8L4VfNKm3MZTLqEHXV8F46jD8MTEMRznqTeyzsTcxzQ6Td5yWlZQwm+LV/TnO1Dsz0wp/GykLR8MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MuJyvKtr; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5958232f806so5511879e87.0
        for <linux-media@vger.kernel.org>; Tue, 16 Dec 2025 07:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1765899745; x=1766504545; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y7mryX1pPR4ud4oxX9lWcTv5qZ4b+nUaJACIVLq8hPY=;
        b=MuJyvKtri569s+d/9IlbUzIwqE6cDTGVv7GQ8wSY0Rgn2jSjyEl42X8HmZD/1jLeyj
         7ILZUMSWqarzzz7CMvfsxdr7Bzv2pPz8V1fsQBEQWCUj2CXS11K1GAMCt8w3Ll0mkhpb
         kVc3L4Zrj80NHaHp1dFwujLZ3PDZkLX4AjGRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765899745; x=1766504545;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y7mryX1pPR4ud4oxX9lWcTv5qZ4b+nUaJACIVLq8hPY=;
        b=krzOKVEw/I6Fz1Z1tU/TxkBXnlJaFR6kerjdLbyPj47zGgle3gJL41FuRgrSL+TbtB
         3XELVfYHSbdpqFJ5Ei0alqoXvsmma88QOlOD8+5kT3wZy12kJ1zae9eMnop4fsviWA4k
         Rp90N6VPIYzhAG60kDbw9hN0B0qRbHxJF1+YCKaOmntNHQryLvKpFU2Oi0SjOZZJSvAQ
         EAkiEzwy70RG44KzAxDjeuVFIyl2ueqL+H8FTU/djmERdGGZhGfQ9N5PgbKUUVLQdvsQ
         caQlJ5eeJTbu4NX/xCgXbn4tOxZTer/nQsis61W87GgS6Zs3ZgMX9prxLIMP1Mz07a+H
         K1GQ==
X-Forwarded-Encrypted: i=1; AJvYcCVP1oazItcYxXsrG9uup+h5KudP+yHeJOtzJYmn+4prDMy6WKADz2csDCkB7H5BEI5OHPE1aZKf5SErIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHPoDuIz+sGeQu0TsSz51TEIkg+Cg6W4z6Iv7/ndV9LObRaUcn
	zaWNTXy5uTjiLZ8OfvEvh10Y/hRY40OwSb3tbWr+sLo+uv4ZlLgM/108pPcpjUkV5w==
X-Gm-Gg: AY/fxX7N0gfnpQ3DC5McfjVyNw/9yEO1g4407lxGUflcBnOpqmRGlJKEczP5wshdvsj
	Byq+m33WUwApMkBDuV1B6VMir4wH4W0oCVKHD0olXI7h793nohbyAOGt+s8zZnxYlEL8qYFaVbR
	+dG3RUHAR3hexNO6LwnAY4S4AL8P1IkLAWA2cBMCRUlFRK5au2m4frmc7rSyUSSOAQIwbL3uonk
	LSzZgEibSM+VH4dSqIqU6GYfOd+HoNIXPDiIfqZHcYOMfiUtyvLT4R7fvi91lK+5JenqTr6ivl/
	6MghEvq9nTETaJhkhE3aNUEUEBDXWJ1YTY31+ohuMxN1k7OxkyFQnmNJv0wJ9ZYdxguJSnh3JU8
	xvrbLtdcTDUsGo3LXQh4eCuRj1aDgjjv2bpxY/yf9qs7jNGC03LAaIha2EsHXrKxUzfaznr2sHx
	PNE5yoBaHCry8CJ3rCJ+CVgwfYQmgHl8cBqpwyGTOHv7TtvMbAdmdEPDZlA49tZACfLbC0iA==
X-Google-Smtp-Source: AGHT+IGKZHv6lRA/O8HWR45tPSrNpis8zn6lvRM//u5qtyU7drZ8s9wFk27hs9CDZJAlQRCRTTQ0gA==
X-Received: by 2002:ac2:5e73:0:b0:599:fe3:779 with SMTP id 2adb3069b0e04-5990fe308c9mr725665e87.27.1765899745397;
        Tue, 16 Dec 2025 07:42:25 -0800 (PST)
Received: from ribalda.c.googlers.com (165.173.228.35.bc.googleusercontent.com. [35.228.173.165])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5990da1a4b8sm1003489e87.31.2025.12.16.07.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 07:42:24 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 0/2] media: Fix CI warnings for 6.19
Date: Tue, 16 Dec 2025 15:42:23 +0000
Message-Id: <20251216-warnings-6-19-v2-0-12075e3dece7@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN99QWkC/13MQQqDMBCF4avIrDsliRi0q96juIgx0VmYlIlNW
 8S7NxW66WbgH3jfBskxuQSXagN2mRLFUEKdKrCzCZNDGkuDEqqR5eDTcKAwJdQoO+y0GLtBt9p
 6D2VzZ+fpdXi3vvRMaY38Pvgsv9+fVP9JWaJA1dSidbLWgzVXO3Nc6LGcI0/Q7/v+AS9e1IytA
 AAA
X-Change-ID: 20251202-warnings-6-19-960d9b686cff
To: Keke Li <keke.li@amlogic.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

New kernel version, new warnings.

This series only introduces a new patch:
media: iris: Document difference in size during allocation

The other one has been already sent to linux-media or linux-next ML,
but they have not found their way into the tree.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v2:
- Remove already-landed patches
- Use ->inst in Document difference (Thanks Laurent)
- Simplify division (Thanks Dimitry)
- Link to v1: https://lore.kernel.org/r/20251203-warnings-6-19-v1-0-25308e136bca@chromium.org

---
Ricardo Ribalda (2):
      media: iris: Document difference in size during allocation
      media: iris: Fix fps calculation

 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c |  7 ++++++-
 drivers/media/platform/qcom/iris/iris_venc.c             | 15 +++++----------
 2 files changed, 11 insertions(+), 11 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251202-warnings-6-19-960d9b686cff

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


