Return-Path: <linux-media+bounces-21791-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C729D5B29
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 09:42:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABD62283231
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 08:42:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA77E193403;
	Fri, 22 Nov 2024 08:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="fLWB6DLX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f100.google.com (mail-wm1-f100.google.com [209.85.128.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FCF188013
	for <linux-media@vger.kernel.org>; Fri, 22 Nov 2024 08:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732264928; cv=none; b=oj7crthFn9WTzdmmoXjQpbS1szIz9ykd884saUzr5kj5TE1yyG3xqyG308f5ig6ihATmNxL18UiKHugdCI0adNmNtaEKrMpja0vyIYy6x/dWKzL2ljNLZhQ4g9JASYxqDkMDGFYnnHBsG4ib/yyr3t6agP/Djhtfp/bK+8Cnq3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732264928; c=relaxed/simple;
	bh=lbGB7IqyGqRJnbeGbuDSS1RlVZkgBlJN4RI9PK5cJOI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=p/P/eqsgUvzqyWANUapyAw4j+NBzzEjFrapG1qqyErFHtZQmD36iTrCIGhNr9gV8m30osF96DQL0aWwoLsOa4m9GuC4IH9gen0MbXIjG4EG8Ab6LHjkuC5AcF+SpVONs6KBRCq2SdMb2/f0HkOf1PWfugkMNg0uGRfCsm8As95c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=fLWB6DLX; arc=none smtp.client-ip=209.85.128.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wm1-f100.google.com with SMTP id 5b1f17b1804b1-4316a44d1bbso15811085e9.3
        for <linux-media@vger.kernel.org>; Fri, 22 Nov 2024 00:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1732264925; x=1732869725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8nGyAp1GyhYl2oD3HxN0dzLUQsgdlrr/vXHVyJmj6nM=;
        b=fLWB6DLXO7fihsjt9Zuq1RK5T4Opm61IhBJkjHUyMwjJymGzpC6pnAA9E8rn7K395L
         HLEd2xKkHrlNF67pWE/Vqs16Fu0i0WixEPCVbI129wI3COObYjyjSxz2svaMwTJOKDxv
         G/plVqU4It0EllPDPXbG3MDhAbQEWqjSaabiKfUJtobvnbIOGjlRabzAzRBb1oDbYM+I
         diK1ndVVbNd5/yYeCmaHUlj/bvHNEtDhcYnixahh+OMDUMZoIrYEXtpFstqITCfLu/7f
         JdclFWWNAG2ChQGM04tlF+esR7WDyGrR94qYTFMoRj0QQo4dh7iL18JZ7n5g6vy0PT3w
         5Low==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732264925; x=1732869725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8nGyAp1GyhYl2oD3HxN0dzLUQsgdlrr/vXHVyJmj6nM=;
        b=BWqdsudO/fNWCFjUpxFuB3ubvH9J97zqdsJLEdjM4iLfLI+kxWOfAt1o5zerxYVLeo
         bk7gaJeloILIW3m42hgO98hGZP+BUKeH3OwD1AzPPXV4lPnuy8jgSQDoFKEyKBWJA8H/
         lwWO/oxccOPY4csSnfVUfeEt1DJYlp8rqH9Od/qEarNm8pKE0ItaXEejYM3aRLSEYl6Y
         xNl5h54beCjH1ma4AEmMnHLqWZPeRm0fDc77TfFJxVJrDzahS0xAr3rN4v6IY/nccTK/
         WKwlS8lLsCxLIzIiXvdx7iyGe84hKL4mVOvHuJfNA5hqYVH/4m1CNgnDEvoHskIeYn9I
         jzPQ==
X-Gm-Message-State: AOJu0YyE34lngEDGsQdgw2ZsQAHLz08kwfNO+GOH41/a5b5bSLIvDNti
	bjVblT6bUC6rn91ya79p8exHV4ISsOvVFJFS/+6OkWA9nqQPbkLxbC6u5n3ii3aekVP46WKe2/L
	cE0prtWG9qIftAcEKq0WAVqUWeEsoDsGH
X-Gm-Gg: ASbGnctdfJOMjyUX0uMM9/+PmdDdmtSGPAQebHO+3vOQJy5tYTanYVj08sipnwHeqzK
	KLTPXybRcTieSRUtWOpoVlC5OIbbh7U8cLcIR38hAysRSmu7ITuJDyL42PsKqIBpe8sbvU6mawL
	goI1PFK0P6lQU2HBsL5uQxjZje7X+FP6rdVIbcFa8A9aSlsTnUOKLkhU/JbkJBqAi+fnTe2p5Q1
	VgaMuHoE8rNEhaA3HQTvCSl3NBS5KoywDtd9Rxwr/hKGvAg7NYkOrRfTO+tvvptaA==
X-Google-Smtp-Source: AGHT+IGBo4ecTR47OQ69Kg2GI81fRJ/qHdvasgczFr52mJYtJ+jTJ0+xjnYcKX+CiPOYOl/EB0d0tWUhUZ4W
X-Received: by 2002:a05:600c:1c09:b0:42c:bd4d:e8ba with SMTP id 5b1f17b1804b1-433ce4248f6mr14397525e9.8.1732264924627;
        Fri, 22 Nov 2024 00:42:04 -0800 (PST)
Received: from raspberrypi.com ([93.93.133.154])
        by smtp-relay.gmail.com with ESMTPS id 5b1f17b1804b1-433b45d1d3fsm3770515e9.25.2024.11.22.00.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 00:42:04 -0800 (PST)
X-Relaying-Domain: raspberrypi.com
From: Naushir Patuck <naush@raspberrypi.com>
To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>
Cc: linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jacopo.mondi@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Naushir Patuck <naush@raspberrypi.com>
Subject: [PATCH v1 2/5] drivers: media: bcm2835-unicam: Allow setting of unpacked formats
Date: Fri, 22 Nov 2024 08:41:49 +0000
Message-Id: <20241122084152.1841419-3-naush@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241122084152.1841419-1-naush@raspberrypi.com>
References: <20241122084152.1841419-1-naush@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When matching formats via try_fmt/set_fmt ioctls, test for the unpacked
formats as well as packed formats. This allows userland clients setup
unpacking to 16-bits from the 10/12/14-packed CSI2 formats.

Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
---
 drivers/media/platform/broadcom/bcm2835-unicam.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
index 36fb186a0421..d573d4d89881 100644
--- a/drivers/media/platform/broadcom/bcm2835-unicam.c
+++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
@@ -547,7 +547,8 @@ unicam_find_format_by_fourcc(u32 fourcc, u32 pad)
 	}
 
 	for (i = 0; i < num_formats; ++i) {
-		if (formats[i].fourcc == fourcc)
+		if (formats[i].fourcc == fourcc ||
+		    formats[i].unpacked_fourcc == fourcc)
 			return &formats[i];
 	}
 
-- 
2.34.1


