Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6E9630DFCC
	for <lists+linux-media@lfdr.de>; Wed,  3 Feb 2021 17:36:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231191AbhBCQeu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Feb 2021 11:34:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230180AbhBCQed (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Feb 2021 11:34:33 -0500
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8470C061786;
        Wed,  3 Feb 2021 08:33:53 -0800 (PST)
Received: by mail-qk1-x734.google.com with SMTP id a19so282810qka.2;
        Wed, 03 Feb 2021 08:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=CnmcPCrNkYlOAKp0TeVXo4eNgCaDjLZITNcPd4Ycqpk=;
        b=s3sFCaxmvisX+PBcIC7OMJ+1p8o/D2AywhXWE4Tzyg675Jgj/13ioZOql1XNJkeKyy
         AYnL3/u4IY7fm7E1XPW/dLUSJUUCV9NDXsGYNN4eRTKlBg6yWs2Yb/hvt/oNftySEaIw
         3AZ+nmHWgFVQjj5DK7E4qIzJYI7igwFYuq219MJ48cMxPhx5lacVjZxI9PDTKHWY8pEg
         hmpIIx0MA7erEheWe63cfKm50g8I5hFr48rYSkUBkkFWPmX5d35vU18lMnaXjq+b4eL5
         Q/FslB4de8wVSBxJMXz8RuD/L8hj1tiRBNM8P8mGmsl9vb7ih17K1NWWjHqPBba7CjAM
         PqRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=CnmcPCrNkYlOAKp0TeVXo4eNgCaDjLZITNcPd4Ycqpk=;
        b=HJeOU8RB44slZ6i5q3fzll321yFppiFS5nqNbwv21h0gf06dWtBC6VxuRZXfLqVLvr
         QaKvZ587IUTrd2Nt2otVXWFesvGVmYGXC6wS81JJGvueb+yY2OondLrJMglRArO7ZetJ
         nWwlPB19f2xtmURR2cXfkhK92UBGd9x2f7/pGNA05n/2c0xEY3oQ512hcUs8whI8L+J3
         g+pQqRpYVTNFxvAzGZJst8fUTg5/1S56V4kiGc0T0xf7kK9Ltf6CsH8nuNE/scKy/CfT
         SlQ5GcBI0Jn9kXju0ech6elLUdhsSBU5+g4a/vhnl8Knv4x47YCkgYponxuu8Jcvuwfd
         kbOA==
X-Gm-Message-State: AOAM532oxuvZO/nl8upuj6OT8CBM8fFNQsWrSy/IGMGwk/FyorHsbP3R
        onW9L0pDfe/wQxz2GGrJAXGK+VKPjcg=
X-Google-Smtp-Source: ABdhPJwUFklIEeVdPq27NlqwhPYvH8uz9dFYESjlSJyzlnInL5YblHliuTp2Kr+ZHnsJbQvje0r34g==
X-Received: by 2002:a05:620a:530:: with SMTP id h16mr3377043qkh.136.1612370032688;
        Wed, 03 Feb 2021 08:33:52 -0800 (PST)
Received: from localhost.localdomain ([198.52.185.246])
        by smtp.gmail.com with ESMTPSA id e5sm1719093qtp.86.2021.02.03.08.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 08:33:52 -0800 (PST)
From:   Sven Van Asbroeck <thesven73@gmail.com>
X-Google-Original-From: Sven Van Asbroeck <TheSven73@gmail.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sven Van Asbroeck <thesven73@gmail.com>,
        Adrian Ratiu <adrian.ratiu@collabora.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [BUG REPORT] media: coda: mpeg4 decode corruption on i.MX6qp only
Date:   Wed,  3 Feb 2021 11:33:48 -0500
Message-Id: <20210203163348.30686-1-TheSven73@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Sven Van Asbroeck <thesven73@gmail.com>

We have observed that under certain repeatable circumstances, the CODA
mem2mem device consistently generates corrupted frames. This happens only
on an i.MX6qp (Plus) - the classic imx6q is not affected.

This happens when the virtual X screen is wider than 0x900 pixels (1).

Quite strange, because CODA is a mem2mem device, and is presumably not touching
any of the IPU/GPU2D/GPU3D infrastructure used by X. Except if there is a hidden
dependency somehow.

I have captured and visualized generated CODA frames as follows:
gst-launch-1.0 playbin uri=file:///home/default/nycTrain1080p.mp4 flags=0x45
    video-sink='multifilesink location=frame%d.yuv'
See (2) for how I converted the raw YUV frame to a PNG image.

For example, the following will break CODA mpeg4 decode (width >= 0x900):
# xrandr --fb 2400x1088
Screen 0: minimum 1 x 1, current 2400 x 1088, maximum 4096 x 4096
HDMI1 disconnected (normal left inverted right x axis y axis)
LVDS1 connected primary 1280x800+0+0 (normal left inverted right x axis y axis) 0mm x 0mm
   1280x800      59.79*+

Resulting frame when dumped with multifilesink (NOT written to the display):
https://gitlab.com/TheSven73/coda-investigation/-/blob/master/stripes.png

And the following will restore CODA mpeg4 decode (width < 0x900):
# xrandr --fb 2300x1088
Screen 0: minimum 1 x 1, current 2300 x 1088, maximum 4096 x 4096
HDMI1 disconnected (normal left inverted right x axis y axis)
LVDS1 connected primary 1280x800+0+0 (normal left inverted right x axis y axis) 0mm x 0mm
   1280x800      59.79*+

Resulting frame when dumped with multifilesink (NOT written to the display):
https://gitlab.com/TheSven73/coda-investigation/-/blob/master/ok.png

Additional info:
- only the virtual X screen width seems to trigger the issue, it is
  independent of the height.
- issue seems independent of the pixel format. Forcing CODA to output NV12
  shows the same behaviour.

System description:
- i.MX6 QuadPlus:
[    0.144518] CPU identified as i.MX6QP, silicon rev 1.1
- mainline Linux v5.9.16 with a small private patchset on top
  (patchset does not touch CODA)
- CODA960 silicon contained within i.MX6 QuadPlus:
[ 4798.510033] coda 2040000.vpu: Firmware code revision: 46076
[ 4798.515916] coda 2040000.vpu: Initialized CODA960.
[ 4798.520779] coda 2040000.vpu: Firmware version: 3.1.1
- gstreamer from buildroot:
gst-launch-1.0 version 1.16.2
GStreamer 1.16.2
- X from buildroot, using armada and etnadrm_gpu plugins:
X.Org X Server 1.20.7
X Protocol Version 11, Revision 0
[    99.527] (II) LoadModule: "armada"
[    99.527] (II) Loading /usr/lib/xorg/modules/drivers/armada_drv.so
[    99.538] (II) Module armada: vendor="X.Org Foundation"
[    99.538] 	compiled for 1.20.7, module version = 0.0.0
[    99.538] 	Module class: X.Org Video Driver
[    99.538] 	ABI class: X.Org Video Driver, version 24.1
[    99.538] (II) armada: Support for Marvell LCD Controller: 88AP510
[    99.539] (II) armada: Support for Freescale IPU: i.MX6
[    99.545] (II) armada(0): Added screen for KMS device /dev/dri/card1
[    99.561] (II) armada(0): hardware: imx-drm
[    99.563] (**) armada(0): Option "AccelModule" "etnadrm_gpu"
[    99.563] (II) Loading sub module "etnadrm_gpu"
[    99.563] (II) LoadModule: "etnadrm_gpu"
[    99.564] (II) Loading /usr/lib/xorg/modules/drivers/etnadrm_gpu.so
[    99.576] (II) Module Etnaviv GPU driver (DRM): vendor="X.Org Foundation"
[    99.576] 	compiled for 1.20.7, module version = 0.0.0


(1) When using multiple displays, the virtual X screen is typically the bounding
    rectangle which includes all screens. That's why it can become wider than
    1920 pixels.

(2)

# Convert raw YUYV to PNG
# Python, runs out of the box on a stock Google Colab notebook
import cv2
import numpy as np
import matplotlib.pyplot as plt
import matplotlib

img = np.fromfile('frame1.yuv', dtype=np.uint8)
# YUYV has two 8-bit channels per pixel
img.shape = (1088, 1920, 2)

img2 = cv2.cvtColor(img, cv2.COLOR_YUV2RGB_YUYV)
plt.imshow(img2)
matplotlib.image.imsave('frame1.png', img2)

To: Philipp Zabel <p.zabel@pengutronix.de>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Adrian Ratiu <adrian.ratiu@collabora.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
