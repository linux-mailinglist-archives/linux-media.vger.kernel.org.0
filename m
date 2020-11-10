Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4D932AD3F2
	for <lists+linux-media@lfdr.de>; Tue, 10 Nov 2020 11:40:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730239AbgKJKkW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Nov 2020 05:40:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726219AbgKJKkV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Nov 2020 05:40:21 -0500
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63D51C0613CF
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2020 02:40:21 -0800 (PST)
Received: by mail-ej1-x643.google.com with SMTP id o9so16860136ejg.1
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2020 02:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h1CiCaWNTDTWaZ9Bu49enQinQUFWYt7Tgp79S2fH2C4=;
        b=ELLMJUYViEjvWsM+mCbJHlfbYk54gs4RGAAc9PI6+oRdmmuOrgVidJ4GzKO7OO/2H/
         XZOe9aPCmYVVELkPMS6PDmTj4bTnD11Mw/BE6lrwrfc1XDaC4K50y8A+K+Z9FmdYjlri
         5/zDzpdxphlsnEng/97VAWFMkvmIMOzSMoL1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h1CiCaWNTDTWaZ9Bu49enQinQUFWYt7Tgp79S2fH2C4=;
        b=NCTP70z9I48EByobXgasmPYBEfNFPFVylHxmXXmPl7HUnV83DHjDO/0a22wls4S9J/
         0FuDh4VJ83H0fyywa1LU/08dcxTX4uVwx0T8zuKayh2le65kFrlIIkRLmx19RO7gsmRq
         gM51zB26PhowJ8QkHq3f5Fi0FYiQ3WOFMFR6cNtuXclXpuad7ZnXba/tF45lWZv5+mtO
         iwh3d6urE4zSWOBOsw1H85fdD5Zhv7056jT50xwNwLZT79BWTOeEy6SUBVUf9jZR5Kwe
         pB9AlP44A3zxofY5B7c/JO2uyrHbo3Ec28BHaQ8aZsEdVcYfKJir6u6jRxr4V+vNOaV4
         fnSQ==
X-Gm-Message-State: AOAM533SIHj6srS5iJOM6dmq/uPhj84UKhujV4mgTmvcq0Yn5onOxCB6
        4K7Dvee8b8HgiL3PVrkjexWMeroAhNi3JFzK
X-Google-Smtp-Source: ABdhPJyfBQCNy8rLv6VlUdiXkcNhIfTx4xsMyde4Fj9+9YkR/rFBPFCjgM1EUlRB6EqMSiF8gf4OCg==
X-Received: by 2002:a17:906:b01:: with SMTP id u1mr15138992ejg.427.1605004819697;
        Tue, 10 Nov 2020 02:40:19 -0800 (PST)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com. [209.85.221.42])
        by smtp.gmail.com with ESMTPSA id f16sm10186861edc.44.2020.11.10.02.40.18
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2020 02:40:18 -0800 (PST)
Received: by mail-wr1-f42.google.com with SMTP id r17so8198464wrw.1
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2020 02:40:18 -0800 (PST)
X-Received: by 2002:adf:ed11:: with SMTP id a17mr8446143wro.197.1605004817647;
 Tue, 10 Nov 2020 02:40:17 -0800 (PST)
MIME-Version: 1.0
References: <20200922113402.12442-1-dafna.hirschfeld@collabora.com>
 <20200922113402.12442-7-dafna.hirschfeld@collabora.com> <20200925204222.GG3607091@chromium.org>
 <bebacafe-11bb-5d9a-f889-4d16bb5d1817@collabora.com> <CAAFQd5BeWOYadUU8nBtFpaA5Eb2T0qFk0kDVf9eYmYzXJj+sZA@mail.gmail.com>
 <d6b893e1-1177-ba6d-0499-a3e45f79503b@collabora.com>
In-Reply-To: <d6b893e1-1177-ba6d-0499-a3e45f79503b@collabora.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 10 Nov 2020 19:40:06 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BWAuzRMCDhYGAtBW-J61k81a-J-MXWgC7fD7kEne4sTg@mail.gmail.com>
Message-ID: <CAAFQd5BWAuzRMCDhYGAtBW-J61k81a-J-MXWgC7fD7kEne4sTg@mail.gmail.com>
Subject: Re: [PATCH v3 06/12] media: staging: rkisp1: remove atomic operations
 for frame sequence
