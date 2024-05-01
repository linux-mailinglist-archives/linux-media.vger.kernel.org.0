Return-Path: <linux-media+bounces-10533-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DFEF38B8AEB
	for <lists+linux-media@lfdr.de>; Wed,  1 May 2024 15:08:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7FE1D1F22F09
	for <lists+linux-media@lfdr.de>; Wed,  1 May 2024 13:08:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D858712EBE1;
	Wed,  1 May 2024 13:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DdzAlgRS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F285F12E1C2
	for <linux-media@vger.kernel.org>; Wed,  1 May 2024 13:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714568898; cv=none; b=GMBnhZEK7CtmFbiPilVfkX3wPUuNPXU0e+4hYRellQOxZ75cpPqIaG631Z6WtatPhQQFzfeaxOVxXABwK3JqUH12G8svuelyyTvT6dRBRv08D+WEeE+86DXgwMgZx+qgdJl73jovyFfSZtupl+S8F+JwWe6CipubJ0xYYXsBsOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714568898; c=relaxed/simple;
	bh=ty6e+rZ6GfQw+9UJTsa9bqwh25nZoUPmXmJtIfp/dG0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oZuRL0O81OtUcX7hO1cws2z0ZxaFL/nKUFZN9dCzlQnouXAi7qEGxjcBiC8XPsSbQ5/M3+hHnqEVMQu5peHXR7wC+vYAnrRUaSGAZ0KVeaUEQmyHFYkt2XAfo+k3+8TAAswNKUScRExqx9pIz8rcUU0bmDHCWoFcM7p0Mv5HTcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DdzAlgRS; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3c74b643aebso3986435b6e.0
        for <linux-media@vger.kernel.org>; Wed, 01 May 2024 06:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714568896; x=1715173696; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yIqrh9vxITy1BabNVOF1UFebsQdvmndT0UdjTkJUAiM=;
        b=DdzAlgRSg1QWkrM7Y8iwDp2fz5/CexfcilPCZnBuCj2u8oQOzrkrYydOLeijtla92M
         FIgr/ypssI0Yvs0zOMNndJhCtVq0W/PPfXmxrG9xezCcANVX4OaNDFS9c6ftINvIGTUI
         fekMPWICsu8Tc4e0w+zEo6cYuHMbewsQHmNBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714568896; x=1715173696;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yIqrh9vxITy1BabNVOF1UFebsQdvmndT0UdjTkJUAiM=;
        b=royNrLAypTvcs8kX/gBL+IIIafB0D41wf7nDHy1Je3Loy/ZzO7CQbRwu2VOovRXK0Y
         B49wcM2QhuKGyTaGDg6G98MY2Edxz9u7u71kJvGE9X2AE+EILAkpyr6x//1cBW1MPO4N
         cCn2x/YyC3Z5hfMijsTodzkbadmE3PKC2N7hRDanNEBVQ0AkGNLjPFkJ4Wpq2zRq2lRr
         z1sUnOIyVGy7x3odcEuFCcGzUAnwdasqpA1DUiPEjm5ExtqRPrnQpe7pJ9unqzWsIOhE
         aCKjDmRmbGRodwXqzYa3JwpPAI9QL2tJwqg3EPRibexuNRmhYwdPnNYMvleya6cQQGZ9
         8itg==
X-Gm-Message-State: AOJu0YwndItG2FXfaTO40H2+Ce6O941/mALpXkmbzuQ3nvb4HYKRT7Ze
	E73lhwo9GwnL869gtaA2Ev6rTlE4KPei3+cVKXJDAO1tI0S/hXKrQyS9zhtvOg==
X-Google-Smtp-Source: AGHT+IGFB0XhtvNukEJCBP+GoB2QKQrdFJkNpDYdG7PKY86Xxuy4bsWI+JUYUd6ulPAr6zKIgAEWsA==
X-Received: by 2002:a05:6808:14d2:b0:3c6:1510:f35a with SMTP id f18-20020a05680814d200b003c61510f35amr3484615oiw.9.1714568896002;
        Wed, 01 May 2024 06:08:16 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id l26-20020a0c979a000000b0069b10d78445sm12430971qvd.142.2024.05.01.06.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 06:08:14 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 01 May 2024 13:08:10 +0000
Subject: [PATCH v2 2/5] media: bcm2835-unicam: Include v4l2-subdev.h
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240501-fix-ipu6-v2-2-a5629a37a0fb@chromium.org>
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
 Hans Verkuil <hverkuil@xs4all.nl>, Ricardo Ribalda <ribalda@chromium.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.12.4

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

The unicam driver uses the v4l2_subdev structure. Include the
corresponding header instead of relying on indirect includes.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202404302324.8aTC84kE-lkp@intel.com/
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/broadcom/bcm2835-unicam.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
index c590e26fe2cf..3c7878d8d79b 100644
--- a/drivers/media/platform/broadcom/bcm2835-unicam.c
+++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
@@ -55,6 +55,7 @@
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-mc.h>
+#include <media/v4l2-subdev.h>
 #include <media/videobuf2-dma-contig.h>
 
 #include "bcm2835-unicam-regs.h"

-- 
2.45.0.rc0.197.gbae5840b3b-goog


