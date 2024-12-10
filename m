Return-Path: <linux-media+bounces-23089-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD4D9EBA5D
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 20:56:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B048283C19
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 19:56:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6CCE226870;
	Tue, 10 Dec 2024 19:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="M0kdRPgf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3202046B1
	for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 19:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733860570; cv=none; b=tVyPYWc5JdXyvmgOmf84XkRURgcaF5EmPn07id7vBNIGS2bAtOZbLftRYkwQniR8s1E6ubRArsykK+iNhBQ2qaTD85cRIeLcOU1uetLY1LvshydBXoZw1c6D5/3zpFzxWdDG69t1y0XanXJJ0f90I2kZJKIQ3xC0sHYFa3ezK3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733860570; c=relaxed/simple;
	bh=dSTADKTNJvbmRBy+1jUqiB+cNshFUI2ErxE8CtN1esU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=b5XGPGu41Mnm29JOsEMEXbr9U5vJe5dBOEQviiGTzwXTHvec1fDYav/awlx6zVlDUW0K3BmeLsKT5+edHZiXNoQthH7/vAKHiEfjfxaCnhb5pg98p1hlPtX53/V2MdcEt9yzY+8paelBgl3gdaDSVvXK1y/2BeYm4m3pA5X6tkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=M0kdRPgf; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4afefc876c6so853006137.2
        for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 11:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733860567; x=1734465367; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ENZnTNWODqxq5GjFCzfA3SG8RDnI3+d9xSrfoOvAAA4=;
        b=M0kdRPgfoTOsR4WkkmfDH3dWadGOprnW6pYIG4n7RCGQ/DA72rSMwpYqOqDh0JN340
         eor8A6pXAPUKSMDGf+V3m9PVjbPvqjYR668Cz7V+gdZgJONQ38RFWv5kF6GGRxU3w6jn
         ybWiH0tg+2G1n1JYEX2mXsaH1FxcNAl4ATzSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733860567; x=1734465367;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ENZnTNWODqxq5GjFCzfA3SG8RDnI3+d9xSrfoOvAAA4=;
        b=bLFWbkz8eloirC+JstJxBZ8GCRWAE9gHpwTOfeHUJ56bbcytgHryWWy9sDE0WPGHXI
         PgpwO1pVrgTPeCNN3zVyJSgPl+X8RuK/MDfQn2e1/GWLRefrC8lBqEPpfZVbfGI7Qwk2
         T7FrWg1qWKVe+fkZThwtVbrN+i9tB/TtQoRu9g1gZnNOVpSU3bZULP8c9sMW+721Zqjs
         m8aM6nlpT7+641W9BRLwlweFDDbBat049sT7UX9G4ImSs00a4DC4m/XK/wwixavuwxBP
         SHzDg5nKgaGz81Zm3vECGQ6NeBlhWwhMImPofYQTNGoyhnq/dgTrzs+sigUXZAqxJ2g2
         E+AQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdRuFbl674ixto8x/G5d+xI8sRSPHq/dtsG+XC+Y+9QjxRU3m1Hluh6zL/PQa1ty9uiwe5jCfKBUWITQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/38l71vrLabJ+5do95c4VH+2MiA7kH7HUfXF4GsdgWKDi5JBo
	YPxplX9SdpceYmOIflHt0suYW9zMsDY7YDsZjsalRVEQqo8onu8LHv3d9BlBpQ==
X-Gm-Gg: ASbGnctSJ+UUYIAX39nAUR86YcMJ1XOvXgaIdz3DgwtFIjUz0JWSi5rChcw7EYmUBmV
	KVg2l1uP1nNZOSAmbLslmHhVEeR6M3rpTJfsiEmCxSadRIycDW0LHd/zcGLsYkYVyoA73J9FAyk
	w9Z12lmWSuAv0jsH9syHZLM2ZOwBhK7KruOsMvIexkOcWMLp3xZsNFcpi6U9d+taO/kFq2/aAzM
	jbwlnP0rfqTkBtyPAwMf7scwDs694Zy4wQ5h7+TkNN8tHRX2os3F0JNT+VvQ8Fo8dgmkxe+jfBx
	gblfIVwOuXuS5BSXuep3C4ADvkUF
X-Google-Smtp-Source: AGHT+IHsmCtT0BD6IrraDycago+v0DRU/6EPtntyLjiexxdvbBR0cbJtcpyVIcAxjR5YjW2IFBWOQw==
X-Received: by 2002:a05:6102:3747:b0:4af:c31d:b4e9 with SMTP id ada2fe7eead31-4b128fedb4cmr851826137.13.1733860567449;
        Tue, 10 Dec 2024 11:56:07 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85c2ba7dc70sm1279522241.15.2024.12.10.11.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 11:56:06 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v3 0/7] ipu6: get rid of all the IS_ENABLED(CONFIG_ACPI)
Date: Tue, 10 Dec 2024 19:55:57 +0000
Message-Id: <20241210-fix-ipu-v3-0-00e409c84a6c@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM2cWGcC/3WMyw6CMBBFf4V07Rg6lvJY+R/GBdQpzAJKWmk0h
 H+3sNS4PPdxVhHIMwXRZKvwFDmwmxJcTpkwQzv1BPxILDBHJSUiWH4Bzwu0aAmrOq9qrURaz55
 SdZhu98QDh6fz70Mc5Z7+OqIECag0YaFMV5bmagbvRl7Gs/O92DUR/1wRcui6VhdVoam29uu6b
 dsH7g2kedwAAAA=
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Robert Moore <robert.moore@intel.com>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
 acpica-devel@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.13.0

We want to be able to compile_test the ipu6 driver in situations with
!ACPI.

In order to do this we had to add some conditional #ifs, which lead to
false positives on the static analysers.

Let's implement some helpers when !ACPI in the acpi headers to make the
code more easier to maintain.

We can land the first patch of this series ASAP to fix the current
smatch warning.

To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Rafael J. Wysocki <rafael@kernel.org>
To: Len Brown <lenb@kernel.org>
To: Robert Moore <robert.moore@intel.com>
To: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-acpi@vger.kernel.org
Cc: acpica-devel@lists.linux.dev
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Changes in v3:
- Prefer static inlines to macros (Thanks Rafael).
- Link to v2: https://lore.kernel.org/r/20241122-fix-ipu-v2-0-bba65856e9ff@chromium.org

Changes in v2:
- Add helpers in acpi to avoid conditional compilation
- Link to v1: https://lore.kernel.org/r/20241122-fix-ipu-v1-1-246e254cb77c@chromium.org

---
Ricardo Ribalda (7):
      media: ipu-bridge: Fix warning when !ACPI
      ACPI: bus: implement for_each_acpi_dev_match when !ACPI
      ACPI: bus: implement acpi_get_physical_device_location when !ACPI
      ACPI: header: implement acpi_device_handle when !ACPI
      ACPI: bus: implement for_each_acpi_consumer_dev when !ACPI
      ACPI: bus: implement acpi_device_hid when !ACPI
      media: ipu-bridge: Remove unneeded conditional compilations

 drivers/media/pci/intel/ipu-bridge.c | 28 +++++-----------------------
 include/acpi/acpi_bus.h              | 23 ++++++++++++++++++++---
 include/linux/acpi.h                 |  6 ++++++
 3 files changed, 31 insertions(+), 26 deletions(-)
---
base-commit: 6c10d1adae82e1c8da16e7ebd2320e69f20b9d6f
change-id: 20241122-fix-ipu-a2fe28908964

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


