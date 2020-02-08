Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28B241567C1
	for <lists+linux-media@lfdr.de>; Sat,  8 Feb 2020 22:09:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727502AbgBHVIv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 8 Feb 2020 16:08:51 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:34669 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727473AbgBHVIu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 8 Feb 2020 16:08:50 -0500
Received: by mail-qk1-f196.google.com with SMTP id a23so2801077qka.1
        for <linux-media@vger.kernel.org>; Sat, 08 Feb 2020 13:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=4TY1+nD/Xxavs25B9LhIJkY+tQlgY/tj/lv/9jhcoaY=;
        b=H7spoOa09kGORebS1yKVMWsB7vqpnYs88wQeWyl5MHPmFzFvTX33JJxIuq7ASVRcAJ
         YGdx9BxJ3CSffJWPcmSWoygtc5OqT2kzdyC003xNn6UX1FJ08aqs6YG12xphePabZ/7F
         rkguP6SNRkoLD2n2L7yucaCbR0IrB5vUdn8n/ko0Lvk1GyOBjAFIIsGmxsBQgah41oxF
         C6V0owcgan5h8zuZ/S83lpFeYYgnqPrwGtY9cz8zMhz1wPxhFZtThwK5a10z0hQtX351
         eM2lBWXWN+Zil/w6v11wS9XvmOY6K8vKRM+NFVqEPkyZsbhVyxSINjcfFYy5MkhrYTsY
         mJRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=4TY1+nD/Xxavs25B9LhIJkY+tQlgY/tj/lv/9jhcoaY=;
        b=TRcS9YsRQYJebm6J/Zq2ZVt4TXpmHwWBDSP4BMta+ZMk81t96w3nN2CgGJ0nP+99vQ
         4UUx0c69jqOxS+zv5CR31q9AWHUfOVBAE6zmYkd5ou/NIrf7SNZjBrxTI8g4QgBHvb03
         E+9t8iF3sXfBVfPGTvMsrYoUpJwUKvyFau72qggkQ4DUn1TX4AECxCQN0zPG/MLaIaMr
         sdhn1zDy4Gtetviic1NSuZ/YrBsM9HBpav5j9aHHaTmiSCWN4F/8vOOb+1aMLtuMR0DL
         bJQD+aUnSRetOXhbtgk8xf+uDjaaP4mlTYBtwCHisoKBiT+3aB6jfpkEdsc19hO5LoMN
         snUQ==
X-Gm-Message-State: APjAAAVINnaqLy5KFwLzpAe/5sVmmI9BIBWayipoWZd6SO9DQao4+fjQ
        s9hXXiKKFTcXo+GKNawbrDjNhA==
X-Google-Smtp-Source: APXvYqwWkfWk4sB3xg3WrJDrf8pHTVkjL2/7y3rcmxGh93cpwyc1cOoPaxMTB1cUVBEDUYNjOkLf7A==
X-Received: by 2002:ae9:e305:: with SMTP id v5mr4782792qkf.143.1581196129000;
        Sat, 08 Feb 2020 13:08:49 -0800 (PST)
Received: from skullcanyon ([192.222.193.21])
        by smtp.gmail.com with ESMTPSA id k15sm3272253qkk.103.2020.02.08.13.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2020 13:08:47 -0800 (PST)
Message-ID: <cc8defafcf4849f48786c41d94c4e44414903fac.camel@ndufresne.ca>
Subject: Re: [PATCH v4 0/4] media: meson: vdec: Add compliant H264 support
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Neil Armstrong <narmstrong@baylibre.com>, mchehab@kernel.org,
        hans.verkuil@cisco.com
Cc:     linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date:   Sat, 08 Feb 2020 16:08:46 -0500
In-Reply-To: <f3d8eac3-73cb-75ad-3412-212b229f1654@baylibre.com>
References: <20200116133025.1903-1-narmstrong@baylibre.com>
         <371bccfa68c4a9924137f087ef45c732e64bf808.camel@ndufresne.ca>
         <970b4e5b89db7f055217676a07281e37f6dcd35a.camel@ndufresne.ca>
         <f3d8eac3-73cb-75ad-3412-212b229f1654@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le jeudi 06 février 2020 à 08:57 +0100, Neil Armstrong a écrit :
