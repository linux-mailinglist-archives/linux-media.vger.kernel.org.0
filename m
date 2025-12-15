Return-Path: <linux-media+bounces-48771-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C93BECBD166
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 10:03:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE5593074CFB
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 08:56:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36DA4331212;
	Mon, 15 Dec 2025 08:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mw7VmyHL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62DA331204
	for <linux-media@vger.kernel.org>; Mon, 15 Dec 2025 08:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765788426; cv=none; b=lEqkmDvdfnYZ0txZz4Wxdxl0U2QcwuZA0XkznPjA1xxu/9taNHmtoBUzJxW3CcATSsYe2ghxEtL7G7hN7hE1dQyFIzIjGPKvstcbyUdKAN9Bh9kQoQ5ywb/0sAiLnHUkd3aQvwtt2EkqC1648kzwMICU5HAzrnqH6uzfWqQf5gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765788426; c=relaxed/simple;
	bh=mVwS9orGrDkR1rQjuQdiwtT0QhicjglNEANLHNFmkU4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q+phVozGBkqiknt4JywZCqjNEXyobfFv2acGY1KIkrCzwBGKU1T1jvbmTZFbK0v5nxxAebh87j4LJo4avXc6KRUU47Malkd50EW9h9Dl00HOqT7YxFm/KzgG/9U54rY4fQJE6cHPvJD754ZxmQvqkBCAE0xV0SaY1XlYxKbel2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mw7VmyHL; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5942b58ac81so2536479e87.2
        for <linux-media@vger.kernel.org>; Mon, 15 Dec 2025 00:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1765788423; x=1766393223; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F9TDS1TYkE2IPp+H/I+ExxvB0t9lFe3o/hFr/kNiIbA=;
        b=mw7VmyHLY+ayuDD6bXty60pBsCfo7YI1DWOeXlDtuFobymM4HV5r8qadrQd8oNEA48
         QeQ8V7LXuTtjxzPKOsXOyaJyFUVHcjkgSBYKbDlHNu8J0HdbCbpCpvxQW6yDfpEVc9Sb
         8IwgqDfh/CWo11h95vvpy6thesONHpQgZyOzg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765788423; x=1766393223;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F9TDS1TYkE2IPp+H/I+ExxvB0t9lFe3o/hFr/kNiIbA=;
        b=laeEyaWkvMMOqIZldM3Aiby2wK7vJTvZU3K3cfYyBibuObNRDVmCDPU/fCfiOLkwyE
         nr1stu5Lz0WHkowtLupjHlz529tPV/GxlqDVYn2zs2LZFwP7tDeyQoy0Q9G4Mhhmozqd
         zl7KzOaLtkEqm3aWjsm0WczNJoOfdeUopyC4viwgg2ZLEeRMLo44PG/jFVPsqNwH5CkD
         6VefznvOp6P2MPulEhVVPGSXtv+l+2wZvKBcBuBPYYJ4HCW9isfse9FM0WMCDj4I6HOR
         lx1HZrANmcF4cRUoN+QH3+5kuGQR6HLr374vZi6YniC76sUvugwOQuA/a5ojCRbdqjxi
         rTxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUI4eBv6BOFeWX7oAMLgTpIH/wgp1zXj0/vl7L66flx4HfogvThJ4hMXvX8gWfNVWUIzRGqGyVcec2iqA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+kBU7cYPFX5fBgl5DtAdEKkPSuBZfqsPDs9e6pu/P7MXMzp6/
	7B5ym3dc3TB/Vun9DLU7gxROjtn0XvmWLw74ISO1Z4h3HP3zS7zn+5VJD4MeXF+T6RA4iTwE9L4
	PmoA=
X-Gm-Gg: AY/fxX5tZ5V01He1OK5/rU2O1Sjvanu9gDvVwS+0g+GQfyd7QrN5tkG2GHTK2KnpvxP
	qQCb1zsrJ4CfIpAkB+9m3j0kLFRSUyXB1bV1jvPAB+zq/l1I4xr83jCB+P6ubRd/VySha1CHCp4
	/6Ye1MRU7LS4bELr9nQOyCZBlQIcpS0xQ/cSFVQQwqtTHbtNYBVtWAzNy2FIw9Tq4edfxjISUi7
	T9CAHphxZaANIFJYJeSjUlALRpYTco6Ck57Bh5KqqYtLsWdV8dRwUU/ZgRRuHNDnmnhlBwd5wZn
	1gPZhkx8rH+uXITWTWSbjo8TywlS2Uxhfj+8ZxXBe1jrRL3QKKVKT56bHDYqN5fPmsgmp2t+aZP
	BVpz1UK0yGjKMXodcmLpnOhuVUDpmcYDyyBVUZeC0yMf1s6vCeDPWDQxgUnLmXXlygLd9otk3gc
	qNF8pRci+YlSFhaC7izLqvBI2BUY277yoe6qAP7dGgl3Wr9Axu
