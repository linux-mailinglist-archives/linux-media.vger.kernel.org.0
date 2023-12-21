Return-Path: <linux-media+bounces-2833-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CB54E81AC99
	for <lists+linux-media@lfdr.de>; Thu, 21 Dec 2023 03:23:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A1751C22B16
	for <lists+linux-media@lfdr.de>; Thu, 21 Dec 2023 02:23:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBA331FCF;
	Thu, 21 Dec 2023 02:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CWXBIQwv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0928B1C05
	for <linux-media@vger.kernel.org>; Thu, 21 Dec 2023 02:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1d3e05abcaeso2421135ad.1
        for <linux-media@vger.kernel.org>; Wed, 20 Dec 2023 18:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703125375; x=1703730175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Kj+8KjkTSmwldlHHPddNLCs0zGzZLqrxZYeMYZnxWQ=;
        b=CWXBIQwvBv3PyxulUiK1v3p2iAwO6LesYzNEEM3lTycQ+824nQP2zcjbPVCfMrYi+R
         8FmRRHP04OVHFM+iPkLi3Bkhv33/IXdqYbjRmCTQ3cAg1aD4hXiBzYVWnbqaZ/DzIElC
         Kw5WaM+Lgiret/eF6T2BB8xg0vNCaGqqPfJuBdmVcnFeWmf7aXV0ytSNdaH5uaX5ecOF
         qF6gTb9JieH3sfTRSgXMYeulXCvUFFZR/ZEA7MVm6zdO9tqXu+LqVtFgdqwWZxDi4HJ3
         vqeWFnMywdkdNViz0MyzsAMVvuAxXzM4G46WyCs5EzyI3DXfihXH5+z0WEFtB0QrgTNT
         j7RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703125375; x=1703730175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Kj+8KjkTSmwldlHHPddNLCs0zGzZLqrxZYeMYZnxWQ=;
        b=JvutoGAU1svV0qlPPTGfISB0HVXgY54IgT7NBt9U6JLESJW+4O6K7qOlWbbgDDIug5
         1x5yzT3gV94w2aqDzWhLty41+pLVGEfEAEKkIEyx8SahvEDldF+2x8s3m8nC7Xh55Xba
         VtuoCu65RcB3F7aTzvI8Q3HKFElJyV2crKNh2DGAaZkXNf9wZFqO6vdD18p380txEKlV
         5FpcfukHear20Lodvf4IWDH9Z0U0PEWvBau8EOgRVxknl3BAdDjH5wDXhoq6uFhgx7Pm
         BrYpNoFcJ02bjo5A5fpoKY79hchbsTZw1af4D3huhkeT9Lv/OhR51+Ts3fpbP/2LlhuX
         osRQ==
X-Gm-Message-State: AOJu0Ywh9UZil8/FcPHn6p2Jy8oeSXfgs/AcijSZzKIiDDdtU6u6k32w
	Mv02j3gzH+9YWmcmt//bwYQ=
X-Google-Smtp-Source: AGHT+IHLc9EQgXC+L/vPe01cqJe2TCuZzQ4IDWd36OfoLDnsWmNdyZcvTa0phgbjURv+NCiIU31wbw==
X-Received: by 2002:a17:902:76c7:b0:1d3:45b7:bc26 with SMTP id j7-20020a17090276c700b001d345b7bc26mr7483132plt.54.1703125375363;
        Wed, 20 Dec 2023 18:22:55 -0800 (PST)
Received: from pek-lpggp6.wrs.com (unknown-105-121.windriver.com. [147.11.105.121])
        by smtp.gmail.com with ESMTPSA id e3-20020a170902b78300b001d051725d09sm389875pls.241.2023.12.20.18.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 18:22:54 -0800 (PST)
From: Kevin Hao <haokexin@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	Mike Isely <isely@pobox.com>,
	linux-media@vger.kernel.org
Subject: [PATCH 3/3] media: pvrusb2: Use wait_event_freezable() for freezable kthread
Date: Thu, 21 Dec 2023 10:22:28 +0800
Message-Id: <20231221022228.548473-4-haokexin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231221022228.548473-1-haokexin@gmail.com>
References: <20231221022228.548473-1-haokexin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A freezable kernel thread can enter frozen state during freezing by
either calling try_to_freeze() or using wait_event_freezable() and its
variants. So for the following snippet of code in a kernel thread loop:
  try_to_freeze();
  wait_event_interruptible();

We can change it to a simple wait_event_freezable() and then eliminate
a function call.

Signed-off-by: Kevin Hao <haokexin@gmail.com>
---
 drivers/media/usb/pvrusb2/pvrusb2-dvb.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/media/usb/pvrusb2/pvrusb2-dvb.c b/drivers/media/usb/pvrusb2/pvrusb2-dvb.c
index 26811efe0fb5..6dd6c5a18251 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-dvb.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-dvb.c
@@ -33,9 +33,6 @@ static int pvr2_dvb_feed_func(struct pvr2_dvb_adapter *adap)
 	for (;;) {
 		if (kthread_should_stop()) break;
 
-		/* Not sure about this... */
-		try_to_freeze();
-
 		bp = pvr2_stream_get_ready_buffer(stream);
 		if (bp != NULL) {
 			count = pvr2_buffer_get_count(bp);
@@ -62,8 +59,7 @@ static int pvr2_dvb_feed_func(struct pvr2_dvb_adapter *adap)
 
 		/* Wait until more buffers become available or we're
 		   told not to wait any longer. */
-		ret = wait_event_interruptible(
-		    adap->buffer_wait_data,
+		ret = wait_event_freezable(adap->buffer_wait_data,
 		    (pvr2_stream_get_ready_count(stream) > 0) ||
 		    kthread_should_stop());
 		if (ret < 0) break;
-- 
2.39.2