To:     Helen Koike <helen.koike@collabora.com>
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@collabora.com,
        Dafna Hirschfeld <dafna3@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Helen,

On Fri, Nov 6, 2020 at 11:43 PM Helen Koike <helen.koike@collabora.com> wrote:
>
> Hi Tomasz,
>
> (sorry for not had replied this earlier)
>
> On 10/2/20 12:30 PM, Tomasz Figa wrote:
> > On Fri, Oct 2, 2020 at 11:16 AM Dafna Hirschfeld
> > <dafna.hirschfeld@collabora.com> wrote:
> >>
> >> Hi,
> >>
> >> Am 25.09.20 um 22:42 schrieb Tomasz Figa:
> >>> Hi Dafna,
> >>>
> >>> On Tue, Sep 22, 2020 at 01:33:56PM +0200, Dafna Hirschfeld wrote:
> >>>> The isp.frame_sequence is now read only from the irq handlers
> >>>> that are all fired from the same interrupt, so there is not need
> >>>> for atomic operation.
> >>>> In addition, the frame seq incrementation is moved from
> >>>> rkisp1_isp_queue_event_sof to rkisp1_isp_isr to make the code
> >>>> clearer and the incorrect inline comment is removed.
> >>>>
> >>>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> >>>> Acked-by: Helen Koike <helen.koike@collabora.com>
> >>>>
> >>>> ---
> >>>> changes since v2:
> >>>> add a closing "}" to if condition
> >>>> remove usless inline comment
> >>>> ---
> >>>>   drivers/staging/media/rkisp1/rkisp1-capture.c |  2 +-
> >>>>   drivers/staging/media/rkisp1/rkisp1-common.h  |  2 +-
> >>>>   drivers/staging/media/rkisp1/rkisp1-isp.c     | 16 +++++-----------
> >>>>   drivers/staging/media/rkisp1/rkisp1-params.c  |  2 +-
> >>>>   drivers/staging/media/rkisp1/rkisp1-stats.c   |  3 +--
> >>>>   5 files changed, 9 insertions(+), 16 deletions(-)
> >>>>
> >>>
> >>> Thank you for the patch. Please see my comments inline.
> >>>
> >>>> diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
> >>>> index 0632582a95b4..1c762a369b63 100644
> >>>> --- a/drivers/staging/media/rkisp1/rkisp1-capture.c
> >>>> +++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
> >>>> @@ -632,7 +632,7 @@ static void rkisp1_handle_buffer(struct rkisp1_capture *cap)
> >>>>      curr_buf = cap->buf.curr;
> >>>>
> >>>>      if (curr_buf) {
> >>>> -            curr_buf->vb.sequence = atomic_read(&isp->frame_sequence);
> >>>> +            curr_buf->vb.sequence = isp->frame_sequence;
> >>>
> >>> I wonder if with higher resolutions, let's say full 5 Mpix, and/or some
> >>> memory-intensive system load, like video encoding and graphics rendering,
> >>> the DMA wouldn't take enough time to have the MI_FRAME interrupt fire after
> >>> the V_START for the next frame.
> >>>
> >>> I recall you did some testing back in time [1], showing that the two are
> >>> interleaved. Do you remember what CAPTURE resolution was it?
> >>
> >> I ran the testing again, I added a patch to allow streaming simultanously from
> >> both pathes: https://gitlab.collabora.com/dafna/linux/-/commit/8df0d15567b27cb88674fbbe33d1906c3c5a91da
> >> Then I ran two tests:
> >> stream simultaneously with 3280x2464 frames from the camera, and then downscaling them to 1920x1080 on selfpath, this is http://ix.io/2zoP
> >> stream simultaneously with 640x480 frames from the camera, and upscaling them to 1920x1080 on the selfpath. this is http://ix.io/2zoR
> >>
> >> the pixelformat for both is 422P.
> >> I don't know how meaningful and useful is to test it on the rockchip-pi4 board, I only use it with a serial console.
> >> The functionality can probably only be tested on the scarlet.
> >
> > Okay, thanks. It looks like there is always plenty of time margin on
> > the hardware side and if the interrupt handling is delayed for a short
> > time and both are handled by the same handler call, it's also going to
> > be handled fine because of rkisp1_capture_isr() being called before
> > rkisp1_isp_isr().
> >
> > By the way, do we need the MIPI interrupts every frame? Perhaps we
> > could enable the RKISP1_CIF_MIPI_ERR_CTRL* interrupts only and then,
> > when we get an error, we disable it and enable
> > RKISP1_CIF_MIPI_FRAME_END, which would then re-enable
> > RKISP1_CIF_MIPI_ERR_CTRL* and disable itself? WDYT?
>
> The driver already do this in a sense, it disables these interrupts on
> the first MIPI error and re-enable them on RKISP1_CIF_MIPI_FRAME_END.

Yes, it disables the ERR interrupts, but doesn't it keep the FRAME_END
interrupt enabled all the time? (At least that seems to be the case in
your traces.) Is it necessary?

Best regards,
Tomasz

>
> Please check:
>
> https://git.linuxtv.org/media_tree.git/tree/drivers/staging/media/rkisp1/rkisp1-isp.c#n1069
>
> For convenience:
>
> void rkisp1_mipi_isr(struct rkisp1_device *rkisp1)
> {
>         u32 val, status;
>
>         status = rkisp1_read(rkisp1, RKISP1_CIF_MIPI_MIS);
>         if (!status)
>                 return;
>
>         rkisp1_write(rkisp1, status, RKISP1_CIF_MIPI_ICR);
>
>         /*
>          * Disable DPHY errctrl interrupt, because this dphy
>          * erctrl signal is asserted until the next changes
>          * of line state. This time is may be too long and cpu
>          * is hold in this interrupt.
>          */
>         if (status & RKISP1_CIF_MIPI_ERR_CTRL(0x0f)) {
>                 val = rkisp1_read(rkisp1, RKISP1_CIF_MIPI_IMSC);
>                 rkisp1_write(rkisp1, val & ~RKISP1_CIF_MIPI_ERR_CTRL(0x0f),
>                              RKISP1_CIF_MIPI_IMSC);
>                 rkisp1->isp.is_dphy_errctrl_disabled = true;
>         }
>
>         /*
>          * Enable DPHY errctrl interrupt again, if mipi have receive
>          * the whole frame without any error.
>          */
>         if (status == RKISP1_CIF_MIPI_FRAME_END) {
>                 /*
>                  * Enable DPHY errctrl interrupt again, if mipi have receive
>                  * the whole frame without any error.
>                  */
>                 if (rkisp1->isp.is_dphy_errctrl_disabled) {
>                         val = rkisp1_read(rkisp1, RKISP1_CIF_MIPI_IMSC);
>                         val |= RKISP1_CIF_MIPI_ERR_CTRL(0x0f);
>                         rkisp1_write(rkisp1, val, RKISP1_CIF_MIPI_IMSC);
>                         rkisp1->isp.is_dphy_errctrl_disabled = false;
>                 }
>         } else {
>                 rkisp1->debug.mipi_error++;
>         }
> }
>
> Regards,
> Helen
>
> >
> > Best regards,
> > Tomasz
> >
> >>
> >> Thanks,
> >> Dafna
> >>
> >>
> >>
> >>>
> >>>>              curr_buf->vb.vb2_buf.timestamp = ktime_get_boottime_ns();
> >>>>              curr_buf->vb.field = V4L2_FIELD_NONE;
> >>>>              vb2_buffer_done(&curr_buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
> >>>> diff --git a/drivers/staging/media/rkisp1/rkisp1-common.h b/drivers/staging/media/rkisp1/rkisp1-common.h
> >>>> index 232bee92d0eb..51c92a251ea5 100644
> >>>> --- a/drivers/staging/media/rkisp1/rkisp1-common.h
> >>>> +++ b/drivers/staging/media/rkisp1/rkisp1-common.h
> >>>> @@ -131,7 +131,7 @@ struct rkisp1_isp {
> >>>>      const struct rkisp1_isp_mbus_info *src_fmt;
> >>>>      struct mutex ops_lock; /* serialize the subdevice ops */
> >>>>      bool is_dphy_errctrl_disabled;
> >>>> -    atomic_t frame_sequence;
> >>>> +    __u32 frame_sequence;
> >>>
> >>> nit: The __ prefixed types are defined for the UAPI to avoid covering userspace
> >>> types. For kernel types please just use the plain u32.
> >>>
> >>> Best regards,
> >>> Tomasz
> >>>
> >
