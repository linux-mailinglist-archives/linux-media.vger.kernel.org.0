Return-Path: <linux-media+bounces-9428-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 080E38A5ADC
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 21:38:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B08E51F231CC
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 19:38:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 071C615B967;
	Mon, 15 Apr 2024 19:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lAJYAyUx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A808915A4B5
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 19:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713209680; cv=none; b=lXLVEd0Ua8gHKHUl2hDah1AUypoWGvMeRlsIz677CX7RbdZDwKD+cV1RenkCjNAz/8cduMjc7i9XjRjnkZdelnbAXUomN0oxlELat91P9H4CjfKOno19eO4ikEQ5sJcO+Giy3ZLb/tHKAvR9vkU8OolGjUpyOBG8/7iKqqeNjsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713209680; c=relaxed/simple;
	bh=NnOHj16PJj1bni+SNvuNVuvXN63e8NKQOBdaXLcKwbs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YAx+5/lJIOiIuefprt/oCFnq7+lnGeRT735WXMlHzyoKkkQcIdK2SItfCu8+LjJT5/DNNPHAGLrlsZlav1eKT+eZoM7kq48EdB1VY4smBHCLJWLpHCYFn/ZytlzpoPnIapOvkTLM+mf93wiPoszyA9EAOIlXHHNzmR+DKON10Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lAJYAyUx; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-78d57bd5781so264753885a.3
        for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 12:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209677; x=1713814477; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bek9HrODBg0M3bgnVqO/LKhPssOu/ibs61pEEfKBgdM=;
        b=lAJYAyUxo5riS0FArLbetp4a3tYm8T9UHi0nYdQ/AR5gr+vCiLxqT5bS7dJVJIemeV
         lsZD9YWhn7+XN6Pe9FBG0a74dcIAQLXuyBb6OL1Fiy7RK7zEKtD7OWYoQ6C7GmyAx+P7
         suqS5lmIC46JseRrYQS+4OVk9CDmVXKDHzKVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209677; x=1713814477;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bek9HrODBg0M3bgnVqO/LKhPssOu/ibs61pEEfKBgdM=;
        b=ElnP1ZyigPz8VF8oV9xGZWnI8cmhZuwmLH6oLbNDSr2aYFkEZkS7+JOrl0aN3Thad0
         dRVJYadEBZD+joYLdny65vQq5ov8RPRogFdQ9qyCf3E12zVQbsOe330V8dIRkn/TasaP
         6ImQ5zZk8hbgwb2UTE8UsrR8Jru8GGo9VaRdD53e8hgDtR+94HXE4vMdk9ZxUnIvJQHn
         gZAe+pZc3mVewHKeCNGFHrzpKGKmSD8SaVv6b4rA7v41KvOlxL9Pn/w67pC9qeUc6B2P
         SGtSndZZ/kpCNx/sKBPtOFT7gQeHrQu1C7jMF1nIiqAcIAddvlq6TSqR7fRrySv4MJ99
         ArJg==
X-Gm-Message-State: AOJu0Yzh1sjEnoKkBuXJZDD1/VY2+za40b12Ub3S+t3/OZSmfRUh3kmH
	8H4ABDlF+AAYC8ApbASI1Fr2qsox2EYRLcspnD5XnG5pCenCkmfHqG4KsZbTMg==
X-Google-Smtp-Source: AGHT+IGdkApYbK4mkbCfGsE7agdP/ocKeSLQEP1wZl23ZOICtEnIFWB9MCiZP2rFcKrIOjZRFtHqpA==
X-Received: by 2002:a05:620a:611a:b0:78e:e035:e898 with SMTP id oq26-20020a05620a611a00b0078ee035e898mr4919595qkn.75.1713209676753;
        Mon, 15 Apr 2024 12:34:36 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:34:36 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:26 +0000
Subject: [PATCH 09/35] media: v4l: async: refactor
 v4l2_async_create_ancillary_links
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-9-477afb23728b@chromium.org>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
In-Reply-To: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Hugues Fruchet <hugues.fruchet@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>, 
 Abylay Ospan <aospan@netup.ru>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Dmitry Osipenko <digetx@gmail.com>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Pavel Machek <pavel@ucw.cz>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

Return 0 without checking IS_ERR or PTR_ERR if CONFIG_MEDIA_CONTROLLER
is not enabled.

This makes cocci happier:

drivers/media/v4l2-core/v4l2-async.c:331:23-30: ERROR: PTR_ERR applied after initialization to constant on line 319

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/v4l2-core/v4l2-async.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 4bb073587817..e26a011c89c4 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -316,9 +316,8 @@ v4l2_async_nf_try_all_subdevs(struct v4l2_async_notifier *notifier);
 static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
 					     struct v4l2_subdev *sd)
 {
-	struct media_link *link = NULL;
-
 #if IS_ENABLED(CONFIG_MEDIA_CONTROLLER)
+	struct media_link *link;
 
 	if (sd->entity.function != MEDIA_ENT_F_LENS &&
 	    sd->entity.function != MEDIA_ENT_F_FLASH)
@@ -326,9 +325,10 @@ static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
 
 	link = media_create_ancillary_link(&n->sd->entity, &sd->entity);
 
-#endif
-
 	return IS_ERR(link) ? PTR_ERR(link) : 0;
+#else
+	return 0;
+#endif
 }
 
 static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,

-- 
2.44.0.683.g7961c838ac-goog


