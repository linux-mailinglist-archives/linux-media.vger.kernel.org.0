Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F48E2448C2
	for <lists+linux-media@lfdr.de>; Fri, 14 Aug 2020 13:23:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727870AbgHNLXX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Aug 2020 07:23:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726578AbgHNLXW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Aug 2020 07:23:22 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F12FC061384
        for <linux-media@vger.kernel.org>; Fri, 14 Aug 2020 04:23:22 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id v22so6561959edy.0
        for <linux-media@vger.kernel.org>; Fri, 14 Aug 2020 04:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=74lu3NYAV8oBCYayMvYbkB5XS2Pza4gP8vK5pg4J9AE=;
        b=LrvYFQLGEJrCWdb8YMpX6eqJnwTbSPjytjmRASdYQS5SHPuCM1+knFujt158Vx1+yO
         VypVeCLPtu+4fmJnxFhyHAUM1jX5cXS94cvQ4gg3L+1gwgyHdgWDNk54M8B4JwYIH2t9
         QGNruDCRxzvpe3k6Fgiftd+MsGaATfK/ykF0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=74lu3NYAV8oBCYayMvYbkB5XS2Pza4gP8vK5pg4J9AE=;
        b=fEqC4+I9+TXKigkZu5WM2oXLJMxqroVK3nLV7vdqWaF5Z+G2/d0P8fa84YbEL728Qn
         jn5k5fxHpJougGKrGPV3c8dB1IdhJU/58TLJOUdjT0proV60DvHpVN6AQGFn+WKCzAe6
         LfnSl1zZjzYUJLzOlYRgw1pewEYVeXpmylfVAbRXNmVtpPjlulCMoTOtdYUeqUkK4VFs
         upiuHSJIaZWldNLBcu874W3+tE3nHleUDHDkUrkS9d3XZUqWHKOCUV9a8eP3H676Mibq
         Oc7VQ0rc7spkAj3q/JO2AMFvPONSY9y16VqjghBi/hsq22oZq8P7EwdNqD14zvtNTjnG
         aREw==
X-Gm-Message-State: AOAM5314GSqjFai3/niAyFpY/+pqwY3ZMeaaoRGxvA7MTHMR0Fb/hMWY
        UCXuHouPvrZAoXxH5SoXbN6V0G7xlUxxkg==
X-Google-Smtp-Source: ABdhPJyh0uzHqOB00bIJuuVRgIFz0/OejOw57YVjJkEa9f1kCOOfe+vfFqOl0pJx1wh5QA5WexcERQ==
X-Received: by 2002:a05:6402:3193:: with SMTP id di19mr1790706edb.224.1597404200597;
        Fri, 14 Aug 2020 04:23:20 -0700 (PDT)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com. [209.85.128.42])
        by smtp.gmail.com with ESMTPSA id 89sm6135006ede.29.2020.08.14.04.23.18
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2020 04:23:19 -0700 (PDT)
Received: by mail-wm1-f42.google.com with SMTP id 9so7175932wmj.5
        for <linux-media@vger.kernel.org>; Fri, 14 Aug 2020 04:23:18 -0700 (PDT)
X-Received: by 2002:a1c:9a81:: with SMTP id c123mr2108679wme.46.1597404198270;
 Fri, 14 Aug 2020 04:23:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200625174257.22216-1-dafna.hirschfeld@collabora.com>
 <20200625174257.22216-4-dafna.hirschfeld@collabora.com> <e269f2f5-c24c-7009-e624-3545af206709@arm.com>
 <CAAFQd5AsJG=YJC4eG6+qdt_dPyr-dwcXrmujxLaHfoe9==Es1g@mail.gmail.com> <1e9097b9-ce61-448d-c00b-24f4eadb96a6@collabora.com>
In-Reply-To: <1e9097b9-ce61-448d-c00b-24f4eadb96a6@collabora.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 14 Aug 2020 13:23:05 +0200
X-Gmail-Original-Message-ID: <CAAFQd5BuzS8X7kMbEj17e49N51060M8X_PGMYvr=FOb0wBKXgA@mail.gmail.com>
Message-ID: <CAAFQd5BuzS8X7kMbEj17e49N51060M8X_PGMYvr=FOb0wBKXgA@mail.gmail.com>
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

On Fri, Aug 14, 2020 at 1:04 PM Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:
>
>
>
> Am 26.06.20 um 16:03 schrieb Tomasz Figa:
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
> >>
> >> (assuming from context that the list should never contain more than
> >> RKISP1_ISP_PARAMS_REQ_BUFS_MAX entries in the first place)
> >
> > Or if we want to avoid disabling the interrupts for the whole
> > iteration, we could use list_splice() to move all the entries of
>
> Hi, list_splice combines two lists together, I guess you meant list_cut_position
> which cut a list into two

No, I meant list_splice() and it does the expected thing here. It adds
all the elements from one list (the list argument) to another list
(the head argument). Since an element can't be on two lists at the
same time, the first list is rendered invalid.

Best regards,
Tomasz
