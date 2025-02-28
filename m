Return-Path: <linux-media+bounces-27233-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5464EA49A3B
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 14:08:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1BE331890576
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 13:08:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1799325E471;
	Fri, 28 Feb 2025 13:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YhTyNl+G"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056C026B2AA
	for <linux-media@vger.kernel.org>; Fri, 28 Feb 2025 13:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740748124; cv=none; b=PYrsNC6ksPZP7umHFo6cqG/Ujl9pU8piduW7dLzZgqpzP/GfeFaZ7xoWkl6cAo9NvjsOWVaTmO/ws3PVhgWJ8mYZRRmBjmQBbJOVJimgL8l0Rf84H5UJ8MXDDqELRNIehIe7di8f0JN4l490tzbOeA2OEyi8JVDzrZvYCeynAlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740748124; c=relaxed/simple;
	bh=JQjJrJS/Q6j0d3mNC8vx2up0gjpozCsC54882zD/Dhk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IRxYDrTKlQdw8ostExp1nTF55noJ97JvhkwYKMAN41xp9t2qIhPMYP1JVY5qP+r9u1561pJNgWV6s736cbrsVSjoOf2H/UcSQdOdOwipbhakIs+B69tJzR6J/nKY0CFj+q4+NKo5gCBMtkeCB0+u/nXi5KtbCeRFcgjUg7H6b5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YhTyNl+G; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6dd15d03eacso20026966d6.0
        for <linux-media@vger.kernel.org>; Fri, 28 Feb 2025 05:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740748122; x=1741352922; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=THJY3/uU/63uF+brTBz1ZZWdKaiUxcBAU30d4gq849w=;
        b=YhTyNl+GzALc90pFU+QmON6/tLHT0h6IBOTuzfLRHFbBwqi8FaOKiL/kHgMu2k7ABb
         x8GzEbp2yGzhlc2wz8z6/sx4pLFlj6dfYAYiX8cmS3t0nmb+xuvIeg0CYX/t1qAym+Om
         IxJz/fpagBCBpQwzsG+s7rkyqRQVQnlGIiVpA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740748122; x=1741352922;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=THJY3/uU/63uF+brTBz1ZZWdKaiUxcBAU30d4gq849w=;
        b=dhENnJ7YETCFwyBmiDyDGrXJGjGcgdKxPPjuyFu+4L3xDypZRAl1wN49oerFxY2hk/
         l7oiEw2X8Sqmv343JxRiVLTFvBZQBnx4dG2eqlu30Wy5DQ+ZPPw6G35yCWKmvz97IeUp
         ejrxPNvGYTrRQhD+SSY9e+YL+Dvm+dgQioa5jku8D+OxqVJj3xKnbOXkf8LP8u/qFtUw
         IGlH/z9J/mJ2C08xjTQXrxcyNO/uKHtAK5AcRa5Py6kK0+dsbXxy3V3BbsGBc8hgSRfU
         IIdAryPlXZiJjicQtrXNnA8TyvPkcnlo4gaWqhMgF70T9StvzYhDd+J29US4pkP39HvD
         JBCw==
X-Gm-Message-State: AOJu0Yxktl2AQ0N5fmL4wF8bmdti1HiuD4RzoF3VAXhUdEnaDucgCSLa
	JxuyPtwKdUH/h1yVLFBHxNnXoqMYqOxcRwtl9exesriK2CRNAYFE8hsyMbmvUQ==
X-Gm-Gg: ASbGnctnOL9HPHH8bAm9gwVKqzO8nw024YYczxtzZctPz1y2+eOprUF7wc2JBIZFl8g
	qRQdETA0l3GysxYnBpkr2ICkvh8hd4sPpJwxwhZpaqg6g3cjrd5BSxD1XagwVu1/tdc+6wxUtQX
	NKolg1few+dPOrwdFfFbRDTXujDM/gjmwn2t0TyhbBvlg1Fd00r7fCDKOvBKzIgG4KSCe2LUywx
	9nLrQ1tYKpcjzg2MvSv2vDIIXSB2lw1/sdKkr1WgOweX9PKkwpUBa+67HX3nC7Tt+jnk5IcR7KV
	S6Vv24pSPUv60ggDjeG73H1wZJF2dzcQD+DdCm57qkNKTcg6/5CbeCXOAPFuXaX00FAW64W0HcI
	jVpY=
X-Google-Smtp-Source: AGHT+IHnYyYtvPPwAQzzm93PZVeNxe8lMbnsVbwonTyBY9n82YdubaVzrscIeaJpNfD+KggpA3wHEQ==
X-Received: by 2002:ad4:5cec:0:b0:6d8:b733:47c with SMTP id 6a1803df08f44-6e8a0d9ab93mr50649196d6.22.1740748121874;
        Fri, 28 Feb 2025 05:08:41 -0800 (PST)
Received: from denia.c.googlers.com (15.237.245.35.bc.googleusercontent.com. [35.245.237.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e8976d9fe1sm21938046d6.102.2025.02.28.05.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 05:08:40 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/2] media: vivid: Make CONFIG_FB optional
Date: Fri, 28 Feb 2025 13:08:37 +0000
Message-Id: <20250228-vivid-osd-v1-0-16963a0a0ab7@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFW1wWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIyML3bLMsswU3fziFF1z88REU4s0Y9MkAxMloPqCotS0zAqwWdGxtbU
 Adn2J5lsAAAA=
To: Hans Verkuil <hverkuil@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Slawomir Rosek <srosek@google.com>, 
 Hidenori Kobayashi <hidenorik@google.com>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.1

Vivid now depends always on CONFIG_FB, but that dependency can be
optional.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Ricardo Ribalda (2):
      media: vivid: Move all fb_info references into vivid-osd
      media: vivid: Introduce VIDEO_VIVID_OSD

 drivers/media/test-drivers/vivid/Kconfig         | 12 ++++++++++--
 drivers/media/test-drivers/vivid/Makefile        |  5 ++++-
 drivers/media/test-drivers/vivid/vivid-core.c    | 14 ++++++--------
 drivers/media/test-drivers/vivid/vivid-core.h    |  2 ++
 drivers/media/test-drivers/vivid/vivid-osd.c     | 13 ++++++++++++-
 drivers/media/test-drivers/vivid/vivid-osd.h     | 13 ++++++++++++-
 drivers/media/test-drivers/vivid/vivid-vid-out.c |  7 ++++---
 7 files changed, 50 insertions(+), 16 deletions(-)
---
base-commit: d98e9213a768a3cc3a99f5e1abe09ad3baff2104
change-id: 20250228-vivid-osd-77aa58f35b04

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


