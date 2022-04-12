Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64B854FDFF0
	for <lists+linux-media@lfdr.de>; Tue, 12 Apr 2022 14:30:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345936AbiDLMQD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Apr 2022 08:16:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354622AbiDLMOK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Apr 2022 08:14:10 -0400
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6513885BCC
        for <linux-media@vger.kernel.org>; Tue, 12 Apr 2022 04:15:23 -0700 (PDT)
Received: by mail-qv1-xf2d.google.com with SMTP id y19so3914062qvk.5
        for <linux-media@vger.kernel.org>; Tue, 12 Apr 2022 04:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M/5HfPKp2892jldlI/ugythN8fX5WApRP5zexDpqapM=;
        b=Hnb7OorUYNE3foRB/VcDVTodd+sjnD8B8So3l4O0kZHy6sc617pB8s9jzwZyhV2xrJ
         m2XGF+Yl1nGGIdJbX209A8Bm0l711caiWQ/vtigSk1oH1t85byxADMS6be7/MPvvBSjF
         cybSs38b/0qvBUsRcLM6nT9CL2ooncZKOCrVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M/5HfPKp2892jldlI/ugythN8fX5WApRP5zexDpqapM=;
        b=RFuTKg9vV5l3aDRD0hZVdbbgO75cpVtc9O96fBtgsmUVPIaCBV5CLNIYCQXzYnh+dC
         CBK9vLCVoPWe60PrpzT0ijkOu0N/1MnsvBDQRl8Bd2NAd/F+6wSBm9EhgGpuj1fP30tr
         A1KIxZ51sNgk7nQzB6a9anhsrAAfVrZ27knRhWSgGnLf/Jz7CLQmif9bHLL1INS46uTG
         ZiT9y8BofCu+uHp1KW5gJ4zy8rpKmHF+q81XW0YDpQK8fqHwh1UCl3e5W16K7mB4zrd4
         qKd2EJyP/DIpdjl3CXlK6IgS+1T/Ywh/AXQIfxD9XYWspJlipeNOOHnwuq34tFV2g3+a
         JNeA==
X-Gm-Message-State: AOAM533ElbqW2+bXcxCfv7QHe5ycprQjf9urMLhHkapY8NoQV+1lIVjZ
        dKFdN69ngzNuWJYXM/dqxOeM/Z+CA6fFmU6r
X-Google-Smtp-Source: ABdhPJxt57F19Xq09mGxE6vVbccltjT2Hw1HMP0SFKJBx3GOqJ+7DNSttrp1pf56xts5XMJIgSlY2g==
X-Received: by 2002:ad4:5948:0:b0:441:5d45:6d62 with SMTP id eo8-20020ad45948000000b004415d456d62mr30268272qvb.25.1649762121972;
        Tue, 12 Apr 2022 04:15:21 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id s4-20020ae9de04000000b0069c3a577b0asm1306566qkf.51.2022.04.12.04.15.21
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Apr 2022 04:15:21 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id f17so1579164ybj.10
        for <linux-media@vger.kernel.org>; Tue, 12 Apr 2022 04:15:21 -0700 (PDT)
X-Received: by 2002:a05:6902:2:b0:624:4cb5:fd3b with SMTP id
 l2-20020a056902000200b006244cb5fd3bmr26819548ybh.1.1649762120579; Tue, 12 Apr
 2022 04:15:20 -0700 (PDT)
MIME-Version: 1.0
References: <1634278119-32158-1-git-send-email-bingbu.cao@intel.com>
 <CAAFQd5Aykfdj-HPzsQOyQpbGBRhtTsoRm78XgpuGkFUx1joTMA@mail.gmail.com>
 <DM8PR11MB565395F554C6D1C4978EBC2A998E9@DM8PR11MB5653.namprd11.prod.outlook.com>
 <CAAFQd5B9hZNn4UuB8h0RLUwSxwTFGC219LFe8jGE1jDd+EfosA@mail.gmail.com>
 <CAAFQd5B_LTXa=ECg0wRzGLqGJaiz3HrY_C9BJgByj4QFTJzu-Q@mail.gmail.com> <64cf6ebd-03d4-3cc2-5eed-bc723eb3214a@linux.intel.com>
In-Reply-To: <64cf6ebd-03d4-3cc2-5eed-bc723eb3214a@linux.intel.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 12 Apr 2022 20:15:08 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DnBTKKeY1Mr6np2Q6BUo=-RcZHHJ+GsSK-BDAtYLJ1Gg@mail.gmail.com>
Message-ID: <CAAFQd5DnBTKKeY1Mr6np2Q6BUo=-RcZHHJ+GsSK-BDAtYLJ1Gg@mail.gmail.com>
Subject: Re: [PATCH] media: dw9768: activate runtime PM and turn off device
To:     Bingbu Cao <bingbu.cao@linux.intel.com>
Cc:     "Cao, Bingbu" <bingbu.cao@intel.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
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

