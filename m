Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C0D3359DFC
	for <lists+linux-media@lfdr.de>; Fri,  9 Apr 2021 13:53:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233768AbhDILyA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Apr 2021 07:54:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231599AbhDILx7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Apr 2021 07:53:59 -0400
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C732DC061760;
        Fri,  9 Apr 2021 04:53:46 -0700 (PDT)
Received: by mail-qt1-x82e.google.com with SMTP id u8so3883682qtq.12;
        Fri, 09 Apr 2021 04:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=rfY7/TSIGIzzxtfqlFd7sY3b3y7+bcFeCK0VpNZPuRY=;
        b=So/hiCRVkiAtxlGQG51g2yW+Xox7jax6ey2w20HtiXYP0FCYqoMaZ5jwIxylUFhemK
         LSm7y5ib+lLnn9iEqIG7kuRdnfK7s/8QRZLTbzOI2v0b1w/95xKKXjAZy8ZBtxX83bPf
         ZvT/6PSNUzVEQ/7Z3ufBzk3VV+5JCznM3AmQj/x/UPR+S5jqe6EIiCtebgCqGo7p7XUe
         kq6NfjcH0Zs6eVLxq7E3BEn6NpCMTJBpmrKu1lJZap1YKbEp+fELEP1miFBl6DT0WXaW
         4h7fQW6RFVkHkta7cI3rgf1y0uC4PTeVkbU6yOjQzr4ZmKhd+pihVR82b3vo1LPY7ZC3
         cuoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=rfY7/TSIGIzzxtfqlFd7sY3b3y7+bcFeCK0VpNZPuRY=;
        b=Cc5/7RABeDqbJdzBr9zBGmqt9rqy0Oi4OXQfQVt/KUj7tjAvryHQbMBr9vLJeZ40Iu
         1wdmRIceHte6kdWWx2s3/bPKifGXRF6VO+zvlC/OG8If/JkSoctKmU/lfPhSLgeihOlb
         j5dODLTSKNpYmhAfKeuVXlEklZ1eK2v3tH53aqqjngNmNhNURD70rU+Pmn0Jt1hq7HGw
         vnd895AbC1BSuCJWkd0FMo3tBAhLU+EMry8YGGAnjQP8VqUhjFYVA0sbcpShx8l+GXX/
         p88zfyC2N/Fj2FlodfBxViFHTLpoSHP61HUNQ6AgGEWpXMdmEJrHzl7wf7NnqUVz7oTh
         feEA==
X-Gm-Message-State: AOAM532yu8XaQ/mJN21Sk8DNE49yb0oez/yp+hpu5ctqSfQuEBxEhqZM
        RoA8ND/fnT6BxUbE1ZepcD0sFiyFM+4GL2Yl
X-Google-Smtp-Source: ABdhPJyHI1CyePIKQe9Vgiz8Kk7yaPjecKjf5t0f/wSmEGgC7YY/nCTtL28dYNBXQJ1fa3TfwJpN8Q==
X-Received: by 2002:ac8:46c5:: with SMTP id h5mr504198qto.180.1617969226014;
        Fri, 09 Apr 2021 04:53:46 -0700 (PDT)
Received: from ?IPv6:2001:1284:f013:b099:8056:1dc0:5a27:acd7? ([2001:1284:f013:b099:8056:1dc0:5a27:acd7])
        by smtp.gmail.com with ESMTPSA id a8sm1627222qtx.9.2021.04.09.04.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 04:53:45 -0700 (PDT)
Message-ID: <bd3d8a6b231ec142e420b622c1fd72276256c77f.camel@gmail.com>
Subject: Re: [Outreachy kernel] Re: [PATCH 1/2 v2] staging: media: hantro:
 Align line break to the open parenthesis in file hantro_hw.h
From:   ascordeiro <alinesantanacordeiro@gmail.com>
To:     Vaishali Thakkar <vthakkar@vaishalithakkar.in>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Outreachy <outreachy-kernel@googlegroups.com>
Date:   Fri, 09 Apr 2021 08:53:41 -0300
In-Reply-To: <CAK-LDb+L-hXpVgFpAz95921p6JOPZ8=BSYAiqjRpYv0oV=YK2A@mail.gmail.com>
References: <cover.1617890467.git.alinesantanacordeiro@gmail.com>
         <1e6d73432d60dfb8bb3f7f2bd6bf3084091a2a39.1617890467.git.alinesantanacordeiro@gmail.com>
         <d4000598fddcf45e578462aa04b556c0ca057091.camel@collabora.com>
         <6bba0e0a5768e902ffec4bda563d4ca810412f84.camel@gmail.com>
         <CAK-LDb+L-hXpVgFpAz95921p6JOPZ8=BSYAiqjRpYv0oV=YK2A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 (by Flathub.org) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em sex, 2021-04-09 às 10:25 +0200, Vaishali Thakkar escreveu:
