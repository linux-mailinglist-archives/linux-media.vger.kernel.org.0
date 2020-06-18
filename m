Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 402001FFAD8
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2020 20:12:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730067AbgFRSMZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Jun 2020 14:12:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726001AbgFRSMY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Jun 2020 14:12:24 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18C35C06174E
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2020 11:12:24 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id l17so6076001wmj.0
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2020 11:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qCjJUz763V9X2aPqLxzBeHkYJwpTezbUL5uCwE0GBso=;
        b=KQJqU2vxkUxMS5U36ncQbVN1CAhvhJkgWtT1J1cmIhBNtl2oisq08X21qiCbh6DXpi
         rgUuoynO/uAsKP5RKTnn2intMYZOTzCg+b3dlKaUPbvlZxTxonlCdgEQAUHZYp1pBlcf
         fmjVGnh0S31kkNb+ATZKgFyiq1gNR7Pas6q6s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qCjJUz763V9X2aPqLxzBeHkYJwpTezbUL5uCwE0GBso=;
        b=UmmOpw/aQqGHMAoe2ux+xZH91n24QjFTFNuEtv84vEMz4XeU9OXkDZSXMODzldpSs5
         VsnNCMEZGjA6Y713r8SnbFCotDY86T6mCkkh3hYKuE0nzThbRVCjra0NTEoIKTZRkJFF
         p8NDaH0Ilbv9rlJYUFRoeLNnuIMJRYJgFeAo2DOguFwjYIAb5HjTcZIai1XGYIdllsRj
         wnkiJfbwegdIhRJnlmTjoSbcPXcRfZtIlgvSGtA+QytL3duaFG+ld1TH6ktxd0nVTuur
         twfMQGYXg3PUzZIBmNKtzDWTVwr0WbJC3ZtPk/EWfQbu1efmI7zkA4xoFCiJqEXOWFFW
         0gWg==
X-Gm-Message-State: AOAM532yKjH3VYQcQNNYefqTnWMtTW2dIqM0Hebpw30iS7NI6f/ll7pV
        mH+oq2Ek7gNIIAKHpBPsF9BDww==
X-Google-Smtp-Source: ABdhPJyXhrR4dDjEN0O62TWdCr/5hUNZoDgkcGIgNtY/TWGaFV+qs0hJrrA1hWNpcNTlRdT26Y4Y0g==
X-Received: by 2002:a05:600c:4102:: with SMTP id j2mr5258531wmi.48.1592503942678;
        Thu, 18 Jun 2020 11:12:22 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id e5sm4477852wrw.19.2020.06.18.11.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 11:12:22 -0700 (PDT)
Date:   Thu, 18 Jun 2020 18:12:20 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@collabora.com,
        Dafna Hirschfeld <dafna3@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 3/4] media: staging: rkisp1: rsz: set output format to
 YUV422 if cap format is YUV444
Message-ID: <20200618181220.GC10831@chromium.org>
References: <20200515142952.20163-1-dafna.hirschfeld@collabora.com>
 <20200515142952.20163-4-dafna.hirschfeld@collabora.com>
 <CAHD77HkjjWMOcX3oLnzdMuzZM-_NSydStnzLLcHEFRenL23d-A@mail.gmail.com>
 <aa52f9f8-d9e9-06b2-22df-bbab2d26b516@collabora.com>
 <20200618174752.GA10831@chromium.org>
 <9ee01443-985d-751c-fff9-fa90337de68d@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ee01443-985d-751c-fff9-fa90337de68d@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 18, 2020 at 08:00:37PM +0200, Dafna Hirschfeld wrote:
