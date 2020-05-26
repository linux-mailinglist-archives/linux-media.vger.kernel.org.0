Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBFA81E3270
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2020 00:26:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389755AbgEZW0W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 May 2020 18:26:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389628AbgEZW0W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 May 2020 18:26:22 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3FFCC061A0F
        for <linux-media@vger.kernel.org>; Tue, 26 May 2020 15:26:20 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id k19so19018257edv.9
        for <linux-media@vger.kernel.org>; Tue, 26 May 2020 15:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QQW0K1swTiwj5Gcu5iuhS+qDsYzT0alcFdI4CL3m41I=;
        b=bDPSov4ysDsc+cciSnP0jHTbAmW4Ywk+WvbT5YpTQWJe5uK8IAl47+OBwmAYv8/k2s
         Y3O+KVfiioPBGgN9OHBCpwKks7r55Lz6jtbG2pAbjnjoYsIL+49T9xm54YCn2Kr2kyFb
         ecFNXZKThl9Ogd+XVLmRA+xEp2sjgsSgho/2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QQW0K1swTiwj5Gcu5iuhS+qDsYzT0alcFdI4CL3m41I=;
        b=LJvMz90d4sX2mRriKj847lKy7MkioF+nIaKvPUOEHXFToq3y8cmz2XcQL2ckfuOUjx
         JuaYvkozyd3hlEYvyhGbwK/wDfKyOfn9UMWEjdcIZRFMf2N6GOqUAhHwLdXrfc+++JXW
         5HJlEhczRiZzKl3Gypij8IFLjschhOhof0GReLycKDTkZfK4sgFzcuvQGktfvPaQNwGE
         fMY4jtJLEWUrCppOHU6SQc0Zhyf45dFs8i2edNR7xeVHPOW1Ceh3BU0eId2cKbk7ldce
         EscfRRoWMhsUm3vOtBaHGKPDT0Sii6Z7CvfK8YlZ9w/FzJvVDtLihRY4Diy1Lodk8apJ
         WTyg==
X-Gm-Message-State: AOAM533wlbkbsK7AO7k1T/KQAMAsCF2v1BjdjjWkbKt1CRuhuvsY6aJ4
        VnE4jWziSemHyVHY8+3z2cF3sjd6xaJCDg==
X-Google-Smtp-Source: ABdhPJzMUIiHZkRHXXI4u/1kBMurDdqrwGYxmriLNMeSK2HfmAcH2iIgjDoE5aJZWO9b7Th9HnwuSw==
X-Received: by 2002:a05:6402:b91:: with SMTP id cf17mr21445832edb.148.1590531979128;
        Tue, 26 May 2020 15:26:19 -0700 (PDT)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com. [209.85.128.44])
        by smtp.gmail.com with ESMTPSA id p10sm869558ejn.64.2020.05.26.15.26.17
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2020 15:26:18 -0700 (PDT)
Received: by mail-wm1-f44.google.com with SMTP id n5so1196330wmd.0
        for <linux-media@vger.kernel.org>; Tue, 26 May 2020 15:26:17 -0700 (PDT)
X-Received: by 2002:a7b:c622:: with SMTP id p2mr1221914wmk.55.1590531977253;
 Tue, 26 May 2020 15:26:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200515142952.20163-1-dafna.hirschfeld@collabora.com>
 <20200515142952.20163-3-dafna.hirschfeld@collabora.com> <2606d729-7418-109b-f514-3b9eb834187c@collabora.com>
 <4bd94509-79af-16db-3721-2553508a6c42@collabora.com> <d0c93454-8a51-a28c-639d-948041fc602a@collabora.com>
 <9a0a91d50bdaa19378ef21de5c81abeef476429a.camel@collabora.com>
 <f8fa01a3-c0f1-9fc5-1fb8-b4fe91e8fc74@collabora.com> <5a4e994d9b5b702205301a9b72bef2d013d4e106.camel@collabora.com>
In-Reply-To: <5a4e994d9b5b702205301a9b72bef2d013d4e106.camel@collabora.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 27 May 2020 00:26:05 +0200
X-Gmail-Original-Message-ID: <CAAFQd5Di0hJKMo1NB6DJSRL5FMnK1sVtuhD0BhcKSUGTXd66sQ@mail.gmail.com>
Message-ID: <CAAFQd5Di0hJKMo1NB6DJSRL5FMnK1sVtuhD0BhcKSUGTXd66sQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] media: staging: rkisp1: rsz: use hdiv, vdiv of
 yuv422 instead of macros
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Helen Koike <helen.koike@collabora.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@collabora.com,
        Dafna Hirschfeld <dafna3@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, May 22, 2020 at 5:05 PM Ezequiel Garcia <ezequiel@collabora.com> wrote:
