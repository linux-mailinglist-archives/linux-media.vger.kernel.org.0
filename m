Return-Path: <linux-media+bounces-23872-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A989F923C
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 13:30:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26F3418948C6
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 12:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E4A620B80F;
	Fri, 20 Dec 2024 12:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SJJl4vUu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6F720B215
	for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 12:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734697850; cv=none; b=ts9C4i6fFp9i110o+/pvP++tr8EpG007Qxfss6E1m7msrEOX5PnEoI/jbILdqF6LnaWTih/B2UbOffDOG3w1cVYzIJvtpapSnjwyfVs7lQZSN4UAhRo4PL2bh5owayT/pn7o3yq3ha29H0/fVpq4BldV1ecycp1f4dk8n8r6anY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734697850; c=relaxed/simple;
	bh=5GoKaHXFkZSf2WXLLfxMlIjwXjXAXdvIYWhn9gb0oD4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BWiThbDjcTXRIUzP9jgUE/TJXpHM8bQM1OK+t7ubaIrKuSHx5BdPFvT25wQ4QcQZ6mZwOoYTXZVp0eEVrRtabp4t1McmAGrCbk45cGD8m3IpKAxALnTHFlGy0W6c1ghfzGViK9o3J2diCVwRaf9Psox6LuhX6bKnCp9QZ3aPBzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SJJl4vUu; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-85bc7d126b2so743182241.1
        for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 04:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734697847; x=1735302647; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s0IOwCFNZGsqTJxycNzweooFEfIMBOF/hZUBnYi18TU=;
        b=SJJl4vUuWyinS1O4nKhhHj9K1lT+GXpn6x1Ly0CN04xSD/5A9T8v+0E6T1rVQ2bSay
         oOVZlpZwG1hqOF/4s9j975AHwGauVtUapA7UT2mbmD+2hYE3RZM/yCVgYRKUOkOd0U65
         2cU6kHRiR/l4ZspBIseJouyuxuU4SwG5KNxdzkJ3xec6RRBBmRa+//BaR5BIgxStwmmJ
         Uc3QvNKaNJ15kOtmPv61zKzOaLW//qBN++rhGwJNzc6PEnt5yOiSYTAtMvZmIJ5waVBb
         EFb8CeZGedZWGX+BIU4fi7w6u1qKYa1ByFokCgTVdHtYhdosfL/hNjqGMJ0fwHvdVmxU
         fTWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734697847; x=1735302647;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s0IOwCFNZGsqTJxycNzweooFEfIMBOF/hZUBnYi18TU=;
        b=GmaNKzwXMEHWz1ib3u2QqXhYQPzziXhncjADkVZk0MGugP5WQAlNZ6EgRzqMjaZl0R
         h8Pbq1K1m/WjyFJtSt7ZHs/W32bFMGotjmRPMv2Mxag5UtKeqHuQImzmkJZYZqz481qO
         SBYROc1cm3DnqaFX9pRtlPlNkRXu5KFvz3AZrAd1Ousjt0gpoIhl7KFek43oLtxPjqNV
         Sdec9TNPFE8GrTBfSi7q35gbr/ZXiNmHiIhVcT5w/muwi54xffgbIVhb26KvxVsEy/lN
         3H0TWpwGPMVqP1NMv/aXD4XzLu0RcfdpzCcUmpeYX+NypLRCl/UcxW5zZ783nirPnIol
         dAgw==
X-Forwarded-Encrypted: i=1; AJvYcCVeexbILHmci8R9weT9JPqDB2vHrqItwcEioThoFMM1x0uGXzI2/e6LnNSyT1UVQvcvy023upyVonZjUg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRbmLolOIBkCZUmtjtnKbMJNC+wryCg0uYQo+6AKAIS2UH42KA
	E88plov06R2IdtPAc7/Ih59PB8Zz+f2LN/sMaPaS9Fpqry4CAn6t4ueU0PZvT2hGFExuc+s2Fto
	cCdrbQQyftTw1EGtkglfqgwfJTApt/g9o
X-Gm-Gg: ASbGncvwPIOxdP74p4MuLCIoOSFFeLp4fiAXSUeVep76ptA1oRDnl05N7PtMKc8Q6t4
	LJVvAQBZLqBmlRBIvM+e4aMK7R6D7kqphRXlPaLkh5a45p265DtJXvqM/Y6Pm2SsmqpM=
X-Google-Smtp-Source: AGHT+IFwjQ+aiJfbEqGdr+MA/7F6HVUiqIPYp+B/Y4Yg1DbhSM40D/a15nkAib+pSTIBl3h3jeRuMwSSxlJHADqxHrE=
X-Received: by 2002:a05:6122:2398:b0:515:d032:796b with SMTP id
 71dfb90a1353d-51b75d5caddmr2207955e0c.11.1734697847348; Fri, 20 Dec 2024
 04:30:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241128152338.4583-1-hdegoede@redhat.com> <20241128152338.4583-4-hdegoede@redhat.com>
 <CAPybu_3dbFxTd3GF+_dfwEnVtmUiZsZ+bsyPqh9+G4m+nHHkxA@mail.gmail.com> <3affc3c5-8c40-44b9-9350-7f7c4876cda9@redhat.com>
