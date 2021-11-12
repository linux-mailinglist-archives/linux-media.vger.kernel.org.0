Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4515A44E45C
	for <lists+linux-media@lfdr.de>; Fri, 12 Nov 2021 11:09:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234903AbhKLKMT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Nov 2021 05:12:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234778AbhKLKMS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Nov 2021 05:12:18 -0500
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 241F1C061766
        for <linux-media@vger.kernel.org>; Fri, 12 Nov 2021 02:09:28 -0800 (PST)
Received: by mail-ot1-x32f.google.com with SMTP id o15-20020a9d410f000000b0055c942cc7a0so13116790ote.8
        for <linux-media@vger.kernel.org>; Fri, 12 Nov 2021 02:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1UIviT/iEpg02tsl0vodgO77AUWUF+iHJhNcWDAIxyc=;
        b=Nnb+RTc6JF+hYggAcUVzXhgUOACSv0jPxNKXJmP7yUn7da86rIHZDkX5C1ujcB3/QJ
         ydDQmIpPnQ6DZM6m72F3fDxxHqnCyruXtRazYSHUvbO2hQUTUo4c3qE5H5l3WQuRmPK0
         G+TvzsCIBIiNoKOksP2Pway8YErnfPCpaaLVY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1UIviT/iEpg02tsl0vodgO77AUWUF+iHJhNcWDAIxyc=;
        b=ahvYdOXnypzNZQESUd3nlPs4GAUcA3YojCbM88NZgWNNjR9ql+dOqpmf1NFe98UUjx
         7e6bjcAdp5pjneSFXT2LXIHhVz9mXejBbU7QQ2ZIrEEbvzBk4ByRgJEirGzmSdRv0DOf
         9QoVa0RQXh7eHlHBEuEufIJ6+j+en67ncld6+omub/2Xlhk0uCKqdZrWL1DAjeMdCoUN
         ojJ86oWG2hRgOFMtaSLDdO4WS9Jo5+wT0RIglHxcUsGdDMAu2acPE/o8GqPTvSZvLaHy
         iW2KLpoxw6wXiLk4Wbja9LRNIrt6xwMgRALJTWLT6FV3mPfVSOpPg38+XSy1LPo0AlgX
         P/yQ==
X-Gm-Message-State: AOAM532JFyuyQEJTzI3b9g6GyZzxZKXZNR/rHZpE/f39kwABA7Vnh3jb
        0mraLFutXxnBTfp/SzzsHmPZ/hf8VmqCLA==
X-Google-Smtp-Source: ABdhPJzYL+MzxpdHf6R9XMHA/lh6vANxbGuYjV+XmTB5tY7dBRNvj+reRP7Q82vs8HaUmTRhkAQOjw==
X-Received: by 2002:a9d:5911:: with SMTP id t17mr11562012oth.30.1636711767254;
        Fri, 12 Nov 2021 02:09:27 -0800 (PST)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com. [209.85.167.179])
        by smtp.gmail.com with ESMTPSA id r24sm1172601otc.12.2021.11.12.02.09.25
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 02:09:26 -0800 (PST)
Received: by mail-oi1-f179.google.com with SMTP id 7so6859608oip.12
        for <linux-media@vger.kernel.org>; Fri, 12 Nov 2021 02:09:25 -0800 (PST)
X-Received: by 2002:aca:be54:: with SMTP id o81mr25029359oif.64.1636711765360;
 Fri, 12 Nov 2021 02:09:25 -0800 (PST)
MIME-Version: 1.0
References: <20210909150046.57615-1-ribalda@chromium.org> <CADvTj4rB5ZThAh2oPkx2=mqUir4Bc_uFFaL6DV_YyOYNSDrXEQ@mail.gmail.com>
 <CANiDSCvpRezQMEBbmv4z9ttPt9sThHXR2xmnizzacYuMDri-KQ@mail.gmail.com>
 <CADvTj4pAxGYeuQEN_ktHko41z=bCWWb1UtbdngezMoUUsvsj6Q@mail.gmail.com>
 <CANiDSCvkcr8hbdo4Ea2p3BdMPiPE2RC_HcHHmUdm9uy1XN2E4Q@mail.gmail.com> <CADvTj4r_SzChXj04Ddn6PPUDN7QnKczm6MJXeES-uUUQx3ds+Q@mail.gmail.com>
In-Reply-To: <CADvTj4r_SzChXj04Ddn6PPUDN7QnKczm6MJXeES-uUUQx3ds+Q@mail.gmail.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Fri, 12 Nov 2021 11:09:14 +0100
X-Gmail-Original-Message-ID: <CANiDSCsDWz5rS881NXXcuxJYb5RP=HLEmdQaYiKrjqyvhO223A@mail.gmail.com>
Message-ID: <CANiDSCsDWz5rS881NXXcuxJYb5RP=HLEmdQaYiKrjqyvhO223A@mail.gmail.com>
Subject: Re: [PATCH 0/4] Follow-up patches for uvc v4l2-compliance
To:     James Hilliard <james.hilliard1@gmail.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        tfiga@chromium.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi James


>Pixel Format      : 'MJPG' (Motion-JPEG)
>Field             : None
>Bytes per Line    : 0
>Size Image        : 614400
>Colorspace        : Default

>ioctl(3, VIDIOC_G_FMT, {type=0 /* V4L2_BUF_TYPE_??? */}) = -1 EINVAL
>(Invalid argument)
>ioctl(3, VIDIOC_G_FMT, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
>fmt.pix={width=640, height=480, pixelformat=v4l2_fourcc('M', 'J', 'P',
>'G') /* V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_NONE, bytesperline=0,
>sizeimage=614400, colorspace=V4L2_COLORSPACE_DEFAULT}}) = 0
>write(1, "\t\t\33[1;31mfail\33[0m: v4l2-test-for"..., 59 fail:
>v4l2-test-formats.cpp(358): !colorspace
>) = 59

Thanks for testing it out. In this case I believe that it is a camera
bug. The error is due to the fact that the colorspace is does not have
a valid value. That value is provided by the camera:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/usb/uvc/uvc_driver.c#n766

You might have to send a patch with a quirk for your device.
