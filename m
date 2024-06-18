Return-Path: <linux-media+bounces-13537-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A58F490CB66
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 14:14:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5BE4B1F259F3
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 12:14:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4B16132464;
	Tue, 18 Jun 2024 12:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UJ+rDQ/b"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9D31367;
	Tue, 18 Jun 2024 12:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718712825; cv=none; b=RquXu36MhMe3vu8n58KcuHQr1al85rDN81wmqdiNZDU9AZNXK+lMWd0q/BdGANlGtljwIirZhD49fvIwcbAEUTRQHNVdZ87VkEY/Zz1AELSH23EdaxlJl0YAQ6ReaL0uXU59WFx4FdDxjKlpcEBUY/UVpwZJFwJs/g9YHvQA0Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718712825; c=relaxed/simple;
	bh=zCbh/D8UcUOkLf0l1/eFpQzAdUwpMyUso60BWpn1Ha0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C4GJvJ39IgVDIY76ERh2hvx2iEQy/y8pBDFlupmNiVtaoSS+AgemMOHwG0L0+Tl4FxIbAQ7neDJsHCm9teDJKSvN1n1r9N8cDsyKVlxBp8wH4zUdCYHLfC2ITwEE95yu8AzAWvfnE/xTn4FTHdtD9yp9zwaksHnXGycGo5gtyUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UJ+rDQ/b; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-6e41550ae5bso3923248a12.3;
        Tue, 18 Jun 2024 05:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718712823; x=1719317623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lzWwZ0WI5POwNAjxZ7T9jl0G8U0Jzav8kEKDeMCZmzo=;
        b=UJ+rDQ/bsoEku5CjgpDene8oEOjb1sG+3DRcWtQSNA1w7kMQYpA1FkNADN0wJ48LLx
         35EEbvqhufb/PG6Mn7dh+6Qyd2tsNMgkPJja2Aejmu3J/qHfWVM97GJjC5yJWyD1tq9l
         r5bb5P9vN8igScC9aCaaXpAKL94gLYlscfBs/wu+2utdPuwRI0H34m2ta/DXYwLjlwIR
         oWAw0lM1iyM3AkGrODHATQvz1FObyNjFPB+UdwwuRVXfeG7ptFw05VTqtctVwRdPn/8t
         OYBu9IuJDXWJHuEw2bwatObxglQ7VCbvZJ620u9OgbSuEPaAX7Ah++USNETnWG7G22do
         PVcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718712823; x=1719317623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lzWwZ0WI5POwNAjxZ7T9jl0G8U0Jzav8kEKDeMCZmzo=;
        b=HgHvGK7j2LLURZmjD9idXIeiTshYPmZyk30jzGZg6cYNXrTpp768zaipc3S6r6fUVs
         aNwoxLKdSWpaAFZs4PYXA4XLaAO3AL9GaV5GIXnhf2sdFxtTJENUXcSeoIc9yiQZ+HIw
         wNb3TiS3UZv1q9ZqM22wjGCt57s9gWW7+Kii1ohfRqcV5Z0LjVmxWJmgjYXcSPfiEWc6
         yOxKDJkj5eO3JmZGvU+Jpwa1PuLXFAB0pQB63mHXf+0C93OQNL5LxYsAgOKKRZppkUvx
         9Akw3jGk10C5WcREA1h5uS6vNb316i9htLER3lHQUDAJWKxGw+NWgVvm4jFrcRtvR5Sj
         ZT+A==
X-Forwarded-Encrypted: i=1; AJvYcCWzgW0P/RAgIyUm4ssxI/qzcn97gPCud6Xa5dK1uCYfSVM1RmfNNR8s+hyZeUtL4ISiodjqiVE/ZvOTUv+E2/76Udf27QrUnRZ3FCIRsM89JwBpIGd/SKi59qh3/PYcfeoNqP1a1TfxDyVljr0Abxx9u/7ifP0U48vI4kN9nx/DV0K2ox42
X-Gm-Message-State: AOJu0YyEI0+P9hJAeIuaY0oEDEjl13QNM3XVAiNbJryjCCF3p9FAjRaO
	Qqnw1J9U566f5sv+8ZZPDynoITx8r1b9yHs0YeG6JJFi7DCMWb+g
X-Google-Smtp-Source: AGHT+IHaKclJUc4Efl6Ydywur9YtKqbT47GJJBF4XJ29G0rvH83AABeR7Un9gk3CcGItoYkKQc5fmw==
X-Received: by 2002:a17:902:eb82:b0:1f7:ff:b477 with SMTP id d9443c01a7336-1f8628063cdmr141385545ad.55.1718712823074;
        Tue, 18 Jun 2024 05:13:43 -0700 (PDT)
Received: from localhost.localdomain ([221.220.133.99])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e5ba93sm96576865ad.3.2024.06.18.05.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 05:13:42 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: detlev.casanova@collabora.com
Cc: alchark@gmail.com,
	andy.yan@rock-chips.com,
	conor+dt@kernel.org,
	cristian.ciocaltea@collabora.com,
	devicetree@vger.kernel.org,
	didi.debian@cknow.org,
	dsimic@manjaro.org,
	gregkh@linuxfoundation.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	liujianfeng1994@gmail.com,
	mchehab@kernel.org,
	nicolas@ndufresne.ca,
	robh@kernel.org,
	sebastian.reichel@collabora.com
Subject: Re: [PATCH 1/3] media: rockchip: Introduce the rkvdec2 driver
Date: Tue, 18 Jun 2024 20:13:29 +0800
Message-Id: <20240618121329.79936-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <4116468.VLH7GnMWUR@arisu>
References: <4116468.VLH7GnMWUR@arisu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Detlev,

On Fri, 14 Jun 2024 21:56:27 -0400, Detlev Casanova wrote:
>+		.frmsize = {
>+			.min_width = 16,
>+			.max_width =  65520,
>+			.step_width = 16,
>+			.min_height = 16,
>+			.max_height =  65520,
>+			.step_height = 16,
>+		},

I think the min/max width/height are incorrect. From rockchip's TRM V1.0
Part1 page 374, supported image size is 64x64 to 65472x65472. And my
chromium can't use rkvdec2 because min width/height are set to 16, which
will cause error at here in rkvdec2_h264_validate_sps:
>+	if (width > ctx->coded_fmt.fmt.pix_mp.width ||
>+	    height > ctx->coded_fmt.fmt.pix_mp.height)
>+		return -EINVAL;

width is 16, height is 32 while ctx->coded_fmt.fmt.pix_mp.width and
ctx->coded_fmt.fmt.pix_mp.height are both 16.

After changing them to 64 my chromium can use rkvdec2 to decode h264
videos now.

Anyway many thanks to your amazing work!

Best regards,
Jianfeng

