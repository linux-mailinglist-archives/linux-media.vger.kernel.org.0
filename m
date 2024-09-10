Return-Path: <linux-media+bounces-18127-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B21397414F
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 19:56:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DBF31C259FD
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 17:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E6121AB51B;
	Tue, 10 Sep 2024 17:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HNdDo7/6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259221AAE06;
	Tue, 10 Sep 2024 17:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725990871; cv=none; b=pn5zkr1GILO6MM4zRJxaHHLbZigOYV94ozb34AD1DdxCiAjPND0g4+BtFI+xI+SZIiqXv9JZQBJK3Rh1r3oyTVhC1zz3k4XoD7SK7RYFsKuz1uOyu2S7jEnylyLBdgNYlA1EUi6yjvOR3CAM9AoEYwX28wEkIIoQOTZd+Sj6Kl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725990871; c=relaxed/simple;
	bh=GAchrra7cBIPbaolDy57nyAS/mV1eysPmaNOwAM6jH4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SGf1Z4I60WjxjL8al5UPn/IFMWnXEBNhhz18ha+FP2WRimNzVzjsu6ZvneDIijCtNN3SNbfG3y54SPqNFkBF+8p3iG8awwfDMVdqLOXhO+ZTC27/lHxTZPI992CPGKIzqDChXD5Hf5TZXUv+SuXKP0D3xND+f0O4TluZNynw3ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HNdDo7/6; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42cc8782869so5576695e9.2;
        Tue, 10 Sep 2024 10:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725990868; x=1726595668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8eb7BD17LCmNaoJhN3opCdJu2nnbqNIwLCYHoL7PxQA=;
        b=HNdDo7/6ruoO2yElZtbDOzxbWrOVbii/ZHUQmfGJkit7y73fS79IiChydr4wZWCewZ
         LBzICeDJ20U7/hCu9sVGzzDZXPUbDJSwerNcxgd6I468z/iP4W09gCwZIYF2GIrum/9o
         LNiyVByE5pSnaWYacL1gC+1/zAHnU6ltvuSG47/xkFZLyTPbESdffNOJtHV4+5Y01W3V
         xqF7/sDx4IXQwd2MIVScBy7qZc/4H3F4aXhISaSOFoL8HwfqrkFwsYJm8FPiBk2jmE17
         ItlpLbGnKx1kdjuSL2mzjeBFW9vf5k3zRxDB8K+K7hm8Yb7E01o0pTSH7ZmL1bvk4kIJ
         Vyww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725990868; x=1726595668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8eb7BD17LCmNaoJhN3opCdJu2nnbqNIwLCYHoL7PxQA=;
        b=XI4pKAmofUJoW2fT8fzqrybJjKCJhl3YK9RReR/yPbEE5JkHHwZWzIbtHeDY1tIe6U
         ngHFayBI5njirGC6QUBwPaM23VA0WQCDaVPLbboGiymHvlIk9bk2YcWrbbLT9nkIhQZG
         nnWa8Lxl6DnWbJP0lLHmtukPQgcR+AE3y0vzUojCtlHb+wbGoKAF9ZKzEEG8EaXLTAB5
         2myd3X6ejibE1tpOXlSQBeUMwJ0HtNajB/rZQ34A1yOt6Yan0mIOJNe1mrucDVtdHIjz
         eCJONzAwamUKtJzHvJ064qcWyIdUP/RGw1ynsU97jZ6FeC69c03m4Gn8M5WhM5MsASrX
         i6TA==
X-Forwarded-Encrypted: i=1; AJvYcCWIazmy8Pm4UfOiNw4OEpW2xRCelOaOChHqiPENlIRqFxvAy+msXhnTSeuCWpVW04MHRtqvNSv0/LGF0J0=@vger.kernel.org, AJvYcCXLOqxeQoRz96ismJ6KZlE/5W758DfeSL9h2ZFPRTMRA7MrBUBqS/kOq2IYIHdwGa3wVSd0H8RznlUbGhmCIyGam00=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDNWkwktxRFMVPQZ90K6V8O64GFu/YUPHmjVOKFo4J4PwcQg78
	NKUEWFb7tKulHUjx53+6lw4abU/f6EDd3pWbLw+D1iXTIq6L89zR
X-Google-Smtp-Source: AGHT+IFt2YMGh/r3azisUtR7nf0IrOhVuhOOVgrp5AtMbiIlqgL9J5NthytTEKYIOAUxEFeTGqDqog==
X-Received: by 2002:a5d:440a:0:b0:368:3731:1613 with SMTP id ffacd0b85a97d-378b07a5051mr345026f8f.13.1725990868536;
        Tue, 10 Sep 2024 10:54:28 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:94a6:1e64:e5a2:2b2a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37895675c40sm9516562f8f.51.2024.09.10.10.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 10:54:27 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 09/16] media: platform: rzg2l-cru: Remove unused fields from rzg2l_cru_ip_format struct
Date: Tue, 10 Sep 2024 18:53:50 +0100
Message-Id: <20240910175357.229075-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240910175357.229075-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240910175357.229075-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Simplified the `rzg2l_cru_ip_format` struct by removing the unused
`datatype` and `bpp` fields from the structure in `rzg2l-ip.c`.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
index 75c3c4f1d10b..cc297e137f3e 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
@@ -10,12 +10,10 @@
 
 struct rzg2l_cru_ip_format {
 	u32 code;
-	unsigned int datatype;
-	unsigned int bpp;
 };
 
 static const struct rzg2l_cru_ip_format rzg2l_cru_ip_formats[] = {
-	{ .code = MEDIA_BUS_FMT_UYVY8_1X16,	.datatype = 0x1e, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_UYVY8_1X16, },
 };
 
 static const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int code)
-- 
2.34.1


