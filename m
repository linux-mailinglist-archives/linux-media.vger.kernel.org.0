Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA1824FF816
	for <lists+linux-media@lfdr.de>; Wed, 13 Apr 2022 15:45:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232023AbiDMNrg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Apr 2022 09:47:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235972AbiDMNrb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Apr 2022 09:47:31 -0400
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 740C427B27
        for <linux-media@vger.kernel.org>; Wed, 13 Apr 2022 06:45:09 -0700 (PDT)
Received: by mail-qt1-x830.google.com with SMTP id t2so1351529qtw.9
        for <linux-media@vger.kernel.org>; Wed, 13 Apr 2022 06:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7A3SyGXXWYOsOZscs4CAxYoGS5cw7UWVZbqtfWA/CYw=;
        b=YWxGV3KX7EVmTxZfLfw1gtDbpcZENKz2b9nFgpmCEmESjNtefebrjtSeZIdCTm+tgT
         poLd4W+PfSczWWStbAAQiT8AIGT3f6Y5akw0bGEFMav9nTnKxQz5zT8cbbLh+5GZC2Vn
         EIUAbH4nRYm8XKohXVVb5N8dC4cnHpYVaPEpA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7A3SyGXXWYOsOZscs4CAxYoGS5cw7UWVZbqtfWA/CYw=;
        b=v5cfvpMV6m+aPfK3E2BOsCXIE1FMSXi81koVotG25ZLtaayUkJryxYinl48uUPCv+n
         pn9sHvvRYwesMMk2xbns8x3gnYx1WGMtyvAJuXSJlbo/DvJv2Dl0MV3M9zS78MLhXwaT
         Bb456y0RDDF1cvQZVpJDes5wPP6Tf5mpUjfkqktNGALdAjR6jYWQWCDS+bRQlErfMzIp
         lPJYVDiaWfjrQPrQxjwS38Ru2UxdW+TGHrihGPrkzt7JscA3iMH15Twt/q1oLAv5Zu1E
         SPJTP9kRCZvVwjRB1/XzizXBcC6+qezb29RkinKAh5INdzyAtOMG6Y38/TByuvFg74vv
         vQOg==
X-Gm-Message-State: AOAM530HH5xDQ1wGvgPtRm98hjdCxo6UIb92GeaXyoQ0ss0i3cgCg9zg
        9vyW5A2FT2h67dDO+TuphMhCLAON4IybCg==
X-Google-Smtp-Source: ABdhPJyznD20aR0fFpQ8Ht4RCsFjrZBIj1lBVgz+IkyaPipCVftQWV48AoAZ+J0fEGqDoYl89xbsZA==
X-Received: by 2002:ac8:4d8c:0:b0:2eb:e8c9:848 with SMTP id a12-20020ac84d8c000000b002ebe8c90848mr7262705qtw.141.1649857508322;
        Wed, 13 Apr 2022 06:45:08 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id v3-20020a05622a014300b002e1dcd4cfa9sm31582601qtw.64.2022.04.13.06.45.07
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Apr 2022 06:45:07 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id p65so3783573ybp.9
        for <linux-media@vger.kernel.org>; Wed, 13 Apr 2022 06:45:07 -0700 (PDT)
X-Received: by 2002:a05:6902:2:b0:624:4cb5:fd3b with SMTP id
 l2-20020a056902000200b006244cb5fd3bmr31192780ybh.1.1649857507120; Wed, 13 Apr
 2022 06:45:07 -0700 (PDT)
MIME-Version: 1.0
References: <1634278119-32158-1-git-send-email-bingbu.cao@intel.com>
 <CAAFQd5Aykfdj-HPzsQOyQpbGBRhtTsoRm78XgpuGkFUx1joTMA@mail.gmail.com>
 <DM8PR11MB565395F554C6D1C4978EBC2A998E9@DM8PR11MB5653.namprd11.prod.outlook.com>
 <CAAFQd5B9hZNn4UuB8h0RLUwSxwTFGC219LFe8jGE1jDd+EfosA@mail.gmail.com>
 <CAAFQd5B_LTXa=ECg0wRzGLqGJaiz3HrY_C9BJgByj4QFTJzu-Q@mail.gmail.com>
 <64cf6ebd-03d4-3cc2-5eed-bc723eb3214a@linux.intel.com> <CAAFQd5DnBTKKeY1Mr6np2Q6BUo=-RcZHHJ+GsSK-BDAtYLJ1Gg@mail.gmail.com>
 <Yla2owgZ9sSBazDF@paasikivi.fi.intel.com> <CAAFQd5DZGPWmZgRYjdwzk7Mm3OAviDrH24NyWxEredcgA2TMTQ@mail.gmail.com>
 <YlbR3uQLiXoJcrhQ@paasikivi.fi.intel.com>
