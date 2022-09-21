Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE1455E5596
	for <lists+linux-media@lfdr.de>; Wed, 21 Sep 2022 23:53:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231164AbiIUVxF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Sep 2022 17:53:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229686AbiIUVwp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Sep 2022 17:52:45 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A4DFA6C5D
        for <linux-media@vger.kernel.org>; Wed, 21 Sep 2022 14:52:44 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id y17so16767602ejo.6
        for <linux-media@vger.kernel.org>; Wed, 21 Sep 2022 14:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=lRVqvxjsImICcLNKUVbFrgWAVXSPuGFIVQqIM5gPKIE=;
        b=BUzD055h0ufytcC9dWBKCLUhoW4ASESdfaphkVEQZnZJaGF9ESzis/omVqNIyqzq6/
         h0HVaA5F9Z3CpOUIuj3VUGesCabJm+ufUlaDlC8oPTJh4EiH1o1o1y+8IHNYrBLTbGw4
         pAlCcmlv1meJ1eodkNghM4xK/amx9BoxiwjdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=lRVqvxjsImICcLNKUVbFrgWAVXSPuGFIVQqIM5gPKIE=;
        b=DqYLkXGUFaJRBWWh+UuxHduekIh29lW2mqiexmLy5WJsYh6rfkJUP5fwTgBZYPd9W6
         weZygidrkDfIshfl3J14tVpRR5FgNFsMlh2SX7a7vDiS3YzB9REts/JsbxUbPzTd29e3
         pRx2Ttj/jlq3mICxxps0VCAAQT5+Zsmevm1MubMeIfPSA+YTrlC3svZ6vlalMgMdt+95
         Jd49DR7orZcRMvY4wxHqCbDY9sZTtpStB00pt3oZ6QzLAHG/RDm6EOg2NQC7l7gb2kBe
         cYgYZvg4e40qS85UUcJdG7bxkNAogcMQF5EXteq32T3WlzQWUaHn0Ts3e6ne5zAXgVhB
         3Q/A==
X-Gm-Message-State: ACrzQf2ptv4eYmPjYdeKjEauXmtR2ENfkxAnR8o3E/Ks4uydP+5OrZbG
        xcEp1ViCgPhX2YvUjoMLEghQWKfUWFdxesQOIqE=
X-Google-Smtp-Source: AMsMyM7jNzPG3VMReJW7Sz60UBGyzd4DMDx4OrW5nNroA6AwKgtzlkYJ5KrnZfo8FqTePH0u+AETmQ==
X-Received: by 2002:a17:907:72c8:b0:77f:e3f1:db2a with SMTP id du8-20020a17090772c800b0077fe3f1db2amr292649ejc.198.1663797163023;
        Wed, 21 Sep 2022 14:52:43 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id u17-20020a056402065100b0045081dc93dfsm2456523edx.78.2022.09.21.14.52.41
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 14:52:42 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id q21so10772569edc.9
        for <linux-media@vger.kernel.org>; Wed, 21 Sep 2022 14:52:41 -0700 (PDT)
X-Received: by 2002:a05:6402:298b:b0:44f:20a:2db2 with SMTP id
 eq11-20020a056402298b00b0044f020a2db2mr197728edb.138.1663797161592; Wed, 21
 Sep 2022 14:52:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220920-invalid-desc-v1-0-76a93174f3bc@chromium.org>
 <20220920-invalid-desc-v1-1-76a93174f3bc@chromium.org> <Yypgi6Jc9/tZLtIw@pendragon.ideasonboard.com>
 <CANiDSCsbwYfnqcWOjAJw2qvZnB-qE66LqGMhpD8youDj=f+U-g@mail.gmail.com> <Yyt/LhNoEEfjly54@pendragon.ideasonboard.com>