> 
> 
> On 18.06.20 19:47, Tomasz Figa wrote:
> > On Fri, Jun 12, 2020 at 02:45:00PM +0200, Dafna Hirschfeld wrote:
> > > 
> > > 
> > > On 27.05.20 01:09, Tomasz Figa wrote:
> > > > On Fri, May 15, 2020 at 4:30 PM Dafna Hirschfeld
> > > > <dafna.hirschfeld@collabora.com> wrote:
> > > > > 
> > > > > If the capture format is YUV444M then the memory input format
> > > > > should be YUV422, so the resizer should not change the default
> > > > > hdiv, vdiv in that case.
> > > > > 
> > > > > Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> > > > > ---
> > > > >    drivers/staging/media/rkisp1/rkisp1-resizer.c | 7 ++++---
> > > > >    1 file changed, 4 insertions(+), 3 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/staging/media/rkisp1/rkisp1-resizer.c b/drivers/staging/media/rkisp1/rkisp1-resizer.c
> > > > > index 04a29af8cc92..5f9740ddd558 100644
> > > > > --- a/drivers/staging/media/rkisp1/rkisp1-resizer.c
> > > > > +++ b/drivers/staging/media/rkisp1/rkisp1-resizer.c
> > > > > @@ -394,10 +394,11 @@ static void rkisp1_rsz_config(struct rkisp1_resizer *rsz,
> > > > >            * (4:2:2 -> 4:2:0 for example). So the width/height of the CbCr
> > > > >            * streams should be set according to the pixel format in the capture.
> > > > >            * The resizer always gets the input as YUV422. If the capture format
> > > > > -        * is RGB then the memory input (the resizer output) should be YUV422
> > > > > -        * so we use the hdiv, vdiv of the YUV422 info in this case.
> > > > > +        * is RGB or YUV444 then the memory input (the resizer output) should
> > > > > +        * be YUV422 so we use the hdiv, vdiv of the YUV422 info in this case.
> > > > >            */
> > > > > -       if (v4l2_is_format_yuv(cap->pix.info)) {
> > > > > +       if (v4l2_is_format_yuv(cap->pix.info) &&
> > > > > +           cap->pix.info->format != V4L2_PIX_FMT_YUV444M) {
> > > > >                   src_c.width = cap->pix.info->hdiv;
> > > > >                   src_c.height = cap->pix.info->vdiv;
> > > > 
> > > > As pointed out in another thread, this should have been the original
> > > > size divided by the divisor and not just the latter alone.
> > > > 
> > > > It seems a bit suspicious to me that we don't need to upscale the
> > > > chroma planes here, because it would mean that the MI itself would be
> > > > doing some horizontal pixel doubling. The hardware documentation
> > > > doesn't really explain this, though.
> > > > 
> > > > Have you been able to validate that the setting without upscaling
> > > > indeed produces correct output?
> > > 
> > > Hi,
> > > I investigated it again, without this patch, the frames on mainpath for YUV444 look good: https://imgur.com/a/NtazWhY
> > > but there is a problem on selfpath: https://imgur.com/a/vQJPqAn
> > > 
> > > This patch somehow solves the problem on selfpath but ruins the frames on mainpath.
> > > 
> > > I think the bug is actually in another place in the code. The function 'rkisp1_sp_config'
> > > sets a constant value RKISP1_MI_CTRL_SP_INPUT_YUV422 as the input format on the RKISP1_CIF_MI_CTRL register.
> > > But the value should be set according to the configuration. For some reason the problem arises only
> > > when trying to capture yuv444. When I capture yuv420 on the selfpath the frame looks good although the
> > > value RKISP1_MI_CTRL_SP_INPUT_YUV422 is set.
> > > Setting the the SP_INPUT_* according to the configuration seems to solve the problem.
> > 
> > Looking at the datasheet, SP seems to have some internal format
> > conversion capability - one can set SP_OUTPUT_FORMAT and SP_INPUT_FORMAT
> > to different YUV subsampling modes or even some RGB formats. MP doesn't
> > have this capability - it can only write whatever it receives.
> > 
> > I think this needs to be reflected in the driver, if it isn't yet.
> > Depending on the resizer source format, the MP video node must allow
> > only formats with matching subsampling mode.
> 
> Hi,
> I work on v3 now that does that, it supports several yuv mbus codes on the source pads of the resizers
> and then in the link_validation callback of the capture it checks that the subsampling matches.

Is it enough? I believe the principle is that within the same entity the
state needs to stay consistent, i.e. if the sink pad changes, the source
pad or video node must be updated to expose only correct formats,
including resetting the current format.

> 
> It is not clear to me what is the meaning of the input/output capapility of the selfpath except of RGB convertion.
> Since yuv subsampling is what the resizer does.

Could be some historical legacy, a byproduct of some feature (e.g.
RGB could be bundled with support for other formats) or could be there
on purpose.

It would be worth checking whether there are any quality or
performance/power differences depending on whether the resizer or the SP
is used for resampling. For example, one could be using some
interpolation algorithm, while the other just a simple pixel doubling or
decimation.

Best regards,
Tomasz
