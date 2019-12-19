Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C5D9125DB1
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2019 10:31:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726652AbfLSJbG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Dec 2019 04:31:06 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:34311 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726609AbfLSJbG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Dec 2019 04:31:06 -0500
Received: by mail-ed1-f67.google.com with SMTP id l8so4177166edw.1
        for <linux-media@vger.kernel.org>; Thu, 19 Dec 2019 01:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3MNr7rmgJwSVKwOy2eSLuIdIxPoEW3OZGb8I6gOrKIA=;
        b=KGDDrwDtQqcs/TLvGJnrPeZ+MYn3u8QTAZl9Z3NEZ8xbtfUiW/bGmqUGuYoD2Ttms0
         3n5zm+pS6fA2wxgePUxh9DAfRj+574P+ockstUE1ZmW1duLghkIYWEgldnTKho7DMb+T
         wiSNf+1N94OTc42oAEGxqedJ0OCaQcRqMsMGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3MNr7rmgJwSVKwOy2eSLuIdIxPoEW3OZGb8I6gOrKIA=;
        b=rvhsUrdOXSQapcS9R+dDS/zqjlp2H3BBWCL2l/i1kRMRNS1EqHbZRN3uBm8RhK6Z1w
         /ahME2J+rbyc0vtuVoTYBReKU3EekM/31X1v8emU9FyNCUp0eUb8SIinuLXaMEDhNpVP
         lue+V3P2RI46Al+28wqCrPcMAeHsqm4KQKdhONr4JVlN/5ddmAUuJ2h/ip1ByEPQS1Q6
         YgxRuYUjsRdWzWrEz7+zKI5BauLuXOC8ScN9H4htuhT6C9jNgw7BfxvdnWOkZpXVnr7P
         hNwGj99nYHBy/4eVCuDROqth0rNjo3FDUNW+DrSenJQWnBDK0d7S33Rk1AK4upb/tZ6Q
         Ha/g==
X-Gm-Message-State: APjAAAX/o7qZ8dRcPsiG8+q05S/UsBpX00lAAj4YkEpe+cVtfKBqSO/n
        fe32TI5/NPfuf4grA6u7B+BXAvr3nWwW7g==
X-Google-Smtp-Source: APXvYqxhH00fuT5bK4hUaUYCI0X+ePAZo75B6Mz55h+lHSo4/wMWdUhe8Cr06L5KX3FIoyehuCEzkA==
X-Received: by 2002:a17:906:348b:: with SMTP id g11mr8299056ejb.39.1576747863185;
        Thu, 19 Dec 2019 01:31:03 -0800 (PST)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com. [209.85.221.49])
        by smtp.gmail.com with ESMTPSA id o3sm344947ejb.43.2019.12.19.01.31.02
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2019 01:31:02 -0800 (PST)
Received: by mail-wr1-f49.google.com with SMTP id j42so5188416wrj.12
        for <linux-media@vger.kernel.org>; Thu, 19 Dec 2019 01:31:02 -0800 (PST)
X-Received: by 2002:a5d:4b8f:: with SMTP id b15mr8815304wrt.100.1576747861752;
 Thu, 19 Dec 2019 01:31:01 -0800 (PST)
MIME-Version: 1.0
References: <E1iTgvs-0004qe-3k@www.linuxtv.org> <CAAFQd5C+X+b1BMVicwXRXWZZ=t8SCJDgFQcd3hFs2zWuzUstKg@mail.gmail.com>
 <ef927bf9-57ad-3be0-c9af-30da4751fdb8@xs4all.nl> <CAAFQd5BrTcC+bavoPoBsfKKuFLe7AdD=7BM17BSY59t9R4SL6w@mail.gmail.com>
