Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECA55D2C85
	for <lists+linux-media@lfdr.de>; Thu, 10 Oct 2019 16:30:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726377AbfJJO2L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Oct 2019 10:28:11 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:42224 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726200AbfJJO2L (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Oct 2019 10:28:11 -0400
Received: by mail-io1-f68.google.com with SMTP id n197so14065430iod.9
        for <linux-media@vger.kernel.org>; Thu, 10 Oct 2019 07:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=os8P3nNMDt7HcebkuGflsdPwamosXurV2zZudUfKRt4=;
        b=itRPjQo1S6hGbE+jpIDRO2hUbipHm16V3mIEuB6Eicn/rPVzfjmD7I9/7syMGJ+4TT
         vhHIcGz0RPqdu8dTAtZqqPImx8lEmplVXdr+Ki/fL+lpPdeOIkg4nlBkHBMIhRsuAxlR
         Fl9fubWz7yBDlNhogLCX0oR6rPPAcjdNng5918vOQ0oMBGzltN2/eYrYkrCUtJH9R28D
         mk4n8d8fKgsZPYJm9snGbvzN89tLjHB16Fhy6CzOz2TpOa9qYpe6pAc5L56K5J9edFiw
         LDI4ngs8YUCKgMx5SKdJlpMg8Ma+ctLJGX8Ha3/52CxjgSAeGYt96vuJPtkdK8WHo9JX
         6PhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=os8P3nNMDt7HcebkuGflsdPwamosXurV2zZudUfKRt4=;
        b=ocL3SjjVojIbb4MUFEXFMdXKbTCo0w90Omb4BTSFxBMUMTgRVfAXDcgoULr2EoJtAx
         4L8OsVMyCBTfQ+gp7oLmojpKmMIhdcE+cLStuPzdPJzVuG0fjO6rP1MhKsf0CxKq+14m
         P58fL+LouEckK/xmJ6NgHL4SLy+Fhhu4Tzzswc2CT1M6yVID2UC76or7s/oK2j4v+hvP
         wv88U8Kbat8ZduWclZGZZ/8BI0O/N+AD1qgYb3rp9EugARTWNW+kKSmtLhiY3aqvWGT9
         b8cwK8xbN7RgNdqs4XG20YwBe8x96jNoHaWNZxntU+hN+2LirMSk+R+d4j6sUnQjrEG5
         W+CA==
X-Gm-Message-State: APjAAAX/kjGxb71AYQjZTFuV9RYJz+c3jt1zDmb7ZUofwvYKK719WyBx
        W4evH8o+LvMtoyK/kGAagPoLL0pvJPTOzHpZCbs=
X-Google-Smtp-Source: APXvYqzRgJusDb5SXUqeLRtwooSCvIaK1zn2vFkb+aXiz/bpbr+P1Egw0XQw1q+zbpWvf2DIMmY3DdouJ1rgq7uBhvA=
X-Received: by 2002:a02:c608:: with SMTP id i8mr11045860jan.40.1570717690431;
 Thu, 10 Oct 2019 07:28:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190922074900.853-1-yuq825@gmail.com> <156915463935.21369.4938801884938429332@skylake-alporthouse-com>
 <156915661567.21369.17366014102480171128@skylake-alporthouse-com>
In-Reply-To: <156915661567.21369.17366014102480171128@skylake-alporthouse-com>
From:   Qiang Yu <yuq825@gmail.com>
Date:   Thu, 10 Oct 2019 22:27:59 +0800
Message-ID: <CAKGbVbv11BLiv3Mgn2o5PnOKn1H6+mY1ZsXVetpcqSsE98Dd9Q@mail.gmail.com>
Subject: Re: [PATCH] dma-buf/resv: fix exclusive fence get
To:     dri-devel <dri-devel@lists.freedesktop.org>,
        Chris Wilson <chris@chris-wilson.co.uk>
Cc:     lima@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-media@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Chris,

This fix has been pushed to drm-misc-next for a while. But Linux
5.4-rc kernels still does not have this fix.
Should it be also pushed to drm-misc-fixes?

Thanks,
Qiang


On Sun, Sep 22, 2019 at 8:50 PM Chris Wilson <chris@chris-wilson.co.uk> wro=
te:
>
> Quoting Chris Wilson (2019-09-22 13:17:19)
> > Quoting Qiang Yu (2019-09-22 08:49:00)
> > > This causes kernel crash when testing lima driver.
> > >
> > > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > Fixes: b8c036dfc66f ("dma-buf: simplify reservation_object_get_fences=
_rcu a bit")
> > > Signed-off-by: Qiang Yu <yuq825@gmail.com>
> > > ---
> > >  drivers/dma-buf/dma-resv.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> > > index 42a8f3f11681..709002515550 100644
> > > --- a/drivers/dma-buf/dma-resv.c
> > > +++ b/drivers/dma-buf/dma-resv.c
> > > @@ -471,7 +471,7 @@ int dma_resv_get_fences_rcu(struct dma_resv *obj,
> > >         if (pfence_excl)
> > >                 *pfence_excl =3D fence_excl;
> > >         else if (fence_excl)
> > > -               shared[++shared_count] =3D fence_excl;
> > > +               shared[shared_count++] =3D fence_excl;
> >
> > Oops.
> >
> > Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
>
> Applied, thanks for the fix.
> -Chris
