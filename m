Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B02F820B581
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 17:59:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725882AbgFZP7b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 11:59:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725807AbgFZP7b (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 11:59:31 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8A60C03E979
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2020 08:59:30 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id dr13so9879811ejc.3
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2020 08:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vBT2CmWdco6arJIe4mznwgs7W6U/enfpK+v0b6JvGeI=;
        b=JE82dDAw3BNnfHg0qCJevcm/t9SICsVQzj+MYLOoJmX9UAxAxQlqDF7CRS2vnTUtNB
         mjqxcJuIoKaOuF8T3X9RaIkNYtDVUh/KY7uTpZuEmBsrlj0IMy9k+nK9ggP9PLgYA8kj
         0UOFXqfO3dCrP7h+0vV0AXC4V8dFa1e+NU12Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vBT2CmWdco6arJIe4mznwgs7W6U/enfpK+v0b6JvGeI=;
        b=f9t60OnChOfaYq3Ts4iXbZROfJHbx3SXsefMF8c2N9e7siM4YseoQPno4v40yglFs2
         r92aWRZpd+DhpFON6Xiq86pp3ddbezXTO4JJTIflFjxrtigqpfTH3Uf0YPgaJtE82z/j
         YxXyxot/BcB7PFGRNivkL5jIzmU/UQoEGDOokBwAuXf5G6TRTw4XUSY+ApJBiq43XZw0
         DasR16LWHKBVNORw3NumxOuPJAGgn2XY/cXsD3xWjc5/Cz5fVlwSyWsNsk8ULm+dGlpk
         i8kk2XcLty1BZrs/qGzzrgqZtRp5evBTFklOpFVWJGtOv+JSaUbxjnuuQ2leau7LcfmF
         d9eA==
X-Gm-Message-State: AOAM532caIw63UnSPi+e+RTv3IX57bzOv/mGPgR0yNrYcPL8sWJcd/Em
        sChZt06L4NMDtmqBvMBXbbz5Hf8IBdJDpg==
X-Google-Smtp-Source: ABdhPJzRHPdHDK5UWR4FvNNZ8PEoxMuk3HaO2hWjKvpa9IMVruXQTtKNR8PjkTqoQC1J6Fv1QrgtJA==
X-Received: by 2002:a17:906:95d9:: with SMTP id n25mr3268265ejy.437.1593187169212;
        Fri, 26 Jun 2020 08:59:29 -0700 (PDT)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id l24sm18977219ejb.5.2020.06.26.08.59.28
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2020 08:59:28 -0700 (PDT)
Received: by mail-wr1-f43.google.com with SMTP id h15so9981732wrq.8
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2020 08:59:28 -0700 (PDT)
X-Received: by 2002:adf:80e6:: with SMTP id 93mr4362854wrl.17.1593187167677;
 Fri, 26 Jun 2020 08:59:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200625174257.22216-1-dafna.hirschfeld@collabora.com>
 <20200625174257.22216-4-dafna.hirschfeld@collabora.com> <e269f2f5-c24c-7009-e624-3545af206709@arm.com>
 <CAAFQd5AsJG=YJC4eG6+qdt_dPyr-dwcXrmujxLaHfoe9==Es1g@mail.gmail.com> <e680474a-1b47-7904-b7ab-5a026d0db05f@collabora.com>
In-Reply-To: <e680474a-1b47-7904-b7ab-5a026d0db05f@collabora.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 26 Jun 2020 17:59:14 +0200
X-Gmail-Original-Message-ID: <CAAFQd5CHK+c=zED-evW3sqgF+WpuAYW6M8kvPZCVCrf2_KHG8A@mail.gmail.com>
Message-ID: <CAAFQd5CHK+c=zED-evW3sqgF+WpuAYW6M8kvPZCVCrf2_KHG8A@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: staging: rkisp1: params: in 'stop_streaming'
 don't release the lock while returning buffers
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dafna Hirschfeld <dafna3@gmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Helen Koike <helen.koike@collabora.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        kernel@collabora.com, Ezequiel Garcia <ezequiel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jun 26, 2020 at 5:48 PM Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:
>
>
>
> On 26.06.20 16:03, Tomasz Figa wrote:
> > On Fri, Jun 26, 2020 at 3:32 PM Robin Murphy <robin.murphy@arm.com> wrote:
> >>
> >> Hi Dafna,
> >>
> >> On 2020-06-25 18:42, Dafna Hirschfeld wrote:
> >>> In the stop_streaming callback 'rkisp1_params_vb2_stop_streaming'
> >>> there is no need to release the lock 'config_lock' and then acquire
> >>> it again at each iteration when returning all buffers.
> >>> This is because the stream is about to end and there is no need
> >>> to let the isr access a buffer.
> >>>
> >>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> >>> ---
> >>>    drivers/staging/media/rkisp1/rkisp1-params.c | 7 +------
> >>>    1 file changed, 1 insertion(+), 6 deletions(-)
> >>>
> >>> diff --git a/drivers/staging/media/rkisp1/rkisp1-params.c b/drivers/staging/media/rkisp1/rkisp1-params.c
> >>> index bf006dbeee2d..5169b02731f1 100644
> >>> --- a/drivers/staging/media/rkisp1/rkisp1-params.c
> >>> +++ b/drivers/staging/media/rkisp1/rkisp1-params.c
> >>> @@ -1488,19 +1488,13 @@ static void rkisp1_params_vb2_stop_streaming(struct vb2_queue *vq)
> >>>        /* stop params input firstly */
> >>>        spin_lock_irqsave(&params->config_lock, flags);
> >>>        params->is_streaming = false;
> >>> -     spin_unlock_irqrestore(&params->config_lock, flags);
> >>>
> >>>        for (i = 0; i < RKISP1_ISP_PARAMS_REQ_BUFS_MAX; i++) {
> >>> -             spin_lock_irqsave(&params->config_lock, flags);
> >>>                if (!list_empty(&params->params)) {
> >>>                        buf = list_first_entry(&params->params,
> >>>                                               struct rkisp1_buffer, queue);
> >>>                        list_del(&buf->queue);
> >>> -                     spin_unlock_irqrestore(&params->config_lock,
> >>> -                                            flags);
> >>>                } else {
> >>> -                     spin_unlock_irqrestore(&params->config_lock,
> >>> -                                            flags);
> >>>                        break;
> >>>                }
> >>
> >> Just skimming through out of idle curiosity I was going to comment that
> >> if you end up with this pattern:
> >>
> >>          if (!x) {
> >>                  //do stuff
> >>          } else {
> >>                  break;
> >>          }
> >>
> >> it would be better as:
> >>
> >>          if (x)
> >>                  break;
> >>          //do stuff
> >>
> >> However I then went and looked at the whole function and frankly it's a
> >> bit of a WTF. As best I could decipher, this whole crazy loop appears to
> >> be a baroque reinvention of:
> >>
> >>          list_for_each_entry_safe(&params->params, ..., buf) {
> >>                  list_del(&buf->queue);
> >>                  vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
> >>          }
> Hi, indeed this is a much simpler implementation, greping 'return_all_buffers'
> I see that many drivers implement it this way.
> thanks!
>
> >>
> >> (assuming from context that the list should never contain more than
> >> RKISP1_ISP_PARAMS_REQ_BUFS_MAX entries in the first place)
> >
> > Or if we want to avoid disabling the interrupts for the whole
> > iteration, we could use list_splice() to move all the entries of
>
> But this code runs when userspace asks to stop the streaming so I don't
> think it is important at that stage to allow the interrupts.

It's generally a good practice to reduce the time spent with
interrupts disabled. Disabling the interrupts prevents the system from
handling external events, including timer interrupts, and scheduling
higher priority tasks, including real time ones. How much the system
runs with interrupts disabled is one of the factors determining the
general system latency.

Best regards,
Tomasz
