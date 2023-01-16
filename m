Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC9F866BF9A
	for <lists+linux-media@lfdr.de>; Mon, 16 Jan 2023 14:21:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229589AbjAPNU7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Jan 2023 08:20:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbjAPNU4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Jan 2023 08:20:56 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92ED93ABB
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 05:20:53 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id bj3so25912702pjb.0
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 05:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aVbymCc7So56zzlwH/iGqWQN7KU9mVa5OPelxhMkhOE=;
        b=EIUJjiYScUZy3n2+Lld8QU2xjRp0dxOfBk7hhRM3u+wX1xl/AWDuXnJBO3JWmeDhuY
         V0m7aWikOggNOoBI9j5luErufR+44/eKCNQEePfb87+Y3l7l78M7Y1/JVmu0UEO+jUhP
         BXSIv573sWkeIULkhrvAFEN2pAeKy8ECZu+JY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aVbymCc7So56zzlwH/iGqWQN7KU9mVa5OPelxhMkhOE=;
        b=jTTc+/rYT1Y+wCKGl7kmcWPEOGvZAUZ7HEBtEmlWk6vcRctQyNlXJh3+LW0ICFh78l
         ybsXsA3FwYzWQy7Y8vQFYgnLgkiLOM6PqrT29l1NMc2tubzkH5V+r2J224Yz/hVE9xEJ
         gFQXHYhxjmjBLjL0ITh9F6fF6gSHe7oZGtBFHVYzCtHfKKIfyWQtsChH6XkhGUiv4aVW
         KaXjWRk2XQESOt2sAO17eCV097kmdsJU6ZucExWfHZI6aQQVefXQ3DRP6NL5xrtfmEhW
         xSN1GyH1z48nVUCtt1S963ISwqJhdyz5LMlS5Rc2LfHzzSuBYmfgg6ASVfq71eBnIHYE
         GHpw==
X-Gm-Message-State: AFqh2kpcftOjsi9JRj5xpOU1ij+wpUXA2CDw91vej6FAwQsqGGVjRJRX
        /5vv8WttJ8/GcSxlri3OES2kXgLJl4AiqdDq8nI=
X-Google-Smtp-Source: AMrXdXujdIel2igTWcTt5rtS2czVxfrfKNtf/MYD8nZPPqRK+qsyueZ3vMinCCGHNKomdOKygxqe1A==
X-Received: by 2002:a17:902:e809:b0:194:83fd:9a7a with SMTP id u9-20020a170902e80900b0019483fd9a7amr9846077plg.54.1673875252391;
        Mon, 16 Jan 2023 05:20:52 -0800 (PST)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com. [209.85.214.171])
        by smtp.gmail.com with ESMTPSA id n10-20020a170902e54a00b0018971fba556sm19259457plf.139.2023.01.16.05.20.51
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jan 2023 05:20:51 -0800 (PST)
Received: by mail-pl1-f171.google.com with SMTP id k18so6276792pll.5
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 05:20:51 -0800 (PST)
X-Received: by 2002:a17:90a:c984:b0:219:8132:70db with SMTP id
 w4-20020a17090ac98400b00219813270dbmr9193706pjt.183.1673875251059; Mon, 16
 Jan 2023 05:20:51 -0800 (PST)
MIME-Version: 1.0
References: <20230116094032.4389-1-marex@denx.de> <Y8Uq2EtsYi9kmdqw@pendragon.ideasonboard.com>
In-Reply-To: <Y8Uq2EtsYi9kmdqw@pendragon.ideasonboard.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Mon, 16 Jan 2023 14:20:40 +0100
X-Gmail-Original-Message-ID: <CANiDSCtniqdwr7oqvcMfH9sKYMuTX7jyAA9P9ZeCFhEGq8Rnqw@mail.gmail.com>
Message-ID: <CANiDSCtniqdwr7oqvcMfH9sKYMuTX7jyAA9P9ZeCFhEGq8Rnqw@mail.gmail.com>
Subject: Re: [PATCH v2] media: uvcvideo: Add GUID for BGRA/X 8:8:8:8
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Marek Vasut <marex@denx.de>, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        William Manley <will@williammanley.net>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marek!!!

