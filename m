Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C726D2B0537
	for <lists+linux-media@lfdr.de>; Thu, 12 Nov 2020 13:53:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727803AbgKLMxl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Nov 2020 07:53:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727646AbgKLMxk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Nov 2020 07:53:40 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8159BC0613D1
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2020 04:53:40 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id o15so5883008wru.6
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2020 04:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=18L/83xJ8CB8O7ULr9bv8g0F8JtzYdHhDA0TGUT5gPM=;
        b=Zz64p8hHzYNV6UQunxmKM0D3KtHzPemSzsMCSB35EWRuAroDGy3WAWdxfeyzlaHEIt
         0AO4C3enfMdsgB4wmTpdzL2i3PzWZD9K6nmyb5/LvYYHWEBeSNWVThXVjHwUdSENIgmF
         808bp7xEBt/D2a0tmipX/W53wHoTdLqPlgGua5dx9QcwWFlFCC1MI5ELWvNjLHm+H2Or
         mo/8XNronBAL4LxHWzpWD+NIzPBXF0dddVvx7IBoc0/WN7oJ3bEeXHijXPR8bZEofYa5
         MgMSWB/Jwz1swzDm3SQv0L5Ftc9L6B5uLqU2jrWNg1QtKkqY//Y32M5Vo9xmZUkP3hMq
         TTmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=18L/83xJ8CB8O7ULr9bv8g0F8JtzYdHhDA0TGUT5gPM=;
        b=QwRX3/x/WIEj70NMoz3s9SqfIf4LOYlAqubBdomPixhU2PmddJ9BgfdgSurBiqgpWJ
         4Jt9Yvv2Fz468vmr6lomP50rk/sGOlDWIoyVSlK49Xfpu4a9QFMBskjDUsUq8MlgVtOa
         2Je2DssUGBZOa6c7cS8nZZ/KfCcDXpOGojh9kKXOyaUccWNlBMvdHVJJ1e7ZZqaI8pK0
         3npSvtelonwnUaZgNAfJs9LOwwbtwxuozajf+P0icmbFzpVEQf+BQ7/lQOm3OrCND1Jr
         QTTdz+ikc70RTYgErdUV2+TPaJqWZC/H3p5rIvahwGcVV+HHIEAPthZ6nmdtHJjFFZjK
         yciA==
X-Gm-Message-State: AOAM532IcMpd1kU6V+/cgliCBcbH0OAdJxbuv5R3lZ3wcEER56sjbkBv
        Z4zl9oiC/HEo84ITdVPC1LkX/m2rPQMHIv9oaTuioaOz5vs=
X-Google-Smtp-Source: ABdhPJzUF2udFRT3oph2yUEO0qvCaJqPZZdzk7q8nY0KUOnDk6Dqxm/M3TkgarIFEOjWxNC/w8i5Oxm4BEZCIzaNpFw=
X-Received: by 2002:adf:9e07:: with SMTP id u7mr29778208wre.47.1605185619180;
 Thu, 12 Nov 2020 04:53:39 -0800 (PST)
MIME-Version: 1.0
References: <20201106121937.1459948-1-helen.koike@collabora.com> <7eb69eee-996c-6efb-8bee-6276d16a61e3@collabora.com>
In-Reply-To: <7eb69eee-996c-6efb-8bee-6276d16a61e3@collabora.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Thu, 12 Nov 2020 12:53:22 +0000
Message-ID: <CAPY8ntCcJ8Y--5NyW=tvWEjDUZEasbksizHeE2DZwr1jQ=4m=A@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] destage Rockchip ISP1 driver
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Collabora Kernel ML <kernel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Helen Koike <helen.koike@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 12 Nov 2020 at 10:25, Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:
>
>
>
> Am 06.11.20 um 13:19 schrieb Helen Koike:
> > Hello,
> >
> > Changes in v3:
> > - Moved Kconfig entry from M2M to Platform devices
> > - Rename description and comment to Parameters and Statistics.
> > - Patches squashed:
> > dt-bindings: media: rkisp1: move rockchip-isp1 bindings out of staging
> > media: MAINTAINERS: rkisp1: add path to dt-bindings
> > media: rockchip: rkisp1: destage Rockchip ISP1 driver
> > media: MAINTAINERS: Update rkisp1 files with new location
> >
> > Changes in v2:
> > - New patch updating MAINTAINERS file
> > - No changes in other patches
> >
> >> media-ctl -p
> > http://ix.io/2Cso
> >
> >> media-ctl --print-dot
> > http://ix.io/2Csp
> >
> >> v4l2-compliance -m0
> > http://ix.io/2Csk
>
> Hello Dave,

