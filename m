Return-Path: <linux-media+bounces-18734-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0E69890C5
	for <lists+linux-media@lfdr.de>; Sat, 28 Sep 2024 19:24:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CC0ACB218E4
	for <lists+linux-media@lfdr.de>; Sat, 28 Sep 2024 17:24:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70A9E155392;
	Sat, 28 Sep 2024 17:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TZOzlVB3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF9013E41D
	for <linux-media@vger.kernel.org>; Sat, 28 Sep 2024 17:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727544255; cv=none; b=E/yBbLNLULZ6cV73eglGrB/pjEacMLWGOZ6pzmRI/aZgaSoGKa4sGa2d0NrdlDvdN0LB9/H16HbYqRedvcf03rO0NkFoWhP92CkhH60XhgHU5LcfXEcjJAhYQPke57ZiwNgQVzN3ULhuE1NGKItBVISv7JVvEoq9hR+xlyE4tXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727544255; c=relaxed/simple;
	bh=7sRFEvOMAKX7Ysy8UcKQeNTyXMyRWw/ITXhkyrrNZQs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CW8obeYM7ej8+xO85og+158ugAs5uY+kztkPv+E/7DvYJaxA2kOdRR7rErXshRe9k0hgepH6KHTu7+m7xGtswTBT1pICErssVSdV9Quwlz971upyPynHeZtfGvgVi4RXPSmEiFmGB9emZpEXXzxJigRGVaPwDRWzBr9XAN8XVG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TZOzlVB3; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6c3f12d3930so25385996d6.3
        for <linux-media@vger.kernel.org>; Sat, 28 Sep 2024 10:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727544253; x=1728149053; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b4qc8zfewwgHSkiXCkO1G3tDslgxzxahIfATlUdU/50=;
        b=TZOzlVB3v5hguijblpVvAAcJoByRBofwsRFchOrW0ZUnkHY8ZlD+y5dNyNNJ87QwJ7
         hFovormxS/YWnUBF8Tf358NBKvYwZrGh4MQ1t3KxlmmWdw7jehOW4GytZyOpS+MNsQoc
         dktIEH2j8OfKY+R3Ls7dTfsxqudaqCmC/WGSQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727544253; x=1728149053;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b4qc8zfewwgHSkiXCkO1G3tDslgxzxahIfATlUdU/50=;
        b=rhZ++NPXzNLytE0+41mrJcnRYdqSv3WNpch1kveB01ENU1z/6Ov+tNier5p5ZJeawl
         kIysk6QqvM70HnXcNyOuR3MHBhMuUhK0+rgM3uo7bjwwP0w8+NS1iPb7BimHWDXaddzT
         TR0kCd9USDORzaglXi7s9YmZAQ7ADH0nZ9V5UUYlHhRceSCTPicodxJ8W2LI9JWUTgoP
         cs2QUG/5BaHXl3K2vg9h4eJPrpq7uwlht0kR+2ickKX1kMB1x/zApHp+pAmBi7oYouEo
         uW9hUKdRObUoA++mpeU+mKampTbJZIP4Rsc5fI1DzMa16bQKZ9re/0S7bIIbpRWrl64I
         sPjg==
X-Gm-Message-State: AOJu0YwWdBd/TWgX6I1zOzsLcnpYj0q0y5NV2iHzjF8BBrn0T+XocB1f
	nsyL9hoGJYv3ZJFAH4kvlsTm6Mtn02qVAYKqnhyiObKOj3Q3hSMNyFJ99jnBlg==
X-Google-Smtp-Source: AGHT+IHwEPblocGstpOT+vVO6hqhZ+nCAX+DqBguQK/Wg4w8ON4sghOsgRC6QVX4V1SR7wl9ChkfXA==
X-Received: by 2002:a05:6214:4586:b0:6cb:3883:bdbb with SMTP id 6a1803df08f44-6cb3b5e5107mr128948076d6.25.1727544253378;
        Sat, 28 Sep 2024 10:24:13 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b68311dsm21437756d6.122.2024.09.28.10.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Sep 2024 10:24:12 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sat, 28 Sep 2024 17:23:58 +0000
Subject: [PATCH v3 1/3] media: ti: cal: Use str_up_down()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240928-cocci-6-12-v3-1-53fc5ed20be0@chromium.org>
References: <20240928-cocci-6-12-v3-0-53fc5ed20be0@chromium.org>
In-Reply-To: <20240928-cocci-6-12-v3-0-53fc5ed20be0@chromium.org>
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
index 42dfe08b765f..80ad4a19c07b 100644
--- a/drivers/media/platform/ti/cal/cal-camerarx.c
+++ b/drivers/media/platform/ti/cal/cal-camerarx.c
@@ -191,7 +191,7 @@ static void cal_camerarx_power(struct cal_camerarx *phy, bool enable)
 
 	if (i == 10)
 		phy_err(phy, "Failed to power %s complexio\n",
-			enable ? "up" : "down");
+			str_up_down(enable));
 }
 
 static void cal_camerarx_wait_reset(struct cal_camerarx *phy)

-- 
2.46.1.824.gd892dcdcdd-goog