On Tue, Apr 12, 2022 at 8:05 PM Bingbu Cao <bingbu.cao@linux.intel.com> wrote:
>
>
>
> On 4/12/22 5:39 PM, Tomasz Figa wrote:
> > On Tue, Nov 16, 2021 at 1:57 PM Tomasz Figa <tfiga@chromium.org> wrote:
> >>
> >> On Fri, Nov 5, 2021 at 9:52 PM Cao, Bingbu <bingbu.cao@intel.com> wrote:
> >>>
> >>>> -----Original Message-----
> >>>> From: Tomasz Figa <tfiga@chromium.org>
> >>>> Sent: Friday, November 5, 2021 2:55 PM
> >>>> To: Cao, Bingbu <bingbu.cao@intel.com>
> >>>> Cc: linux-media@vger.kernel.org; sakari.ailus@linux.intel.com;
> >>>> dongchun.zhu@mediatek.com; Qiu, Tian Shu <tian.shu.qiu@intel.com>;
> >>>> bingbu.cao@linux.intel.com
> >>>> Subject: Re: [PATCH] media: dw9768: activate runtime PM and turn off
> >>>> device
> >>>>
> >>>> On Fri, Oct 15, 2021 at 3:12 PM Bingbu Cao <bingbu.cao@intel.com> wrote:
> >>>>>
> >>>>> When dw9768 working with ACPI systems, the dw9768 was turned by
> >>>>> i2c-core during probe, driver need activate the PM runtime and ask
> >>>>> runtime PM to turn off the device.
> >>>>>
> >>>>> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> >>>>> ---
> >>>>>  drivers/media/i2c/dw9768.c | 6 ++++++
> >>>>>  1 file changed, 6 insertions(+)
> >>>>>
> >>>>> diff --git a/drivers/media/i2c/dw9768.c b/drivers/media/i2c/dw9768.c
> >>>>> index c086580efac7..65c6acf3ced9 100644
> >>>>> --- a/drivers/media/i2c/dw9768.c
> >>>>> +++ b/drivers/media/i2c/dw9768.c
> >>>>> @@ -469,6 +469,11 @@ static int dw9768_probe(struct i2c_client
> >>>>> *client)
> >>>>>
> >>>>>         dw9768->sd.entity.function = MEDIA_ENT_F_LENS;
> >>>>>
> >>>>> +       /*
> >>>>> +        * Device is already turned on by i2c-core with ACPI domain PM.
> >>>>> +        * Attempt to turn off the device to satisfy the privacy LED
> >>>> concerns.
> >>>>> +        */
> >>>>> +       pm_runtime_set_active(dev);
> >>>>
> >>>> This driver is used by non-ACPI systems as well. This change will make
> >>>> the PM core not call the runtime_resume() callback provided by the
> >>>> driver and the power would never be turned on on such systems.
> >>>>
> >>>
> >>>> Wasn't the intention of Sakari's ACPI patches to allow bypassing the
> >>>> ACPI domain power on at boot up and eliminate the need for this change?
> >>>
> >>> Tomasz, thanks for your review.
> >>>
> >>> The comment here is invalid, it should not be strongly related to the privacy
> >>> LED concern. Anyway, the device should be turned off on ACPI and non-ACPI
> >>> systems even without Sakari's changes.
> >>>
> >>> I am wondering how the driver work with PM core on non-ACPI system.
> >>>
> >>
> >> On non-ACPI systems it's the driver which handles the power sequencing
> >> of the chip so the regulators wouldn't be implicitly enabled by the
> >> subsystem before (unless they're shared with some other device and the
> >> corresponding driver enabled them).
> >
> > It looks like this patch made into Linus' tree and broke the driver on
> > ARM devices. Could we please revert it?
>
> If revert the patch, the device will not work on ACPI system, is there some
> other solution? Have no details about the failure on ARM device.
>

I believe it worked on ACPI systems, just runtime PM wasn't suspending
the device.

That said, if my comment above was addressed instead of being ignored,
this regression wouldn't have happened. The problem is described in my
previous messages, please get back to them and address the issue I
pointed out.

Best regards,
Tomasz

> >
> > Best regards,
> > Tomasz
> >
> >>
> >>>>
> >>>> Best regards,
> >>>> Tomasz
> >>>>
> >>>>>
> >>>>>         pm_runtime_enable(dev);
> >>>>>         if (!pm_runtime_enabled(dev)) {
> >>>>>                 ret = dw9768_runtime_resume(dev); @@ -483,6 +488,7 @@
> >>>>> static int dw9768_probe(struct i2c_client *client)
> >>>>>                 dev_err(dev, "failed to register V4L2 subdev: %d",
> >>>> ret);
> >>>>>                 goto err_power_off;
> >>>>>         }
> >>>>> +       pm_runtime_idle(dev);
> >>>>>
> >>>>>         return 0;
> >>>>>
> >>>>> --
> >>>>> 2.7.4
> >>>>>
>
> --
> Best regards,
> Bingbu Cao
