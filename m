Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DC7C2C5EAF
	for <lists+linux-media@lfdr.de>; Fri, 27 Nov 2020 03:14:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392197AbgK0CND (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Nov 2020 21:13:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392194AbgK0CNC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Nov 2020 21:13:02 -0500
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B307CC0617A7
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2020 18:13:01 -0800 (PST)
Received: by mail-lf1-x141.google.com with SMTP id t6so4931137lfl.13
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2020 18:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/eNhfk0VtDd+YiJMUZkSRIS5osu6fNSDMA8H+TWC/zA=;
        b=bl+HWiLDeGayMZKu/fKC/3E3juoTm3eppN83bqdNIvxclFQG1TNdsmEiIJ5lsByXj8
         7ECHPRhbYKpI0etQGaucIO3dl7gxM0C4DyY7zeiU9rZNSnxrmI0YLnI1RyNDXAG8L7qz
         EHYgENr+pRqO2Bu5ZO5Hn5/Cc44fMokfhCP/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/eNhfk0VtDd+YiJMUZkSRIS5osu6fNSDMA8H+TWC/zA=;
        b=qb05Q95AT9qlmBY65phzqYucQZcHWb07JTtNVwD8MMPjhw5zgzH/glb044uHqAkmW/
         va1g3UXxV/x9gs32NEvHfFDl1lugVmZMMZxSmwp20MFsKP0UC4HQoIuhzlf+rgY4I/Gt
         xpIzqZ7h8IEkoKk1LsBhW6CKRrKO9qL+JB+a9Omn3DvQABpaFMd9xV8apJCL0CoS+Gsq
         WDtpk4FoepMdL5FA8E5UGEugkIefFuLVgPqgcg2P1tnNTqxqlh+f/CiHITk4VZkGG6j7
         9Bb4eXeiyCeCKu6GlPX7unfeSOKTHZ2x0/+EO4A90pkIMeiq7n9OI5T+TKmYdAEVGOI/
         WXmQ==
X-Gm-Message-State: AOAM533sPcePQaxNuEqrsKiqN+jsHeOnOSYcO4YnIMMWDSaFgwfRwKFR
        U65Bde91meghV7b67pOBubxyKfeZOcXiQ8QU
X-Google-Smtp-Source: ABdhPJxpDOEu6swEEq9WlXJS2qQIZykys4FQhXFICE8iF4xJSiqtcgbmeRcG9ItOwElYgKPKKYT6EA==
X-Received: by 2002:a05:6512:3329:: with SMTP id l9mr2383394lfe.127.1606443179575;
        Thu, 26 Nov 2020 18:12:59 -0800 (PST)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id b76sm515278lfg.13.2020.11.26.18.12.57
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2020 18:12:58 -0800 (PST)
Received: by mail-lf1-f49.google.com with SMTP id j205so4970358lfj.6
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2020 18:12:57 -0800 (PST)
X-Received: by 2002:a19:7f55:: with SMTP id a82mr2315035lfd.603.1606443177151;
 Thu, 26 Nov 2020 18:12:57 -0800 (PST)
MIME-Version: 1.0
References: <20201120001037.10032-1-stanimir.varbanov@linaro.org>
 <20201120001037.10032-3-stanimir.varbanov@linaro.org> <CAPBb6MUnXmtSKy9NwikYXjafgB+WM9TKEFjkYK16T2V7KRx=JQ@mail.gmail.com>
 <8c6231b2-61c2-d432-aa47-ddc29de8da19@linaro.org> <CAPBb6MXRat0g_+d04eoOL9Vpbv-2iJfqdOkzGB17=yjRMeVWXQ@mail.gmail.com>
 <59068381-43e4-559b-faa0-0e177de541f9@linaro.org>
In-Reply-To: <59068381-43e4-559b-faa0-0e177de541f9@linaro.org>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Fri, 27 Nov 2020 11:12:44 +0900
X-Gmail-Original-Message-ID: <CAPBb6MVek8vSBTTdu0it2pk7XXdqxGvkf9C5viXxwAmaWeDi=A@mail.gmail.com>
Message-ID: <CAPBb6MVek8vSBTTdu0it2pk7XXdqxGvkf9C5viXxwAmaWeDi=A@mail.gmail.com>
Subject: Re: [PATCH 2/3] venus: Limit HFI sessions to the maximum supported
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Dikshita Agarwal <dikshita@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Nov 27, 2020 at 7:42 AM Stanimir Varbanov
<stanimir.varbanov@linaro.org> wrote:
>
>
>
> On 11/26/20 8:28 AM, Alexandre Courbot wrote:
> > On Wed, Nov 25, 2020 at 10:01 PM Stanimir Varbanov
> > <stanimir.varbanov@linaro.org> wrote:
> >>
> >>
> >>
> >> On 11/25/20 5:46 AM, Alexandre Courbot wrote:
> >>> On Fri, Nov 20, 2020 at 9:12 AM Stanimir Varbanov
> >>> <stanimir.varbanov@linaro.org> wrote:
> >>>>
> >>>> Currently we rely on firmware to return error when we reach the maximum
> >>>> supported number of sessions. But this errors are happened at reqbuf
> >>>> time which is a bit later. The more reasonable way looks like is to
> >>>> return the error on driver open.
> >>>>
> >>>> To achieve that modify hfi_session_create to return error when we reach
> >>>> maximum count of sessions and thus refuse open.
> >>>>
> >>>> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> >>>> ---
> >>>>  drivers/media/platform/qcom/venus/core.h      |  1 +
> >>>>  drivers/media/platform/qcom/venus/hfi.c       | 19 +++++++++++++++----
> >>>>  .../media/platform/qcom/venus/hfi_parser.c    |  3 +++
> >>>>  3 files changed, 19 insertions(+), 4 deletions(-)
> >>>>
> >>>> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> >>>> index db0e6738281e..3a477fcdd3a8 100644
> >>>> --- a/drivers/media/platform/qcom/venus/core.h
> >>>> +++ b/drivers/media/platform/qcom/venus/core.h
> >>>> @@ -96,6 +96,7 @@ struct venus_format {
> >>>>  #define MAX_CAP_ENTRIES                32
> >>>>  #define MAX_ALLOC_MODE_ENTRIES 16
> >>>>  #define MAX_CODEC_NUM          32
> >>>> +#define MAX_SESSIONS           16
> >>>>
> >>>>  struct raw_formats {
> >>>>         u32 buftype;
> >>>> diff --git a/drivers/media/platform/qcom/venus/hfi.c b/drivers/media/platform/qcom/venus/hfi.c
> >>>> index 638ed5cfe05e..8420be6d3991 100644
> >>>> --- a/drivers/media/platform/qcom/venus/hfi.c
> >>>> +++ b/drivers/media/platform/qcom/venus/hfi.c
> >>>> @@ -175,6 +175,7 @@ static int wait_session_msg(struct venus_inst *inst)
> >>>>  int hfi_session_create(struct venus_inst *inst, const struct hfi_inst_ops *ops)
> >>>>  {
> >>>>         struct venus_core *core = inst->core;
> >>>> +       int ret;
> >>>>
> >>>>         if (!ops)
> >>>>                 return -EINVAL;
> >>>> @@ -183,12 +184,22 @@ int hfi_session_create(struct venus_inst *inst, const struct hfi_inst_ops *ops)
> >>>>         init_completion(&inst->done);
> >>>>         inst->ops = ops;
> >>>>
> >>>> -       mutex_lock(&core->lock);
> >>>> -       list_add_tail(&inst->list, &core->instances);
> >>>> -       atomic_inc(&core->insts_count);
> >>>> +       ret = mutex_lock_interruptible(&core->lock);
> >>>> +       if (ret)
> >>>> +               return ret;
> >>>
> >>> Why do we change to mutex_lock_interruptible() here? This makes this
> >>
> >> Because mutex_lock_interruptible is preferable in kernel docs, but I
> >> agree that changing mutex_lock with mutex_lock_interruptible should be
> >> subject of another lock related patches. I will drop this in next patch
> >> version.
> >>
> >>> function return an error even though we could obtain the lock just by
> >>> trying a bit harder.
> >>
> >> I didn't get that. The behavior of mutex_lock_interruptible is that same
> >> as mutex_lock, i.e. the it will sleep to acquire the lock. The
> >> difference is that the sleep could be interrupted by a signal. You might
> >> think about mutex_trylock?
> >
> > Unless that mutex can be held by someone else for a rather long time
> > (i.e. to the point where we may want to give priority to signals when
> > userspace opens the device, since that's where hfi_session_create() is
> > called), I am not convinced this change is necessary? It may confuse
>
> Exactly, if there is a case where the core->lock is taken (firmware
> recovery) and it is not unlocked for very long time (deadlock?) then
> client process cannot be interrupted with a signal.
>
> > userspace into thinking there was a serious error while there is none.
>
> The client should be able to handle EINTR, right?
>
> > Granted, userspace should manage this case, and from what I can see
> > this code is correct, but I'm not sure we would gain anything by
> > adding this extra complexity.
>
> The benefit is that if something wrong is happening in the driver the
> client process will be killable.

Ack, that definitely makes sense in that context, even though it
should probably be done separately from this patch series. :)

Cheers,
Alex.
