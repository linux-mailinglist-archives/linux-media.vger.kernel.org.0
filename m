Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BEEB752E00
	for <lists+linux-media@lfdr.de>; Fri, 14 Jul 2023 01:37:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230024AbjGMXhs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jul 2023 19:37:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbjGMXhr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jul 2023 19:37:47 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22BBA269D
        for <linux-media@vger.kernel.org>; Thu, 13 Jul 2023 16:37:45 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-991ef0b464cso540830066b.0
        for <linux-media@vger.kernel.org>; Thu, 13 Jul 2023 16:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20221208.gappssmtp.com; s=20221208; t=1689291463; x=1691883463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jhKDbP/jy9UhSSa/ASaCo5ovhqUgbeQpK1EpDxFRpA4=;
        b=zGctpFy563+REvTZGlSErKtQO5IGx+vu3ictmx82qxehcdhWeNflvBZGLURQCEb2ca
         f03vOoN3xaa+B04VfmBQ8CBcunUISW2DB0CTY/GS3wb1EkbFONviPcEY5DVMbckPBLTR
         uianZVmiyfAYpOv+CMDSEEbRMIbEuyIB+SVnRAsUjJZ0ZbQt+sSpdEIQgqJnldGKNhc0
         cT2oozdQySm9oOMECU/5v0gYUzpqARyMVdj/FG9U6zL3cgjdUb2p6KRc5D7AfukXeYKa
         ycvG6wc8rshn6BCsA+rzCjDWGllUknp9+f2gSGGTrxBPVc1m54rxnPt6P1CLS8J7JD0v
         fkYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689291463; x=1691883463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jhKDbP/jy9UhSSa/ASaCo5ovhqUgbeQpK1EpDxFRpA4=;
        b=lFqs+D0evQOISUY20UrjgKwRs+s8RBDQLxFYTtVHzrJrHMpGmgo6BkNwAGFnjkeTSC
         x1e2uVQpgv605gWYLsLQ/5RCjofKK6YxfHxEI545Hcqtlj6zFXKCwFMlCWHv7YRUu0iQ
         kSNIjd5bSDZbwi8071wpvFpNYm0YxtlQYxjeObTMDyhgXwk2pJDTupXjySHYtvkLn3TW
         qFRbw40Qo0qb5cfW4nGhrNSVr79pvDpJOR5m3fhvZ5BNo7/T+Nz7n0rZO3VpDji9czDk
         CysomqeZuQsjqbToLNXued7Cu3D4A7h0qG11KftmUvlts6brXv6MHr5HV5mqCeGTySBa
         uvpQ==
X-Gm-Message-State: ABy/qLY6NFhRMCjQNZPeZAshkBYYbdxbdWmR6glGz2dFSeqOOSYnpC8j
        mBU9XHU16vbUSs4CW28uxwiT5OIEwS9991A9A6CCit/xniYuEcBCO24=
X-Google-Smtp-Source: APBJJlHFKZMYcmRKqEg1BYPEBvnuQ1vIAzZ2/Yp9bKgZwziTV5VAQ3CV/MSGxqAJKKxB3VOYd5WG5hLh/aSUB584NHI=
X-Received: by 2002:a17:907:72c5:b0:986:38ab:ef99 with SMTP id
 du5-20020a17090772c500b0098638abef99mr1430455ejc.9.1689291463353; Thu, 13 Jul
 2023 16:37:43 -0700 (PDT)
