Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5B0E44E4D2
	for <lists+linux-media@lfdr.de>; Fri, 12 Nov 2021 11:46:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233883AbhKLKst (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Nov 2021 05:48:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232791AbhKLKst (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Nov 2021 05:48:49 -0500
Received: from lb2-smtp-cloud9.xs4all.net (lb2-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50BC1C061766;
        Fri, 12 Nov 2021 02:45:58 -0800 (PST)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id lU48mx2XDfwDFlU4BmJirG; Fri, 12 Nov 2021 11:45:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1636713955; bh=pyar9oXQ3ixQqHZwaB2l8o9wWzpoeB3EDMND6IzDdOs=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=pRMWrWqsjbzEAQrElEFsPD+dKwucl/2FD1auwK0Yx0HZEnD8KxaisQ3d1FLj+DVe6
         qUEvlwM7IPuF17v07pdkxc2noWfilXc0dYc6ICdOXGs+JvPFfm6kCa39QVVWTf7RCw
         C8lSJvcKreBF7FyaQsl54mLZlTjIvz7ApTz5yYizM3sukQZTmTlPeVaKWDbN/4zNAG
         vnKuCyBscE0sz0EB7sEpp+FX5YYCeSh/CEobpfxE7ASNg+2tEPF13lA5FeS5XkgCpw
         qMDfaRjZ0rwZRYMhSNR5NFq4/QOmgok8eN0VzdI9N4b6XMGUvPusYSUgS727byp4ac
         Q9fp3ql2qbj+A==
Subject: Re: [PATCH 0/4] Follow-up patches for uvc v4l2-compliance
To:     Ricardo Ribalda <ribalda@chromium.org>,
        James Hilliard <james.hilliard1@gmail.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        tfiga@chromium.org
References: <20210909150046.57615-1-ribalda@chromium.org>
 <CADvTj4rB5ZThAh2oPkx2=mqUir4Bc_uFFaL6DV_YyOYNSDrXEQ@mail.gmail.com>
 <CANiDSCvpRezQMEBbmv4z9ttPt9sThHXR2xmnizzacYuMDri-KQ@mail.gmail.com>
 <CADvTj4pAxGYeuQEN_ktHko41z=bCWWb1UtbdngezMoUUsvsj6Q@mail.gmail.com>
 <CANiDSCvkcr8hbdo4Ea2p3BdMPiPE2RC_HcHHmUdm9uy1XN2E4Q@mail.gmail.com>
 <CADvTj4r_SzChXj04Ddn6PPUDN7QnKczm6MJXeES-uUUQx3ds+Q@mail.gmail.com>
 <CANiDSCsDWz5rS881NXXcuxJYb5RP=HLEmdQaYiKrjqyvhO223A@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <15b2c433-842c-f0b0-f420-b80325c715eb@xs4all.nl>
Date:   Fri, 12 Nov 2021 11:45:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CANiDSCsDWz5rS881NXXcuxJYb5RP=HLEmdQaYiKrjqyvhO223A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfMs3hD4IEZnc6gg8FUZLQ3tsEwfQMwpbVy9Ull3PTOj6cL0IaZRp3TAZTEv+DgcGlcP+xurkVbtrHB7+zvIrxAfVL87q2RrJIu5x7uA9UH0fSt82FU2f
 u7HVtRzxs8/T4WLL5qFDvZnuxecA1vOzU03ED/jswl4KmNaKIAoSugFMKmXn9eCWQgX3s+veu8V5RS9CP59glzrF+P8sUkIroekHF+3GxaeGzciiMjQWKU1n
 QrhlFbOkQJHG+pRhdq/96gM/V51X45J4w+oXDueeh+8ZlmY75UvjrkNtAJ8596UKDmdZFcJ44jfWovMe2BVZGi66QMoLRWWC5iPcZtihkPkl+Titu2ToaIMc
 Dz+2UDUvgt3u+aSoWIEQYKfAeAyN+bXj0E61C4yZNSrYMb7tTOQsx+XORPBhtxEOKr7/5tWiLfwb06PPNeKkl6CEevqXJgcbkBojHMt+UyeY6NefMF2qOnX5
 UvJiioYaxhinHAmx
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/11/2021 11:09, Ricardo Ribalda wrote:
> Hi James
> 
> 
>> Pixel Format      : 'MJPG' (Motion-JPEG)
>> Field             : None
>> Bytes per Line    : 0
>> Size Image        : 614400
>> Colorspace        : Default
> 
>> ioctl(3, VIDIOC_G_FMT, {type=0 /* V4L2_BUF_TYPE_??? */}) = -1 EINVAL
>> (Invalid argument)
>> ioctl(3, VIDIOC_G_FMT, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
>> fmt.pix={width=640, height=480, pixelformat=v4l2_fourcc('M', 'J', 'P',
>> 'G') /* V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_NONE, bytesperline=0,
>> sizeimage=614400, colorspace=V4L2_COLORSPACE_DEFAULT}}) = 0
>> write(1, "\t\t\33[1;31mfail\33[0m: v4l2-test-for"..., 59 fail:
>> v4l2-test-formats.cpp(358): !colorspace
>> ) = 59
> 
> Thanks for testing it out. In this case I believe that it is a camera
> bug. The error is due to the fact that the colorspace is does not have
> a valid value. That value is provided by the camera:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/usb/uvc/uvc_driver.c#n766
> 
> You might have to send a patch with a quirk for your device.
> 

Well, it is a USB device bug, but still the uvc driver should fall back to SRGB.
in this case. COLORSPACE_DEFAULT is definitely wrong and shouldn't be returned.

Regards,

	Hans
