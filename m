Return-Path: <linux-media+bounces-11145-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 084088BFD25
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2024 14:31:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A56B1C22D70
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2024 12:31:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF77A57339;
	Wed,  8 May 2024 12:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iRWREZOJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40C43E476
	for <linux-media@vger.kernel.org>; Wed,  8 May 2024 12:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715171468; cv=none; b=pYv7TE/I/Can9ADhocbX72qrw0BS/sDrpD2moCU12PCmz+6mcWHubZwEFCqh/h8t8wsXm+VnQ39KWWg5Tlg1STTGGCYj+6lkjxNNrB9XgvXBAM9iDfmNpjP4IwMAU50vwLk4tQ9B6Ehtds/yE2dJElamXXYIXL9moI0XMlpfOyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715171468; c=relaxed/simple;
	bh=ypiD4mRN51Hplwk/35DZxPd83xif6QNctW1BjADlk2w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nsp0BN7Jx1awSqVWS04ZW8EC89AGqqwtVVDutz9F1LCWM3sPqE1qP1rmbExHpLeAtLhXe9xyb3gcVvtNAiRSr/8XKl8WATr18PcKLyxrHvlKII377BiqPvC6hF4mxiSkT7W+tMedAtRypNNApq3lNHz0SIMKkKhN6gCJcfOeJKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iRWREZOJ; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a4702457ccbso1138417666b.3
        for <linux-media@vger.kernel.org>; Wed, 08 May 2024 05:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715171465; x=1715776265; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PvskylCoCM4TGyFAD0Ni5/k+Obqef8+RlkP1gi+7gz0=;
        b=iRWREZOJg4M7LYWKwz4EaopSuhScVbc3RhtkAKd5ctzY9jmTSotrbK9J97TO75pCSz
         unMETwB7iHjzOvd5sN3awPRmhna21PbqfuZKl0Vm2EFug4SfHcJgE+sRh0UZW2PX2e89
         m6NifRySLCOTCSDbxAlPIY1b5DTtjif8HE+TbcVKKFV2tUn0oOA4gPO09GoK/+pCOPc3
         FzxHgqH0WIB0jt8ydkN1+qTvgK7BD8khSyKnBndSgidj/T9bC/ldbKoIEGd/XO4oqeNn
         sd1uSSn47XxKR/ZFMJNkxaYhLLZ/qtwQf667Hv4gOlgcSOtZ/WEQlKOVKoihfy9Yinxr
         D3Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715171465; x=1715776265;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PvskylCoCM4TGyFAD0Ni5/k+Obqef8+RlkP1gi+7gz0=;
        b=FdIwEo+mlqj5mYw8vte4kbgbfax4GLfTp7M9f7bOeJIoRRPg8QSxMLGr3Y62WZEm7M
         vEQHqM9bJrauqbYMv6DBxIMTCmmtUSRFCeLVnBAwDH8tI97gNHQ2sS53K2z3tLvTGsX/
         Zt6lsc+NK5zfpqnelCsTrLbzAT5c4+Gy249YUKcpCTGN6oPvGiQdnHXhbse4Af3pN5lg
         hV2WkQnHEuw/nfoaWeF6Xw7yfNRLkKRw+MWBD3qroQlT4Nj1iy+KHrAJqnAYmzeW0tKq
         /HxtnGUqhL/M820w5BfB5v2UCDtJCDcnmupO83oUEj8LJ1KWH0v/HRkQlFs9mPnokWam
         x1HA==
X-Forwarded-Encrypted: i=1; AJvYcCUXFLAWeiHOvfq3IoM04IMDI8ImlHwPci38eH0r1AtP7eqfoJ/h534XrqDgubX0R25F5u8oobxOUD16W9GOpoVl6BvX/ZCeVUBqnU8=
X-Gm-Message-State: AOJu0YxtJy5WBGKfVGrwrbsOed1/B9vQ2yFgOHc1cCvE62o8bxsDmE3x
	cjGLWgXiUqQqWMynU8UKXzD/1RyS/KhMDZOxcmPI4eskcsJOiOvn794UGU9qOuc=
X-Google-Smtp-Source: AGHT+IHfBM6/97ZL/jz+mDbZXN+ZoyZROPPx8q1R59a4i7BYeDoYLd2VcD04ZDBe3HyHqZcPnwxIkQ==
X-Received: by 2002:a17:906:aec7:b0:a59:affe:b9f with SMTP id a640c23a62f3a-a59fb923376mr157625866b.6.1715171464771;
        Wed, 08 May 2024 05:31:04 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id gz20-20020a170906f2d400b00a5a0c9e16f1sm160306ejb.51.2024.05.08.05.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 05:31:04 -0700 (PDT)
Date: Wed, 8 May 2024 15:31:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] media: bcm2835-unicam: Fix a NULL vs IS_ERR() check
Message-ID: <fbbe7862-2820-44eb-81cb-7f33b99cca35@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The media_pad_remote_pad_unique() function returns error pointers, not
NULL.  Update the check accordingly.

Fixes: 392cd78d495f ("media: bcm2835-unicam: Add support for CCP2/CSI2 camera interface")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/media/platform/broadcom/bcm2835-unicam.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
index 3c7878d8d79b..ad55fc930e5b 100644
--- a/drivers/media/platform/broadcom/bcm2835-unicam.c
+++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
@@ -2433,9 +2433,9 @@ static int unicam_async_bound(struct v4l2_async_notifier *notifier,
 		return ret;
 
 	source = media_pad_remote_pad_unique(sink);
-	if (!source) {
+	if (IS_ERR(source)) {
 		dev_err(unicam->dev, "No connected sensor pad\n");
-		return -ENOTCONN;
+		return PTR_ERR(source);
 	}
 
 	unicam->sensor.subdev = subdev;
-- 
2.43.0