MIME-Version: 1.0
References: <9aabef0e-9f48-f8bd-ab7c-e51ac2685116@kontron.de>
 <Y+EdT3uRzmjrxe6r@pendragon.ideasonboard.com> <8965ad7f-0683-81af-2bfd-e6a0a173c95e@kontron.de>
 <Y+EhsjtL5DYBie9u@pendragon.ideasonboard.com> <049f2fea-1725-74d9-d20d-fc4f7506d504@kontron.de>
 <Y+Vxg1lt0aIDRGIR@pendragon.ideasonboard.com> <d275e830-5960-0910-ca34-1b990971cea3@kontron.de>
 <Y+toAcOYNFbbvpPj@pendragon.ideasonboard.com> <07ceda76-3b3e-10d3-ecd3-e9fb2669445f@kontron.de>
 <12ad73f5-ea42-946b-5c89-5b6a07153006@kontron.de> <CAJ+vNU2R7DKoUcebKBC9Y74v_6FEXAGK=8mYD-CpqRypVdnXfw@mail.gmail.com>
 <ace7d422-17de-49d8-dac0-a6e4d74d1232@kontron.de> <CAJ+vNU3=AWYLdEom9SUMzQ7ccNa-kbMvW_wvAG1qeHehqoNb+w@mail.gmail.com>
 <b2d91ede-e834-1b78-78a5-00fbefb09d37@kontron.de>
In-Reply-To: <b2d91ede-e834-1b78-78a5-00fbefb09d37@kontron.de>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Thu, 13 Jul 2023 16:37:31 -0700
Message-ID: <CAJ+vNU3kpKP9baZaOOSJYOPH7ENWCy6qs0ms=dJyhE75tEyFrQ@mail.gmail.com>
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
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jul 11, 2023 at 11:27=E2=80=AFPM Frieder Schrempf
<frieder.schrempf@kontron.de> wrote:
>
> Hi Tim,
>
> On 11.07.23 22:02, Tim Harvey wrote:
> > On Mon, Jul 10, 2023 at 12:58=E2=80=AFAM Frieder Schrempf
> > <frieder.schrempf@kontron.de> wrote:
> >>
> >> Hi Tim,
> >>
> >> On 07.07.23 23:57, Tim Harvey wrote:
> >> [...]
> >>>
> >>> Frieder,
> >>>
> >>> Where did you end up with this? I have imx219 capture working on
> >>> imx8mm on a 5.15 kernel with lots of backports but have not managed t=
o
> >>> repeat it on a 6.4 kernel. I don't run into the issue you are running
> >>> into (I have the imx-media device showing) but the media-ctl entities
> >>> have changed since my 5.15 kernel and I can't figure out how to link
> >>> them up and configure them with media-ctl.
> >>>
> >>> On my imx8mm-venice-gw72xx with imx8mm-venice-gw72xx-0x-imx219.dtso I=
 see:
