Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D938074F8AD
	for <lists+linux-media@lfdr.de>; Tue, 11 Jul 2023 22:03:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230099AbjGKUDr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jul 2023 16:03:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbjGKUDn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jul 2023 16:03:43 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18346170C
        for <linux-media@vger.kernel.org>; Tue, 11 Jul 2023 13:03:08 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-99342a599e9so784656966b.3
        for <linux-media@vger.kernel.org>; Tue, 11 Jul 2023 13:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20221208.gappssmtp.com; s=20221208; t=1689105786; x=1691697786;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yIPj+EgtOZv5SXN2CpxKqLNIRx9hIaEyoKm2NQbfk8I=;
        b=DwyPL1ZVeqh4Q3r8QDxgAATkexUTigW3F7Cdp+u6a8Mb7BIHW7mVFf8uriKB1TRzKN
         EfRi84zMrDODksW+N4d06GRG/5LMwvthWuokQtWHB5xdMUVEXj95wf0GxkojCzIEW2f0
         8vflNX/OvMDb4AFve0kS8PVH3CUMcFKNgVGNSiXMlrsaitDoqnrxO4X6gapTUuF7zd0O
         7raV4ssHOR0cyZ+tJniZ+OYFb3NoVqy0TU/eUXcexuQZaCZ650UWD21GtUspnIqvYcwa
         /Zlo69Za8xnVFOwXS5bORQbiJcQIwwEeEdSVlxZXkevhjvlPfDNW57f2mKRu+qlwk3zK
         ETVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689105786; x=1691697786;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yIPj+EgtOZv5SXN2CpxKqLNIRx9hIaEyoKm2NQbfk8I=;
        b=b/WPQrvFOhW3wXVKFtt67ugxrfK79xpLjVQUD0vza5jywBIZ1j/RIhmQW1Wtli5BRY
         uxplTtaL2Z4dnljRq5kjjUQBawrfPfH0NBhl/5y6X+sBxptT66Oy5Z+lD6Q/Lecby4cr
         kVocgE0R1fAmrS8NVvn3D/Teozn+jdY4fBChF9ThKkH1Te6+ubn7XsF1sRCsNggh8fVh
         KqldlGPXA0Kl+Ot0GgDACOV5qCAkBtCqKnPjsgi7bxGOHXk6kD+xgDxBQUUlunIxrWsu
         B4wMNkBUWNpB0uUXEmllxWLWz2rfLY6BwiatVXZYZb47lLMfXFeIaMDlbySC76wYG4TL
         IMlg==
X-Gm-Message-State: ABy/qLZLkF6Z3sMx4j1+4NCnCGCzvN/w0S5uLenNQmFVMEtz6DR6p38G
        JHWFj0l6knnjn+ryUAvLTTUED0j03qtOm2wZEYQN3DJkGubKm/AQTMc=
X-Google-Smtp-Source: APBJJlGhYzvQonErwhaJklS2WDOxb6qCsKFSGAhHdF9GxLSH1m3N1qYqly/KHR6mjIKJC62dtic/SxDZtQNzL3OpYUU=
X-Received: by 2002:a17:906:3744:b0:982:b920:daad with SMTP id
 e4-20020a170906374400b00982b920daadmr15055019ejc.71.1689105785894; Tue, 11
 Jul 2023 13:03:05 -0700 (PDT)
MIME-Version: 1.0
References: <9aabef0e-9f48-f8bd-ab7c-e51ac2685116@kontron.de>
 <Y+EdT3uRzmjrxe6r@pendragon.ideasonboard.com> <8965ad7f-0683-81af-2bfd-e6a0a173c95e@kontron.de>
 <Y+EhsjtL5DYBie9u@pendragon.ideasonboard.com> <049f2fea-1725-74d9-d20d-fc4f7506d504@kontron.de>
 <Y+Vxg1lt0aIDRGIR@pendragon.ideasonboard.com> <d275e830-5960-0910-ca34-1b990971cea3@kontron.de>
 <Y+toAcOYNFbbvpPj@pendragon.ideasonboard.com> <07ceda76-3b3e-10d3-ecd3-e9fb2669445f@kontron.de>
 <12ad73f5-ea42-946b-5c89-5b6a07153006@kontron.de> <CAJ+vNU2R7DKoUcebKBC9Y74v_6FEXAGK=8mYD-CpqRypVdnXfw@mail.gmail.com>
 <ace7d422-17de-49d8-dac0-a6e4d74d1232@kontron.de>
