Return-Path: <linux-media+bounces-4243-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7EF83E696
	for <lists+linux-media@lfdr.de>; Sat, 27 Jan 2024 00:20:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DF56DB23AD8
	for <lists+linux-media@lfdr.de>; Fri, 26 Jan 2024 23:20:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0493160BA1;
	Fri, 26 Jan 2024 23:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ebN2Ltey"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0273F605B6
	for <linux-media@vger.kernel.org>; Fri, 26 Jan 2024 23:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706310977; cv=none; b=k+JVQR5I+96KDGB9Q8GsR27xRf5JVMUnKspb0dIDXm5yyMPO01o1ondrFgiky4eC50ntD8WgcBwHy6uJdId3pOojs72s4ks73euVVDZgZf0+aCidPIOcASWXqHT6+FCQi68uYXnVFMXhRlunDY8aX/63V7/+QednB5+lbNcDNCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706310977; c=relaxed/simple;
	bh=sr2bUuT131x6iX4en7xRFHk6n+uer4hx2b4W4hDRpZs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d7uNQBHJ8N6XBzlrj8wW62pi9dhv4ng6YFbfISEgwdTKyW2vk5o652etbSxuxIYXssTHQU+d+IjtWkT3MCll9FRyUJaoOIcZOQLDx2vnV3S2PBJrme1nqLWIo8GqbC9Z/SHXeJ5UKVmGCG2rmCuIAdiZpDGBI/lqtr6ap/HeXig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ebN2Ltey; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-783da8920e5so52115485a.1
        for <linux-media@vger.kernel.org>; Fri, 26 Jan 2024 15:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706310974; x=1706915774; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qSXVbFoG/exQx3PnGpEWpQQ1t1d8y4UCiwgXQ1/JoHo=;
        b=ebN2Lteyc/tsyq7wDJXyeSbOWlmsAhSitePj9+49yyaRJMFN3uactOHXlToNNREMTN
         +282PwhbdpsMI4H8TPZiohcwCsmzQP1LV2l6wLc+YdKFOR1epZmpVweKcztg4Hmfy92w
         +3AX0eLZVqc76dqZ17T3Rh8zM/zYWy7Bi8XcA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706310974; x=1706915774;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qSXVbFoG/exQx3PnGpEWpQQ1t1d8y4UCiwgXQ1/JoHo=;
        b=LmYDCga/pheWdkmXvHfgU5hhAs0mNMI1R5uMxIYyspExUdE3PVLkdl85M+SKcl8w0U
         dUuBFfcCsbr09OjN0qHgEKqCoEXlogN8aXIPbgDk85mrogSb0GB3LV3T82lr60V+GsHS
         BlaVAkIjqtfL2d54NWKJ9velV1zE0EVw4Kmvd0Cy87GB1sLWcVSmchzVStJaTmh24bXC
         nD88oW67/cpKsr7xJ34C/PBlhnKT/ghZ36iyLQsLNPQgJRlS2sqaPa4lVJmU+duiBCQM
         +d5NsnwXeSfiXAlKg5JXZoimifL7GWnGniRnnhklPatkCj2VLB8DmBhhxj0XXsatM1A9
         TOZQ==
X-Gm-Message-State: AOJu0YyWgYQfyxqFPqI8YZBQtRskqfgzoz+bXEioKCFtoft+EP64P2ky
	z2ckCC5HwaPpACGgAbBBESEZYNm1syGbai0FGqUtTyy3VpfOBJCPhHbsiosiUQ==
X-Google-Smtp-Source: AGHT+IHvS/HbW0NAYrQIsdlvGBtX2lor9Od+LhJ3Cj/UhY6yAa3AiOtgFTNXNbwuU2inqgPn30b9WA==
X-Received: by 2002:a05:620a:12e6:b0:783:89f4:a1a with SMTP id f6-20020a05620a12e600b0078389f40a1amr527242qkl.104.1706310973985;
        Fri, 26 Jan 2024 15:16:13 -0800 (PST)
Received: from denia.c.googlers.com (240.157.150.34.bc.googleusercontent.com. [34.150.157.240])
        by smtp.gmail.com with ESMTPSA id m4-20020a05620a290400b00783de3ddf5esm507358qkp.70.2024.01.26.15.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 15:16:13 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 26 Jan 2024 23:16:07 +0000
Subject: [PATCH 08/17] media: mediatek: jpeg: Fix kerneldoc
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-gix-mtk-warnings-v1-8-eed7865fce18@chromium.org>
References: <20240126-gix-mtk-warnings-v1-0-eed7865fce18@chromium.org>
In-Reply-To: <20240126-gix-mtk-warnings-v1-0-eed7865fce18@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Hans Verkuil <hverkuil@xs4all.nl>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Bin Liu <bin.liu@mediatek.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Bingbu Cao <bingbu.cao@intel.com>, 
 Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-amlogic@lists.infradead.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.3

The field is gone, remove the documentation for it.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
index 8ba6e757e11a..8877eb39e807 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
@@ -144,7 +144,6 @@ struct mtk_jpegdec_clk {
  * @jpegenc_irq:	jpeg encode irq num
  * @job_timeout_work:	encode timeout workqueue
  * @hw_param:		jpeg encode hw parameters
- * @hw_rdy:		record hw ready
  * @hw_state:		record hw state
  * @hw_lock:		spinlock protecting the hw device resource
  */

-- 
2.43.0.429.g432eaa2c6b-goog


