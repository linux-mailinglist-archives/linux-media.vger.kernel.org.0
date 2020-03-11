Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FA7C180E45
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2020 04:04:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727588AbgCKDEr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 23:04:47 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:44618 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727307AbgCKDEr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 23:04:47 -0400
Received: by mail-ot1-f66.google.com with SMTP id v22so446432otq.11
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2020 20:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cc/y94pTTaN3pV5By9oa68NXOY/kGNd87nE1UcwsCUE=;
        b=RNFHOuKi34s11GpOukBh0HStpY/JN8PkOaSp4edSPraYCR+bE5H3MFExHNG70W4/ZS
         Wi6cM54wXx2o7+uvDXOeQhRwwKbb3s+IIFkbRl20jsraFa0yA2qaWHC9Ekrw2jtt6YYD
         vinjAdl2j6XWm2IjDCGcbsde3IdY4JLpR68I0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cc/y94pTTaN3pV5By9oa68NXOY/kGNd87nE1UcwsCUE=;
        b=L2QuygjEgXoJbxU61OLto7T8qNaxYqItWsQddZqTPKyju/cdJzZRLlTZFl+B4mQH/U
         DnpIHh/cRRewZ8Iu7YaShxBICEgM0vgn6BYfJSw97P7CaiXlNDjo1sCJrHwPETP3XP9p
         ojtlYRmWenVsqBKVgkS6q5nbhB54g96hLaN6AE8aCJlbm4oKXFnIOgcWabDM4diYPz1h
         MDUUNr32ws1WRXH7tqhtvygZkTrAPbg2zN0QApf5oh+f0tj42r4+nqOctZnYCeHj2IaR
         yDeMDEjLs7OKR6TYZPEFzmUkF0AIhsSLtBMduZtZ8O5j1TN3pm9lxP9oJb/4YQ9zEeLf
         goTA==
X-Gm-Message-State: ANhLgQ3hyAfZOav7/qrqR6VXNCaYqnJGQOmHOPPgPWUjim4oVXtMAj2t
        vZjiFmlYm8Vk7qnFvJ6r16JbM+tVEkc=
X-Google-Smtp-Source: ADFU+vvLfD98u5BtoU8v0r/2pVDlYjrq3+FMQ5Y0qgBoz2wo1T1OZ8fjQLwPeGB5Ou3kgU+wocj0QQ==
X-Received: by 2002:a9d:6654:: with SMTP id q20mr721701otm.180.1583895885416;
        Tue, 10 Mar 2020 20:04:45 -0700 (PDT)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com. [209.85.210.42])
        by smtp.gmail.com with ESMTPSA id k17sm5042949oic.45.2020.03.10.20.04.44
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2020 20:04:44 -0700 (PDT)
Received: by mail-ot1-f42.google.com with SMTP id 66so451197otd.9
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2020 20:04:44 -0700 (PDT)
X-Received: by 2002:a05:6830:19e2:: with SMTP id t2mr642738ott.97.1583895883624;
 Tue, 10 Mar 2020 20:04:43 -0700 (PDT)
MIME-Version: 1.0
References: <1583472756-7611-1-git-send-email-mansur@codeaurora.org>
 <CAPBb6MW-zxK+=HHUP5=+pO4Mswkhm=hDX7V56ABDm+BCzDaGHg@mail.gmail.com> <CA+ddPcNdC4r3XBd+dQmv2oHwF6MA3bTJrWZZpJthruBQR_THBA@mail.gmail.com>
