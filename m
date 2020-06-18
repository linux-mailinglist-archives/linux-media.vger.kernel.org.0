Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF85A1FFBAD
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2020 21:19:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728527AbgFRTTE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Jun 2020 15:19:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726940AbgFRTTC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Jun 2020 15:19:02 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E097C06174E
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2020 12:19:00 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id q2so4835732wrv.8
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2020 12:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=j1jACKXQ+p2BQYyS/UUHpjzOxcY84iSvvB+9edTgAVY=;
        b=RdoxP6kY80dv/+219pGHSuyVr239trtF5PmIELGr7JjDQIM55ku7HHFpKXyoofOlSL
         TwNFu0p8I7eCcVFkVqG0/+Owg/QO79LdVvQZ1knOPW9dOjJpDN/t3Wfru9192056jVxc
         7ngwxSwe8QMa3fM5hu+/a5/bSUCvpjEjapASM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=j1jACKXQ+p2BQYyS/UUHpjzOxcY84iSvvB+9edTgAVY=;
        b=Ay2uLwJslt28Pzc924TDJUi1uMcD/rcXorGnx09J29GfdL1MawNc1udCShfhSe77Hc
         /Gs/Ryoy7Uabhmte1RRgt7vPPM4Nm9xWqls0LT4fmlPh6YHf9BRZC0TGXdyrikMVZi44
         LeaenUjMvWWuWYuFpqp09NYPBIx51puyH5qna55FflwH38EHDjhGajJ1Wg4wa5WwiNyp
         BdD35CE9xLF0Z1wvUxA9ys1vLYzCwQmfizEY0UYwa5x78ZHkzLYjwdsVyeeQgZVSVTkr
         BeZ2SDXSkDsF0EI0ZCmWKSYCIBeLflzM30aD+OyjiQE4B5T4no1bAgoxV/cLbeRaFIDg
         YBiQ==
X-Gm-Message-State: AOAM530EdvxHsChmhGU2D+Q3SCiwODR0+3M3kn0WKrJ2oH/lD0fd5gvR
        0d1jpOQpBTfTxneQryv0/8NWgQ==
X-Google-Smtp-Source: ABdhPJxHMet/Ffd+gnF1VzDx2SAuZ/TONI49D/vEGWQmeRpdCfqsgmiYjCWXMnROKDRTGs5JaeMV0g==
X-Received: by 2002:adf:bc41:: with SMTP id a1mr17891wrh.186.1592507939081;
        Thu, 18 Jun 2020 12:18:59 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id v20sm4902113wrb.51.2020.06.18.12.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 12:18:58 -0700 (PDT)
Date:   Thu, 18 Jun 2020 19:18:57 +0000
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
Message-ID: <20200618191857.GC73379@chromium.org>
References: <20200515142952.20163-1-dafna.hirschfeld@collabora.com>
 <20200515142952.20163-4-dafna.hirschfeld@collabora.com>
 <CAHD77HkjjWMOcX3oLnzdMuzZM-_NSydStnzLLcHEFRenL23d-A@mail.gmail.com>
 <aa52f9f8-d9e9-06b2-22df-bbab2d26b516@collabora.com>
 <20200618174752.GA10831@chromium.org>
 <9ee01443-985d-751c-fff9-fa90337de68d@collabora.com>
 <20200618181220.GC10831@chromium.org>
 <f1660285-f6cb-6157-1e56-2974bc549fef@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f1660285-f6cb-6157-1e56-2974bc549fef@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 18, 2020 at 08:50:23PM +0200, Dafna Hirschfeld wrote:
