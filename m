Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 999474FF68E
	for <lists+linux-media@lfdr.de>; Wed, 13 Apr 2022 14:18:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230219AbiDMMUW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Apr 2022 08:20:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbiDMMUV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Apr 2022 08:20:21 -0400
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A289153E17
        for <linux-media@vger.kernel.org>; Wed, 13 Apr 2022 05:18:00 -0700 (PDT)
Received: by mail-qv1-xf2f.google.com with SMTP id c1so1438769qvl.3
        for <linux-media@vger.kernel.org>; Wed, 13 Apr 2022 05:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hBdifcQai3U58rCONkXE+YbU/erTelK7W41s7JxZlqQ=;
        b=fssrSvaubFxsBgmNWafnM5uJ+Qp8/DFqfuhvyi+SGXbrM73mBmpY5XrWiYWdmf9R8U
         f8XNuxo/9cVn2EUAU6+tRSxYbZAeja09JCTy0UZf09GKUGYK1ErKMe0R365/UuE9FwxV
         VF/IC8tTYrJJAPecyqHbA+NHCpzA9i84KRiQc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hBdifcQai3U58rCONkXE+YbU/erTelK7W41s7JxZlqQ=;
        b=7OsxMLJizjEKVf+/YHT2W9cjdNgsSuzQdCuZHWn3lNVYMiNcl+ToR5CYsshpxPuDQb
         VbYam6C7GuSY2GqYiHJbrjpRBtoC89FyGuSdYKjif2fxmX5040xEt1WxTGAIUDeaNqSq
         p35zdOEXoEx4mwcgVBqy3HOzHThCwbZ4Crd2Ig0+lXsscWzyc27qrU2K+xxF3E2qHYcS
         3YDRYjHxTPBnD48hz3PUwOUScmKrk1y3yjGWB6HFplNPOx12FU5Ocnr+Gha8TgQwLaVg
         RqC7V3srPzAZLfa+hD4lOH4yU1I51HS/YNJ+9rmrET95+e0//UgvBHnllzpydIjTguQ4
         H/9Q==
X-Gm-Message-State: AOAM532yEKEsXXGDzwfiHK9gaIeYLTdxD4ryFGFnerxVelVPv4SWbSgG
        tF6TRQ9T1fiao0Hx/1bJVRtw9/vleTfBMg==
X-Google-Smtp-Source: ABdhPJw6pHVnU49sAVfUYtqikE1JoiHM3CcKRYskYnWO2jZJhTjSz4w3CdbNd84/naJ/Z9HfIBtXgA==
X-Received: by 2002:a05:6214:76a:b0:443:6326:8a90 with SMTP id f10-20020a056214076a00b0044363268a90mr7719135qvz.107.1649852279472;
        Wed, 13 Apr 2022 05:17:59 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id b13-20020ac85bcd000000b002e06856b04fsm29970549qtb.51.2022.04.13.05.17.58
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Apr 2022 05:17:58 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id x200so3295662ybe.13
        for <linux-media@vger.kernel.org>; Wed, 13 Apr 2022 05:17:58 -0700 (PDT)
X-Received: by 2002:a05:6902:104:b0:628:bc80:748f with SMTP id
 o4-20020a056902010400b00628bc80748fmr31484256ybh.575.1649852278160; Wed, 13
 Apr 2022 05:17:58 -0700 (PDT)
MIME-Version: 1.0
References: <1634278119-32158-1-git-send-email-bingbu.cao@intel.com>
 <CAAFQd5Aykfdj-HPzsQOyQpbGBRhtTsoRm78XgpuGkFUx1joTMA@mail.gmail.com>
 <DM8PR11MB565395F554C6D1C4978EBC2A998E9@DM8PR11MB5653.namprd11.prod.outlook.com>
 <CAAFQd5B9hZNn4UuB8h0RLUwSxwTFGC219LFe8jGE1jDd+EfosA@mail.gmail.com>
 <CAAFQd5B_LTXa=ECg0wRzGLqGJaiz3HrY_C9BJgByj4QFTJzu-Q@mail.gmail.com>
 <64cf6ebd-03d4-3cc2-5eed-bc723eb3214a@linux.intel.com> <CAAFQd5DnBTKKeY1Mr6np2Q6BUo=-RcZHHJ+GsSK-BDAtYLJ1Gg@mail.gmail.com>
 <Yla2owgZ9sSBazDF@paasikivi.fi.intel.com>
In-Reply-To: <Yla2owgZ9sSBazDF@paasikivi.fi.intel.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 13 Apr 2022 21:17:47 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DZGPWmZgRYjdwzk7Mm3OAviDrH24NyWxEredcgA2TMTQ@mail.gmail.com>
Message-ID: <CAAFQd5DZGPWmZgRYjdwzk7Mm3OAviDrH24NyWxEredcgA2TMTQ@mail.gmail.com>
Subject: Re: [PATCH] media: dw9768: activate runtime PM and turn off device
To:     "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
Cc:     Bingbu Cao <bingbu.cao@linux.intel.com>,
        "Cao, Bingbu" <bingbu.cao@intel.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>
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

