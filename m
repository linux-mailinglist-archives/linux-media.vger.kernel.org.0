Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49C9C4FF686
	for <lists+linux-media@lfdr.de>; Wed, 13 Apr 2022 14:13:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231438AbiDMMQH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Apr 2022 08:16:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230219AbiDMMQG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Apr 2022 08:16:06 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87BB95D66F
        for <linux-media@vger.kernel.org>; Wed, 13 Apr 2022 05:13:45 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id y23so904425qtv.4
        for <linux-media@vger.kernel.org>; Wed, 13 Apr 2022 05:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Kp4CiG2ZMb/mxQvCPLYMxZXTm+fWHlLJFHe+brGapoI=;
        b=ZiBDOzwY3CLHaKfrca3XbuBkFzjww/rNvggdUeqfqnZC5h4VfDgTdEYmlwoyWBoH/i
         6kLsk1VwA2t37datVTcdQm2CJkNnvMxX8v+ueDr4QHvFtVJKiCABs/K6+vQKKekDRtXE
         ajQe6ogPZSFR/utDB0zI7oOXhoZwSSC4UrsfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Kp4CiG2ZMb/mxQvCPLYMxZXTm+fWHlLJFHe+brGapoI=;
        b=62sdZR5UoMU47jc42pP7Qjtj+Rt4qdghCTHf0R3D2NdQWpMIq0TNiRVGfgQIp9bDgK
         qgH54RqqzXt5OhJ5vOQlXmEpWMETS1ASstAKel9/1teniG4MJrh56UAO+G5EVewK8zed
         WqIKMM7EpmzBJcbSPIl6GAXW4xCXio2Syg3keU12jg8UzOAgi5I6wbxHbYMunhBUHZyq
         y3uATeHGbAiMR72F1aVihoGkvwNNb0mDWTXnI5MiG2mMYmK2Jz7RgHwbFCQ5joxt3uLH
         wPWsvqYLAfq32ixX3roQBL1vhXhnDPAhfnaz8TMT8U4/wQuOo6rtIkygmsA2e+YJDqdp
         HQgQ==
X-Gm-Message-State: AOAM532/Dcd3/KCONXmy+N64uT+4DupF2yQCQP5c3b0atykqFiMTbP3s
        GlmwtNBG7j6Q6fZydEA88vQd0XUC/H0G/Q==
X-Google-Smtp-Source: ABdhPJz+6qbj6xP9A0lC5jqOkrAnv8NdEXcTaguWV+o8T4BzYO2Z12tnNWQpZBuN9y3G+ZCZEu2PHw==
X-Received: by 2002:ac8:7142:0:b0:2ed:10b9:239c with SMTP id h2-20020ac87142000000b002ed10b9239cmr6724864qtp.225.1649852024014;
        Wed, 13 Apr 2022 05:13:44 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id d11-20020a37680b000000b0069ab73d9981sm10319178qkc.38.2022.04.13.05.13.41
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Apr 2022 05:13:42 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id j2so3426605ybu.0
        for <linux-media@vger.kernel.org>; Wed, 13 Apr 2022 05:13:41 -0700 (PDT)
X-Received: by 2002:a25:8b03:0:b0:628:8cff:ed6c with SMTP id
 i3-20020a258b03000000b006288cffed6cmr30546796ybl.513.1649852021323; Wed, 13
 Apr 2022 05:13:41 -0700 (PDT)
MIME-Version: 1.0
References: <1634278119-32158-1-git-send-email-bingbu.cao@intel.com>
 <CAAFQd5Aykfdj-HPzsQOyQpbGBRhtTsoRm78XgpuGkFUx1joTMA@mail.gmail.com> <42bab3b2-ae4b-01a6-e2ef-58b44827a917@linux.intel.com>
In-Reply-To: <42bab3b2-ae4b-01a6-e2ef-58b44827a917@linux.intel.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 13 Apr 2022 21:13:30 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Dv6FfxLNGuwe9=GzHDQoBYQ7bdBVOYXoK8Rvtc_go39g@mail.gmail.com>
Message-ID: <CAAFQd5Dv6FfxLNGuwe9=GzHDQoBYQ7bdBVOYXoK8Rvtc_go39g@mail.gmail.com>
Subject: Re: [PATCH] media: dw9768: activate runtime PM and turn off device
To:     Bingbu Cao <bingbu.cao@linux.intel.com>
Cc:     Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org,
        sakari.ailus@linux.intel.com, dongchun.zhu@mediatek.com,
        tian.shu.qiu@intel.com
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

On Wed, Apr 13, 2022 at 8:38 PM Bingbu Cao <bingbu.cao@linux.intel.com> wrote:
>
>
> On 11/5/21 2:54 PM, Tomasz Figa wrote:
> > On Fri, Oct 15, 2021 at 3:12 PM Bingbu Cao <bingbu.cao@intel.com> wrote:
> >>
> >> When dw9768 working with ACPI systems, the dw9768 was turned
> >> by i2c-core during probe, driver need activate the PM runtime
> >> and ask runtime PM to turn off the device.
> >>
> >> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> >> ---
> >>  drivers/media/i2c/dw9768.c | 6 ++++++
> >>  1 file changed, 6 insertions(+)
> >>
> >> diff --git a/drivers/media/i2c/dw9768.c b/drivers/media/i2c/dw9768.c
> >> index c086580efac7..65c6acf3ced9 100644
> >> --- a/drivers/media/i2c/dw9768.c
> >> +++ b/drivers/media/i2c/dw9768.c
> >> @@ -469,6 +469,11 @@ static int dw9768_probe(struct i2c_client *client)
> >>
> >>         dw9768->sd.entity.function = MEDIA_ENT_F_LENS;
> >>
> >> +       /*
> >> +        * Device is already turned on by i2c-core with ACPI domain PM.
> >> +        * Attempt to turn off the device to satisfy the privacy LED concerns.
> >> +        */
> >> +       pm_runtime_set_active(dev);
> >
> > This driver is used by non-ACPI systems as well. This change will make
> > the PM core not call the runtime_resume() callback provided by the
> > driver and the power would never be turned on on such systems.
>
> Tomasz,
>
> Why the runtime_set_active() and runtime_idle() break the runtime
> PM on non-ACPI systems? Did it cause the PM runtime enable failure or
> incorrect PM usage count?

Neither. It tells the runtime PM subsystem that the device was
manually brought into the active state, but the driver doesn't power
on the voltage regulators. Then there are 2 paths to failure:

1) pm_runtime_idle() triggers a runtime PM suspend and driver callback
tries to power off the already powered off regulators, leading to a
negative regulator usage count.

OR

2) userspace opens the device, runtime PM resume doesn't happen
(because the device is still active) and then a communication failure
would happen because the chip is not powered on.

Best regards,
Tomasz

>
> >
> > Wasn't the intention of Sakari's ACPI patches to allow bypassing the
> > ACPI domain power on at boot up and eliminate the need for this
> > change?
> >
> > Best regards,
> > Tomasz
> >
> >>
> >>         pm_runtime_enable(dev);
> >>         if (!pm_runtime_enabled(dev)) {
> >>                 ret = dw9768_runtime_resume(dev);
> >> @@ -483,6 +488,7 @@ static int dw9768_probe(struct i2c_client *client)
> >>                 dev_err(dev, "failed to register V4L2 subdev: %d", ret);
> >>                 goto err_power_off;
> >>         }
> >> +       pm_runtime_idle(dev);
> >>
> >>         return 0;
> >>
> >> --
> >> 2.7.4
> >>
>
> --
> Best regards,
> Bingbu Cao
