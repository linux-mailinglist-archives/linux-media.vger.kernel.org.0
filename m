Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06DDF691C6C
	for <lists+linux-media@lfdr.de>; Fri, 10 Feb 2023 11:12:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231411AbjBJKMU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Feb 2023 05:12:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231402AbjBJKMT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Feb 2023 05:12:19 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9251360303
        for <linux-media@vger.kernel.org>; Fri, 10 Feb 2023 02:12:17 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 19AC7E70;
        Fri, 10 Feb 2023 11:12:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676023935;
        bh=l65XBmq5jNPaHlcbEl5QmgO1Z5CHHqFX7ZAHuNtG4AA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lJgYalbLHxa4vjj4yxMzV0FaI/UCXUyvBgqDkYK6CTfzVQXhcFbKM/JwOSj6ORXPO
         mdGkOkFrx7njwl5OjgrEjIfMKJdIZ2Me83u7Xw1i3jrUCnJ9dPGLfNfe21pTjughoz
         OOiblREncPYkb+miOtWOfPs559IAVdC1cgCFkLvQ=
Date:   Fri, 10 Feb 2023 12:12:13 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Andrew Randrianasulu <randrianasulu@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [Cin] 10-bit 422 Video capture not part of the UVC spec?
Message-ID: <Y+YYfRZYLXb4W69W@pendragon.ideasonboard.com>
References: <38a3f4d3-c9a1-4712-1d1c-9993186cc278@gmail.com>
 <CA+rFky59ERaG8S=U--4z3-obubxx62o_AEFvT0qzesuQVeDE3w@mail.gmail.com>
 <CA+rFky7ua8sdiUt6S-RzexjXnZ50TX=8--Y5kJZPk1jNzeX7bA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+rFky7ua8sdiUt6S-RzexjXnZ50TX=8--Y5kJZPk1jNzeX7bA@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Andrew,

