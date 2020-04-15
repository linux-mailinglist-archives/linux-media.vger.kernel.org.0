Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 947471A9635
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 10:24:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2635859AbgDOIW1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Apr 2020 04:22:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2635838AbgDOIWY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Apr 2020 04:22:24 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDB4DC061A0C;
        Wed, 15 Apr 2020 01:22:23 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id j26so2366882ots.0;
        Wed, 15 Apr 2020 01:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+67TCrACUD9zDUJbGXArHsTbyK7Mst4Egam/hxynLWY=;
        b=Jq2ISqAY8J7Ev1/qPHJ1/kQeT7S2BjyniFelda4qeMmOfq5gskvwDrsH5Ku3kXHC+2
         TphxKw7+XTGaMhEE07B3UMD/zA4BLjF9pR0qTFn3AzSpk+2n3ycdlVxln9A0VYNaiagU
         d0+NDag1Q1x79FdQYE1frfOOSTodk3mpTL2jXHhLmsUXXs782W4Ec8OhP9r2g0VkWl3n
         wJmXu6xMWE5ICtvtUVU1ibUKq1mnKkTwklzUWm7MuWm2NjTzmp91xONM8CCogbWPu2Dn
         9GrbuVM0kgdmezgixXiWhksxdT6Fg8ob0yHwrEun6t6nMRvy0oJnoN/n4b1+MmflJ3cp
         rikA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+67TCrACUD9zDUJbGXArHsTbyK7Mst4Egam/hxynLWY=;
        b=qNie6ekP/3GTnsieSP6hqsopwUXYMCzxw5dTMo1eDknH2yP3qw5eSvSdB/XaS8QpDA
         Nbs3LnAZcW7UqJk/UnX7pcf2UfVrM1TpMKRu40GalsHOqJ0T05Z4cWqFLl4DylBsoWfH
         ukJan8mFdfMlIflLYVZX9m9W/gaMRab8MAEOP27NqviJqLKBPp1no/sx1BRhlt5+/kzo
         mQDqYnq9QL7MbOn1QWOUmvu8rr7eYYIFFGxQRWlFbp5Z5YIUc69ZFBS5y2m6hd5l9zLN
         jlMJBkMCUrjQhK6GnOq7PclShUydpKZsJI66sUFFnADWmTy4z7uPdmmj7tn5ZcLCbGqF
         w5/Q==
X-Gm-Message-State: AGi0Pubr3HtKvYb91HS1wzrGMdYV8alKUzhJtJBigQ/vSHUCPMSEsgJ0
        5a/pBCXzoS6oobs7lRCCszwFU3nrrZdvYhRLzNI671PnPNE=
X-Google-Smtp-Source: APiQypLcJpWPeZzLof6T51BAXAYl9zoVfItyXaVl6Winip5/S88i9HLVL/AAFndeJMkkQGWNNYrmXU2SSFTTPH7Hjks=
X-Received: by 2002:a4a:b981:: with SMTP id e1mr21738860oop.5.1586938943207;
 Wed, 15 Apr 2020 01:22:23 -0700 (PDT)
MIME-Version: 1.0
References: <1583838364-12932-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200310124605.GO2975348@oden.dyn.berto.se> <OSBPR01MB35905FFB621C2F4222692832AAFF0@OSBPR01MB3590.jpnprd01.prod.outlook.com>
 <20200310140625.GA88560@oden.dyn.berto.se> <CA+V-a8vsYGdx6AtgqwS0LXREn4hu-EjVh2D5Dp_rHmpazBYG5A@mail.gmail.com>
 <20200319150329.GB3192108@oden.dyn.berto.se> <CA+V-a8u8=H-6WfaYMLWH73zo5ehP8cu9D-tdGULk=Hkvq4KuAQ@mail.gmail.com>
 <20200330120745.GA3213219@oden.dyn.berto.se> <CA+V-a8vbTc0DZ15y0zZ97PH6khwQVxz=M-8_kgx1AiKkdg5QaA@mail.gmail.com>
 <20200407095620.GA1716317@oden.dyn.berto.se> <20200414193948.GA350588@oden.dyn.berto.se>
In-Reply-To: <20200414193948.GA350588@oden.dyn.berto.se>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Wed, 15 Apr 2020 09:21:56 +0100
Message-ID: <CA+V-a8u7Z_RjRJq8WL5FTD7S-vNibzuChJPo-WT9vOsqzvpd=Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] media: rcar-vin: Add support for
 MEDIA_BUS_FMT_SRGGB8_1X8 format
To:     Niklas <niklas.soderlund@ragnatech.se>
Cc:     Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Tue, Apr 14, 2020 at 8:39 PM Niklas <niklas.soderlund@ragnatech.se> wrot=
e:
>
> Hi Lad,
>
> I spent all day playing with different solutions to how to move forward
> with this. My main problem is I have no setup where I can produce RAW
> image formats to test. But reading the datasheet I see the problem you
> are trying to solve.
>
Thank you for looking into this.

> I think for now the best solution might be to in rvin_crop_scale_comp()
> add a check for if the pixelformat is RAW and cut the value written to
> VNIS_REG in half. The bpp for the format shall still be set to 1.
>
>
>     fmt =3D rvin_format_from_pixel(vin, vin->format.pixelformat);
>     stride =3D vin->format.bytesperline / fmt->bpp;
>
>     if (vin->format.pixelformat =3D=3D V4L2_PIX_FMT_SRGGB8)
>         stride /=3D 2;
>
>     rvin_write(vin, stride, VNIS_REG);
>
> I would also add a nice big comment above the if () that explains why
> the stride is cut in half for raw.
>
Agreed shall do that as above.

Cheers,
--Prabhakar

> On 2020-04-07 11:56:23 +0200, Niklas wrote:
> > Hi Lad,
> >
> > On 2020-04-06 18:20:33 +0100, Lad, Prabhakar wrote:
> > > Did you manage to get the required information on this ?
> >
> > I'm still working on it, sorry for not completing it last week. I will
> > let you know as soon as I can.
> >
> > --
> > Regards,
> > Niklas S=C3=B6derlund
>
> --
> Regards,
> Niklas S=C3=B6derlund