> >>> root@jammy-venice:~# cat /sys/bus/media/devices/media*/model
> >>> imx-media
> >>> hantro-vpu
> >>> hantro-vpu
> >>> root@jammy-venice:~# cat /sys/bus/media/devices/media0/model
> >>> imx-media
> >>> root@jammy-venice:~# media-ctl --device /dev/media0 -p
> >>> Media controller API version 6.4.0
> >>>
> >>> Media device information
> >>> ------------------------
> >>> driver          imx7-csi
> >>> model           imx-media
> >>> serial
> >>> bus info        platform:32e20000.csi
> >>> hw revision     0x0
> >>> driver version  6.4.0
> >>>
> >>> Device topology
> >>> - entity 1: csi (2 pads, 2 links)
> >>>             type V4L2 subdev subtype Unknown flags 0
> >>>             device node name /dev/v4l-subdev0
> >>>         pad0: Sink
> >>>                 [fmt:UYVY8_2X8/640x480 field:none colorspace:srgb
> >>> xfer:srgb ycbcr:601 quantization:lim-range]
> >>>                 <- "csis-32e30000.mipi-csi":1 [ENABLED,IMMUTABLE]
> >>>         pad1: Source
> >>>                 [fmt:UYVY8_2X8/640x480 field:none colorspace:srgb
> >>> xfer:srgb ycbcr:601 quantization:lim-range]
> >>>                 -> "csi capture":0 [ENABLED,IMMUTABLE]
> >>>
> >>> - entity 4: csi capture (1 pad, 1 link)
> >>>             type Node subtype V4L flags 0
> >>>             device node name /dev/video0
> >>>         pad0: Sink
> >>>                 <- "csi":1 [ENABLED,IMMUTABLE]
> >>>
> >>> - entity 10: csis-32e30000.mipi-csi (2 pads, 2 links)
> >>>              type V4L2 subdev subtype Unknown flags 0
> >>>              device node name /dev/v4l-subdev1
> >>>         pad0: Sink
> >>>                 [fmt:UYVY8_1X16/640x480 field:none
> >>> colorspace:smpte170m xfer:709 ycbcr:601 quantization:lim-range]
> >>>                 <- "imx219 2-0010":0 []
> >>>         pad1: Source
> >>>                 [fmt:UYVY8_1X16/640x480 field:none
> >>> colorspace:smpte170m xfer:709 ycbcr:601 quantization:lim-range]
> >>>                 -> "csi":0 [ENABLED,IMMUTABLE]
> >>>
> >>> - entity 15: imx219 2-0010 (1 pad, 1 link)
> >>>              type V4L2 subdev subtype Sensor flags 0
> >>>              device node name /dev/v4l-subdev2
> >>>         pad0: Source
> >>>                 [fmt:SRGGB10_1X10/3280x2464 field:none colorspace:srg=
b
> >>> xfer:srgb ycbcr:601 quantization:full-range
> >>>                  crop.bounds:(8,8)/3280x2464
> >>>                  crop:(8,8)/3280x2464]
> >>>                 -> "csis-32e30000.mipi-csi":0 []
> >>>
> >>> When I try to link and configure the pipeline I run into issues I
> >>> don't know how to resolve:
> >>> root@jammy-venice:~# media-ctl --device /dev/media0 --reset
> >>> root@jammy-venice:~# media-ctl --device /dev/media0 --links "'imx219
> >>> 2-0010':0->'csis-32e30000.mipi-csi.0':0[1]"
> >>> Unable to parse link: Invalid argument (22)
> >>> ^^^ not sure why I can't link imx219 source pad with mipi-csi sink pa=
d
> >>>
> >>> What changed for me from my 5.15 kernel is the entities and pads
> >>> above. My 5.15 kernel looks like this:
> >>> root@jammy-venice:~# cat /sys/bus/media/devices/media2/model
> >>> imx-media
> >>> root@jammy-venice:~# media-ctl --device /dev/media2 -p
> >>> Media controller API version 5.15.15
> >>>
> >>> Media device information
> >>> ------------------------
> >>> driver          imx7-csi
> >>> model           imx-media
> >>> serial
> >>> bus info        platform:32e20000.csi
> >>> hw revision     0x0
> >>> driver version  5.15.15
> >>>
> >>> Device topology
> >>> - entity 1: csi (2 pads, 2 links)
> >>>             type V4L2 subdev subtype Unknown flags 0
> >>>             device node name /dev/v4l-subdev0
> >>>         pad0: Sink
> >>>                 [fmt:UYVY8_2X8/800x600 field:none colorspace:srgb
> >>> xfer:srgb ycbcr:601 quantization:lim-range]
> >>>                 <- "imx7-mipi-csis.0":1 [ENABLED,IMMUTABLE]
> >>>         pad1: Source
> >>>                 [fmt:UYVY8_2X8/800x600 field:none colorspace:srgb
> >>> xfer:srgb ycbcr:601 quantization:lim-range]
> >>>                 -> "csi capture":0 [ENABLED,IMMUTABLE]
> >>>
> >>> - entity 4: csi capture (1 pad, 1 link)
> >>>             type Node subtype V4L flags 0
> >>>             device node name /dev/video2
> >>>         pad0: Sink
> >>>                 <- "csi":1 [ENABLED,IMMUTABLE]
> >>>
> >>> - entity 10: imx7-mipi-csis.0 (2 pads, 2 links)
> >>>              type V4L2 subdev subtype Unknown flags 0
> >>>              device node name /dev/v4l-subdev1
> >>>         pad0: Sink
> >>>                 [fmt:UYVY8_1X16/640x480 field:none
> >>> colorspace:smpte170m xfer:709 ycbcr:601 quantization:lim-range]
> >>>                 <- "imx219 2-0010":0 []
> >>>         pad1: Source
> >>>                 [fmt:UYVY8_1X16/640x480 field:none
> >>> colorspace:smpte170m xfer:709 ycbcr:601 quantization:lim-range]
> >>>                 -> "csi":0 [ENABLED,IMMUTABLE]
> >>>
> >>> - entity 15: imx219 2-0010 (1 pad, 1 link)
> >>>              type V4L2 subdev subtype Sensor flags 0
> >>>              device node name /dev/v4l-subdev2
> >>>         pad0: Source
> >>>                 [fmt:SRGGB10_1X10/3280x2464 field:none colorspace:srg=
b
> >>> xfer:srgb ycbcr:601 quantization:full-range
> >>>                  crop.bounds:(8,8)/3280x2464
> >>>                  crop:(8,8)/3280x2464]
> >>>                 -> "imx7-mipi-csis.0":0 []
> >>> # configure media controller links
> >>> media-ctl --device /dev/media2 --reset
> >>> # link the imx219 source pad (0) to the imx7-mipi-csis sink pad (0)
> >>> media-ctl --device /dev/media2 --links "'imx219
> >>> 2-0010':0->'imx7-mipi-csis.0':0[1]"
> >>> # configure the imx219 source pad (0) for srgb 640x480
> >>> media-ctl --device /dev/media2 -v -V "'imx219 2-0010':0
> >>> [fmt:SRGGB8/640x480 field:none]"
> >>> # configure the csi sink pad (0) for srgb 640x480
> >>> media-ctl --device /dev/media2 -v -V "'csi':0 [fmt:SRGGB8/640x480 fie=
ld:none]"
> >>> # stream 640x480@30fps
> >>> gst-launch-1.0 v4l2src device=3D/dev/video0 !
> >>> video/x-bayer,format=3Drggb,width=3D640,height=3D480,framerate=3D10/1=
 !
