Return-Path: <linux-media+bounces-29152-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A579DA77D7C
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 16:18:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FB373AC200
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 14:17:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7F1B204C08;
	Tue,  1 Apr 2025 14:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gPKUVHb5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDF1FC08
	for <linux-media@vger.kernel.org>; Tue,  1 Apr 2025 14:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743517081; cv=none; b=UrcbSz0Bg/kHH9kY5/Kq6F/chQamm/DKr7cJQ7hsTmKMI2BBaZe9YdcQe4E6FLvl6pYiDvWjqjUKH6w2+W9BWEsBwZOzYrTpDgV1uMtXg2UiRK79EnztR77W8xlqLTzjha/SnUaJIDYq9MymXmepx0jAR7rZK5oFywSM/8r6sak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743517081; c=relaxed/simple;
	bh=FJlsgq2QzOzhVpe+zVW0YCghAx8UZtTofJGeg+Vorl4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mkPU7Y3hOQeRgMDlS5b3jKEwLBrklTRhGqlVvqb5LP+tCusbTazTeStxwz9dW1mSbzzjwetVUhU+vqvIL4dRk4DoIHtFdHoKATXWGDNKx1K3fu25XQCHLZ5nBPPXHe5fgnshf+nGenD+QwlHbUBGl+a+54XTQ4FvBrHigoLCvCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gPKUVHb5; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54addb5a139so6250316e87.0
        for <linux-media@vger.kernel.org>; Tue, 01 Apr 2025 07:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743517077; x=1744121877; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fMBJRbWhFak+sAV1ZffRRNyDINUZZx4eH4dy87DFJ8c=;
        b=gPKUVHb5VtTjwaz/PikMCdUN3+CqkjB4bOK0etWQhE5MUcB+Cv2mTyf5bh1N5sNkYu
         DoPBT4arcgbUDg3F/WNHeVV7bxRkeHmH4KemE2aLp3DvV5Qd8jncoDZ9kMriqoJjHWXU
         DzFJPiNqhzsNCtVUHZeQxctcZEZWnvYVQVIug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743517077; x=1744121877;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fMBJRbWhFak+sAV1ZffRRNyDINUZZx4eH4dy87DFJ8c=;
        b=o7JNbuLraBUMQchm4LxuDPDP2PsqUp+8LptDQVnpeLzaGuF0STr8CPt4abAi8TZMpJ
         gMrieM2iyV7CEdKrVOb/OjH4MV10GL3q82MVIhRN2o5/LoJWHbseAicKOjqQBjlfjYD2
         V3WL8F5vaB6PICuul3/DdtqssWjL70YMjp5pntxe/bVCGsyDnvobV12/I1kvueXU4xPU
         LEPNWqFop/hGeyoivVF5EHuQAKPuw51FWDIqwt4bLYtV8EXgxjTEQQGv/Xhn8gN13ExK
         GZVfBB4yGMMZ1PmsfVyYG0BfJTkN153tuTHDuHJOMMzf6w2m+yQlmhJSbmcpLfB0osmj
         YgyA==
X-Gm-Message-State: AOJu0YwMqq0ndL0l78ZoqLy5r4/G90BTWdaA1brfKtmLleJgCy3fT5yY
	EjxQsqTbaNg03It+1q013OAsJNaRxjoGPq68/eBaEQkrcDxZwDggGCKXHfyoUHHr48K2LbHOYo4
	=
X-Gm-Gg: ASbGncuF5rVi0UgAE2rsJDTraiedjpO3e5voLJQAUi+ezeOk3ZwYi0qIfb1OwB03G2h
	LIH3EN5FLC8EWGTnW5t15o2/FLHnjtdxm34lxT46JsDAiTYIfFtkxJkoWnwUp9kRkfyEMgznqxg
	YgrPoOEbZH2Bn+iPxkx+76UWaH1Ow8qpAJZf7YMwY1pJMnv7SsEXEZKX4izsgFus2Ea3f4Qd8Ia
	4kc1vgSm775pjW+taCFhYrADq2uJhIs6oXPkFDd1awpYMoJs/JUn7Xgyjg64U3aVcbxR4gqlgtQ
	dhFfMcUxD7PCHgO+VDqKmww5TZzmYrcCSDAmQYvxeClAqaZt6tnp+G03ljQdRs/MdaGEHU6JASF
	OkET9sFFyHaX0pGETLqzU2wgU
X-Google-Smtp-Source: AGHT+IFJq5w2B0dugOC2Oo+nxGo04pCzcOgC1humRSBZ8othsPmNpBduKudyA9YdVBqoa7doalBKFA==
X-Received: by 2002:a05:6512:3d16:b0:544:ca1:da41 with SMTP id 2adb3069b0e04-54b11128170mr4067328e87.44.1743517077405;
        Tue, 01 Apr 2025 07:17:57 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b094c19a3sm1377789e87.80.2025.04.01.07.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 07:17:56 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 0/2] media: Fix gcc8 warnings
Date: Tue, 01 Apr 2025 14:17:53 +0000
Message-Id: <20250401-v614-v2-0-53024c4fcdc7@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJH162cC/13MSw6CMBSF4a2QO7amDwqtI/dhGGCp9A6g5FYbD
 enerQwd/icn3w7JE/oEl2YH8hkTxrWGPDXgwrjOnuFUGySXmislWO5Ey0xr9KSUkVZpqNeN/AP
 fB3MbagdMz0ifQ83it/4BWTDO7N11djS96iW/ukBxwddyjjTDUEr5ApzoCtybAAAA
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
Changes in v2:
- Incorporate Hans changes.
- Add comment (Thanks Andy).
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://lore.kernel.org/r/20250331-v614-v1-0-9bc69a873720@chromium.org

---
Hans Verkuil (1):
      media: cec: extron-da-hd-4k-plus: Fix Wformat-truncation

Ricardo Ribalda (1):
      media: atomisp: Fix Wformat-truncation warning

 drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c  | 4 ++--
 drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)
---
base-commit: 4e82c87058f45e79eeaa4d5bcc3b38dd3dce7209
change-id: 20250331-v614-8485d3382935

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


