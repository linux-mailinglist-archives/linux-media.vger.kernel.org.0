Return-Path: <linux-media+bounces-18674-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DC1988181
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 11:43:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CB0D1F22D00
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 09:43:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D1461BBBC4;
	Fri, 27 Sep 2024 09:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bgxBW2XG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4AC1BB694
	for <linux-media@vger.kernel.org>; Fri, 27 Sep 2024 09:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727430142; cv=none; b=YA0ggDJK22qNbhU3TKoDy57xsCudMRMmR9qyR7yK8L3pxaGYB3qG3+1QC4cyAEoF8NQNWd8v7o25kdOCTr1JtgzA9PsiGkka8KDqWatbdQ4M9cDZCL2GTP0kWz4aq7rQgIwQw+ptwCOa2L4bgs7//05/kOV7OkbQ2NC7+8+6ztA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727430142; c=relaxed/simple;
	bh=NzGO/n5w0inQUSk9Mrg2JWrHNdom3NBH7egriAh15og=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O2KPkpBNyH2wAUEUzD2zJQs7R6u5PpGvtUIbHeFpSZ6KdFRE3n0wpUkIXfTXYDgERVCrEZFfne6yjDgVXtVhgIuKfklt23EHy28h7wqpNh3ah0wH9YFgx2TOOsy3pBHvgmqIWvhqDsrK0Kwnhlmy1jZsFbnFNJg6VRS753Zw1yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bgxBW2XG; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4582760b79cso9914571cf.2
        for <linux-media@vger.kernel.org>; Fri, 27 Sep 2024 02:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727430139; x=1728034939; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YwJYpIvOPMah9ocVmXZ/vnejPzGmcFsHFsHmC+ou0no=;
        b=bgxBW2XG1nkeaFkLtiLwwW/ZrInM6i1enQVEFDZqz104Fc6EOuNCRje4+0W2PGRZMl
         4CxozEV8VpsUiRzFHN39VAw3DaejLCS2StWRb281CMkpCqj8QAaeLRFhDKK/CI00v101
         P0NbTvT4PypcAQ7zlKSZiit+55Ffo6yJkhN7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727430139; x=1728034939;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YwJYpIvOPMah9ocVmXZ/vnejPzGmcFsHFsHmC+ou0no=;
        b=J71QymF3Xu/KgRGq5vQCumprvcEBzkhkjJ7TzP7tAXewHbk71SkHcrNvXW80sWI1mV
         TcQyO1zaN8/1rwDfFoBKOz8q64IUuQlQlqMX+m9XZfXoXSP2NACBXWRCcHFbba19riGU
         mj7goaPYOfiyjYYtMl/6qwtaLZIczVOuBuem6qeFYOEXzDtM/CqRAZjJvbi4Zg4zZFTl
         vNHM32fZkw/1IvopA+0kXXqa835s55LyfDCOhHUIKXbISEx8IpsqT1/oDa7qQRxUf3/G
         BbbVhcrS8hydWZcHArxj0wAG7Kc2XUoC4sM7/455BnP8qiWkch7DxS/fRQHSFHQcrxYY
         zekQ==
X-Gm-Message-State: AOJu0YzJqxZjAwSfh9XWc1Fg9C6AtQJxPsaUMdq6l9gU76cFj+cSQuCP
	02CEFgUe/GD+ds57ptMrbThTC/hnXZVhCJwRHKOCLD+3Qf1K2qCvIw/uNsUitUbJU/75Gf4hvjI
	=
X-Google-Smtp-Source: AGHT+IEnh+IrKYShpTgUNIZMuZaNaBR2/h1owwwElW96gX0SdsoHqfJeYKcEmzOAdy8nirRvvS/+Hg==
X-Received: by 2002:a05:6214:5789:b0:6c5:32a5:567a with SMTP id 6a1803df08f44-6cb3b5b93ddmr40210646d6.1.1727430139367;
        Fri, 27 Sep 2024 02:42:19 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b5ff594sm7231606d6.14.2024.09.27.02.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 02:42:17 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 27 Sep 2024 09:42:13 +0000
Subject: [PATCH 1/3] media: ti: cal: Use str_up_down()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240927-cocci-6-12-v1-1-a318d4e6a19d@chromium.org>
References: <20240927-cocci-6-12-v1-0-a318d4e6a19d@chromium.org>
In-Reply-To: <20240927-cocci-6-12-v1-0-a318d4e6a19d@chromium.org>
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

The str_up_down() helper simplifies the code and fixes the following cocci
warning:

drivers/media/platform/ti/cal/cal-camerarx.c:194:3-9: opportunity for str_up_down(enable)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/ti/cal/cal-camerarx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti/cal/cal-camerarx.c b/drivers/media/platform/ti/cal/cal-camerarx.c
index 42dfe08b765f..ba8c4743f539 100644
--- a/drivers/media/platform/ti/cal/cal-camerarx.c
+++ b/drivers/media/platform/ti/cal/cal-camerarx.c
@@ -191,7 +191,7 @@ static void cal_camerarx_power(struct cal_camerarx *phy, bool enable)
 
 	if (i == 10)
 		phy_err(phy, "Failed to power %s complexio\n",
-			enable ? "up" : "down");
+			str_up_down(enable);
 }
 
 static void cal_camerarx_wait_reset(struct cal_camerarx *phy)

-- 
2.46.1.824.gd892dcdcdd-goog


