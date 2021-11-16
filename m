Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFE47452A0E
	for <lists+linux-media@lfdr.de>; Tue, 16 Nov 2021 06:51:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237856AbhKPFyT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Nov 2021 00:54:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237771AbhKPFyG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Nov 2021 00:54:06 -0500
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE77CC03AA3B
        for <linux-media@vger.kernel.org>; Mon, 15 Nov 2021 20:57:34 -0800 (PST)
Received: by mail-qk1-x72e.google.com with SMTP id o63so6099849qkb.4
        for <linux-media@vger.kernel.org>; Mon, 15 Nov 2021 20:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=os0JwGe7rvhRh4kQyvXTjTpexJheuxEvve8m3JY/9e0=;
        b=TAhxEm+Se5n4fx+yx8AWhGAe3GyIS0BrZjsWl6jXGJoUYTNjOJ0vBdVU05fs7ntKfK
         o0K2c/+yfeEpiXy3AG0rpCq7r+Ppc+xD4crc/KeX+ZLe5xp72cBxuRyw2uNB/8gelKDU
         so/y+8HWu23xHKqLEfZx+2G9GvKd4rWX0JMDw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=os0JwGe7rvhRh4kQyvXTjTpexJheuxEvve8m3JY/9e0=;
        b=jP/3v0Vr7ro4IlY+r1IwLE4V+L3WEcA3XLbE3OTmB8faY8VOQ1sLlJarkuRC/oxscX
         8pBRfaOK/ZbsuFBHBALcnHtI4/wr6UxHbb+jMS771lZ9fCtJYeSqXloOFsAvsoNFBIBU
         +qxaC1AbDdYQD3s17OL3HIOzeHMDJqsaXSAqjaHn5FY/yJY3Jj2OvhpLUz5J/41S6Z0g
         xBrwkuBBLgLAvanu58TNOaNkLFEX9nL3BhX9ydMJnjdHeG7t1hZg9RMawB4efYM7LZM8
         vV5I3Gf9IW0NabmSXRlfHd+w31aOps7PlYa6fehH+EBbuLqyu6II7fpxPDM0opTQGP0+
         YTPg==
X-Gm-Message-State: AOAM532oyhVcdgAp9bcfX+IGuOiMIx1jeSKPsJn2OxOv45/ga6dwRUu0
        bxb8RW9CMh+bA8qhGsXMSOh/91jkmZAA3A==
X-Google-Smtp-Source: ABdhPJz94BjstmM0NQva3IZDN8D2M6hdcXIH4LfkLlIjL8tjjh7GRSMXiHV5RdR2U6mYuhAgjv+lyQ==
X-Received: by 2002:a05:620a:20d8:: with SMTP id f24mr3948917qka.256.1637038653432;
        Mon, 15 Nov 2021 20:57:33 -0800 (PST)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id i6sm2069926qti.40.2021.11.15.20.57.32
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Nov 2021 20:57:32 -0800 (PST)
Received: by mail-yb1-f176.google.com with SMTP id i194so20417823yba.6
        for <linux-media@vger.kernel.org>; Mon, 15 Nov 2021 20:57:32 -0800 (PST)
X-Received: by 2002:a25:ae12:: with SMTP id a18mr4883708ybj.412.1637038651779;
 Mon, 15 Nov 2021 20:57:31 -0800 (PST)
MIME-Version: 1.0
References: <1634278119-32158-1-git-send-email-bingbu.cao@intel.com>
 <CAAFQd5Aykfdj-HPzsQOyQpbGBRhtTsoRm78XgpuGkFUx1joTMA@mail.gmail.com> <DM8PR11MB565395F554C6D1C4978EBC2A998E9@DM8PR11MB5653.namprd11.prod.outlook.com>