Hi Dafna

> I see the above link that the imx219 does not pass the compliance:
>
> fail: v4l2-test-controls.cpp(830): failed to find event for control 'Exposure'
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
>
> I see this patch on downstream
> "media: i2c: imx219: Declare that the driver can create events"
>
> That adds the flag V4L2_SUBDEV_FL_HAS_EVENTS, I suspect that is the patch
> that fixes the compliance issue.
>
> I can verify that and send the patch to the mailing list,
> is it ok with you?

Fine by me.

  Dave

> Thanks,
> Dafna
>
>
>
> >
> >> v4l2-compliance -v -d /dev/video0 -s10
> > http://ix.io/2Csq
> >
> >> v4l2-compliance -v -d /dev/video1 -s10
> > http://ix.io/2Css
> >
> > Helen Koike (1):
> >    media: rockchip: rkisp1: destage Rockchip ISP1 driver
> >
> > Shunqian Zheng (1):
> >    media: videodev2.h, v4l2-ioctl: add rkisp1 meta buffer format
> >
> >   .../bindings/media/rockchip-isp1.yaml         |  0
> >   .../media/v4l/pixfmt-meta-rkisp1.rst          |  2 +-
> >   MAINTAINERS                                   |  5 ++++-
> >   drivers/media/platform/Kconfig                | 18 ++++++++++++++++++
> >   drivers/media/platform/Makefile               |  1 +
> >   .../platform/rockchip}/rkisp1/Makefile        |  0
> >   .../rockchip}/rkisp1/rkisp1-capture.c         |  0
> >   .../platform/rockchip}/rkisp1/rkisp1-common.c |  0
> >   .../platform/rockchip}/rkisp1/rkisp1-common.h |  2 +-
> >   .../platform/rockchip}/rkisp1/rkisp1-dev.c    |  0
> >   .../platform/rockchip}/rkisp1/rkisp1-isp.c    |  0
> >   .../platform/rockchip}/rkisp1/rkisp1-params.c |  0
> >   .../platform/rockchip}/rkisp1/rkisp1-regs.h   |  0
> >   .../rockchip}/rkisp1/rkisp1-resizer.c         |  0
> >   .../platform/rockchip}/rkisp1/rkisp1-stats.c  |  0
> >   drivers/media/v4l2-core/v4l2-ioctl.c          |  2 ++
> >   drivers/staging/media/Kconfig                 |  2 --
> >   drivers/staging/media/Makefile                |  1 -
> >   drivers/staging/media/rkisp1/Kconfig          | 19 -------------------
> >   drivers/staging/media/rkisp1/TODO             |  6 ------
> >   .../uapi/linux}/rkisp1-config.h               |  4 ----
> >   include/uapi/linux/videodev2.h                |  4 ++++
> >   22 files changed, 31 insertions(+), 35 deletions(-)
> >   rename {drivers/staging/media/rkisp1/Documentation => Documentation}/devicetree/bindings/media/rockchip-isp1.yaml (100%)
> >   rename drivers/{staging/media => media/platform/rockchip}/rkisp1/Makefile (100%)
> >   rename drivers/{staging/media => media/platform/rockchip}/rkisp1/rkisp1-capture.c (100%)
> >   rename drivers/{staging/media => media/platform/rockchip}/rkisp1/rkisp1-common.c (100%)
> >   rename drivers/{staging/media => media/platform/rockchip}/rkisp1/rkisp1-common.h (99%)
> >   rename drivers/{staging/media => media/platform/rockchip}/rkisp1/rkisp1-dev.c (100%)
> >   rename drivers/{staging/media => media/platform/rockchip}/rkisp1/rkisp1-isp.c (100%)
> >   rename drivers/{staging/media => media/platform/rockchip}/rkisp1/rkisp1-params.c (100%)
> >   rename drivers/{staging/media => media/platform/rockchip}/rkisp1/rkisp1-regs.h (100%)
> >   rename drivers/{staging/media => media/platform/rockchip}/rkisp1/rkisp1-resizer.c (100%)
> >   rename drivers/{staging/media => media/platform/rockchip}/rkisp1/rkisp1-stats.c (100%)
> >   delete mode 100644 drivers/staging/media/rkisp1/Kconfig
> >   delete mode 100644 drivers/staging/media/rkisp1/TODO
> >   rename {drivers/staging/media/rkisp1/uapi => include/uapi/linux}/rkisp1-config.h (99%)
> >
