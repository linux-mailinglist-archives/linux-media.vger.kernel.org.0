Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D5F165C297
	for <lists+linux-media@lfdr.de>; Tue,  3 Jan 2023 15:58:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233299AbjACO5C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Jan 2023 09:57:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238095AbjACO4K (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Jan 2023 09:56:10 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 894CF11A3A
        for <linux-media@vger.kernel.org>; Tue,  3 Jan 2023 06:56:08 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id v13-20020a17090a6b0d00b00219c3be9830so31323321pjj.4
        for <linux-media@vger.kernel.org>; Tue, 03 Jan 2023 06:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IPA7zfOs9WX5PlpZIda/yaFJKJmOT3hpKS+FngDkof4=;
        b=AK/pbINJxxsvubXpUA90163gydC2B6cON4fGpFnM57cGOaXX5g6VHUPOy8IiZmwkpo
         YgNjDcvlPpd8M0QfgT3y7Qk1yYkp5LcGvQAiuS+1dpIYvBdkvdcCU5Q5Gg9AohRZ//eE
         LweaQkSsPAT9HOXPdmLSTBnrmrjT4DmvypZPE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IPA7zfOs9WX5PlpZIda/yaFJKJmOT3hpKS+FngDkof4=;
        b=HGX1337Tg+2TMzdYh9c/z+obD81jRpO5//f/l+K223RI507IFL0wcCYo25YrEc8QPY
         8cmsyVsPeeIDfkYAhwZ5j8Q06mLCva0T/V6z4uDM8l+xeeLWwLkkVm8Cly2qNVlTGDJM
         VenDaupf4ZzSmGaHBYV8uT425mjtYwFiElS3En2AZfX7vcS4JBPocPUvTRwyfq//5qNr
         /uNAHruhcMdfOSnp1ZdN7v7KjQFoBz4eQdFvHt81C2n1iIaoW1a5QOx+9f2pGt70SeSC
         ICkymw8YmvRityIrEf5IsdnuSVtcUn4iTvfzqn+pVr5R4BbAQzI+VSTV2UKguiE17P5i
         lV9Q==
X-Gm-Message-State: AFqh2kpzBFoSqnOIsgCcWZFe23WrOujUGFem458QNr5jkZ3uUT9yB1Nl
        0j7yE9xtFQIfKIZjmF8uuSxg/lRwd2JUjnwDl4M=
X-Google-Smtp-Source: AMrXdXt4q7T/xQxdWgfr9L7qsIQD4Ngh7hGNmjXgUQIvhsF+EKwhupZ1GeTIqroFodbQ4HpQq5whUg==
X-Received: by 2002:a05:6a21:998a:b0:ad:f86d:c0bc with SMTP id ve10-20020a056a21998a00b000adf86dc0bcmr69999878pzb.7.1672757767488;
        Tue, 03 Jan 2023 06:56:07 -0800 (PST)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com. [209.85.210.180])
        by smtp.gmail.com with ESMTPSA id e28-20020a056a0000dc00b00576f7bd92cdsm10778282pfj.14.2023.01.03.06.56.06
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jan 2023 06:56:06 -0800 (PST)
Received: by mail-pf1-f180.google.com with SMTP id a30so5101657pfr.6
        for <linux-media@vger.kernel.org>; Tue, 03 Jan 2023 06:56:06 -0800 (PST)
X-Received: by 2002:a63:1709:0:b0:48c:8cc5:1b73 with SMTP id
 x9-20020a631709000000b0048c8cc51b73mr2509074pgl.520.1672757765593; Tue, 03
 Jan 2023 06:56:05 -0800 (PST)
MIME-Version: 1.0
References: <20220920-invalid-desc-v1-0-76a93174f3bc@chromium.org>
 <20220920-invalid-desc-v1-1-76a93174f3bc@chromium.org> <Yypgi6Jc9/tZLtIw@pendragon.ideasonboard.com>
 <CANiDSCsbwYfnqcWOjAJw2qvZnB-qE66LqGMhpD8youDj=f+U-g@mail.gmail.com>
 <Yyt/LhNoEEfjly54@pendragon.ideasonboard.com> <CANiDSCsSsKk37JtBZjQiuw6MoH+f-iCf47MqU9BH18gbd4EKAg@mail.gmail.com>
 <Y1bXCP2fzacDuZxE@pendragon.ideasonboard.com>
