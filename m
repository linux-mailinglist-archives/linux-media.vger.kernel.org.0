Return-Path: <linux-media+bounces-51281-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDzbAQfwcGk+awAAu9opvQ
	(envelope-from <linux-media+bounces-51281-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 16:25:59 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D17959261
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 16:25:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4C9A954A6DF
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 15:06:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 719FC4C0413;
	Wed, 21 Jan 2026 14:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="WWXL9uxg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484564C9567
	for <linux-media@vger.kernel.org>; Wed, 21 Jan 2026 14:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769006930; cv=pass; b=pps3ze8oT7r1uv1jE2rauKi6KXmG9eBVYtFY6rLuk1NHldN4D4Snuo4Q3I4alYP+mn6oEDbbyjVcYB/amwrmckvR22S0WeG16X8u7YFUfpHnSXwWGr6Aw50E8PgP0eW4sKyrV3CrKbch22qhcLagxT8WE/YgKpPo+/22aP4dCT4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769006930; c=relaxed/simple;
	bh=kGOcYFguGyKUDU3ZLq0rykTo/Yp5m2qtt+l3U7lP8vo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WSzbHz+JkAb0z7hBuFHeW87U7yDUTpyXVJjOByaGlThFAcDNA1aosD0zm0DTuxsjl32P6EZZhh/mHs5SMUtu2Qn+8E49bHfZAJRYmeQhWHRO8EfyC8lDmzQ8TVfmutoahFVOOcvgJj83ps0GAfZy2tSr5djN5NpIY8JhWQX+q04=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=WWXL9uxg; arc=pass smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-6446d7a8eadso5758495d50.0
        for <linux-media@vger.kernel.org>; Wed, 21 Jan 2026 06:48:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769006926; cv=none;
        d=google.com; s=arc-20240605;
        b=bBhnYFzrJYcs1qgu0cAUbx0yT4NaXVKhamSkCXtOzLgauwJWp38IzMFKXjSYMP2pyc
         7L+O6ZDnaIDXEJLIKW/wjOktmv0gTumpKZJWVJBMQGVoIIBIZATJhJPS7z7GkvilZhbP
         mpOKCqVdCd3sDRmQHEmA1+Y42KQM3BnXZwhcp9W2BH95Zo+wHyBokH2KPtMEGQOIxyRw
         sKJ9IRXlqim0XFqTBYZ64txvN89NvKu+bBz9j/lPHsGeucWrmNh7SP+P7u4dO16Ahzpq
         XPvWGsc8sO1+FRR/QqNgRi8HVD9arOmbInlNcIAUunMPlTlNqpH19xIhjgxinZxUlLPV
         n7dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LBnmyjrUJfEhXmrKAVlpxrQdAmwybl9MQJ9TwDFbRVg=;
        fh=Yhuzsym9fDW+5Ic0cUoQqZovmLRtyNRo0+sdzmRqCw0=;
        b=Fy2H0dR6hkfu/EoaLGnYHLyauyjK4eblWUCzZh6pZa+0Pa659u7AqWfUXhiWDUk0aU
         Adn/K/HFTTomf0JxqoLgThHs5ICwft/SnIQi7XVRAAsed9B1wSPTgR9MxZkp0Kb3Pv03
         HV91a6aTpmtiO1zpIBwbx9fofes1AtLLXB2BzzfjD+3EPvH+Zfwc7FHLl+a9pQkVt3+T
         7s8fECXWKAbDHudsli3dgjlQBqR5xuNF7Gd4kgP28T22P9TUxkDyudHZIYSrcd2V+Ig/
         j4o/mqzQU5McCoJlhb2Ff0XeDmVAvmFqI4zqFsPI8GPhOHxXqwsR4DW9hk7ShEspiL0P
         f5tQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1769006926; x=1769611726; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LBnmyjrUJfEhXmrKAVlpxrQdAmwybl9MQJ9TwDFbRVg=;
        b=WWXL9uxgzSuMTdhi2SKRpfAYEIZiJWkS5gCnKKGMan/HXrq6DECzRA0Atk1hGnaWDu
         ZXMmvj46x6KJ/Flu0Rf/FyZjbmjjH7LThlHh4ZMhhUlNBMv8IQ98jhtS20buDwZpDcVY
         2qYQZqqDUiFfXWHJj3WkznmULsf3QukIfI7xTnSD5MSQILZ1D44kn2CtyhjO4idUdeIO
         /Kchkn1LeteO70gU/o2ZytwVhq7DwfdgSBFhRxrvaNzAIVJU4PDsU4N6W4JQjm3AIZUX
         En3ZvYN3BiEbKsMgWeWLeZVOCWlcavEVlTPkxlGuNdCzGkm8MwPZ1QkGRb4g+cr9PXIz
         l9kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769006926; x=1769611726;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LBnmyjrUJfEhXmrKAVlpxrQdAmwybl9MQJ9TwDFbRVg=;
        b=Fiio2oxWcoyTdage3ax0ms+9TeuKfDa/DjLnHagLR4vShD2uI6kop7tHdUbUo0ame0
         Qtnd2MzIHzvRJldp86o/qVa3jwbiU/W30clKEIZcFm1aAcGkJqejVe5bwx59RottUPVQ
         MTuHvTIQ47LujiVCAwKKsIC/CPYU0KGDCrlh3rAY2rWAwUyinfKHKd1FeOklmnQIKUip
         hhFdIkeR2FQ4/LkXgw5Nk/NXBrcapLn9vWN252MBGN1IITBzVk9OzytMj3L66IAoVY5r
         fCayBWXWPaB4t52WBOnc0wPyyovO09qrr9W/N5le1wGc1if+hGD/XOih/KMAsBuRgnCk
         Qp6A==
X-Gm-Message-State: AOJu0Ywq7h/ORXUPQZODTae5Vwgm/x1WCFoG0xo1KteBqJMWuu7y+FV1
	LeRmgeQk6vMBe137fW6uTwBLpTS6mkS/j7Ui0iKeo1ujJMIYBS5E6uEyOEoG4rzLwD+q1VdfGCG
	cg3mTY2vlmC+cQlQp9xkHxqtQZiIgmomQje6Q6UVV3w==
X-Gm-Gg: AZuq6aKDI+NBUP3gyrxM3wAZvkljZK9T6LP2ZM5demNGlZqaEA0aoRN1R8KuiZE6h1T
	AfS3b3ONqPUx/fKDgI+PLiTyQ5x0saPflwrbNGIoZ6wU9xUe5oFzSWa12FBYisdkgSIDcSa8FGK
	4wDq6Kr+Te2feF8TIF0AtYN2gYH5g5VLPQO1MUm/N27ihxbyOiDg05bit8RPhOe2MGiv2n+9Cjx
	/IO7EnTyqpOTh8YfvpaSrqZmwTct80Ap4PPl9eHjjZVFfsQzcIv7575DiZGNRV8LYzrmWwBStrY
	+NLn3jOw+dXESSo1hcJxdA1v9n4=
X-Received: by 2002:a53:ac82:0:b0:63f:9448:e81 with SMTP id
 956f58d0204a3-6493c8073d3mr4552111d50.39.1769006926131; Wed, 21 Jan 2026
 06:48:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121135324.2256008-1-eagle.alexander923@gmail.com>
In-Reply-To: <20260121135324.2256008-1-eagle.alexander923@gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 21 Jan 2026 14:48:29 +0000
X-Gm-Features: AZwV_QiJvCpeGIewvoGVYAD_eWopr4gudMS3l-4NTYPfv6MCeBdOH2b8GNSYfF8
Message-ID: <CAPY8ntCcQ1S_hBwBANsvuMQJfjfP_xKZaF+_M5vo++-2FZ8kTw@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: imx290: Adjust initialization registers for
 IMX327 sensor
To: Alexander Shiyan <eagle.alexander923@gmail.com>
Cc: linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51281-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[raspberrypi.com,reject];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,mail.gmail.com:mid,raspberrypi.com:dkim]
X-Rspamd-Queue-Id: 3D17959261
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Alexander

