Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 038191C0E7C
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2020 09:10:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728323AbgEAHKE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 May 2020 03:10:04 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:21337 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728212AbgEAHKD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 1 May 2020 03:10:03 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588317003; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=zcBluhNmFPkLnjCjr7nikLWqbgufm1+ph5PULjOcjyg=;
 b=OSLbge8NWuSQ04Ot9qQF/QPWL8EI1hWpqPq5FyKcJQ0Jl9lco7EznctbqVDfzQT3Ku07LgLT
 DhmPG3boFXHJJ20HvpBCfOAfHzreK2xTgvcYOOJIX4jW2XuuBw6MVsjFOYhMmrEtAkU+iuFX
 OZJ4CFgJ7/9zXDtlB0sOU0ouQFE=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eabcb41.7f793e9157d8-smtp-out-n03;
 Fri, 01 May 2020 07:09:53 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 064F5C433D2; Fri,  1 May 2020 07:09:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: mansur)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0CC32C433F2;
        Fri,  1 May 2020 07:09:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 01 May 2020 12:39:52 +0530
From:   mansur@codeaurora.org
To:     Alexandre Courbot <acourbot@chromium.org>
Cc:     Jeffrey Kardatzke <jkardatzke@google.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>
Subject: Re: [PATCH] venus: avoid extra locking in driver
In-Reply-To: <CAPBb6MVyTFqrVXAXqA6u=-0WtXcdWnozzN3gGk7y8TDK12-6Gg@mail.gmail.com>
References: <1583472756-7611-1-git-send-email-mansur@codeaurora.org>
 <CAPBb6MW-zxK+=HHUP5=+pO4Mswkhm=hDX7V56ABDm+BCzDaGHg@mail.gmail.com>
 <CA+ddPcNdC4r3XBd+dQmv2oHwF6MA3bTJrWZZpJthruBQR_THBA@mail.gmail.com>
 <CAPBb6MVyTFqrVXAXqA6u=-0WtXcdWnozzN3gGk7y8TDK12-6Gg@mail.gmail.com>
