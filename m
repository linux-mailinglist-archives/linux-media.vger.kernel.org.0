Return-Path: <linux-media+bounces-21382-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA739C76FC
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2024 16:26:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BD7D2B309B3
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2024 14:43:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AC46200CAE;
	Wed, 13 Nov 2024 14:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DFQKezZI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006E01DF75C;
	Wed, 13 Nov 2024 14:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731508979; cv=none; b=D61uE520Zwk72Qahtay7UDrriLa4sBRbKyGij2BEBGBvw6I/NlWW4nVBE+qwWZxXadFXlZGLAl9jUsid5SjfoB7HWU3LcrDbfiGPFIdyxJNxS9X7EkittEEU1o+yhTN8yWpTC6T6hHUAhtSmlHqw/nTu6Wjv1fujfRbvbG6jBZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731508979; c=relaxed/simple;
	bh=MIxc9pb3A2IxQL5HlFSEwl7Wd892uNstH+zzZQyRacA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=c08zh6lV47FeMguVzKrQiVHYyOsYYx4/SppqfCRhaKLIk+tilfe+rvwGRSpktpuhLLFgU9s9oKDnCSiK5L/9mHBGN6UN4tEF1FR6u83Xo+WuePSIlpdvSo+O0PZFs5Y2uz3kIZSIwapeGLkjUgc9RVmgddgzmC/kR+bYI0n0tU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DFQKezZI; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-38207c86695so1630051f8f.2;
        Wed, 13 Nov 2024 06:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731508976; x=1732113776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dB4na/rSVlbZKhgTIhlmuJopwJzo4mNu4vTYN5GfTVw=;
        b=DFQKezZIp9GcvlHHkiizpqHcb7fG6XJp5Ta9ee4avo6tdGLk9DsBcpHBLlyqO+g7eV
         qjr7WEZZWsK3M3cPW3oS6L6eXg+gNaK1cE/pALig9DYCkNXVMeHx/sxwVM+X56OJQitF
         l64p4qyRGRUlftJ5Kb6ozbP5y0RGMHyUSHekGPcYGi/X9nDKSMwlVRuUM2N7airtkoIa
         CSs7x7Z4UxIKEFnHGK8L6K7TTXJy+TLsSPCZffYFfwHtwqzg/y8a2CsCD88nq4SR8cqb
         KNlYoTVApSLCccBZeK8MAE2cwUjYDG9l0ERtHqF6NQupYdrPvbeHWb++UJbevQiSJXKq
         neVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731508976; x=1732113776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dB4na/rSVlbZKhgTIhlmuJopwJzo4mNu4vTYN5GfTVw=;
        b=EHIfr29GL+Y34hadmxH7PMZnQm25zpHMlG1RJHiFOhEuaWN+axNn5flDufLE2jCwOn
         LKfz7EcXXLqAos0ow3Zr9wtpwl/c5cxQGA9SUQg2ou+XQNLK861K+WOtlUvmfzE/Vfp3
         I6kWmoMkKPj+J14YhMWwo+lBkDTMYtwuf/2+w9ynMiB+BfYK6qdFa3jWcmVPJi2l5/6r
         XTtBkWs6Mj+/s+Rt6A63c+xD1x01SftadnyRHS3fKuQ0IAgQyu/9YsAr+hOhXBlyTg3N
         AQf8Ejrf1vm7UQEd23VkUzgJHKlPUxl8tWy6MlkA/Aqrhdd7+RXHTbt5BOQZTTrCVI38
         dFqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpJlHidV3OByTgsWLjA0tr5aUK1yqblBJV/WESM6Ke63HEgr/OGikoqsYqaZxs+vUTmNcE60acgXVxxoo=@vger.kernel.org, AJvYcCX5fm2+VH9yq2qjXvUKQXnHff527fkklBhqSOQ8WOGOOaADQkoz80r4SbsXJvwqyllNvNjgnKJ0KgXtLlQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLcBmRiqBXB+Q5s4Xj2drEAYqBu1/MB4FepYqmtTXCk1riePsl
	lgwQoZrT1w0g/ZPRorrNNlpKfYiGfGVeRjZdaYktkKclOY2pVKiQ
X-Google-Smtp-Source: AGHT+IGdB0I10MRy//DQtn2pgcBxQGYqiKCA6270vkhNXaESTEy+2CPVLajdOtMtRzZ02y71aHwvgw==
X-Received: by 2002:a05:6000:1a8d:b0:37d:370a:5248 with SMTP id ffacd0b85a97d-381f18855f4mr18790113f8f.39.1731508976058;
        Wed, 13 Nov 2024 06:42:56 -0800 (PST)
Received: from localhost ([194.120.133.65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed97ce27sm18510040f8f.29.2024.11.13.06.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 06:42:55 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] media: cx231xx: remove redundant assignment to variable value
Date: Wed, 13 Nov 2024 14:42:55 +0000
Message-Id: <20241113144255.1500762-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The variable value is being assigned a value that is never read
afterwards, the following if statement re-assigns it with a new
value in both paths of the if statement. The assignment is
redundant and can be removed.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/media/usb/cx231xx/cx231xx-avcore.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-avcore.c b/drivers/media/usb/cx231xx/cx231xx-avcore.c
index 6139ef5d891d..1cfec76b72f3 100644
--- a/drivers/media/usb/cx231xx/cx231xx-avcore.c
+++ b/drivers/media/usb/cx231xx/cx231xx-avcore.c
@@ -2701,13 +2701,12 @@ int cx231xx_set_gpio_value(struct cx231xx *dev, int pin_number, int pin_value)
 	if ((dev->gpio_dir & (1 << pin_number)) == 0x00) {
 		/* It was in input mode */
 		value = dev->gpio_dir | (1 << pin_number);
 		dev->gpio_dir = value;
 		status = cx231xx_set_gpio_bit(dev, dev->gpio_dir,
 					      dev->gpio_val);
-		value = 0;
 	}
 
 	if (pin_value == 0)
 		value = dev->gpio_val & (~(1 << pin_number));
 	else
 		value = dev->gpio_val | (1 << pin_number);
-- 
2.39.5


