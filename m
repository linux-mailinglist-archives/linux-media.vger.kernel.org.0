Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B6482BC975
	for <lists+linux-media@lfdr.de>; Sun, 22 Nov 2020 22:05:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727717AbgKVVF3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 22 Nov 2020 16:05:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727584AbgKVVF2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 22 Nov 2020 16:05:28 -0500
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E364C0613D3
        for <linux-media@vger.kernel.org>; Sun, 22 Nov 2020 13:05:28 -0800 (PST)
Received: by mail-ej1-x643.google.com with SMTP id o21so20502981ejb.3
        for <linux-media@vger.kernel.org>; Sun, 22 Nov 2020 13:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6XSzxVxeSbH/63gH8EnsEI8ptPxCrAwPCCJTogBMOdI=;
        b=GDxmTI+dpzXEMaq5v/HKs4J2pNx+qzMUhEcGM1qPzNYvXPNM3Bu4rGEHRZRB1nsHmO
         qRs9Lly6XuyfjddXAbOTtZwcJVjldVaobF9AUI10EI3Zfeau0C0ZngnLzh0CZJ6P7JZn
         dy2NGzlpAlj4mjE1oDc+2G5k64KNktlWLNpMs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6XSzxVxeSbH/63gH8EnsEI8ptPxCrAwPCCJTogBMOdI=;
        b=qNlEUTqfrSb3K02QIUHckUd8avJZ+Uh6VMSibRG+NCnGJ12kGa0SYLK/pCFliBLlMn
         BT+Umr+MAqFNk0lp6SVMkX8CtNUwycsuYtgC39V0pfLo/6zXdxXUCaeto36WyG8GJIVO
         THmGRBaamxKYtIVk9Ytveb1JPIQ12MfZ/1P9JqYxOgDI0GwpbnwdJP0E7ONuxEVIU02S
         y7c+QWb6vArIpnz3XZ75iD4LFr6Ns1YEJrlGkOJIbl3T+ptLNOMegNsFj+fNG5B5+nWf
         uD4KAoGsHqopI5nRFTGcUrF/eajOH1Xr73pLuNQoUJwhVYrZdTjKTu7nrw50B87BufLn
         BhqA==
X-Gm-Message-State: AOAM533VgC0kX2adFKOFFPUqR89OiRufqNUG0Cf0vMxnVT9rR6DKF3qA
        Hg/i3tlFVMGuNlcF1eEOlGnaclPyLWVmdA==
X-Google-Smtp-Source: ABdhPJw/84WrI8BWCi4aIM3GhhIo/o1gsAgXXyvt+i70X8L5yrf9G2wUDhnBXs/V7ju4wC6Q7JJLpg==
X-Received: by 2002:a17:906:76d3:: with SMTP id q19mr40356071ejn.162.1606079126796;
        Sun, 22 Nov 2020 13:05:26 -0800 (PST)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com. [209.85.221.53])
        by smtp.gmail.com with ESMTPSA id n22sm3964977edr.11.2020.11.22.13.05.25
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2020 13:05:25 -0800 (PST)
Received: by mail-wr1-f53.google.com with SMTP id 64so3235651wra.11
        for <linux-media@vger.kernel.org>; Sun, 22 Nov 2020 13:05:25 -0800 (PST)
X-Received: by 2002:adf:f9c6:: with SMTP id w6mr26892919wrr.273.1606079125259;
 Sun, 22 Nov 2020 13:05:25 -0800 (PST)
MIME-Version: 1.0
References: <20201120001037.10032-1-stanimir.varbanov@linaro.org>
 <20201120001037.10032-3-stanimir.varbanov@linaro.org> <CAMfZQbwjRTuF7_joa9sL0HLTkFC70FqymPOmtxmETt38qey+NA@mail.gmail.com>
 <88838aa8-9c25-3fae-86dd-35b2a3df83d9@linaro.org>
