Return-Path: <linux-media+bounces-18681-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7003A988227
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 12:02:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A3A01F2226E
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 10:02:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7C3B1BC073;
	Fri, 27 Sep 2024 10:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fwiW9A/P"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA62717C232
	for <linux-media@vger.kernel.org>; Fri, 27 Sep 2024 10:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727431364; cv=none; b=jY+4uxhGH4pf63mCCCbI1NzcMxXJBJK0QcXDpPTCbDKMRPG0rHUKxhGbu3+9wNt2GQ/Vkr/2xYZ1kwsjAZSfAvUkWWcuQeMqkdoxqITIh0QUmroj8+01CpMqzwhVmq+235KyZ/2/7Bj9CtBBGmyHI4EigHB2Bzk0htltpEePUhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727431364; c=relaxed/simple;
	bh=714tcmA69jYCf49amVdt/+5qp+u9/EL6t0lYFKZfwIM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=txxSCA1aWA2YneLk4RfuFLyZ8LBT1Tlwr/46juWmAygBK68zcBZDF+nceLmmbdCZRlgtRvdDeGSZlsyKn0m7+ZqToxGKiAqTSHy6c+Zg4Coxa9xS46CGW9qdBJSLFqJChXcKXofe89RH9tmHRm4GnZydxPPcXkw9dTBNWX0aWRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fwiW9A/P; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4581d15c3e3so14106061cf.0
        for <linux-media@vger.kernel.org>; Fri, 27 Sep 2024 03:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727431361; x=1728036161; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3dKRhm+hxvd20V+RfyZH2y9WeFmXxaHJfSQ5cudFct0=;
        b=fwiW9A/PWKXc8wzNX9QvMk90sdJrL0SdXGzT/JE+NrgID+oQeNSX29Bp51m8elAwo3
         CIyWx3Q+5ysO7ke5v5C4nEAtK6Ra31gPfcxvhMXxJXOyw1z9+69rqckgL6BODRdDtDDV
         61CGiEs0lxbRAL8E+PkzWfK0T0WzfDqQ55Jtg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727431361; x=1728036161;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3dKRhm+hxvd20V+RfyZH2y9WeFmXxaHJfSQ5cudFct0=;
        b=Pohj/0gDneIs316vC1+a+Cp5GlaXTTvZwcwOv0m1gsuj75G6vKlhxP8HxLHFCRpOWd
         5vHIdPJQ+jnYVry93KIFTGJrfJNRCaWDybxhX1qA8K04iJEsE8Qq02M7i3IvwcF+3a56
         v7mjY4L8EJ1AhueJqKBifYDsE5G6EAhyD9Xtu1EfV7RfcJHQvNRwQmj5P4tLqKvAW6By
         c3oFezEvc+6HCBNYZCrDyDIA9TEp+N/y4xOpIMfrpfrTyYLlvIxwgNkb0jHzgKVVVHEB
         Z4kBnueAWu9sXb3wogh/KI71ajVCZINj2eJ1mXIBh565Seh9RBoBq2kHJ4N6VRz/8JcX
         dNKg==
X-Gm-Message-State: AOJu0Yz8R498AHGkJ6vPEabWWrsSBgdCR340gwshtO1jpPtIBuINKr87
	JidYY0G/Eb3WV/vtWV5JsYWm4wVwCDp+OGsrINlhcsA8sAGgUpLxX8p/oT3vSw==
X-Google-Smtp-Source: AGHT+IGwjy4L9j91AvvJoFPs1lbJmSSAza6n2s2jdGdo0BYw5vYnwd6nQ+ES2VVTBgPk7iM/xKrtFg==
X-Received: by 2002:ac8:5f54:0:b0:458:37c6:46fa with SMTP id d75a77b69052e-45c9f230381mr40089251cf.28.1727431361423;
        Fri, 27 Sep 2024 03:02:41 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45c9f353f08sm6341091cf.94.2024.09.27.03.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 03:02:40 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 0/3] media: static-analyzers: Fix 6.12-rc1 cocci
 warnings
Date: Fri, 27 Sep 2024 10:02:31 +0000
Message-Id: <20240927-cocci-6-12-v2-0-1c6ad931959b@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALeC9mYC/23MOw7CMBBF0a1EUzPINiYfKvaBUoTxEE+ROLLBA
 kXZOyY15X3SOyskjsIJLtUKkbMkCXMJc6iA/DCPjOJKg1HGqs40SIFIsEZt0NK50XdquXMOymG
 J/JD3jt360l7SM8TPbmf9W/8yWaPC4aRbZ7kedOeu5GOY5DUdQxyh37btCw7ZNOqnAAAA
To: Benoit Parrot <bparrot@ti.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

This patchset introduces fixes for all the new warnings introduced in
Linux 6.12-rc1

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v2: Thanks Andy and Hans
- Replace max with if
- Fix style in subject
- Link to v1: https://lore.kernel.org/r/20240927-cocci-6-12-v1-0-a318d4e6a19d@chromium.org

---
Ricardo Ribalda (3):
      media: ti: cal: Use str_up_down()
      staging: media: ipu3: Use str_down_up()
      media: atomisp: Use max() macros

 drivers/media/platform/ti/cal/cal-camerarx.c    | 2 +-
 drivers/staging/media/atomisp/pci/sh_css_frac.h | 6 ++++--
 drivers/staging/media/ipu3/ipu3-css.c           | 2 +-
 3 files changed, 6 insertions(+), 4 deletions(-)
---
base-commit: 075dbe9f6e3c21596c5245826a4ee1f1c1676eb8
change-id: 20240927-cocci-6-12-4c571bc8e9dd

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


