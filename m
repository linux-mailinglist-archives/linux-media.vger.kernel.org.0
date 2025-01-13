Return-Path: <linux-media+bounces-24682-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DB5A0B3A0
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2025 10:54:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA3173A8328
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2025 09:54:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88F0E1FDA8B;
	Mon, 13 Jan 2025 09:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lz1gOYNJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3420A1C1F00
	for <linux-media@vger.kernel.org>; Mon, 13 Jan 2025 09:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736762030; cv=none; b=d80nOB9Hi+ckn9GUlLnM7sYeZvhLpVSTvy9+skEcillbXiqaSKOdK/PsZXX0xY7g7xqJiqDfOg+PgpAGf/d/fEpnphUKC0lQO5M5wqmNQuvO50qPg748U0wfZje8tlPtZ+CfdqLo7UFZG8CFLfYipBu3FbqNFmSbXJZ352v/fM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736762030; c=relaxed/simple;
	bh=fRGutChLLUoNS87CB1VvDD1XIyfOsE6JxyKnONK4z+Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=l1lFSKb7dW28r/nqUkgIF4cI5Hyf7b1njw4clfFDLLBbX0fVOxGkHBbKbwXvDOTN+muKfmS4uWOn6K1jhbBfc0I7R6r4I6j8P833FB/JuZCFgrs79Ct4Tza4pQ6tSLbkyfPWW0r7k+YZHoD5nzQcZazEUvPJ0HkbeOSWQ3t/Ga0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lz1gOYNJ; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30613037309so14668721fa.3
        for <linux-media@vger.kernel.org>; Mon, 13 Jan 2025 01:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736762027; x=1737366827; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uM9tQkzj3OJfzp7RUkxy9I2sWdSVBHdxH3TTd0q0OWM=;
        b=lz1gOYNJ2nwaPiWyiPNHrYGCLkF8WIIg0+p2OharcyCyE+ih61wmiJkxb0ZBzHetnH
         3E6h/hwcR9Jb7p33pRPudSd1iR/nuGxuSp/VaKOsMg+lRSY7+4AwVGspKMYWPoUvYunG
         GYLr1jNlWQnMtGEctSrnVdPB8gBoMuM3gizsA4W6mNuoIj1OHmVRw33I1qgXzytahfMZ
         0UrN7rjz5rI9DXAEd/KREZeQ6Mj7XS1WwYgTUOh+CAjg1sbqQHNVHsV0tfNFG5dvnoKf
         T1XNwA38is3mvIYvRlWjLPODEF9/SMpuHO9JrsNcNOhLXHpzjBa/1y5+xyO4zebmtgKK
         OO3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736762027; x=1737366827;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uM9tQkzj3OJfzp7RUkxy9I2sWdSVBHdxH3TTd0q0OWM=;
        b=uaZoXTqgk/B4v75I9ZxPHNHltC0/mMypl2q2rjNJWIasOoE1dempREjLfzXfOAlTJh
         WYp+8b3ROt0ayKVmbLOrn/jWICtT9mzY87lMfzcVFNCntMn8uX70d4DfScZ06ujoLkcM
         ihLv3adwYJyajg7FPJZcb62pWc6EkNjuzqjAcCFz+GbiKpKRlEuhDTYl77BjTpI2DXoF
         GMorAcCU7TwjGI0cN/5S8ZsZxBqPGB3RkNpN6/+z3TvI/ZERf2vXiXR9W5xdCUg6rfjH
         NVsF6czQjRbI+xRAuOWtDD8RSd05Ot+ZD4py4kL1ahFUM9wzX2PiCH1yeZTa6XLrAxXC
         gIJw==
X-Forwarded-Encrypted: i=1; AJvYcCWkwtvaFXfBCZNqMbRilZ7bcex9di6SWsuUPnzbF46YKTBURAbtyPSczg6FobxX0AJSKSSR1vIvEF8jmw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyD4RDLYKgKmPK+3PV0Uejjk9sndLEBzDY396r8tfDhherX6Z2v
	4YAYlywhxuyZ2kUNVat0sY0TLMl09YozSiR4QCHfuSVjEAn1W1nVdDnhlEaYmc0=
X-Gm-Gg: ASbGncs4x3e8f09KXqtTeY0sZnrV6Ymq8VYWKtBYlJWHuV6ePPyAbVkYzP2Tj616I6E
	jMrHaLkIuA9HoIxGl4c6iZmBDjHZy4KscvXH67bRs9blfmPCxNDXLA0lGEPr9tTSBSMky25ab1Y
	1VyXUTqSaDy6I1iejsUfxaE1NmnVXLUTvTFS03Ut+v4K0U4B0/pEcK0hSgLArpe94gpE65m9Yf8
	cahjFhkmlMoccP85hOfXcxNAqJ0dFP/xh0REIBa/op/8YaPTWt36qiG0PDSYo7i
