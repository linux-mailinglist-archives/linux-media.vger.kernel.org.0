Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D60765C215
	for <lists+linux-media@lfdr.de>; Tue,  3 Jan 2023 15:40:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238060AbjACOib (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Jan 2023 09:38:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238066AbjACOiQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Jan 2023 09:38:16 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 050791274A
        for <linux-media@vger.kernel.org>; Tue,  3 Jan 2023 06:37:35 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id d3so32749715plr.10
        for <linux-media@vger.kernel.org>; Tue, 03 Jan 2023 06:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wqfFFHAyvqsLmgM2yfmYHneo/JOpztsRLGoLHK+NPXk=;
        b=Kf+xME4jFYtJHUyw0Rj1pQ/k7YhClO3rP3zHIsOqtyOwpdSzxKuEyv72mo9f2TcBM7
         M3WBbHt0oyL6J5PFuOGFGOGOTrXJdzJ4DjmD7CsfbVW39Nb2wZzlCuOtW79GbjbwUY9l
         so7LUtmcurnCRYUzrGgCjWilqJf5Okl3Heutk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wqfFFHAyvqsLmgM2yfmYHneo/JOpztsRLGoLHK+NPXk=;
        b=lbOR9aGNl8IEneK0yALnykri0D01vSRkRA71F6skVR4q9V8/nasrxzxpBnTesoLaIp
         hmwC6eN1vuKvhxLQj+coLq0fFrrfbG3vjh04BkoIKusz2lN97MUfocMT7u8T8psmf1PZ
         dal1i00Qxfu/bwQ/XajBFYWDOnRAYo98AXledenuIbgf7u0nv8V+HdeW417DXgL7n+L7
         ZKM8LrhYRnoegV5vQkuHmoWl2kwGyok6TLNOZjYNMHFvrcdkRBOc4cF3InPnAyA9aIzN
         p0n7RqlGKWNKXpmI7ORh14IHzUVZcMVaeafT23Vi6aE8ey8o6av8GQB0dNjI1pIDPGoa
         arhw==
X-Gm-Message-State: AFqh2krQ2cd9DjW2C3XzH4GOX9pKS4oaKs1IkDje0fDRCobWX65kiXCt
        n83S/oMOMO3+njVvQWzIoCct+0/9q1pxRDDW43k=
X-Google-Smtp-Source: AMrXdXskE+sKX+1/e53yQz+549X7qr1jJmhIjGBhiazI/1P10gPIf+gi72g4JwX5qTqIjoizwwxxZg==
X-Received: by 2002:a17:902:e74c:b0:189:9cfd:be79 with SMTP id p12-20020a170902e74c00b001899cfdbe79mr66705857plf.15.1672756654355;
        Tue, 03 Jan 2023 06:37:34 -0800 (PST)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com. [209.85.215.181])
        by smtp.gmail.com with ESMTPSA id u6-20020a170902e5c600b0018c7a5e052asm22403448plf.225.2023.01.03.06.37.32
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jan 2023 06:37:33 -0800 (PST)
Received: by mail-pg1-f181.google.com with SMTP id e10so6333558pgc.9
        for <linux-media@vger.kernel.org>; Tue, 03 Jan 2023 06:37:32 -0800 (PST)
X-Received: by 2002:aa7:99cd:0:b0:581:3f7a:8ad0 with SMTP id
 v13-20020aa799cd000000b005813f7a8ad0mr1778045pfi.21.1672756652431; Tue, 03
 Jan 2023 06:37:32 -0800 (PST)
MIME-Version: 1.0
References: <20220920-resend-v4l2-compliance-v2-0-b0ceb15353ac@chromium.org> <Y64Q/yRRzxt8IByG@pendragon.ideasonboard.com>
In-Reply-To: <Y64Q/yRRzxt8IByG@pendragon.ideasonboard.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Tue, 3 Jan 2023 15:37:21 +0100
X-Gmail-Original-Message-ID: <CANiDSCsQ=1fem5MD3273_xGzd8gKuAh3T_UvWhAHCpQHN3AkbA@mail.gmail.com>
Message-ID: <CANiDSCsQ=1fem5MD3273_xGzd8gKuAh3T_UvWhAHCpQHN3AkbA@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 0/7] Follow-up patches for uvc v4l2-compliance
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hans Verkuil <hans.verkuil@cisco.com>
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

On Thu, 29 Dec 2022 at 23:13, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> On Fri, Dec 02, 2022 at 06:21:34PM +0100, Ricardo Ribalda wrote:
> > This patchset contains the fixes for the comments on "v10 of Fix
> > v4l2-compliance errors series". In particular to the patches
> >
> > -uvcvideo: uvc_ctrl_is_accessible: check for INACTIVE
> > -uvcvideo: improve error handling in uvc_query_ctrl()
> >
> > And the patch:
> > -uvcvideo: Fix handling on Bitmask controls
>
> Patches 1/7, 3/7, 4/7 and 6/7 are fine (possibly with changes mentioned
> in my review comments that I can handle when applying). I can apply them
> to my tree already (with a minor conflict resolution between 2/7 and
> 3/7), but it may be easier for you to send a v3 of the whole series.
> Please let me know what you'd prefer.

Just sent a v3 of the patchset. If 1-8 are OK, feel free to to merge
them in your tree, we can add
"Use-standard-names-for-menus" later. It is not needed to pass the
compliance. It is on this set just because it depends on this set.

Thanks!

> > To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > To: Mauro Carvalho Chehab <mchehab@kernel.org>
> > Cc: linux-media@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: Hans Verkuil <hans.verkuil@cisco.com>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> >
> > ---
> > Changes in v2:
> > - Include "Get menu names from framework series"
> >   https://lore.kernel.org/r/20220920-standard-menues-v2-0-a35af3243c2f@chromium.org
> > - Link to v1: https://lore.kernel.org/r/20220920-resend-v4l2-compliance-v1-0-81364c15229b@chromium.org
> >
> > ---
> > Hans Verkuil (2):
> >       media: uvcvideo: uvc_ctrl_is_accessible: check for INACTIVE
> >       media: uvcvideo: improve error logging in uvc_query_ctrl()
> >
> > Ricardo Ribalda (5):
> >       media: uvcvideo: Return -EACCES for Wrong state error
> >       media: uvcvideo: Do not return positive errors in uvc_query_ctrl()
> >       media: uvcvideo: Fix handling on Bitmask controls
> >       media: uvcvideo: Implement mask for V4L2_CTRL_TYPE_MENU
> >       media: uvcvideo: Use standard names for menus
> >
> >  drivers/media/usb/uvc/uvc_ctrl.c   | 230 ++++++++++++++++++++++++++++---------
> >  drivers/media/usb/uvc/uvc_driver.c |   9 +-
> >  drivers/media/usb/uvc/uvc_v4l2.c   |  85 ++++++++++----
> >  drivers/media/usb/uvc/uvc_video.c  |  15 +--
> >  drivers/media/usb/uvc/uvcvideo.h   |   8 +-
> >  include/uapi/linux/uvcvideo.h      |   3 +-
> >  6 files changed, 258 insertions(+), 92 deletions(-)
> > ---
> > base-commit: 521a547ced6477c54b4b0cc206000406c221b4d6
> > change-id: 20220920-resend-v4l2-compliance-4fdbe4fbd7b5
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
