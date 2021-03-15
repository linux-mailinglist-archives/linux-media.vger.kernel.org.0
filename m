Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8787633AE97
	for <lists+linux-media@lfdr.de>; Mon, 15 Mar 2021 10:24:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229519AbhCOJXp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Mar 2021 05:23:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229663AbhCOJXb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Mar 2021 05:23:31 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91BC2C06175F
        for <linux-media@vger.kernel.org>; Mon, 15 Mar 2021 02:23:29 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 184so15323850ljf.9
        for <linux-media@vger.kernel.org>; Mon, 15 Mar 2021 02:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=09M/ZPnox14lHfQB6/CG4+kCIenxlSuZvh/8JlCqCLs=;
        b=0kytdCR+2lckKxY/tLKja8NvkufhP1dkpL6w9QfTBMRv2AInWXO7s+yr4vO7efHYXZ
         Gy4+0rr1BGaXdWG5ABCSMRgVjfBPJvkijm7a2giPitm2Gk3gv7t4M4AMVIAzmKdoxwTe
         0w8RfkKR4OJmcNSSFhVn4yG2d2y+9w6VuuAfc71dC9CdcUaRwcU9m5yacmX7HG6s1V37
         Y00KC4oPrvmTeqmrgIG3z8oxOfqnDpyY+7ulsvM+8bR2/H7k0Cr0hRJH5rdKkfXpJDly
         iCmGeZl2+A+RfssId+EBk45ZvcIv5C+MqCN5WpxS7zpO2fDcIZgbwMKpZ28qXWA1Mrsi
         ANyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=09M/ZPnox14lHfQB6/CG4+kCIenxlSuZvh/8JlCqCLs=;
        b=gWoo36aH0NoZ73Hurr5u498U8Nh969DNaMNbhCH05pzs27n029fIkXJobPjD7Z7+4H
         WRImt3ytxKqMm66IC0Z+6/QYiG93j8xJ5hYkNkR1pPmDUh1OHvKp8c9SnsnjeAQZdyFb
         iu3N+oZm6CtUJxxKP9OgRMjaAhaEEIKF1OHu0OKu2Q5dbNTcFF4GtSnEz4K3PKCjbV9i
         MBa23ZP1HVkJQx3q5lbytWZQ22hLqlAPyMfMfgJtoR9rPpOWNbKD15BDkCOP24FPO7EN
         cyAjeRUIB92MKk2ec6Xy2iTn59GgNjz96y51ijhyx5NgtYiJfkoXTcvYBUlS1vhqAHzM
         5FQw==
X-Gm-Message-State: AOAM531qpelUnTT9qR3KqxWMJDQ/qX5wLRE0XaEi1MpU4RCtghyJEwsv
        PQA4pzWuViky5c8tJIQMNMy/uQ==
X-Google-Smtp-Source: ABdhPJzV6psh0rnN5MoedeMWs1WgjkdMbU3bHOVcK5k7XEH+oovjIVTZBV/al+StoyPzwxf82tPxyg==
X-Received: by 2002:a2e:9c41:: with SMTP id t1mr10062908ljj.345.1615800207907;
        Mon, 15 Mar 2021 02:23:27 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id h4sm2854285lji.84.2021.03.15.02.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 02:23:27 -0700 (PDT)
Date:   Mon, 15 Mar 2021 10:23:26 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>, mani@kernel.org
Subject: Re: Renesas RZ/G2M + Sony IMX290 Camera questions/issues
Message-ID: <YE8njotFxRloFIx7@oden.dyn.berto.se>
References: <CAHCN7xJUnMP-uA03a5x4djp4_RPbiMnSWXMdconpAxV7pwgTGw@mail.gmail.com>
 <YEuAGoeoi0X0KwfH@oden.dyn.berto.se>
 <CAHCN7xLNO5wFHxEJ8Qcdw57M=d25bi-uCcuV1rdMSheh3jvE3g@mail.gmail.com>
 <YE0Vs0I6i5R5ngZ4@oden.dyn.berto.se>
 <CAHCN7x+Fk3qNk_ntWLYyQywpP02M1r9US8AR6pSw-cxJZbwraw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHCN7x+Fk3qNk_ntWLYyQywpP02M1r9US8AR6pSw-cxJZbwraw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Adam,