> >>> bayer2rgb ! fbdevsink # works
> >>>
> >>> Maybe you have gotten further than this by now?
> >>>
> >>> If you are still having issues getting imx-media to register we can
> >>> look at kernel configs. I believe the following are necessary:
> >>> CONFIG_VIDEO_IMX219=3Dy
> >>> CONFIG_VIDEO_IMX_MIPI_CSIS=3Dy
> >>> CONFIG_VIDEO_IMX7_CSI=3Dy
> >>
> >> I got this working back in February with Linux 6.2-rc8 and a few
> >> additional patches (see [1]), but I haven't tried this anymore since t=
hen.
> >>
> >> In my notes I have the following commands to test the camera:
> >>
> >> media-ctl -d /dev/media0 -l "'imx219 1-0010':0 ->
> >> 'csis-32e30000.mipi-csi':0[1]"
> >
> > Hi Frieder,
> >
> > Thank you - this helped me identify a typo in my link configuration.
> >
> > My link configuration had an invalid argument in it which is why I was
> > getting the  invalid argument:
> > # media-ctl -l "'imx219 2-0010':0->'csis-32e30000.mipi-csi.0':0[1]"
> > Unable to parse link: Invalid argument (22)
> > ^^^ the entity name does not include the .0 pad
> >
> > I believe this is the correct setup for imx219 on 6.5-rc1 with imx219
> > for 640x480 raw8 bayer:
> > media-ctl -l "'imx219 2-0010':0 -> 'csis-32e30000.mipi-csi':0 [1]"
> > media-ctl -v -V "'imx219 2-0010':0 [fmt:SRGGB8/640x480 field:none]"
> > media-ctl -v -V "'csis-32e30000.mipi-csi':0 [fmt:SRGGB8/640x480 field:n=
one]"
> > media-ctl -v -V "'csi':0 [fmt:SRGGB8/640x480 field:none]"
> >
> > I still can't get this to stream via gstreamer however:
> > # gst-launch-1.0 v4l2src device=3D/dev/video0 !
> > video/x-bayer,format=3Drggb,width=3D640,height=3D480,framerate=3D10/1 !
> > bayer2rgb ! fbdevsink
> > Setting pipeline to PAUSED ...
> > Pipeline is live and does not need PREROLL ...
> > [  411.185357] imx7-csi 32e20000.csi: capture format not valid
> > Pipeline is PREROLLED ...
> > Setting pipeline to PLAYING ...
> > New clock: GstSystemClock
> > ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0: Failed
> > to allocate required memory.
> > Additional debug info:
> > ../sys/v4l2/gstv4l2src.c(759): gst_v4l2src_decide_allocation ():
> > /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
> > Buffer pool activation failed
> > Execution ended after 0:00:00.010357497
> > Setting pipeline to NULL ...
> > ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
> > Internal data stream error.
> > Additional debug info:
> > ../libs/gst/base/gstbasesrc.c(3127): gst_base_src_loop ():
> > /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
> > streaming stopped, reason not-negotiated (-4)
> > Freeing pipeline ...
> >
> > I'm not sure if your notes show you how you captured/streamed data
> > after the linux media pipeline configuration?
>
> I have the following gstreamer commands in my notes I used for streaming
> the raw data to a host machine via network and viewing it remotely:
>
> Host:
>
> gst-launch-1.0 udpsrc port=3D5000 ! application/x-rtp,encoding-name=3DX-G=
ST
> ! queue ! rtpgstdepay ! bayer2rgb ! videoconvert ! autovideosink
>
> Client:
>
> gst-launch-1.0 v4l2src device=3D/dev/video0 !
> 'video/x-bayer,format=3Drggb,width=3D1920,height=3D1080' ! rtpgstpay ! qu=
eue !
> udpsink host=3D192.168.1.10 port=3D5000
>
> But as you are getting "imx7-csi 32e20000.csi: capture format not
> valid", I would assume that there is something wrong with the format and
> your gstreamer pipeline might be correct in general.
>
> In contrast to my setup you are using fmt:SRGGB8 instead of
> fmt:SRGGB8_1X8. No idea if this makes any difference...
>
> Does streaming with v4l2-ctl work for you without errors? I used the
> following for testing:
>
> v4l2-ctl -d /dev/video0
> --set-fmt-video=3Dwidth=3D1920,height=3D1080,pixelformat=3DRG10 --stream-=
mmap
>
> Best regards
> Frieder