In-Reply-To: <ace7d422-17de-49d8-dac0-a6e4d74d1232@kontron.de>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Tue, 11 Jul 2023 13:02:52 -0700
Message-ID: <CAJ+vNU3=AWYLdEom9SUMzQ7ccNa-kbMvW_wvAG1qeHehqoNb+w@mail.gmail.com>
Subject: Re: Capture image from imx219 sensor on i.MX8MM
To:     Frieder Schrempf <frieder.schrempf@kontron.de>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media <linux-media@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Javier Martinez Canillas <javierm@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jul 10, 2023 at 12:58=E2=80=AFAM Frieder Schrempf
<frieder.schrempf@kontron.de> wrote:
>
> Hi Tim,
>
> On 07.07.23 23:57, Tim Harvey wrote:
> [...]
> >
> > Frieder,
> >
> > Where did you end up with this? I have imx219 capture working on
> > imx8mm on a 5.15 kernel with lots of backports but have not managed to
> > repeat it on a 6.4 kernel. I don't run into the issue you are running
> > into (I have the imx-media device showing) but the media-ctl entities
> > have changed since my 5.15 kernel and I can't figure out how to link
> > them up and configure them with media-ctl.
> >
> > On my imx8mm-venice-gw72xx with imx8mm-venice-gw72xx-0x-imx219.dtso I s=
ee:
> > root@jammy-venice:~# cat /sys/bus/media/devices/media*/model
> > imx-media
> > hantro-vpu
> > hantro-vpu
> > root@jammy-venice:~# cat /sys/bus/media/devices/media0/model
> > imx-media
> > root@jammy-venice:~# media-ctl --device /dev/media0 -p
> > Media controller API version 6.4.0
> >
> > Media device information
> > ------------------------
> > driver          imx7-csi
> > model           imx-media
> > serial
> > bus info        platform:32e20000.csi
> > hw revision     0x0
> > driver version  6.4.0
> >
> > Device topology
> > - entity 1: csi (2 pads, 2 links)
> >             type V4L2 subdev subtype Unknown flags 0
> >             device node name /dev/v4l-subdev0
> >         pad0: Sink
> >                 [fmt:UYVY8_2X8/640x480 field:none colorspace:srgb
> > xfer:srgb ycbcr:601 quantization:lim-range]
> >                 <- "csis-32e30000.mipi-csi":1 [ENABLED,IMMUTABLE]
> >         pad1: Source
> >                 [fmt:UYVY8_2X8/640x480 field:none colorspace:srgb
> > xfer:srgb ycbcr:601 quantization:lim-range]
> >                 -> "csi capture":0 [ENABLED,IMMUTABLE]
> >
> > - entity 4: csi capture (1 pad, 1 link)
> >             type Node subtype V4L flags 0
> >             device node name /dev/video0
> >         pad0: Sink
> >                 <- "csi":1 [ENABLED,IMMUTABLE]
> >
> > - entity 10: csis-32e30000.mipi-csi (2 pads, 2 links)
> >              type V4L2 subdev subtype Unknown flags 0
> >              device node name /dev/v4l-subdev1
> >         pad0: Sink
> >                 [fmt:UYVY8_1X16/640x480 field:none
> > colorspace:smpte170m xfer:709 ycbcr:601 quantization:lim-range]
> >                 <- "imx219 2-0010":0 []
> >         pad1: Source
> >                 [fmt:UYVY8_1X16/640x480 field:none
> > colorspace:smpte170m xfer:709 ycbcr:601 quantization:lim-range]
> >                 -> "csi":0 [ENABLED,IMMUTABLE]
> >
> > - entity 15: imx219 2-0010 (1 pad, 1 link)
> >              type V4L2 subdev subtype Sensor flags 0
> >              device node name /dev/v4l-subdev2
> >         pad0: Source
> >                 [fmt:SRGGB10_1X10/3280x2464 field:none colorspace:srgb
> > xfer:srgb ycbcr:601 quantization:full-range
> >                  crop.bounds:(8,8)/3280x2464
> >                  crop:(8,8)/3280x2464]
> >                 -> "csis-32e30000.mipi-csi":0 []
> >
> > When I try to link and configure the pipeline I run into issues I
> > don't know how to resolve:
> > root@jammy-venice:~# media-ctl --device /dev/media0 --reset
> > root@jammy-venice:~# media-ctl --device /dev/media0 --links "'imx219
> > 2-0010':0->'csis-32e30000.mipi-csi.0':0[1]"
> > Unable to parse link: Invalid argument (22)
> > ^^^ not sure why I can't link imx219 source pad with mipi-csi sink pad
> >
> > What changed for me from my 5.15 kernel is the entities and pads
> > above. My 5.15 kernel looks like this:
> > root@jammy-venice:~# cat /sys/bus/media/devices/media2/model
> > imx-media
> > root@jammy-venice:~# media-ctl --device /dev/media2 -p
> > Media controller API version 5.15.15
> >
> > Media device information
> > ------------------------
> > driver          imx7-csi
> > model           imx-media
> > serial
> > bus info        platform:32e20000.csi
> > hw revision     0x0
> > driver version  5.15.15
> >
> > Device topology
> > - entity 1: csi (2 pads, 2 links)
> >             type V4L2 subdev subtype Unknown flags 0
> >             device node name /dev/v4l-subdev0
> >         pad0: Sink
> >                 [fmt:UYVY8_2X8/800x600 field:none colorspace:srgb
> > xfer:srgb ycbcr:601 quantization:lim-range]
> >                 <- "imx7-mipi-csis.0":1 [ENABLED,IMMUTABLE]
> >         pad1: Source
> >                 [fmt:UYVY8_2X8/800x600 field:none colorspace:srgb
> > xfer:srgb ycbcr:601 quantization:lim-range]
> >                 -> "csi capture":0 [ENABLED,IMMUTABLE]
> >
> > - entity 4: csi capture (1 pad, 1 link)
> >             type Node subtype V4L flags 0
> >             device node name /dev/video2
> >         pad0: Sink
> >                 <- "csi":1 [ENABLED,IMMUTABLE]
> >
> > - entity 10: imx7-mipi-csis.0 (2 pads, 2 links)
> >              type V4L2 subdev subtype Unknown flags 0
> >              device node name /dev/v4l-subdev1
> >         pad0: Sink
> >                 [fmt:UYVY8_1X16/640x480 field:none
> > colorspace:smpte170m xfer:709 ycbcr:601 quantization:lim-range]
> >                 <- "imx219 2-0010":0 []
> >         pad1: Source
> >                 [fmt:UYVY8_1X16/640x480 field:none
> > colorspace:smpte170m xfer:709 ycbcr:601 quantization:lim-range]
> >                 -> "csi":0 [ENABLED,IMMUTABLE]
> >
> > - entity 15: imx219 2-0010 (1 pad, 1 link)
> >              type V4L2 subdev subtype Sensor flags 0
> >              device node name /dev/v4l-subdev2
> >         pad0: Source
> >                 [fmt:SRGGB10_1X10/3280x2464 field:none colorspace:srgb
> > xfer:srgb ycbcr:601 quantization:full-range
> >                  crop.bounds:(8,8)/3280x2464
> >                  crop:(8,8)/3280x2464]
> >                 -> "imx7-mipi-csis.0":0 []
> > # configure media controller links
> > media-ctl --device /dev/media2 --reset
> > # link the imx219 source pad (0) to the imx7-mipi-csis sink pad (0)
> > media-ctl --device /dev/media2 --links "'imx219
> > 2-0010':0->'imx7-mipi-csis.0':0[1]"
> > # configure the imx219 source pad (0) for srgb 640x480
> > media-ctl --device /dev/media2 -v -V "'imx219 2-0010':0
> > [fmt:SRGGB8/640x480 field:none]"
> > # configure the csi sink pad (0) for srgb 640x480
> > media-ctl --device /dev/media2 -v -V "'csi':0 [fmt:SRGGB8/640x480 field=
:none]"
> > # stream 640x480@30fps
> > gst-launch-1.0 v4l2src device=3D/dev/video0 !
> > video/x-bayer,format=3Drggb,width=3D640,height=3D480,framerate=3D10/1 !
> > bayer2rgb ! fbdevsink # works
> >
> > Maybe you have gotten further than this by now?
> >
> > If you are still having issues getting imx-media to register we can
> > look at kernel configs. I believe the following are necessary:
> > CONFIG_VIDEO_IMX219=3Dy
> > CONFIG_VIDEO_IMX_MIPI_CSIS=3Dy
> > CONFIG_VIDEO_IMX7_CSI=3Dy
>
> I got this working back in February with Linux 6.2-rc8 and a few
> additional patches (see [1]), but I haven't tried this anymore since then=
.
>
> In my notes I have the following commands to test the camera:
>
> media-ctl -d /dev/media0 -l "'imx219 1-0010':0 ->
> 'csis-32e30000.mipi-csi':0[1]"

