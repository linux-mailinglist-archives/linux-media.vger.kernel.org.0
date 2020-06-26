Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB7D320B316
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 16:04:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728960AbgFZOEJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 10:04:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728091AbgFZOEI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 10:04:08 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D9C6C03E979
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2020 07:04:08 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id dp18so9484937ejc.8
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2020 07:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5V8GFGc/Q2xVF5ID3AFrTVFIVKR+GweNNt3zo8Af3+0=;
        b=LH1WtrmOQXoY7ttrJodfPzGuaMqBUUMnMgsCXuB0+fD9+NjwxnBopwXehAMi+mMLpP
         9+J8kwO8BFXNghc++LAbDeZJujJvHrHgJ7Asle8D+w4NR2wkmTz7BCUQzeoumjBcsWtb
         Nf2SVTsDuKYFitT61kiOagaIhgOVN/+lhHWEQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5V8GFGc/Q2xVF5ID3AFrTVFIVKR+GweNNt3zo8Af3+0=;
        b=cHmkzgZAgZP0EWMhsjtYXwKBhIUoK5JBhsx9ce2V2fr98RZgBUkzaalfvcBeuow/uP
         sg7g7zl3C8fqO3jJhpo9ZKhMRwrknxOi+5yYqRuBBw0jTrU1o/gUSMfLSdsWCe2q7R9P
         k1zLzzPcvrDnWv+OmapP2DjnASdTvpWnBwMxoYC1tyXxThDqXTeToXFpWMamkQa75l1H
         YUTZv7tot2O8WKsUsZC0ly0Uk8fyzH05sww3QDuIikDgdRtohWu1oj6/EL35AzGTSsM6
         xVIgSFpgA2/BEt3rYdxnsxWZvlJrQ4N1jMEm+qzt81B4zzPjKsh0nW5TRC4Lo5Uf4+AS
         15Ow==
X-Gm-Message-State: AOAM533gJZCB47j4osqMq3Q6lzh7vRgP/lMteuFsTH6HgvQA/DF+EfNR
        s4C5PBgD94FyO0fsdnQV+g2/A7odaO/yvQ==
X-Google-Smtp-Source: ABdhPJzfjS174CTJIslMUXUFX4WHx/3ypoBK3hnqSSkZvBMIw0p+j7ksvIDgqSHWcCDfoh7v6QKPZQ==
X-Received: by 2002:a17:906:1c4b:: with SMTP id l11mr2602269ejg.307.1593180246378;
        Fri, 26 Jun 2020 07:04:06 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com. [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id a37sm10901258edf.86.2020.06.26.07.04.04
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2020 07:04:05 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id o8so8941162wmh.4
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2020 07:04:04 -0700 (PDT)
X-Received: by 2002:a7b:c2a9:: with SMTP id c9mr3733686wmk.11.1593180244359;
 Fri, 26 Jun 2020 07:04:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200625174257.22216-1-dafna.hirschfeld@collabora.com>
 <20200625174257.22216-4-dafna.hirschfeld@collabora.com> <e269f2f5-c24c-7009-e624-3545af206709@arm.com>
In-Reply-To: <e269f2f5-c24c-7009-e624-3545af206709@arm.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 26 Jun 2020 16:03:50 +0200
X-Gmail-Original-Message-ID: <CAAFQd5AsJG=YJC4eG6+qdt_dPyr-dwcXrmujxLaHfoe9==Es1g@mail.gmail.com>
Message-ID: <CAAFQd5AsJG=YJC4eG6+qdt_dPyr-dwcXrmujxLaHfoe9==Es1g@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: staging: rkisp1: params: in 'stop_streaming'
 don't release the lock while returning buffers
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
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

On Fri, Jun 26, 2020 at 3:32 PM Robin Murphy <robin.murphy@arm.com> wrote:
>
> Hi Dafna,
>
> On 2020-06-25 18:42, Dafna Hirschfeld wrote:
> > In the stop_streaming callback 'rkisp1_params_vb2_stop_streaming'
> > there is no need to release the lock 'config_lock' and then acquire
> > it again at each iteration when returning all buffers.
> > This is because the stream is about to end and there is no need
> > to let the isr access a buffer.
> >
> > Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> > ---
> >   drivers/staging/media/rkisp1/rkisp1-params.c | 7 +------
> >   1 file changed, 1 insertion(+), 6 deletions(-)
> >
> > diff --git a/drivers/staging/media/rkisp1/rkisp1-params.c b/drivers/staging/media/rkisp1/rkisp1-params.c
> > index bf006dbeee2d..5169b02731f1 100644
> > --- a/drivers/staging/media/rkisp1/rkisp1-params.c
> > +++ b/drivers/staging/media/rkisp1/rkisp1-params.c
> > @@ -1488,19 +1488,13 @@ static void rkisp1_params_vb2_stop_streaming(struct vb2_queue *vq)
> >       /* stop params input firstly */
> >       spin_lock_irqsave(&params->config_lock, flags);
> >       params->is_streaming = false;
> > -     spin_unlock_irqrestore(&params->config_lock, flags);
> >
> >       for (i = 0; i < RKISP1_ISP_PARAMS_REQ_BUFS_MAX; i++) {
> > -             spin_lock_irqsave(&params->config_lock, flags);
> >               if (!list_empty(&params->params)) {
> >                       buf = list_first_entry(&params->params,
> >                                              struct rkisp1_buffer, queue);
> >                       list_del(&buf->queue);
> > -                     spin_unlock_irqrestore(&params->config_lock,
> > -                                            flags);
> >               } else {
> > -                     spin_unlock_irqrestore(&params->config_lock,
> > -                                            flags);
> >                       break;
> >               }
>
> Just skimming through out of idle curiosity I was going to comment that
> if you end up with this pattern:
>
>         if (!x) {
>                 //do stuff
>         } else {
>                 break;
>         }
>
> it would be better as:
>
>         if (x)
>                 break;
>         //do stuff
>
> However I then went and looked at the whole function and frankly it's a
> bit of a WTF. As best I could decipher, this whole crazy loop appears to
> be a baroque reinvention of:
>
>         list_for_each_entry_safe(&params->params, ..., buf) {
>                 list_del(&buf->queue);
>                 vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
>         }
>
> (assuming from context that the list should never contain more than
> RKISP1_ISP_PARAMS_REQ_BUFS_MAX entries in the first place)

Or if we want to avoid disabling the interrupts for the whole
iteration, we could use list_splice() to move all the entries of
params->params to a local list_head under the spinlock, release it and
then loop over the local head. As a side effect, one could even drop
list_del() and switch to the non-safe variant of
list_for_each_entry().

Best regards,
Tomasz
