Return-Path: <linux-media+bounces-18682-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EDD988228
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 12:03:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A544B1C225DD
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 10:03:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB42D1BC9E2;
	Fri, 27 Sep 2024 10:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gJvvCEZn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4031BB680
	for <linux-media@vger.kernel.org>; Fri, 27 Sep 2024 10:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727431365; cv=none; b=mQTcWUR8NtaJJWWEnurYAWglirL9UsTrxV4WrDw4iJfKWrEeX4ldAPf6F6cx44ePl2KT5bHIf0liF8tPCPnz+gLk8o3qAkZqYokMU6XORIQEY3JJwtR0w+93sECJWu03i/VXrVx6MJAioCRhVDBZLA0NFoCEVgs3/tfYkIIchxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727431365; c=relaxed/simple;
	bh=NzGO/n5w0inQUSk9Mrg2JWrHNdom3NBH7egriAh15og=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z0tpPa/bAOVONeMtCgndb3wEtPLBgAG1m1/55p911pCqgAPeRPsQTfQ8sLKRfw/HxBzfwcD0Fw0+2HnAxv8ormIMytTe03ciNHH+EsJL0s64QIDNbuuGZQUfJByWQdi8jUNJ7TCeqWra4jhUAXYtFJrqkcLGowDCFoP/u7XopxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gJvvCEZn; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-457ce5fda1aso14542421cf.1
        for <linux-media@vger.kernel.org>; Fri, 27 Sep 2024 03:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727431363; x=1728036163; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YwJYpIvOPMah9ocVmXZ/vnejPzGmcFsHFsHmC+ou0no=;
        b=gJvvCEZntTJEMer4VufqglsmJ0gIHevwjXMbdMzjWaVqnt7cWdWKGZkQ8zilkiEIya
         jbzzJIRhD6N6lr/5H/WayIYJAfsou3RmraN0o98BHgstq39xQLtO7XOZZEUrpH2F62KH
         gqaVVTOgKu4D1La8fU19sOqpjfm3Tfl3teFMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727431363; x=1728036163;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YwJYpIvOPMah9ocVmXZ/vnejPzGmcFsHFsHmC+ou0no=;
        b=bs7nLA4qDMYfkK0HNWKuzMtP5leJWiu3Z9hmZQX102nxJDrQJCnJBTgy+aVMmEuhCJ
         lDJyNs2uK48veH6G5iLKifWWb+hxAGKabjQ24WbamCgu1KaMdWTfxPFPEsQlUnR8gp/X
         owaVEmZcWy890GMKZ3X2Tkngdgf3pN/sl0QyjtCbOX16JVn6UPZT/IXLnJRadABB66Kt
         tAkaGZnmaMBKTqwIhusrWIO25eXRYjNtwgudFr55KtSLtOO0SWA+Hx1H4+n+Fkc33HUv
         ZDgNt54jOTAh8eIQ2lyQfTM5/971ul8hiFXlpuDp20LP/9YGijcXtPuzjz9h/+fn1r6T
         czQw==
X-Gm-Message-State: AOJu0YxGqTf4VRTzitmkD6EMKnXFDxMw/kBwxYQkEaSBi9+H8zJUClJx
	hnqHLQWrCjBNMMeiNUjNGOiu+0QeiLCtf4r6Ngj28yl1ZFoPcHO6xCjRKopS8g==
X-Google-Smtp-Source: AGHT+IHIhHVv8+j4NztQAIQhmr+1bNXNkJaWVfqmXRAU1YfyFDkrgQwJlMA6+y72ZjS/zMeolaZGXg==
X-Received: by 2002:a05:622a:1208:b0:456:7fb5:1bdb with SMTP id d75a77b69052e-45c9f0aae7emr47154531cf.0.1727431362859;
        Fri, 27 Sep 2024 03:02:42 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45c9f353f08sm6341091cf.94.2024.09.27.03.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 03:02:41 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 27 Sep 2024 10:02:32 +0000
Subject: [PATCH v2 1/3] media: ti: cal: Use str_up_down()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240927-cocci-6-12-v2-1-1c6ad931959b@chromium.org>
References: <20240927-cocci-6-12-v2-0-1c6ad931959b@chromium.org>
In-Reply-To: <20240927-cocci-6-12-v2-0-1c6ad931959b@chromium.org>
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


