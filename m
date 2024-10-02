Return-Path: <linux-media+bounces-18999-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E6998D87B
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 16:01:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 838FDB21E60
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 14:01:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 171761D1303;
	Wed,  2 Oct 2024 13:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mxvXlTqx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84501D0E28
	for <linux-media@vger.kernel.org>; Wed,  2 Oct 2024 13:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727877533; cv=none; b=BMhz9u7LuAu6a+px8F76jcWjpaPwqSztBUQ7oQfdjNWFI3ez/W2H4+14jgt4JqwhZ+jvtGPYcIC3h9zTAxye+LwJiiFDjFtoT0XwHl/QBqiNCdDFdLBJyLV69vIUMrbAzIUAqZVYU8JiCstZA50nFcL2OE3bRggZqvz2jvb4ff4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727877533; c=relaxed/simple;
	bh=KuJYhS6BLwFHq2M3BsUApExs70W98G5/TG0tISRMP7Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FwzqEkOxMCGQieshLe8M2L5cWtYG0SWDbYSYNB0ULelmpk5ByeSlPuTvVoU8OzOXip6xf3nthSYnWvZ/fCg6doHVbZ8SYoosnmTzMUGM7eNC7jCoGpuIP1Y/QvdnFw3dn7gOBb/EaanSi+YXDhCa8/c2cp/TB8RBbYZgUAbSyw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mxvXlTqx; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5c896b9b4e0so5111298a12.3
        for <linux-media@vger.kernel.org>; Wed, 02 Oct 2024 06:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727877530; x=1728482330; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wDWnOefZjmiIEjMknhotah0eI13dQMdxoD4kz7zvhSU=;
        b=mxvXlTqx6hxsoqFOhWczaXX5hDbN+NoWGm2Szw1we5jsd3oyLWxEFSoUGqUHma2DxK
         FVWWrRctDJE62zij6U2WWy1wa4lh+JtvXz3I3AmJbrMVKpQttUBK8mE2AAUG4I/9bvdj
         rfCoOtf9B3LB+PTZ8l4OsGNo5ywAeYfG+t0YPJBBq53NlBIdUL2LYlniZAGLbtgAMXHs
         K5Bx/CyeHnlL0WhH1ym4vO62BU4BHY2KnxvX6T5F2L7Bta+7XKF1xI1EofgBYsnLn3bY
         npFFuvz0C/JX9SGGoe7ZO5G27kl4n14k8vh6R1rKLkMPHIhm4f6u34+5yV4wbjztanEu
         GHZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727877530; x=1728482330;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wDWnOefZjmiIEjMknhotah0eI13dQMdxoD4kz7zvhSU=;
        b=C+5JgZ24OT8uH60aaT90Aogq+RM6iDqIm1lkAW3Fzro8zgYQmwQ496Pk5EvljCPLO7
         3VA15+KxwfuIL5g44vnvFefDO2fq1HhPQhBTkcqhjHOZWteJiHpG59whzLs7oaO8SBKX
         dJeE8LGM2U5ZxFfrqPV8mwHHDjRM9scItdP1BcEhK8pfZN6qbdsByhWG+FuzZ7jBxD1C
         q7KlIxfn7ON9upvaxwT5WHHx09loXoGuxxO0mp2vDHoymPvAlvvVzwH4sY4qwsfGbKXX
         ce8GNA9WN1lOJvrsBwQBk6vkVBoqt0GzmFgejHN8AGOdfUfWt/UBC2VYCEug2d7+6y9F
         P4zg==
X-Gm-Message-State: AOJu0YwLsIdUIRrpljduYfHtwMxoFkvIWp7oSSmwoOzbB7ntf9ie1v69
	LTKhPCmKKE38vX/kRADx71j+vyc0puns97CGkr9HcboMaQxzz/QM/9TRbqP26E8=
X-Google-Smtp-Source: AGHT+IGHtKriEtbcWdY7fhEQr2/c7bU25UcFhWZRnYm/e1VoJ+qT/dbOLfn2MvOA0mIj5hp60Zt8hw==
X-Received: by 2002:a05:6402:2789:b0:5c8:8322:b154 with SMTP id 4fb4d7f45d1cf-5c8b192cfc4mr2497340a12.16.1727877530035;
        Wed, 02 Oct 2024 06:58:50 -0700 (PDT)
Received: from [127.0.0.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c882405b19sm7577346a12.11.2024.10.02.06.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 06:58:48 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 02 Oct 2024 14:58:45 +0100
Subject: [PATCH v3 3/4] media: ov08x40: Rename ext_clk to xvclk
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241002-b4-master-24-11-25-ov08x40-v3-3-483bcdcf8886@linaro.org>
References: <20241002-b4-master-24-11-25-ov08x40-v3-0-483bcdcf8886@linaro.org>
In-Reply-To: <20241002-b4-master-24-11-25-ov08x40-v3-0-483bcdcf8886@linaro.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jason Chen <jason.z.chen@intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev-dedf8

The data-sheet and documentation for this part uses the name xvclk not
ext_clk for the input reference clock. Rename the variables and defines in
this driver to align with the data-sheet name.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/i2c/ov08x40.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
index be25e45175b1322145dca428e845242d8fea2698..3ab8b51df157af78fcccc1aaef73aedb2ae759c9 100644
--- a/drivers/media/i2c/ov08x40.c
+++ b/drivers/media/i2c/ov08x40.c
@@ -1215,7 +1215,7 @@ static const char * const ov08x40_test_pattern_menu[] = {
 /* Configurations for supported link frequencies */
 #define OV08X40_LINK_FREQ_400MHZ	400000000ULL
 #define OV08X40_SCLK_96MHZ		96000000ULL
-#define OV08X40_EXT_CLK			19200000
+#define OV08X40_XVCLK			19200000
 #define OV08X40_DATA_LANES		4
 
 /*
@@ -2081,21 +2081,21 @@ static int ov08x40_check_hwcfg(struct device *dev)
 	struct fwnode_handle *fwnode = dev_fwnode(dev);
 	unsigned int i, j;
 	int ret;
-	u32 ext_clk;
+	u32 xvclk_rate;
 
 	if (!fwnode)
 		return -ENXIO;
 
 	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
-				       &ext_clk);
+				       &xvclk_rate);
 	if (ret) {
 		dev_err(dev, "can't get clock frequency");
 		return ret;
 	}
 
-	if (ext_clk != OV08X40_EXT_CLK) {
+	if (xvclk_rate != OV08X40_XVCLK) {
 		dev_err(dev, "external clock %d is not supported",
-			ext_clk);
+			xvclk_rate);
 		return -EINVAL;
 	}
 

-- 
2.46.2