In-Reply-To: <CA+ddPcNdC4r3XBd+dQmv2oHwF6MA3bTJrWZZpJthruBQR_THBA@mail.gmail.com>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Wed, 11 Mar 2020 12:04:32 +0900
X-Gmail-Original-Message-ID: <CAPBb6MVyTFqrVXAXqA6u=-0WtXcdWnozzN3gGk7y8TDK12-6Gg@mail.gmail.com>
Message-ID: <CAPBb6MVyTFqrVXAXqA6u=-0WtXcdWnozzN3gGk7y8TDK12-6Gg@mail.gmail.com>
Subject: Re: [PATCH] venus: avoid extra locking in driver
To:     Jeffrey Kardatzke <jkardatzke@google.com>
Cc:     Mansur Alisha Shaik <mansur@codeaurora.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Mar 10, 2020 at 7:07 AM Jeffrey Kardatzke <jkardatzke@google.com> wrote:
>
> On Thu, Mar 5, 2020 at 11:50 PM Alexandre Courbot <acourbot@chromium.org> wrote:
> >
> > On Fri, Mar 6, 2020 at 2:34 PM Mansur Alisha Shaik
> > <mansur@codeaurora.org> wrote:
> > >
> > > This change will avoid extra locking in driver.
> >
> > Could you elaborate a bit more on the problem that this patch solves?
>
> For us it fixes a kernel null deref that happens when we run the
> MultipleEncoders test (I've verified this to be true).
>
> >
> > >
> > > Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
> > > ---
> > >  drivers/media/platform/qcom/venus/core.c       |  2 +-
> > >  drivers/media/platform/qcom/venus/core.h       |  2 +-
> > >  drivers/media/platform/qcom/venus/helpers.c    | 11 +++++++++--
> > >  drivers/media/platform/qcom/venus/pm_helpers.c |  8 ++++----
> > >  4 files changed, 15 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> > > index 194b10b9..75d38b8 100644
> > > --- a/drivers/media/platform/qcom/venus/core.c
> > > +++ b/drivers/media/platform/qcom/venus/core.c
> > > @@ -447,7 +447,7 @@ static const struct freq_tbl sdm845_freq_table[] = {
> > >         {  244800, 100000000 }, /* 1920x1080@30 */
> > >  };
> > >
> > > -static struct codec_freq_data sdm845_codec_freq_data[] =  {
> > > +static const struct codec_freq_data sdm845_codec_freq_data[] =  {
> > >         { V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_ENC, 675, 10 },
> > >         { V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_ENC, 675, 10 },
> > >         { V4L2_PIX_FMT_VP8, VIDC_SESSION_TYPE_ENC, 675, 10 },
> > > diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> > > index ab7c360..8c8d0e9 100644
> > > --- a/drivers/media/platform/qcom/venus/core.h
> > > +++ b/drivers/media/platform/qcom/venus/core.h
> > > @@ -245,7 +245,7 @@ struct venus_buffer {
> > >  struct clock_data {
> > >         u32 core_id;
> > >         unsigned long freq;
> > > -       const struct codec_freq_data *codec_freq_data;
> > > +       struct codec_freq_data codec_freq_data;
> > >  };
> > >
> > >  #define to_venus_buffer(ptr)   container_of(ptr, struct venus_buffer, vb)
> > > diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
> > > index bcc6038..550c4ff 100644
> > > --- a/drivers/media/platform/qcom/venus/helpers.c
> > > +++ b/drivers/media/platform/qcom/venus/helpers.c
> > > @@ -807,6 +807,7 @@ int venus_helper_init_codec_freq_data(struct venus_inst *inst)
> > >         unsigned int i, data_size;
> > >         u32 pixfmt;
> > >         int ret = 0;
> > > +       bool found = false;
> > >
> > >         if (!IS_V4(inst->core))
> > >                 return 0;
> > > @@ -816,16 +817,22 @@ int venus_helper_init_codec_freq_data(struct venus_inst *inst)
> > >         pixfmt = inst->session_type == VIDC_SESSION_TYPE_DEC ?
> > >                         inst->fmt_out->pixfmt : inst->fmt_cap->pixfmt;
> > >
> > > +       memset(&inst->clk_data.codec_freq_data, 0,
> > > +               sizeof(inst->clk_data.codec_freq_data));
> > > +
> > >         for (i = 0; i < data_size; i++) {
> > >                 if (data[i].pixfmt == pixfmt &&
> > >                     data[i].session_type == inst->session_type) {
> > > -                       inst->clk_data.codec_freq_data = &data[i];
> > > +                       inst->clk_data.codec_freq_data = data[i];
> >
> > From the patch I'd infer that inst->clk_data.codec_freq_data needs to
> > change at runtime. Is this what happens? Why? I'd expect that
> > frequency tables remain constant, and thus that the global
> > sdm845_codec_freq_data can remain constant while
> > clock_data::codec_freq_data is a const reference to it. What prevents
> > this from happening?
> >
> > > +                       found = true;
> > >                         break;
> > >                 }
> > >         }
> > >
> > > -       if (!inst->clk_data.codec_freq_data)
> > > +       if (!found) {
> > > +               dev_err(inst->core->dev, "cannot find codec freq data\n");
> > >                 ret = -EINVAL;
> > > +       }
> > >
> > >         return ret;
> > >  }
> > > diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
> > > index abf9315..240845e 100644
> > > --- a/drivers/media/platform/qcom/venus/pm_helpers.c
> > > +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
> > > @@ -496,7 +496,7 @@ min_loaded_core(struct venus_inst *inst, u32 *min_coreid, u32 *min_load)
> > >         list_for_each_entry(inst_pos, &core->instances, list) {
> > >                 if (inst_pos == inst)
> > >                         continue;
> > > -               vpp_freq = inst_pos->clk_data.codec_freq_data->vpp_freq;
> > > +               vpp_freq = inst_pos->clk_data.codec_freq_data.vpp_freq;
>
> This is the main thing it fixes (this is where the null deref occurs).
> If there's multiple instances in use and the other instance hasn't
> populated the codec_freq_data pointer then we'll hit a null deref
> here.

Couldn't this be fixed by checking the pointer for NULL here or
(probably better) populating codec_freq_data earlier so that it is
always valid?

This fix looks like it is replacing a NULL pointer dereference with
access to data initialized to fallback values (which may or may not be
meaningful), and I don't see the need to copy what is effectively
constant data into each instance.
