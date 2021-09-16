Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BBFF40ED15
	for <lists+linux-media@lfdr.de>; Fri, 17 Sep 2021 00:05:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240687AbhIPWG3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Sep 2021 18:06:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240673AbhIPWG3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Sep 2021 18:06:29 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0456BC061574
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 15:05:08 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id t18so11877497wrb.0
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 15:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:content-transfer-encoding:date:message-id:cc:subject
         :from:to:references:in-reply-to;
        bh=/dkCUwPqZhWIrj08NGho9F/I2k5ksYa6LP0l/5ECPgc=;
        b=BX3KuScaTuvyH/NgAX5Neo6oI9TwezcBAeGf05ShW2XHuHP6tFyx5SfFvD8xa4ZCiP
         kqa3t9s5p790HnGejtkT4jMafhoj1R1uBeYX4sQxm53VwdYQkXL8/H53lyVHR55frjDg
         +ztpEudeqzEpwZmgD1Tl8d6Ll2/bceAa5R+EJespNeSxbwb875pIBhYkzRIv3BJCSoMB
         39fic6oHy+As87JLAy0nHAhtwZRJHV4FG/m0IEUej3Mwd0efjcs+bC3OLRntQS0dg+0N
         Sc7xnbsxRbx4CO232W9Y6sgOcioinb+TlJ2wlGRx9Fli07aZ0DKDP89AOvPnMtAEPgc+
         0B+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:content-transfer-encoding:date
         :message-id:cc:subject:from:to:references:in-reply-to;
        bh=/dkCUwPqZhWIrj08NGho9F/I2k5ksYa6LP0l/5ECPgc=;
        b=DG3GmljAhcvZSaW4GGXIdPe0FNOaef1sS8qC5mv7gqKHNPmnRbLZ0ODasn4f4TY2e+
         LiVY6yRLF+VnkqR8rJR9dAiwXapeXr5jzmz2w8QHPQH+V9uN2ouOwUnFXzUcS+K72fhj
         WapqSalb5ruTC96HgXmvk+HGmEJ8XFY7PjVLRI8LKsioFwwxtMh/5FYNXvYhIRQI45nq
         9FeD0QphALt/q4aKUwKAOMQRVLn6e/KTzyRu59XIJ0pp2H73tva9MAr+2VODbR0rJ9xD
         pkGhykgC/lZ3KeHnGIaKF6FAWSulAW1hu+R2cocZdXRjUqQCY77j2VY85pSphung3FoZ
         da4g==
X-Gm-Message-State: AOAM530PVbKSUDc8H3jl8k5SLeRN+fyxzOcFXVPuKZn1bnQQu6QdEQbq
        qpUWYKNPIidu7dBYcZNMDpnRvQ==
X-Google-Smtp-Source: ABdhPJyiT1VVy5UmulmG+ZfFvEZul6+d//tBKBkJnXQ3iVpQhdFcNZKZaXitCUKtev/Fy/dspLqhww==
X-Received: by 2002:adf:f48d:: with SMTP id l13mr8481202wro.94.1631829906567;
        Thu, 16 Sep 2021 15:05:06 -0700 (PDT)
Received: from localhost (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id j134sm733233wmj.27.2021.09.16.15.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 15:05:06 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Thu, 16 Sep 2021 23:05:05 +0100
Message-Id: <CEBNF9DXWSZV.8SKHYF4QGS18@arch-thunder>
Cc:     "Jacopo Mondi" <jacopo@jmondi.org>,
        "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
        "Hans Verkuil" <hverkuil-cisco@xs4all.nl>,
        "linux-media" <linux-media@vger.kernel.org>,
        "Jacopo Mondi" <jacopo+renesas@jmondi.org>
Subject: Re: [RFC 1/3] media: tw9910: Allow to probe from device tree
From:   "Rui Miguel Silva" <rui.silva@linaro.org>
To:     "Fabio Estevam" <festevam@gmail.com>
References: <20210827130150.909695-1-festevam@gmail.com>
 <20210913085942.zmhv5pmo5nzqunuj@uno.localdomain>
 <CAOMZO5B-BRfuPoGFyYQk4HdwaX45zxL9=gKTXKDHSxNwBDO-2g@mail.gmail.com>
 <CAOMZO5BzK5VtRUn7rqb+b84HoyiDy34e35aJ196J0TpCvL4vtA@mail.gmail.com>
 <CE93P5UJVABP.3TTVALU1H36DR@arch-thunder>
 <CAOMZO5C0NtrYxa-45ma-MoSKqzbdbiSO-2riXJnaH8eC2ZjnXg@mail.gmail.com>
In-Reply-To: <CAOMZO5C0NtrYxa-45ma-MoSKqzbdbiSO-2riXJnaH8eC2ZjnXg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Oi Fabio,
On Thu Sep 16, 2021 at 9:52 PM WEST, Fabio Estevam wrote:

> Hi Rui,
>
> On Mon, Sep 13, 2021 at 7:12 PM Rui Miguel Silva <rui.silva@linaro.org> w=
rote:
>
> > Looking  at this code it looks like you are using an old tree, Laurent
> > meanwhile have sent a patch that change this function:
> >
> > a9512b261afd ("media: imx: capture: Simplify capture_validate_fmt() imp=
lementation")
> >
> > can you test with the latest code as see if you have the same
> > problems.
>
> I have just tested on 5.15-rc1 and this is what I get:
>
> # v4l2-ctl --device /dev/v4l-subdev1 --set-standard PAL
> Standard set to 000000ff
> # media-ctl -l "'tw9910 2-0044':0 -> 'csi':0[1]"
> # media-ctl -l "'csi':1 -> 'csi capture':0[1]"
> # media-ctl -v -V "'tw9910 2-0044':0 [fmt:UYVY8_2X8/720x576
> field:interlaced-bt]"
> Opening media device /dev/media0
> Enumerating entities
> Found 3 entities
> Enumerating pads and links
> Setting up format UYVY8_2X8 720x576 on pad tw9910 2-0044/0
> Format set: UYVY8_2X8 720x576
> Setting up format UYVY8_2X8 720x576 on pad csi/0
> Format set: UYVY8_2X8 720x576
>
> # v4l2-ctl --stream-mmap -d /dev/video1
> [   26.860654] priv->vdev.compose.width is 640

This looks like the default pix width (IMX_MEDIA_DEF_PIX_WIDTH)

> [   26.865419] fmt_src.format.width is 720
> [   26.869390] priv->vdev.compose.height is 480

and this the default pix height (IMX_MEDIA_DEF_PIX_HEIGHT)

> [   26.874268] compose.height is 576
> [   26.877716] imx7-csi 2214000.csi: capture format not valid
> VIDIOC_STREAMON returned -1 (Broken pipe)
> Do you know why I am getting such a width/height mismatch?

So, it seems like it is not configuring the pads, don't you need to do
a media-ctl -V in the csi:0?

or maybe dump the output of media-ctl -p and check the links and pads
configurations.

Hope this helps.

Cheers,
   Rui