(CC'ing the linux-media mailing list, as the discussion you've forwarded
already occured on a public list I assume that's not an issue)

пт, 10 февр. 2023 г., 06:03, Andrew Randrianasulu:
> пт, 10 февр. 2023 г., 04:37 Terje J. Hanssen via Cin <cin@lists.cinelerra-gg.org>:
> 
> > We have some threads this month discussing the performance of UVC
> > HDMI-USB3 Vide Capture stics/dongles or devices.
> > If technical specs are available, sadly often deficient, they may manage
> > 422 chroma subsampling, but limited to 8-bit "Deep color" (4KVC00) or
> > "YUY2" (ms2130)
> >
> > 1. To repeate the illustrative article 8-Bit vs 10-Bit Video Color
> > Explained (millions/banding vs billion shades):
> >
> > https://fujifilm-x.com/en-us/series/the-filmmakers-handbook/8-bit-or-10-bit-video-color-explained/
> >
> >
> > 2. In a couple of learn.microsoft articles, 10- and 16-bit YUV Video
> > Formats are recommended for capturing, processing, and displaying video,
> > while 8-bit YUV color formats that are recommended for video rendering. To
> > extract and learn the most relevant YUV formats in this context from the
> > table
> >
> > https://learn.microsoft.com/en-us/windows/win32/medfound/10-bit-and-16-bit-yuv-video-formats#preferred-yuv-formats
> >
> > YUY2     4:2:2     Packed     8 bits pr channel
> > Y210     4:2:2     Packed     10
> > NV12     4:2:0     Planar     8
> > P010     4:2:0     Planar     10
> >
> > 3. So I found an interesting discussion on the Digital Photography Review
> > forum:
> > Cheapest (and decent) way to record 10 bits HDMI on Windows?
> > https://www.dpreview.com/forums/thread/4562209
> >
> > Extract here an interesting section from the first reply of Mar 19, 2021:
> >
> > It almost looks like 10-bit may not be part of the UVC specs unless the
> > device does hardware H.264 or HEVC decoding, there are no 10-bit color
> > formats that appear in
> > https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/media/usb/uvc/uvcvideo.h?h=v5.11.7
> > such as p010, and I would expect that if the UVC spec supported p010 video
> > it would have appeared in the Linux kernel by now.
>
> Isn't such question more for Maintainer?
> 
> "USB VIDEO CLASS
> 
> M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> L:	linux-media@vger.kernel.org
> S:	Maintained
> W:	http://www.ideasonboard.org/uvc/
> T:	git git://linuxtv.org/media_tree.git
> F:	drivers/media/usb/uvc/
> F:	include/uapi/linux/uvcvideo.h
> 
> "
> 
> from
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/MAINTAINERS
> 
> I looked at (hopefully) uvc spec, but mostly for interlace info
> 
> https://www.spinelelectronics.com/pdf/UVC%25201.5%2520Class%2520specification.pdf
> 
> I'll look for guid info some more..

The UVC specification standardizes very few pixel formats, but allows
for devices to expose additional frame-based formats. In practice
devices use the same GUIDs as Windows in that case, and the uvcvideo
driver supports many of those already. See include/media/v4l2-uvc.h in
the latest mainline kernel for a list. This could easily be extended
with 10-bit YUV formats.

> > If someone can confirm this is the case also today, we don't need to search
> > for cheap or inexpensive HDMI-USB3 Video capture stick/dongles with 10-bit
> > 422 output support.
> > Down In the same thread also some high-priced UVC compliant devices are
> > mentioned, but they tend to support 10-bit on HDMI input and so downscale
> > it to 8-bit on USB3 output.
> 
> Apparently hacked Cx driver can output 16 bits as ADC, but then we have
> question of feeding it with good enough signal (vhs-decode just vampires
> into VCR guts.)
> 
> Is any real external vhs (ish) sources worth 10 bits path?
> 
> https://github.com/happycube/cxadc-linux3
> 
> ===
> 
> cxadc is an alternative Linux driver for the Conexant CX2388x series of
> video decoder/encoder chips used on many PCI TV tuner and capture cards.
> 
> *Note!* cx23885 and cx23888 are incompatible chips.
> 
> The new driver configures the CX2388x to capture in its raw output mode in
> 8-bit or 16-bit unsigned samples from the video input ports, allowing these
> cards to be used as a low-cost 28-54Mhz 10bit ADC for SDR and similar
> applications.
> 
> ====
> 
> vhs-decode wiki has some ffmpeg command encoding raw captures  into prores
> 10bit file
> 
> https://github.com/oyvindln/vhs-decode
> 
> ===
> 
> VHS-Decode produces two timebase corrected 16-bit GREY16 headerless files
> separated into chroma/luma composite video signals in the .tbc format
> alongside .json and .log files, usable with the LD-Decode family of tools
> ld-analyse, ld-process-vbi, ld-process-vits and ld-dropout-correct.
> 
> The gen chroma scrips will use decoded .tbc files and generate standard
> video files by default a lossless, interlaced top field first and
> high-bitrate (roughly 70-100 Mb/s) FFV1 codec video which, which although
> ideal for archival and further processing.
> 
> 
> For editing due to lack of support of FFV1 and sharing online without
> de-interlacing is not supported properly, as such the two commands are
> provided below to make suitable files for this use.
> 
> Both commands will automatically use the last file generated as the input.
> 
> For editors this transcodes an FFV1/V210 output to a "*near complient*"
> interlaced ProRes HQ file:
> 
> ffmpeg -hide_banner -i "$1.mkv" -vf setfield=tff -flags +ilme+ildct
> -c:v prores -profile:v 3 -vendor apl0 -bits_per_mb 8000 -quant_mat hq
> -mbs_per_slice 8 -pixel_format yuv422p10lep -color_range tv
> -color_primaries bt709 -color_trc bt709 -colorspace bt709 -c:a s24le
> -vf setdar=4/3,setfield=tff "$1_ProResHQ.mov"
> 
> For basic online sharing you can use this command to convert the FFV1
> output to a de-interlaced lossy upscaled MP4:
> 
> ffmpeg -hide_banner -i "$1.mkv" -vf
> scale=in_color_matrix=bt601:out_color_matrix=bt709:1440x1080,bwdif=1:0:0
> -c:v libx264 -preset veryslow -b:v 15M -maxrate 15M -bufsize 8M
> -pixel_format yuv420p -color_primaries bt709 -color_trc bt709
> -colorspace bt709 -aspect 4:3 -c:a libopus -b:a 192k -strict -2
> -movflags +faststart -y "$1_1440x1080_lossy.mp4"
> 
> ====
> 
> Maaay be we still can use pci-e capture card with normal inputs, just
> process raw captures to see if there any difference between 8 and 10 bit?

-- 
Regards,

Laurent Pinchart
