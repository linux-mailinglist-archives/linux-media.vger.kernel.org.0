Return-Path: <linux-media+bounces-49872-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF9FCF13C0
	for <lists+linux-media@lfdr.de>; Sun, 04 Jan 2026 20:06:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4FBE130011AE
	for <lists+linux-media@lfdr.de>; Sun,  4 Jan 2026 19:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29B0F314A60;
	Sun,  4 Jan 2026 19:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DgsI0eA1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E821527FD43
	for <linux-media@vger.kernel.org>; Sun,  4 Jan 2026 19:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767553559; cv=none; b=hbNPqFcv1b9+kf45Qr4+ZBlZLN1n4TbJOR1N8nR6BMFp7dR5K4i9939nq95X6BcA/UQTdi19zaEd/sFkRYNRyXZCkEdsG7XWgygbwIrBtKJ7fqZQpMEeJDDt0MaJrLohDu+vGMPyJ4L5R46ZBXgMf4YVECcDFCyL+73u3FTD4fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767553559; c=relaxed/simple;
	bh=OyC+g03aFlX7lZSthSQHkxNGwEsoEs0Tb0cf0wHv4Gc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A3lqTrqcMACICfF8yZdSS4bqmEksDuo28hPdPVS89EwRNBfJ2Opl1rhAOgkkltnAHlcMccQYooLFoKvkuPWZksoaBOgKh1om7tu9Y2SaTZW7R7QEvV7TUh0fSKwbizwxg7vgj0RVLZZdkhqjuTCWko7gOS6WcSDrHObY2DYh6s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DgsI0eA1; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-42fb2314f52so7464732f8f.0
        for <linux-media@vger.kernel.org>; Sun, 04 Jan 2026 11:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767553556; x=1768158356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PWgc9+y+yljidHQMYhQLHs/5E2QnwKnp6O+oSXf5cSk=;
        b=DgsI0eA1ccl1d6XKUCif/qWvr+LWl+7q2rWeBJKnf1Bo4eZUlkJ7/5laTHZ+hAZ7gM
         BPtRuyIhxyAfBsnbeG0rXWhXvVhBuOPu0cbjtsYV96aacXX3fhZwBstxFn4M/MQOZ5Hw
         U3fqeo9Sg9/yBmCoEllUvrTTMKEXQ/zqy7AMeO/7mqCcSbhp/0dUCCB9MIPh1+4uGSDX
         xv3CBMs76xEje104vJbchXVum4OFqJbctmgS5c7EbAgbcXp5ns3PPVMfOdV2/aEaUBxY
         qMAMMnVIPGcMX5p3bgNI9gCgO32eoJAtL1/SXUL4QJWvS8aaxfhTXf2shbqVlsKV+WkT
         wl/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767553556; x=1768158356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PWgc9+y+yljidHQMYhQLHs/5E2QnwKnp6O+oSXf5cSk=;
        b=GLrsDL0jBZksFLcA3HyXFw4MxAsVYXghtcD/AqdpYARGzndQYuGu7btiy7sd5FVZk0
         Xgvi0G6n96buduEo1R1SLpW+jM/H4sUiJpztfMGrIs8cvZaYUF15ZagfrfOwUH9fXZw5
         j7Kq9nTzvvNv/ZnH84nd7rWoeu8SchFjIqlS+1JMpQ6h/VOm0uJGEUWndJbkp9kOu6C9
         NZQ1cQPH3r2wCjddZeBkxyBM3yO4cVS3LLnQGH0Z5i4EW3CJC8NAITldhFJ5xfea7fKk
         8L7H4YJLxPsI9BHVj3O6gqBsgl+T3soBxZceISxbvnDwAMQy7Jbq89lkfimH3hkjTm47
         5y/g==
X-Forwarded-Encrypted: i=1; AJvYcCVJeYuNq1XxiWTjY63fhL560UyEtxlfUbY4EC31rVlRW5dDJ5xt9CD7qrDAqpOtexf0CX8awxVcW1ArjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrTJ5PAr6ftrx6P8e/ne2MsQ7VEYjzwWBXRdoyXHkusM+7cg+K
	LcD3D5C+v3IohYAn5SbgjvWnl7zgBX+5prfr2qSCzDpReVJKLkkgwvyT
X-Gm-Gg: AY/fxX6v/2DswkcVYuzaCb70wm9iSyw8Mg5p7AmP6GMZoWSied/q54q1aN30V1HKqjA
	RFGeQypMSYWudQ/k7wCz8Hifaye1UEqYk4DU/P7zHR2EZu4MBXej7f+Id5fVK4tr8Q/8ZvYurBe
	NBSLCFgB4HUpA2qPmpqkgJ4uflvbIaRBVuclSEpZOqy8NoE9xDDlsgqffU+lfRH0CQxQI8Ai3FC
	YMyQ4fMkEUqnaFiGEhwR1rf3sHwmIddn0bhN7l9oYy3hzoPMsYHkNZa6UXaXj6rEPSntCuAeFu+
	W9Rc54afXIY00IhRHuxKs4o61DwgtfgAnvY0j1ZiirP4XFwSLIqZQyAXhrXhMREkY5UVRWSC/+k
	juNOp9F5SjSsUIZnmuIub5M3UJaER6aDOeaiSCevNuzzYmQpuNY5b/gQYfPfc33Vb5NU/ttLC1Z
	uaSurnu4584yomjhdX5/YeMrLJuEvyz+ya3kBtDcb0g96X+J/LLQ==
X-Google-Smtp-Source: AGHT+IE0wNk1jmGNWpzD9tmrWUTxX1bKR2z9THWxZWvHHtqvM339Z8w94MLeOag/HytCXIrXR+WPrA==
X-Received: by 2002:a05:6000:2203:b0:42f:b707:56e6 with SMTP id ffacd0b85a97d-4324e5035d1mr50944550f8f.34.1767553556057;
        Sun, 04 Jan 2026 11:05:56 -0800 (PST)
Received: from localhost.localdomain ([2400:adc1:447:6d00:1c1a:7818:23f6:aae1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eab2c4fsm96505089f8f.42.2026.01.04.11.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 11:05:55 -0800 (PST)
From: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
To: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/5] media: atomisp: Remove redundant return statement
Date: Mon,  5 Jan 2026 00:05:05 +0500
Message-ID: <20260104190509.19683-2-mahad.ibrahim.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260104190509.19683-1-mahad.ibrahim.dev@gmail.com>
References: <20260104190509.19683-1-mahad.ibrahim.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function mmu_reg_store() returns void. The final return
statement is redundant as it is followed by the closing brace.

Remove the redundant return statement to simplify code and adhere to
kernel coding style.

Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
---
 .../media/atomisp/pci/hive_isp_css_include/host/mmu_public.h     | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h
index 1a435a348318..2fc137ef46da 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h
@@ -63,7 +63,6 @@ static inline void mmu_reg_store(
 	assert(ID < N_MMU_ID);
 	assert(MMU_BASE[ID] != (hrt_address) - 1);
 	ia_css_device_store_uint32(MMU_BASE[ID] + reg * sizeof(hrt_data), value);
-	return;
 }
 
 /*! Read from a control register of MMU[ID]
-- 
2.47.3


