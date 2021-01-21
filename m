Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5FBE2FE981
	for <lists+linux-media@lfdr.de>; Thu, 21 Jan 2021 13:00:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730627AbhAUL7Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jan 2021 06:59:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730699AbhAUL6l (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jan 2021 06:58:41 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F2EDC061575
        for <linux-media@vger.kernel.org>; Thu, 21 Jan 2021 03:58:00 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id b21so2114707edy.6
        for <linux-media@vger.kernel.org>; Thu, 21 Jan 2021 03:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:mime-version
         :content-transfer-encoding;
        bh=G3/9rnUEXnD/Swp7RNDFlICbV6Ptsh2mK5XsE8b82pM=;
        b=No0nKp0TEu4qJ4DoFRimKFTZW1eAQT+Q4AcKxHtKV4Qv/sCBoumvVDyztUlKWcchQI
         PZ0vHdoGJCS1hRM01HhooXAXYqCiIYKzaI2PCta49Fow1XnA5cRfJj42AZZpyqqi/Gm6
         XFJ37YlKSm98I7vVqxAiDnhXrYTuRlMlvMaSFyPb9xhElrK5n9I2rwmGPnZQgZSki5N0
         nzj3myfNNTgkAcFlNTFP4ORIiS+G+7yq9l134GxkKCz1ViTq4ejoOnvijv+VO3QqBVUV
         Pfp+1vdbRN7i50/6P1Tpkah8va05XunSdRR8gV0N5pLCNWL8fqTv5PeQXFjdrXrd4JYt
         H9fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:mime-version
         :content-transfer-encoding;
        bh=G3/9rnUEXnD/Swp7RNDFlICbV6Ptsh2mK5XsE8b82pM=;
        b=SiD0G5zidvfwFUe8EL+pKDqP/PRab/TY4J/Q/dCtTv/Qloo6OTi6Px788TTgj8iXuS
         LbUy/2yUYMA1CtKz2jqsdxsVyMo8TxkgrnrcOzMzCRDYhbCzFhIL7z/XR5bU2s3KEkuC
         g6lmcbAxsiEsfeTvDhjAyBDXHPQWlnltSDFoUsrH1cWq130/g3aF3yX6vl5TPVAHo66I
         qo57EhxBhnQR3QD/4rsiREGpVvBfbh4fJgRDsJqBMwSNJ+p2Y1grgyPyfvH4kalK2mIr
         bTi2aytdDfQ73q+TzntuleAeGyhiDKuHRnHcrv7XYvgpbTYn+K7V+xuVCdsYAWF9JUTb
         kt5g==
X-Gm-Message-State: AOAM5332ORW/cCPeIpyO1qMeKOdUF4+tAUhalqosH6Gjf6T3ONzouED9
        KYbrcfjCqYP90ieGzaxJiTH3JRcjkyMNnA==
X-Google-Smtp-Source: ABdhPJy2kqU60rrMmCaYPbJkX/mUdupaNDcYNKIj8mCED3NjRuv1Q9Ga+0OwQVhA7irKUB0DUhdZyA==
X-Received: by 2002:aa7:c84b:: with SMTP id g11mr1775330edt.169.1611230279024;
        Thu, 21 Jan 2021 03:57:59 -0800 (PST)
Received: from oggy-kuba (snat-19.cgn.sat-an.net. [176.222.226.19])
        by smtp.googlemail.com with ESMTPSA id p26sm2700640edq.94.2021.01.21.03.57.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Jan 2021 03:57:58 -0800 (PST)
Message-ID: <c6ecd6a7f8a655d6089c3f0dbbaf9fafe11305a2.camel@gmail.com>
Subject: tc358743 - first rx'd frame is incomplete
From:   Jakub =?UTF-8?Q?Van=C4=9Bk?= <linuxtardis@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Mats Randgaard <matrandg@cisco.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Thu, 21 Jan 2021 12:57:57 +0100
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

I think I might have found a bug in the tc358743 driver.
The issue is that only the bottom part of the first captured
frame is received by userspace V4L2 applications. All frames
following the first one are received without this issue.

I'm observing this on a Raspberry Pi 4 w/ their 5.4.83 kernel.
To communicate with the chip, I'm using the unicam+tc358743
kernel drivers. The chip itself is on the Auvidea B101 board.

I can reproduce the problem by running the following commands
with the HDMI-CSI bridge running (1024x768@60Hz input):

# sync timings between HDMI and CSI
$ v4l2-ctl --device /dev/video0 \
           --set-dv-bt-timings query
# capture one raw frame without skipping the first one:
$ v4l2-ctl --device /dev/video0 \
           --stream-mmap=1 \
           --stream-to=frame.raw \
           --stream-count=1

Then, to convert from raw pixels to PNG, I would run one of these
ImageMagick commands (depending on the format - size of YUV frame
would be 2*w*h bytes, size of RGB 3*w*h bytes):

# from yuv to png (set WxH to HDMI input resolution):
$ convert -size WxH -depth 8 -colorspace YUV \
          -sampling-factor 4:2:2 yuv:frame.raw frame.png

# from rgb to png (set WxH to HDMI input resolution):
$ convert -size WxH -depth 8 -colorspace RGB rgb:frame.raw \
          -separate +channel -swap 0,2 -combine -gamma 2.2 frame.png

The result is that the remaining part of the frame is shifted upwards
and the bottom of the picture is green (YUV) or black (RGB).

In this case, I can work the issue around with --stream-skip=1.
However, it gets a bit more complicated when GStreamer is involved.

I have already created a ticket for the Raspberry kernel here:
https://github.com/raspberrypi/linux/issues/4058,
but given that tc358743 is a mainline driver, it would be better
to solve this issue in mainline first.

Can anyone reproduce this on other kernels or boards?
There is some chance that this problem is Raspberry-specific.

If it turns out that the issue happens on multiple boards,
a fix was suggested by Dave Stevenson - implementing
v4l2_subdev_sensor_ops's g_skip_frames() in the tc358743 driver.
This would signal to CSI2 RX drivers that the first frame is invalid
and needs to be skipped.

With best regards

Jakub