X-Google-Smtp-Source: AGHT+IEyMYtQATBBKOXgDawzqZITbqsNwzh3SW+mIgrf7tjd1Vv5aGavfCfD+dByrbVwQo38GET0PA==
X-Received: by 2002:a05:6512:110e:b0:571:8fad:ecee with SMTP id 2adb3069b0e04-598faa4e13emr3435051e87.21.1765788422612;
        Mon, 15 Dec 2025 00:47:02 -0800 (PST)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-598f2f379c8sm5188260e87.10.2025.12.15.00.47.00
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Dec 2025 00:47:00 -0800 (PST)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5943d20f352so3962436e87.0
        for <linux-media@vger.kernel.org>; Mon, 15 Dec 2025 00:47:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXjIzVDgZ8ikgh8mqYuBE0SmzJlIXlYQ8fQ7DB1gCWJXEZEm5DbSaGHWigcCd3Fq3rP6R06cuW/rg5PeA==@vger.kernel.org
X-Received: by 2002:a05:6512:108c:b0:598:ee6c:12dd with SMTP id
 2adb3069b0e04-598faa9b126mr3308507e87.51.1765788419768; Mon, 15 Dec 2025
 00:46:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251210-dw9174-timing-v1-1-4a5036465727@chromium.org> <023d20e6-23ef-4f64-8ea6-31f973b33c95@oss.qualcomm.com>
In-Reply-To: <023d20e6-23ef-4f64-8ea6-31f973b33c95@oss.qualcomm.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Dec 2025 09:46:46 +0100
X-Gmail-Original-Message-ID: <CANiDSCsiu5E0nmm9dAgMGZ4y26cjwr8XKB1KRu2wZSVgdP-Brw@mail.gmail.com>
X-Gm-Features: AQt7F2r4lu88QeRTULbOhGS9hO4Gi8a_LuCIeFLQGXTFmEr2-Zt5dWHO1BUvnDc
Message-ID: <CANiDSCsiu5E0nmm9dAgMGZ4y26cjwr8XKB1KRu2wZSVgdP-Brw@mail.gmail.com>
Subject: Re: [PATCH] media: dw9714: Fix powerup sequence
To: johannes.goede@oss.qualcomm.com
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Ondrej Jirman <megi@xff.cz>, Hans Verkuil <hverkuil@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	neil.sun@lcfuturecenter.com, naomi.huang@lcfuturecenter.com
Content-Type: text/plain; charset="UTF-8"

Hi Hans

On Wed, 10 Dec 2025 at 09:21, <johannes.goede@oss.qualcomm.com> wrote:
>
> Hi,
>
> On 10-Dec-25 8:53 AM, Ricardo Ribalda wrote:
> > We have experienced seen multiple I2C errors while doing stress test on
> > the module:
> >
> > dw9714 i2c-PRP0001:01: dw9714_vcm_resume I2C failure: -5
> > dw9714 i2c-PRP0001:01: I2C write fail
> >
> > Inspecting the powerup sequence we found that it does not match the
> > documentation at:
> > https://blog.arducam.com/downloads/DW9714A-DONGWOON(Autofocus_motor_manual).pdf
> >
> > """
> > (2) DW9714A requires waiting time of 12ms after power on. During this
> > waiting time, the offset calibration of internal amplifier is
> > operating for minimization of output offset current .
> > """
> >
> > This patch increases the powerup delay to follow the documentation.
> >
> > Fixes: 9d00ccabfbb5 ("media: i2c: dw9714: Fix occasional probe errors")
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>
> Thanks, patch looks good to me:
>
> Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Some tags for the record

Tested-by: Neil Sun <neil.sun@lcfuturecenter.com>
Co-developed-by: Naomi Huang <naomi.huang@lcfuturecenter.com>


>
> Regards,
>
> Hans
>
>
>
>
> > ---
> >  drivers/media/i2c/dw9714.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/i2c/dw9714.c b/drivers/media/i2c/dw9714.c
> > index 1e7ad355a388cfc37253bd764ec8df98f59beeea..3288de539452ebae41daa0988b2d52f27a790da7 100644
> > --- a/drivers/media/i2c/dw9714.c
> > +++ b/drivers/media/i2c/dw9714.c
> > @@ -149,7 +149,7 @@ static int dw9714_power_up(struct dw9714_device *dw9714_dev)
> >
> >       gpiod_set_value_cansleep(dw9714_dev->powerdown_gpio, 0);
> >
> > -     usleep_range(1000, 2000);
> > +     usleep_range(12000, 14000);
> >
> >       return 0;
> >  }
> >
> > ---
> > base-commit: f7231cff1f3ff8259bef02dc4999bc132abf29cf
> > change-id: 20251210-dw9174-timing-9e58903399c9
> >
> > Best regards,
>


-- 
Ricardo Ribalda

