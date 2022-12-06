Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 368C4644B94
	for <lists+linux-media@lfdr.de>; Tue,  6 Dec 2022 19:22:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230224AbiLFSWr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Dec 2022 13:22:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230176AbiLFSWC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Dec 2022 13:22:02 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E61444047A
        for <linux-media@vger.kernel.org>; Tue,  6 Dec 2022 10:20:41 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id o12so15220388pjo.4
        for <linux-media@vger.kernel.org>; Tue, 06 Dec 2022 10:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SmfitBybMnS/Wj94vd7x5N2kws71Idrw6YNQ9leOyNo=;
        b=c9JxTj7LI1SYoC4Oj7rDxpSE78N6jJ5KYh3VUez+tQdf1RUTxU5rfiP3ffvLDrZxHg
         EOF4Rbv52ML0bxNSicMy1gptxn6dKToWbeYeMDlTYodqslUUHz+3/lQDP9ZuEekcJ8Wm
         nlW7bIU1TB7dE51RXtBhjdw4OmeoOP2KcQcho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SmfitBybMnS/Wj94vd7x5N2kws71Idrw6YNQ9leOyNo=;
        b=BuytLZWP6f4OlLgw0nfD0T+ZLNfqA4g7UfvCPkGYgrGmpChqFKuUAdsZoJKt9FeeEK
         6ZLyf4mF96T1R0nTOfrm+W/AQnGR3PpOdu0PphA4ySGBUSta9X/b0QApKO8QZuCw7uDE
         /G19lj/touHKgk0U2YuFFgSbeOjfTSoofmvwPPTy48k/PVMJpEdplYJRfRXzbc0kOeUJ
         d7hB1sWQldVJ4FLaDjXIePWTz9X3V69otDWRe1TeqDAWgCYy9NRZvz3t1eAr8MLlsXh6
         ajCYpeZgBZI2Wk4/u7PgA/XBXUfrhzAozaPfrIRuos/vdyLBNkwtR61Bt+eu+DxUGoin
         fIqw==
X-Gm-Message-State: ANoB5pm2silRPix/SzL4kPqNognujI23T+GM5w+5dmPyB2eyQqOaHa7q
        AnsE7ZG6+FBBvIwG4ugWK2C94mRpCgRtb9wDehI=
X-Google-Smtp-Source: AA0mqf6T+msIMOeFvqFlp9voHZ94PfoEi6UyiogMp7y+IL0/ExzwWaGdiMhInLff5w7eXG2O499npA==
X-Received: by 2002:a17:90a:f298:b0:219:a032:1760 with SMTP id fs24-20020a17090af29800b00219a0321760mr18712712pjb.88.1670350825967;
        Tue, 06 Dec 2022 10:20:25 -0800 (PST)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com. [209.85.215.176])
        by smtp.gmail.com with ESMTPSA id q2-20020a635c02000000b004768b74f208sm10149425pgb.4.2022.12.06.10.20.25
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Dec 2022 10:20:25 -0800 (PST)
Received: by mail-pg1-f176.google.com with SMTP id v3so14116102pgh.4
        for <linux-media@vger.kernel.org>; Tue, 06 Dec 2022 10:20:25 -0800 (PST)
X-Received: by 2002:a63:1a07:0:b0:477:cb5a:ad48 with SMTP id
 a7-20020a631a07000000b00477cb5aad48mr52082800pga.63.1670350824464; Tue, 06
 Dec 2022 10:20:24 -0800 (PST)
MIME-Version: 1.0
References: <20220909221335.15033-1-m.grzeschik@pengutronix.de>
 <Y4u+9g/gIneGZrlZ@pendragon.ideasonboard.com> <Y4xaXHLoiPupWM6V@kroah.com>
 <Y45f272a3aa7KXly@pendragon.ideasonboard.com> <20221206170721.GB15222@pengutronix.de>
In-Reply-To: <20221206170721.GB15222@pengutronix.de>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Tue, 6 Dec 2022 19:20:13 +0100
X-Gmail-Original-Message-ID: <CANiDSCtqndz9088oxCv7_CfnkhyN4f=HsuwmjaZL0DznB0=RxQ@mail.gmail.com>
Message-ID: <CANiDSCtqndz9088oxCv7_CfnkhyN4f=HsuwmjaZL0DznB0=RxQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] usb: gadget: uvc: parse configfs entries and
 implement v4l2 enum api calls
To:     Michael Grzeschik <mgr@pengutronix.de>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        balbi@kernel.org, paul.elder@ideasonboard.com,
        kernel@pengutronix.de, nicolas@ndufresne.ca,
        kieran.bingham@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael

On Tue, 6 Dec 2022 at 18:09, Michael Grzeschik <mgr@pengutronix.de> wrote:
>
> On Mon, Dec 05, 2022 at 11:17:15PM +0200, Laurent Pinchart wrote:
> >On Sun, Dec 04, 2022 at 09:29:16AM +0100, Greg KH wrote:
> >> On Sat, Dec 03, 2022 at 11:26:14PM +0200, Laurent Pinchart wrote:
> >> > Hi Michael,
> >> >
> >> > On Sat, Sep 10, 2022 at 12:13:31AM +0200, Michael Grzeschik wrote:
> >> > > This series improves the uvc video gadget by parsing the configfs
> >> > > entries. With the configfs data, the userspace now is able to use simple
> >> > > v4l2 api calls like enum and try_format to check for valid configurations
> >> > > initially set by configfs.
> >> >
> >> > I've realized that this whole series got merged, despite my multiple
> >> > attempts to explain why I think it's not a good idea. The UVC gadget
> >> > requires userspace support, and there's no point in trying to move all
> >> > these things to the kernel side. It only bloats the kernel, makes the
> >> > code more complex, more difficult to maintain, and will make UVC 1.5
> >> > support more difficult.
> >>
> >> I can easily revert them, but I did not see any objections to them
> >> originally and so I merged them as is the normal method :)
> >
> >I don't think a revert is needed. The issue I pointed out regarding the
> >duplication of static const data can be solved on top. The API additions
> >from this series are, in my opinion, not a good idea for the reasons I
> >explained, but they don't hurt so much that we need to go nuclear on
> >this.
> >
> >Michael, will you be addressing the static const data issue ?
>
> Yes. I will also move the uvc_fmts[] array and uvc_format_by_guid to its
> own compile unit.
>
> I will go with drivers/media/usb/uvc.c
>
> While at it the headerfile will better also be moved from
> include/media/v4l2-uvc.h to linux/usb/uvc.h.

And since it is free to ask :P....

Could you also try to remove the string definition and use the one
from v4l2-ioctl.c. ?

Or maybe it is not feasible?

Thanks!

>
> Thanks,
> Michael
>
>
> --
> Pengutronix e.K.                           |                             |
> Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |



-- 
Ricardo Ribalda
