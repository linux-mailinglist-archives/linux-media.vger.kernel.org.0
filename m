Return-Path: <linux-media+bounces-29081-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D820A76C14
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 18:38:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 403373A530C
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 16:38:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4659D214A79;
	Mon, 31 Mar 2025 16:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FNG4dzgH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC08B126C05
	for <linux-media@vger.kernel.org>; Mon, 31 Mar 2025 16:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743439127; cv=none; b=NdPhtLq+s4jlUx4jr0NB+29nXRbc8LraI4+dk7yV0ppYiRAHTwu/gT+hhYegoXFn5v6OopCxHgNrcftRIX5HZ0r0pEYiojzUts4cdV47HALEwrHx82CV4xlq+dzu2Q66PmRMBXZFWSjPIbcGFPF5+DAY6Qa6hScibi4eAdYsKhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743439127; c=relaxed/simple;
	bh=msHDyhQuwl0lyuk5ghM677h2CmEgt+ySvxiZKKREyPg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PlcUkbqvV8+idz4c4r4gQLOg7EMaGQ62itMWkYZVn56LGcvG1bedS1u2zJBzljs1FKI3hfgXV+G7sTN8St5315H0Q3oOnaG9zv+RFDsTGPxy7P/JxP+3jQrBdt16S+VS+LU25x2DHn0Jrux/GUHRxwATOswwlryqogmKulUI+64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FNG4dzgH; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54954fa61c9so2840240e87.1
        for <linux-media@vger.kernel.org>; Mon, 31 Mar 2025 09:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743439124; x=1744043924; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zYZVbCynk+ZVoNdV3LVYecJQ72VIONJ5XFTXiXMNDn4=;
        b=FNG4dzgHt2xxHHyHOZNu1h+B65ZO38dG3bXj9Ys6SPc4dMLyH4RnMfriOj3BtgxIBx
         PQxrCbPAnmROFAYjqkMU8bUWnkSEUGQIkOHD46xTvhqIxe0ImNDd4xVB7thE45VelbbO
         GINMRLWQK4etPKFw8e8f1es5YpwCyYCPv9hv8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743439124; x=1744043924;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zYZVbCynk+ZVoNdV3LVYecJQ72VIONJ5XFTXiXMNDn4=;
        b=c488vMDksQ0WR6vU0S3hUOeHaKhhLqdjHkCoIT6n7++IidlnYJBVoVYt5TaMfFx2wM
         s39HtemDf4n0Rx2xt7MtFYaW2kiYtbqdc5X0ShomDNfu53X+bTG5UJSp5odHHxjAX3Rb
         rrogQYdmqtzcqG4vXZ5Vu3ewT//2a68TiyjKPBQ6kdbPjnKKOQkkNueycUUb+hmMRG7p
         +GlGzHjA2Uo4YBSYnqkUoSWcCNWH4/juhsopvfCSgF5sV1HMiX2BDc9dWtakJQ/9dYB3
         VrvFe72jj/XLnJ+9HJ+OCsWOZq+HcIC1UvdzUwKZDJhkJ2X4mK9xkKssXnl7MtBTUC1d
         aF1Q==
X-Gm-Message-State: AOJu0Yw4lMx+qQoAQ0tBYKxS6itoMiB+CLYD4y0iritN6wOFjDi7HnJe
	U0br1w1fCB8pnfMljKG0h0xyLk7CnCrLnX0I8r0+My70ONjfRB1IJsXwACTI1g==
X-Gm-Gg: ASbGncvRUsXkZh3+Gigp6Xlk3ekPNKMYjPzzRE5crQQHFXs4SO6ELyi1HHQO6GJCmu2
	pLH7EtyWtfo9NY6FZwUoYN3XiqqE9OahPHJol3mxMhy4mJHreXZvMjAB+YHBCOU2TZNbGpKnUwa
	TDRpOZWQsfEqJd+8vhP3w5Izs55YQ3UQfLEvlvh3o3e5Zzgrww9SHn9+z8JZPHENTtBElG386Kj
	Ge+fuyqp2zhug3WqLgsDpHGs9hDkM30GFz/vLeg4YZDi8cN7V8h/sBPxe1iWWn883cin7oDiIeL
	tBh9Yefe4hqFEkmWKdlXSoL2YUtQY3ItknREVdlwuF1HrX6n4LV4PYhSHQeEax8pocjtnnKoYOu
	A3LMP9y1P8TB2xRwyyHQETVA4
X-Google-Smtp-Source: AGHT+IG1r79q5xr7a/3BgTP+KtzgOsT7WxeTIDLFGXSCqIMLUKbuoKzIZY1SaNKhCamPJwufuwmDmQ==
X-Received: by 2002:a05:6512:a95:b0:549:8cbb:5441 with SMTP id 2adb3069b0e04-54b10dc7c04mr2716480e87.15.1743439123919;
        Mon, 31 Mar 2025 09:38:43 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b09590fd3sm1151796e87.188.2025.03.31.09.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 09:38:43 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/2] media: Fix gcc8 warnings
Date: Mon, 31 Mar 2025 16:38:41 +0000
Message-Id: <20250331-v614-v1-0-9bc69a873720@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABHF6mcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDY2ND3TIzQxNdCxML0xRjYwsjS2NTJaDSgqLUtMwKsDHRsbW1AL7UnAh
 WAAAA
X-Change-ID: 20250331-v614-8485d3382935
To: Hans Verkuil <hverkuil@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Kernel 6.14 has increased its minimum gcc requirements. After bumping
the "ancient" test in media-ci 2 new warnings have been found. Let's try
to fix them.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Ricardo Ribalda (2):
      media: cec: extron-da-hd-4k-plus: Fix Wformat-truncation
      media: atomisp: Fix Wformat-truncation warning

 drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c  | 5 +++--
 drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)
---
base-commit: 4e82c87058f45e79eeaa4d5bcc3b38dd3dce7209
change-id: 20250331-v614-8485d3382935

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


