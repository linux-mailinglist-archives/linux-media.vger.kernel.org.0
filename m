Return-Path: <linux-media+bounces-14678-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A6292872A
	for <lists+linux-media@lfdr.de>; Fri,  5 Jul 2024 12:54:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C26DB284F24
	for <lists+linux-media@lfdr.de>; Fri,  5 Jul 2024 10:54:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12C70149C5E;
	Fri,  5 Jul 2024 10:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KCZluO5A"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0489414830F;
	Fri,  5 Jul 2024 10:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720176836; cv=none; b=J8SzQUn0rreRu/WefHlHjXK8JWCYR0v/5EbAyWxEEvM1uF3SNg7Nqq0mcNDOD1UnHkbCCd2pkiQ5mdkqRAnD9F9R5acbK5HJw+TWA0jLTzmN8QStk7VoJAOapFnCRXJwGuym2RielhjChyvMv/oI4K0abvuCjx3K5eijunjl8qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720176836; c=relaxed/simple;
	bh=2stfKDi4zdLvWSg/XyKFLqH4vN1cPEdc4pHKpXnEJco=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TRvdNZS59nOnYb1LVmQ+Vr8YFkyt8M8drl584kFJ0ArBrG+kHQF5pk6FazT5bSmYX+UVWKmRNQfxS0Nvq6cvZ/mE/DNBjqqpfNluaVAefL532kVMYORsfGw/vZF5e4kAu42soC/LSNveCKqXiTrWOiWHQwcnYpsZuHd2+t2TbVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KCZluO5A; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-57cbc2a2496so1866405a12.0;
        Fri, 05 Jul 2024 03:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720176833; x=1720781633; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fa49I3iE1wQ4SthXXa3RTe18/oZxwxjdSbyZ7Or2N3o=;
        b=KCZluO5AAkj1CudQ0s2CxYdLG8gfS00mX0y0GNwGCPAU4FCC3yXCcot/+NqtyHepBm
         YJJL4Duo8EOdv6G8XqF6guOlPATkPB8oXppTP4niXhcFU6+erP9Vd05KsOpH/4dAl9Sh
         R3gGxn0EbBfdiIOziuMxxlwy5y21c0eCpju371Ao64j7R88tSP2Od9LHvMPL86ot6zLJ
         AUyy1eV2yo7T82GCJRHPZrJuYbLeoX8PvObQJbIf2xE0Dq+2xEz4BCcYljLcMcHKPXEz
         xeoxNtQZ15m45LBV6EGLwuggVpZHK9E/eDvqBQ4y8LXwm2YNW5kQkBW1e4ggrPGp0Wdn
         +zvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720176833; x=1720781633;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fa49I3iE1wQ4SthXXa3RTe18/oZxwxjdSbyZ7Or2N3o=;
        b=EyC9N3BceivqSTyXuKm/H/+6QPx6mAvlbQ1Pq6TKLu/O2PsWTmtQAM83X0Q/2V/0wz
         O2aRSvsbC5XgJXiujlRURJZd1aYpeNXSqbZ7v8a+P2B0Qj0KT74RKfeuakQyPNlF2WFf
         ugsk+4058HK2DU6So+LOXe4q8gx6IFgkLNaY7tx4PlCJ0TSwfrycnTWEirpZ4MbdVqm2
         CX6hUGrmldVSmE99ghcDw/t2onGF9ZEDL19iM+CW3znJjVKGNI9ScqAWHl0E4H4GpLQi
         xgC/JXBXjMwlqdrYKJuWqkFuz0pYyeYGvWQxQMPLld070fzMnljRe5XXcY2kWH+N1/BC
         JM3g==
X-Forwarded-Encrypted: i=1; AJvYcCXGjs2Oqf6jO+Lxd2aT5l9TM0+GH8gDOtELN9pdLEyxn5VTEBBsBo9sV8vDUXbkQc3Yd7oapLEhChWYylhWIgTkgelEjrSoLrM/SP+I
X-Gm-Message-State: AOJu0Yy6ihREpq6XiM2Sbuf4iD4y2CluX03bquU+QRu0jVdTT77LtO3C
	AsyrtVRXMrmAbFOF/PqdeJaOSHez1U+yxGHkvcna6eIF9OxIzSGHuDSi7i5i
X-Google-Smtp-Source: AGHT+IE0Or0HaCZJV2Sl7bbJ0tkXljV6cpf/PiySAqOIlOMK9IhOLdcrJLAgeFlczk3qarrFehBhBA==
X-Received: by 2002:a17:906:1b51:b0:a77:c13c:2170 with SMTP id a640c23a62f3a-a77c13c2275mr198373266b.77.1720176833221;
        Fri, 05 Jul 2024 03:53:53 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72aaf1bbcbsm670756266b.36.2024.07.05.03.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 03:53:52 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 05 Jul 2024 12:53:50 +0200
Subject: [PATCH 1/2] media: i2c: tvp5150: Constify struct regmap_config
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240705-media-const-regmap_config-v1-1-56881442bb30@gmail.com>
References: <20240705-media-const-regmap_config-v1-0-56881442bb30@gmail.com>
In-Reply-To: <20240705-media-const-regmap_config-v1-0-56881442bb30@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720176831; l=781;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=2stfKDi4zdLvWSg/XyKFLqH4vN1cPEdc4pHKpXnEJco=;
 b=c2fFWb7PWWA26Ukmz3bsWMhGOG+jrdensjvPrqXq3Coyl526WnuMF9wAqUZJuQbF4JIjDBjpj
 bb/KcjY4sKHANs7Ulf/gVjTQfrej+SAF3DhRkyP76d2jIwzjk/wlJ7C
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`tvp5150_config` is not modified and can be declared as const to
move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/media/i2c/tvp5150.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
index 64b91aa3c82a..3205ecd60281 100644
--- a/drivers/media/i2c/tvp5150.c
+++ b/drivers/media/i2c/tvp5150.c
@@ -1812,7 +1812,7 @@ static const struct regmap_access_table tvp5150_readable_table = {
 	.n_yes_ranges = ARRAY_SIZE(tvp5150_readable_ranges),
 };
 
-static struct regmap_config tvp5150_config = {
+static const struct regmap_config tvp5150_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
 	.max_register = 0xff,

-- 
2.40.1


