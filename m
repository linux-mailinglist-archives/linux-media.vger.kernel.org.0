Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2249D316AC9
	for <lists+linux-media@lfdr.de>; Wed, 10 Feb 2021 17:12:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231922AbhBJQMD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Feb 2021 11:12:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231596AbhBJQMA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Feb 2021 11:12:00 -0500
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29671C061756
        for <linux-media@vger.kernel.org>; Wed, 10 Feb 2021 08:11:20 -0800 (PST)
Received: by mail-qk1-x736.google.com with SMTP id u20so2140040qku.7
        for <linux-media@vger.kernel.org>; Wed, 10 Feb 2021 08:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Fo4Ogy3EVpm466AahoLKTmNyaNfFhCUSTgOIAOz+YxU=;
        b=GCpxvihkfGsyTrjdB4Xysggilr1MgaqiNWunIC1qarIXeVnYvT+o65nQM8Xul7BvMN
         9sfJynnEtBQKBdgTpheDdj3aTGSTsZEZsXzQrzT0cM0mtWWo5dctPaZZvaHTgnNrrzBo
         VER308qz7Ks88dUDywN9w+TRWACyg2M8FLkAq47mVZINYE+3oRMlCdx9c3SRj74qeQg8
         obf/pLFxRNgZi0flTGz2GTGNdAvvkHwwexgR+/gA3vlGMttM9YrGNt9EP6qwtkd5Pz1J
         ui6t+LGmbI0JdcZnf4uf+5RaXsKwNHeym9ZfBGiwM85C5jSv/wWz3g0v2hFtQIb0TYEl
         nrXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Fo4Ogy3EVpm466AahoLKTmNyaNfFhCUSTgOIAOz+YxU=;
        b=jY6M4T6uYrMp6MmbA6Zhoyr0dvnxXmcdKpXcneWEhrFCn+ezuaVaSWZt1v9i4wORaQ
         syDNS+X20PGr18gsxZ+Mws3XmOnckhNxQTqkonrkMxMQTo1rhVYzbsWgWxQYitcu09By
         EMwJf+seqOgW0d4X1PvDEjpRuUcaTie11ghqOf57akmXAIRolDTM6xZaK4izpBjlG/F1
         xJkc1JbSnoBmIdQDcptozY1P+ZBw2HmqXiq2HdhWBhYZa2odbmqNLG9ipigl26HYUzlO
         iQrArHt6GqSdMQfbQTvAAuBcMcGurd+uLhf7T0eJIj6S0HC34/LQu7GS0LmDqUkTwLO3
         TpzQ==
X-Gm-Message-State: AOAM532psGg48lG0SUZGWrG27PYAJIIzks3qGPMwcORL/X477teZzL9T
        e5bIWm435fPr17uSDFP/5Tbk2Q==
X-Google-Smtp-Source: ABdhPJwwI961leeegb5I9ryZ7kycDVipzwWMJKFIfLq62JB4EWCd6IiGb8M9E8Y/aZkmfl49xdbJPA==
X-Received: by 2002:a37:a004:: with SMTP id j4mr4026481qke.450.1612973479259;
        Wed, 10 Feb 2021 08:11:19 -0800 (PST)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id r44sm1596162qtb.28.2021.02.10.08.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 08:11:17 -0800 (PST)
