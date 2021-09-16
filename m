Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F7B540EBE0
	for <lists+linux-media@lfdr.de>; Thu, 16 Sep 2021 22:52:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239722AbhIPUxi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Sep 2021 16:53:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233853AbhIPUxi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Sep 2021 16:53:38 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49F96C061574
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 13:52:17 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id g1so23705437lfj.12
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 13:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W2pvk2Yk14dHjkup1tBPTrNJm1NePuv4islzOLlERB0=;
        b=hYZJy2nWUspKIansLEx6etB9nnEF5kTqI77zRD3YtMQKNU76nP/NxOgDhnj0aKY+bQ
         K45tSfr6nLrQq1ThDwLACSo3sgoYcvgIqKd2zo0ji+J97ROFY8J9PxazzXvhkzyQeie0
         H/JgFxlzEWAeNFMyLmOoIBsTb+kl1rnnCy8H9z0ZvfAybWB3GMPiLBkafbFtbHqHRbi4
         LmeVNmvKojsFKi54MOgAad91nswsBxV3eTpCfRK8lSQXyiFj+/PCE9lYGboGJ3uRmQD9
         fRSqsDBEttbp8C1jYNh8kA98bvf/m+B3ZgjMyCXFHuR8xxnV/ZUKvEMgai/01DTqykTP
         0oVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W2pvk2Yk14dHjkup1tBPTrNJm1NePuv4islzOLlERB0=;
        b=DFlXM9mJC08GvdgORBdOvru0Y4+vmEWAxo7tEuYXzgCl9XEaaYyEhslplowrwV/flN
         4lMIjyXqsCihtdOqCQGK0vZszXKibxtcPLvgUFp0fEGM+0S8kXe6Fiuqq3KzrBiSiNNL
         P8HEuwtFEa/NUOn2Ea+uKpMR8waZeX1tT/pmQggwDHTy3/lqhqr/+paVUguo+65jk1ru
         uPjRpwjKBbINZy8oxyknShSM6uXEQQ3wmLaiEkQDAKrBxcrbctBg00Dyv2xqqABy/BjT
         vg8ik9IW8B7tj9XoE5QD6yEhvQ715YrW6QokzbYVrQpsd6fHGkK0VrY9RjroXZBx9Nt6
         aj1w==
X-Gm-Message-State: AOAM5304eATPsSNiv8eqnpETBdavFTt1+18AAcolimBkD1KVfWv0+6Ve
        29KzRViyKyfuDGIStHKXavNw4uVfDJOyQRO76NY=
X-Google-Smtp-Source: ABdhPJwpt63JKcAnxIsVeivttH5AKj6JA9xj7DRcq3myij2nwyLcs4INI+A+GabtPA4vCem4Rw3F+P8LCK7LCn7gX1s=
X-Received: by 2002:ac2:5f1b:: with SMTP id 27mr5733680lfq.79.1631825535659;
 Thu, 16 Sep 2021 13:52:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210827130150.909695-1-festevam@gmail.com> <20210913085942.zmhv5pmo5nzqunuj@uno.localdomain>
 <CAOMZO5B-BRfuPoGFyYQk4HdwaX45zxL9=gKTXKDHSxNwBDO-2g@mail.gmail.com>
 <CAOMZO5BzK5VtRUn7rqb+b84HoyiDy34e35aJ196J0TpCvL4vtA@mail.gmail.com> <CE93P5UJVABP.3TTVALU1H36DR@arch-thunder>
In-Reply-To: <CE93P5UJVABP.3TTVALU1H36DR@arch-thunder>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Thu, 16 Sep 2021 17:52:04 -0300
Message-ID: <CAOMZO5C0NtrYxa-45ma-MoSKqzbdbiSO-2riXJnaH8eC2ZjnXg@mail.gmail.com>
Subject: Re: [RFC 1/3] media: tw9910: Allow to probe from device tree
To:     Rui Miguel Silva <rui.silva@linaro.org>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media <linux-media@vger.kernel.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rui,

On Mon, Sep 13, 2021 at 7:12 PM Rui Miguel Silva <rui.silva@linaro.org> wrote:

> Looking  at this code it looks like you are using an old tree, Laurent
> meanwhile have sent a patch that change this function:
>
> a9512b261afd ("media: imx: capture: Simplify capture_validate_fmt() implementation")
>
> can you test with the latest code as see if you have the same
> problems.

I have just tested on 5.15-rc1 and this is what I get:

# v4l2-ctl --device /dev/v4l-subdev1 --set-standard PAL
Standard set to 000000ff
# media-ctl -l "'tw9910 2-0044':0 -> 'csi':0[1]"
# media-ctl -l "'csi':1 -> 'csi capture':0[1]"
# media-ctl -v -V "'tw9910 2-0044':0 [fmt:UYVY8_2X8/720x576
field:interlaced-bt]"
Opening media device /dev/media0
Enumerating entities
Found 3 entities
Enumerating pads and links
Setting up format UYVY8_2X8 720x576 on pad tw9910 2-0044/0
Format set: UYVY8_2X8 720x576
Setting up format UYVY8_2X8 720x576 on pad csi/0
Format set: UYVY8_2X8 720x576

# v4l2-ctl --stream-mmap -d /dev/video1
[   26.860654] priv->vdev.compose.width is 640
[   26.865419] fmt_src.format.width is 720
[   26.869390] priv->vdev.compose.height is 480
[   26.874268] compose.height is 576
[   26.877716] imx7-csi 2214000.csi: capture format not valid
VIDIOC_STREAMON returned -1 (Broken pipe)

Do you know why I am getting such a width/height mismatch?

Thanks,

Fabio Estevam