In-Reply-To: <Y1bXCP2fzacDuZxE@pendragon.ideasonboard.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Tue, 3 Jan 2023 15:55:54 +0100
X-Gmail-Original-Message-ID: <CANiDSCsguMfWEHTGy3yry12uOFL=qELQO6tYwu9L-ueLW+bZpw@mail.gmail.com>
Message-ID: <CANiDSCsguMfWEHTGy3yry12uOFL=qELQO6tYwu9L-ueLW+bZpw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] media: uvc: Handle cameras with invalid descriptors
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        syzbot <syzkaller@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

I think we have missed this patch.

Regards!

On Mon, 24 Oct 2022 at 20:19, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> On Wed, Sep 21, 2022 at 11:52:29PM +0200, Ricardo Ribalda wrote:
> > On Wed, 21 Sept 2022 at 23:16, Laurent Pinchart wrote:
> > > On Wed, Sep 21, 2022 at 09:51:44AM +0200, Ricardo Ribalda wrote:
> > > > Do you mean something like this?
> > > >
> > > > diff --git a/drivers/media/usb/uvc/uvc_entity.c
> > > > b/drivers/media/usb/uvc/uvc_entity.c
> > > > index 7c4d2f93d351..66d1f5da4ec7 100644
> > > > --- a/drivers/media/usb/uvc/uvc_entity.c
> > > > +++ b/drivers/media/usb/uvc/uvc_entity.c
> > > > @@ -37,7 +37,7 @@ static int uvc_mc_create_links(struct uvc_video_chain *chain,
> > > >                         continue;
> > > >
> > > >                 remote = uvc_entity_by_id(chain->dev, entity->baSourceID[i]);
> > > > -               if (remote == NULL)
> > > > +               if (remote == NULL || remote->num_pads == 0)
> > > >                         return -EINVAL;
> > >
> > > Yes.
> > >
> > > >
> > > >                 source = (UVC_ENTITY_TYPE(remote) == UVC_TT_STREAMING)
> > > > @@ -46,6 +46,9 @@ static int uvc_mc_create_links(struct uvc_video_chain *chain,
> > > >                 if (source == NULL)
> > > >                         continue;
> > > >
> > > > +               if (source->num_pads != remote->num_pads)
> > > > +                       return -EINVAL;
> > > > +
> > >
> > > But this I would have dropped, as the media_entity num_pads is
> > > initialized from uvc_entity num_pads and neither are changed after.
> >
> > Works for me. Shall I send a v2 or you can take it?
>
> I'm handling it locally, will be in the next pull request.
>
> > > >                 remote_pad = remote->num_pads - 1;
> > > >                 ret = media_create_pad_link(source, remote_pad,
> > > >                                                sink, i, flags);
> > > >
> > > > regarding making a new patch, whatever is easier for you ;)
> > > >
> > > >
> > > > On Wed, 21 Sept 2022 at 02:53, Laurent Pinchart wrote:
> > > > >
> > > > > Hi Ricardo,
> > > > >
> > > > > Thank you for the patch.
> > > > >
> > > > > On Tue, Sep 20, 2022 at 04:04:55PM +0200, Ricardo Ribalda wrote:
> > > > > > If the source entity does not contain any pads, do not create a link.
> > > > > >
> > > > > > Reported-by: syzbot <syzkaller@googlegroups.com>
> > > > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > > >
> > > > > > diff --git a/drivers/media/usb/uvc/uvc_entity.c b/drivers/media/usb/uvc/uvc_entity.c
> > > > > > index 7c4d2f93d351..1f730cb72e58 100644
> > > > > > --- a/drivers/media/usb/uvc/uvc_entity.c
> > > > > > +++ b/drivers/media/usb/uvc/uvc_entity.c
> > > > > > @@ -43,7 +43,7 @@ static int uvc_mc_create_links(struct uvc_video_chain *chain,
> > > > > >               source = (UVC_ENTITY_TYPE(remote) == UVC_TT_STREAMING)
> > > > > >                      ? (remote->vdev ? &remote->vdev->entity : NULL)
> > > > > >                      : &remote->subdev.entity;
> > > > > > -             if (source == NULL)
> > > > > > +             if (source == NULL || source->num_pads == 0)
> > > > >
> > > > > source->num_pads and remote->num_pads should always be identical, but as
> > > > > the next line uses remote->num_pads, wouldn't it be better to test that
> > > > > variable ? If so, I'd move the test a file lines earlier, with the
> > > > > remote == NULL test.
> > > > >
> > > > > What do you think ? If you agree I can make that change when applying,
> > > > > there's no need for a new version. Otherwise I'll keep the patch as-is.
> > > > >
> > > > > >                       continue;
> > > > > >
> > > > > >               remote_pad = remote->num_pads - 1;
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