> Hi Nico,
> 
> On 01/02/2020 16:38, Nicolas Dufresne wrote:
> > Le samedi 01 février 2020 à 10:34 -0500, Nicolas Dufresne a écrit :
> > > Le jeudi 16 janvier 2020 à 14:30 +0100, Neil Armstrong a écrit :
> > > > Hello,
> > > > 
> > > > This patch series aims to bring H.264 support as well as compliance update
> > > > to the amlogic stateful video decoder driver.
> > > > 
> > > > The issue in the V1 patchset at [1] is solved by patch #1 following comments
> > > > and requirements from hans. It moves the full draining & stopped state tracking
> > > > and handling from vicodec to core v4l2-mem2mem.
> > > > 
> > > > The vicodec changes still passes the v4l2-utils "media-test" tests, log at [5]:
> > > > [...]
> > > > vicodec media controller compliance tests
> > > > 
> > > > Thu Jan 16 13:00:56 UTC 2020
> > > > v4l2-compliance SHA: 7ead0e1856b89f2e19369af452bb03fd0cd16793, 64 bits
> > > > [...]
> > > > Summary:
> > > 
> > > I've minimally tested this serie with GStreamer master. Play pause and
> > > seek seems to work reliably now. It's a little bit spamy with
> > > bbb_sunflower_1080p_30fps_normal.mp4:
> > > 
> > > [  725.304663] meson-vdec c8820000.video-codec: VIFIFO usage (16777763) > VIFIFO size (16777216)
> > > 
> > > But there is no visual artifact or performance degradation.
> > > 
> > > Tested-by: Nicolas Dufresne <nicolas@ndufresne.ca>
> > 
> > Sorry, I just notice that with kmssink, seek is broken. The kernel
> > reports a series of:
> > 
> >   [ 1065.046970] meson-vdec c8820000.video-codec: Buffer 0 done but it doesn't exist in m2m_ctx
> 
> Thanks a lot for testing, can you share your setup (gst version, gst pipeline, stream...), thanks !

I'm currently running Fedora 31 (Debian unstable should provide the
same), with the stock GStreamer 1.16.1. And doing playback with:
  
 gst-play-1.0 Videos/bbb_sunflower_1080p_30fps_normal.mp4 --videosink="kmssink" --flags=video

With this player, you can seek with the arrows (left/right), or go back
to the start using 0 key. When you seek, the streaming stalls. If you
switch the --videosink to fakevideosink as an example, seeking works
perfectly, and kernel does not complain anymore. Same if you don't use
a zero-copy path, like fbdevsink.

