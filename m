Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 400C8444C25
	for <lists+linux-media@lfdr.de>; Thu,  4 Nov 2021 01:27:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232917AbhKDA3y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Nov 2021 20:29:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233291AbhKDA27 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Nov 2021 20:28:59 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DA33C061714;
        Wed,  3 Nov 2021 17:26:22 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id o14so4363026plg.5;
        Wed, 03 Nov 2021 17:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zJhhNHUtBhwKhBVpXZmDfOMnWU5zQQpTCdKvHZDPlWM=;
        b=NdFJfz8I3RJgi3AouNFrVkE+sZoJK6b2NqzyRZsNB6+CL/SwjC4RLtXaFGVHLrJtwZ
         /aXo89WC8NV/tzs35FUDalbmsE/y5OVRea6zwbN9IKOIsH1puCxHTIscAJUdZ3zX2d3P
         ZbvJFfjTjoA5BvHLlfbwyBembd8IFqZwLvhzue3kJfWfioW8MRPNsAD2pzl6kethS1iq
         m3TGy0qLDEC67DQ6Mp3kesPd6ji4VUz7+iU/9ZKI6w0PdwLHg8Yzu/yh/nA/DIau3aIZ
         u4YOk1tF0SdQsQfKR/ciyD4o2Sx1x+bq3rqSfV5QWT783jlFbd5Ig1O648egoJg9FwV/
         zxCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zJhhNHUtBhwKhBVpXZmDfOMnWU5zQQpTCdKvHZDPlWM=;
        b=rL/d7SnLeGgI/WmZev40Hg07cqoi1USuGcQCe7aK0MtbQ1pVZDt4ctS1bJifrCmLoF
         2G19C61bcVtCbRX9o3fJjL9E9uPlV5oeSLHrjWDSYOXn3X5q1K2xO/Q5KrgWQy3nst7Y
         WlmSDPfE0oudbDuQo1ha5byBT9IoYg3i/KCiXnlNci3JOkGhDFmSM/3W+P6+CGmbNP8p
         /1tkJ5Wfx4AdUxZAAxw9hUKr3nJmWxPNWebbaCoemG3EeR3WYl6yHegihUGXWgkQUXbd
         Pf0DDPf5d1NgAzhwyeo0uaVak0BR/d8uViiH544nK6/wpUw58Kae9WhM0ekCShGKDOcA
         7Yyw==
X-Gm-Message-State: AOAM533Ke8mgc2Kt6U1q8X64f7Ix6t3zfCCSMANhBMVE7caQVUVYZ0yl
        JQjondzGVQlrHAap+fNHMuA=
X-Google-Smtp-Source: ABdhPJwCAYi4kjhXkyE0ARnvfwQdO6eowBCdh5Zb9YBofFr3jGlWoSnb4/TpFx5hnxYX2Tnj+tQ94A==
X-Received: by 2002:a17:90b:1bd2:: with SMTP id oa18mr18052866pjb.164.1635985582248;
        Wed, 03 Nov 2021 17:26:22 -0700 (PDT)
Received: from postoffice.intern (192.243.120.180.16clouds.com. [192.243.120.180])
        by smtp.gmail.com with ESMTPSA id n29sm3541291pfv.77.2021.11.03.17.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 17:26:21 -0700 (PDT)
Date:   Thu, 4 Nov 2021 08:26:13 +0800
From:   David Yang <davidcomponentone@gmail.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl, arnd@arndb.de,
        laurent.pinchart@ideasonboard.com, Julia.Lawall@inria.fr,
        yang.guang5@zte.com.cn, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: use swap() to make code cleaner
Message-ID: <YYMopfFhgEiY0V7e@postoffice.intern>
References: <20211103083337.387083-1-yang.guang5@zte.com.cn>
 <163595245449.275423.13730372490445199703@Monstersaurus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <163595245449.275423.13730372490445199703@Monstersaurus>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

Both of  yang.guang5@zte.com.cn and davidcomponentone@gmail.com are
mine.
Because the yang.guang5@zte.com.cn can't send email out. So I use the
gmail to send.

Thanks.

On Wed, Nov 03, 2021 at 03:14:14PM +0000, Kieran Bingham wrote:
> Hi David,
> 
> Is this patch something you discovered somewhere and have posted on
> behalf of Yang Guang?
> 
> Have you made any modifications to it that would require your sign off?
> or is it simply a repost of a patch you came across?
> 
> Quoting davidcomponentone@gmail.com (2021-11-03 08:33:37)
> > From: Yang Guang <yang.guang5@zte.com.cn>
> > 
> > Use the macro 'swap()' defined in 'include/linux/minmax.h' to avoid
> > opencoding it.
> > 
> > Signed-off-by: Yang Guang <yang.guang5@zte.com.cn>
> 
> The change itself looks fine to me though.
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> > ---
> >  drivers/media/pci/saa7134/saa7134-video.c | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/media/pci/saa7134/saa7134-video.c b/drivers/media/pci/saa7134/saa7134-video.c
> > index 374c8e1087de..6f4132058c35 100644
> > --- a/drivers/media/pci/saa7134/saa7134-video.c
> > +++ b/drivers/media/pci/saa7134/saa7134-video.c
> > @@ -823,7 +823,7 @@ static int buffer_activate(struct saa7134_dev *dev,
> >  {
> >         struct saa7134_dmaqueue *dmaq = buf->vb2.vb2_buf.vb2_queue->drv_priv;
> >         unsigned long base,control,bpl;
> > -       unsigned long bpl_uv,lines_uv,base2,base3,tmp; /* planar */
> > +       unsigned long bpl_uv, lines_uv, base2, base3; /* planar */
> >  
> >         video_dbg("buffer_activate buf=%p\n", buf);
> >         buf->top_seen = 0;
> > @@ -869,9 +869,7 @@ static int buffer_activate(struct saa7134_dev *dev,
> >                 base2    = base + bpl * dev->height;
> >                 base3    = base2 + bpl_uv * lines_uv;
> >                 if (dev->fmt->uvswap) {
> > -                       tmp = base2;
> > -                       base2 = base3;
> > -                       base3 = tmp;
> > +                       swap(base2, base3);
> >                 }
> >                 video_dbg("uv: bpl=%ld lines=%ld base2/3=%ld/%ld\n",
> >                         bpl_uv,lines_uv,base2,base3);
> > -- 
> > 2.30.2
> >
