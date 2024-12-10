Return-Path: <linux-media+bounces-23091-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BF19EBA64
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 20:56:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E9791888EEF
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 19:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE22D228362;
	Tue, 10 Dec 2024 19:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="luzU6aTT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9822F227588
	for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 19:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733860575; cv=none; b=bBPhrbPUGDsV6jPt1DstTOpO2sdSBVOLb1+ucUhqHAUiJ7gzGEdTMO3viOsTWhmjKo60WRkQF/cZCUikDCCIO6F3UM1f7eN+Yiy+TWKH9OapEgpN7TzEE04Oq/PDSXSxVj0pywBQho5rAVqCCRqTYVtiDA/JHcaodLTaKiUJToA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733860575; c=relaxed/simple;
	bh=sdF7tOeLaLfCdiDlVogKRTgQV5yx9VBAgCr2khnDCdU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fYGnfzO4pWTc1capiScKhuKCBH+3RHfU1ZHtDgSnppc7NZStji+xPl6B6tJmud57h9TbwCXyTJgSObfLjurxWuajrsJWA8gLv07CCtwM6yhbal+0+NRXmRNq10L5BMmgJjf3dlSpVqz5TOnnV9wQjilLMUPj4ln/xJt6XdVf70w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=luzU6aTT; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-85ba92b3acfso1429368241.1
        for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 11:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733860572; x=1734465372; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CTX31YxAcEET+qmrwOGI7rmuqifx9R2Evse3TExOMoA=;
        b=luzU6aTTSezSex1ALcfr8qm/Cw43J8blTOlKNcRbTvmt2thKSm04esfPknpK/p4PlZ
         lzXIXwS80VEBJYaklDfFc3P70PWXSZiRXWH/+ATNeATzC93i5+9o11+s04HJoVVxLXct
         lg+PTzl62ZYA9JYwTeo2CZIxc5S4oZSVr1tGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733860572; x=1734465372;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CTX31YxAcEET+qmrwOGI7rmuqifx9R2Evse3TExOMoA=;
        b=nQlMb2k9ivlR0qiyoYlMXrqauXj94rqNEtay8MA0kp5Mj1smQRnWjy7cZT9OH5LjZn
         YZBHoPbSyCKgyagljdvboYrFR4Y7hxx9uMohUVme7BQFa9jsN514M1hidEiSdwEpKmbv
         1fVDKrwS+A+1n+U9PGp8vsr8kfFF9dUMeUXqsHHVUm6qc4rlc9iSmLE2egRuFNXdhteA
         ITDh8LMTF4YgwAItdOiH0Vaf7Al+DnJkuI5lEAhA6HZCa8zxikvpgub/1QONlMFVI1Nb
         A9eOOOLlXXVxjeX8tqPkvwna3tgWPuPlSzGGkqsh6RJ1lR40bG3dwQNO4zFOBFvExyAe
         eROQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiXIuFZeTK+jmmcVif8OFL3U4Q75KyazCAB7HcUMu9lfCwo5SRu8b9LiaQmIVMDHQ2+i9+4fl5ZUlmng==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnBxYOWOPh3Dyg2jzPzfmgKgnD4hQwKCiHuonTut3AZLB47Dz0
	EoOjPO4eqmhJLRPwFVKTYDEzVel34HNrnlgiRIS6ZM4ZtzTi+YqE14Tsw+Cf2w==
X-Gm-Gg: ASbGncvOSWqgf/qqad3CQ1ZHX/H4rk7uRJrFnBB7vJWLdqaV+Y7vyuhwIIj/ZaDM+gD
	gWiyFd5PKbLDAMw8sLTc67kiuDXdOsYCVOH7BqDM6bvUDK/5go4rmPTgA/Wj2HYUn+kPGlIBng2
	s6uJfQyCTrDwfzb3v7Ud7ZV6MPqCTX0Rea88537I/TAbm1xLsCsI20wZRjYvNGI16PCJK1wqiX4
	o32T+n4u/kyoM/RzdHKCJ6WHFLlP/yIZmeJ6rAXrQP2QXMsRYBYSBW/1RgZohpAZsubxqKMCxmr
	QVrN5eQ8RzAyzaYrt468sJJ0GLL/
X-Google-Smtp-Source: AGHT+IFOlLOc71KptU+gM+mbs7OSqZvI0F+Ca1OaQ7iYQclHhw5OIq3pXc1ymxgCi+mj9I6EK0fVEA==
X-Received: by 2002:a05:6102:418b:b0:4b1:1971:383f with SMTP id ada2fe7eead31-4b128fee492mr811079137.8.1733860572588;
        Tue, 10 Dec 2024 11:56:12 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85c2ba7dc70sm1279522241.15.2024.12.10.11.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 11:56:11 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 10 Dec 2024 19:55:58 +0000
Subject: [PATCH v3 1/7] media: ipu-bridge: Fix warning when !ACPI
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-fix-ipu-v3-1-00e409c84a6c@chromium.org>
References: <20241210-fix-ipu-v3-0-00e409c84a6c@chromium.org>
In-Reply-To: <20241210-fix-ipu-v3-0-00e409c84a6c@chromium.org>
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

One of the quirks that we introduced to build with !ACPI && COMPILE_TEST
throws the following smatch warning:
drivers/media/pci/intel/ipu-bridge.c:752 ipu_bridge_ivsc_is_ready() warn: iterator 'i' not incremented

Fix it by replacing the condition.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/r/202411221147.N6w23gDo-lkp@intel.com/
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202411221147.N6w23gDo-lkp@intel.com/
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index a0e9a71580b5..be82bc3e27d0 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -774,7 +774,7 @@ static int ipu_bridge_ivsc_is_ready(void)
 
 		for_each_acpi_dev_match(sensor_adev, cfg->hid, NULL, -1) {
 #else
-		while (true) {
+		while (false) {
 			sensor_adev = NULL;
 #endif
 			if (!ACPI_PTR(sensor_adev->status.enabled))

-- 
2.47.0.338.g60cca15819-goog