>
> On Fri, 2020-05-22 at 16:15 +0200, Dafna Hirschfeld wrote:
> >
> > On 22.05.20 15:31, Ezequiel Garcia wrote:
> > > Hi Dafna, Helen,
> > >
> > > On Fri, 2020-05-22 at 14:11 +0200, Dafna Hirschfeld wrote:
> > > > On 21.05.20 00:08, Helen Koike wrote:
> > > > > On 5/20/20 6:54 PM, Helen Koike wrote:
> > > > > > Hi Dafna,
> > > > > >
> > > > > > On 5/15/20 11:29 AM, Dafna Hirschfeld wrote:
> > > > > > > The resize block of rkisp1 always get the input as yuv422.
> > > > > > > Instead of defining the default hdiv, vdiv as macros, the
> > > > > > > code is more clear if it takes the (hv)div from the YUV422P
> > > > > > > info. This makes it clear where those values come from.
> > > > > > > The patch also adds documentation to explain that.
> > > > > > >
> > > > > > > Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> > > > > >
> > > > > > Acked-by: Helen Koike <helen.koike@collabora.com>
> > > > > >
> > > > > > Thanks!
> > > > > > Helen
> > > > > >
> > > > > > > ---
> > > > > > >    drivers/staging/media/rkisp1/rkisp1-resizer.c | 25 +++++++++----------
> > > > > > >    1 file changed, 12 insertions(+), 13 deletions(-)
> > > > > > >
> > > > > > > diff --git a/drivers/staging/media/rkisp1/rkisp1-resizer.c b/drivers/staging/media/rkisp1/rkisp1-resizer.c
> > > > > > > index d049374413dc..04a29af8cc92 100644
> > > > > > > --- a/drivers/staging/media/rkisp1/rkisp1-resizer.c
> > > > > > > +++ b/drivers/staging/media/rkisp1/rkisp1-resizer.c
> > > > > > > @@ -16,9 +16,6 @@
> > > > > > >    #define RKISP1_DEF_FMT MEDIA_BUS_FMT_YUYV8_2X8
> > > > > > >    #define RKISP1_DEF_PIXEL_ENC V4L2_PIXEL_ENC_YUV
> > > > > > >
> > > > > > > -#define RKISP1_MBUS_FMT_HDIV 2
> > > > > > > -#define RKISP1_MBUS_FMT_VDIV 1
> > > > > > > -
> > > > > > >    enum rkisp1_shadow_regs_when {
> > > > > > >     RKISP1_SHADOW_REGS_SYNC,
> > > > > > >     RKISP1_SHADOW_REGS_ASYNC,
> > > > > > > @@ -361,11 +358,12 @@ static void rkisp1_rsz_config_regs(struct rkisp1_resizer *rsz,
> > > > > > >    static void rkisp1_rsz_config(struct rkisp1_resizer *rsz,
> > > > > > >                           enum rkisp1_shadow_regs_when when)
> > > > > > >    {
> > > > > > > -   u8 hdiv = RKISP1_MBUS_FMT_HDIV, vdiv = RKISP1_MBUS_FMT_VDIV;
> > > > > > >     struct v4l2_rect sink_y, sink_c, src_y, src_c;
> > > > > > >     struct v4l2_mbus_framefmt *src_fmt;
> > > > > > >     struct v4l2_rect *sink_crop;
> > > > > > >     struct rkisp1_capture *cap = &rsz->rkisp1->capture_devs[rsz->id];
> > > > > > > +   const struct v4l2_format_info *yuv422_info =
> > > > > > > +           v4l2_format_info(V4L2_PIX_FMT_YUV422P);
> > > > > > >
> > >
> > > Instead of hardcoding this fourcc, is there any way we can
> > > retrieve it from a configured format?
> > >
> > What do you mean?
> > If the configured format is bayer then the resizer is disabled.
> > Otherwise the resizer always get the input as yuv422, this is why it is hard coded.
> >
>
> I don't like to rely on these assumptions/knowledge.
> It's much cleaner to retrieve the format, and avoiding
> hardcoding things as much as you can.

It would indeed be cleaner if we could retrieve this format from
somewhere, but where would that be? In theory we could assign a
YUV4:2:2 mbus format to the resizer input pad, but I think there is no
similar data available for mbs formats, is there?

Actually, if we look at this a bit more strictly, V4L2_PIX_FMT_YUV422P
is not exactly what the resizer gets at its input.
V4L2_PIX_FMT_YUV422P is a specific memory representation and the
corresponding v4l2_format_info struct contains data about the memory
layout. The resizer gets an unspecified YUV 4:2:2 pixel stream. Making
the code suggest that it's V4L2_PIX_FMT_YUV422P might make it more
confusing in another way.

Perhaps the way forward would be to simply add a comment explaining
where the 2 and 1 dividers come from?

Best regards,
Tomasz
