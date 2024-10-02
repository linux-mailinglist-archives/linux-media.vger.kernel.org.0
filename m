Return-Path: <linux-media+bounces-19007-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33ECB98E131
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 18:53:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB083281D6A
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 16:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 670DC1D12E5;
	Wed,  2 Oct 2024 16:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HUic4v89"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BB515D1;
	Wed,  2 Oct 2024 16:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727888014; cv=none; b=cSjjOhNk/EmdLeirn2bCB6iouyDkLcJMbBnqxyx2Wcuk8ln0jPXAtxOwD+Vbgd9doLt4NQPqG2POBmqjKMS5BxP9Jz4+y7Yq8oHlT/jXGCJdgQ43nzsqj1cNj2au/SLfSFbKHFd8d83D+XOtye/VfJjRsWyZJNmX6I9b13tlmKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727888014; c=relaxed/simple;
	bh=BcgGB9Mu79kqx8kgObPk+2zkwZYijkuMbFweANzJ1Wc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=hmjLdlAHjs6QdTYGSuR+5kXHDnj5d3I8UDGvkB37mUW0ke8wEyt0jNlpyu7qqkZQ95Glss7EN/gLN4J/iUtJKWdVbR8QExrd33qh+ofQX1ayB9U4Rh6RK0OHphbZ7ZOP/f69kUtufBKi8uVtevpRzuNBabB7vAeIhZCnBKwzb6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HUic4v89; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a90188ae58eso884282066b.1;
        Wed, 02 Oct 2024 09:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727888011; x=1728492811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0VBP9L6F3kRYSxlOYYCVWtu5TEnhbSkBif2w66bb7SE=;
        b=HUic4v89kBeV6CxA0kx2pXndDFIQhsWufSVCr72fFNBUcjQarr14cJutre4FCaZ74v
         61lFaO5mbbv27jb1dEBnHI62i2b0LrJ3GHOY9kjdgsnSQS8K8fTB/8QUW0Mu8jhN+6+J
         gbVBYtJw938Ak0RV3Dz4kohqKZkcWkS6Oqq1iHy84Fl7qHGC/B3apSuyWHe9L5h/EVrh
         TQyI432w27ezROuHSBE2gjBf4E9cmEfWR1bc1Wpb1vagwNp9gczT3P0+Y0pdd1fZS8WI
         1u3eJEto3ay6ZYTMpWkHs+x5joQvUJPQaudITkc6byOf/SzrJMRF8ULmvsQRl/MPn+Ag
         aMyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727888011; x=1728492811;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0VBP9L6F3kRYSxlOYYCVWtu5TEnhbSkBif2w66bb7SE=;
        b=dLRW4FRs+1xQVg7DfKR5r8d758BoCW3uuMeuMXls4R1K5HlXuGzMv7uYS0We5+aGpq
         UH4e6noysT1SBnu80DnU4Epv1pEV0/BiKz9DqQUGFeTOpf6R+4B6Z5UWLIo1OUaCDQBT
         zRUbP3rt57/VKou64UO9NPLZU5nXXraZrMZs1N+vG0QgLCadGcuOEkP8Uevxs96KT7xo
         /SaePJt34pnWUPtWMkVpJvUlJANkfiYuX2vino5uF1Lqx32raXTrvJgkCoSlRTHNWlFN
         XGoVCruSnr+4qWfQK2tEsJj7o1Y0RC+CpYSIzN2inZ0XP/gB8rl4b12L8HgHkt/+6Jcj
         HP8w==
X-Forwarded-Encrypted: i=1; AJvYcCUJIhHHAr90nbLixVmzL+kKRg7fjjQYcABOGizDoLq8hb4IXY9IwU0TInXCL4zBnwC6S0UHC8SzTcQRBOc=@vger.kernel.org, AJvYcCXQcYbvTJ4yhA4pYVZseoBBoKG8MC9BhsX/bhgb9DSoZdFXtIiX0SO9wRRb53RbE1o4J4WHZxA5PrZq5W4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXRndZBMDyEyr/w8mpOlJVoTtz4HVCdJgwRgtj6IMk+bGqXRK2
	1s+7ROFIZvNIu+msSMorq33rAIHVUBjHtK3AVTFGeAnLs9UuSXwc
X-Google-Smtp-Source: AGHT+IE5L14UooItLU+oI/ihR4h2cOWQj5WEt47yXXGonebmU9T3ngYR1dUSxAI9w1XtsT0irJrdtw==
X-Received: by 2002:a17:907:743:b0:a86:8f8f:4761 with SMTP id a640c23a62f3a-a98f8234520mr334256966b.25.1727888011242;
        Wed, 02 Oct 2024 09:53:31 -0700 (PDT)
Received: from localhost (craw-09-b2-v4wan-169726-cust2117.vm24.cable.virginm.net. [92.238.24.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c297bc6fsm879674066b.184.2024.10.02.09.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 09:53:30 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] media: i2c: ds90ub960: Fix missing return check on ub960_rxport_read call
Date: Wed,  2 Oct 2024 17:53:29 +0100
Message-Id: <20241002165329.957739-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The function ub960_rxport_read is being called and afterwards ret is
being checked for any failures, however ret is not being assigned to
the return of the function call. Fix this by assigning ret to the
return of the call which appears to be missing.

Fixes: afe267f2d368 ("media: i2c: add DS90UB960 driver")
Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/media/i2c/ds90ub960.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index ffe5f25f8647..58424d8f72af 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -1286,7 +1286,7 @@ static int ub960_rxport_get_strobe_pos(struct ub960_data *priv,
 
 	clk_delay += v & UB960_IR_RX_ANA_STROBE_SET_CLK_DELAY_MASK;
 
-	ub960_rxport_read(priv, nport, UB960_RR_SFILTER_STS_1, &v);
+	ret = ub960_rxport_read(priv, nport, UB960_RR_SFILTER_STS_1, &v);
 	if (ret)
 		return ret;
 
-- 
2.39.5


