Return-Path: <linux-media+bounces-8058-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C84788F63C
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 05:18:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB8EF292CDE
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 04:18:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A10D3A1AB;
	Thu, 28 Mar 2024 04:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QpBRE/wZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E173987C
	for <linux-media@vger.kernel.org>; Thu, 28 Mar 2024 04:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711599492; cv=none; b=hvwgEIAKtG2m9I812Uht4TurzOSnKgivbDckLXpnvJm6m547AUMg+dW1YliTvnuu9Bx8UNiEpEvfmzwG8xkJBjRJWWA0VaGpC09jLuDlPaHz2tLn18cOlaBbQA+YvWNSGqe3ZOXL6eL3nwG5XOe/trXp6K3qPSVBGOl5kfu8tn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711599492; c=relaxed/simple;
	bh=LZXGUEdocTRUNl7zpI8CwY6eL2HwXaCx3+JpQxdKJaw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I4VE2LZ0b532s03+QWv0VTINXZkr/6rVSKVUMloo1giS4PJP2zcrFH2WuQO/grgl4gfWs6eodpMg0NJToIONWo9xfe7hPz8BMyjc2QgTUwGrMKSNQcu1dN2orXZCs9sH/0Crhl+hSsz3EiLJNCED18IHNTTf26QS5T//uejV1io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QpBRE/wZ; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1def81ee762so1289315ad.0
        for <linux-media@vger.kernel.org>; Wed, 27 Mar 2024 21:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711599485; x=1712204285; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MjDDXcVoKRk0w+c1VX4bOsbop1LT5F7XDyeD03ioWM4=;
        b=QpBRE/wZPqfZNTsEOeQTQZtr5036GCDt5nYDlCfI4Q2xb5DXnwQaKGmookg6kag0Tj
         K9dd5jMho8aAJV6fxWO4roBikk6S8hb/miDHFOOka0r3Akn7f15aHahUmExGcxGZ6hZr
         Gg725dM/HkKmq5ND8BgY2hj6YqcdgjWZnHts8UnaGI7/u8AIW2mbrxZeh4xUIwMjP93X
         K3DyVZmCXq8I27BZxgm0PDvjcooOZ/q1FDvn/hkmZ71/uLpFTUSDzsRBT/cBC5nnqCvM
         EpZEhHK5WD3kU0b4C1ZphpPbZxZ2EAOwL3zb7N17hKu9GgYU/pnJHg+6YcV9C7Is+FqL
         NPTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711599485; x=1712204285;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MjDDXcVoKRk0w+c1VX4bOsbop1LT5F7XDyeD03ioWM4=;
        b=WS/XlUZxylmSQt2tb7iGnrdYXxQkZ9JDwcgVVadLMPC1sAgbwglsBnwD7edjVkjFwO
         yAvLvYZkZjzSxs1EvUil3NFMf7hPsgQZpBI8Whul5DjDZ1Y+18ng8BrMJz5Ic8Q53gVW
         1qbIhd272bhvLsP5JxGlOq4AdXTDsSFFUuiBFsdnvPtGybdUyAQQTmvQcNJhNeARka01
         SO4Zu1bGc3lds55Uh6YRBQeFcr67PFaRyxw1+m3rdGabFlFl2ayvukcFO2eGKT5mUlvy
         gE2pq1P4X4n3p4YukdCJAkgj6AHSKB3PvFyLA9Yh3uSAfPhmmubqArhZnNXw9LahYdgE
         8JeQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0rQVgqdKVMdzIE8afnoi0b1njPQbknxf2UTkPWc1gjszDdNv6Hh86PuW2Lcu9D12vJ8rTblFEPRRH8ZH+SKvpF52gKzHbGeG/5xE=
X-Gm-Message-State: AOJu0Yxnz0SlDH0hxkV28Vxn/M124fl0+6kwq32JWiGlK7BRblZ17HYh
	d+aaxacizZPOkMSFUtBaw2zwmBAhg5/rK/ASGBJlw2bGeJVaqIkYj65UQmg9zSiQzIg5rqaq3rm
	Nr3zP2OE+taE+QkeVWqd6aeaWVA+t+VfoYNA=
X-Google-Smtp-Source: AGHT+IFckLcqFveyLRYzxG/yMJAWtelf1wTbg7HDiBBZx0ZrKEiUtvabmi0RTxfoxNeoeVEZZjDprEcD8U9LwNpB/Qc=
X-Received: by 2002:a17:90b:1bc2:b0:29c:7697:d2dc with SMTP id
 oa2-20020a17090b1bc200b0029c7697d2dcmr1585160pjb.4.1711599484953; Wed, 27 Mar
 2024 21:18:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOMZO5CGzjQPbYznKuLqVi3izMyqF9x7rV7Prmt=s2Z+A66P5g@mail.gmail.com>
 <CAOMZO5Dmj4XuvMeQPZLqPnHw2j=L_42+kDMaS1d-wLd-KCgxzw@mail.gmail.com>
In-Reply-To: <CAOMZO5Dmj4XuvMeQPZLqPnHw2j=L_42+kDMaS1d-wLd-KCgxzw@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 28 Mar 2024 01:17:53 -0300
Message-ID: <CAOMZO5A1A97eNpmXMc6bdhcJBuQZ6fDbpmOrrk+8x3v-Jg87bg@mail.gmail.com>
Subject: Re: ov2680: Fail to probe on imx7s-warp
To: Hans de Goede <hdegoede@redhat.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 28, 2024 at 12:15=E2=80=AFAM Fabio Estevam <festevam@gmail.com>=
 wrote:

> I checked that bus_cfg.nr_of_link_frequencies =3D=3D 0 which causes the
> dev_err_probe().
>
> Is there anything that needs to be adapted in
> arch/arm/boot/dts/nxp/imx/imx7s-warp.dts ?

I had to make the following changes to make ov2680 probe:

diff --git a/arch/arm/boot/dts/nxp/imx/imx7s-warp.dts
b/arch/arm/boot/dts/nxp/imx/imx7s-warp.dts
index ba7231b364bb..7bab113ca6da 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7s-warp.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx7s-warp.dts
@@ -210,6 +210,7 @@ ov2680_to_mipi: endpoint {
                                remote-endpoint =3D <&mipi_from_sensor>;
                                clock-lanes =3D <0>;
                                data-lanes =3D <1>;
+                               link-frequencies =3D /bits/ 64 <330000000>;
                        };
                };
        };
diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index 39d321e2b7f9..cfa77a62b526 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -1125,7 +1125,7 @@ static int ov2680_parse_dt(struct ov2680_dev *sensor)

        for (i =3D 0; i < bus_cfg.nr_of_link_frequencies; i++)
                if (bus_cfg.link_frequencies[i] =3D=3D sensor->link_freq[0]=
)
-                       break;
+                       return 0;

        if (bus_cfg.nr_of_link_frequencies =3D=3D 0 ||
            bus_cfg.nr_of_link_frequencies =3D=3D i) {

