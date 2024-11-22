Return-Path: <linux-media+bounces-21853-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBB19D650B
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 21:46:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C0065B227B7
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 20:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD7D21DF995;
	Fri, 22 Nov 2024 20:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hJOPxT6D"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B152B189BAE;
	Fri, 22 Nov 2024 20:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732308370; cv=none; b=nLCmPOg7yeJlKh8IOhv9bVZ5KF/oKtkDiJmAUJcME7rWHtrrWfEKVZnMWXU3AwRY0HJ/BjA4Oji7AH4lAsLhjjp99JXP5N+wUaccKP9CkjzFfOwAfX8dH8K/g/YtZJcjIMALWOxDmugFcT3q0FLWvEwHHPtW2a08OjOj2KHj13w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732308370; c=relaxed/simple;
	bh=rfLGix8VQmuESlqsseWvC99WsyP4jvOiWI4xbdEeIFg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=q1aQYLJQfD0+OxCuM5L+SuohXXBzS+qFI+kGdnDsQ51t4T0mwpE22yI6lb1dvh98x7nwt2IZ7cGxtfg5ayFweTCWM/yfZ1xB/BdzVbiiGOQlaySQ01JsP2vwpxlY93RkHVE9Yxq6epAnCuD/0Yo2ZrXGM1zSDewtQloigx7smA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hJOPxT6D; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-460c2418e37so16706701cf.0;
        Fri, 22 Nov 2024 12:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732308366; x=1732913166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KdfcoTAixo+mlxOpXRifnZy9GhI+cyrUE3VMtPIwmvg=;
        b=hJOPxT6D/pvZL0guv9MUb0YNONDWlP694kHaF6eX8Mj8HMVoxgHdzJ/5k7czlZIPHp
         410dXfiVVSHEf16+0WSHnFykA4+ip/9i0tQP6okPn/Y7rqGfyQiwaDnlym+hXEjvc0M/
         5nuDDCl/BIy6fA9Rqpd6MNH1s4o7c0SvqVSOIScY+46motmYcTVtipRAymsdtCoA8gZL
         NR+8ZKSRNCdIQgjJYHyWqlvsPB6IiEpj+wrK58EQVfz7YgQRzRI7yGU7ISXyOtOJMen/
         WxunGnKYCaKddUGIgjntz6PIPaEc3A2fSohnRzPOO7Bnpb/+UEFo9N2gUon6xrfK3f2w
         q8aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732308366; x=1732913166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KdfcoTAixo+mlxOpXRifnZy9GhI+cyrUE3VMtPIwmvg=;
        b=qFH+D5RWs9vXWabwrSzM3EaZ+f1Sr+CAnmJA7a7Em4qLC8b0kTnOPGG79eV8XmvgGK
         aT0M8WgvF5W4puGYXXt4gyLRZTLD1MNE2UbF/Hx3fti9V9E6J8meG16R9Osj42fJyCSA
         DcRIWcAAptv0WoHOBQW88AR9v8Uoy58OUeYrhDFKY5vkR36wwPHm0teNJpxaeitiY5k/
         1dF1RLWjTepVpOioOOI4YkliZdaZMyQlHEbMbmXnp6OkXBdHmBxQpdjQufgfYD6NgVAG
         FrUGkbz9pS84BFIj7mH76TNzIpmb+ynscdJDgqxVkP6W/bQ3LQJH+Ruv5BZsBo/VWJYd
         2hHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJnnMeimHomPOBuJm8h2y7KzGKwFk9bqfmqUyi7bfAPO+qomYnlzECYC2gxUIpgIRBvD0/kaoAdRaLoVk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyC23T7NwNrVlTrNf66BHB+M2EFj9pahSKYkhJUW/PTSrMv10fE
	MXVywjxZx6kg5vpgbXdz8DGJqloAq7pa73hT60H/dLY4KqgecAwn
X-Gm-Gg: ASbGncsJVVFFsI3s4CwKbhN8JmsC9WGoV4iEk32A7G6AnmWJhj8X2G0bwtEvRHZLzud
	nl20q1VUalO3XYGqIMVtH3AKtAlw9Fg2H/m8Bov2fLkFEePKxr/j0xqSDWW3IZpfMMyaX83Y4ib
	Rgs1au9QGum23BDbtcRttoRUfZSnQb7fPmSbtH1bHiFNc0ybQ87UrAaoL/MuQLAKb9hVPKQbANU
	p9wFJKZGWW7bX5/dTwr9b6sMO8xFxP5esnIzyNX3itkQ2qUsNvLHYqynagB1VqWl1LSXys6
X-Google-Smtp-Source: AGHT+IEDZRkTO5+DQwSrlRCcw21oaJiFGCJZnGNbrmx62J2fNbuC3IdPrM/AFVV8d9sqgagVOv+RJg==
X-Received: by 2002:ac8:7d92:0:b0:45d:9525:42ff with SMTP id d75a77b69052e-4653d632068mr45585081cf.54.1732308366553;
        Fri, 22 Nov 2024 12:46:06 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4653c3ed111sm16082051cf.20.2024.11.22.12.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 12:46:06 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: mchehab@kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	hverkuil@xs4all.nl,
	u.kleine-koenig@baylibre.com,
	neil.armstrong@linaro.org,
	andrzejtp2010@gmail.com,
	dillon.minfei@gmail.com
Cc: linux-media@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: [PATCH] media: platform: stm32: Add check for clk_enable()
Date: Fri, 22 Nov 2024 20:46:03 +0000
Message-Id: <20241122204603.44419-1-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add check for the return value of clk_enable() to gurantee the success.

Fixes: 002e8f0d5927 ("media: stm32-dma2d: STM32 DMA2D driver")
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
 drivers/media/platform/st/stm32/dma2d/dma2d.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/st/stm32/dma2d/dma2d.c b/drivers/media/platform/st/stm32/dma2d/dma2d.c
index b6c8400fb92d..48fa781aab06 100644
--- a/drivers/media/platform/st/stm32/dma2d/dma2d.c
+++ b/drivers/media/platform/st/stm32/dma2d/dma2d.c
@@ -490,7 +490,8 @@ static void device_run(void *prv)
 	dst->sequence = frm_cap->sequence++;
 	v4l2_m2m_buf_copy_metadata(src, dst, true);
 
-	clk_enable(dev->gate);
+	if (clk_enable(dev->gate))
+		goto end;
 
 	dma2d_config_fg(dev, frm_out,
 			vb2_dma_contig_plane_dma_addr(&src->vb2_buf, 0));
-- 
2.25.1