Hi Frieder,

Thank you - this helped me identify a typo in my link configuration.

My link configuration had an invalid argument in it which is why I was
getting the  invalid argument:
# media-ctl -l "'imx219 2-0010':0->'csis-32e30000.mipi-csi.0':0[1]"
Unable to parse link: Invalid argument (22)
^^^ the entity name does not include the .0 pad

I believe this is the correct setup for imx219 on 6.5-rc1 with imx219
for 640x480 raw8 bayer:
media-ctl -l "'imx219 2-0010':0 -> 'csis-32e30000.mipi-csi':0 [1]"
media-ctl -v -V "'imx219 2-0010':0 [fmt:SRGGB8/640x480 field:none]"
media-ctl -v -V "'csis-32e30000.mipi-csi':0 [fmt:SRGGB8/640x480 field:none]=
"
media-ctl -v -V "'csi':0 [fmt:SRGGB8/640x480 field:none]"

I still can't get this to stream via gstreamer however:
# gst-launch-1.0 v4l2src device=3D/dev/video0 !
video/x-bayer,format=3Drggb,width=3D640,height=3D480,framerate=3D10/1 !
bayer2rgb ! fbdevsink
Setting pipeline to PAUSED ...
Pipeline is live and does not need PREROLL ...
[  411.185357] imx7-csi 32e20000.csi: capture format not valid
Pipeline is PREROLLED ...
Setting pipeline to PLAYING ...
New clock: GstSystemClock
ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0: Failed
to allocate required memory.
Additional debug info:
../sys/v4l2/gstv4l2src.c(759): gst_v4l2src_decide_allocation ():
/GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
Buffer pool activation failed
Execution ended after 0:00:00.010357497
Setting pipeline to NULL ...
ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
Internal data stream error.
Additional debug info:
../libs/gst/base/gstbasesrc.c(3127): gst_base_src_loop ():
/GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
streaming stopped, reason not-negotiated (-4)
Freeing pipeline ...

I'm not sure if your notes show you how you captured/streamed data
after the linux media pipeline configuration?

best regards,

Tim







> media-ctl -d /dev/media0 -V '"imx219 1-0010":0[fmt:SRGGB8_1X8/1920x1080
> field:none]'
> media-ctl -d /dev/media0 -V
> '"csis-32e30000.mipi-csi":0[fmt:SRGGB8_1X8/1920x1080 field:none]'
> media-ctl -d /dev/media0 -V '"csi":0[fmt:SRGGB8_1X8/1920x1080 field:none]=
'
>
> v4l2-ctl -d /dev/video0
> --set-fmt-video=3Dwidth=3D1920,height=3D1080,pixelformat=3DRG10 --stream-=
mmap
>
> I currently don't have the time to look at this any closer, but maybe
> this already helps you in some way.
>
> Best regards
> Frieder
>
> [1]
> https://git.kontron-electronics.de/sw/misc/linux/-/commits/feature/v6.2-d=
ebug-csi
