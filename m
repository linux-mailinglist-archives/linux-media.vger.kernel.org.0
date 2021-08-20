Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C59363F2E2D
	for <lists+linux-media@lfdr.de>; Fri, 20 Aug 2021 16:36:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240798AbhHTOgz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Aug 2021 10:36:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231706AbhHTOgy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Aug 2021 10:36:54 -0400
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF92DC061575
        for <linux-media@vger.kernel.org>; Fri, 20 Aug 2021 07:36:16 -0700 (PDT)
Received: by mail-qv1-xf2c.google.com with SMTP id v1so5591885qva.7
        for <linux-media@vger.kernel.org>; Fri, 20 Aug 2021 07:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=ycQWIFkOQSdrncAv0rFvSdUheMYtmO0A/J65XFFGClw=;
        b=oFJG2Y7wCq4/VmmHHiFN88HP+xRId6sbMgdrPVTPaItLHwW/dUB4TnjHwKG9bjVVbI
         ZCURQBkPHsgo5nvTEEbq0/oWjacPphAOGeL1G/avp7sHQEs5lM6kX6tCQCWSbBYAZwmy
         cEAYfFvsE6oybBr81x2p4wKTxlhWvnwG1ev8SLWmyewhZ0B9F2hphV299i6zrKOm5InH
         70cWVLfDpotd8oIvHRGL8rFMNxhmxbNYTxyvZo/OrcCCkZNflhXzDydJq7N/MS1tqCuD
         Z6sY3qg+KUEApw9EjzOh2RxidusjNMGFUidbFJpxF3xy4pbefbve/3k0NY09m+VGWcEh
         Pc/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=ycQWIFkOQSdrncAv0rFvSdUheMYtmO0A/J65XFFGClw=;
        b=SXEA5xO3CbyzOhtVksi2nGISy0XwN1RH9IaR3NR6bkVkdwWqseS5gVLpV5GBM6mr+r
         GYviVExoPk7xwh0NkegJUsyrouYD21R09dLTy4pWvkzpV3Yf6pmELkOrzz+0QSZog3E/
         umQ7+/8ySP7apINEFK1AERCaxyKJiLCCyjaYuIMCa8aZy84xH/wx2eJ+mqo9cKyqcg29
         FeFwuUdKA5Dkfs5j99KbbJnjhTP3bYZ7nj7tqxsodI3XS39eMpYK+4DRex7NcRBlD/qk
         k5qd+W+tP3fD8A4c5EtfxqPXxXtoKL1RIN5kDgSn8ZAuLZJGaRW2Ga5nCnOXhpnxcr3Z
         YucQ==
X-Gm-Message-State: AOAM533/VjO0tUsc4o/QQqXsf8j2QuvpivoNdQ5bjNhKTnLIYp+3Mh/0
        ryr54HwGK15z6GwRIBLvmQobIpXq2ASkmQ==
X-Google-Smtp-Source: ABdhPJzVLOBgFCecit90Bv4FKwRBKEQiGNTHmj8eTxilIpBQDh/tUWc6X5NXnXPVkmAgMR3jSkU/Fw==
X-Received: by 2002:a05:6214:15c1:: with SMTP id p1mr20936990qvz.9.1629470176082;
        Fri, 20 Aug 2021 07:36:16 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id j18sm3356960qkg.31.2021.08.20.07.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Aug 2021 07:36:15 -0700 (PDT)
Message-ID: <19177965855edd38822ca5dc1eb70594f0bd11b5.camel@ndufresne.ca>
Subject: Re: media: videobuf2: Fails to scale H264 1080p video on 1920x1080
 screen
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     trung1.dothanh@toshiba.co.jp, linux-media@vger.kernel.org
Date:   Fri, 20 Aug 2021 10:36:14 -0400
In-Reply-To: <OSAPR01MB3346DCCEBC794AD473F5D9EC93C19@OSAPR01MB3346.jpnprd01.prod.outlook.com>
References: <OSAPR01MB3346DCCEBC794AD473F5D9EC93C19@OSAPR01MB3346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le vendredi 20 août 2021 à 08:55 +0000, trung1.dothanh@toshiba.co.jp a écrit :
> Hello,
> 
> I am trying to play video with Gstreamer  on a fullHD monitor. The board I’m using is Apalis iMX6.
> Playing video works great with v4l2h264dec:
> 
> 	gst-launch-1.0 filesrc location=1080.mkv ! matroskademux ! h264parse \
>                           ! v4l2h264dec capture-io-mode=dmabuf \
>                           ! kmssink
> 
> However, it fails to scale video to 720p with v4l2convert:
> 
> 	gst-launch-1.0 filesrc location=1080.mkv ! matroskademux ! h264parse \
>                           ! v4l2h264dec capture-io-mode=dmabuf \
>                           ! v4l2convert output-io-mode=dmabuf-import \
>                           ! video/x-raw,width=1280,height=720 \
>                           ! kmssink
> 
> Added some debugs and I found that it failed at 'drivers/media/common/videobuf2/videobuf2-v4l2.c:__verify_length()'.
> 
> 	length = (b->memory == VB2_MEMORY_USERPTR)

Wrong snippet ? You are using VB2_MEMORY_DMABUF according to your GStreamer
pipeline.

> 		? b->length : vb->planes[0].length;
> 	if (b->bytesused > length)
> 		return -EINVAL;
> 
> The “b->byteused” is 4177920 (= 2 x 1920 x 1088), while plane length is just 4147200 (= 2 x 1920 x 1080).
> The actual frame size of H264 video is 1920x1088, so I added  a bypass for this case and video can be scaled,
> but that may not a correct way to fix this problem.
> 
> Is this a bug or I need to do extra steps before scale video?

I'm not fully certain of what has gone wrong, since this call was added
(1.18.0), this code path is supposed to work:

https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/blob/master/sys/v4l2/gstv4l2transform.c#L905

GStreamer will update the driver FMT to padded width/height before calling
streamon and S_SELECTION is used to tell the scaler which part is to be used in
the scaling process.

> 
> Packages version in my environment are:
> * Kernel: 5.10.19
> * Gstreamer: 1.18.4
> 
> Thank you,
> Trung
> 