On 2021-03-13 15:02:54 -0600, Adam Ford wrote:
> On Sat, Mar 13, 2021 at 1:42 PM Niklas Söderlund
> <niklas.soderlund@ragnatech.se> wrote:
> >
> > Hi Adam,
> >
> > Thanks for reporting your results.
> >
> > On 2021-03-13 11:47:16 -0600, Adam Ford wrote:
> > > On Fri, Mar 12, 2021 at 8:52 AM Niklas Söderlund
> > > <niklas.soderlund@ragnatech.se> wrote:
> > > >
> > > > Hi Adam,
> > > >
> > > > There are many possibility's that result in an -EPIPE when validating
> > > > formats and unfortunately V4L2 is not always as very helpfull when
> > > > diagnosing the problem. What I usually do is to,
> > > >
> > > > 1. Inspect rvin_mc_validate_format() in
> > > >    drivers/media/platform/rcar-vin/rcar-dma.c
> > > >
> > > >    This will give you a clear view of how the format between the CSI-2
> > > >    and VIN is validated.
> > > >
> > > > 2. Increase the log level for drivers/media/v4l2-core/v4l2-subdev.c
> > > >    specially for v4l2_subdev_link_validate_default().
> > > >
> > > >    This will give you insight into all formats from the CSI-2 receiver
> > > >    towards the camera.
> > > >
> > > > By doing these two things you will see in the system log which part of
> > > > the format validation that is missmatched.
> > >
> > > Thanks for the suggestion.  It turns out the camera sensor is not
> > > capable of UYVY, and the RZ/G2M doesn't appear to support RAW10 or
> > > RAW12 over CSI2.
> >
> > If I *tried* to create patches to add support for RAW10 would you be
> > able to test them? I have no video source to test RAW formats with so
> > maybe we can solve this together.
> 
> I would love to test them, but looking at the datasheet for the RZ/G2
> N/M/H, it doesn't appear as if RAW10 supported at all, and RAW12 looks
> like it may only be supported over digital pins and not CSI2.  If you
> have thoughts, I'm willing to discuss it and try.

You are correct I was looking at the wrong document, my bad.

