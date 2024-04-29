Return-Path: <linux-media+bounces-10333-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 785038B5C7C
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 17:05:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E63721F244A9
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 15:05:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5164683CA0;
	Mon, 29 Apr 2024 15:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eqQXbsD9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1FA823A8
	for <linux-media@vger.kernel.org>; Mon, 29 Apr 2024 15:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714403088; cv=none; b=YVKGW2vYp1G9J+lkvUkwxird9KBgpl/2LU1D+Ua4+izLYbHjMPvxFUC3J2Yj13BDarN0DXD6RXby9S1/K8K7zeSUodL25nYrF+sH5tGGU9/ZH6+gpmK5BO76e6pGz9z7EPrgDXY+FOOi8pRrbt1xDIWFPzZBoGPqNDzwFnrVocw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714403088; c=relaxed/simple;
	bh=UpkuwpE5lY66Xa4Nn/rujZeYYKiNpRP8DFHIWTreAho=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c9WOiBEzkibSq8mVsqrs5Ta+vdfDBJANnm1b591+mm6lClAZLTyMt50/NipVGV6ZTGTQzmgo0jeTMgvfcG+Y0kQcrYa3yDLhEVq+Y/i3LXHQI09B8wVdBxEV889P3EbJ2BkWq/Y+sQuijc0bUAfSU3K6ngn94mb21YR+u+2zt9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eqQXbsD9; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-78edc0f9636so308012585a.2
        for <linux-media@vger.kernel.org>; Mon, 29 Apr 2024 08:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714403086; x=1715007886; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fm7JWuSLrjUxnTtxzzsVfK/l2tiOhulSLLxdjSxChR4=;
        b=eqQXbsD9uqSZLNNwhn6UATcL3rFHjD8hbgwpvhbrVaponwIUPf+mSFYPbWu+EBY0OL
         3pKiLh+N7//lLCA+w/eM0p//UUGwRxAw0+rSHKb2A8UFaAGYHlU3mnJM9DEBCZbgyGht
         nMCUbD/dbAAnsOuWtIp6gG3w5wMukUsBexM6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403086; x=1715007886;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fm7JWuSLrjUxnTtxzzsVfK/l2tiOhulSLLxdjSxChR4=;
        b=GcM0VtWX+b5InvydAPl9l3oUDmHD0+Zo5Z6OdPnacML0pl8wVTSDgJYOkgF4+Y7+6D
         Un66thYWmtFiru7XWunowXcLr4Jr/UFDvjPr4iiY6VVY+7ESOwC0QYykxqHEnI9fna2U
         1q0NevTEGek2//TyDL7szz20IjxwHErEeAf/U9ch4Qk5qvDbofqF0gDuC0rB5/VOu1Nj
         yVu9VwWHAlotlr1pesAy4s9F5GcGswdAY4KpYhB2tJg/Lv2HCzzKNxaZMn5hEB8YUhq2
         i9zC8AFZXNPfNAudl2+LCLgC3gIa4sjN1mWY3mLscKpg/FXXVDYA3cBf74klXPJKkWAW
         2FXQ==
X-Gm-Message-State: AOJu0YzugF4N3nWeDnjRaCbCBpc4b7J5WFZ7u2/QcS/f/Dx/LyGXLQRq
	3rOL5XLm0vFfPWh0U2WhFBbRB1v4raIj/9fv0CpwUchlzHm11rJLOpff55tW8Q==
X-Google-Smtp-Source: AGHT+IGYSDsYF7fAd+WjRxR8fXXmBkGXpeoZ1JSQ7zAf0MZgzOcQzU6WrlcwakVFv0Bl8su7Ntb5Aw==
X-Received: by 2002:a05:620a:448b:b0:790:f6ba:4976 with SMTP id x11-20020a05620a448b00b00790f6ba4976mr3869599qkp.71.1714403085870;
        Mon, 29 Apr 2024 08:04:45 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id p7-20020a05620a056700b0078d3b9139edsm10568591qkp.97.2024.04.29.08.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 08:04:45 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Apr 2024 15:04:42 +0000
Subject: [PATCH v3 03/26] media: uvcvideo: Refactor iterators
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240429-fix-cocci-v3-3-3c4865f5a4b0@chromium.org>
References: <20240429-fix-cocci-v3-0-3c4865f5a4b0@chromium.org>
In-Reply-To: <20240429-fix-cocci-v3-0-3c4865f5a4b0@chromium.org>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
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
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>
X-Mailer: b4 0.12.4

Avoid using the iterators after the list_for_each() constructs.
This patch should be a NOP, but makes cocci, happier:

drivers/media/usb/uvc/uvc_ctrl.c:1861:44-50: ERROR: invalid reference to the index variable of the iterator on line 1850
drivers/media/usb/uvc/uvc_ctrl.c:2195:17-23: ERROR: invalid reference to the index variable of the iterator on line 2179

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index e59a463c2761..a4a987913430 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1850,16 +1850,18 @@ int __uvc_ctrl_commit(struct uvc_fh *handle, int rollback,
 	list_for_each_entry(entity, &chain->entities, chain) {
 		ret = uvc_ctrl_commit_entity(chain->dev, entity, rollback,
 					     &err_ctrl);
-		if (ret < 0)
+		if (ret < 0) {
+			if (ctrls)
+				ctrls->error_idx =
+					uvc_ctrl_find_ctrl_idx(entity, ctrls,
+							       err_ctrl);
 			goto done;
+		}
 	}
 
 	if (!rollback)
 		uvc_ctrl_send_events(handle, ctrls->controls, ctrls->count);
 done:
-	if (ret < 0 && ctrls)
-		ctrls->error_idx = uvc_ctrl_find_ctrl_idx(entity, ctrls,
-							  err_ctrl);
 	mutex_unlock(&chain->ctrl_mutex);
 	return ret;
 }
@@ -2165,7 +2167,7 @@ static int uvc_ctrl_init_xu_ctrl(struct uvc_device *dev,
 int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
 	struct uvc_xu_control_query *xqry)
 {
-	struct uvc_entity *entity;
+	struct uvc_entity *entity, *iter;
 	struct uvc_control *ctrl;
 	unsigned int i;
 	bool found;
@@ -2175,16 +2177,16 @@ int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
 	int ret;
 
 	/* Find the extension unit. */
-	found = false;
-	list_for_each_entry(entity, &chain->entities, chain) {
-		if (UVC_ENTITY_TYPE(entity) == UVC_VC_EXTENSION_UNIT &&
-		    entity->id == xqry->unit) {
-			found = true;
+	entity = NULL;
+	list_for_each_entry(iter, &chain->entities, chain) {
+		if (UVC_ENTITY_TYPE(iter) == UVC_VC_EXTENSION_UNIT &&
+		    iter->id == xqry->unit) {
+			entity = iter;
 			break;
 		}
 	}
 
-	if (!found) {
+	if (!entity) {
 		uvc_dbg(chain->dev, CONTROL, "Extension unit %u not found\n",
 			xqry->unit);
 		return -ENOENT;

-- 
2.44.0.769.g3c40516874-goog


