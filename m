Return-Path: <linux-media+bounces-10534-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A92388B8AEE
	for <lists+linux-media@lfdr.de>; Wed,  1 May 2024 15:09:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4AF861F23156
	for <lists+linux-media@lfdr.de>; Wed,  1 May 2024 13:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C708812F388;
	Wed,  1 May 2024 13:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iQNhMe8u"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D653D12EBDF
	for <linux-media@vger.kernel.org>; Wed,  1 May 2024 13:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714568900; cv=none; b=L8ZbsZGHxSCUbGd1dl7XX3riaMAfAM5YoKIZWdlTVaPDzO5UMTtEfsMIolX69bjZZmTogS31E1W1apsGVuzIZnwImz8tpAbWd2g/823vSUFMgKWLTPKyfGJKZ9LR/HRp6QlrutezlA2gaa8cK51XkN7NafCaCdMC8hjtavJepQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714568900; c=relaxed/simple;
	bh=8+k4R0J4GKcNe8Lj0qIl9PpvkxpwHa0NvERQqlYiLVI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gwMTSF0OdrBGdBlZE+FRPu+JKEgHw82mHwQSzifI6/ahMq6NgLCjF25R4SBdmED9ZaxwwP204bzwW5MlzRoO9X/iFlqnCRsr6volNsMQYlolQ5JGYjhuWLXvM6fvKc8wNak9WGe+A44uv0hiz+CdIP0BUmJ+CX/2QsSzQ7JZzwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=iQNhMe8u; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6a0a7cf89deso20644346d6.0
        for <linux-media@vger.kernel.org>; Wed, 01 May 2024 06:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714568898; x=1715173698; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MGnbq45Q3aIVVsIxi/7+e6D9e9h4LgaesLx5MBsPbWY=;
        b=iQNhMe8urehCy3hFd1LglxlZKYcfkxKh/EC7hyt860/yzYJ/5NTqhlyFJo1b4pvQpe
         skL82GyUShx7rUK7FRi+EaLACVX1qzg4ffQFAAVTOAZjgLTefO3xyKMOxikBuGDgz/+Q
         qSxG+FfP3p3ymQbsPbHau2jsn8W4380dFfb3w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714568898; x=1715173698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MGnbq45Q3aIVVsIxi/7+e6D9e9h4LgaesLx5MBsPbWY=;
        b=jsx4bROvNZMxpLw0HkbY/Ow+B0XnqBFl/ekElonfPga3ZMQFHhnJyniypoxOo1TWBw
         9B/JWRdF7EydS1x2Gq/dsEYG+NnfGK88vcnAwYUvUk/hrRh8cKW0sjqOq617RhpSNa14
         7iLUJpuGjeiTdrFwo2NrL88LpMKB1zuKyu4mBghuCDojtXcPDOC7Vkr2d3r/k8CGV7Tt
         WRdFaSE4KkDprVeruXap0fW3Y5rfp3fy0MnI/ggCqyJel1ahgtzrOKW6x5B+B/WPn76V
         LI41idGL9AwtTSykvaZOTWib1NMvGnQ2Pnf0VZ1rt/U4MiWcr72+QWtJQYxU2ShUKBm5
         1ldA==
X-Gm-Message-State: AOJu0YzQPIFhhynEaATEY0tyhfvs4N9PTnyy51Pa+18QV7pwiGZpMRe0
	AWEYlDu78/Nd/7rVvrxEII01q9aswv3Aex0onkNYeJ9z175/Nvi8AnfRcRFmNQ==
X-Google-Smtp-Source: AGHT+IGUk7F34auoiq/zONzAUqrqK5yTPvc/Cyz94Sk8XJVQJ4h13ALDlS5aFFnC8XNMPBZjW49Tng==
X-Received: by 2002:a05:6214:258b:b0:6a0:9361:f988 with SMTP id fq11-20020a056214258b00b006a09361f988mr2350953qvb.30.1714568897459;
        Wed, 01 May 2024 06:08:17 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id l26-20020a0c979a000000b0069b10d78445sm12430971qvd.142.2024.05.01.06.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 06:08:16 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 01 May 2024 13:08:11 +0000
Subject: [PATCH v2 3/5] media: intel/ipu6: Switch to RUNTIME_PM_OPS() and
 SYSTEM_SLEEP_PM_OPS
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240501-fix-ipu6-v2-3-a5629a37a0fb@chromium.org>
References: <20240501-fix-ipu6-v2-0-a5629a37a0fb@chromium.org>
In-Reply-To: <20240501-fix-ipu6-v2-0-a5629a37a0fb@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>
Cc: linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Hans Verkuil <hverkuil@xs4all.nl>, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

Replace the old helpers with its modern alternative.
Now we do not need to set '__maybe_unused' annotations when we are not
enabling the PM configurations.

Fixes:
drivers/media/pci/intel/ipu6/ipu6.c:841:12: warning: ‘ipu6_runtime_resume’ defined but not used [-Wunused-function]
drivers/media/pci/intel/ipu6/ipu6.c:806:12: warning: ‘ipu6_resume’ defined but not used [-Wunused-function]
drivers/media/pci/intel/ipu6/ipu6.c:801:12: warning: ‘ipu6_suspend’ defined but not used [-Wunused-function]

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/intel/ipu6/ipu6.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
index 4b1f69d14d71..7bcd9c5a381a 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.c
+++ b/drivers/media/pci/intel/ipu6/ipu6.c
@@ -860,8 +860,8 @@ static int ipu6_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops ipu6_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(&ipu6_suspend, &ipu6_resume)
-	SET_RUNTIME_PM_OPS(&ipu6_suspend, &ipu6_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(&ipu6_suspend, &ipu6_resume)
+	RUNTIME_PM_OPS(&ipu6_suspend, &ipu6_runtime_resume, NULL)
 };
 
 MODULE_DEVICE_TABLE(pci, ipu6_pci_tbl);

-- 
2.45.0.rc0.197.gbae5840b3b-goog