In-Reply-To: <YlbR3uQLiXoJcrhQ@paasikivi.fi.intel.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 13 Apr 2022 22:44:56 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CTnHi60OYbSq-UiSozAww7SZZtTA9OBm83AeVzkettiw@mail.gmail.com>
Message-ID: <CAAFQd5CTnHi60OYbSq-UiSozAww7SZZtTA9OBm83AeVzkettiw@mail.gmail.com>
Subject: Re: [PATCH] media: dw9768: activate runtime PM and turn off device
To:     "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
Cc:     Bingbu Cao <bingbu.cao@linux.intel.com>,
        "Cao, Bingbu" <bingbu.cao@intel.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Apr 13, 2022 at 10:36 PM sakari.ailus@linux.intel.com
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Tomasz,
>
> On Wed, Apr 13, 2022 at 09:17:47PM +0900, Tomasz Figa wrote:
> > On Wed, Apr 13, 2022 at 8:40 PM sakari.ailus@linux.intel.com
> > <sakari.ailus@linux.intel.com> wrote:
> > >
> > > Hi Tomasz, Bingbu,
> > >
> > > On Tue, Apr 12, 2022 at 08:15:08PM +0900, Tomasz Figa wrote:
> > > > On Tue, Apr 12, 2022 at 8:05 PM Bingbu Cao <bingbu.cao@linux.intel.=
com> wrote:
> > > > >
> > > > >
> > > > >
> > > > > On 4/12/22 5:39 PM, Tomasz Figa wrote:
> > > > > > On Tue, Nov 16, 2021 at 1:57 PM Tomasz Figa <tfiga@chromium.org=
> wrote:
> > > > > >>
> > > > > >> On Fri, Nov 5, 2021 at 9:52 PM Cao, Bingbu <bingbu.cao@intel.c=
om> wrote:
> > > > > >>>
> > > > > >>>> -----Original Message-----
> > > > > >>>> From: Tomasz Figa <tfiga@chromium.org>
> > > > > >>>> Sent: Friday, November 5, 2021 2:55 PM
> > > > > >>>> To: Cao, Bingbu <bingbu.cao@intel.com>
> > > > > >>>> Cc: linux-media@vger.kernel.org; sakari.ailus@linux.intel.co=
m;
> > > > > >>>> dongchun.zhu@mediatek.com; Qiu, Tian Shu <tian.shu.qiu@intel=
.com>;
> > > > > >>>> bingbu.cao@linux.intel.com
> > > > > >>>> Subject: Re: [PATCH] media: dw9768: activate runtime PM and =
turn off
> > > > > >>>> device
> > > > > >>>>
> > > > > >>>> On Fri, Oct 15, 2021 at 3:12 PM Bingbu Cao <bingbu.cao@intel=
.com> wrote:
> > > > > >>>>>
> > > > > >>>>> When dw9768 working with ACPI systems, the dw9768 was turne=
d by
> > > > > >>>>> i2c-core during probe, driver need activate the PM runtime =
and ask
> > > > > >>>>> runtime PM to turn off the device.
> > > > > >>>>>
> > > > > >>>>> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> > > > > >>>>> ---
> > > > > >>>>>  drivers/media/i2c/dw9768.c | 6 ++++++
> > > > > >>>>>  1 file changed, 6 insertions(+)
> > > > > >>>>>
> > > > > >>>>> diff --git a/drivers/media/i2c/dw9768.c b/drivers/media/i2c=
/dw9768.c
> > > > > >>>>> index c086580efac7..65c6acf3ced9 100644
> > > > > >>>>> --- a/drivers/media/i2c/dw9768.c
> > > > > >>>>> +++ b/drivers/media/i2c/dw9768.c
> > > > > >>>>> @@ -469,6 +469,11 @@ static int dw9768_probe(struct i2c_cli=
ent
> > > > > >>>>> *client)
> > > > > >>>>>
> > > > > >>>>>         dw9768->sd.entity.function =3D MEDIA_ENT_F_LENS;
> > > > > >>>>>
> > > > > >>>>> +       /*
> > > > > >>>>> +        * Device is already turned on by i2c-core with ACP=
I domain PM.
> > > > > >>>>> +        * Attempt to turn off the device to satisfy the pr=
ivacy LED
> > > > > >>>> concerns.
> > > > > >>>>> +        */
> > > > > >>>>> +       pm_runtime_set_active(dev);
> > > > > >>>>
> > > > > >>>> This driver is used by non-ACPI systems as well. This change=
 will make