Frieder,

The issue I seem to be running into is that when I configure the media
pipeline for 640x480 v4l2 seems to think this is 768x480 (which it did
not do in my previous 5.15 kernel):
# media-ctl --reset
# media-ctl -l "'imx219 2-0010':0 -> 'csis-32e30000.mipi-csi':0 [1]"
# media-ctl -v -V "'imx219 2-0010':0 [fmt:SRGGB8/640x480 field:none]"
Opening media device /dev/media0
Enumerating entities
looking up device: 81:3
looking up device: 81:0
looking up device: 81:4
looking up device: 81:5
Found 4 entities
Enumerating pads and links
Setting up format SRGGB8_1X8 640x480 on pad imx219 2-0010/0
Format set: SRGGB8_1X8 640x480
Setting up format SRGGB8_1X8 640x480 on pad csis-32e30000.mipi-csi/0
Format set: SRGGB8_1X8 640x480
# media-ctl -v -V "'csis-32e30000.mipi-csi':0 [fmt:SRGGB8/640x480 field:non=
e]"
Opening media device /dev/media0
Enumerating entities
looking up device: 81:3
looking up device: 81:0
looking up device: 81:4
looking up device: 81:5
Found 4 entities
Enumerating pads and links
Setting up format SRGGB8_1X8 640x480 on pad csis-32e30000.mipi-csi/0
Format set: SRGGB8_1X8 640x480
# media-ctl -v -V "'csi':0 [fmt:SRGGB8/640x480 field:none]"
Opening media device /dev/media0
Enumerating entities
looking up device: 81:3
looking up device: 81:0
looking up device: 81:4
looking up device: 81:5
Found 4 entities
Enumerating pads and links
Setting up format SRGGB8_1X8 640x480 on pad csi/0
Format set: SRGGB8_1X8 640x480
# v4l2-ctl -d /dev/video0
--set-fmt-video=3Dwidth=3D640,height=3D480,pixelformat=3DRGGB --verbose
VIDIOC_QUERYCAP: ok
VIDIOC_G_FMT: ok
VIDIOC_S_FMT: ok
Format Video Capture:
        Width/Height      : 768/480
        Pixel Format      : 'RGGB' (8-bit Bayer RGRG/GBGB)
        Field             : None
        Bytes per Line    : 768
        Size Image        : 368640
        Colorspace        : Default
        Transfer Function : Default (maps to Rec. 709)
        YCbCr/HSV Encoding: Default (maps to ITU-R 601)
        Quantization      : Default (maps to Full Range)
        Flags             :
