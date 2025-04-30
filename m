Return-Path: <linux-media+bounces-31376-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE96FAA4550
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 10:28:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C44BA7B501A
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 08:27:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEF9721ADB0;
	Wed, 30 Apr 2025 08:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mLXTCk1R"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B2F21A428
	for <linux-media@vger.kernel.org>; Wed, 30 Apr 2025 08:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746001658; cv=none; b=Kkc535nS8u4D2B3msIjsT+236A9ytrwLQN5u4zMOu8+fNuR7bKCa25KEDUo7G+nIoFpdHPcV+sHuKhKBvC+A0TSM6B41ffl4CM9aoZBudO/9RjabeMhIshFTKPkY2k/zPQmtrk3J7qwwtzGB+BUDDppVTNssEJiRy8DvxO4cQ/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746001658; c=relaxed/simple;
	bh=DxHxKhJsfM5IQo4p/BKw2Qv5mxONn1+sIjGNnBfbnCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VYMX1U8eRUAnbt9qxbxPt0AhS06PtQjh8fnUzFjP9X6zAQbwvPQXCjs7Q4npe8XZEkX71GvpTMVbMvNfprYG+rZakwZS+k5MfAXDly/39rTeCqW+hQ1ZJGoRt6VU868VpnHyXXKcBEfmd1vpPI4Po6Dlp64LEQWq1mvRAJOmx10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mLXTCk1R; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cf257158fso39215525e9.2
        for <linux-media@vger.kernel.org>; Wed, 30 Apr 2025 01:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746001654; x=1746606454; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ca2Hq/Lqblr8quUvSQPFNLA2CAIvKIyN9VULJch+1To=;
        b=mLXTCk1R8CZkBSaln/P3982QK+0Aoy+HdQnfMCFydvQ8Ap05PtmX3Q20gXmdtfGhf6
         uygm75QhLs6uFXlk9beQpNjpyYeiiho3rT1IXC3cH31O5NBpLRPZHj/nSHCtzym7prDn
         QvyXQtLbTqb0GwJP/1SYkYFPrPng9zHaW1WdZZWNCDa550QUaVq3UiLdY6ubWWsCnqlj
         xhoQK+GxhEMjqfMdaqzj+iAWS11G0GR25Wrqo3s5qveb9I936IbxKXwIy55grWTZsOuP
         Nap5pDTJyOO4FA2C4g950FCmiCsiJft3F7VeMWEFQP/aI58E6cJR0uRxqT6GoQnTCnQz
         81Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746001654; x=1746606454;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ca2Hq/Lqblr8quUvSQPFNLA2CAIvKIyN9VULJch+1To=;
        b=siOI2+w5G91oOp5r0uZ+IY3j8zQV7we8lp2GdZplbrFg2TuMsHNJ9uPTCQOwNaafIb
         ixfAYp+CQ/BOcBw7l2lu0cluRDbf+WQNe0bIzjwyNlqx8gzpTm7Kt+H1Ref/nZ8k6Vmx
         QzqKdSRHkh7o8mpkIoaziOwQ5ap3lFNfwoUwn9tIA5AsnWFOxm47LNh09ME/IJYOOKC+
         vg/7NmMWMHNael+ISO2BZMN/JH7uAqIqItbQ2E9oWXYghmU2iP7kruJOYHvOqoG+Rktc
         sDH1hiHbcPkbOja9DmRckWDqdVfaHJQ/IirKF/mcTjtSbUOktaKSxzoKE7ZjuqQNGqjF
         DKCA==
X-Forwarded-Encrypted: i=1; AJvYcCVjDLRFukp2Qe6y+8WpSsyZzWUknvu1WJDiBf7J/u45oreRzobl1pxDNW9MYYyMPAMUaK5zxNvw0INKxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb515cNvlgmY+j+Y0VLFYnjmzKroYj6jTnriM82cZVS7aOKY72
	e64yQONBe3XmAP/xmAS0Uh8q+jN2mpLQTtnsBURAub7mnUl9TX7aWvYiAY+9Eo0=
X-Gm-Gg: ASbGncsUMTjiSjIliCY5h4hqDPnZAVoMuqAHs63tQOMr54TrsIfrKv+Sm4UhHC99Q5Y
	x9rfPhNWNMoGDQmdHJodT+whsGTs7BEiZ1j3/daRd/B/tRsKei/PIW+Yjh+dFDhgsM57XodRM73
	wamCDSea/36etG/7d3u6lzCWrejLq27L4O7RndoO85yUSzVM4MkZUB7QrHC3r299ZPEANEa2MJD
	g/cdCflCY+4wVUKUkeq29vjs747hX9iZTNfEYF94V8GL19QkuTOWVOxA41kn+URr8vBEOuhy/R0
	2rPu0iiky1x0F1reO3kjYGsx7AeKsN9wcCDTeQ7g9gGn4A==
X-Google-Smtp-Source: AGHT+IGwdDRTjPXieuwqML9OeOIGuwumXqnwuBaxSQXQnI/omezt1QxDAaH8vN3P12fRW7cmzI1H6w==
X-Received: by 2002:a05:600c:1d8d:b0:440:54ef:dfdc with SMTP id 5b1f17b1804b1-441b2639c36mr13608775e9.8.1746001653963;
        Wed, 30 Apr 2025 01:27:33 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441b2aecc89sm16215325e9.9.2025.04.30.01.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 01:27:33 -0700 (PDT)
Date: Wed, 30 Apr 2025 11:27:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Shravan Chippa <Shravan.Chippa@microchip.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] media: i2c: imx334: uninitialized variable in
 imx334_update_exp_gain()
Message-ID: <ee811e7c6eabc390241e0227f7a26d1eaa7818a1.1746001540.git.dan.carpenter@linaro.org>
References: <cover.1746001540.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1746001540.git.dan.carpenter@linaro.org>

The "ret" variable is not initialized on the success path.  Set it to
zero.

Fixes: 7b19b0fc8ac8 ("media: i2c: imx334: Convert to CCI register access helpers")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/media/i2c/imx334.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
index fc875072f859..846b9928d4e8 100644
--- a/drivers/media/i2c/imx334.c
+++ b/drivers/media/i2c/imx334.c
@@ -536,7 +536,8 @@ static int imx334_update_controls(struct imx334 *imx334,
 static int imx334_update_exp_gain(struct imx334 *imx334, u32 exposure, u32 gain)
 {
 	u32 lpfr, shutter;
-	int ret, ret_hold;
+	int ret_hold;
+	int ret = 0;
 
 	lpfr = imx334->vblank + imx334->cur_mode->height;
 	shutter = lpfr - exposure;
-- 
2.47.2


