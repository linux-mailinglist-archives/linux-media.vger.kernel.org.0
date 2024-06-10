Return-Path: <linux-media+bounces-12813-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF32901CA6
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 10:14:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4671FB2409D
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 08:14:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55C557E11E;
	Mon, 10 Jun 2024 08:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DG5jNo7q"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3677CF18;
	Mon, 10 Jun 2024 08:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718007050; cv=none; b=CVxpYyua5VDZnzCBQbH4oBIpaZfM6QSnZQIkSZU0Pcbk/j/SumtBAEHgTp5rakuwxDS6oyE2NOxfH7KtiFaOX+68S2Wvn+o+PzRJC6N6YqM5rVCaUNTymVs5sfAbJx9WLCc29oguJgjTPWlTYjryuD4SZ84MVNzT1/7nueLGprY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718007050; c=relaxed/simple;
	bh=FPYgt0uQnuu9rVeb6mqAkHHMzyf72rmBAdsSkxeGWyg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=npI1pxb99UkAzjJx3eyjXpb+bTSK3ihuzqrX2eH/0cUB1ZU2B4RTqVxW8l4R8fnHeoFzjPMQv98apj5i+h+YtxsCD0GtUaoF5dedsMe8bLkcpYqZkOUZb9M02DL4iJiSGsL9TuTn5hxzdZXf+xOjRcGkK8wFnb8h/OqGh5/OrKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DG5jNo7q; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42178999284so15499845e9.0;
        Mon, 10 Jun 2024 01:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718007047; x=1718611847; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rQDBi3oYV+NYdF5KcjHpsbF8q4F5N4Z3vnTslnJR8BM=;
        b=DG5jNo7qpsQZi2a9v2ErUkLuysKp+u0Do1u+DuhIN+DcKwEkIcshTJs5z2dPYphSQK
         Ao6lTMvuVJEWZaxmFzLIOMMrmZGU2RrBYlAWbnH4541+A96nzfxH6SoXRoha0AF1itN6
         5DlghpPti4Ewmn/WVXCRQQrnFmIbVhyXZnafoSHJrVimUSr7AXgWfarzjE0oBP7Y2PyB
         a0uUguqW3Jqo7mKhMSWI0bW0vnFg5zX+cdAfVXeX+gxsu3EBkvhzbLEJuZYsIouRazS2
         ZVJdVC6vMrxk/g+dvmyOvYCgu137ZO9H/i0k+sz3woUo4T22ZVDBu+cTBJbyYSCnw2Cu
         MxPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718007047; x=1718611847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rQDBi3oYV+NYdF5KcjHpsbF8q4F5N4Z3vnTslnJR8BM=;
        b=NSILX5Or8Y5MeiwOnoWb4XKv8Dzim6iUAZ+sNPoxAS+E8pDGocwUsEwjEzuUqsw5oS
         ZVCLNUOf3bdUyRyUuoadp+Ly+O5hRwjC69ZIkxOjuOcoEZ3LtuG5Vtbk9kSqcMhAE33K
         cRbBvIWQddmECprFqW3U7mt3szTWAXVOFa4TMyuiXAc4qvFeTjHokycHriLOP2nfTX6P
         any01acDiCH7XiJzZgjZd8mbtHQe/9qaHzSHv7lJZJTHNsB+NEBi2nwrtrOXnAgTybin
         dC3Eh8LiL1oT6dBEzzRssf+VSYnlwBO4pKoXZAYg4ibRjl3rafYXQAol4I9YPibP5d94
         dsfw==
X-Forwarded-Encrypted: i=1; AJvYcCXXEoyZplb/ArjWwOKyTZJpsK7cSxw3yYW8ZHkTkFgK7HzQC7Tm/pWa5+ftP4ZVQHK1jm/xyLGpmwkOjpR3R0zPyP6z3RUdj5cHkJ63CqQbnPrNYIHpSsyOpzbXMbzGGdpSno7Qz2StxsTQP67YZMEaIC5E2g0uSvRAu72LtsSZLPk=
X-Gm-Message-State: AOJu0YxpUePGxHEByRuANoX/D+0DU7GgrfjDLvNXq0TvcqAeGz6tSCo3
	R90cK0bXn1ghundoPFzPjggtxM8T09zqqm2zTpnyXnziVO9sF6WDHut+FA==
X-Google-Smtp-Source: AGHT+IGQI3Yy+38G5bokS7IeW8adF4Lqb0x/W1g6fUDN5Dr1XGIwhCaj6AP2pGGIw5rbe8aTXI8W9g==
X-Received: by 2002:a05:600c:3d09:b0:41a:c86e:a4db with SMTP id 5b1f17b1804b1-421649fbd32mr69331535e9.9.1718007047580;
        Mon, 10 Jun 2024 01:10:47 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation.station (net-188-217-58-5.cust.vodafonedsl.it. [188.217.58.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421e91c47b4sm18021315e9.35.2024.06.10.01.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 01:10:47 -0700 (PDT)
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: 
Cc: linuxfancy@googlegroups.com,
	sakari.ailus@linux.intel.com,
	martin.hecht@avnet.eu,
	tomm.merciai@gmail.com,
	michael.roeder@avnet.eu,
	stable@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] media: i2c: alvium: Move V4L2_CID_GAIN to V4L2_CID_ANALOG_GAIN
Date: Mon, 10 Jun 2024 10:10:34 +0200
Message-Id: <20240610081034.1195523-6-tomm.merciai@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240610081034.1195523-1-tomm.merciai@gmail.com>
References: <20240610081034.1195523-1-tomm.merciai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Into alvium cameras REG_BCRM_GAIN_RW control the analog gain.
Let's use the right V4L2_CID_ANALOGUE_GAIN ctrl.

Fixes: 0a7af872915e ("media: i2c: Add support for alvium camera")
Cc: stable@vger.kernel.org
Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
---
Changes since v1:
 - Added Cc and Fixes tags as suggested by SAilus

 drivers/media/i2c/alvium-csi2.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/alvium-csi2.c b/drivers/media/i2c/alvium-csi2.c
index c27c6fcaede4..5ddfd3dcb188 100644
--- a/drivers/media/i2c/alvium-csi2.c
+++ b/drivers/media/i2c/alvium-csi2.c
@@ -1998,7 +1998,7 @@ static int alvium_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
 	int val;
 
 	switch (ctrl->id) {
-	case V4L2_CID_GAIN:
+	case V4L2_CID_ANALOGUE_GAIN:
 		val = alvium_get_gain(alvium);
 		if (val < 0)
 			return val;
@@ -2030,7 +2030,7 @@ static int alvium_s_ctrl(struct v4l2_ctrl *ctrl)
 		return 0;
 
 	switch (ctrl->id) {
-	case V4L2_CID_GAIN:
+	case V4L2_CID_ANALOGUE_GAIN:
 		ret = alvium_set_ctrl_gain(alvium, ctrl->val);
 		break;
 	case V4L2_CID_AUTOGAIN:
@@ -2159,7 +2159,7 @@ static int alvium_ctrl_init(struct alvium_dev *alvium)
 
 	if (alvium->avail_ft.gain) {
 		ctrls->gain = v4l2_ctrl_new_std(hdl, ops,
-						V4L2_CID_GAIN,
+						V4L2_CID_ANALOGUE_GAIN,
 						alvium->min_gain,
 						alvium->max_gain,
 						alvium->inc_gain,
-- 
2.34.1


