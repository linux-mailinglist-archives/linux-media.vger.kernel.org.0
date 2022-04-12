Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B3BA4FDCEA
	for <lists+linux-media@lfdr.de>; Tue, 12 Apr 2022 13:07:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348572AbiDLKr6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Apr 2022 06:47:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344861AbiDLKml (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Apr 2022 06:42:41 -0400
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E2326E563
        for <linux-media@vger.kernel.org>; Tue, 12 Apr 2022 02:39:30 -0700 (PDT)
Received: by mail-qv1-xf2d.google.com with SMTP id x20so6420654qvl.10
        for <linux-media@vger.kernel.org>; Tue, 12 Apr 2022 02:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XrJ3fGHmmKH/q2eqgRhhAaGa8VQ4jTSpPcTO9r4dGh0=;
        b=i6keCj9soSXGpVanwl3tq0iaw9S7F8fAbAhWnJ6IOeE7TZ/7KTiSx7JjjJVQIuBSxu
         C7XweREupAh+57E8GVCn89LhJR8bjbkojYAcU26ccank3Y+dmkrmEGJAC3f56KaIIj7E
         xTjoIz8+5NV7HrqpxLuuBSSwvXoR0QoxJvcPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XrJ3fGHmmKH/q2eqgRhhAaGa8VQ4jTSpPcTO9r4dGh0=;
        b=FPxBsQXRxhFd4+nfVWwT+eXU+MXc6D6vpbpf2FQU14IuFab7mvYbFgGIsRx9udL6O4
         EP0XlHCB11Yxq+R3PzmXktvaAj7QdFQsDAWZigcgF2Ca6sB9dnLsry5GQd+NtAZemc1X
         ZV0jmztGzHaH2kIQA5H5HPMnW4MlXOGEaBSnu14QksXDzCHLkDYonefqogl56DArCfQ4
         EXzDSqBGmhEuuFQo5JtUX3JTLWHPyR3shSW5xin2W0FzjMWIXX8HSsshoDRkkTBkJAqK
         meudDhsey1hLvou8IsMKGzxbPXb3FMQOHXnKO4e2Xdt6I1X0krGD1hZtrMl6NFnRIuSL
         ATsA==
X-Gm-Message-State: AOAM531o4Rsq+AeWnrx4tu6v34kf0oEI7bxZwhmmNesanGSpaBDkTDhk
        TTKKreyqiOBBvE78/NVR8I6ysqDOxlcg55GC
X-Google-Smtp-Source: ABdhPJyXZqAcbZj/sSwh1WzdI+X4zWK5fvbocaxTZJZkS38DLGUo16CqAQyTJ0/QSSd1fM52qOPcJg==
X-Received: by 2002:a05:6214:3e3:b0:444:3f84:d230 with SMTP id cf3-20020a05621403e300b004443f84d230mr2943421qvb.4.1649756369576;
        Tue, 12 Apr 2022 02:39:29 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id h5-20020ac85845000000b002edfd4b0503sm5499963qth.88.2022.04.12.02.39.27
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Apr 2022 02:39:27 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-2ebebe631ccso110211397b3.4
        for <linux-media@vger.kernel.org>; Tue, 12 Apr 2022 02:39:27 -0700 (PDT)
X-Received: by 2002:a0d:e384:0:b0:2eb:2bc7:a80d with SMTP id
 m126-20020a0de384000000b002eb2bc7a80dmr29872319ywe.41.1649756367120; Tue, 12
 Apr 2022 02:39:27 -0700 (PDT)
MIME-Version: 1.0
References: <1634278119-32158-1-git-send-email-bingbu.cao@intel.com>
 <CAAFQd5Aykfdj-HPzsQOyQpbGBRhtTsoRm78XgpuGkFUx1joTMA@mail.gmail.com>
 <DM8PR11MB565395F554C6D1C4978EBC2A998E9@DM8PR11MB5653.namprd11.prod.outlook.com>
 <CAAFQd5B9hZNn4UuB8h0RLUwSxwTFGC219LFe8jGE1jDd+EfosA@mail.gmail.com>
In-Reply-To: <CAAFQd5B9hZNn4UuB8h0RLUwSxwTFGC219LFe8jGE1jDd+EfosA@mail.gmail.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 12 Apr 2022 18:39:14 +0900
X-Gmail-Original-Message-ID: <CAAFQd5B_LTXa=ECg0wRzGLqGJaiz3HrY_C9BJgByj4QFTJzu-Q@mail.gmail.com>
Message-ID: <CAAFQd5B_LTXa=ECg0wRzGLqGJaiz3HrY_C9BJgByj4QFTJzu-Q@mail.gmail.com>
Subject: Re: [PATCH] media: dw9768: activate runtime PM and turn off device
To:     "Cao, Bingbu" <bingbu.cao@intel.com>
Cc:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
        "bingbu.cao@linux.intel.com" <bingbu.cao@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 16, 2021 at 1:57 PM Tomasz Figa <tfiga@chromium.org> wrote:
>
> On Fri, Nov 5, 2021 at 9:52 PM Cao, Bingbu <bingbu.cao@intel.com> wrote:
> >
> > > -----Original Message-----
> > > From: Tomasz Figa <tfiga@chromium.org>
> > > Sent: Friday, November 5, 2021 2:55 PM
> > > To: Cao, Bingbu <bingbu.cao@intel.com>
> > > Cc: linux-media@vger.kernel.org; sakari.ailus@linux.intel.com;
> > > dongchun.zhu@mediatek.com; Qiu, Tian Shu <tian.shu.qiu@intel.com>;
> > > bingbu.cao@linux.intel.com
> > > Subject: Re: [PATCH] media: dw9768: activate runtime PM and turn off
> > > device
> > >
> > > On Fri, Oct 15, 2021 at 3:12 PM Bingbu Cao <bingbu.cao@intel.com> wrote:
> > > >
> > > > When dw9768 working with ACPI systems, the dw9768 was turned by
> > > > i2c-core during probe, driver need activate the PM runtime and ask
> > > > runtime PM to turn off the device.
> > > >
> > > > Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> > > > ---
> > > >  drivers/media/i2c/dw9768.c | 6 ++++++
> > > >  1 file changed, 6 insertions(+)
> > > >
> > > > diff --git a/drivers/media/i2c/dw9768.c b/drivers/media/i2c/dw9768.c
> > > > index c086580efac7..65c6acf3ced9 100644
> > > > --- a/drivers/media/i2c/dw9768.c
> > > > +++ b/drivers/media/i2c/dw9768.c
> > > > @@ -469,6 +469,11 @@ static int dw9768_probe(struct i2c_client
> > > > *client)
> > > >
> > > >         dw9768->sd.entity.function = MEDIA_ENT_F_LENS;
> > > >
> > > > +       /*
> > > > +        * Device is already turned on by i2c-core with ACPI domain PM.
> > > > +        * Attempt to turn off the device to satisfy the privacy LED
> > > concerns.
> > > > +        */
> > > > +       pm_runtime_set_active(dev);
> > >
> > > This driver is used by non-ACPI systems as well. This change will make
> > > the PM core not call the runtime_resume() callback provided by the
> > > driver and the power would never be turned on on such systems.
> > >
> >
> > > Wasn't the intention of Sakari's ACPI patches to allow bypassing the
> > > ACPI domain power on at boot up and eliminate the need for this change?
> >
> > Tomasz, thanks for your review.
> >
> > The comment here is invalid, it should not be strongly related to the privacy
> > LED concern. Anyway, the device should be turned off on ACPI and non-ACPI
> > systems even without Sakari's changes.
> >
> > I am wondering how the driver work with PM core on non-ACPI system.
> >
>
> On non-ACPI systems it's the driver which handles the power sequencing
> of the chip so the regulators wouldn't be implicitly enabled by the
> subsystem before (unless they're shared with some other device and the
> corresponding driver enabled them).

It looks like this patch made into Linus' tree and broke the driver on
ARM devices. Could we please revert it?

Best regards,
Tomasz

>
> > >
> > > Best regards,
> > > Tomasz
> > >
> > > >
> > > >         pm_runtime_enable(dev);
> > > >         if (!pm_runtime_enabled(dev)) {
> > > >                 ret = dw9768_runtime_resume(dev); @@ -483,6 +488,7 @@
> > > > static int dw9768_probe(struct i2c_client *client)
> > > >                 dev_err(dev, "failed to register V4L2 subdev: %d",
> > > ret);
> > > >                 goto err_power_off;
> > > >         }
> > > > +       pm_runtime_idle(dev);
> > > >
> > > >         return 0;
> > > >
> > > > --
> > > > 2.7.4
> > > >
