Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C337339007
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 15:29:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230388AbhCLO3L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 09:29:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231179AbhCLO2x (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 09:28:53 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74F44C061762;
        Fri, 12 Mar 2021 06:28:53 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id s21so5235242pjq.1;
        Fri, 12 Mar 2021 06:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=1Lo7yd/PnM426H85p1I+R4RaKFFPMA2/dD1IRf/rqnw=;
        b=q7Kbbcst6z5BfuObWBGBR+6Ok6LQDvVOXSN39H0yveBiTYDjHGVamD+YCt9qP2lUQF
         jK1KkrhrA4wU5v1NGw7EaB1U3/7j9HmPgqJy1jep6q3GqKxKMyk/mukHnlZTQFKtGCV2
         E89BPRvzEBHAZnGRw1o09IyRTRFGeEOsN7aoWP3w2qg5vg3xvT+7HboHXJeNAgn1p5l6
         WsAzyy39t7FRqfKObG6m05At96Msja3xStcR/HQl9r3aFC9QRl0ZGIPZLS6Ammq6+SMX
         GVAsbIThnC8bVtPeRwO0bflduG+DiX0XaHsE6vY+m3xtroS9+NpAzV50NQux/TNdpzz0
         SkjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=1Lo7yd/PnM426H85p1I+R4RaKFFPMA2/dD1IRf/rqnw=;
        b=bPkDOXEihxMmrBziHuSMiIXlQicmqiJeb5YSAy5sIB5rHNq4O85JN3yvI20LBNfFM7
         qP1JV6EMmpTT7ljO8gZFzGllgE3PNGN7EboQu/7AmQ7lyJBz9i4qKE0NSFlOIw0fddr8
         WRSlTrTyFhjTP/6pBofM0Q4Hj6eARjRESYFNmlLfiWVNoIat4h2eAxsw51voD5j6PSmS
         nOWdLs/FJM+72+5vDYo3PWGQNWJ0xiXV2UJPbKDD3mR26Wj9OSafcEdsoLnEru5J5PMG
         qsv/zZCUxix30LhL1/1IUMUJ2MpfgKIosT44cS9mLuw1VKxEn8Teyewvjluf98aFTmAz
         /EvA==
X-Gm-Message-State: AOAM533azaMzSc4phOzgXayp4A3C496azUnt3sfK2PSrUdCN+uU6jkcC
        2qDwStKo7dvbzXd8Dn3AY0s+vmUf/LplJbQ2oK63AqSLjVA=
X-Google-Smtp-Source: ABdhPJxFp4HyQtxeYU8wFIrQReEqUWp6sPJWmDShCPg+MIU0zhCeNdYillJpDrx6tyAYDPoiPDQG4bkmtBE42oy2vdk=
X-Received: by 2002:a17:902:f686:b029:e5:de44:af60 with SMTP id
 l6-20020a170902f686b02900e5de44af60mr13595242plg.64.1615559332462; Fri, 12
 Mar 2021 06:28:52 -0800 (PST)
MIME-Version: 1.0
From:   Adam Ford <aford173@gmail.com>
Date:   Fri, 12 Mar 2021 08:28:41 -0600
Message-ID: <CAHCN7xJUnMP-uA03a5x4djp4_RPbiMnSWXMdconpAxV7pwgTGw@mail.gmail.com>
Subject: Renesas RZ/G2M + Sony IMX290 Camera questions/issues
To:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>, mani@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I have an IMX290 camera connected to an RZ/G2M SoC via the 4-channel CSI.

&csi40 {
    status = "okay";

    ports {
        port@0 {
            reg = <0>;
            csi40_in: endpoint {
                clock-lanes = <0>;
                data-lanes = <1 2 3 4>;
                remote-endpoint = <&imx290_ep>;
            };
        };
    };
};

On the I2C bus, I have

imx290: camera-sensor@1a {
    compatible = "sony,imx290";
    reg = <0x1a>;
    reset-gpios = <&gpio_exp2 0 GPIO_ACTIVE_LOW>;
    clocks = <&versaclock6_bb 1>;
    clock-names = "xclk";
    clock-frequency = <37125000>;
    vdddo-supply = <&reg_cam0_en0>;
    vdda-supply = <&reg_cam0_en1>;
    vddd-supply = <&reg_cam0_en0>;

    port {
        imx290_ep: endpoint {
            data-lanes = <1 2 3 4>;
            link-frequencies = /bits/ 64 <148500000 222750000>;
            remote-endpoint = <&csi40_in>;
        };
    };
};

I configure the pipeline with:

media-ctl -l "'rcar_csi2 feaa0000.csi2':1 -> 'VIN0 output':0[1]"

I also have tried configuring the video formats in several different ways

media-ctl --set-v4l2 "'imx290 2-001a':0[fmt:SRGGB12_1X12/1920x1080 field:none]"
media-ctl --set-v4l2 "'rcar_csi2
feaa0000.csi2':0[fmt:SRGGB12_1X12/1920x1080 field:none]"
media-ctl --set-v4l2 "'rcar_csi2
feaa0000.csi2':1[fmt:SRGGB12_1X12/1920x1080 field:none]"

or

media-ctl --set-v4l2 "'rcar_csi2
feaa0000.csi2':0[fmt:UYVY8_2X8/1920x1080 field:none]"
media-ctl --set-v4l2 "'rcar_csi2
feaa0000.csi2':1[fmt:UYVY8_2X8/1920x1080 field:none]"
media-ctl --set-v4l2 "'imx290 2-001a':0[fmt:UYVY8_2X8/1920x1080 field:non

but no matter what I do when I attempt to stream, I get a broken pipe,
even when I use fakesink as the target.

root@beacon-rzg2h:~# GST_DEBUG=2 gst-launch-1.0 -v v4l2src
device=/dev/video1 ! video/x-raw,width=1920,height=1080 ! fakesink
Setting pipeline to PAUSED ...
Pipeline is live and does not need PREROLL ...
Setting pipeline to PLAYING ...
New clock: GstSystemClock
0:00:03.727500390   501     0x10efd4f0 ERROR                v4l2src
gstv4l2src.c:337:gst_v4l2src_get_input_size_info:<v4l2src0> Cropcap
fail, CROPCAP has not supported
/GstPipeline:pipeline0/GstV4l2Src:v4l2src0.GstPad:src: caps =
video/x-raw, width=(int)1920, height=(int)1080, format=(string)YUY2,
framerate=(fraction)100/1, interlace-mode=(s1
/GstPipeline:pipeline0/GstCapsFilter:capsfilter0.GstPad:src: caps =
video/x-raw, width=(int)1920, height=(int)1080, format=(string)YUY2,
framerate=(fraction)100/1, interlace-m1
/GstPipeline:pipeline0/GstFakeSink:fakesink0.GstPad:sink: caps =
video/x-raw, width=(int)1920, height=(int)1080, format=(string)YUY2,
framerate=(fraction)100/1, interlace-mode1
/GstPipeline:pipeline0/GstCapsFilter:capsfilter0.GstPad:sink: caps =
video/x-raw, width=(int)1920, height=(int)1080, format=(string)YUY2,
framerate=(fraction)100/1, interlace-1
0:00:03.737388309   501     0x10efd4f0 WARN          v4l2bufferpool
gstv4l2bufferpool.c:870:gst_v4l2_buffer_pool_start:<v4l2src0:pool:src>
Uncertain or not enough buffers, enad
0:00:03.740266641   501     0x10efd4f0 ERROR         v4l2bufferpool
gstv4l2bufferpool.c:757:gst_v4l2_buffer_pool_streamon:<v4l2src0:pool:src>
error with STREAMON 32 (Broken pi)
0:00:03.740474842   501     0x10efd4f0 WARN          v4l2bufferpool
gstv4l2bufferpool.c:1188:gst_v4l2_buffer_pool_poll:<v4l2src0> error:
poll error 1: Broken pipe (32)
0:00:03.740693123   501     0x10efd4f0 WARN                 v4l2src
gstv4l2src.c:1020:gst_v4l2src_create:<v4l2src0> error: Failed to
allocate a buffer
0:00:03.740791643   501     0x10efd4f0 WARN                 basesrc
gstbasesrc.c:2939:gst_base_src_loop:<v4l2src0> error: Internal data
stream error.
0:00:03.740822843   501     0x10efd4f0 WARN                 basesrc
gstbasesrc.c:2939:gst_base_src_loop:<v4l2src0> error: streaming
stopped, reason error (-5)
ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0: Could
not read from resource.
Additional debug info:
../../../git/sys/v4l2/gstv4l2bufferpool.c(1188):
gst_v4l2_buffer_pool_poll ():
/GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
poll error 1: Broken pipe (32)
Execution ended after 0:00:00.013644415
Setting pipeline to PAUSED ...
Setting pipeline to READY ...
0:00:03.741392965   501     0x10ec96c0 WARN          v4l2bufferpool
gstv4l2bufferpool.c:1042:gst_v4l2_buffer_pool_stop:<v4l2src0:pool:src>
some buffers are still outstanding
0:00:03.741428005   501     0x10ec96c0 WARN              bufferpool
gstbufferpool.c:567:gst_buffer_pool_set_active:<v4l2src0:pool:src>
stop failed
0:00:03.743868095   501     0x10ec96c0 ERROR         v4l2bufferpool
gstv4l2bufferpool.c:757:gst_v4l2_buffer_pool_streamon:<v4l2src0:pool:src>
error with STREAMON 32 (Broken pi)
0:00:03.744090576   501     0x10ec96c0 WARN          v4l2bufferpool
gstv4l2bufferpool.c:1042:gst_v4l2_buffer_pool_stop:<v4l2src0:pool:src>
some buffers are still outstanding
0:00:03.744123936   501     0x10ec96c0 WARN              bufferpool
gstbufferpool.c:567:gst_buffer_pool_set_active:<v4l2src0:pool:src>
stop failed
0:00:03.744152376   501     0x10ec96c0 WARN          v4l2bufferpool
gstv4l2bufferpool.c:1042:gst_v4l2_buffer_pool_stop:<v4l2src0:pool:src>
some buffers are still outstanding
0:00:03.744178296   501     0x10ec96c0 WARN              bufferpool
gstbufferpool.c:567:gst_buffer_pool_set_active:<v4l2src0:pool:src>
stop failed
Setting pipeline to NULL ...
Total time: 0.013650 seconds
Freeing pipeline ...


I was hoping someone might have a suggestion as to what I might be missing.
Ideally, I'd like to get two IMX290 cameras operational with one in
4-lane mode and one in 2-lane mode.

Might anyone have any suggestions?  According to the media-ctl
--print-dot, the pipeline appears correct, but there is clearly
something I am missing.

thanks for any suggestions,

adam
