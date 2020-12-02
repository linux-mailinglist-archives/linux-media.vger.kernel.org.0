Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AAD42CB4C4
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 06:59:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725979AbgLBF7d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 00:59:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728522AbgLBF7c (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Dec 2020 00:59:32 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DC86C0613D6
        for <linux-media@vger.kernel.org>; Tue,  1 Dec 2020 21:58:46 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id u19so1824790lfr.7
        for <linux-media@vger.kernel.org>; Tue, 01 Dec 2020 21:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LJeIbs/lk8LIymIJCAqmB63bO9bX6p5OBONx6YtNBzc=;
        b=eWE3UVChExHQAIliSx9K+Q6vYusTum0/Gzjl6aVHCjAv7vD9/4wLnfSC53icsQmLU4
         w/6KLGztyd8PqHh7+cMkTNFf94kBG5XDNtFw1zp13nLpxaghsj1oiGkLl488UnXY7Vmd
         IkXfRbKqiJNBBe1zD1653bO1UFBFo8EoMFLe0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LJeIbs/lk8LIymIJCAqmB63bO9bX6p5OBONx6YtNBzc=;
        b=jkyn3Bhu2STqlWM1K9bjNQHN5+GY4S41VScqGoQDyJc5x2MMegw31XciBL7K/kc2dN
         T+TbF87l9MmJt054VEKAIN22ItD3IROj0cqPjPwbqdTnS6fAQmPTY3Re32VmZvluFC4O
         FOp37K9o6mjr3um2HG9TfiK/Fk+swg6uEnZsGFIG2teJME2ey60CVK3t4M4JW4b0pl6X
         w1KytKj33QlRs1kkPkZiJC43OWAz2atK52TBRjs+M769mOelOiRTyo7iSpvbW3F5vgEU
         XBczmfO+wo/BSASGlF2R00XBor9rvKvekjWIsaX6DiOC91xo4/Of1d+/aeuVMKLltELT
         O6xg==
X-Gm-Message-State: AOAM533VGDT9QWhZXK23buV2DXW/CF/X/6pWgQgLUme+tk7K4aYEZNY9
        FE1fTJV28pVosjn8uLAHbWhba9Kh1HYd1cML
X-Google-Smtp-Source: ABdhPJy4vmRxFuVrzgVJm5+p0MLNczydE3U4NY2WQpOZJ+lku9yqHLpyzZbciDlxAqvdtQedJWPF/w==
X-Received: by 2002:a19:6d8:: with SMTP id 207mr532489lfg.42.1606888724115;
        Tue, 01 Dec 2020 21:58:44 -0800 (PST)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id z131sm187996lfc.56.2020.12.01.21.58.42
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Dec 2020 21:58:42 -0800 (PST)
Received: by mail-lj1-f177.google.com with SMTP id 142so1310274ljj.10
        for <linux-media@vger.kernel.org>; Tue, 01 Dec 2020 21:58:42 -0800 (PST)
X-Received: by 2002:a2e:751b:: with SMTP id q27mr445428ljc.394.1606888722400;
 Tue, 01 Dec 2020 21:58:42 -0800 (PST)
MIME-Version: 1.0
References: <20201201042322.3346817-1-frkoenig@chromium.org> <57cc5999-e54c-219c-812b-71b214dbe760@linaro.org>
In-Reply-To: <57cc5999-e54c-219c-812b-71b214dbe760@linaro.org>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Wed, 2 Dec 2020 14:58:29 +0900
X-Gmail-Original-Message-ID: <CAPBb6MUU0TayGLq-Jifh1O2RfhoTjimY7GEQcqdoxQ6itybbfw@mail.gmail.com>
Message-ID: <CAPBb6MUU0TayGLq-Jifh1O2RfhoTjimY7GEQcqdoxQ6itybbfw@mail.gmail.com>
Subject: Re: [PATCH v2] venus: vdec: Handle DRC after drain
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     Fritz Koenig <frkoenig@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Dikshita Agarwal <dikshita@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Dec 2, 2020 at 7:34 AM Stanimir Varbanov
<stanimir.varbanov@linaro.org> wrote:
>
> Hi Fritz,
>
> On 12/1/20 6:23 AM, Fritz Koenig wrote:
> > If the DRC is near the end of the stream the client
> > may send a V4L2_DEC_CMD_STOP before the DRC occurs.
> > V4L2_DEC_CMD_STOP puts the driver into the
> > VENUS_DEC_STATE_DRAIN state.  DRC must be aware so
> > that after the DRC event the state can be restored
> > correctly.
> >
> > Signed-off-by: Fritz Koenig <frkoenig@chromium.org>
> > ---
> >
> > v2: remove TODO
> >
> >  drivers/media/platform/qcom/venus/core.h |  1 +
> >  drivers/media/platform/qcom/venus/vdec.c | 17 +++++++++++++++--
> >  2 files changed, 16 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> > index 2b0899bf5b05f..1680c936c06fb 100644
> > --- a/drivers/media/platform/qcom/venus/core.h
> > +++ b/drivers/media/platform/qcom/venus/core.h
> > @@ -406,6 +406,7 @@ struct venus_inst {
> >       unsigned int core_acquired: 1;
> >       unsigned int bit_depth;
> >       bool next_buf_last;
> > +     bool drain_active;
>
> Could you introduce a new codec state instead of adding a flag for such
> corner case.
>
> I think that we will need to handle at least one more corner case (DRC
> during seek operation),

Just happen to have posted a patch for that. :)

https://lkml.org/lkml/2020/12/2/24

> so then we have to introduce another flag, and
> this is not a good solution to me. These additional flags will
> complicate the state handling and will make the code readability worst
>
> I'd introduce: VENUS_DEC_STATE_DRC_DURING_DRAIN or something similar.

I'm wondering what is the best approach here. As you see in my patch,
I did not have to introduce a new state but relied instead on the
state of next_buf_last (which may or may not be correct - maybe we can
think of a way to merge both patches into one?). Flushes, either
explicit or implicitly triggered by a DRC, are more than a state by
themselves but rather an extra dimension from which other states can
still apply. I'm afraid we already have many states as it is and
adding more might add complexity.

A lot of the recent issues we had came from that number of states,
notably from the fact that not all states are always tested when they
should (and fall back to the default: branch of a switch case that
does nothing). I think we could improve the robustness of this driver
if we mandate that each state check must be done using a switch
statement without a default: branch. That would force us to ensure
that each newly introduced state is considered in every situation
where it might be relevant.

>
> >  };
> >
> >  #define IS_V1(core)  ((core)->res->hfi_version == HFI_VERSION_1XX)
> > diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> > index 5671cf3458a68..1d551b4d651a8 100644
> > --- a/drivers/media/platform/qcom/venus/vdec.c
> > +++ b/drivers/media/platform/qcom/venus/vdec.c
> > @@ -523,8 +523,10 @@ vdec_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *cmd)
> >
> >               ret = hfi_session_process_buf(inst, &fdata);
> >
> > -             if (!ret && inst->codec_state == VENUS_DEC_STATE_DECODING)
> > +             if (!ret && inst->codec_state == VENUS_DEC_STATE_DECODING) {
> >                       inst->codec_state = VENUS_DEC_STATE_DRAIN;
> > +                     inst->drain_active = true;
> > +             }
> >       }
> >
> >  unlock:
> > @@ -976,10 +978,14 @@ static int vdec_start_capture(struct venus_inst *inst)
> >
> >       inst->codec_state = VENUS_DEC_STATE_DECODING;
> >
> > +     if (inst->drain_active)
> > +             inst->codec_state = VENUS_DEC_STATE_DRAIN;
> > +
> >       inst->streamon_cap = 1;
> >       inst->sequence_cap = 0;
> >       inst->reconfig = false;
> >       inst->next_buf_last = false;
> > +     inst->drain_active = false;
> >
> >       return 0;
> >
> > @@ -1105,6 +1111,7 @@ static int vdec_stop_capture(struct venus_inst *inst)
> >               /* fallthrough */
> >       case VENUS_DEC_STATE_DRAIN:
> >               inst->codec_state = VENUS_DEC_STATE_STOPPED;
> > +             inst->drain_active = false;
> >               /* fallthrough */
> >       case VENUS_DEC_STATE_SEEK:
> >               vdec_cancel_dst_buffers(inst);
> > @@ -1304,8 +1311,10 @@ static void vdec_buf_done(struct venus_inst *inst, unsigned int buf_type,
> >
> >                       v4l2_event_queue_fh(&inst->fh, &ev);
> >
> > -                     if (inst->codec_state == VENUS_DEC_STATE_DRAIN)
> > +                     if (inst->codec_state == VENUS_DEC_STATE_DRAIN) {
> > +                             inst->drain_active = false;
> >                               inst->codec_state = VENUS_DEC_STATE_STOPPED;
> > +                     }
> >               }
> >
> >               if (!bytesused)
> > @@ -1429,9 +1438,13 @@ static void vdec_event_notify(struct venus_inst *inst, u32 event,
> >       case EVT_SYS_EVENT_CHANGE:
> >               switch (data->event_type) {
> >               case HFI_EVENT_DATA_SEQUENCE_CHANGED_SUFFICIENT_BUF_RESOURCES:
> > +                     if (inst->codec_state == VENUS_DEC_STATE_DRAIN)
> > +                             inst->codec_state = VENUS_DEC_STATE_DECODING;
>
> Could you move this state transition into vdec_event_change(). That way
> we will do it only once.
>
> >                       vdec_event_change(inst, data, true);
> >                       break;
> >               case HFI_EVENT_DATA_SEQUENCE_CHANGED_INSUFFICIENT_BUF_RESOURCES:
> > +                     if (inst->codec_state == VENUS_DEC_STATE_DRAIN)
> > +                             inst->codec_state = VENUS_DEC_STATE_DECODING;
>
> ditto
>
> >                       vdec_event_change(inst, data, false);
> >                       break;
> >               case HFI_EVENT_RELEASE_BUFFER_REFERENCE:
> >
>
> --
> regards,
> Stan
