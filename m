Return-Path: <linux-media+bounces-23485-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A48A9F3702
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 18:08:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B4EC188B8E8
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 17:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 337F3204566;
	Mon, 16 Dec 2024 17:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m3/3pEqK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365851B87C4;
	Mon, 16 Dec 2024 17:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734368770; cv=none; b=R78PvKs4+u6gxhcE9p27u50D7W3m9dZ+glKTa/m7syJc7UrGusxD0PC7ZnZGy39Js+NLzscim7Ew9AEhRJ5lHTWGgV4A4lw7HzuqvLAJKOqC6jL4XgF/viTKBLX5rAZXaUhHpNL+sHqFKz7yW155Ig099qLVVqklAso6JXqjJ8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734368770; c=relaxed/simple;
	bh=MAPGnb/rDFCyKmZ9vIMKTvsIFAHxT2Z/QWpxoKCvz0Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EAT1MEvygzdZuXtTaVLWA4TggvPAD3KcYugjGzE3FaF2zI+/ARNir9pesDveDd4+QliuDy8ANTx8dO61AuSknjNcSFzqfY70hm4i+AgRUc34OvDf+uKuO2weCEr5nc5r/p7tx6PyY4YZsEnTiYzYyVF8pkOwCj/vvEUgYorvtF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m3/3pEqK; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6dcdd9a3e54so16673626d6.3;
        Mon, 16 Dec 2024 09:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734368768; x=1734973568; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jSFhnXUL93LSseKbQNDD/2FtEWDaPkw68EjTeRJDoTc=;
        b=m3/3pEqKrRvVPR6TzQ+6xIMRhQqjMapoV6U0wlfh/kiklluHonCnGzq95xOHEawRz9
         yXBL4WI07FS2oFPta7sYjsNFQJS0GCIzlaFIyqRMCzWiPj3iOO9ZMvRGCIBLcsFGpWzJ
         eoLgt7LLb8hgVGZtyp8hETlUbisrkz4JhxUNcDNkXAta+7gi32MTBXo/u5qMgF5GKkCW
         3vhY57GQxHh2zQOQdOJGglmWS6E5WvLVTdbc65ypmpxIUvMBIHg1n6FOpR4Drug27BWI
         YVlG08IqGQtrPkmY/6qRB3kPClOKH5f65Y0a9sKNSWGlzYoUMbHx6Kvoe7a/JncKM4Q9
         UJlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734368768; x=1734973568;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jSFhnXUL93LSseKbQNDD/2FtEWDaPkw68EjTeRJDoTc=;
        b=aqT/zqjI0+/5fRMCiRx0IhhA4wTPHovCns/UGBfUWD1k1hfJqxxFdjnumy0BNBD93s
         K6U3jxyBo/FChSugdLn51+MZ3S/qOWmFbUmtEEBOZp9WxcJkjHu07wr7qIGcCAdRZ/yI
         Vzs6Rluibwe3wuraNYDQgowPuoI2MedKyI2+nPMU1Ij47GtSSZODfxGj6+cSuyCgVW7w
         +FE1aa88qItdaAwvZG3VX8c1nnEmvyAP0An6bKm7YQ6EtvBrZ18BYyeJvbqyDIASp3hY
         ElPgNGm0XPGxQ7RwcrAH69TZEI8CZGueVlbdJdwtxz/qWApGehBeANQ5TMWtYFRpedws
         9Ifg==
X-Forwarded-Encrypted: i=1; AJvYcCU59XHLnQXeZtVJ08W9jN93N2225WXG8TpYMjIDiDsrs7ubUAa/1Rjm8ztBzrxUXFcay5xXEgIb8/re3EY=@vger.kernel.org, AJvYcCUL1ArtUHectDm7Mzn457K3wKXGsC9IewBCJBA7OrBT9HTo8x2F5yQEpHfr7CD10W61XiRyF95hAGUQeT0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJZcRNNc+2VqU63/wdo5EIQPoukEzjOcXcw47AD3vK8yEVWaJh
	J9eUd9ytqw4JKCuke1GNXSF1SezqSoqtVmbUpky2GTO1bMFnHKJ/4F4+s9QVnwueLqXdH+HbsUT
	xYj+edKzrfKiLA1FWiv6ycqb7xAk=
X-Gm-Gg: ASbGncs0SaiFwJCLEmBdEu0Y0IwE1D9VZ0S0r0GIjCV53jcBUwy49HweE8FpO/no7ju
	7oytq63i9QKdn12TN/N+vBX03J2293FlbRblx
X-Google-Smtp-Source: AGHT+IHBoDS11FnEtYORWaxlzaV0A0BY3JNZi3ZxwXrZVmFnolu33hrWl/iZcI7cga2m/PVWBJFxSnt3AzKa+9Hm9UA=
X-Received: by 2002:ad4:5d69:0:b0:6d8:8667:c6c2 with SMTP id
 6a1803df08f44-6dc8ca57574mr273690766d6.18.1734368768068; Mon, 16 Dec 2024
 09:06:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241216154750.1193584-1-laurentiu.palcu@oss.nxp.com>
In-Reply-To: <20241216154750.1193584-1-laurentiu.palcu@oss.nxp.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Mon, 16 Dec 2024 18:05:51 +0100
Message-ID: <CAPybu_2cXu0U=nJnxR+biK1ovXsq+pbcBYVV-C6ZwjWCrtsqzg@mail.gmail.com>
Subject: Re: [PATCH] staging: media: max96712: fix kernel oops when removing module
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"

Hi

You probably want to add:
diff --git a/drivers/staging/media/max96712/max96712.c
b/drivers/staging/media/max96712/max96712.c
index ede02e8c891c..a47f18d57325 100644
--- a/drivers/staging/media/max96712/max96712.c
+++ b/drivers/staging/media/max96712/max96712.c
@@ -418,7 +418,6 @@ static int max96712_probe(struct i2c_client *client)
        priv->info = of_device_get_match_data(&client->dev);

        priv->client = client;
-       i2c_set_clientdata(client, priv);

        priv->regmap = devm_regmap_init_i2c(client, &max96712_i2c_regmap);
        if (IS_ERR(priv->regmap))

That way it will be more difficult to make the same mistake again.

Regards!

