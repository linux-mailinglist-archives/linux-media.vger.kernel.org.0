Return-Path: <linux-media+bounces-18683-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FA298822B
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 12:03:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 446F9B22E98
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 10:03:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA1191BCA1E;
	Fri, 27 Sep 2024 10:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="a3tTt5t9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E211BC9EC
	for <linux-media@vger.kernel.org>; Fri, 27 Sep 2024 10:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727431367; cv=none; b=aA5kdvGxQ+VOhfv24xb8XasE2nBWnLfg05czT8PrD0QClvhex9SMKanmVL3AHMuNs8rKyUdqB9MtbqKeQDMZgJwKX2PbHABQFJROtDjsKAIEArkGeenkIBtZsN29NRxKnmbkqBgcQnvK+GI6NcWzwOtVx/Hmvs305Fc0eUFDKtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727431367; c=relaxed/simple;
	bh=PTbEhgOwL2JzDldEWOrtkAWFRntEHE0H3eDBOM54qRY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ff8TFpRJFm8fzOK7XDrdR1nYN9ZQkRoFss1KZqFJq7CQwLec5sgOwQ0zEPZjWd4BVn71P12QElqGnRQuk4iNUoedUmka1VsKjZOcQ07aktN69tWrwW6+jmFdLhkUIQx54i9DrP+OxgnZbpz8MaeXM24K61faKxKkxXFjy2xQQGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=a3tTt5t9; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-45826431d4bso12925941cf.0
        for <linux-media@vger.kernel.org>; Fri, 27 Sep 2024 03:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727431365; x=1728036165; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1m9W940jAO+8Km9/nF0drShVWDtg5UbNpWglt9zOgsU=;
        b=a3tTt5t93SX+WJiy/eM2VdHPItce4H9jkbXH8lUDzqUTAnnEmOVP+qf8HGAUSQ5MOm
         7UxPsLli8cxjMmBsjDQo4dPbofZUl1+Tab/pGF9dyg5TZdhbjSMxCCScakRB6xYXD0Qv
         RKHNpI/72UtW651GohBNPHgrM8pAIYGpfNFtU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727431365; x=1728036165;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1m9W940jAO+8Km9/nF0drShVWDtg5UbNpWglt9zOgsU=;
        b=jq2GWjN3JLXCwUCDyFznkSnuddiqOLwfWi4fqvmBNAacC8Ae1OzN7OUC8/Fq0tA/UI
         DuAKo8k765KBjeuWG5hc1sLBjpTVBq2hLfdyfFMX638IZ23VF+IlaMHMnEc7Pt7w7pTV
         0/Gf5p6F/uf6MUZp6wI4kthvQyTxl2T5rQI/YQR1UZ5tu4EeX664LIufTqCQ1P5+1HJi
         QrvfACo4AIVcOLCswAXVsH8nsCv8NAp1/JnoH0xgjWv0KEejhR8Z4qrEaB1SdEsAlMRu
         pS5Q/N1zcsOkIdt4l1aVoue7tkFf0tqhgPSiZUH/480l2M1hhJ508BLYhAgn1hT7Sbkl
         E7dA==
X-Gm-Message-State: AOJu0Yx/mmL+JZsd8UnqrCG4PY1ho/rhRC42YDGyPhfYVXYhGAWOxK7h
	L6ts0FwWRnza0RMxiYDPjDbWhPK3w/ecyIbVdge82d3XG2shnHQNHCQLrjyrrw==
X-Google-Smtp-Source: AGHT+IH2sKCy00o9ozG8YLnnklYCCyOzAtra00mCyeon7eku4D7Kt0x2E5WOjSuFyndy4gbIgtSOMQ==
X-Received: by 2002:a05:622a:1186:b0:45b:6042:be44 with SMTP id d75a77b69052e-45c9f270f47mr35119611cf.42.1727431364785;
        Fri, 27 Sep 2024 03:02:44 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45c9f353f08sm6341091cf.94.2024.09.27.03.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 03:02:43 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 27 Sep 2024 10:02:33 +0000
Subject: [PATCH v2 2/3] staging: media: ipu3: Use str_down_up()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240927-cocci-6-12-v2-2-1c6ad931959b@chromium.org>
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

The str_down_up() helper simplifies the code and fixes the following cocci
warning:

drivers/staging/media/ipu3/ipu3-css.c:229:18-47: opportunity for str_down_up(state & IMGU_STATE_POWER_DOWN)

Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/ipu3/ipu3-css.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/ipu3/ipu3-css.c b/drivers/staging/media/ipu3/ipu3-css.c
index 1b0a59b78949..bb22375481a0 100644
--- a/drivers/staging/media/ipu3/ipu3-css.c
+++ b/drivers/staging/media/ipu3/ipu3-css.c
@@ -226,7 +226,7 @@ int imgu_css_set_powerup(struct device *dev, void __iomem *base,
 	state = readl(base + IMGU_REG_STATE);
 
 	dev_dbg(dev, "CSS pm_ctrl 0x%x state 0x%x (power %s)\n",
-		pm_ctrl, state, state & IMGU_STATE_POWER_DOWN ? "down" : "up");
+		pm_ctrl, state, str_down_up(state & IMGU_STATE_POWER_DOWN));
 
 	/* Power up CSS using wrapper */
 	if (state & IMGU_STATE_POWER_DOWN) {

-- 
2.46.1.824.gd892dcdcdd-goog