> 
> Neil
> 
> > > > Total for vicodec device /dev/media3: 7, Succeeded: 7, Failed: 0, Warnings: 0
> > > > Total for vicodec device /dev/video13: 51, Succeeded: 51, Failed: 0, Warnings: 0
> > > > Total for vicodec device /dev/video14: 51, Succeeded: 51, Failed: 0, Warnings: 0
> > > > Total for vicodec device /dev/video14: 51, Succeeded: 51, Failed: 0, Warnings: 0
> > > > Total for vicodec device /dev/video14: 51, Succeeded: 51, Failed: 0, Warnings: 0
> > > > Total for vicodec device /dev/video14: 51, Succeeded: 51, Failed: 0, Warnings: 0
> > > > Total for vicodec device /dev/video14: 51, Succeeded: 51, Failed: 0, Warnings: 0
> > > > Total for vicodec device /dev/video14: 51, Succeeded: 51, Failed: 0, Warnings: 0
> > > > 
> > > > Final Summary: 364, Succeeded: 364, Failed: 0, Warnings: 0
> > > > Thu Jan 16 13:02:59 UTC 2020
> > > > 
> > > > With this, it also passes vdec v4l2-compliance with H264 streaming on Amlogic G12A
> > > > and Amlogic SM1 SoCs successfully.
> > > > 
> > > > The compliance log is:
> > > > # v4l2-compliance --stream-from-hdr test-25fps.h264.hdr -s
> > > > v4l2-compliance SHA: 7ead0e1856b89f2e19369af452bb03fd0cd16793, 64 bits
> > > > 
> > > > Compliance test for meson-vdec device /dev/video0:
> > > > 
> > > > Driver Info:
> > > > 	Driver name      : meson-vdec
> > > > 	Card type        : Amlogic Video Decoder
> > > > 	Bus info         : platform:meson-vdec
> > > > 	Driver version   : 5.5.0
> > > > 	Capabilities     : 0x84204000
> > > > 		Video Memory-to-Memory Multiplanar
> > > > 		Streaming
> > > > 		Extended Pix Format
> > > > 		Device Capabilities
> > > > 	Device Caps      : 0x04204000
> > > > 		Video Memory-to-Memory Multiplanar
> > > > 		Streaming
> > > > 		Extended Pix Format
> > > > 	Detected Stateful Decoder
> > > > 
> > > > Required ioctls:
> > > > 	test VIDIOC_QUERYCAP: OK
> > > > 
> > > > Allow for multiple opens:
> > > > 	test second /dev/video19 open: OK
> > > > 	test VIDIOC_QUERYCAP: OK
> > > > 	test VIDIOC_G/S_PRIORITY: OK
> > > > 	test for unlimited opens: OK
> > > > 
> > > > Debug ioctls:
> > > > 	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> > > > 	test VIDIOC_LOG_STATUS: OK (Not Supported)
> > > > 
> > > > Input ioctls:
> > > > 	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> > > > 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > > > 	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> > > > 	test VIDIOC_ENUMAUDIO: OK (Not Supported)
> > > > 	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> > > > 	test VIDIOC_G/S_AUDIO: OK (Not Supported)
> > > > 	Inputs: 0 Audio Inputs: 0 Tuners: 0
> > > > 
> > > > Output ioctls:
> > > > 	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> > > > 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > > > 	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> > > > 	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> > > > 	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> > > > 	Outputs: 0 Audio Outputs: 0 Modulators: 0
> > > > 
> > > > Input/Output configuration ioctls:
> > > > 	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> > > > 	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> > > > 	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> > > > 	test VIDIOC_G/S_EDID: OK (Not Supported)
> > > > 
> > > > Control ioctls:
> > > > 	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
> > > > 	test VIDIOC_QUERYCTRL: OK
> > > > 	test VIDIOC_G/S_CTRL: OK
> > > > 	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
> > > > 	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
> > > > 	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> > > > 	Standard Controls: 2 Private Controls: 0
> > > > 
> > > > Format ioctls:
> > > > 	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> > > > 	test VIDIOC_G/S_PARM: OK (Not Supported)
> > > > 	test VIDIOC_G_FBUF: OK (Not Supported)
> > > > 	test VIDIOC_G_FMT: OK
> > > > 	test VIDIOC_TRY_FMT: OK
> > > > 	test VIDIOC_S_FMT: OK
> > > > 	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> > > > 	test Cropping: OK (Not Supported)
> > > > 	test Composing: OK (Not Supported)
> > > > 	test Scaling: OK (Not Supported)
> > > > 
> > > > Codec ioctls:
> > > > 	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> > > > 	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> > > > 	test VIDIOC_(TRY_)DECODER_CMD: OK
> > > > 
> > > > Buffer ioctls:
> > > > 	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> > > > 	test VIDIOC_EXPBUF: OK
> > > > 	test Requests: OK (Not Supported)
> > > > 
> > > > Test input 0:
> > > > 
> > > > Streaming ioctls:
> > > > 	test read/write: OK (Not Supported)
> > > > 	test blocking wait: OK
> > > > 	Video Capture Multiplanar: Captured 60 buffers    
> > > > 	test MMAP (select): OK
> > > > 	Video Capture Multiplanar: Captured 60 buffers    
> > > > 	test MMAP (epoll): OK
> > > > 	test USERPTR (select): OK (Not Supported)
> > > > 	test DMABUF: Cannot test, specify --expbuf-device
> > > > 
> > > > Total for meson-vdec device /dev/video0: 49, Succeeded: 49, Failed: 0, Warnings: 0
> > > > 
> > > > 
> > > > Changes since v3 at [3]:
> > > > - Fixed vicodec compliance
> > > > - Fixed vdec compliance with v4l2 state management
> > > > - fixed doc errors for v4l2-mem2mem.h
> > > > 
> > > > Changes since v2 at [2]:
> > > > - Move full draining & stopped state tracking into core v4l2-mem2mem
> > > > - Adapt vicodec to use the core v4l2-mem2mem draining & stopped state tracking
> > > > 
> > > > Changes since v1 at [1]:
> > > > - fixed output_size is never used reported by hans
> > > > - rebased on G12A and SM1 patches
> > > > - added handling of qbuf after STREAMON and STOP before enought buffer queued
> > > > 
> > > > [1] https://lore.kernel.org/linux-media/20191007145909.29979-1-mjourdan@baylibre.com
> > > > [2] https://lore.kernel.org/linux-media/20191126093733.32404-1-narmstrong@baylibre.com
> > > > [3] https://lore.kernel.org/linux-media/20191209122028.13714-1-narmstrong@baylibre.com
> > > > [4] https://people.freedesktop.org/~narmstrong/vicodec-compliance-7ead0e1856b89f2e19369af452bb03fd0cd16793-20200116.log
> > > > 
> > > > Maxime Jourdan (2):
> > > >   media: meson: vdec: bring up to compliance
> > > >   media: meson: vdec: add H.264 decoding support
> > > > 
> > > > Neil Armstrong (2):
> > > >   media: v4l2-mem2mem: handle draining, stopped and next-buf-is-last
> > > >     states
> > > >   media: vicodec: use v4l2-mem2mem draining, stopped and
> > > >     next-buf-is-last states handling
> > > > 
> > > >  drivers/media/platform/vicodec/vicodec-core.c | 162 ++----
> > > >  drivers/media/v4l2-core/v4l2-mem2mem.c        | 172 ++++++-
> > > >  drivers/staging/media/meson/vdec/Makefile     |   2 +-
> > > >  drivers/staging/media/meson/vdec/codec_h264.c | 482 ++++++++++++++++++
> > > >  drivers/staging/media/meson/vdec/codec_h264.h |  14 +
> > > >  drivers/staging/media/meson/vdec/esparser.c   |  58 +--
> > > >  drivers/staging/media/meson/vdec/vdec.c       |  89 ++--
> > > >  drivers/staging/media/meson/vdec/vdec.h       |  14 +-
> > > >  .../staging/media/meson/vdec/vdec_helpers.c   |  85 ++-
> > > >  .../staging/media/meson/vdec/vdec_helpers.h   |   6 +-
> > > >  .../staging/media/meson/vdec/vdec_platform.c  |  71 +++
> > > >  include/media/v4l2-mem2mem.h                  |  95 ++++
> > > >  12 files changed, 1021 insertions(+), 229 deletions(-)
> > > >  create mode 100644 drivers/staging/media/meson/vdec/codec_h264.c
> > > >  create mode 100644 drivers/staging/media/meson/vdec/codec_h264.h
> > > > 

