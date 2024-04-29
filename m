Return-Path: <linux-media+bounces-10347-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E44D98B5CB7
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 17:09:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 113E9B22242
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 15:09:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71EB112A144;
	Mon, 29 Apr 2024 15:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="V00c+L2z"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E660E82863
	for <linux-media@vger.kernel.org>; Mon, 29 Apr 2024 15:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714403105; cv=none; b=mw9SRO6euhFLpE0mScPmVnwU1lqQB8nbu1mwLCaj7tMvpbBO14fw9wCrPIFqYhCReuL/0MQ8Fx+sFOFs8W4stQ1Y7jGCNRxDb/UPODUB/2O20WfFf2HeCdoKc2O2lSOSUoR/mYjihgb2wdrSxyv8gSLXqqXqFVEk51ckKAsDdpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714403105; c=relaxed/simple;
	bh=/GjVSD6SioMDjZElg1Hs94tKxcIDWbAsQoWFdXy84sY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kJ1iKaD+rWC/AgUrioGc/caLUfgpQK4k423cjsMBDYQlwU9TnnwNrl0uO/YiyZilWlvbuvI2iZVklYm2jpVYzMYvh5oyquAZ9+GjWsw4qwCr90N4xWzIJIQ5gHRLtxymzRw+LBrDoBHO1oxQSfxFa2ISNWBBb2Q+17bScsz5CSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=V00c+L2z; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-790c36dcee9so178362085a.2
        for <linux-media@vger.kernel.org>; Mon, 29 Apr 2024 08:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714403100; x=1715007900; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7GlL3qsiOGQC7mYG6gX2GhOJ6HGHUo3zfWR8UxyLbWA=;
        b=V00c+L2zQEVuzp6WFaYMXdv8l/dnzmissiHpJ2/LZnI2UJ/FPPthQc9qEsxT9O9bV8
         p9X7AZdDdxBnCfTNOTzcJOnBknQkVpNdOXifRTtGCI7nlvDXdB2EiC4IpI8kzR5EX6xJ
         LDT8xXle11lSiDwK4NADE/qjE1/LlScntFyNU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403100; x=1715007900;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7GlL3qsiOGQC7mYG6gX2GhOJ6HGHUo3zfWR8UxyLbWA=;
        b=xBORowSCylKkYLge6oZWZoMsE/3nrc7i5925iCFp0jK4p2AVwsxtHDQ8Rrdg/NxiYD
         Smj1D8jOPuWMTVp7jIoI0fab4P+7hga+PromPU36z3mAivuddLbdDFsi14uD38zqGHnK
         SGcZDsqqAcqqnhJtbeE6fNEubJvCTaMoWaIepnW6oHuJlGFK8ksx4+54WMmcQqMwirCC
         dG1MX7D0avfeSx8+eF+IhvWme+YWei1g7RO7OtVNrNycufDT161z4JEnH1KauleCssk5
         TrUIEQCEJUbWbN73aVdUlqpMCpwdAimkwUD6IuXAzOWs0ug+CObyFOIPxdlWi3sTcPNi
         jqSA==
X-Gm-Message-State: AOJu0YwvUNe0VHyd1HgiOGIAtiaPCkRutbVaIal9/4r1r/sjfBlhfFxo
	ENmmBnVzvLeenP/jCWJNjkpNWCgeVoK5JRmJz4UoFFdZ5qRlYmFy7X2uFaUsdg==
X-Google-Smtp-Source: AGHT+IHEbQ6k/spB/F4rjxeKOljXK5qMBOo6nR8m19hLRAfwF8PZ7AqOGD/HUUCFVnU+KrmkTId48g==
X-Received: by 2002:a05:620a:28c5:b0:790:ed33:5b91 with SMTP id l5-20020a05620a28c500b00790ed335b91mr5568169qkp.56.1714403100578;
        Mon, 29 Apr 2024 08:05:00 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id p7-20020a05620a056700b0078d3b9139edsm10568591qkp.97.2024.04.29.08.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 08:05:00 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Apr 2024 15:04:56 +0000
Subject: [PATCH v3 17/26] media: flexcop-usb: Use min macro
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240429-fix-cocci-v3-17-3c4865f5a4b0@chromium.org>
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
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

Simplifies the code.

Found by cocci:
drivers/media/usb/b2c2/flexcop-usb.c:201:8-9: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/b2c2/flexcop-usb.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/usb/b2c2/flexcop-usb.c b/drivers/media/usb/b2c2/flexcop-usb.c
index 43dd3c932a85..90f1aea99dac 100644
--- a/drivers/media/usb/b2c2/flexcop-usb.c
+++ b/drivers/media/usb/b2c2/flexcop-usb.c
@@ -197,10 +197,7 @@ static int flexcop_usb_memory_req(struct flexcop_usb *fc_usb,
 		return -EINVAL;
 	}
 	for (i = 0; i < len;) {
-		pagechunk =
-			wMax < bytes_left_to_read_on_page(addr, len) ?
-				wMax :
-				bytes_left_to_read_on_page(addr, len);
+		pagechunk = min(wMax, bytes_left_to_read_on_page(addr, len));
 		deb_info("%x\n",
 			(addr & V8_MEMORY_PAGE_MASK) |
 				(V8_MEMORY_EXTENDED*extended));

-- 
2.44.0.769.g3c40516874-goog


