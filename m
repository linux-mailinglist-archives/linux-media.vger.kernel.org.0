Return-Path: <linux-media+bounces-4242-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C1683E692
	for <lists+linux-media@lfdr.de>; Sat, 27 Jan 2024 00:19:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7270E1C22D45
	for <lists+linux-media@lfdr.de>; Fri, 26 Jan 2024 23:19:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 116106089A;
	Fri, 26 Jan 2024 23:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JWNTWK01"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E8B5C8FD
	for <linux-media@vger.kernel.org>; Fri, 26 Jan 2024 23:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706310976; cv=none; b=JgjX+Ti4uDDnAugCQLtgKenskAKKXdYtvxmEB4z4QSHowXfAc2NhEhs3UttVgjb1M8Zkx5so2VxS7uAlpqP8+iellPYa1LObw5MpgGVWcRbucEGHQJqrK85tYKEEfGVVncI3DJnLWJqtxta8e9njCxRfFUi0C7o+YpZEYNCBTI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706310976; c=relaxed/simple;
	bh=ewPqTDJUBftEDpihVt9+vlqkTpp6AexDsJM1tz2Udmc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TbxRffVgplX4Y2d8LSp7Ve2EfxtuHGFgYs8cUZmEU4971U/GC5ceLQM7EhbVGRE9JMN+kPapwB1lkaCFDNptybB/AktmMIZmbund5tvzdrUHGZJ0b30Ub0ooGqa6vnM8JUdgGle49f9GBwoG89bMusHnUVY6IjDulvebq045O0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JWNTWK01; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7810827e54eso67488685a.2
        for <linux-media@vger.kernel.org>; Fri, 26 Jan 2024 15:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706310972; x=1706915772; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N1vQJsjbXwMoV42WRJ/mwpke5D4/XsDiuadCHfD7OFk=;
        b=JWNTWK01ByKfjwUiUGQiNdDamXdhWY7L5zeve2AmBdi5adosdyPav9ABjY5wB919JL
         MIDpe00vcrCS9vjxPGIZgDAfp0kc3/x3FIc0cZYykEg/Fk0fBX27FiJSNJPfDByqE3TI
         bGBzjeTkBwgm55iQqC3CG+rMIvUg2EloMzO/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706310972; x=1706915772;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N1vQJsjbXwMoV42WRJ/mwpke5D4/XsDiuadCHfD7OFk=;
        b=Ei0eN5MgGukLvC4AufmyYhb1iuX+WseaJ60DJrq2KomKQcSgKwb+YQSyRgXsZQH3Zb
         l4QNUTQZl7kp2AI5jk7lun0TqNSwFmA4FlbGH7EjEmKrdcUBvMGwlelmN8kS+kL48stj
         4HlUQbWO4ZG3N/ck0Y6rEIkYy2j40aspMWri9bUKx+wHXkz2wuVfptCvlcy0bZgEej0O
         PUNu3tZolDGQAykab83FsqAWrQopiFCsoBWW7DF0a6GwoqMhycXtKT90MSuDfIYj1w4t
         5EgYhVkl92Ab+mJuyiyyg89dDxA0ljr1PnqQQ5o08vHfNJlS16GTClgowumCQ5VF7pPp
         UBng==
X-Gm-Message-State: AOJu0YwC/j8atIO52L91pD2gyBpflM+QeVMYAkzOwCmIqrJTyLjhG/QE
	f2gqQQfDjzk5UiQc5ovxWJ0um4cTDpUOfebxk0IRUzoqEAIffVQ0h5zSkNkwdQ==
X-Google-Smtp-Source: AGHT+IFXn0MsvuBZAXCBvS9dkUDMWpYZYCtB32osg432CHr09P1w9jeHvq+JeL7M7GqosemFCv0Elw==
X-Received: by 2002:a05:620a:628e:b0:783:daec:2fb8 with SMTP id ov14-20020a05620a628e00b00783daec2fb8mr553057qkn.13.1706310972372;
        Fri, 26 Jan 2024 15:16:12 -0800 (PST)
Received: from denia.c.googlers.com (240.157.150.34.bc.googleusercontent.com. [34.150.157.240])
        by smtp.gmail.com with ESMTPSA id m4-20020a05620a290400b00783de3ddf5esm507358qkp.70.2024.01.26.15.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 15:16:12 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 26 Jan 2024 23:16:06 +0000
Subject: [PATCH 07/17] media: i2c: adv748: Fix kerneldoc
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-gix-mtk-warnings-v1-7-eed7865fce18@chromium.org>
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

The field is gone, remove the documentation.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/adv748x/adv748x.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/i2c/adv748x/adv748x.h b/drivers/media/i2c/adv748x/adv748x.h
index 6f90f78f58cf..d2b5e722e997 100644
--- a/drivers/media/i2c/adv748x/adv748x.h
+++ b/drivers/media/i2c/adv748x/adv748x.h
@@ -173,7 +173,6 @@ struct adv748x_afe {
  *
  * @endpoints:		parsed device node endpoints for each port
  *
- * @i2c_addresses:	I2C Page addresses
  * @i2c_clients:	I2C clients for the page accesses
  * @regmap:		regmap configuration pages.
  *

-- 
2.43.0.429.g432eaa2c6b-goog


