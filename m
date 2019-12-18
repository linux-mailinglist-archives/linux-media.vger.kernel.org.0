Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 116CF1250F1
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2019 19:47:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726939AbfLRSrI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Dec 2019 13:47:08 -0500
Received: from mail-io1-f52.google.com ([209.85.166.52]:34575 "EHLO
        mail-io1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726698AbfLRSrH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Dec 2019 13:47:07 -0500
Received: by mail-io1-f52.google.com with SMTP id z193so3080159iof.1
        for <linux-media@vger.kernel.org>; Wed, 18 Dec 2019 10:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=digital-loggers.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bTzT9Ss4rnmCQo1sZL5vMSNpaoVKhxsNxQ/uoquX5C8=;
        b=H53JNQplnBOMXwzqEVU3SvLuqRjuhhBp3i3xkU372VL1FkG2Ce2ZhNDYCpo3+rbMHl
         ULTNTBKpL27vU+E+YbPI9Fj+beA1jEeppBhHsfYxlDGKbaTfrFzqvQrWi48u0nGzKe2y
         eeVpBK0+ZelK02FXQPoWMQRCvcieB1FMpwRPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bTzT9Ss4rnmCQo1sZL5vMSNpaoVKhxsNxQ/uoquX5C8=;
        b=BIO/v5Jgj7kxOhHSYB633sqdkIcqgJKxIyxSmPpto9YEGHcc/r9VmPza2cNofyvwfa
         /3rxhvM2s7e1PH3Hdf6EdcivGO1rVBOotytZOQsgjOvVlJ1cYQjaetP1SUD92Qg4zuao
         Pm+vz8fDM8sW4uWoTklsu2o3mTERnUioxrN8rvQO442Ul/QsW/iGIW4LhF0AgcXy5jkt
         O7TBIJC4NWKpb43jipCGSwfLVbG5zHVg0AuUHXa+Eumk7S60EyC8f84eIYVO1jznh4Pu
         eOmTm//EyNHTupEzbYDPrAGCPyTr19OkwIQ+/MERM5h+4rzzXuo5ogYGYeZYnrQnDqya
         lDBA==
X-Gm-Message-State: APjAAAVtAwnDTnDOlh1cq3vJKqBkaCMC20A2h4nWo+kjgbYVyhd6uNJ9
        dDk0pGIwZEnFL4Q1dscVER6ZUnadqqKLWTXaWlZaDQ==
X-Google-Smtp-Source: APXvYqwTyDAW3AekAiA7ak/Usek3o7lzL5WOfUGWwIV/JxOWV0yPKkLXJEhm12obmY30AXmUcIOwIx2HcjCTT6bWEFo=
X-Received: by 2002:a02:6989:: with SMTP id e131mr3776072jac.142.1576694827076;
 Wed, 18 Dec 2019 10:47:07 -0800 (PST)
MIME-Version: 1.0
References: <CADYCxoMAD_scAwGE89oULPgOWOjji6ADTXkG30oRwNLjPdAJrw@mail.gmail.com>
 <20191003093123.3407-1-szakharchenko@digital-loggers.com> <20191218180006.GD17876@pendragon.ideasonboard.com>
In-Reply-To: <20191218180006.GD17876@pendragon.ideasonboard.com>
From:   Sergey Zakharchenko <szakharchenko@digital-loggers.com>
Date:   Wed, 18 Dec 2019 22:46:40 +0400
Message-ID: <CANSNw=8mD0BCD_G8YDj=F_yk822jchVC=09i_BLDeymzNTr-ag@mail.gmail.com>
Subject: Re: [PATCH v3] media: uvcvideo: Add a quirk to force GEO GC6500
 Camera bits-per-pixel value
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Martin Bodo <martin@digital-loggers.com>,
        "Logan, Peter" <peter.logan@intel.com>,
        Auke Kok <auke-jan.h.kok@intel.com>,
        Sergey Zakharchenko <doublef.mobile@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Laurent,

Laurent Pinchart <laurent.pinchart@ideasonboard.com>:
> I'm sorry for the late reply, this patch fell through the cracks :-S

It's OK, thanks for getting back to it!

> > +             /* Some devices report bpp that doesn't match the format. */
> > +             if (dev->quirks & UVC_QUIRK_FORCE_BPP) {
>
> Both info and div can be declared here.

Right; however I was just following what seemed to be the existing
practice of declaring all variables at the start of a function (which
I'm not fond of myself; e.g. fmtdesc is only used in a single switch
branch). Now after looking at the code more, there are precedents for
declaring closer to point of use in e.g. uvc_parse_control and
elsewhere, so this is probably OK.

> The patch otherwise looks good
> to me, so I'll make this modification when applying it, unless you would
> prefer resending it.

Sure, go ahead, and thanks!

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> I however had a closer look at how bpp is used, and I think it would
> make sense to actually drop usage of this field.

This is most probably possible (the only cases I could think of in
which it couldn't be calculated, it would have to be fractional or no
meaningful value could be assigned to it) but out of scope of this
patch.

Best regards,

-- 
Sergey Zakharchenko
Digital Loggers, Inc.