Message-ID: <804285cff81878a2c188d1b823182114f891ca38.camel@ndufresne.ca>
Subject: Re: [BUG REPORT] media: coda: mpeg4 decode corruption on i.MX6qp
 only
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Sven Van Asbroeck <thesven73@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Adrian Ratiu <adrian.ratiu@collabora.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Wed, 10 Feb 2021 11:11:16 -0500
In-Reply-To: <20210203163348.30686-1-TheSven73@gmail.com>
References: <20210203163348.30686-1-TheSven73@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3 (3.38.3-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sven,

Le mercredi 03 février 2021 à 11:33 -0500, Sven Van Asbroeck a écrit :
> From: Sven Van Asbroeck <thesven73@gmail.com>
> 
> We have observed that under certain repeatable circumstances, the CODA
> mem2mem device consistently generates corrupted frames. This happens only
> on an i.MX6qp (Plus) - the classic imx6q is not affected.
> 
> This happens when the virtual X screen is wider than 0x900 pixels (1).

Are you sure you aren't just running out of CMA ? This is the only things that
comes to mind at the moment, sorry if it's not that useful.

> 
> Quite strange, because CODA is a mem2mem device, and is presumably not
> touching
> any of the IPU/GPU2D/GPU3D infrastructure used by X. Except if there is a
> hidden
> dependency somehow.
> 
> I have captured and visualized generated CODA frames as follows:
> gst-launch-1.0 playbin uri=file:///home/default/nycTrain1080p.mp4 flags=0x45
>     video-sink='multifilesink location=frame%d.yuv'
> See (2) for how I converted the raw YUV frame to a PNG image.
> 
> For example, the following will break CODA mpeg4 decode (width >= 0x900):
> # xrandr --fb 2400x1088
> Screen 0: minimum 1 x 1, current 2400 x 1088, maximum 4096 x 4096
> HDMI1 disconnected (normal left inverted right x axis y axis)
> LVDS1 connected primary 1280x800+0+0 (normal left inverted right x axis y
> axis) 0mm x 0mm
>    1280x800      59.79*+
> 
> Resulting frame when dumped with multifilesink (NOT written to the display):
> https://gitlab.com/TheSven73/coda-investigation/-/blob/master/stripes.png
> 
> And the following will restore CODA mpeg4 decode (width < 0x900):
> # xrandr --fb 2300x1088
> Screen 0: minimum 1 x 1, current 2300 x 1088, maximum 4096 x 4096
> HDMI1 disconnected (normal left inverted right x axis y axis)
> LVDS1 connected primary 1280x800+0+0 (normal left inverted right x axis y
> axis) 0mm x 0mm
>    1280x800      59.79*+
> 
> Resulting frame when dumped with multifilesink (NOT written to the display):
> https://gitlab.com/TheSven73/coda-investigation/-/blob/master/ok.png
> 
> Additional info:
> - only the virtual X screen width seems to trigger the issue, it is
>   independent of the height.
> - issue seems independent of the pixel format. Forcing CODA to output NV12
>   shows the same behaviour.
> 
> System description:
> - i.MX6 QuadPlus:
> [    0.144518] CPU identified as i.MX6QP, silicon rev 1.1
> - mainline Linux v5.9.16 with a small private patchset on top
>   (patchset does not touch CODA)
> - CODA960 silicon contained within i.MX6 QuadPlus:
> [ 4798.510033] coda 2040000.vpu: Firmware code revision: 46076
> [ 4798.515916] coda 2040000.vpu: Initialized CODA960.
> [ 4798.520779] coda 2040000.vpu: Firmware version: 3.1.1
> - gstreamer from buildroot:
> gst-launch-1.0 version 1.16.2
> GStreamer 1.16.2
> - X from buildroot, using armada and etnadrm_gpu plugins:
> X.Org X Server 1.20.7
> X Protocol Version 11, Revision 0
> [    99.527] (II) LoadModule: "armada"
> [    99.527] (II) Loading /usr/lib/xorg/modules/drivers/armada_drv.so
> [    99.538] (II) Module armada: vendor="X.Org Foundation"
> [    99.538]    compiled for 1.20.7, module version = 0.0.0
> [    99.538]    Module class: X.Org Video Driver
> [    99.538]    ABI class: X.Org Video Driver, version 24.1
> [    99.538] (II) armada: Support for Marvell LCD Controller: 88AP510
> [    99.539] (II) armada: Support for Freescale IPU: i.MX6
> [    99.545] (II) armada(0): Added screen for KMS device /dev/dri/card1
> [    99.561] (II) armada(0): hardware: imx-drm
> [    99.563] (**) armada(0): Option "AccelModule" "etnadrm_gpu"
> [    99.563] (II) Loading sub module "etnadrm_gpu"
> [    99.563] (II) LoadModule: "etnadrm_gpu"
> [    99.564] (II) Loading /usr/lib/xorg/modules/drivers/etnadrm_gpu.so
> [    99.576] (II) Module Etnaviv GPU driver (DRM): vendor="X.Org Foundation"
> [    99.576]    compiled for 1.20.7, module version = 0.0.0
> 
> 
> (1) When using multiple displays, the virtual X screen is typically the
> bounding
>     rectangle which includes all screens. That's why it can become wider than
>     1920 pixels.
> 
> (2)
> 
> # Convert raw YUYV to PNG
> # Python, runs out of the box on a stock Google Colab notebook
> import cv2
> import numpy as np
> import matplotlib.pyplot as plt
> import matplotlib
> 
> img = np.fromfile('frame1.yuv', dtype=np.uint8)
> # YUYV has two 8-bit channels per pixel
> img.shape = (1088, 1920, 2)
> 
> img2 = cv2.cvtColor(img, cv2.COLOR_YUV2RGB_YUYV)
> plt.imshow(img2)
> matplotlib.image.imsave('frame1.png', img2)
> 
> To: Philipp Zabel <p.zabel@pengutronix.de>
> To: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Adrian Ratiu <adrian.ratiu@collabora.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: linux-media@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org


