Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 891951FFA7E
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2020 19:47:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728291AbgFRRr4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Jun 2020 13:47:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726979AbgFRRrz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Jun 2020 13:47:55 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD367C06174E
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2020 10:47:55 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id a6so2618878wmm.5
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2020 10:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nD3+toXLKogeefPD64vrqBCxoKS7Czs8tQsrmBrXEpg=;
        b=acarjsE8bCYNSFGMhlznykkFeMSrWl5bq32liYMxhRt/S1Fhag8MCou+0r6l0zJ5FR
         W4mLPr6WOgYV2HYdOFO443JNxIFN0WiOeL4jQc9EzNIQlz1OzsD9ul7vvVyJ5IFBBBL8
         IR6nZmkeIs+f1UAOyRk57+BaRg3fV1HGXZCzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nD3+toXLKogeefPD64vrqBCxoKS7Czs8tQsrmBrXEpg=;
        b=o1n+jrtODrzpr1f7o90v+OJota6VILIJ0OPlIjLWhmY1WiKEH0eghunI7VttIqYODH
         P25FRclSvohysJ3kPxDLE1jriJudRgyDykhSjjLK52YU5YubSPcA8+IE/sNcYSVTz0YD
         iYvtFSaNSbxVFFSuLYnKY/9w2VSjK31r7+1p9ZYWvG/oC0B5Bx6rNKYiOiCBZxiRe4w0
         lKovDNi8ugDCtUgDaq5DyOd+QRHmD4/CqrIvM/ob9VvapKiunJpEGZvzrDuZQKWjLSJ3
         8pGah9phE4cCJbalyJer1X3hjYyOQPVgsNWa0I+H+HCymxtB3psin0wwHnY01UQ6FXhP
         j0jw==
X-Gm-Message-State: AOAM533PKOY01JQCuOY00C8AGNATRuPs5XVAV8Dqr7pXyowllSGIF/++
        kkepcAxc+zv8m0hCXnN75EgWWKrKZlGMrg==
X-Google-Smtp-Source: ABdhPJwZfdBS3GcYC01vmWWR86hP6NMV6sARuWbfkBdOrafNNLQlYWYu2fkQWKkr0t1uFu2Z37phjg==
X-Received: by 2002:a7b:cf02:: with SMTP id l2mr5226379wmg.136.1592502474261;
        Thu, 18 Jun 2020 10:47:54 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id k206sm4394277wma.39.2020.06.18.10.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 10:47:53 -0700 (PDT)
Date:   Thu, 18 Jun 2020 17:47:52 +0000
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
Message-ID: <20200618174752.GA10831@chromium.org>
References: <20200515142952.20163-1-dafna.hirschfeld@collabora.com>
 <20200515142952.20163-4-dafna.hirschfeld@collabora.com>
 <CAHD77HkjjWMOcX3oLnzdMuzZM-_NSydStnzLLcHEFRenL23d-A@mail.gmail.com>
 <aa52f9f8-d9e9-06b2-22df-bbab2d26b516@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa52f9f8-d9e9-06b2-22df-bbab2d26b516@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jun 12, 2020 at 02:45:00PM +0200, Dafna Hirschfeld wrote:
> 
> 
> On 27.05.20 01:09, Tomasz Figa wrote:
> > On Fri, May 15, 2020 at 4:30 PM Dafna Hirschfeld
> > <dafna.hirschfeld@collabora.com> wrote:
> > > 
> > > If the capture format is YUV444M then the memory input format
> > > should be YUV422, so the resizer should not change the default
> > > hdiv, vdiv in that case.
> > > 
> > > Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> > > ---
> > >   drivers/staging/media/rkisp1/rkisp1-resizer.c | 7 ++++---
> > >   1 file changed, 4 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/staging/media/rkisp1/rkisp1-resizer.c b/drivers/staging/media/rkisp1/rkisp1-resizer.c
> > > index 04a29af8cc92..5f9740ddd558 100644
> > > --- a/drivers/staging/media/rkisp1/rkisp1-resizer.c
> > > +++ b/drivers/staging/media/rkisp1/rkisp1-resizer.c
> > > @@ -394,10 +394,11 @@ static void rkisp1_rsz_config(struct rkisp1_resizer *rsz,
> > >           * (4:2:2 -> 4:2:0 for example). So the width/height of the CbCr
> > >           * streams should be set according to the pixel format in the capture.
> > >           * The resizer always gets the input as YUV422. If the capture format
> > > -        * is RGB then the memory input (the resizer output) should be YUV422
> > > -        * so we use the hdiv, vdiv of the YUV422 info in this case.
> > > +        * is RGB or YUV444 then the memory input (the resizer output) should
> > > +        * be YUV422 so we use the hdiv, vdiv of the YUV422 info in this case.
> > >           */
> > > -       if (v4l2_is_format_yuv(cap->pix.info)) {
> > > +       if (v4l2_is_format_yuv(cap->pix.info) &&
> > > +           cap->pix.info->format != V4L2_PIX_FMT_YUV444M) {
> > >                  src_c.width = cap->pix.info->hdiv;
> > >                  src_c.height = cap->pix.info->vdiv;
> > 
> > As pointed out in another thread, this should have been the original
> > size divided by the divisor and not just the latter alone.
> > 
> > It seems a bit suspicious to me that we don't need to upscale the
> > chroma planes here, because it would mean that the MI itself would be
> > doing some horizontal pixel doubling. The hardware documentation
> > doesn't really explain this, though.
> > 
> > Have you been able to validate that the setting without upscaling
> > indeed produces correct output?
> 
> Hi,
> I investigated it again, without this patch, the frames on mainpath for YUV444 look good: https://imgur.com/a/NtazWhY
> but there is a problem on selfpath: https://imgur.com/a/vQJPqAn
> 
> This patch somehow solves the problem on selfpath but ruins the frames on mainpath.
> 
> I think the bug is actually in another place in the code. The function 'rkisp1_sp_config'
> sets a constant value RKISP1_MI_CTRL_SP_INPUT_YUV422 as the input format on the RKISP1_CIF_MI_CTRL register.
> But the value should be set according to the configuration. For some reason the problem arises only
> when trying to capture yuv444. When I capture yuv420 on the selfpath the frame looks good although the
> value RKISP1_MI_CTRL_SP_INPUT_YUV422 is set.
> Setting the the SP_INPUT_* according to the configuration seems to solve the problem.

Looking at the datasheet, SP seems to have some internal format
conversion capability - one can set SP_OUTPUT_FORMAT and SP_INPUT_FORMAT
to different YUV subsampling modes or even some RGB formats. MP doesn't
have this capability - it can only write whatever it receives.

I think this needs to be reflected in the driver, if it isn't yet.
Depending on the resizer source format, the MP video node must allow
only formats with matching subsampling mode.

Best regards,
Tomasz
