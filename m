Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A9DA467C21
	for <lists+linux-media@lfdr.de>; Fri,  3 Dec 2021 18:01:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353148AbhLCREM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Dec 2021 12:04:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382376AbhLCRD5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Dec 2021 12:03:57 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10B19C061751
        for <linux-media@vger.kernel.org>; Fri,  3 Dec 2021 09:00:27 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id fv9-20020a17090b0e8900b001a6a5ab1392so3023659pjb.1
        for <linux-media@vger.kernel.org>; Fri, 03 Dec 2021 09:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=/8G2+Pls24Pt4eAmqaRJ4vRYiEVfN1Rr11DBxT9nEmM=;
        b=YlzrytrIQx60c5w1k3/Q/hhRVvOpO3VaVyl4izDZbZCriaADH95W1Y2sY1tS/rrq+O
         o3TJ570Cim4jOLvdFCL678DabxyUVZu/q4XtSP3cmna0xYvmQiqfLv+OI6gKbFoBnQxF
         oXS2chlBAXyJPgEI4TAXsn1qaR+/oQ8AouGLLQOHX10clqrd3ijwD8yeHJ5DNQeMX279
         jVpkvFXJ0/KF3WQTi4dnaBuiMH3bLci8a9+CutIDOt/CR5IHqdt9sF5hacZsaqmoa+Ws
         YrAeZh1WgFyiRltLVWXc2ikAfL7Gx1YuahmvdnUDmBvo1ISJZu7ZPqEwTBCR5ZYmwjnP
         ioKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=/8G2+Pls24Pt4eAmqaRJ4vRYiEVfN1Rr11DBxT9nEmM=;
        b=2AOyNGPlzbOvq2pHzedQdGe762CxyA+FSq7e/AZoKQP5R6bIa2F0joZNPD9xZROr4B
         gFg3TommqNt0aZ5gvev9QEZRCVxECnpptso5hzmrBzJ766tUDeynpoU1Ws+CEuRUuZd5
         YbbMRKlHQhaHl5kRpoOZLCpnxZG6EviwUmcxYiVwbzmNzNglf6+InaZZEOFDqPBPTr5s
         ZaI9hQAgTrPRbpom837rkRpkp2DBUf/6Hk1EKtLF5iyunKDjzcwzO8qIh7vWn6fQ94bX
         JutrL9SyWgRpXy/qdFpi0YnGhlgk77d0+57xQY53LMRKb554RU5gtoNSfYqhXMAsvxm5
         ZdKQ==
X-Gm-Message-State: AOAM532A/medAPe9fiTi42KLSd4BJfNBYF1dfsoIkDSl65zi4BqqD5IA
        +jEf50NxjpbBiYg90I8c2ICH3VdPC6w71bAtcqzPeW67yi+A1IFr
X-Google-Smtp-Source: ABdhPJy2gOk3Zzxm0C0n9Wen4XLV4/sFuY6K2SRPZPfGa7brAw+BKzN+kccISRjMe8hv/SDhAk6kPVcEw73NhScPWjI=
X-Received: by 2002:a17:902:7c8a:b0:143:bb4a:7bb3 with SMTP id
 y10-20020a1709027c8a00b00143bb4a7bb3mr24287656pll.46.1638550825958; Fri, 03
 Dec 2021 09:00:25 -0800 (PST)
MIME-Version: 1.0
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Fri, 3 Dec 2021 09:00:15 -0800
Message-ID: <CAJ+vNU0ZqMr3qZMe0EKKOnHWD3CDNkRc8CxDWVJPw-8m20nLsw@mail.gmail.com>
Subject: IMX8MM Hantro VP9 decode failure
To:     linux-media <linux-media@vger.kernel.org>,
        Discussion of the development of and with GStreamer 
        <gstreamer-devel@lists.freedesktop.org>,
        Adam Ford <aford173@gmail.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Greetings,

I'm testing the VP9 hantro kernel support on an IMX8MM with the following:
- imx8mm-venice-gw73xx-0x board with a 800x480 MIPI DSI display
- v5.16-rc3 kernel with:
  - [PATCH v7 00/11] VP9 codec V4L2 control interface
  - IMX8MM DSI support added (some old patchsets)
  - GStreamer 1.19.3+

 with vp9 backported, hantro support added, and imx8mm display support added
- gstreamer 1.19.3 (git sha b5c07e11ca)

I see the v4l2 stateless decoder:
[gst-main] root@focal-venice:~/gstreamer/build# gst-inspect-1.0
v4l2codecs | grep v4l2slvp9dec
  v4l2slvp9dec: V4L2 Stateless VP9 Video Decoder

I'm generating a test stream on an x86 with GStreamer 1.19.3 (git sha
05458f05e0):
gst-launch-1.0 -v videotestsrc ! video/x-raw,width=800,height=480 !
vp9enc ! rtpvp9pay ! udpsink host=172.24.33.15 port=9001

I'm decoding on imx8mm with:
gst-launch-1.0 udpsrc port=9001 caps =
'application/x-rtp,media=(string)video, clock-rate=(int)90000,
encoding-name=(string)VP9,payload=(int)96, ssrc=(uint)2246741422,
timestamp-offset=(uint)3441735424,
seqnum-offset=(uint)30250,a-framerate=(string)30' ! rtpvp9depay !
v4l2slvp9dec ! fakesink
^^^ this fails with no-negotiated

Things seem to be very bleeding edge with VP9 so I'm not sure if I
need very specific gstreamer versions here or not.

Best regards,

Tim