In-Reply-To: <DM8PR11MB565395F554C6D1C4978EBC2A998E9@DM8PR11MB5653.namprd11.prod.outlook.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 16 Nov 2021 13:57:20 +0900
X-Gmail-Original-Message-ID: <CAAFQd5B9hZNn4UuB8h0RLUwSxwTFGC219LFe8jGE1jDd+EfosA@mail.gmail.com>
Message-ID: <CAAFQd5B9hZNn4UuB8h0RLUwSxwTFGC219LFe8jGE1jDd+EfosA@mail.gmail.com>
Subject: Re: [PATCH] media: dw9768: activate runtime PM and turn off device
To:     "Cao, Bingbu" <bingbu.cao@intel.com>
Cc:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "dongchun.zhu@mediatek.com" <dongchun.zhu@mediatek.com>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
        "bingbu.cao@linux.intel.com" <bingbu.cao@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Nov 5, 2021 at 9:52 PM Cao, Bingbu <bingbu.cao@intel.com> wrote:
>
> > -----Original Message-----
> > From: Tomasz Figa <tfiga@chromium.org>
> > Sent: Friday, November 5, 2021 2:55 PM
> > To: Cao, Bingbu <bingbu.cao@intel.com>
> > Cc: linux-media@vger.kernel.org; sakari.ailus@linux.intel.com;
> > dongchun.zhu@mediatek.com; Qiu, Tian Shu <tian.shu.qiu@intel.com>;
> > bingbu.cao@linux.intel.com
> > Subject: Re: [PATCH] media: dw9768: activate runtime PM and turn off
> > device
> >
> > On Fri, Oct 15, 2021 at 3:12 PM Bingbu Cao <bingbu.cao@intel.com> wrote:
> > >
> > > When dw9768 working with ACPI systems, the dw9768 was turned by
> > > i2c-core during probe, driver need activate the PM runtime and ask
> > > runtime PM to turn off the device.
> > >
> > > Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> > > ---
> > >  drivers/media/i2c/dw9768.c | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > >
> > > diff --git a/drivers/media/i2c/dw9768.c b/drivers/media/i2c/dw9768.c
> > > index c086580efac7..65c6acf3ced9 100644
> > > --- a/drivers/media/i2c/dw9768.c
> > > +++ b/drivers/media/i2c/dw9768.c
> > > @@ -469,6 +469,11 @@ static int dw9768_probe(struct i2c_client
> > > *client)
> > >
> > >         dw9768->sd.entity.function = MEDIA_ENT_F_LENS;
> > >
> > > +       /*
> > > +        * Device is already turned on by i2c-core with ACPI domain PM.
> > > +        * Attempt to turn off the device to satisfy the privacy LED
> > concerns.
> > > +        */
> > > +       pm_runtime_set_active(dev);
> >
> > This driver is used by non-ACPI systems as well. This change will make
> > the PM core not call the runtime_resume() callback provided by the
> > driver and the power would never be turned on on such systems.
> >
>
> > Wasn't the intention of Sakari's ACPI patches to allow bypassing the
> > ACPI domain power on at boot up and eliminate the need for this change?
>
> Tomasz, thanks for your review.
>
> The comment here is invalid, it should not be strongly related to the privacy
> LED concern. Anyway, the device should be turned off on ACPI and non-ACPI
> systems even without Sakari's changes.
>
> I am wondering how the driver work with PM core on non-ACPI system.
>

On non-ACPI systems it's the driver which handles the power sequencing
of the chip so the regulators wouldn't be implicitly enabled by the
subsystem before (unless they're shared with some other device and the
corresponding driver enabled them).

> >
> > Best regards,
> > Tomasz
> >
> > >
> > >         pm_runtime_enable(dev);
> > >         if (!pm_runtime_enabled(dev)) {
> > >                 ret = dw9768_runtime_resume(dev); @@ -483,6 +488,7 @@
> > > static int dw9768_probe(struct i2c_client *client)
> > >                 dev_err(dev, "failed to register V4L2 subdev: %d",
> > ret);
> > >                 goto err_power_off;
> > >         }
> > > +       pm_runtime_idle(dev);
> > >
> > >         return 0;
> > >
> > > --
> > > 2.7.4
> > >
