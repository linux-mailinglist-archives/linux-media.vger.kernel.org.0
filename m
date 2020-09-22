Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 215FC2741A7
	for <lists+linux-media@lfdr.de>; Tue, 22 Sep 2020 13:57:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726554AbgIVL5N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Sep 2020 07:57:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:54644 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726509AbgIVL5N (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Sep 2020 07:57:13 -0400
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B967A2388B;
        Tue, 22 Sep 2020 11:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600775833;
        bh=JzX0UWVhsqqZWZ21G01cSXkn5qwSlkYla79J8KYPlOA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=LMsl+4ueGZzXFyO5Chwc5vTZZa34WwHVgdvZtzadg2Iy+hIi3Z04TRi6PZVMboYo1
         NmP9NJsESc/94cQ5lJcUGf7CAKDirJroFWVJdJaNv7s79NKQTz2alpW2WpS/8vCmuz
         /SjrboilA9XMi1Nf07/CU5djf8IZ42RUd9+kAnA0=
Received: by mail-ed1-f52.google.com with SMTP id n13so15822734edo.10;
        Tue, 22 Sep 2020 04:57:12 -0700 (PDT)
X-Gm-Message-State: AOAM530aIAvKBj2JoNQ9iKHk6y70gHGO/8cpVOz7HIuVDjCa0uSPPQ8V
        wKficOFXJlXZ/+Ac5ZujeQOY32f7VqgxSdqjXzg=
X-Google-Smtp-Source: ABdhPJx6F8zoxz3fiIJuJ3HfhDz1x3+14UraYWfnus99n33U49cVmZ47m+VJqi+2Yp3i7enBtwxhxbNwiyUU5fNa52Y=
X-Received: by 2002:a50:e78f:: with SMTP id b15mr3569103edn.104.1600775831336;
 Tue, 22 Sep 2020 04:57:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200921162342.7348-1-krzk@kernel.org> <20200921162342.7348-7-krzk@kernel.org>
 <20200922093726.GN26842@paasikivi.fi.intel.com>
In-Reply-To: <20200922093726.GN26842@paasikivi.fi.intel.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Tue, 22 Sep 2020 13:56:59 +0200
X-Gmail-Original-Message-ID: <CAJKOXPeAyiPHdxBNocNCCsX8c_jM8hpPqRB4crjcOOBOt5MtLQ@mail.gmail.com>
Message-ID: <CAJKOXPeAyiPHdxBNocNCCsX8c_jM8hpPqRB4crjcOOBOt5MtLQ@mail.gmail.com>
Subject: Re: [PATCH 07/25] media: i2c: imx355: silence unused acpi_device_id warning
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Pavel Machek <pavel@ucw.cz>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Shawn Tu <shawnx.tu@intel.com>,
        Ricardo Ribalda <ribalda@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        Wenyou Yang <wenyou.yang@microchip.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Marco Felsch <m.felsch@pengutronix.de>,
        linux-media@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 22 Sep 2020 at 11:37, Sakari Ailus <sakari.ailus@linux.intel.com> w=
rote:
>
> Hi Krzysztof,
>
> Thanks for the patchset!
>
> I believe the I=E6=B6=8E client has been dug up first as we've been deali=
ng with
> I=E6=B6=8E devices all the time, and it's been a pattern. I don't see tha=
t as a
> reason to reject the patches either though, it definitely cleans up the
> drivers.
>
> On Mon, Sep 21, 2020 at 06:23:24PM +0200, Krzysztof Kozlowski wrote:
> > If driver is built without ACPI, the struct acpi_device_id won't be
> > used:
> >
> >   drivers/media/i2c/imx355.c:1836:36: warning:
> >     'imx355_acpi_ids' defined but not used [-Wunused-const-variable=3D]
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > ---
> >  drivers/media/i2c/imx355.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> > index 51245e71b411..8db287251f49 100644
> > --- a/drivers/media/i2c/imx355.c
> > +++ b/drivers/media/i2c/imx355.c
> > @@ -1833,7 +1833,7 @@ static const struct dev_pm_ops imx355_pm_ops =3D =
{
> >       SET_SYSTEM_SLEEP_PM_OPS(imx355_suspend, imx355_resume)
> >  };
> >
> > -static const struct acpi_device_id imx355_acpi_ids[] =3D {
> > +static const struct acpi_device_id imx355_acpi_ids[]__maybe_unused =3D=
 {
>
> A space before __ perhaps?
>
> Albeit this seems to be all, I can address that while applying if that's
> ok.

Yes, there should be a space here. Let me know if I should send v2.

Best regards,
Krzysztof