> 
> adam
> 
> >
> > >
> > > adam
> > >
> > > >
> > > > There is also a wiki page for capture using R-Car VIN that may be
> > > > helpful for you.
> > > >
> > > >     https://elinux.org/R-Car/Tests:rcar-vin
> > > >
> > > > On 2021-03-12 08:28:41 -0600, Adam Ford wrote:
> > > > > I have an IMX290 camera connected to an RZ/G2M SoC via the 4-channel CSI.
> > > > >
> > > > > &csi40 {
> > > > >     status = "okay";
> > > > >
> > > > >     ports {
> > > > >         port@0 {
> > > > >             reg = <0>;
> > > > >             csi40_in: endpoint {
> > > > >                 clock-lanes = <0>;
> > > > >                 data-lanes = <1 2 3 4>;
> > > > >                 remote-endpoint = <&imx290_ep>;
> > > > >             };
> > > > >         };
> > > > >     };
> > > > > };
> > > > >
> > > > > On the I2C bus, I have
> > > > >
> > > > > imx290: camera-sensor@1a {
> > > > >     compatible = "sony,imx290";
> > > > >     reg = <0x1a>;
> > > > >     reset-gpios = <&gpio_exp2 0 GPIO_ACTIVE_LOW>;
> > > > >     clocks = <&versaclock6_bb 1>;
> > > > >     clock-names = "xclk";
> > > > >     clock-frequency = <37125000>;
> > > > >     vdddo-supply = <&reg_cam0_en0>;
> > > > >     vdda-supply = <&reg_cam0_en1>;
> > > > >     vddd-supply = <&reg_cam0_en0>;
> > > > >
> > > > >     port {
> > > > >         imx290_ep: endpoint {
> > > > >             data-lanes = <1 2 3 4>;
> > > > >             link-frequencies = /bits/ 64 <148500000 222750000>;
> > > > >             remote-endpoint = <&csi40_in>;
> > > > >         };
> > > > >     };
> > > > > };
> > > > >
> > > > > I configure the pipeline with:
> > > > >
> > > > > media-ctl -l "'rcar_csi2 feaa0000.csi2':1 -> 'VIN0 output':0[1]"
> > > > >
> > > > > I also have tried configuring the video formats in several different ways
> > > > >
> > > > > media-ctl --set-v4l2 "'imx290 2-001a':0[fmt:SRGGB12_1X12/1920x1080 field:none]"
> > > > > media-ctl --set-v4l2 "'rcar_csi2
> > > > > feaa0000.csi2':0[fmt:SRGGB12_1X12/1920x1080 field:none]"
> > > > > media-ctl --set-v4l2 "'rcar_csi2
> > > > > feaa0000.csi2':1[fmt:SRGGB12_1X12/1920x1080 field:none]"
> > > > >
> > > > > or
> > > > >
> > > > > media-ctl --set-v4l2 "'rcar_csi2
> > > > > feaa0000.csi2':0[fmt:UYVY8_2X8/1920x1080 field:none]"
> > > > > media-ctl --set-v4l2 "'rcar_csi2
> > > > > feaa0000.csi2':1[fmt:UYVY8_2X8/1920x1080 field:none]"
> > > > > media-ctl --set-v4l2 "'imx290 2-001a':0[fmt:UYVY8_2X8/1920x1080 field:non
> > > > >
> > > > > but no matter what I do when I attempt to stream, I get a broken pipe,
> > > > > even when I use fakesink as the target.
> > > > >
> > > > > root@beacon-rzg2h:~# GST_DEBUG=2 gst-launch-1.0 -v v4l2src
> > > > > device=/dev/video1 ! video/x-raw,width=1920,height=1080 ! fakesink
> > > > > Setting pipeline to PAUSED ...
> > > > > Pipeline is live and does not need PREROLL ...
> > > > > Setting pipeline to PLAYING ...
> > > > > New clock: GstSystemClock
> > > > > 0:00:03.727500390   501     0x10efd4f0 ERROR                v4l2src
> > > > > gstv4l2src.c:337:gst_v4l2src_get_input_size_info:<v4l2src0> Cropcap
> > > > > fail, CROPCAP has not supported
> > > > > /GstPipeline:pipeline0/GstV4l2Src:v4l2src0.GstPad:src: caps =
> > > > > video/x-raw, width=(int)1920, height=(int)1080, format=(string)YUY2,
> > > > > framerate=(fraction)100/1, interlace-mode=(s1
> > > > > /GstPipeline:pipeline0/GstCapsFilter:capsfilter0.GstPad:src: caps =
> > > > > video/x-raw, width=(int)1920, height=(int)1080, format=(string)YUY2,
> > > > > framerate=(fraction)100/1, interlace-m1
> > > > > /GstPipeline:pipeline0/GstFakeSink:fakesink0.GstPad:sink: caps =
> > > > > video/x-raw, width=(int)1920, height=(int)1080, format=(string)YUY2,
> > > > > framerate=(fraction)100/1, interlace-mode1
> > > > > /GstPipeline:pipeline0/GstCapsFilter:capsfilter0.GstPad:sink: caps =
> > > > > video/x-raw, width=(int)1920, height=(int)1080, format=(string)YUY2,
> > > > > framerate=(fraction)100/1, interlace-1
> > > > > 0:00:03.737388309   501     0x10efd4f0 WARN          v4l2bufferpool
> > > > > gstv4l2bufferpool.c:870:gst_v4l2_buffer_pool_start:<v4l2src0:pool:src>
> > > > > Uncertain or not enough buffers, enad
> > > > > 0:00:03.740266641   501     0x10efd4f0 ERROR         v4l2bufferpool
> > > > > gstv4l2bufferpool.c:757:gst_v4l2_buffer_pool_streamon:<v4l2src0:pool:src>
> > > > > error with STREAMON 32 (Broken pi)
> > > > > 0:00:03.740474842   501     0x10efd4f0 WARN          v4l2bufferpool
> > > > > gstv4l2bufferpool.c:1188:gst_v4l2_buffer_pool_poll:<v4l2src0> error:
> > > > > poll error 1: Broken pipe (32)
> > > > > 0:00:03.740693123   501     0x10efd4f0 WARN                 v4l2src
> > > > > gstv4l2src.c:1020:gst_v4l2src_create:<v4l2src0> error: Failed to
> > > > > allocate a buffer
> > > > > 0:00:03.740791643   501     0x10efd4f0 WARN                 basesrc
> > > > > gstbasesrc.c:2939:gst_base_src_loop:<v4l2src0> error: Internal data
> > > > > stream error.
> > > > > 0:00:03.740822843   501     0x10efd4f0 WARN                 basesrc
> > > > > gstbasesrc.c:2939:gst_base_src_loop:<v4l2src0> error: streaming
> > > > > stopped, reason error (-5)
> > > > > ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0: Could
> > > > > not read from resource.
> > > > > Additional debug info:
> > > > > ../../../git/sys/v4l2/gstv4l2bufferpool.c(1188):
> > > > > gst_v4l2_buffer_pool_poll ():
> > > > > /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
> > > > > poll error 1: Broken pipe (32)
> > > > > Execution ended after 0:00:00.013644415
> > > > > Setting pipeline to PAUSED ...
> > > > > Setting pipeline to READY ...
> > > > > 0:00:03.741392965   501     0x10ec96c0 WARN          v4l2bufferpool
> > > > > gstv4l2bufferpool.c:1042:gst_v4l2_buffer_pool_stop:<v4l2src0:pool:src>
> > > > > some buffers are still outstanding
> > > > > 0:00:03.741428005   501     0x10ec96c0 WARN              bufferpool
> > > > > gstbufferpool.c:567:gst_buffer_pool_set_active:<v4l2src0:pool:src>
> > > > > stop failed
> > > > > 0:00:03.743868095   501     0x10ec96c0 ERROR         v4l2bufferpool
> > > > > gstv4l2bufferpool.c:757:gst_v4l2_buffer_pool_streamon:<v4l2src0:pool:src>
> > > > > error with STREAMON 32 (Broken pi)
> > > > > 0:00:03.744090576   501     0x10ec96c0 WARN          v4l2bufferpool
> > > > > gstv4l2bufferpool.c:1042:gst_v4l2_buffer_pool_stop:<v4l2src0:pool:src>
> > > > > some buffers are still outstanding
> > > > > 0:00:03.744123936   501     0x10ec96c0 WARN              bufferpool
> > > > > gstbufferpool.c:567:gst_buffer_pool_set_active:<v4l2src0:pool:src>
> > > > > stop failed
> > > > > 0:00:03.744152376   501     0x10ec96c0 WARN          v4l2bufferpool
> > > > > gstv4l2bufferpool.c:1042:gst_v4l2_buffer_pool_stop:<v4l2src0:pool:src>
> > > > > some buffers are still outstanding
> > > > > 0:00:03.744178296   501     0x10ec96c0 WARN              bufferpool
> > > > > gstbufferpool.c:567:gst_buffer_pool_set_active:<v4l2src0:pool:src>
> > > > > stop failed
> > > > > Setting pipeline to NULL ...
> > > > > Total time: 0.013650 seconds
> > > > > Freeing pipeline ...
> > > > >
> > > > >
> > > > > I was hoping someone might have a suggestion as to what I might be missing.
> > > > > Ideally, I'd like to get two IMX290 cameras operational with one in
> > > > > 4-lane mode and one in 2-lane mode.
> > > > >
> > > > > Might anyone have any suggestions?  According to the media-ctl
> > > > > --print-dot, the pipeline appears correct, but there is clearly
> > > > > something I am missing.
> > > > >
> > > > > thanks for any suggestions,
> > > > >
> > > > > adam
> > > >
> > > > --
> > > > Regards,
> > > > Niklas Söderlund
> >
> > --
> > Regards,
> > Niklas Söderlund

-- 
Regards,
Niklas Söderlund
