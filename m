Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBD06339F9C
	for <lists+linux-media@lfdr.de>; Sat, 13 Mar 2021 18:48:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234104AbhCMRri (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 Mar 2021 12:47:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233951AbhCMRr2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 Mar 2021 12:47:28 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4867C061574;
        Sat, 13 Mar 2021 09:47:28 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id a188so4005382pfb.4;
        Sat, 13 Mar 2021 09:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=hHTUTg1wfm0Mi6vQDkHrFeD56u5ygzapu5OYjQOlY38=;
        b=ZrUaJLx2O4jf4FLrKqwfBywX39iXhpmCj38H8mxiT3IYnUwxp4AN79u0PIvpKIGkXK
         KzvJHkmSrJh9xiLfQ3CY/bKH3t9KxF0NXZVNb8e1Mz7Mpak22xgRkPuJtZN0+EQ2tT2Z
         SAX5pj+CSp3yOkteozZL1299qV2cglWrXZPkmoHMtQWAWLriKY4pylikh+dfIVM+lm/0
         HZArivTOqA4RztBujDQXKh/vhlKdiWkQLjDj3jBkB6xO1eG3828AC8G55Svu0+VYiBSP
         orP93GMdKuRFAT9mX6K5BMKNTmXNpz11/ODDZFzhATHd4y31igvWOUYeZgqHlMlJJnJ0
         HWTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=hHTUTg1wfm0Mi6vQDkHrFeD56u5ygzapu5OYjQOlY38=;
        b=HdMgonWoko1N0lpLif37iTRK8XKwa2bZgplzNiqR39VP0gy9GNHhaxUXi0L+XmGk59
         agxsFSrHqfm1bOiQ6piwt5fJYbZdtElsytSQqRjDTa3Chl8pIB6y5Ci/R6/yzlsZvCMX
         2Nq6n6ar2u2w+uf/pHPSXJLGgOffrFMLmaTgchG7vbWyP2FP2cFp5na8aF965Mb2mh3k
         v8gF40KvxCTX6wGL6e/DABIB20Dhtye0sl41vRb05K/6U0KdA1foJES/fhNYkU30ZG3K
         8ehW+V7liPwEgw1d57ONx4MAe/ASK3GLXv4E/3rOUVjafi0tYgcgVQR6C2rv67+/mzEB
         yOlA==
X-Gm-Message-State: AOAM530AfAcbhE8G3W/FYK/FCr20zrc1RbOJBUxlElNWiM9J3r1FVoa9
        Vfriw7MuOJkw2Xs05OAlv/F6ewDHK15xyiBmkEE=
X-Google-Smtp-Source: ABdhPJwrvTtfauV4JXxWfZKmWxt6iGI58NyHEKHmVSKpBpOO4AQCSaLhIcIrYWSHlzAarR0MpkgFDtoh7sx7rXrNIU8=
X-Received: by 2002:a63:2cc4:: with SMTP id s187mr16419970pgs.438.1615657648051;
 Sat, 13 Mar 2021 09:47:28 -0800 (PST)
MIME-Version: 1.0
References: <CAHCN7xJUnMP-uA03a5x4djp4_RPbiMnSWXMdconpAxV7pwgTGw@mail.gmail.com>
 <YEuAGoeoi0X0KwfH@oden.dyn.berto.se>
In-Reply-To: <YEuAGoeoi0X0KwfH@oden.dyn.berto.se>
From:   Adam Ford <aford173@gmail.com>
Date:   Sat, 13 Mar 2021 11:47:16 -0600
Message-ID: <CAHCN7xLNO5wFHxEJ8Qcdw57M=d25bi-uCcuV1rdMSheh3jvE3g@mail.gmail.com>
Subject: Re: Renesas RZ/G2M + Sony IMX290 Camera questions/issues
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>, mani@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Mar 12, 2021 at 8:52 AM Niklas S=C3=B6derlund
<niklas.soderlund@ragnatech.se> wrote:
>
> Hi Adam,
>
> There are many possibility's that result in an -EPIPE when validating
> formats and unfortunately V4L2 is not always as very helpfull when
> diagnosing the problem. What I usually do is to,
>
> 1. Inspect rvin_mc_validate_format() in
>    drivers/media/platform/rcar-vin/rcar-dma.c
>
>    This will give you a clear view of how the format between the CSI-2
>    and VIN is validated.
>
> 2. Increase the log level for drivers/media/v4l2-core/v4l2-subdev.c
>    specially for v4l2_subdev_link_validate_default().
>
>    This will give you insight into all formats from the CSI-2 receiver
>    towards the camera.
>
> By doing these two things you will see in the system log which part of
> the format validation that is missmatched.

Thanks for the suggestion.  It turns out the camera sensor is not
capable of UYVY, and the RZ/G2M doesn't appear to support RAW10 or
RAW12 over CSI2.

adam

>
> There is also a wiki page for capture using R-Car VIN that may be
> helpful for you.
>
>     https://elinux.org/R-Car/Tests:rcar-vin
>
> On 2021-03-12 08:28:41 -0600, Adam Ford wrote:
> > I have an IMX290 camera connected to an RZ/G2M SoC via the 4-channel CS=
I.
> >
> > &csi40 {
> >     status =3D "okay";
> >
> >     ports {
> >         port@0 {
> >             reg =3D <0>;
> >             csi40_in: endpoint {
> >                 clock-lanes =3D <0>;
> >                 data-lanes =3D <1 2 3 4>;
> >                 remote-endpoint =3D <&imx290_ep>;
> >             };
> >         };
> >     };
> > };
> >
> > On the I2C bus, I have
> >
> > imx290: camera-sensor@1a {
> >     compatible =3D "sony,imx290";
> >     reg =3D <0x1a>;
> >     reset-gpios =3D <&gpio_exp2 0 GPIO_ACTIVE_LOW>;
> >     clocks =3D <&versaclock6_bb 1>;
> >     clock-names =3D "xclk";
> >     clock-frequency =3D <37125000>;
> >     vdddo-supply =3D <&reg_cam0_en0>;
> >     vdda-supply =3D <&reg_cam0_en1>;
> >     vddd-supply =3D <&reg_cam0_en0>;
> >
> >     port {
> >         imx290_ep: endpoint {
> >             data-lanes =3D <1 2 3 4>;
> >             link-frequencies =3D /bits/ 64 <148500000 222750000>;
> >             remote-endpoint =3D <&csi40_in>;
> >         };
> >     };
> > };
> >
> > I configure the pipeline with:
> >
> > media-ctl -l "'rcar_csi2 feaa0000.csi2':1 -> 'VIN0 output':0[1]"
> >
> > I also have tried configuring the video formats in several different wa=
ys
> >
> > media-ctl --set-v4l2 "'imx290 2-001a':0[fmt:SRGGB12_1X12/1920x1080 fiel=
d:none]"
> > media-ctl --set-v4l2 "'rcar_csi2
> > feaa0000.csi2':0[fmt:SRGGB12_1X12/1920x1080 field:none]"
> > media-ctl --set-v4l2 "'rcar_csi2
> > feaa0000.csi2':1[fmt:SRGGB12_1X12/1920x1080 field:none]"
> >
> > or
> >
> > media-ctl --set-v4l2 "'rcar_csi2
> > feaa0000.csi2':0[fmt:UYVY8_2X8/1920x1080 field:none]"
> > media-ctl --set-v4l2 "'rcar_csi2
> > feaa0000.csi2':1[fmt:UYVY8_2X8/1920x1080 field:none]"
> > media-ctl --set-v4l2 "'imx290 2-001a':0[fmt:UYVY8_2X8/1920x1080 field:n=
on
> >
> > but no matter what I do when I attempt to stream, I get a broken pipe,
> > even when I use fakesink as the target.
> >
> > root@beacon-rzg2h:~# GST_DEBUG=3D2 gst-launch-1.0 -v v4l2src
> > device=3D/dev/video1 ! video/x-raw,width=3D1920,height=3D1080 ! fakesin=
k
> > Setting pipeline to PAUSED ...
> > Pipeline is live and does not need PREROLL ...
> > Setting pipeline to PLAYING ...
> > New clock: GstSystemClock
> > 0:00:03.727500390   501     0x10efd4f0 ERROR                v4l2src
> > gstv4l2src.c:337:gst_v4l2src_get_input_size_info:<v4l2src0> Cropcap
> > fail, CROPCAP has not supported
> > /GstPipeline:pipeline0/GstV4l2Src:v4l2src0.GstPad:src: caps =3D
> > video/x-raw, width=3D(int)1920, height=3D(int)1080, format=3D(string)YU=
Y2,
> > framerate=3D(fraction)100/1, interlace-mode=3D(s1
> > /GstPipeline:pipeline0/GstCapsFilter:capsfilter0.GstPad:src: caps =3D
> > video/x-raw, width=3D(int)1920, height=3D(int)1080, format=3D(string)YU=
Y2,
> > framerate=3D(fraction)100/1, interlace-m1
> > /GstPipeline:pipeline0/GstFakeSink:fakesink0.GstPad:sink: caps =3D
> > video/x-raw, width=3D(int)1920, height=3D(int)1080, format=3D(string)YU=
Y2,
> > framerate=3D(fraction)100/1, interlace-mode1
> > /GstPipeline:pipeline0/GstCapsFilter:capsfilter0.GstPad:sink: caps =3D
> > video/x-raw, width=3D(int)1920, height=3D(int)1080, format=3D(string)YU=
Y2,
> > framerate=3D(fraction)100/1, interlace-1
> > 0:00:03.737388309   501     0x10efd4f0 WARN          v4l2bufferpool
> > gstv4l2bufferpool.c:870:gst_v4l2_buffer_pool_start:<v4l2src0:pool:src>
> > Uncertain or not enough buffers, enad
> > 0:00:03.740266641   501     0x10efd4f0 ERROR         v4l2bufferpool
> > gstv4l2bufferpool.c:757:gst_v4l2_buffer_pool_streamon:<v4l2src0:pool:sr=
c>
> > error with STREAMON 32 (Broken pi)
> > 0:00:03.740474842   501     0x10efd4f0 WARN          v4l2bufferpool
> > gstv4l2bufferpool.c:1188:gst_v4l2_buffer_pool_poll:<v4l2src0> error:
> > poll error 1: Broken pipe (32)
> > 0:00:03.740693123   501     0x10efd4f0 WARN                 v4l2src
> > gstv4l2src.c:1020:gst_v4l2src_create:<v4l2src0> error: Failed to
> > allocate a buffer
> > 0:00:03.740791643   501     0x10efd4f0 WARN                 basesrc
> > gstbasesrc.c:2939:gst_base_src_loop:<v4l2src0> error: Internal data
> > stream error.
> > 0:00:03.740822843   501     0x10efd4f0 WARN                 basesrc
> > gstbasesrc.c:2939:gst_base_src_loop:<v4l2src0> error: streaming
> > stopped, reason error (-5)
> > ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0: Could
> > not read from resource.
> > Additional debug info:
> > ../../../git/sys/v4l2/gstv4l2bufferpool.c(1188):
> > gst_v4l2_buffer_pool_poll ():
> > /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
> > poll error 1: Broken pipe (32)
> > Execution ended after 0:00:00.013644415
> > Setting pipeline to PAUSED ...
> > Setting pipeline to READY ...
> > 0:00:03.741392965   501     0x10ec96c0 WARN          v4l2bufferpool
> > gstv4l2bufferpool.c:1042:gst_v4l2_buffer_pool_stop:<v4l2src0:pool:src>
> > some buffers are still outstanding
> > 0:00:03.741428005   501     0x10ec96c0 WARN              bufferpool
> > gstbufferpool.c:567:gst_buffer_pool_set_active:<v4l2src0:pool:src>
> > stop failed
> > 0:00:03.743868095   501     0x10ec96c0 ERROR         v4l2bufferpool
> > gstv4l2bufferpool.c:757:gst_v4l2_buffer_pool_streamon:<v4l2src0:pool:sr=
c>
> > error with STREAMON 32 (Broken pi)
> > 0:00:03.744090576   501     0x10ec96c0 WARN          v4l2bufferpool
> > gstv4l2bufferpool.c:1042:gst_v4l2_buffer_pool_stop:<v4l2src0:pool:src>
> > some buffers are still outstanding
> > 0:00:03.744123936   501     0x10ec96c0 WARN              bufferpool
> > gstbufferpool.c:567:gst_buffer_pool_set_active:<v4l2src0:pool:src>
> > stop failed
> > 0:00:03.744152376   501     0x10ec96c0 WARN          v4l2bufferpool
> > gstv4l2bufferpool.c:1042:gst_v4l2_buffer_pool_stop:<v4l2src0:pool:src>
> > some buffers are still outstanding
> > 0:00:03.744178296   501     0x10ec96c0 WARN              bufferpool
> > gstbufferpool.c:567:gst_buffer_pool_set_active:<v4l2src0:pool:src>
> > stop failed
> > Setting pipeline to NULL ...
> > Total time: 0.013650 seconds
> > Freeing pipeline ...
> >
> >
> > I was hoping someone might have a suggestion as to what I might be miss=
ing.
> > Ideally, I'd like to get two IMX290 cameras operational with one in
> > 4-lane mode and one in 2-lane mode.
> >
> > Might anyone have any suggestions?  According to the media-ctl
> > --print-dot, the pipeline appears correct, but there is clearly
> > something I am missing.
> >
> > thanks for any suggestions,
> >
> > adam
>
> --
> Regards,
> Niklas S=C3=B6derlund