> 
> 
> On 18.06.20 20:12, Tomasz Figa wrote:
> > On Thu, Jun 18, 2020 at 08:00:37PM +0200, Dafna Hirschfeld wrote:
> > > 
> > > 
> > > On 18.06.20 19:47, Tomasz Figa wrote:
> > > > On Fri, Jun 12, 2020 at 02:45:00PM +0200, Dafna Hirschfeld wrote:
> > > > > 
> > > > > 
> > > > > On 27.05.20 01:09, Tomasz Figa wrote:
> > > > > > On Fri, May 15, 2020 at 4:30 PM Dafna Hirschfeld
> > > > > > <dafna.hirschfeld@collabora.com> wrote:
> > > > > > > 
> > > > > > > If the capture format is YUV444M then the memory input format
> > > > > > > should be YUV422, so the resizer should not change the default
> > > > > > > hdiv, vdiv in that case.
> > > > > > > 
> > > > > > > Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> > > > > > > ---
> > > > > > >     drivers/staging/media/rkisp1/rkisp1-resizer.c | 7 ++++---
> > > > > > >     1 file changed, 4 insertions(+), 3 deletions(-)
> > > > > > > 
> > > > > > > diff --git a/drivers/staging/media/rkisp1/rkisp1-resizer.c b/drivers/staging/media/rkisp1/rkisp1-resizer.c
> > > > > > > index 04a29af8cc92..5f9740ddd558 100644
> > > > > > > --- a/drivers/staging/media/rkisp1/rkisp1-resizer.c
> > > > > > > +++ b/drivers/staging/media/rkisp1/rkisp1-resizer.c
> > > > > > > @@ -394,10 +394,11 @@ static void rkisp1_rsz_config(struct rkisp1_resizer *rsz,
> > > > > > >             * (4:2:2 -> 4:2:0 for example). So the width/height of the CbCr
> > > > > > >             * streams should be set according to the pixel format in the capture.
> > > > > > >             * The resizer always gets the input as YUV422. If the capture format
> > > > > > > -        * is RGB then the memory input (the resizer output) should be YUV422
> > > > > > > -        * so we use the hdiv, vdiv of the YUV422 info in this case.
> > > > > > > +        * is RGB or YUV444 then the memory input (the resizer output) should
> > > > > > > +        * be YUV422 so we use the hdiv, vdiv of the YUV422 info in this case.
> > > > > > >             */
> > > > > > > -       if (v4l2_is_format_yuv(cap->pix.info)) {
> > > > > > > +       if (v4l2_is_format_yuv(cap->pix.info) &&
> > > > > > > +           cap->pix.info->format != V4L2_PIX_FMT_YUV444M) {
> > > > > > >                    src_c.width = cap->pix.info->hdiv;
> > > > > > >                    src_c.height = cap->pix.info->vdiv;
> > > > > > 
> > > > > > As pointed out in another thread, this should have been the original
> > > > > > size divided by the divisor and not just the latter alone.
> > > > > > 
> > > > > > It seems a bit suspicious to me that we don't need to upscale the
> > > > > > chroma planes here, because it would mean that the MI itself would be
> > > > > > doing some horizontal pixel doubling. The hardware documentation
> > > > > > doesn't really explain this, though.
> > > > > > 
> > > > > > Have you been able to validate that the setting without upscaling
> > > > > > indeed produces correct output?
> > > > > 
> > > > > Hi,
> > > > > I investigated it again, without this patch, the frames on mainpath for YUV444 look good: https://imgur.com/a/NtazWhY
> > > > > but there is a problem on selfpath: https://imgur.com/a/vQJPqAn
> > > > > 
> > > > > This patch somehow solves the problem on selfpath but ruins the frames on mainpath.
> > > > > 
> > > > > I think the bug is actually in another place in the code. The function 'rkisp1_sp_config'
> > > > > sets a constant value RKISP1_MI_CTRL_SP_INPUT_YUV422 as the input format on the RKISP1_CIF_MI_CTRL register.
> > > > > But the value should be set according to the configuration. For some reason the problem arises only
> > > > > when trying to capture yuv444. When I capture yuv420 on the selfpath the frame looks good although the
> > > > > value RKISP1_MI_CTRL_SP_INPUT_YUV422 is set.
> > > > > Setting the the SP_INPUT_* according to the configuration seems to solve the problem.
> > > > 
> > > > Looking at the datasheet, SP seems to have some internal format
> > > > conversion capability - one can set SP_OUTPUT_FORMAT and SP_INPUT_FORMAT
> > > > to different YUV subsampling modes or even some RGB formats. MP doesn't
> > > > have this capability - it can only write whatever it receives.
> > > > 
> > > > I think this needs to be reflected in the driver, if it isn't yet.
> > > > Depending on the resizer source format, the MP video node must allow
> > > > only formats with matching subsampling mode.
> > > 
> > > Hi,
> > > I work on v3 now that does that, it supports several yuv mbus codes on the source pads of the resizers
> > > and then in the link_validation callback of the capture it checks that the subsampling matches.
> > 
> > Is it enough? I believe the principle is that within the same entity the
> > state needs to stay consistent, i.e. if the sink pad changes, the source
> > pad or video node must be updated to expose only correct formats,
> > including resetting the current format.
> Yes, but video devices have only a sink pad. Also, the sink pad of
> a video device is not associated with an mbus code. The video format configuration
> is not related to the media controller API.

The video device interface and the entity it is linked to belong to the
same driver. The V4L2 video device interface requires that the state is
always valid and the implementation of the video device needs to take
into account its links to external entities.

Best regards,
Tomasz