In-Reply-To: <88838aa8-9c25-3fae-86dd-35b2a3df83d9@linaro.org>
From:   Fritz Koenig <frkoenig@chromium.org>
Date:   Sun, 22 Nov 2020 13:05:12 -0800
X-Gmail-Original-Message-ID: <CAMfZQbwF185dghLACYEktQiYDJXv+GHynsHrt1sq_qCZH7yC9w@mail.gmail.com>
Message-ID: <CAMfZQbwF185dghLACYEktQiYDJXv+GHynsHrt1sq_qCZH7yC9w@mail.gmail.com>
Subject: Re: [PATCH 2/3] venus: Limit HFI sessions to the maximum supported
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     Fritz Koenig <frkoenig@chromium.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Dikshita Agarwal <dikshita@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Nov 22, 2020 at 6:48 AM Stanimir Varbanov
<stanimir.varbanov@linaro.org> wrote:
>
>
>
> On 11/21/20 3:14 AM, Fritz Koenig wrote:
> > On Thu, Nov 19, 2020 at 4:12 PM Stanimir Varbanov
> > <stanimir.varbanov@linaro.org> wrote:
> >>
> >> Currently we rely on firmware to return error when we reach the maximum
> >> supported number of sessions. But this errors are happened at reqbuf
> >> time which is a bit later. The more reasonable way looks like is to
> >> return the error on driver open.
> >>
> >> To achieve that modify hfi_session_create to return error when we reach
> >> maximum count of sessions and thus refuse open.
> >>
> >> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> >> ---
> >>  drivers/media/platform/qcom/venus/core.h      |  1 +
> >>  drivers/media/platform/qcom/venus/hfi.c       | 19 +++++++++++++++----
> >>  .../media/platform/qcom/venus/hfi_parser.c    |  3 +++
> >>  3 files changed, 19 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> >> index db0e6738281e..3a477fcdd3a8 100644
> >> --- a/drivers/media/platform/qcom/venus/core.h
> >> +++ b/drivers/media/platform/qcom/venus/core.h
> >> @@ -96,6 +96,7 @@ struct venus_format {
> >>  #define MAX_CAP_ENTRIES                32
> >>  #define MAX_ALLOC_MODE_ENTRIES 16
> >>  #define MAX_CODEC_NUM          32
> >> +#define MAX_SESSIONS           16
> >>
> >>  struct raw_formats {
> >>         u32 buftype;
> >> diff --git a/drivers/media/platform/qcom/venus/hfi.c b/drivers/media/platform/qcom/venus/hfi.c
> >> index 638ed5cfe05e..8420be6d3991 100644
> >> --- a/drivers/media/platform/qcom/venus/hfi.c
> >> +++ b/drivers/media/platform/qcom/venus/hfi.c
> >> @@ -175,6 +175,7 @@ static int wait_session_msg(struct venus_inst *inst)
> >>  int hfi_session_create(struct venus_inst *inst, const struct hfi_inst_ops *ops)
> >>  {
> >>         struct venus_core *core = inst->core;
> >> +       int ret;
> >>
> >>         if (!ops)
> >>                 return -EINVAL;
> >> @@ -183,12 +184,22 @@ int hfi_session_create(struct venus_inst *inst, const struct hfi_inst_ops *ops)
> >>         init_completion(&inst->done);
> >>         inst->ops = ops;
> >>
> >> -       mutex_lock(&core->lock);
> >> -       list_add_tail(&inst->list, &core->instances);
> >> -       atomic_inc(&core->insts_count);
> >> +       ret = mutex_lock_interruptible(&core->lock);
> >> +       if (ret)
> >> +               return ret;
> >> +
> >> +       ret = atomic_read(&core->insts_count);
> >> +       if (ret + 1 > core->max_sessions_supported) {
> >> +               ret = -EAGAIN;
> >> +       } else {
> >> +               atomic_inc(&core->insts_count);
> >> +               list_add_tail(&inst->list, &core->instances);
> >> +               ret = 0;
> >> +       }
> >> +
> >>         mutex_unlock(&core->lock);
> >>
> >> -       return 0;
> >> +       return ret;
> >>  }
> >>  EXPORT_SYMBOL_GPL(hfi_session_create);
> >>
> >> diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
> >> index 363ee2a65453..52898633a8e6 100644
> >> --- a/drivers/media/platform/qcom/venus/hfi_parser.c
> >> +++ b/drivers/media/platform/qcom/venus/hfi_parser.c
> >> @@ -276,6 +276,9 @@ u32 hfi_parser(struct venus_core *core, struct venus_inst *inst, void *buf,
> >>                 words_count--;
> >>         }
> >>
> >
> > My understanding of the hardware is that there is a max number of
> > macroblocks that can be worked on at a time.  That works out to
> > nominally 16 clips.  But large clips can take more resources.  Does
> > |max_sessions_supported| get updated with the amount that system can
> > use?  Or is it always a constant?
>
> The number of max sessions supported is constant.
>
> >
> > If it changes depending on system load, then couldn't
> > be 0 if all of the resources have been
> > used up?  If that is the case then the below check would appear to be
> > incorrect.
>
> No, this is not the case. Changing dynamically the number of max
> sessions depending on session load is possible but it would be complex
> to implement. For example, think of decoder dynamic resolution change
> where we don't know in advance the new resolution (session load).
>

Sorry, I should have been more specific.  The complexity of
dynamically changing the max sessions did not seem to be captured in
the patch, so I wanted to make sure that
|core->max_sessions_supported| was constant.  As it is constant, then
this patch looks to capture everything.

Reviewed-by: Fritz Koenig <frkoenig@chromium.org>
> >
> >> +       if (!core->max_sessions_supported)
> >> +               core->max_sessions_supported = MAX_SESSIONS;
> >> +
> >>         parser_fini(inst, codecs, domain);
> >>
> >>         return HFI_ERR_NONE;
> >> --
> >> 2.17.1
> >>
>
> --
> regards,
> Stan