In-Reply-To: <Yyt/LhNoEEfjly54@pendragon.ideasonboard.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Wed, 21 Sep 2022 23:52:29 +0200
X-Gmail-Original-Message-ID: <CANiDSCsSsKk37JtBZjQiuw6MoH+f-iCf47MqU9BH18gbd4EKAg@mail.gmail.com>
Message-ID: <CANiDSCsSsKk37JtBZjQiuw6MoH+f-iCf47MqU9BH18gbd4EKAg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] media: uvc: Handle cameras with invalid descriptors
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        syzbot <syzkaller@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Wed, 21 Sept 2022 at 23:16, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> On Wed, Sep 21, 2022 at 09:51:44AM +0200, Ricardo Ribalda wrote:
> > Do you mean something like this?
> >
> > diff --git a/drivers/media/usb/uvc/uvc_entity.c
> > b/drivers/media/usb/uvc/uvc_entity.c
> > index 7c4d2f93d351..66d1f5da4ec7 100644
> > --- a/drivers/media/usb/uvc/uvc_entity.c
> > +++ b/drivers/media/usb/uvc/uvc_entity.c
> > @@ -37,7 +37,7 @@ static int uvc_mc_create_links(struct uvc_video_chain *chain,
> >                         continue;
> >
> >                 remote = uvc_entity_by_id(chain->dev, entity->baSourceID[i]);
> > -               if (remote == NULL)
> > +               if (remote == NULL || remote->num_pads == 0)
> >                         return -EINVAL;
>
> Yes.
>
> >
> >                 source = (UVC_ENTITY_TYPE(remote) == UVC_TT_STREAMING)
> > @@ -46,6 +46,9 @@ static int uvc_mc_create_links(struct uvc_video_chain *chain,
> >                 if (source == NULL)
> >                         continue;
> >
> > +               if (source->num_pads != remote->num_pads)
> > +                       return -EINVAL;
> > +
>
> But this I would have dropped, as the media_entity num_pads is
> initialized from uvc_entity num_pads and neither are changed after.

Works for me. Shall I send a v2 or you can take it?

Thanks!
>
> >                 remote_pad = remote->num_pads - 1;
> >                 ret = media_create_pad_link(source, remote_pad,
> >                                                sink, i, flags);
> >
> > regarding making a new patch, whatever is easier for you ;)
> >
> >
> > On Wed, 21 Sept 2022 at 02:53, Laurent Pinchart wrote:
> > >
> > > Hi Ricardo,
> > >
> > > Thank you for the patch.
> > >
> > > On Tue, Sep 20, 2022 at 04:04:55PM +0200, Ricardo Ribalda wrote:
> > > > If the source entity does not contain any pads, do not create a link.
> > > >
> > > > Reported-by: syzbot <syzkaller@googlegroups.com>
> > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > >
> > > > diff --git a/drivers/media/usb/uvc/uvc_entity.c b/drivers/media/usb/uvc/uvc_entity.c
> > > > index 7c4d2f93d351..1f730cb72e58 100644
> > > > --- a/drivers/media/usb/uvc/uvc_entity.c
> > > > +++ b/drivers/media/usb/uvc/uvc_entity.c
> > > > @@ -43,7 +43,7 @@ static int uvc_mc_create_links(struct uvc_video_chain *chain,
> > > >               source = (UVC_ENTITY_TYPE(remote) == UVC_TT_STREAMING)
> > > >                      ? (remote->vdev ? &remote->vdev->entity : NULL)
> > > >                      : &remote->subdev.entity;
> > > > -             if (source == NULL)
> > > > +             if (source == NULL || source->num_pads == 0)
> > >
> > > source->num_pads and remote->num_pads should always be identical, but as
> > > the next line uses remote->num_pads, wouldn't it be better to test that
> > > variable ? If so, I'd move the test a file lines earlier, with the
> > > remote == NULL test.
> > >
> > > What do you think ? If you agree I can make that change when applying,
> > > there's no need for a new version. Otherwise I'll keep the patch as-is.
> > >
> > > >                       continue;
> > > >
> > > >               remote_pad = remote->num_pads - 1;
> > > >
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
