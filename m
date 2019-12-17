Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 236381224F6
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2019 07:46:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726754AbfLQGqj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Dec 2019 01:46:39 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:43936 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726704AbfLQGqi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Dec 2019 01:46:38 -0500
Received: by mail-ed1-f66.google.com with SMTP id dc19so7106629edb.10
        for <linux-media@vger.kernel.org>; Mon, 16 Dec 2019 22:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dOjB7BiUN06cs0c2TaQGoOPZKmVYyFksJ/sivMzOn/8=;
        b=Gt47KFh0xaU6czrVc1K4xVK2rUFmw87SAka0uNQOzFwljNc2UhV03BjvEq+Lz5X6Oj
         t7CBHFDS89qgQJCjmHOy1pbcW9MEyMf0KvD00PtBYK8ttPnx4NmJPyJ04nzviKPh8NHO
         Vd38LIGXDMxFYxledyPmBtVYDT7oLKQl4m61w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dOjB7BiUN06cs0c2TaQGoOPZKmVYyFksJ/sivMzOn/8=;
        b=HRTsSZBHq0EvAvq6TF0DDglKzeqAn0utzADPtF2DswiQl07807R+Myh6yf05+wmegE
         RrsmWNSpdvOI7akve09awwBrT8iTK1JwljFlk6gVk+CF/HnSDQ/2xej3fp6xbbJ6Bcwo
         7BrtFHGY8Su3qNw+4CuAhnO0ZnL3aEQrBRf6FjpN+C903WkCbXrUckjo8fX10neSjQFl
         c7vft2H8wRWfv3vcm7bL3em+VR823Z8o3rt1WYGVsO3tZgfQBI+E6UHTUCnhB4XEydBg
         1NtcD+y29sI0L2mWjgSUR5Nq31eSafGoZC/ta5OxOtrM0/5Z2Gu2Y4/Ah//i0UIRiRvk
         h/Lw==
X-Gm-Message-State: APjAAAW+6gGxLQUohirS1vkAvDh8dwzB7lTWqq3sJdVeOa9faN0qHVR5
        b3tf7K3gRLf76/Vc7N4tmskZmNJ/ovAuyQ==
X-Google-Smtp-Source: APXvYqyuz0ADPONPKCg0O8bvX//dvs9BfttScgm3PLLaux7vH7lZW2UbLfsMHG+a0+sR72S6BuimFg==
X-Received: by 2002:a17:906:b2d2:: with SMTP id cf18mr3254988ejb.93.1576565196005;
        Mon, 16 Dec 2019 22:46:36 -0800 (PST)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com. [209.85.128.44])
        by smtp.gmail.com with ESMTPSA id v5sm1126472eji.87.2019.12.16.22.46.34
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2019 22:46:34 -0800 (PST)
Received: by mail-wm1-f44.google.com with SMTP id d73so1725688wmd.1
        for <linux-media@vger.kernel.org>; Mon, 16 Dec 2019 22:46:34 -0800 (PST)
X-Received: by 2002:a1c:2355:: with SMTP id j82mr3513170wmj.135.1576565194081;
 Mon, 16 Dec 2019 22:46:34 -0800 (PST)
MIME-Version: 1.0
References: <E1iTgvs-0004qe-3k@www.linuxtv.org> <CAAFQd5C+X+b1BMVicwXRXWZZ=t8SCJDgFQcd3hFs2zWuzUstKg@mail.gmail.com>
 <ef927bf9-57ad-3be0-c9af-30da4751fdb8@xs4all.nl>
In-Reply-To: <ef927bf9-57ad-3be0-c9af-30da4751fdb8@xs4all.nl>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 17 Dec 2019 15:46:21 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BrTcC+bavoPoBsfKKuFLe7AdD=7BM17BSY59t9R4SL6w@mail.gmail.com>
Message-ID: <CAAFQd5BrTcC+bavoPoBsfKKuFLe7AdD=7BM17BSY59t9R4SL6w@mail.gmail.com>
Subject: Re: [git:media_tree/master] media: mtk-vcodec: Remove extra area
 allocation in an input buffer on encoding
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linuxtv-commits@linuxtv.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hirokazu Honda <hiroh@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