In-Reply-To: <3affc3c5-8c40-44b9-9350-7f7c4876cda9@redhat.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Fri, 20 Dec 2024 13:30:29 +0100
Message-ID: <CAPybu_1aH76UHTrsOohiLVTx-x1RXP+q=FpbMXYUTdVV0tqhvw@mail.gmail.com>
Subject: Re: [PATCH 3/4] media: ov2740: Add powerdown GPIO support
To: Hans de Goede <hdegoede@redhat.com>
Cc: Tianshu Qiu <tian.shu.qiu@intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 20, 2024 at 12:35=E2=80=AFPM Hans de Goede <hdegoede@redhat.com=
> wrote:
>
> Hi,
>
> On 28-Nov-24 5:53 PM, Ricardo Ribalda Delgado wrote:
> > On Thu, Nov 28, 2024 at 4:24=E2=80=AFPM Hans de Goede <hdegoede@redhat.=
com> wrote:
> >>
> >> The ov2740 sensor has both reset and power_down inputs according to
> >> the datasheet one or the other should always be tied to DOVDD but on
> >> some designs both are attached to GPIOs.
> >>
> >> Add support for controlling both a reset and a powerdown GPIO.
> >>
> >> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >
> > Acked-by: Ricardo Ribalda <ribalda@chromium.org>
> >
> > Same question as before :)
>
> I assume that with this you mean if a call to v4l2_ctrl_handler_free()
> is necessary on errors ?

I actually meant if we needed to change a dt binding... but Sakari
already clarified that this is an acpi only driver.

Thanks!

>
> That is not necessary in this case because the getting of the
> GPIO is done before ov2740_init_controls().
>
> Regards,
>
> Hans
>
>
> >
> >> ---
> >>  drivers/media/i2c/ov2740.c | 15 +++++++++++++--
> >>  1 file changed, 13 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
> >> index 998e1977978d..14d0a0588cc2 100644
> >> --- a/drivers/media/i2c/ov2740.c
> >> +++ b/drivers/media/i2c/ov2740.c
> >> @@ -525,6 +525,7 @@ struct ov2740 {
> >>
> >>         /* GPIOs, clocks */
> >>         struct gpio_desc *reset_gpio;
> >> +       struct gpio_desc *powerdown_gpio;
> >>         struct clk *clk;
> >>
> >>         /* Current mode */
> >> @@ -1306,6 +1307,7 @@ static int ov2740_suspend(struct device *dev)
> >>         struct ov2740 *ov2740 =3D to_ov2740(sd);
> >>
> >>         gpiod_set_value_cansleep(ov2740->reset_gpio, 1);
> >> +       gpiod_set_value_cansleep(ov2740->powerdown_gpio, 1);
> >>         clk_disable_unprepare(ov2740->clk);
> >>         return 0;
> >>  }
> >> @@ -1320,6 +1322,7 @@ static int ov2740_resume(struct device *dev)
> >>         if (ret)
> >>                 return ret;
> >>
> >> +       gpiod_set_value_cansleep(ov2740->powerdown_gpio, 0);
> >>         gpiod_set_value_cansleep(ov2740->reset_gpio, 0);
> >>         msleep(20);
> >>
> >> @@ -1348,9 +1351,17 @@ static int ov2740_probe(struct i2c_client *clie=
nt)
> >>         if (IS_ERR(ov2740->reset_gpio)) {
> >>                 return dev_err_probe(dev, PTR_ERR(ov2740->reset_gpio),
> >>                                      "failed to get reset GPIO\n");
> >> -       } else if (ov2740->reset_gpio) {
> >> +       }
> >> +
> >> +       ov2740->powerdown_gpio =3D devm_gpiod_get_optional(dev, "power=
down", GPIOD_OUT_HIGH);
> >> +       if (IS_ERR(ov2740->powerdown_gpio)) {
> >> +               return dev_err_probe(dev, PTR_ERR(ov2740->powerdown_gp=
io),
> >> +                                    "failed to get powerdown GPIO\n")=
;
> >> +       }
> >> +
> >> +       if (ov2740->reset_gpio || ov2740->powerdown_gpio) {
> >>                 /*
> >> -                * Ensure reset is asserted for at least 20 ms before
> >> +                * Ensure reset/powerdown is asserted for at least 20 =
ms before
> >>                  * ov2740_resume() deasserts it.
> >>                  */
> >>                 msleep(20);
> >> --
> >> 2.47.0
> >>
> >>
> >
> >
>


--=20
Ricardo Ribalda

