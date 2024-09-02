Return-Path: <linux-media+bounces-17377-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 917D6968B60
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 17:58:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DFCB283C69
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 15:58:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 047771AB6C8;
	Mon,  2 Sep 2024 15:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c7n/JLd4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11DD1A265C;
	Mon,  2 Sep 2024 15:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725292660; cv=none; b=gQZ9jaX9o/T68m4glMKmAQ4t2giTTBZ/x3xq+XOmbmiAlyuTULISNV/XbCknov4Ir+gqrl0FFNxZ58yV3AFYtuWRPs58b8cEqo7t+BkUtps7pUmOdBdCUmAZ7YrTjMjDV+WaAGVGU4egK91TWO+3RII0L8AC7Mr48pZe02jhYqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725292660; c=relaxed/simple;
	bh=dhIUmqGXD7ukNGJkdpSPw/0b0JTtqY9BJywHGpeznpU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gf1r0LM5mpouYv3J8pvkh19bRPFqIdzYRoeIdhPFwg6Ta9ofhSwYrPxSJNEXsBsrOZJfHVhdxWzXsVPh5v9GrC+jkQkMhMpCl0ETogAVPnrI0k9VgRQGXuJmJadHxPGqP6hWFeMZYHpklJ8KHK0QWnBU4QP0uAWTIuVwlxtz04U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c7n/JLd4; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5c210e23573so4474444a12.0;
        Mon, 02 Sep 2024 08:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725292657; x=1725897457; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NOTuNT2pG3NdBDrQ4sOowXdydQbe5NJerAYtbOYu3W0=;
        b=c7n/JLd4NMdkY6BqSJ3hBqF/HOvWxpXHJJoDH8iWEQi4oEbdbGZ7YhMDtJ4ossZO61
         ge+ndZ8xaNV9kaGkkOJ1S9Yt3fROhgBhPEutBmjkXtAbg3nsXwdSVlQrgsMjiNn9fY/K
         tm/Dw7VzlL9ttRjQVNzXKj+34cqzV+tOa9HTpF9d66h5UDbfpaoCR01G0aWD3pkI+PRu
         vVUUwM6Kjn+GavIDG15ZRkZH+rBy3POBKJeEUdINXzsKIoyyHXiJwPWLEoF7VJ5fsd2t
         3eWjLt3+SjZsMHUGXcx5d3UBnV6el/dvFxSXGd/lbhaCF4tKfX+7xJrW9hqW+bCqGaBC
         Egxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725292657; x=1725897457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NOTuNT2pG3NdBDrQ4sOowXdydQbe5NJerAYtbOYu3W0=;
        b=Rg0AzFvRA0JSK7Wsml9OotFNLaRR4Q/bgmCkipzdCHd+LRJAMDACCXK4TyL+guFtSX
         LzJTfJ3ubhkXWtmwKx6HWBgJ6BNwILIhSpWCpAkcGl6tSmG8FZCysE8IqM5sWhxZ5eKt
         iLi/v1FsCKQtkxCvlO1w8mWF3ndvJ2udGELrMFvRxOkb9fJISmpC4xKXhp875UAYq0Zo
         jz6b+XOetEb3K6HlcjGYtLF2BNG0ckIteFQcZMv8meQoTZVscerzdwIucrBeVFzgyYsE
         ULOxDdkWXaAqQaik6UnjfQMVY3f2z7phtzEKGelhi3x3x3bFcT5aK0YosByLOIRhmCK2
         V/Zg==
X-Forwarded-Encrypted: i=1; AJvYcCVHRAsrOtn6+h5JxUQKBZnEfUR1GmUauc/v69A2zJS3QaWT97M3zaAGygYjewATTOyXa9wBbO6o5zmhRrI=@vger.kernel.org, AJvYcCXYzGTktXo5Mo1Vmjh0x2yo/zI8ddUSpCqVhRmXO2qC/dFX3X/eZxlJSTGTbpxMUZJoFtFQ3IR+wTmS0J0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaZTbMJ7/ZjTxHmHKaOhVmpjtYycBmFHr6qWxu6q3v6/gouV09
	kZIDR0g1I98wstGtlTqauhafcz+T8ZuN6c44Wp9/+k/cws3YtLhf