Message-ID: <291577a66d4f7b1262a7154f6274211a@codeaurora.org>
X-Sender: mansur@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> On 2020-03-11 08:34, Alexandre Courbot wrote:
>> On Tue, Mar 10, 2020 at 7:07 AM Jeffrey Kardatzke 
>> <jkardatzke@google.com> wrote:
>>> 
>>> On Thu, Mar 5, 2020 at 11:50 PM Alexandre Courbot 
>>> <acourbot@chromium.org> wrote:
>>> >
>>> > On Fri, Mar 6, 2020 at 2:34 PM Mansur Alisha Shaik
>>> > <mansur@codeaurora.org> wrote:
>>> > >
>>> > > This change will avoid extra locking in driver.
>>> >
>>> > Could you elaborate a bit more on the problem that this patch solves?
>>> 
>>> For us it fixes a kernel null deref that happens when we run the
>>> MultipleEncoders test (I've verified this to be true).
>>> 
>>> >
>>> > >
>>> > > Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
>>> > > ---
>>> > >  drivers/media/platform/qcom/venus/core.c       |  2 +-
>>> > >  drivers/media/platform/qcom/venus/core.h       |  2 +-
>>> > >  drivers/media/platform/qcom/venus/helpers.c    | 11 +++++++++--
>>> > >  drivers/media/platform/qcom/venus/pm_helpers.c |  8 ++++----
>>> > >  4 files changed, 15 insertions(+), 8 deletions(-)
>>> > >
>>> > > diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
>>> > > index 194b10b9..75d38b8 100644
>>> > > --- a/drivers/media/platform/qcom/venus/core.c
>>> > > +++ b/drivers/media/platform/qcom/venus/core.c
>>> > > @@ -447,7 +447,7 @@ static const struct freq_tbl sdm845_freq_table[] = {
>>> > >         {  244800, 100000000 }, /* 1920x1080@30 */
>>> > >  };
>>> > >
>>> > > -static struct codec_freq_data sdm845_codec_freq_data[] =  {
>>> > > +static const struct codec_freq_data sdm845_codec_freq_data[] =  {
>>> > >         { V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_ENC, 675, 10 },
>>> > >         { V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_ENC, 675, 10 },
>>> > >         { V4L2_PIX_FMT_VP8, VIDC_SESSION_TYPE_ENC, 675, 10 },
>>> > > diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
>>> > > index ab7c360..8c8d0e9 100644
>>> > > --- a/drivers/media/platform/qcom/venus/core.h
>>> > > +++ b/drivers/media/platform/qcom/venus/core.h
>>> > > @@ -245,7 +245,7 @@ struct venus_buffer {
>>> > >  struct clock_data {
>>> > >         u32 core_id;
>>> > >         unsigned long freq;
>>> > > -       const struct codec_freq_data *codec_freq_data;
>>> > > +       struct codec_freq_data codec_freq_data;
>>> > >  };
>>> > >
>>> > >  #define to_venus_buffer(ptr)   container_of(ptr, struct venus_buffer, vb)
>>> > > diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
>>> > > index bcc6038..550c4ff 100644
>>> > > --- a/drivers/media/platform/qcom/venus/helpers.c
>>> > > +++ b/drivers/media/platform/qcom/venus/helpers.c
>>> > > @@ -807,6 +807,7 @@ int venus_helper_init_codec_freq_data(struct venus_inst *inst)
>>> > >         unsigned int i, data_size;
>>> > >         u32 pixfmt;
>>> > >         int ret = 0;
>>> > > +       bool found = false;
>>> > >
>>> > >         if (!IS_V4(inst->core))
>>> > >                 return 0;
>>> > > @@ -816,16 +817,22 @@ int venus_helper_init_codec_freq_data(struct venus_inst *inst)
>>> > >         pixfmt = inst->session_type == VIDC_SESSION_TYPE_DEC ?
>>> > >                         inst->fmt_out->pixfmt : inst->fmt_cap->pixfmt;
>>> > >
>>> > > +       memset(&inst->clk_data.codec_freq_data, 0,
>>> > > +               sizeof(inst->clk_data.codec_freq_data));
>>> > > +
>>> > >         for (i = 0; i < data_size; i++) {
>>> > >                 if (data[i].pixfmt == pixfmt &&
>>> > >                     data[i].session_type == inst->session_type) {
>>> > > -                       inst->clk_data.codec_freq_data = &data[i];
>>> > > +                       inst->clk_data.codec_freq_data = data[i];
>>> >
>>> > From the patch I'd infer that inst->clk_data.codec_freq_data needs to
>>> > change at runtime. Is this what happens? Why? I'd expect that
>>> > frequency tables remain constant, and thus that the global
>>> > sdm845_codec_freq_data can remain constant while
>>> > clock_data::codec_freq_data is a const reference to it. What prevents
>>> > this from happening?
>>> >
>>> > > +                       found = true;
>>> > >                         break;
>>> > >                 }
>>> > >         }
>>> > >
>>> > > -       if (!inst->clk_data.codec_freq_data)
>>> > > +       if (!found) {
>>> > > +               dev_err(inst->core->dev, "cannot find codec freq data\n");
>>> > >                 ret = -EINVAL;
>>> > > +       }
>>> > >
>>> > >         return ret;
>>> > >  }
>>> > > diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
>>> > > index abf9315..240845e 100644
>>> > > --- a/drivers/media/platform/qcom/venus/pm_helpers.c
>>> > > +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
>>> > > @@ -496,7 +496,7 @@ min_loaded_core(struct venus_inst *inst, u32 *min_coreid, u32 *min_load)
>>> > >         list_for_each_entry(inst_pos, &core->instances, list) {
>>> > >                 if (inst_pos == inst)
>>> > >                         continue;
>>> > > -               vpp_freq = inst_pos->clk_data.codec_freq_data->vpp_freq;
>>> > > +               vpp_freq = inst_pos->clk_data.codec_freq_data.vpp_freq;
>>> 
>>> This is the main thing it fixes (this is where the null deref 
>>> occurs).
>>> If there's multiple instances in use and the other instance hasn't
>>> populated the codec_freq_data pointer then we'll hit a null deref
>>> here.
>> 
>> Couldn't this be fixed by checking the pointer for NULL here or
>> (probably better) populating codec_freq_data earlier so that it is
>> always valid?

This can be fix by checking for NULL pointer as well, this looks like 
masking the actual issue.
Currently we are considering the instances which are available
in core->inst list for load calculation in min_loaded_core()
function, but this is incorrect because by the time we call
decide_core() for second instance, the third instance not
filled yet codec_freq_data pointer.

So we consider the instances for load calculation for those session has 
started.
and uploaded V2 version https://lore.kernel.org/patchwork/patch/1234136/ 
for the same.

>> This fix looks like it is replacing a NULL pointer dereference with
>> access to data initialized to fallback values (which may or may not be
>> meaningful), and I don't see the need to copy what is effectively
>> constant data into each instance.