On Wed, 21 Jan 2026 at 13:53, Alexander Shiyan
<eagle.alexander923@gmail.com> wrote:
>
> This patch updates the global initialization sequence for the IMX327 sensor
> to match the recommended values from the IMX327LQR-C Rev0.2 datasheet.

Rev 0.2 is dated 2017/05/25.
I have E17Z06B93 dated 2019/03/25 direct from our Sony contact.

> Additionally, hexadecimal literals for registers 0x309e and 0x309f are changed
> to lowercase to maintain consistency with the rest of the driver code.
>
> Fixes: f2055c1d62d6 ("media: i2c: imx290: Register 0x3011 varies between imx327 and imx290")
> Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
> ---
>  drivers/media/i2c/imx290.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index 9eca7f9db97d..da8966f0b243 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -375,10 +375,11 @@ static const struct cci_reg_sequence xclk_regs[][IMX290_NUM_CLK_REGS] = {
>  };
>
>  static const struct cci_reg_sequence imx290_global_init_settings_327[] = {
> -       { CCI_REG8(0x3011), 0x02 },

Change in datasheet rev 0.3. "Correction: Register 3011h setting 0Ah -> 02h"

> -       { CCI_REG8(0x309e), 0x4A },

Not listed in the change log, but highlighted in red as "set to 4Ah"

> -       { CCI_REG8(0x309f), 0x4A },

Ditto.

> -       { CCI_REG8(0x313b), 0x61 },

Change in datasheet rev 0.3. "Correction: Register 313bh setting 41h -> 61h"

So I'm afraid your datasheet is out of date on all of these.

  Dave

> +       { CCI_REG8(0x3011), 0x0a },
> +       { CCI_REG8(0x309e), 0x4a },
> +       { CCI_REG8(0x309f), 0x4a },
> +       { CCI_REG8(0x3128), 0x04 },
> +       { CCI_REG8(0x313b), 0x41 },
>  };
>
>  static const struct cci_reg_sequence imx290_1080p_settings[] = {
> --
> 2.52.0
>