In-Reply-To: <CAAFQd5BrTcC+bavoPoBsfKKuFLe7AdD=7BM17BSY59t9R4SL6w@mail.gmail.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 19 Dec 2019 18:30:48 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BNGZSFY2b9uebpiJ58tLsD_eeVm+6S=WbNBdwwyDdR+A@mail.gmail.com>
Message-ID: <CAAFQd5BNGZSFY2b9uebpiJ58tLsD_eeVm+6S=WbNBdwwyDdR+A@mail.gmail.com>
Subject: Re: [git:media_tree/master] media: mtk-vcodec: Remove extra area
 allocation in an input buffer on encoding
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        linuxtv-commits@linuxtv.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hirokazu Honda <hiroh@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Tue, Dec 17, 2019 at 3:46 PM Tomasz Figa <tfiga@chromium.org> wrote:
>
> +Alexandre Courbot
>
> On Sun, Nov 10, 2019 at 10:36 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> >
> > On 11/10/19 2:13 PM, Tomasz Figa wrote:
> > > Hi Mauro and Hans,
> > >
> > > On Sun, Nov 10, 2019 at 3:42 PM Mauro Carvalho Chehab
> > > <mchehab@kernel.org> wrote:
> > >>
> > >> This is an automatic generated email to let you know that the following patch were queued:
> > >>
> > >> Subject: media: mtk-vcodec: Remove extra area allocation in an input buffer on encoding
> > >> Author:  Hirokazu Honda <hiroh@chromium.org>
> > >> Date:    Sun Nov 10 07:25:34 2019 +0100
> > >
> > > I asked for some more testing on different platforms in my review
> > > reply and we got some offline signals that it might not work on some
> > > platforms, due to some hardware prefetch. (Would be better if that was
> > > reported to the mailing list instead.) We're trying to figure out the
> > > exact requirements here, because half of the frame doesn't sound like
> > > something reasonable. Let's hold off the patch for the time being.
> >
> > I'll repost my last pull request, including a revert of this patch.
> >
> > The state of this patch in patchwork is changed back to New.
> >
> > I'll wait for your feedback on what to do with this patch.

Let's drop this patch indeed. Apparently some implementations of this
hardware do read-ahead up to 32 lines, so the extra space is needed.

Best regards,
Tomasz

> >
> > Regards,
> >
> >         Hans
> >
> > >
> > > Best regards,
> > > Tomasz
> > >
> > >>
> > >> MediaTek encoder allocates non pixel data area for an input buffer every
> > >> plane. As the input buffer should be read-only, the driver should not write
> > >> anything in the buffer. Therefore, the extra data should be unnecessary.
> > >>
> > >> Signed-off-by: Hirokazu Honda <hiroh@chromium.org>
> > >> Reviewed-by: Tomasz Figa <tfiga@chromium.org>
> > >> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > >> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> > >>
> > >>  drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c | 9 +++------
> > >>  1 file changed, 3 insertions(+), 6 deletions(-)
> > >>
> > >> ---
> > >>
> > >> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> > >> index fd8de027e83e..6aad53d97d74 100644
> > >> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> > >> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> > >> @@ -332,14 +332,12 @@ static int vidioc_try_fmt(struct v4l2_format *f,
> > >>
> > >>                 pix_fmt_mp->num_planes = fmt->num_planes;
> > >>                 pix_fmt_mp->plane_fmt[0].sizeimage =
> > >> -                               pix_fmt_mp->width * pix_fmt_mp->height +
> > >> -                               ((ALIGN(pix_fmt_mp->width, 16) * 2) * 16);
> > >> +                       pix_fmt_mp->width * pix_fmt_mp->height;
> > >>                 pix_fmt_mp->plane_fmt[0].bytesperline = pix_fmt_mp->width;
> > >>
> > >>                 if (pix_fmt_mp->num_planes == 2) {
> > >>                         pix_fmt_mp->plane_fmt[1].sizeimage =
> > >> -                               (pix_fmt_mp->width * pix_fmt_mp->height) / 2 +
> > >> -                               (ALIGN(pix_fmt_mp->width, 16) * 16);
> > >> +                               (pix_fmt_mp->width * pix_fmt_mp->height) / 2;
> > >>                         pix_fmt_mp->plane_fmt[2].sizeimage = 0;
> > >>                         pix_fmt_mp->plane_fmt[1].bytesperline =
> > >>                                                         pix_fmt_mp->width;
> > >> @@ -347,8 +345,7 @@ static int vidioc_try_fmt(struct v4l2_format *f,
> > >>                 } else if (pix_fmt_mp->num_planes == 3) {
> > >>                         pix_fmt_mp->plane_fmt[1].sizeimage =
> > >>                         pix_fmt_mp->plane_fmt[2].sizeimage =
> > >> -                               (pix_fmt_mp->width * pix_fmt_mp->height) / 4 +
> > >> -                               ((ALIGN(pix_fmt_mp->width, 16) / 2) * 16);
> > >> +                               (pix_fmt_mp->width * pix_fmt_mp->height) / 4;
> > >>                         pix_fmt_mp->plane_fmt[1].bytesperline =
> > >>                                 pix_fmt_mp->plane_fmt[2].bytesperline =
> > >>                                 pix_fmt_mp->width / 2;
> >