^^^ not the 640/480 I asked for
# v4l2-ctl --device /dev/video0 --stream-mmap --stream-to=3Dframe.raw
--stream-count=3D1 # captures 368640 bytes (768*480) not 307200
(640*480)
^^^ produces a corrupt frame
# gst-launch-1.0 v4l2src device=3D/dev/video0 !
video/x-bayer,format=3Drggb,width=3D640,height=3D480,framerate=3D10/1 !
bayer2rgb ! fbdevsink
Setting pipeline to PAUSED ...
Pipeline is live and does not need PREROLL ...
Pipeline is PREROLLED ...
Setting pipeline to PLAYING ...
New clock: GstSystemClock

(gst-launch-1.0:1259): GStreamer-Base-WARNING **: 00:05:54.687:
bayer2rgb0: size 368640 is not a multi\ple of unit size 307200
^^^ error due to unexpected frame size
ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
Internal data stream error.
Additional debug info:
../libs/gst/base/gstbasesrc.c(3127): gst_base_src_loop ():
/GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
streaming stopped, reason error (-5)
Execution ended after 0:00:00.098746098
Setting pipeline to NULL ...
Freeing pipeline ...

# gst-launch-1.0 v4l2src device=3D/dev/video0 !
video/x-bayer,format=3Drggb,width=3D768,height=3D480,framerate=3D10/1 !
bayer2rgb ! fbdevsink
Setting pipeline to PAUSED ...
Pipeline is live and does not need PREROLL ...
[ 1900.489707] imx7-csi 32e20000.csi: capture format not valid
^^^ error due to 768x480 not matching Linux media entity format
Pipeline is PREROLLED ...
Setting pipeline to PLAYING ...
New clock: GstSystemClock
ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0: Failed
to allocate required memory.
Additional debug info:
../sys/v4l2/gstv4l2src.c(759): gst_v4l2src_decide_allocation ():
/GstPipeline:pipeline0/GstV4l2Src:v4l
2src0:
Buffer pool activation failed
Execution ended after 0:00:00.010353615
Setting pipeline to NULL ...
ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
Internal data stream error.
Additional debug info:
../libs/gst/base/gstbasesrc.c(3127): gst_base_src_loop ():
/GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
streaming stopped, reason not-negotiated (-4)
Freeing pipeline ...

It doesn't look like there is any difference between SRGGB8_1X8 and
SRGGB8 when setting up the link configurations as a '-v' shows
SRGGB8_1X8 always and I've tried both. I see the same issue if I try
1920x1080 raw8 where there is a pixel size format but if I use raw10
like you were doing I don't get a resolution mismatch thus gstreamer
to stream via rtp (like you were doing) it will stream but the image
rolls like its not in sync. If I use gstreamer to bayer2rgb with raw10
it complains about the framesize. I'm not sure how to configure
gstreamer for raw10 bayer vs raw8 bayer.

Whatever I'm running into it does not occur on the imx8mp with the
same camera and 640x480 raw8 and I've proved it has nothing to do with
changes to the imx219 driver so whatever it is it must have to do with
the imx8mm mipi end. I'll start trying to figure out what kernel
version affected this.

If you do find any time to test 640x480 raw8 on a modern kernel let me
know what you find.

best regards,

Tim