On Wed, Apr 13, 2022 at 8:40 PM sakari.ailus@linux.intel.com
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Tomasz, Bingbu,
>
> On Tue, Apr 12, 2022 at 08:15:08PM +0900, Tomasz Figa wrote:
> > On Tue, Apr 12, 2022 at 8:05 PM Bingbu Cao <bingbu.cao@linux.intel.com> wrote:
> > >
> > >
> > >
> > > On 4/12/22 5:39 PM, Tomasz Figa wrote:
> > > > On Tue, Nov 16, 2021 at 1:57 PM Tomasz Figa <tfiga@chromium.org> wrote:
> > > >>
> > > >> On Fri, Nov 5, 2021 at 9:52 PM Cao, Bingbu <bingbu.cao@intel.com> wrote:
> > > >>>
> > > >>>> -----Original Message-----
> > > >>>> From: Tomasz Figa <tfiga@chromium.org>
> > > >>>> Sent: Friday, November 5, 2021 2:55 PM
> > > >>>> To: Cao, Bingbu <bingbu.cao@intel.com>
> > > >>>> Cc: linux-media@vger.kernel.org; sakari.ailus@linux.intel.com;
> > > >>>> dongchun.zhu@mediatek.com; Qiu, Tian Shu <tian.shu.qiu@intel.com>;
> > > >>>> bingbu.cao@linux.intel.com
> > > >>>> Subject: Re: [PATCH] media: dw9768: activate runtime PM and turn off
> > > >>>> device
> > > >>>>
> > > >>>> On Fri, Oct 15, 2021 at 3:12 PM Bingbu Cao <bingbu.cao@intel.com> wrote:
> > > >>>>>
> > > >>>>> When dw9768 working with ACPI systems, the dw9768 was turned by
> > > >>>>> i2c-core during probe, driver need activate the PM runtime and ask
> > > >>>>> runtime PM to turn off the device.
> > > >>>>>
> > > >>>>> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> > > >>>>> ---
> > > >>>>>  drivers/media/i2c/dw9768.c | 6 ++++++
> > > >>>>>  1 file changed, 6 insertions(+)
> > > >>>>>
> > > >>>>> diff --git a/drivers/media/i2c/dw9768.c b/drivers/media/i2c/dw9768.c
> > > >>>>> index c086580efac7..65c6acf3ced9 100644
> > > >>>>> --- a/drivers/media/i2c/dw9768.c
> > > >>>>> +++ b/drivers/media/i2c/dw9768.c
> > > >>>>> @@ -469,6 +469,11 @@ static int dw9768_probe(struct i2c_client
> > > >>>>> *client)
> > > >>>>>
> > > >>>>>         dw9768->sd.entity.function = MEDIA_ENT_F_LENS;
> > > >>>>>
> > > >>>>> +       /*
> > > >>>>> +        * Device is already turned on by i2c-core with ACPI domain PM.
> > > >>>>> +        * Attempt to turn off the device to satisfy the privacy LED
> > > >>>> concerns.
> > > >>>>> +        */
> > > >>>>> +       pm_runtime_set_active(dev);
> > > >>>>
> > > >>>> This driver is used by non-ACPI systems as well. This change will make
> > > >>>> the PM core not call the runtime_resume() callback provided by the
> > > >>>> driver and the power would never be turned on on such systems.
> > > >>>>
> > > >>>
> > > >>>> Wasn't the intention of Sakari's ACPI patches to allow bypassing the
> > > >>>> ACPI domain power on at boot up and eliminate the need for this change?
> > > >>>
> > > >>> Tomasz, thanks for your review.
> > > >>>
> > > >>> The comment here is invalid, it should not be strongly related to the privacy
> > > >>> LED concern. Anyway, the device should be turned off on ACPI and non-ACPI
> > > >>> systems even without Sakari's changes.
> > > >>>
> > > >>> I am wondering how the driver work with PM core on non-ACPI system.
> > > >>>
> > > >>
> > > >> On non-ACPI systems it's the driver which handles the power sequencing
> > > >> of the chip so the regulators wouldn't be implicitly enabled by the
> > > >> subsystem before (unless they're shared with some other device and the
> > > >> corresponding driver enabled them).
> > > >
> > > > It looks like this patch made into Linus' tree and broke the driver on
> > > > ARM devices. Could we please revert it?
> > >
> > > If revert the patch, the device will not work on ACPI system, is there some
> > > other solution? Have no details about the failure on ARM device.
> > >
> >
> > I believe it worked on ACPI systems, just runtime PM wasn't suspending
> > the device.
> >
> > That said, if my comment above was addressed instead of being ignored,
> > this regression wouldn't have happened. The problem is described in my
> > previous messages, please get back to them and address the issue I
> > pointed out.
>
> First of all, thanks for catching this.
>
> What I believe happened was that the patch was merged to my tree before you
> commented on it and then I missed the related follow-up discussion.
>
> Looking at the patch itself, it seems fine as such but there's a problem
> with the driver to begin with: the device isn't powered on in probe on DT
> systems but still its runtime suspend callback is called through
> pm_runtime_idle().
>
> Normally calling the RT suspend callback is what we want, but in this case
> disabling a regulator that wasn't enabled is a problem.
>
> There also seems to be a problem in error handling... and the driver does
> not support probing while powered off on ACPI. Oh well.
>
> Let's revert the patch now but it seems there's something to fix
> afterwards.

Thanks Sakari.

One of possible ways to fix this would be to always turn on the
regulators in the probe, although it would result in the privacy LED
blinking issue on our ARM systems.

I wonder if we're missing something in how the ACPI runtime PM works
on Linux. It sounds strange to me that the driver needs to be aware of
the ACPI internals and know that the default boot-up state is powered
on. Maybe there is another function that we could call instead of
pm_runtime_set_active()+pm_runtime_idle() that would only shut down
the PM domain, while leaving the device itself alone?

Best regards,
Tomasz

>
> --
> Regards,
>
> Sakari Ailus