> On Thu, Apr 8, 2021 at 7:41 PM ascordeiro
> <alinesantanacordeiro@gmail.com> wrote:
> > 
> > Em qui, 2021-04-08 às 13:20 -0300, Ezequiel Garcia escreveu:
> > > Ola Aline,
> > Ola Ezequiel,
> > 
> > > Welcome to the kernel community. Hope you enjoy some of this
> > > Outreachy adventures.
> > Thank you!
> > 
> > > Normally, when you submit a v2, we want to know what changed
> > > between the first submission and v2.
> > > 
> > > If you are subscribed to linux-media, you can read some
> > > of the series with a vN+1 and look how it's done. Examples:
> > > 
> > > https://www.spinics.net/lists/linux-media/msg190043.html
> > > 
> > > https://www.spinics.net/lists/linux-media/msg189923.html
> > > 
> > > I'm sure your Outreachy mentors can tell you more.
> > Thank you for the examples, it won't happen again.
> > 
> > The reason for sending a v2 is that I sent my very first patchset
> > yesterday and I sent the cover-letter together, but (I think) I
> > wasn't
> > supposed to, and as the patches weren't marked as [PATCH 1/2] and
> > [PATCH 2/2] in the email - since I commited all the files with the
> > same
> > message - I tought it was wrong and sent again today.
> > 
> > However, I just realized that I've changed just the subject of the
> > e-
> > mail, but I would've to change the commit message, right? And then,
> > it
> > would be a second version, am I right?
> 
> Your next version should be v3 with information about changes since
> v1 under --- . If you send it with v2, it'll still be confusing for
> people
> because then they have to manually find out the difference between
> two different patchsets with the same subject line. :)
> 
> You can also check 'Revising your patches' section in the tutorial.

Thank you, Vaishali!
You made it clear :)
I'm going to correct the patchset and send v3.

> > Thank you in advance,
> > 
> > > On Thu, 2021-04-08 at 11:07 -0300, Aline Santana Cordeiro wrote:
> > > > Aligns line break with the remaining function arguments
> > > > to the open parenthesis. Issue found by checkpatch.
> > > > 
> > > > Signed-off-by: Aline Santana Cordeiro <
> > > > alinesantanacordeiro@gmail.com>
> > > > ---
> > > >  drivers/staging/media/hantro/hantro_hw.h | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/staging/media/hantro/hantro_hw.h
> > > > b/drivers/staging/media/hantro/hantro_hw.h
> > > > index 34c9e46..a650b9c 100644
> > > > --- a/drivers/staging/media/hantro/hantro_hw.h
> > > > +++ b/drivers/staging/media/hantro/hantro_hw.h
> > > > @@ -207,7 +207,7 @@ hantro_h264_mv_size(unsigned int width,
> > > > unsigned int height)
> > > >  void hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx);
> > > >  void rk3399_vpu_mpeg2_dec_run(struct hantro_ctx *ctx);
> > > >  void hantro_mpeg2_dec_copy_qtable(u8 *qtable,
> > > > -       const struct v4l2_ctrl_mpeg2_quantization *ctrl);
> > > > +                                 const struct
> > > > v4l2_ctrl_mpeg2_quantization *ctrl);
> > > >  int hantro_mpeg2_dec_init(struct hantro_ctx *ctx);
> > > >  void hantro_mpeg2_dec_exit(struct hantro_ctx *ctx);
> > > > 
> > > 
> > > 
> > 
> > 
> > --
> > You received this message because you are subscribed to the Google
> > Groups "outreachy-kernel" group.
> > To unsubscribe from this group and stop receiving emails from it,
> > send an email to outreachy-kernel+unsubscribe@googlegroups.com.
> > To view this discussion on the web visit 
> > https://groups.google.com/d/msgid/outreachy-kernel/6bba0e0a5768e902ffec4bda563d4ca810412f84.camel%40gmail.com
> > .
> 
> 
> 


