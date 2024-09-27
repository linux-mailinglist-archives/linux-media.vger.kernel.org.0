Return-Path: <linux-media+bounces-18675-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF1B988186
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 11:43:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89F02280F3B
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 09:43:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E5581BAECB;
	Fri, 27 Sep 2024 09:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YGXwi1ry"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7B61BB6B9
	for <linux-media@vger.kernel.org>; Fri, 27 Sep 2024 09:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727430144; cv=none; b=ox66iYWbk0lzLlRIJKTDdZhpbX8sd3gjnmkK+0qNUoXNRJ1TvThmVA28Ih6q5cjN8fJMclLtZ99J/nIJQ1Sw9FXiMrDdy+sR9MXxRA0/6+w+Yf+/UkQNQ51+mBpZFSir89ScwYEQKrlN6vCXU9l0mki3ELTpKN15yetmhYwA89U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727430144; c=relaxed/simple;
	bh=kCl1YSqZuUUZDtGA+QAZtwsRUo5HY0IPZiSWxLVmfm4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qwAPCEhjfS7vcatM6wX3oE9fQEf8+3bm5pBjvVnteSGTA4LkAKBCKMvFkFHTajJzKBn8ldywYBHiF8svGhGHM4rYKX3nmMw2XVoR6je87yHhpxPhS9kJPTPu1+bpgCz17G2SkLsbQ0STgXjedraW6ALNzOniWt0ZxZqBKxl+17Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YGXwi1ry; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6cb2f271043so17064256d6.0
        for <linux-media@vger.kernel.org>; Fri, 27 Sep 2024 02:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727430141; x=1728034941; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VINaQxL9vW722McPbfM1p2Q0+fZYKttm/dJVtWO/GI0=;
        b=YGXwi1ryz/iwZd1v/SFBTCTDFiXFExify3cBGmCo0OfzMABIMNt60KaPc7ASh7PzaN
         ZowxDlIk11m91E/gw/vahA2iGqFR4R4EAmyfhCdIQp5NdNLa692lCVF51/NXxMz0LI7+
         Htdhwr4ReSp+veUnh6GLRHuwURaquvGVI3hK8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727430141; x=1728034941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VINaQxL9vW722McPbfM1p2Q0+fZYKttm/dJVtWO/GI0=;
        b=HpBUTaAl68ujSG5pUVe/I0koxSIsj8/VQyRqRJpWyonAF7gp7C5e+eqU+YhDo5/Zvk
         JLIg4AG8Y5bDnrRQu9F4x/mj51OmMlv0m/hhUv2PEPPIk2aLT5lsDHht5bl6nRGMPcS2
         v+Py7ti0vGpqQf7pCUR0MSf7CgW+wXh8OW+MaKbadAuJ3cpr2KziKpYwr7qRjz8Bt9p4
         NjOvditEDFO+y8GtMHsrGzKpLstvYpwtSUFYrhR6eRNLODkS0Q7TyffgHT6Tj2e+foqG
         Qu+G5ErlJXbRicqBbeIrgVTZ5L911ePJiKfK0aRg1C5Wpln3s8SHv+5SX3OgPaA5mCIg
         nl2w==
X-Gm-Message-State: AOJu0YyrNQu1HS7N610t1w6SZv35w1i41fx0w5Uc0p+zLovH10eKWKUR
	kgvTVbOq8GFCrr1Xkl278Sii1ST80mMg/G7+xxldhW+kHSJdDPpXySTIoWVOA+3mGKXkoCssgy4
	=
X-Google-Smtp-Source: AGHT+IGGsdMZl/i8EG8b5Z1JmOsFAyZ9WklfULMXZz5d7lRQYLgXR1nLV+QVTf216ds3TwRWII3bkw==
X-Received: by 2002:a05:6214:320d:b0:6c3:5a89:9998 with SMTP id 6a1803df08f44-6cb3b60fa9cmr33792876d6.23.1727430141573;
        Fri, 27 Sep 2024 02:42:21 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b5ff594sm7231606d6.14.2024.09.27.02.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 02:42:20 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 27 Sep 2024 09:42:14 +0000
Subject: [PATCH 2/3] staging: media: ipu3:Use str_down_up()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240927-cocci-6-12-v1-2-a318d4e6a19d@chromium.org>
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

The str_down_up() helper simplifies the code and fixes the following cocci
warning:

drivers/staging/media/ipu3/ipu3-css.c:229:18-47: opportunity for str_down_up(state & IMGU_STATE_POWER_DOWN)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/ipu3/ipu3-css.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/ipu3/ipu3-css.c b/drivers/staging/media/ipu3/ipu3-css.c
index 1b0a59b78949..bb22375481a0 100644
--- a/drivers/staging/media/ipu3/ipu3-css.c
+++ b/drivers/staging/media/ipu3/ipu3-css.c
@@ -226,7 +226,7 @@ int imgu_css_set_powerup(struct device *dev, void __iomem *base,
 	state = readl(base + IMGU_REG_STATE);
 
 	dev_dbg(dev, "CSS pm_ctrl 0x%x state 0x%x (power %s)\n",
-		pm_ctrl, state, state & IMGU_STATE_POWER_DOWN ? "down" : "up");
+		pm_ctrl, state, str_down_up(state & IMGU_STATE_POWER_DOWN));
 
 	/* Power up CSS using wrapper */
 	if (state & IMGU_STATE_POWER_DOWN) {

-- 
2.46.1.824.gd892dcdcdd-goog


