Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CE4B205B05
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2020 20:44:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733311AbgFWSo2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jun 2020 14:44:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733309AbgFWSo0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jun 2020 14:44:26 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F4FBC061795
        for <linux-media@vger.kernel.org>; Tue, 23 Jun 2020 11:44:24 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id e15so6737457edr.2
        for <linux-media@vger.kernel.org>; Tue, 23 Jun 2020 11:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YHRfY/482pH60fZPQJikxqae/P0Z6lDDbQXNlIRp7tc=;
        b=O84lAlQtan6g3BHHHf7sIEL60Tt8VsrCeEVE8CQeBdNfZtWiEkIBf5EnEBTSnOIYhV
         EPdW4t8kcLvZ9LhfuTnNxdMsJ721WftZAm2YfItBlw7ZCfjOPOaCPgEhEUNc/LV9MpMT
         UfTabuopH1KekbGurNoL/s3jNY+zFWjIe+weZsQUyV611kaMJC6SyKOGCy0LGyPBBocU
         I6eEwuTw3L5JxgW9yX5wsfKT5IEMwvCDD1gcvJX0Dzz/DeyHX3FjI/lPlo2zl6EOxPbC
         oaCdMzn5EhGGffrjqZGBaLeDIrHSd1fkpJvfsTmFDUL3W1alvsulTjb0gLAndKmgvLhD
         JFYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YHRfY/482pH60fZPQJikxqae/P0Z6lDDbQXNlIRp7tc=;
        b=b7i9YsL4h2Xf0KvK6zxNgyi1E3RFEXogp3ytcUn7NzYfb4pMQeRNiiUgZlkSB7+05Y
         ibEeYiyHOSzI20GWpioeYDPxIa0deH7Bwuwppb3vMTZz3DJCzqUALxMV2b2iysgqSaPV
         gPRDVDkzF9zClqa/i/8bkLf4upwRLRW0cvmLIfT4fG8uGZFd3FeVvJiagGjj3phc+3tj
         s6kv8RXuLMQ0D4794g6vC+rvu6H6/cm2qDo7JsGLniw/n7AbOUQ8Ou+hTru9RjSpO7cV
         JQpb49+bpMlILub8R994TDQjdhCZT6QmQ2x9QpP5OKRrjReJ55seOQA2Z4AmVj1myvJe
         Q2Og==
X-Gm-Message-State: AOAM530ShGXUSro07ZyV75/HRzRr5mO1DpjjQ6yT9qez39XM/gmC/gqW
        +1B8Fh4hayqRtWWjEl451Ar7nx1JtsXUThD/JGZmQw==
X-Google-Smtp-Source: ABdhPJyPUIlDVH1n7pGFYZ5aO9aLZJphcDUMccOXmcIiaLZUxDvA5Dpv5o3A65C6wRy4Z9PcnkaV9feKOmD03dYG9P4=
X-Received: by 2002:a05:6402:1247:: with SMTP id l7mr22177355edw.61.1592937862811;
 Tue, 23 Jun 2020 11:44:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200622015227.24134-1-yunfei.dong@mediatek.com>
In-Reply-To: <20200622015227.24134-1-yunfei.dong@mediatek.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Tue, 23 Jun 2020 15:43:47 -0300
Message-ID: <CAAEAJfBtuZUn-LxiwCZ75rwT_oEuM-_QEXCH4-vFhV6X+8=4SA@mail.gmail.com>
Subject: Re: [PATCH v2, 0/2] This patchset add Read-only(Ro) request for
 capture queue
To:     Yunfei Dong <yunfei.dong@mediatek.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-media <linux-media@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Tomasz Figa <tfiga@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Yunfei,

Thanks for the patch.

On Sun, 21 Jun 2020 at 22:55, Yunfei Dong <yunfei.dong@mediatek.com> wrote:
>
> User driver need to get HDR10+ information for each capture buffer;
> For some encoder cases, user driver need to get encoded message for
> each frame. So add support read-only(Ro) request for capture queue.
>
> Ro request mean that user driver just can get ext ctrls, set ext ctrls
> is not not allowed. Ro Request also can be used in output queue.
>
> There is not upstream driver to use this feature at now, but we are
> developing internal driver to use it. If it is ready, we will try to
> upstream vdec/venc driver based on this feature.
>

An upstream driver using the feature would be important, but it would
be nice to also have: an open-source userspace application,
and a proper explanation in the stateless decoder interface specification.

Thanks,
Ezequiel

> Change compared to v1:
> -change commit message of patch 01/02
> -change commit message of patch 02/02
>
> Yunfei Dong (2):
>   media: v4l UAPI: add V4L2_BUF_CAP_SUPPORTS_RO_REQUESTS
>   media: v4l: Add Ro request api for capture queue
>
>  .../media/v4l/vidioc-reqbufs.rst              |   4 +
>  .../media/common/videobuf2/videobuf2-v4l2.c   |   7 ++
>  drivers/media/mc/mc-request.c                 |  10 +-
>  drivers/media/v4l2-core/v4l2-ctrls.c          | 107 +++++++++++++++---
>  drivers/media/v4l2-core/v4l2-ioctl.c          |  22 ++++
>  drivers/media/v4l2-core/v4l2-mem2mem.c        |  19 ++--
>  include/media/v4l2-ctrls.h                    |  22 +++-
>  include/media/v4l2-fh.h                       |   2 +
>  include/media/videobuf2-core.h                |   2 +
>  include/uapi/linux/videodev2.h                |   1 +
>  10 files changed, 158 insertions(+), 38 deletions(-)
>
