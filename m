Return-Path: <linux-media+bounces-28254-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 968C8A6150A
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 16:35:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D1B597AE5EC
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 15:32:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CD7A2063D0;
	Fri, 14 Mar 2025 15:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KCKUOGSB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C112063C9;
	Fri, 14 Mar 2025 15:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741966218; cv=none; b=uDQNhApkBWOHrwtppi/5atE3Raj3tXsx9tfISa8nqYjMApw+0AEaEtBvAwXzJZ77aZmGimqxnZWLFhNWQguqVO+DT3kQ2wAZYg7CqAUE+2MTeuA2hDVdT4DnWIXaUeClQmzLXMAyTaLRZeemjmbxiEzbxXPan9xYWezKvxdH3nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741966218; c=relaxed/simple;
	bh=5N2u8G6nb3cU5p7Tgm2pr0o+VlSCPNUWeJNIpV8hJ1Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ExZAJNcsJQ4fAIBszwdKEGf3M+AV6Ioc3ZipyXsL8hOywrDx+/ewYfba8Jim73RA9HoijQA6nH/OIDNZ86izdOWdvl/vOQIKxbjLePYOtS4dl8vxhtBY3W36wbCbVXIb1f/Cy/P1D0cOnSaH+/CtHNkI2pwEkREli1tRRzVTMao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KCKUOGSB; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30bae572157so22728581fa.3;
        Fri, 14 Mar 2025 08:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741966213; x=1742571013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bNpMyAE2KOtdYpDUOPGQQ6FLlEA9+rQvOWYfiYfH2DM=;
        b=KCKUOGSB9c8IBiXWr4yDW8VIam7LQBUkfLOjvKJU02KgHCDV63yue2NxR/9DrUSSjz
         fWVlsU6Ao3Kb1EZ4kXJfUyFiAIbAyFebzu2TTdMQi7TZHstI5z1E+dLW33KJ48CD5eLM
         CTx2294z/3VlpwuXH0OMmCZOyBgS+de1X7yN9poKsGL/LrDMzqMC0GtpbpiWtFo8fCqL
         LhH4KNL8uQQsWhUe4xki3TX49sG5WJ+Vq16gXjUHGRYsSidiBuBp/glAuUZ5K4ksCQsK
         m///6XJRzDqLgyMLW4u8nOzXL8IfKL+t3/b3OSa6IPC1bmTKMmcgu4waR28WtugoAwi7
         GCjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741966213; x=1742571013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bNpMyAE2KOtdYpDUOPGQQ6FLlEA9+rQvOWYfiYfH2DM=;
        b=ktMTtRe4FyjW7Iw5QqfvZtqtq9klOid9tk1qsUquhJ9giwrcS8agd3wsNRnm6MhWmK
         x+hgUxNYGtB2XroN4gaZfLB/18zHvPZdrXx9zxoXXlAV5+O2hAvmmsVEqBr2TcIKFFad
         gG3PnBLVHbSEUbHv60gQDatJqgPBfJp43rQ5UCyKH+cu15UqPo0kRO8mf8ROktdBIOi9
         fidk3paUhQok0zlyaXQVn5zSdW4XVfV+UgxV9nPNy3GJTMl3M7wfmKZX/zqqLgl4Qd0V
         lJqe/MGnDwgKPiTgdCmT5Iw8wOps8iti8zwD2vdsvfCqx+b7mAzS4vetBJa6nUg2KLmd
         2HoA==
X-Forwarded-Encrypted: i=1; AJvYcCX3h0XiG64MJLML40NbXqAasQAZF+IH24P4qkKCcXhGNZCFLMteulc6LKafz5wi4O1HtoOKQeOYf9TRLWI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLsM9QFgMq+m+BSMQ59Z8hJmlVBuGg54NTGacTgLA+jCcyPXTL
	RwKyMdjsfxt3k2Q+I5AaGJSdkj2hTWFu4XRYLXHJJko9AVzQutlFcTxJ+QY38aw=
X-Gm-Gg: ASbGncuoAWl02fm+EUU4onP1KtaH77a8Hm0R3H8xoySQTC/5jaj8S9mTDQ4+Rvx6iX+
	4ckcVWQROaesDOYzbHfwEcC0uR4jaPOewV4RqkIAiHjHvfvkkJEQd+KnO2GC6vhmWk+3rjD88PM
	Lihwoiw+DsXmoGywBiBHR2vzBRk3U9AYceUZiImxdoKruibWe1WJkIrOZ9Aifv6OMPkMDFoZMp/
	NW1tsN39AiQSWF/IP0OtvWhJUuL+4daM4q3dqCOxtt+fpvtg9xxmVA7KKvGpGco0YS7u78hkJlw
	fvuioPbbg4tMneoHePGL7KYJcbOlo8f6GFBjYI9W62iMGnnmwbIvxt+gF5MA27H8bFW4
X-Google-Smtp-Source: AGHT+IHFPlWpJwPb3KXLidiQ6UDzni1mwX2TdcWkQTVFuYE2n9zkAzmgPnikFA3MjhpzFumWLUq0Ig==
X-Received: by 2002:a2e:be27:0:b0:30c:177c:9e64 with SMTP id 38308e7fff4ca-30c4a8d975fmr12410391fa.35.1741966212759;
        Fri, 14 Mar 2025 08:30:12 -0700 (PDT)
Received: from skhimich.dev.yadro.com (avpn02.yadro.com. [89.207.88.245])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f0e99f6sm6253581fa.37.2025.03.14.08.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 08:30:12 -0700 (PDT)
From: Sergey Khimich <serghox@gmail.com>
To: linux-media@vger.kernel.org
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	Vladimir Yakovlev <vovchkir@gmail.com>,
	Maksim Turok <turok.m7@gmail.com>
Subject: [PATCH 17/18] media: coda: Use preferred usleep_range than udelay
Date: Fri, 14 Mar 2025 18:29:38 +0300
Message-Id: <20250314152939.2759573-18-serghox@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250314152939.2759573-1-serghox@gmail.com>
References: <20250314152939.2759573-1-serghox@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vladimir Yakovlev <vovchkir@gmail.com>

usleep_range is preferred over udelay.
see Documentation/timers/timers-howto.rst

Co-developed-by: Sergey Khimich <serghox@gmail.com>
Signed-off-by: Sergey Khimich <serghox@gmail.com>
Signed-off-by: Vladimir Yakovlev <vovchkir@gmail.com>
---
 drivers/media/platform/chips-media/coda/coda-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/chips-media/coda/coda-common.c b/drivers/media/platform/chips-media/coda/coda-common.c
index 3782219c8a2b..b73b09b3baf9 100644
--- a/drivers/media/platform/chips-media/coda/coda-common.c
+++ b/drivers/media/platform/chips-media/coda/coda-common.c
@@ -2873,7 +2873,7 @@ static int coda_hw_init(struct coda_dev *dev)
 	data = coda_read(dev, CODA_REG_BIT_CODE_RESET);
 	data |= CODA_REG_RESET_ENABLE;
 	coda_write(dev, data, CODA_REG_BIT_CODE_RESET);
-	udelay(10);
+	usleep_range(10, 20);
 	data &= ~CODA_REG_RESET_ENABLE;
 	coda_write(dev, data, CODA_REG_BIT_CODE_RESET);
 	coda_write(dev, CODA_REG_RUN_ENABLE, CODA_REG_BIT_CODE_RUN);
-- 
2.30.2