Why do they call MEDIASUBTYPE_RGB32 something that is BRG ? !

Why do WE call XBGR something that is BGRX? !!

Besides our insanity, your patch looks sane. Thanks for it :)

There are some patches on the queue to remove the format definitions,
so your patch might not apply cleanly, I guess Laurent will take care
of it

Thanks


On Mon, 16 Jan 2023 at 11:50, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Marek,
>
> Thank you for the patch.
>
> On Mon, Jan 16, 2023 at 10:40:32AM +0100, Marek Vasut wrote:
> > The Cypress EZUSB FX3 UVC example can be configured to report pixel
> > format "e436eb7e-524f-11ce-9f53-0020af0ba770". This is its GUID for
> > BGRA/X 8:8:8:8.
> >
> > The UVC 1.5 spec [1] only defines GUIDs for YUY2, NV12, M420 and I420.
> > This seems to be an extension documented in the Microsoft Windows Media
> > Format SDK[2]. This Media Format SDK defines this GUID as corresponding
> > to `MEDIASUBTYPE_RGB32`, which is confirmed by [4] as `MEDIASUBTYPE_ARGB32`
> > has different GUID.
> >
> > Note that in my case, the FX3 UVC can output either channel order,
> > BGR or RGB or any other mix for that matter. Since Linux commit
> > 1b8dc32286a1a ("[media] uvcvideo: Add GUID for BGR 8:8:8")
> > defined a GUID for `MEDIASUBTYPE_RGB24` channel order as BGR, keep
> > this change consistent and define `MEDIASUBTYPE_RGB32` as BGR as well.
> > Document [3] also indicates the channel order is BGR.
> >
> > [1] https://www.usb.org/document-library/video-class-v15-document-set
> > [2] https://learn.microsoft.com/en-us/windows/win32/wmformat/media-type-identifiers
> > [3] https://learn.microsoft.com/en-us/windows/win32/directshow/uncompressed-rgb-video-subtypes
> > [4] https://gix.github.io/media-types/
> >
> > Signed-off-by: Marek Vasut <marex@denx.de>
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Ricardo Ribalda <ricardo@ribalda.com>
>
> > ---
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> > Cc: William Manley <will@williammanley.net>
> > ---
> > V2: - Reference document [3] confirming BGR channel order
> >     - Reference document [4] describing MEDIASUBTYPE_ARGB32 with different GUID
> >     - Use V4L2_PIX_FMT_XBGR32 instead of V4L2_PIX_FMT_BGR32 which is deprecated
> > ---
> >  include/media/v4l2-uvc.h | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/include/media/v4l2-uvc.h b/include/media/v4l2-uvc.h
> > index f83e31661333b..b010a36fc1d95 100644
> > --- a/include/media/v4l2-uvc.h
> > +++ b/include/media/v4l2-uvc.h
> > @@ -99,6 +99,9 @@
> >  #define UVC_GUID_FORMAT_BGR3 \
> >       { 0x7d, 0xeb, 0x36, 0xe4, 0x4f, 0x52, 0xce, 0x11, \
> >        0x9f, 0x53, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70}
> > +#define UVC_GUID_FORMAT_BGR4 \
> > +     { 0x7e, 0xeb, 0x36, 0xe4, 0x4f, 0x52, 0xce, 0x11, \
> > +      0x9f, 0x53, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70}
> >  #define UVC_GUID_FORMAT_M420 \
> >       { 'M',  '4',  '2',  '0', 0x00, 0x00, 0x10, 0x00, \
> >        0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
> > @@ -266,6 +269,11 @@ static struct uvc_format_desc uvc_fmts[] = {
> >               .guid           = UVC_GUID_FORMAT_BGR3,
> >               .fcc            = V4L2_PIX_FMT_BGR24,
> >       },
> > +     {
> > +             .name           = "BGRA/X 8:8:8:8 (BGR4)",
> > +             .guid           = UVC_GUID_FORMAT_BGR4,
> > +             .fcc            = V4L2_PIX_FMT_XBGR32,
> > +     },
> >       {
> >               .name           = "H.264",
> >               .guid           = UVC_GUID_FORMAT_H264,
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