+Alexandre Courbot

On Sun, Nov 10, 2019 at 10:36 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 11/10/19 2:13 PM, Tomasz Figa wrote:
> > Hi Mauro and Hans,
> >
> > On Sun, Nov 10, 2019 at 3:42 PM Mauro Carvalho Chehab
> > <mchehab@kernel.org> wrote:
> >>
> >> This is an automatic generated email to let you know that the following patch were queued:
> >>
> >> Subject: media: mtk-vcodec: Remove extra area allocation in an input buffer on encoding
> >> Author:  Hirokazu Honda <hiroh@chromium.org>
> >> Date:    Sun Nov 10 07:25:34 2019 +0100
> >
> > I asked for some more testing on different platforms in my review
> > reply and we got some offline signals that it might not work on some
> > platforms, due to some hardware prefetch. (Would be better if that was
> > reported to the mailing list instead.) We're trying to figure out the
> > exact requirements here, because half of the frame doesn't sound like
> > something reasonable. Let's hold off the patch for the time being.
>
> I'll repost my last pull request, including a revert of this patch.
>
> The state of this patch in patchwork is changed back to New.
>
> I'll wait for your feedback on what to do with this patch.
>
> Regards,
>
>         Hans
>
> >
> > Best regards,
> > Tomasz
> >
> >>
> >> MediaTek encoder allocates non pixel data area for an input buffer every
> >> plane. As the input buffer should be read-only, the driver should not write
> >> anything in the buffer. Therefore, the extra data should be unnecessary.
> >>
> >> Signed-off-by: Hirokazu Honda <hiroh@chromium.org>
> >> Reviewed-by: Tomasz Figa <tfiga@chromium.org>
> >> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> >> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> >>
> >>  drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c | 9 +++------
> >>  1 file changed, 3 insertions(+), 6 deletions(-)
> >>
> >> ---
> >>
> >> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> >> index fd8de027e83e..6aad53d97d74 100644
> >> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> >> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> >> @@ -332,14 +332,12 @@ static int vidioc_try_fmt(struct v4l2_format *f,
> >>
> >>                 pix_fmt_mp->num_planes = fmt->num_planes;
> >>                 pix_fmt_mp->plane_fmt[0].sizeimage =
> >> -                               pix_fmt_mp->width * pix_fmt_mp->height +
> >> -                               ((ALIGN(pix_fmt_mp->width, 16) * 2) * 16);
> >> +                       pix_fmt_mp->width * pix_fmt_mp->height;
> >>                 pix_fmt_mp->plane_fmt[0].bytesperline = pix_fmt_mp->width;
> >>
> >>                 if (pix_fmt_mp->num_planes == 2) {
> >>                         pix_fmt_mp->plane_fmt[1].sizeimage =
> >> -                               (pix_fmt_mp->width * pix_fmt_mp->height) / 2 +
> >> -                               (ALIGN(pix_fmt_mp->width, 16) * 16);
> >> +                               (pix_fmt_mp->width * pix_fmt_mp->height) / 2;
> >>                         pix_fmt_mp->plane_fmt[2].sizeimage = 0;
> >>                         pix_fmt_mp->plane_fmt[1].bytesperline =
> >>                                                         pix_fmt_mp->width;
> >> @@ -347,8 +345,7 @@ static int vidioc_try_fmt(struct v4l2_format *f,
> >>                 } else if (pix_fmt_mp->num_planes == 3) {
> >>                         pix_fmt_mp->plane_fmt[1].sizeimage =
> >>                         pix_fmt_mp->plane_fmt[2].sizeimage =
> >> -                               (pix_fmt_mp->width * pix_fmt_mp->height) / 4 +
> >> -                               ((ALIGN(pix_fmt_mp->width, 16) / 2) * 16);
> >> +                               (pix_fmt_mp->width * pix_fmt_mp->height) / 4;
> >>                         pix_fmt_mp->plane_fmt[1].bytesperline =
> >>                                 pix_fmt_mp->plane_fmt[2].bytesperline =
> >>                                 pix_fmt_mp->width / 2;
>