> > > > > >>>> the PM core not call the runtime_resume() callback provided =
by the
> > > > > >>>> driver and the power would never be turned on on such system=
s.
> > > > > >>>>
> > > > > >>>
> > > > > >>>> Wasn't the intention of Sakari's ACPI patches to allow bypas=
sing the
> > > > > >>>> ACPI domain power on at boot up and eliminate the need for t=
his change?
> > > > > >>>
> > > > > >>> Tomasz, thanks for your review.
> > > > > >>>
> > > > > >>> The comment here is invalid, it should not be strongly relate=
d to the privacy
> > > > > >>> LED concern. Anyway, the device should be turned off on ACPI =
and non-ACPI
> > > > > >>> systems even without Sakari's changes.
> > > > > >>>
> > > > > >>> I am wondering how the driver work with PM core on non-ACPI s=
ystem.
> > > > > >>>
> > > > > >>
> > > > > >> On non-ACPI systems it's the driver which handles the power se=
quencing
> > > > > >> of the chip so the regulators wouldn't be implicitly enabled b=
y the
> > > > > >> subsystem before (unless they're shared with some other device=
 and the
> > > > > >> corresponding driver enabled them).
> > > > > >
> > > > > > It looks like this patch made into Linus' tree and broke the dr=
iver on
> > > > > > ARM devices. Could we please revert it?
> > > > >
> > > > > If revert the patch, the device will not work on ACPI system, is =
there some
> > > > > other solution? Have no details about the failure on ARM device.
> > > > >
> > > >
> > > > I believe it worked on ACPI systems, just runtime PM wasn't suspend=
ing
> > > > the device.
> > > >
> > > > That said, if my comment above was addressed instead of being ignor=
ed,
> > > > this regression wouldn't have happened. The problem is described in=
 my
> > > > previous messages, please get back to them and address the issue I
> > > > pointed out.
> > >
> > > First of all, thanks for catching this.
> > >
> > > What I believe happened was that the patch was merged to my tree befo=
re you
> > > commented on it and then I missed the related follow-up discussion.
> > >
> > > Looking at the patch itself, it seems fine as such but there's a prob=
lem
> > > with the driver to begin with: the device isn't powered on in probe o=
n DT
> > > systems but still its runtime suspend callback is called through
> > > pm_runtime_idle().
> > >
> > > Normally calling the RT suspend callback is what we want, but in this=
 case
> > > disabling a regulator that wasn't enabled is a problem.
> > >
> > > There also seems to be a problem in error handling... and the driver =
does
> > > not support probing while powered off on ACPI. Oh well.
> > >
> > > Let's revert the patch now but it seems there's something to fix
> > > afterwards.
> >
> > Thanks Sakari.
> >
> > One of possible ways to fix this would be to always turn on the
> > regulators in the probe, although it would result in the privacy LED
> > blinking issue on our ARM systems.
> >
> > I wonder if we're missing something in how the ACPI runtime PM works
> > on Linux. It sounds strange to me that the driver needs to be aware of
> > the ACPI internals and know that the default boot-up state is powered
>
> Not really ACPI internals, just that the I=E6=B6=8E devices are powered o=
n for
> probe.

Do you mean the dev_pm_domain_attach() call at [1]?
I suspect that it wouldn't have any effect on anything other than ACPI.
That said, I guess it's indeed a design decision in the I2C subsystem...

One thing that could help here would be adding a .sync callback to
acpi_general_pm_domain, which would turn off the ACPI companion device
if dev is suspended.

[1] https://elixir.bootlin.com/linux/latest/source/drivers/i2c/i2c-core-bas=
e.c#L544

>
> > on. Maybe there is another function that we could call instead of
> > pm_runtime_set_active()+pm_runtime_idle() that would only shut down
> > the PM domain, while leaving the device itself alone?
>
> Laurent recently complained about the complexities of supporting runtime =
PM
> on drivers with both OF and ACPI support. I was planning to reply, will
> include you.

That would be great, thanks!

Best regards,
Tomasz
