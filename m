Return-Path: <linux-media+bounces-18649-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DF89876D8
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 17:47:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB3641F277D8
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 15:47:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 402C115B560;
	Thu, 26 Sep 2024 15:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cR3y26/s"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B54157E6B
	for <linux-media@vger.kernel.org>; Thu, 26 Sep 2024 15:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727365609; cv=none; b=olC5Jwmi2mmhhe8MFWmckVOy4/icCE4cHzst2UhcryDsre+gL0LO5jN7+y0F2Unt+N/cASUQbAZnPL2yUhu4dJtK2+w6ZyWXKuqlUyGrvm/NpKitCkRu4/MOJgxfPoInaPi31egBOHE97ithhCqshiPr+iV75Q40iL3ddBwIpAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727365609; c=relaxed/simple;
	bh=9n+eZBcj4PM7sK6+NFZGx6o8ZubV08SdnN4bV1+Fg3I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ECTIBpidZ7zTiY6qqHX3Hhw5zMadNwDJikmt/vCwlXoYQk3wRpKfpKYk04mTMdhowFfN2obM6kgg9CKZ2E0pjSEh4f7PTs6kNWVqQHGLPux8H1D9rkEr1ahSprrHiHdYaKQmcm1V7lnNm1XsUAHO66HPYHRpjma9NafnMdwokEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cR3y26/s; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5c876ed9c93so1188514a12.2
        for <linux-media@vger.kernel.org>; Thu, 26 Sep 2024 08:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727365606; x=1727970406; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X31HSTlCzdVM5leNrm8kaJCkvfeV2FA5CwiaPcRFfvM=;
        b=cR3y26/siPso9htbfSuKjSL4TAzVfwur+0FoIEkPmcr7vY8udMb4q4FgUcGQqk3vQw
         BsIAb73rRvsBfM3pFXr+LhC2wI3IdqO9xcEjWKRmQO3sdJ2ZuF7Y1tT2M73JG7UwwafP
         vnOpSjzLlZzsF/q1DwnElGoiEEbQP5rd0bWBZzO9gW7ip/nuPxbGeKXTWdQYMQ78G8A7
         vh17qBsRN7T88Y2EOfGy7MnxTHOKmcbNNzSJ5KDLOyYza232gMcEFypcH1lYEEpQaBC5
         qmA7h3BaT0XXDzOpNMlVdVBXNmB3kYXSmyFILidw0OuEBo0sKKzBoJ6x9tvNRcYnNH/r
         j99g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727365606; x=1727970406;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X31HSTlCzdVM5leNrm8kaJCkvfeV2FA5CwiaPcRFfvM=;
        b=Szq88YZseejT7xxk/PkyPuFFdF9yrV6LEUgdp6raQFRXtfFjdU+NVFJdjob20u1YVa
         dbOhaZ0/RRx0wMxMF/436jCiAK2Jf2a20+f6K4Yibn66tC65DH48XYoX8HSKhlX/zUX/
         uzOwVFYxUFTSVB4i6qvInhdxk0XIap6A1m2bnkiMWh36xP9v2+f9RMrRzivKnJXBvf2a
         0Guz+zkkY7/oYZH06E9lGnVdaUEiMrTlmIrHh/Oz2ZclIo9qEJKKZdJGsBmJ3DGXd1Zd
         iR+JtDnZcTTjZ+aEvcrxZsG9MraX0AGgez45viXgIGcR7IFi40XCh+4h2+AQHKkLr0rx
         D/pA==
X-Gm-Message-State: AOJu0YxbHHQyQwq2M+p6/CnEvw2WzWs1ef7mcq2W+SkPHYwVOIM+pDc1
	HOQs8H2wckr+rovpWjvvmbiRwo4jmA9Vveqa2FY9IkBUN1cyvAa1rM9US40rjGlnuGsZ/5ML4LP
	UrJk=
X-Google-Smtp-Source: AGHT+IEaBURJfwJKJ3uznZce7fPj92s1+tbcBYO5hFCdQG0lP3re4+t6lCfulzAoLnpHioLQIeypkg==
X-Received: by 2002:a05:6402:4402:b0:5c4:2343:1227 with SMTP id 4fb4d7f45d1cf-5c8824ef51dmr162016a12.5.1727365605957;
        Thu, 26 Sep 2024 08:46:45 -0700 (PDT)
Received: from [127.0.0.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c882405166sm75744a12.9.2024.09.26.08.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 08:46:45 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 26 Sep 2024 16:46:39 +0100
Subject: [PATCH 3/4] media: ov08x40: Rename ext_clk to xvclk
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240926-b4-master-24-11-25-ov08x40-v1-3-e4d5fbd3b58a@linaro.org>
References: <20240926-b4-master-24-11-25-ov08x40-v1-0-e4d5fbd3b58a@linaro.org>
In-Reply-To: <20240926-b4-master-24-11-25-ov08x40-v1-0-e4d5fbd3b58a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1651;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=9n+eZBcj4PM7sK6+NFZGx6o8ZubV08SdnN4bV1+Fg3I=;
 b=owEBbQKS/ZANAwAIASJxO7Ohjcg6AcsmYgBm9YHhelecfaMhp+gW2199dsN/wC6Ur4mnO75hN
 NXFJ2kEuVCJAjMEAAEIAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCZvWB4QAKCRAicTuzoY3I
 OuLZEACh+orTS42ln+5XegAqChpJoiwuhwYX+HkUOOMHmyYav76OoYVkpHhs+1/k48HWKN1IvbS
 UgDe0EyTFhiyH6a/uA9iV5GPY7tyMHOGbNfw6GHWaGtJGsW+eag4tSZgJfRJNZYZ2NMuCNGo52o
 pv0K+URCZfksevR6sOF3IiTF957DWnQ4E5UffAWKmtRef7BQ10/DlLnq/3Axi1fF+QUdX3E4ws6
 8sg/Wc51VJ5ZKUNnQREYyOncc+XcvUVRNvS+82IRVmws4BVQ4b9s6xfp7r9GQs7wMwSyM4mUmCP
 KLKfFJwsiJVd02KrTOBFRqsWuhm+eGALpu9k4/XEJ94KvSfYYQGKoRLLGoEyzIDf2JBLxvqpemT
 0GGn5INirPAN30iPfnnTl2mudkJwci9rYzQ+SFM/190fVtPUGEDfOClVaRI5iY+oTeebRZ6awlU
 xmH/7GRfu3E8YadJvBOH7N2hN+dU4KJI7VjRPJNg+vlD98TE4Po2L9Pt9Wm3EG3dwbCwrHa84Qt
 mkPRvtIgENCLwWcoi4KY/ZSantTuULvrlBUrXj7czlZlUosbYDpIVTgPLmYk3/bQmT5jm4DcYOh
 lGtueek1YqzrXaqTNv0R4SbBIlmOJF5xufTXHvkUntU5qAKmgbwVYEhQeTVs1qVQvtV+4vfnFHQ
 qyuwbEB2a66yP0w==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

The data-sheet and documentation for this part uses the name xvclk not
ext_clk for the input reference clock. Rename the variables and defines in
this driver to align as preparation for adding DT support where the name of
the clock in DT will be "xvclk".

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


