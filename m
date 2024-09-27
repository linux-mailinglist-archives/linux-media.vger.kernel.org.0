Return-Path: <linux-media+bounces-18673-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E9F98817D
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 11:42:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 19F3EB23016
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 09:42:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C66741BB687;
	Fri, 27 Sep 2024 09:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="i5d0hRa/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11681BAED6
	for <linux-media@vger.kernel.org>; Fri, 27 Sep 2024 09:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727430140; cv=none; b=XLGcNhW0eh0FkFYgWrQ9SyMLMppGL2RPvh2hcf0hv8ahs1YPGAwvyPwBKC7/uz4oI/Z6eOSHOk0HTzgCn/XoqyRycT/UoP6cpUIE9wKpfNWp0kE5yBVemlRGnHrd92c2LGxTaP+mQxho9zogwgo8z7IwIB7+ryIKGk7BBgYdUL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727430140; c=relaxed/simple;
	bh=EFR/ANWPCKmDg0b6+GGTqssw5qCBOHgmT1Lnn5oCYQI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FIIsVpwGYFNtdmH6cKh26y9Y/aQiw4Zej2pfFtEd3gGIQEP0t9mkqFFpbTC31sA8Dub9slRlw14mSJL4tbSwNNjqhn8eKQoTlbolwRjSR1/gvVZxwVEJvepRKG4yAeD5AsXRws3pgjwMwDdgTTpg8kH5msjjSc8c8dt8Z9bvPdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=i5d0hRa/; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6cb2ad51162so14236746d6.3
        for <linux-media@vger.kernel.org>; Fri, 27 Sep 2024 02:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727430137; x=1728034937; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=viz2TzhohWKxeTATpvOhL62kLKmbL4Cojnm7H5/tiU4=;
        b=i5d0hRa/GsArRpCJM5fN5CvlUpc9X4tZaSaDW+P2uOcYBxR9Xt/buJN3ibtaPjN4MF
         n2nf7IKG0jtpiUkTxEVj7BQO3q54KFbARHO8wGF+DTZIFgDIxdXW3oNuHDIARTIuJcfF
         xKEDL34Mmh6210/W45/Bv2ZLWwKCjYC6fmTQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727430137; x=1728034937;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=viz2TzhohWKxeTATpvOhL62kLKmbL4Cojnm7H5/tiU4=;
        b=pFlxB5IHT5tiNGlPO5rK8RQ7Rq1p3W0y3q0nFfNN1b9HWjZOJ65zosd4lmwNe/XnTj
         LmIspHaNBdRjriOAWN9uVsLtQd0DME51qNuNzO9SJnDfzXN8/eqbRlLytWgETxjWPwkV
         uAFgtsiD1AdCupIOzNn8I+PES435dU+i7dOsVS/27zdtdK1L9XwvZxc/m3vQUGtw7WFh
         Ljc3oFQcxfC5SnlP3Mxlaq0NTTLqtcsP2FCvKLbMIGw+ZtBO50nQa4F1n/wLmcCns6+5
         04h/by79lDmVThImTpVREL21LA43QaJyA/BfpfGHVKttmcaxI1kDYI1WjcjX4Jt3AVR6
         NTrw==
X-Gm-Message-State: AOJu0YyLEVY+VXoqL+aMF7BP4vlAbX8DMSMneWY7tqw+WqtQto0CoXOV
	ULZSiGo11JxalcfqoTbqo22dfvXnAHu7sqAeEFryhuA8zhm1klFU3YoCOZzkbJfpQCWKOR2RZL8
	=
X-Google-Smtp-Source: AGHT+IFsTN8CFq2x0Pg4RmTcoxyR4STd3A5CNEsdWGLsHPgu10qVTYe1JETF4NlcDf2XSH+FN50qMA==
X-Received: by 2002:a05:6214:2b91:b0:6ca:756d:68a8 with SMTP id 6a1803df08f44-6cb3b5f853amr31175796d6.15.1727430136764;
        Fri, 27 Sep 2024 02:42:16 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b5ff594sm7231606d6.14.2024.09.27.02.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 02:42:15 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/3] media: static-analyzers: Fix 6.12-rc1 cocci warnings
Date: Fri, 27 Sep 2024 09:42:12 +0000
Message-Id: <20240927-cocci-6-12-v1-0-a318d4e6a19d@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPR99mYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDSyNz3eT85ORMXTNdQyNdk2RTc8OkZItUy5QUJaCGgqLUtMwKsGHRsbW
 1AKKZfgdcAAAA
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
Ricardo Ribalda (3):
      media: ti: cal: Use str_up_down()
      staging: media: ipu3:Use str_down_up()
      media: atomisp: Use max() macros

 drivers/media/platform/ti/cal/cal-camerarx.c    | 2 +-
 drivers/staging/media/atomisp/pci/sh_css_frac.h | 4 ++--
 drivers/staging/media/ipu3/ipu3-css.c           | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)
---
base-commit: 075dbe9f6e3c21596c5245826a4ee1f1c1676eb8
change-id: 20240927-cocci-6-12-4c571bc8e9dd

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


