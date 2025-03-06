Return-Path: <linux-media+bounces-27723-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6406CA54C22
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 14:27:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F9BB1894F73
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 13:27:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 892CE20E6E7;
	Thu,  6 Mar 2025 13:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Tf5Rwb9t"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5770E20E016
	for <linux-media@vger.kernel.org>; Thu,  6 Mar 2025 13:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741267664; cv=none; b=BxRlDz1+GrQpfYP/hwUJ6FnW1XjM698wQqJUvsKQMgyBUffK/xi4ZTryEqLZZyIe3dE3+6mysgxS0g4iNoimZoknoyf3fpckGijVtx+IrDMi1aKJgQV7WgYz0c86bKP9LqIHsZ/cPxXRCn5a0zr9ih7bNhQcaFJKNPWuYuxWS7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741267664; c=relaxed/simple;
	bh=GBWhdIX7+bsQlP1/z+onvju6dUl0avsUu/gCJdhYKNI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FmPDrAyUUE4BzSKYhzq7ZVuYVDe7kkTrXNe4DNRdk62GuHToWANLK8ZsHfciMb+zMyzBdEVS2emJjILzSjDcEn7P35Ei4P5MZnAVX/5hPqly8bnzh5kcJfq7nPyBGNp/K7bLxub2ctTYa3OIqafhcmJnrOzvf2bYwO6dSLCNOco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Tf5Rwb9t; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7c3be0d212fso87502685a.2
        for <linux-media@vger.kernel.org>; Thu, 06 Mar 2025 05:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741267661; x=1741872461; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IqRNCNLgK3dXEi8BwCu1UN2hZhXMdHF5U05cO3WMfr4=;
        b=Tf5Rwb9t5/i43cjd6qjH7vARALxKO4FSrfl/jCvaW7LxU4Btsbnk3s7Ocog9KqOcR6
         gUSqIcirLq00C5Lund6NHus3+MLfxvvE/lQz1jMUwvcEbdjgsSIayTZSJlVOIDCMp6AP
         uL4mVH20XO+jJLaI4VaeER+73WhU31sQ37Vwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741267661; x=1741872461;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IqRNCNLgK3dXEi8BwCu1UN2hZhXMdHF5U05cO3WMfr4=;
        b=HLyKww9BVm60ExJf/4/LeUfa+Elj30A/onWMxJYXVbB5xzWmFLkJF2mkWXgl3NQ1yR
         D9Adtu8YZCjPOFvfzT9AiQB4YCmLgAmbU65qA2JqY2AJT70LFsucAUC3ByoVONSL8tzo
         evKFNDSWr0ta7iYGsg8HGlLK7XrnTQxkUkuSydeteK8bKsUePDeFXAdEIv1VjWH5gSvD
         jl19PBVZ9QFtLCwBvx4TM62+QiZf6c7Ykh3lW0lQp8Jpcqco0gVOO33MSacvuGtS9UqD
         fGBNH5dL3I0/GzQPtkHjvVVdCb4hbPlDVSXjEUGfcsZbv4HAMu0Lai1A3r79tHNj2IVu
         jMlg==
X-Gm-Message-State: AOJu0YxZs0Pp/ZJQ3ip1Z3GPHHEBwnqCpX7dnZ2pvkbYzB3xI3pN5z4E
	4M9GiosgXncLOtBp/RaU2JhjGX4Ozb2pbWQDx42NQJVPnE9rIABkbpBlJy3e6Ki+JvZgHzx4Q5F
	U9w==
X-Gm-Gg: ASbGncs80vbWZ4U+zKOnaITkypxqhUPb4/90CsnQvV7/p9PTd78/fClYO9Q+BrajJSY
	I9cuNkHd/MBzrJiJNZx538usFHEQh03yZb/mpPY0XQgIr9wNwaaztiX8TrFT1JKfG1Hk8r9Wo29
	WTQh6RBNEmDklK//HItXDNE3+2KIDo0fFQZ8CJTRjl/O/GZ1LhpUqXkqzy26JMb+p07hTJq01FE
	qbbHaStjsJ5GrPffQGvku4M8CpkK3QjYVwxxwEVwMQS2BxH3nknkDryC/swThLRFyFYPV0Znkt3
	JX+QF7lnqMNnhZ9fff7h72NVDTKsN1/ECLRexmE9FZfX7Jx+jzeHNaf9cI3pnlmrcEeblOS1Jyl
	M1iVL9POfT+SJ3BPGjpUREg==
X-Google-Smtp-Source: AGHT+IEfIoIIdPPoE1y3HdxySgzdj1Qs67+7tRyU94WxFWThwqhrkMpPUKaTEIRrwffXymQ3TTTs7g==
X-Received: by 2002:a05:620a:1d09:b0:7c0:a1ac:1525 with SMTP id af79cd13be357-7c3d8ef4649mr1112578885a.37.1741267661557;
        Thu, 06 Mar 2025 05:27:41 -0800 (PST)
Received: from denia.c.googlers.com (15.237.245.35.bc.googleusercontent.com. [35.245.237.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c3e538448fsm91268685a.63.2025.03.06.05.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 05:27:40 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 0/2] media: vivid: Make CONFIG_FB optional
Date: Thu, 06 Mar 2025 13:27:29 +0000
Message-Id: <20250306-vivid-osd-v2-0-86db53ecb39c@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMGiyWcC/22MQQ6CMBBFr0Jm7Zi2WIquvIdhUaDQWUDJVBsN6
 d2trM1fvZ+Xt0N0TC7CrdqBXaJIYS2gThUM3q6zQxoLgxJKC6VaTJRoxBBHNMZa3U617sUFir+
 xm+h9tB5dYU/xGfhzpJP8vf8qSaJA2Vyb2oqy3twHz2Gh13IOPEOXc/4CReTfBaUAAAA=
X-Change-ID: 20250228-vivid-osd-77aa58f35b04
To: Hans Verkuil <hverkuil@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Slawomir Rosek <srosek@google.com>, 
 Hidenori Kobayashi <hidenorik@google.com>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Vivid now depends always on CONFIG_FB, but that dependency can be
optional.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v2, Thanks Hans:
- s/DEFINED/ifdef
- s/vivid_clear_fb/vivid_fb_clear/
- CodeStyle
- Introduce vivid_fb_green_bits()
- Link to v1: https://lore.kernel.org/r/20250228-vivid-osd-v1-0-16963a0a0ab7@chromium.org

---
Ricardo Ribalda (2):
      media: vivid: Move all fb_info references into vivid-osd
      media: vivid: Introduce VIDEO_VIVID_OSD

 drivers/media/test-drivers/vivid/Kconfig         | 12 ++++++++++--
 drivers/media/test-drivers/vivid/Makefile        |  5 ++++-
 drivers/media/test-drivers/vivid/vivid-core.c    | 14 ++++++--------
 drivers/media/test-drivers/vivid/vivid-core.h    |  2 ++
 drivers/media/test-drivers/vivid/vivid-ctrls.c   |  2 +-
 drivers/media/test-drivers/vivid/vivid-osd.c     | 24 ++++++++++++++++++++----
 drivers/media/test-drivers/vivid/vivid-osd.h     | 18 ++++++++++++++++--
 drivers/media/test-drivers/vivid/vivid-vid-out.c |  3 ++-
 8 files changed, 61 insertions(+), 19 deletions(-)
---
base-commit: d98e9213a768a3cc3a99f5e1abe09ad3baff2104
change-id: 20250228-vivid-osd-77aa58f35b04

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


