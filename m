Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB4D557B481
	for <lists+linux-media@lfdr.de>; Wed, 20 Jul 2022 12:28:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237151AbiGTK2e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jul 2022 06:28:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236863AbiGTK2b (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jul 2022 06:28:31 -0400
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1475B30F5D
        for <linux-media@vger.kernel.org>; Wed, 20 Jul 2022 03:28:30 -0700 (PDT)
Received: by mail-qv1-xf33.google.com with SMTP id r12so13165502qvm.3
        for <linux-media@vger.kernel.org>; Wed, 20 Jul 2022 03:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ViQ2a6BZYWWQXrfZURLI41CQnbnZoP8GEzwhDWArNqc=;
        b=jkqerl+lHxdCo5pWJqZWgSX3xYX+2qUgPHGEifzg9B7lL2LXBUAVet3jvOnxmE5Gxw
         h8if+dUKNngQL5ojTctOZ5NXqYhf1otk6H5d7nlh+I82h9A/8/qj0n6ZcjlHjNUfstQk
         IfxmItzrwrpjo9L1/DJE04JCfrCkW0XCz6z6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ViQ2a6BZYWWQXrfZURLI41CQnbnZoP8GEzwhDWArNqc=;
        b=IiY/ezN4Mq3KIDapZOBo1ej/B2WTv7UNC4JAxvAtw3ovdvDFnZJC2jmO54WrWGhoSx
         YJ97BD8uYIVmoYG/dZ+k/CI90w2CV4twRRcHZOjleyrieCCIaHdvUJTD1Lx+vJNEAtCV
         A/+cI329A4qWYCRy5HMtDkzzZWvbC6WyrmV2g4We4k4nBNPehZSxeIbIm9IJt3FIaTtL
         ll9E3c/rsu4DhZzJK/LUjsrqmZ7ePQ+Eti8WqRmDJbwUWTSopXyLvVlBFB3iXITj8q8d
         aJerGJl+ivdNJRo9waB+c+LPPi4H2+D93Uw/8tHvG95YR/uazXat7OaGg51LKAQBkQIU
         9Zrg==
X-Gm-Message-State: AJIora/1AsX+Aebe4xLQ3cQrSUzH4nCrz6l0Xi+wANRJKJyNpjKJ92mM
        lPvZpL1Grd2JS3JQ8ZyjkpyOBTMcN4aaKQ==
X-Google-Smtp-Source: AGRyM1st4L+BIgitZWm7lGD9c+grKUmmzsAHSNwAm+aif3UdgIYWZ+Su3LLfMvno9SFaKh/I8SnSnw==
X-Received: by 2002:a0c:f9c3:0:b0:474:22d:5000 with SMTP id j3-20020a0cf9c3000000b00474022d5000mr3316153qvo.115.1658312908881;
        Wed, 20 Jul 2022 03:28:28 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id z3-20020a05622a028300b0031ef108e6a8sm5646170qtw.42.2022.07.20.03.28.27
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Jul 2022 03:28:27 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id 75so31353940ybf.4
        for <linux-media@vger.kernel.org>; Wed, 20 Jul 2022 03:28:27 -0700 (PDT)
X-Received: by 2002:a25:1583:0:b0:668:e74a:995f with SMTP id
 125-20020a251583000000b00668e74a995fmr36527372ybv.1.1658312907379; Wed, 20
 Jul 2022 03:28:27 -0700 (PDT)
MIME-Version: 1.0
References: <1634278119-32158-1-git-send-email-bingbu.cao@intel.com>
 <CAAFQd5Aykfdj-HPzsQOyQpbGBRhtTsoRm78XgpuGkFUx1joTMA@mail.gmail.com>
 <DM8PR11MB565395F554C6D1C4978EBC2A998E9@DM8PR11MB5653.namprd11.prod.outlook.com>
 <CAAFQd5B9hZNn4UuB8h0RLUwSxwTFGC219LFe8jGE1jDd+EfosA@mail.gmail.com>
 <CAAFQd5B_LTXa=ECg0wRzGLqGJaiz3HrY_C9BJgByj4QFTJzu-Q@mail.gmail.com>
 <64cf6ebd-03d4-3cc2-5eed-bc723eb3214a@linux.intel.com> <CAAFQd5DnBTKKeY1Mr6np2Q6BUo=-RcZHHJ+GsSK-BDAtYLJ1Gg@mail.gmail.com>
 <Yla2owgZ9sSBazDF@paasikivi.fi.intel.com> <CAAFQd5DZGPWmZgRYjdwzk7Mm3OAviDrH24NyWxEredcgA2TMTQ@mail.gmail.com>
 <YlbR3uQLiXoJcrhQ@paasikivi.fi.intel.com> <CAAFQd5CTnHi60OYbSq-UiSozAww7SZZtTA9OBm83AeVzkettiw@mail.gmail.com>
 <e3d1fcab-75a8-1617-c93b-111dd8df66b9@linux.intel.com>
In-Reply-To: <e3d1fcab-75a8-1617-c93b-111dd8df66b9@linux.intel.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 20 Jul 2022 19:28:16 +0900
X-Gmail-Original-Message-ID: <CAAFQd5ARvPOs2xTK7bG661La9M0r+h2N=h=6fPT1ZXqCELKigA@mail.gmail.com>
Message-ID: <CAAFQd5ARvPOs2xTK7bG661La9M0r+h2N=h=6fPT1ZXqCELKigA@mail.gmail.com>
Subject: Re: [PATCH] media: dw9768: activate runtime PM and turn off device
To:     Bingbu Cao <bingbu.cao@linux.intel.com>
Cc:     "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "Cao, Bingbu" <bingbu.cao@intel.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bingbu,

On Thu, Jul 14, 2022 at 6:10 PM Bingbu Cao <bingbu.cao@linux.intel.com> wro=
te:
>
> Tomasz and Sakari,
>
> Is there any conclusion of this support for both OF and
> ACPI platform?
>

Sakari did indeed reply and add me to the thread, but I somehow missed
it, sorry.  I just took a look at it and need some time to think about
how we could solve this in a general way.

For the time being, I'd just make this driver behave as other drivers
- power the regulators on in probe and let the runtime PM suspend
callback power them down. WDYT?

Best regards,
Tomasz

>
> On 4/13/22 9:44 PM, Tomasz Figa wrote:
> > On Wed, Apr 13, 2022 at 10:36 PM sakari.ailus@linux.intel.com
> > <sakari.ailus@linux.intel.com> wrote:
> >>
> >> Hi Tomasz,
> >>
> >> On Wed, Apr 13, 2022 at 09:17:47PM +0900, Tomasz Figa wrote:
> >>> On Wed, Apr 13, 2022 at 8:40 PM sakari.ailus@linux.intel.com
> >>> <sakari.ailus@linux.intel.com> wrote:
> >>>>
> >>>> Hi Tomasz, Bingbu,
> >>>>
> >>>> On Tue, Apr 12, 2022 at 08:15:08PM +0900, Tomasz Figa wrote:
> >>>>> On Tue, Apr 12, 2022 at 8:05 PM Bingbu Cao <bingbu.cao@linux.intel.=
com> wrote:
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> On 4/12/22 5:39 PM, Tomasz Figa wrote:
> >>>>>>> On Tue, Nov 16, 2021 at 1:57 PM Tomasz Figa <tfiga@chromium.org> =
wrote:
> >>>>>>>>
> >>>>>>>> On Fri, Nov 5, 2021 at 9:52 PM Cao, Bingbu <bingbu.cao@intel.com=
> wrote:
> >>>>>>>>>
> >>>>>>>>>> -----Original Message-----
> >>>>>>>>>> From: Tomasz Figa <tfiga@chromium.org>
> >>>>>>>>>> Sent: Friday, November 5, 2021 2:55 PM
> >>>>>>>>>> To: Cao, Bingbu <bingbu.cao@intel.com>
> >>>>>>>>>> Cc: linux-media@vger.kernel.org; sakari.ailus@linux.intel.com;
> >>>>>>>>>> dongchun.zhu@mediatek.com; Qiu, Tian Shu <tian.shu.qiu@intel.c=
om>;
> >>>>>>>>>> bingbu.cao@linux.intel.com
> >>>>>>>>>> Subject: Re: [PATCH] media: dw9768: activate runtime PM and tu=
rn off
> >>>>>>>>>> device
> >>>>>>>>>>
> >>>>>>>>>> On Fri, Oct 15, 2021 at 3:12 PM Bingbu Cao <bingbu.cao@intel.c=
om> wrote:
> >>>>>>>>>>>
> >>>>>>>>>>> When dw9768 working with ACPI systems, the dw9768 was turned =
by
> >>>>>>>>>>> i2c-core during probe, driver need activate the PM runtime an=
d ask
> >>>>>>>>>>> runtime PM to turn off the device.
> >>>>>>>>>>>
> >>>>>>>>>>> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> >>>>>>>>>>> ---
> >>>>>>>>>>>  drivers/media/i2c/dw9768.c | 6 ++++++
> >>>>>>>>>>>  1 file changed, 6 insertions(+)
> >>>>>>>>>>>
> >>>>>>>>>>> diff --git a/drivers/media/i2c/dw9768.c b/drivers/media/i2c/d=
w9768.c
> >>>>>>>>>>> index c086580efac7..65c6acf3ced9 100644
> >>>>>>>>>>> --- a/drivers/media/i2c/dw9768.c
> >>>>>>>>>>> +++ b/drivers/media/i2c/dw9768.c
> >>>>>>>>>>> @@ -469,6 +469,11 @@ static int dw9768_probe(struct i2c_clien=
t
> >>>>>>>>>>> *client)
> >>>>>>>>>>>
> >>>>>>>>>>>         dw9768->sd.entity.function =3D MEDIA_ENT_F_LENS;
> >>>>>>>>>>>
> >>>>>>>>>>> +       /*
> >>>>>>>>>>> +        * Device is already turned on by i2c-core with ACPI =
domain PM.
> >>>>>>>>>>> +        * Attempt to turn off the device to satisfy the priv=
acy LED
> >>>>>>>>>> concerns.
> >>>>>>>>>>> +        */
> >>>>>>>>>>> +       pm_runtime_set_active(dev);
> >>>>>>>>>>
> >>>>>>>>>> This driver is used by non-ACPI systems as well. This change w=
ill make
> >>>>>>>>>> the PM core not call the runtime_resume() callback provided by=
 the
> >>>>>>>>>> driver and the power would never be turned on on such systems.
> >>>>>>>>>>
> >>>>>>>>>
> >>>>>>>>>> Wasn't the intention of Sakari's ACPI patches to allow bypassi=
ng the
> >>>>>>>>>> ACPI domain power on at boot up and eliminate the need for thi=
s change?
> >>>>>>>>>
> >>>>>>>>> Tomasz, thanks for your review.
> >>>>>>>>>
> >>>>>>>>> The comment here is invalid, it should not be strongly related =
to the privacy
> >>>>>>>>> LED concern. Anyway, the device should be turned off on ACPI an=
d non-ACPI
> >>>>>>>>> systems even without Sakari's changes.
> >>>>>>>>>
> >>>>>>>>> I am wondering how the driver work with PM core on non-ACPI sys=
tem.
> >>>>>>>>>
> >>>>>>>>
> >>>>>>>> On non-ACPI systems it's the driver which handles the power sequ=
encing
> >>>>>>>> of the chip so the regulators wouldn't be implicitly enabled by =
the
> >>>>>>>> subsystem before (unless they're shared with some other device a=
nd the
> >>>>>>>> corresponding driver enabled them).
> >>>>>>>
> >>>>>>> It looks like this patch made into Linus' tree and broke the driv=
er on
> >>>>>>> ARM devices. Could we please revert it?
> >>>>>>
> >>>>>> If revert the patch, the device will not work on ACPI system, is t=
here some
> >>>>>> other solution? Have no details about the failure on ARM device.
> >>>>>>
> >>>>>
> >>>>> I believe it worked on ACPI systems, just runtime PM wasn't suspend=
ing
> >>>>> the device.
> >>>>>
> >>>>> That said, if my comment above was addressed instead of being ignor=
ed,
> >>>>> this regression wouldn't have happened. The problem is described in=
 my
> >>>>> previous messages, please get back to them and address the issue I
> >>>>> pointed out.
> >>>>
> >>>> First of all, thanks for catching this.
> >>>>
> >>>> What I believe happened was that the patch was merged to my tree bef=
ore you
> >>>> commented on it and then I missed the related follow-up discussion.
> >>>>
> >>>> Looking at the patch itself, it seems fine as such but there's a pro=
blem
> >>>> with the driver to begin with: the device isn't powered on in probe =
on DT
> >>>> systems but still its runtime suspend callback is called through
> >>>> pm_runtime_idle().
> >>>>
> >>>> Normally calling the RT suspend callback is what we want, but in thi=
s case
> >>>> disabling a regulator that wasn't enabled is a problem.
> >>>>
> >>>> There also seems to be a problem in error handling... and the driver=
 does
> >>>> not support probing while powered off on ACPI. Oh well.
> >>>>
> >>>> Let's revert the patch now but it seems there's something to fix
> >>>> afterwards.
> >>>
> >>> Thanks Sakari.
> >>>
> >>> One of possible ways to fix this would be to always turn on the
> >>> regulators in the probe, although it would result in the privacy LED
> >>> blinking issue on our ARM systems.
> >>>
> >>> I wonder if we're missing something in how the ACPI runtime PM works
> >>> on Linux. It sounds strange to me that the driver needs to be aware o=
f
> >>> the ACPI internals and know that the default boot-up state is powered
> >>
> >> Not really ACPI internals, just that the I=E6=B6=8E devices are powere=
d on for
> >> probe.
> >
> > Do you mean the dev_pm_domain_attach() call at [1]?
> > I suspect that it wouldn't have any effect on anything other than ACPI.
> > That said, I guess it's indeed a design decision in the I2C subsystem..=
.
> >
> > One thing that could help here would be adding a .sync callback to
> > acpi_general_pm_domain, which would turn off the ACPI companion device
> > if dev is suspended.
> >
> > [1] https://elixir.bootlin.com/linux/latest/source/drivers/i2c/i2c-core=
-base.c#L544
> >
> >>
> >>> on. Maybe there is another function that we could call instead of
> >>> pm_runtime_set_active()+pm_runtime_idle() that would only shut down
> >>> the PM domain, while leaving the device itself alone?
> >>
> >> Laurent recently complained about the complexities of supporting runti=
me PM
> >> on drivers with both OF and ACPI support. I was planning to reply, wil=
l
> >> include you.
> >
> > That would be great, thanks!
> >
> > Best regards,
> > Tomasz
> >
>
> --
> Best regards,
> Bingbu Cao