X-Google-Smtp-Source: AGHT+IEoQIfVVefmqqaw6Je2s5pdfIvCaNfR+B8X8Ji2/2FJOsHtov518enxdZa31uYoylPz1sJnGw==
X-Received: by 2002:a17:907:971c:b0:a86:6e5e:620d with SMTP id a640c23a62f3a-a8a1d2d5cc5mr50133066b.27.1725292656793;
        Mon, 02 Sep 2024 08:57:36 -0700 (PDT)
Received: from [127.0.1.1] ([2001:67c:2330:2002:af84:a410:1c4f:f793])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a89891d6f87sm570951366b.158.2024.09.02.08.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 08:57:35 -0700 (PDT)
From: bbara93@gmail.com
Date: Mon, 02 Sep 2024 17:57:27 +0200
Subject: [PATCH v3 2/7] media: i2c: imx290: Define absolute control ranges
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240902-imx290-avail-v3-2-b32a12799fed@skidata.com>
References: <20240902-imx290-avail-v3-0-b32a12799fed@skidata.com>
In-Reply-To: <20240902-imx290-avail-v3-0-b32a12799fed@skidata.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Benjamin Bara <benjamin.bara@skidata.com>
X-Mailer: b4 0.14.1

From: Benjamin Bara <benjamin.bara@skidata.com>

For now, the driver activates the first mode (1080p) as current active
mode in probe(). This e.g. means that one cannot set VBLANK below 45
(vmax_min - height), although theoretically the minimum is 30 (720p
mode). Define the absolute possible/supported ranges to have them
available later.

Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
---
Changes since v2:
- new
---
 drivers/media/i2c/imx290.c | 36 ++++++++++++++++++++++++++++++++----
 1 file changed, 32 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 1c97f9650eb4..466492bab600 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -499,6 +499,10 @@ static const struct imx290_clk_cfg imx290_720p_clock_config[] = {
 };
 
 /* Mode configs */
+#define WIDTH_720P	1280
+#define HEIGHT_720P	720
+#define MINIMUM_WIDTH	WIDTH_720P
+#define MINIMUM_HEIGHT	HEIGHT_720P
 static const struct imx290_mode imx290_modes_2lanes[] = {
 	{
 		.width = 1920,
@@ -512,8 +516,8 @@ static const struct imx290_mode imx290_modes_2lanes[] = {
 		.clk_cfg = imx290_1080p_clock_config,
 	},
 	{
-		.width = 1280,
-		.height = 720,
+		.width = WIDTH_720P,
+		.height = HEIGHT_720P,
 		.hmax_min = 3300,
 		.vmax_min = 750,
 		.link_freq_index = FREQ_INDEX_720P,
@@ -537,8 +541,8 @@ static const struct imx290_mode imx290_modes_4lanes[] = {
 		.clk_cfg = imx290_1080p_clock_config,
 	},
 	{
-		.width = 1280,
-		.height = 720,
+		.width = WIDTH_720P,
+		.height = HEIGHT_720P,
 		.hmax_min = 3300,
 		.vmax_min = 750,
 		.link_freq_index = FREQ_INDEX_720P,
@@ -846,6 +850,30 @@ static const char * const imx290_test_pattern_menu[] = {
 	"000/555h Toggle Pattern",
 };
 
+/* absolute supported control ranges */
+#define HBLANK_MAX	(IMX290_HMAX_MAX - MINIMUM_WIDTH)
+#define VBLANK_MAX	(IMX290_VMAX_MAX - MINIMUM_HEIGHT)
+static unsigned int imx290_get_blank_min(const struct imx290 *imx290, bool v)
+{
+	const struct imx290_mode *modes = imx290_modes_ptr(imx290);
+	unsigned int min = UINT_MAX;
+	int i;
+
+	for (i = 0; i < imx290_modes_num(imx290); i++) {
+		unsigned int tmp;
+
+		if (v)
+			tmp = modes[i].hmax_min - modes[i].width;
+		else
+			tmp = modes[i].vmax_min - modes[i].height;
+
+		if (tmp < min)
+			min = tmp;
+	}
+
+	return min;
+}
+
 static void imx290_ctrl_update(struct imx290 *imx290,
 			       const struct imx290_mode *mode)
 {

-- 
2.46.0


