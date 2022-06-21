Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9761552ACA
	for <lists+linux-media@lfdr.de>; Tue, 21 Jun 2022 08:11:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344735AbiFUGL3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jun 2022 02:11:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234718AbiFUGL2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jun 2022 02:11:28 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C06BB1580C
        for <linux-media@vger.kernel.org>; Mon, 20 Jun 2022 23:11:22 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id l11so22698852ybu.13
        for <linux-media@vger.kernel.org>; Mon, 20 Jun 2022 23:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Vho0OopB9mjCM9UrguuvOmptVTvFyF1oxWRbq8f6VP8=;
        b=IFm1SxyJid7xfxWoususAiekBJp8+biInh81+o+Q2oAfMbu5k71Llr+Ch40L6IjrUX
         qPYDsoDNUleNMERDS9WWFOK9cgf4kCzEsQQ7IilKMxpacNS2J/7zjkV5QLESN7dGagCR
         DQhwiMT4+LNi4JX2lav/YIyhrLTPYl2kGOHCtNDGGXtewhoqJcGKPeDzO0EDS+IDJJqC
         RQ19a7y5NZwcBOsf7Ai6CKywaoB5bntfIfMuLsnVQ5BtJPQh63UPW7sF3E97d4ic3vTs
         p9h2Nyl20uLlbKi6VT/tkV2MFhsQy2ZcvQUsc5bwWYFeSCfuY5uEbqqfwpandg+DSAh4
         FO3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vho0OopB9mjCM9UrguuvOmptVTvFyF1oxWRbq8f6VP8=;
        b=3H69MeumMaAI9prHTTFMayVTrhCjt0Fj6pbBdzeAk5HTForpdIjgYz0o/mD5H4BdkQ
         kl9CBckx79UtarlzH5bapa4olaXDBb4a5teTInP3d+BTOSJOoxs5X4i/mH/cvb9gqc+M
         bZ0GC439ZSw0Jl92952PzSuTZY2htMj1/5/sflA9tyuCpfPEH0aKaZUYN2WVHI1el5sR
         McoxSUngeRgvjCbfGvtq6OQF467uQQXQg3u01rd9p3io5m7U/YKiQM4cSDQBL/hN4Oim
         Hglwl21IPYIFIYCoptb3rtDOs03l59jO4MaPxTIHBD+ycz5Tkfzr0CnHl9WjMph++BIX
         QcuQ==
X-Gm-Message-State: AJIora+H3UAxco0xG2I+aIvphlPcOEdgkubFLh6GGsNBSY5mFbcyPn6n
        6ys2ECIRD0Zk0aF4B+gGd4wrbDMd1z6NWTkjzgAQgA==
X-Google-Smtp-Source: AGRyM1sGe5s0tx4ElESsiFEGgUWoWlS4AfXFoO6mxMHI64wXMqWdSALqc084YyOGHKNs71j3cyQJL6TOgjChySFgrEY=
X-Received: by 2002:a25:bdc9:0:b0:668:3d05:e009 with SMTP id
 g9-20020a25bdc9000000b006683d05e009mr29282991ybk.402.1655791881781; Mon, 20
 Jun 2022 23:11:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220621043506.1142851-1-yunkec@google.com> <YrFcWWRWWIj23mk/@pendragon.ideasonboard.com>
In-Reply-To: <YrFcWWRWWIj23mk/@pendragon.ideasonboard.com>
From:   Yunke Cao <yunkec@google.com>
Date:   Tue, 21 Jun 2022 15:11:11 +0900
Message-ID: <CANqU6Fc9wmULUcTzNFBoiWaQpjiJmKqu5j-XFetV6mu=QAgb3g@mail.gmail.com>
Subject: Re: [PATCH v1] media: uvcvideo: user entity get_cur in uvc_ctrl_set
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thanks for the review.

On Tue, Jun 21, 2022 at 2:51 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Yunke,
>
> Thank you for the patch.
>
> On Tue, Jun 21, 2022 at 01:35:06PM +0900, Yunke Cao wrote:
> > Entity controls should get_cur using an entity-defined function
> > instead of via a query. Fix this in uvc_ctrl_set.
> >
> > Fixes: 65900c581d01 ("media: uvcvideo: Allow entity-defined get_info and get_cur")
> > Signed-off-by: Yunke Cao <yunkec@google.com>
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index 0e78233fc8a0..54c047019313 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -1787,15 +1787,21 @@ int uvc_ctrl_set(struct uvc_fh *handle,
> >               if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) == 0) {
> >                       memset(uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> >                               0, ctrl->info.size);
> > +             } else if (ctrl->entity->get_cur) {
> > +                     ret = ctrl->entity->get_cur(chain->dev,
> > +                             ctrl->entity,
> > +                             ctrl->info.selector,
> > +                             uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> > +                             ctrl->info.size);
> >               } else {
> >                       ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR,
> >                               ctrl->entity->id, chain->dev->intfnum,
> >                               ctrl->info.selector,
> >                               uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> >                               ctrl->info.size);
> > -                     if (ret < 0)
> > -                             return ret;
> >               }
> > +             if (ret < 0)
> > +                     return ret;
>
> ret may be used uninitialized here.
>
> >
> >               ctrl->loaded = 1;
>
> There's very similar code in __uvc_ctrl_get(), could it be factored out,
> maybe into a __uvc_ctrl_get_cur() function ?
>

Sounds good! I'm sending out v2.

Changelog since v1:
-Factored out common logic into __uvc_ctrl_load_cur(). (I called it
"load_cur" because I feel it's a bit more accurate)

Best,
Yunke

> >       }
>
> --
> Regards,
>
> Laurent Pinchart
