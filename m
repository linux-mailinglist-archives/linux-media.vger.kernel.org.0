Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C8B6E7743
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2019 18:06:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403989AbfJ1RGT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Oct 2019 13:06:19 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:35169 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726851AbfJ1RGT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Oct 2019 13:06:19 -0400
Received: by mail-il1-f193.google.com with SMTP id p8so8842337ilp.2;
        Mon, 28 Oct 2019 10:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qEZnOAl+fyol577/Ww6E9JnJ75gZF3IAAiee1LeCfz0=;
        b=JS8Fy9vgAdKI1FobnGClOfeD0pP41gqq5kqD7rnWblls7q2odK63Ol6xwiCU9Zt3Kk
         PPdk/JRUd0iUR8wz32PvlRY0otvIlahvYWrZwznaXZEVIxIn4/jPuAzFMsp5sJGVZpTY
         /NNuHZrnpV0yV019S6CtWPQGyn2FefiJ5Rs5vXnndxT0gVUAJT3HxlNfXwaQikrI1pVp
         +qa7kqGsaYHXdZwRLcvTnuC1c9s9lluWveBkjJVMS30yBn6FaRCZqHxiw7cO+caqI5IB
         8JkdkFI8+2aJKZBVCcQT62Psv92rV5tH3it3Dl6t07b6jVjVKEizlz+dOKlN2n+PL2Uv
         fYoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qEZnOAl+fyol577/Ww6E9JnJ75gZF3IAAiee1LeCfz0=;
        b=ay34mQtatB4UP1NftqzHj3QD3NnNGom5dyvWxeXDtbZUbOf13HCHNXprWJmezNA+AW
         pwQKXzKBG5IulMAB//d+Iv1Vg4gV6kadMNjB9SR+iPpeXRgN8iGqOPrw0qKhJMBr8Qg/
         3zR9dMAPB5bu3nBG+TF22eJTlptub5v/ECKv2SgJTcaZz6iM7MxoHJWUffZlD//VJ9Cw
         D38HiMpWv8Vk9Dw+7ms5VXhtAb6ruXjDnAXlc6yIMm5pT0CDh0edKLqZEk0SBQizk9ET
         bKyg6O7wlby/0RcdEElg6CLh39/HyOAsfiy4Jm5ihQSaKz3sm7z+hU10qj9O3IksZ3my
         IWuA==
X-Gm-Message-State: APjAAAVhnhUmMsuFMX3NUNHzK0Vo6AuXYjsVidPRgGPaKgpE4XTtjBQG
        QWQjX3EpJGGPy/+65xcUI9f6MfOGc7am1RpmDW4=
X-Google-Smtp-Source: APXvYqxYIzKYXKMFa2CgHK7gcirYERSxMdE2I4RnMEWEhwn3UG4OKqYAn+/jnr8wxay0EFmyz1FqWZSWRzSEPIAP5fQ=
X-Received: by 2002:a92:6a04:: with SMTP id f4mr6280005ilc.252.1572282378109;
 Mon, 28 Oct 2019 10:06:18 -0700 (PDT)
MIME-Version: 1.0
References: <d9c04318-586a-bfc2-fce6-6218c6bab1d6@linux.intel.com>
 <20191028165827.24949-1-navid.emamdoost@gmail.com> <6450dbb4-aa6f-627d-7e5d-21a20f560d60@linux.intel.com>
In-Reply-To: <6450dbb4-aa6f-627d-7e5d-21a20f560d60@linux.intel.com>
From:   Navid Emamdoost <navid.emamdoost@gmail.com>
Date:   Mon, 28 Oct 2019 12:06:07 -0500
Message-ID: <CAEkB2ETFNFKtGTo+HZ4L9uzr-W1CTeuGAwfKqm8hX5fx7d8dbQ@mail.gmail.com>
Subject: Re: [PATCH v2] media: aspeed-video: Fix memory leaks in aspeed_video_probe
To:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc:     Navid Emamdoost <emamd001@umn.edu>,
        Stephen McCamant <smccaman@umn.edu>, Kangjie Lu <kjlu@umn.edu>,
        Eddie James <eajames@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>, linux-media@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 28, 2019 at 12:01 PM Jae Hyun Yoo
<jae.hyun.yoo@linux.intel.com> wrote:
>
> On 10/28/2019 9:58 AM, Navid Emamdoost wrote:
> > In the implementation of aspeed_video_probe() the allocated memory for
> > video should be released if either devm_ioremap_resource()
> > or aspeed_video_init() or aspeed_video_setup_video() fails. Replace
> > kzalloc() with devm_kzalloc to avoid explicit release for video.
> >
> > Fixes: d2b4387f3bdf ("media: platform: Add Aspeed Video Engine driver")
> > Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
> > ---
> > Changes in v2:
> >       -- replace kzalloc with devm_kzalloc based on Jae Hyun Yoo
> > suggestion
> >
> >   drivers/media/platform/aspeed-video.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> > index eb12f3793062..2aa8ea2f9824 100644
> > --- a/drivers/media/platform/aspeed-video.c
> > +++ b/drivers/media/platform/aspeed-video.c
> > @@ -1646,7 +1646,7 @@ static int aspeed_video_probe(struct platform_device *pdev)
> >   {
> >       int rc;
> >       struct resource *res;
> > -     struct aspeed_video *video = kzalloc(sizeof(*video), GFP_KERNEL);
> > +     struct aspeed_video *video = devm_kzalloc(sizeof(*video), GFP_KERNEL);
>
> It can't be compiled. devm_kzalloc should have 3 parameters.
>

Oops! my bad. Do you think such a list of parameters is fine:
    devm_kzalloc(&pdev->dev, sizeof(*video), GFP_KERNEL);

> Cheers,
>
> Jae



-- 
Navid.
