Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BB3D1328A8
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2020 15:18:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728286AbgAGORz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jan 2020 09:17:55 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:39485 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727658AbgAGORz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Jan 2020 09:17:55 -0500
Received: from mail-qv1-f42.google.com ([209.85.219.42]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MlwJv-1jXY6E1mKJ-00iyZU; Tue, 07 Jan 2020 15:17:53 +0100
Received: by mail-qv1-f42.google.com with SMTP id y8so20562979qvk.6;
        Tue, 07 Jan 2020 06:17:53 -0800 (PST)
X-Gm-Message-State: APjAAAVeY5/9RThue05d/4MfEEzkJzkPPHbNbWYwRq29moJYmxjhsmH7
        JjOFlpn7kSl6BBezwoB7fmlENYCpthq3sMxjOFs=
X-Google-Smtp-Source: APXvYqy51UL4Zeay2TwOyIQycEzFRWrZb+DrqwPiR6CAwZxpyKtTIzW5iI+bGs5sCSE61a3nBD3KM024WJ6UxuEBNYs=
X-Received: by 2002:a0c:e7c7:: with SMTP id c7mr84471578qvo.222.1578406672121;
 Tue, 07 Jan 2020 06:17:52 -0800 (PST)
MIME-Version: 1.0
References: <20200107140206.103711-1-colin.king@canonical.com>
In-Reply-To: <20200107140206.103711-1-colin.king@canonical.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 7 Jan 2020 15:17:36 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0bJdKiX+=OMgCgmF158zEdgW9jYL85WqHWefhFk=ZF8Q@mail.gmail.com>
Message-ID: <CAK8P3a0bJdKiX+=OMgCgmF158zEdgW9jYL85WqHWefhFk=ZF8Q@mail.gmail.com>
Subject: Re: [PATCH][next] media: v4l2-core: fix uninitialized structure
 fields being returned to userspace
To:     Colin King <colin.king@canonical.com>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:DWrDb/Q0NjT0yWOGZE1jy/FzS9fcImgrM1hxfU3Oa5o8X3P7rMq
 cJcj2cVMAfI3MqyZdRygMTvlWMQZpgI+fDUlSir2hHyixIZIWGzoFNa4RZXt56QQPLKU2tv
 8364jchyNM5qJXhVl2VUxL8NigDx+eB04khNQ1HExuCf/GRl44jm4Dag5pWoJWWDQ2dkAQ9
 9n5Oh92iUr5Fqvd4CD3vg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:xT0TWYcULic=:hkRLwd1O+0mIih0c6pRCvQ
 e5UZCFcqGIe5UK4Mn09Cqf1pHfjVa3MvE9BMBMjfM5goz8yJhkakzSk3iFeq+gZNEz6BT6PNs
 lwGqJZAcsCoYtIRNVSwd7eLp9U6DsfwoDVFb6VnmnZxlCnjxtciKuLhzrasawyn2mBeNZIuRb
 ui3BG2T+Ad4K83vi7sZ86ewx7OynVP5UObhDkNqWbxfOYjQ4T14vfwbiSw5wIHUrTe2yF741D
 xShsapng5bgtYTRTAkz8pk4JC+UkCsxjpJ54HuvWL40sJl86JJ2XEBO/+8/nVMf7UUyZ3UssU
 tB1WEHaTtltEwe7G/TTuugVaouFWiQ4YjtyrkiOVcGqj/4/sr2BzqrbxFIcsG/Mrl/zrAQNmL
 ThW511uvkEmea8d6D55MAultYpCWWWasyFdmDwyE0GQ0VI4HsirXY17YVFg7WMbgiAzY2cECQ
 ztVapzX/FgDdjwLHJ+dcu1wY3MmdKu0hXAgqU7kkKRPtv53DXs+FenkoZyPrHMHWjNkmJjHne
 LGhz1w5gaiLOokjx4IKQ3Yf/oWrg6uuvMfGIEO7phqBJarV29MToHHMdGiN/20x/DQx3Cnq+C
 LTsDRH4ZQU+vt2DKZ1nVdV84l7dNbtWW/Lo20Xn6i7YumQzYjzTqfFt6AsT7/hFAplcyWeXN1
 QeGJ7GdQw/mhGPqUG+FuCsw3CsSG8HvY5SxL8oSxpqAd3H28nnYzEzpUx+p7khSJFbGrqpqmt
 Fk4sffIRhHtMa6kMwHzyXUvpsVlsglqjuyuMdcOv2iIiLhJJwfcB/8hJCvT1SDWL107YOf9Uj
 FRlBVvQK9C3uzEwXnTVKSpHAIWMYmVfx5re/pigbxxcvSLI43013dtkmb1DGkVNBToxLR6gX8
 X0zflAgm4pdUcZ+qYrrw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jan 7, 2020 at 3:02 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> In the case where v4l2_event_dequeue fails the structure ev is not
> being filled and this garbage data from the stack is being copied
> to the ev32 structure and being copied back to userspace on the
> VIDIOC_DQEVENT_TIME32 ioctl.  Fix this by ensuring the ev structure
> is zero'd to ensure uninitialized data is not leaked back.
>
> Addresses-Coverity: ("Uninitialized scalar variable")
> Fixes: 1a6c0b36dd19 ("media: v4l2-core: fix VIDIOC_DQEVENT for time64 ABI")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Good catch, thanks for fixing!

Acked-by: Arnd Bergmann <arnd@arndb.de>

> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index de926e311348..a376b351135f 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -394,7 +394,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>
>         case VIDIOC_DQEVENT_TIME32: {
>                 struct v4l2_event_time32 *ev32 = arg;
> -               struct v4l2_event ev;
> +               struct v4l2_event ev = { };
>
>                 if (!(sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS))
>                         return -ENOIOCTLCMD;
> --
> 2.24.0
>