X-Google-Smtp-Source: AGHT+IGTFmyPSvGWllS1e9shSU24IuZFR3WeRQRaAsUfHfGVMbhTf+vz3uWh9lwuPXHK9lRQNl2vJg==
X-Received: by 2002:a05:6512:3049:b0:542:9883:266 with SMTP id 2adb3069b0e04-54298830320mr1924158e87.37.1736762027306;
        Mon, 13 Jan 2025 01:53:47 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428bea6a67sm1287085e87.167.2025.01.13.01.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 01:53:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3 0/3] drm/i2c: tda998x: move under drivers/gpu/drm/bridge
Date: Mon, 13 Jan 2025 11:53:43 +0200
Message-Id: <20250113-drm-move-tda998x-v3-0-214e0682a5e4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKfihGcC/23NwQqDMAyA4VeRntfRpBXrTnuPsUNdoxamHa0Uh
 /juq4KHsR3/hHxZWKTgKLJLsbBAyUXnxxzyVLBHb8aOuLO5GQpUgKC4DQMffCI+WVPXeua6bZT
 MG6kssnz2CtS6eSdv99y9i5MP7/1Dgm16YOUvloALXmmoALEBW8nr040m+LMPHdu0hIdQCgDxR
 8AsUIuGSi3RInwJ67p+AIZnOYrzAAAA
X-Change-ID: 20241214-drm-move-tda998x-8fb4321434d2
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Liviu Dudau <liviu.dudau@arm.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Hans Verkuil <hverkuil@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-media@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2211;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=fRGutChLLUoNS87CB1VvDD1XIyfOsE6JxyKnONK4z+Y=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnhOKqRODIHsi9LCj4YN9lMxivnWqIg50lSK3lv
 S4ufoqhAjuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ4TiqgAKCRCLPIo+Aiko
 1d4BB/9Ej4WifVIldOsPfNqeR3CcYulWReAILm0ciM2Nqgi+NoaGbbEHQ0i1h2QhhBBjvvOAxs0
 tgXfjsnVRl4azRn/FlOW7IqAW4W4AlTjnwmuHWZUxGvLBZ2YBGvl7KsUwl/0mHg6TFo4IjwCTtY
 wr67yd2T3caYWj73oOdI3L/zaMj0mfbgwf9fmujCwgYuTMD+AC5gkwnUdKH4zM/eOophO0RKr1z
 1houdSwqLRRUeu4ahhyh33o9Z3pTPJHiot0+vu2+Z1/kdZf2uv+HzbGm3JGe4sJczI5VZAoHOWd
 9fih95x5ErTycGRO65kpk3YKboBdVdhSt7PieYubyGqb5EeA
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

TDA998x is the HDMI bridge driver, incorporating drm_connector and
optional drm_encoder (created via the component bind API by the TICLDC
and HDLCD drivers). TDA9950 is an I2C-CEC translator, being present
on-die on the TDA9989 and TDA19989 chips.

Move TDA9950 driver to drivers/media/cec/i2c and TDA998x driver to
drivers/gpu/drm/bridge/.

Note: In a comment for v2 Hans has acked merging these patches through
drm-misc(-next) with no additional immutable branch.

Note to RMK: I didn't change that, but I'd like to propose to use
drm-misc tree for this bridge.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v3:
- Dropped irrelevant sentence from the tda9998 commit message (Hans)
- Link to v2: https://lore.kernel.org/r/20250110-drm-move-tda998x-v2-0-ef2ae5832d21@linaro.org

Changes in v2:
- Moved TDA9950 driver to drivers/media/cec/i2c (Hans, Laurent)
- Moved TDA998x driver to drivers/gpu/drm/bridges istead of tda/ subdir
  (Laurent)
- Link to v1: https://lore.kernel.org/r/20241215-drm-move-tda998x-v1-0-7817122b1d73@linaro.org

---
Dmitry Baryshkov (3):
      drm/i2c: tda998x: drop support for platform_data
      media: cec: move driver for TDA9950 from drm/i2c
      drm/i2c: move TDA998x driver under drivers/gpu/drm/bridge

 MAINTAINERS                                   |  3 +-
 drivers/gpu/drm/arm/Kconfig                   |  1 +
 drivers/gpu/drm/bridge/Kconfig                |  8 +++++
 drivers/gpu/drm/bridge/Makefile               |  4 +++
 drivers/gpu/drm/{i2c => bridge}/tda998x_drv.c | 49 +++------------------------
 drivers/gpu/drm/i2c/Kconfig                   | 18 ----------
 drivers/gpu/drm/i2c/Makefile                  |  4 ---
 drivers/media/cec/i2c/Kconfig                 |  9 +++++
 drivers/media/cec/i2c/Makefile                |  1 +
 drivers/{gpu/drm => media/cec}/i2c/tda9950.c  |  0
 include/drm/i2c/tda998x.h                     | 40 ----------------------
 11 files changed, 28 insertions(+), 109 deletions(-)
---
base-commit: e91570cf7c1b3e406878e7b1efbe823d039d1659
change-id: 20241214-drm-move-tda998x-8fb4321434d2

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


