Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2CB744DC93
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 21:41:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233752AbhKKUoQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 15:44:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233372AbhKKUoQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 15:44:16 -0500
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E2C4C061766;
        Thu, 11 Nov 2021 12:41:26 -0800 (PST)
Received: by mail-ot1-x32b.google.com with SMTP id p11-20020a9d4e0b000000b0055a5741bff7so10746170otf.2;
        Thu, 11 Nov 2021 12:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P8GfDmJWRECaBzibQfuqWubzqcp43Bm55ApqPHNq8JY=;
        b=PCl2wSco2jv/YFdoZR3q2SMpK1bM5YOIu+C37vvzC2TSG0P5Jo4dP7DB1vItPdVbYB
         HtcxlYVwEREIbB8+2tKgC/19mx1Gqfwqb07PnCKX//5WvpjtTFW8RyN8crYI/5E9Dq6h
         iAR71bgxcsLEOIpqtJvBdScNJTXLmW/Ml+ZgGa4M0kmXmICbAZuas+xxZOkZ4DdFpggg
         OumIYFQi5PyW7MCVt2E94QNxNjR0maBKuh6yODYBqIk6KGJsDdQ8HzbIUZiaH4jJd9S6
         zJtpnr9GfdsFH5sjEm5kHFzcag8PpwKhIQwkfQKvq3hPxZj2c5UijTf3ifau2KxO/CIi
         bHVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P8GfDmJWRECaBzibQfuqWubzqcp43Bm55ApqPHNq8JY=;
        b=qJZtDPTALRI10gSZkiM4LD/unFXD8v+7nmqP24UVOlT+ui+dz7XRQlYldaXGYQPGLp
         fh8fWFW8Nc5urnaWG0HqnkEs8LqzOJ86FKXkH8whzGKXvMsVOmmwfxgae3qDjaCJHLWS
         3FwkdtH9rSpSLsIN4EIaE+hP+5B5b33S5S/WFhD5/RC0S3J+c4fc9hhvsGTdI36lxlai
         8oMj7lwWR1VgXRMGhd8sY7mcDKmEpBI30IzaWskw35Duq1Ff6sARb/PB2Ngve7V6Onv3
         INVoRsHNFYKTauS8hde1iGqXYu9ySAliqiJkqgpSPRpI6rGTU7Cf4uqVM8xu1CtmWIvU
         hKDw==
X-Gm-Message-State: AOAM532pYCJJqgQ/fT37lbouAo78cqv5HUjUjdHPeUSP5AHKzGTpbf8z
        FA4tDbpztaDOglNl0RtcxbKOwczNnzyPYYymrz0+WLixO6A=
X-Google-Smtp-Source: ABdhPJyXSkhqKTb0nadUqTcJCS+W0Y89qyKEC3Bxhbey6TuFN8QMTdxr6kpPYcn/ZxQWAvj3eMpND2DgtClhyB3Jcbw=
X-Received: by 2002:a9d:2282:: with SMTP id y2mr8175346ota.151.1636663285433;
 Thu, 11 Nov 2021 12:41:25 -0800 (PST)
MIME-Version: 1.0
References: <20210909150046.57615-1-ribalda@chromium.org>
In-Reply-To: <20210909150046.57615-1-ribalda@chromium.org>
From:   James Hilliard <james.hilliard1@gmail.com>
Date:   Thu, 11 Nov 2021 13:41:13 -0700
Message-ID: <CADvTj4rB5ZThAh2oPkx2=mqUir4Bc_uFFaL6DV_YyOYNSDrXEQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] Follow-up patches for uvc v4l2-compliance
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        tfiga@chromium.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I'm seeing some v4l2-compliance errors with this series from what it
appears and potentially a regression:

Before:
v4l2-compliance 1.22.1, 64 bits, 64-bit time_t

Compliance test for uvcvideo device /dev/video0:

Driver Info:
Driver name      : uvcvideo
Card type        : HD Webcam C525
Bus info         : usb-0000:00:1a.0-1.4
Driver version   : 5.15.0
Capabilities     : 0x84a00001
Video Capture
Metadata Capture
Streaming
Extended Pix Format
Device Capabilities
Device Caps      : 0x04200001
Video Capture
Streaming
Extended Pix Format
Media Driver Info:
Driver name      : uvcvideo
Model            : HD Webcam C525
Serial           : 28D79660
Bus info         : usb-0000:00:1a.0-1.4
Media version    : 5.15.0
Hardware revision: 0x00000010 (16)
Driver version   : 5.15.0
Interface Info:
ID               : 0x03000002
Type             : V4L Video
Entity Info:
ID               : 0x00000001 (1)
Name             : Video Capture 3
Function         : V4L2 I/O
Flags            : default
Pad 0x01000007   : 0: Sink
 Link 0x02000019: from remote pad 0x100000a of entity 'Extension 5'
(Video Pixel Formatter): Data, Enabled, Immutable

Required ioctls:
test MC information (see 'Media Driver Info' above): OK
test VIDIOC_QUERYCAP: OK
test invalid ioctls: OK

Allow for multiple opens:
test second /dev/video0 open: OK
test VIDIOC_QUERYCAP: OK
test VIDIOC_G/S_PRIORITY: OK
test for unlimited opens: OK

Debug ioctls:
test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
test VIDIOC_ENUMAUDIO: OK (Not Supported)
test VIDIOC_G/S/ENUMINPUT: OK
test VIDIOC_G/S_AUDIO: OK (Not Supported)
Inputs: 1 Audio Inputs: 0 Tuners: 0

Output ioctls:
test VIDIOC_G/S_MODULATOR: OK (Not Supported)
test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
test VIDIOC_ENUMAUDOUT: OK (Not Supported)
test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
test VIDIOC_G/S_AUDOUT: OK (Not Supported)
Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls (Input 0):
info: checking v4l2_query_ext_ctrl of control 'User Controls' (0x00980001)
info: checking v4l2_query_ext_ctrl of control 'Brightness' (0x00980900)
info: checking v4l2_query_ext_ctrl of control 'Contrast' (0x00980901)
info: checking v4l2_query_ext_ctrl of control 'Saturation' (0x00980902)
info: checking v4l2_query_ext_ctrl of control 'White Balance,
Automatic' (0x0098090c)
info: checking v4l2_query_ext_ctrl of control 'Gain' (0x00980913)
info: checking v4l2_query_ext_ctrl of control 'Power Line Frequency'
(0x00980918)
info: checking v4l2_query_ext_ctrl of control 'White Balance
Temperature' (0x0098091a)
info: checking v4l2_query_ext_ctrl of control 'Sharpness' (0x0098091b)
info: checking v4l2_query_ext_ctrl of control 'Backlight Compensation'
(0x0098091c)
info: checking v4l2_query_ext_ctrl of control 'Camera Controls' (0x009a0001)
info: checking v4l2_query_ext_ctrl of control 'Auto Exposure' (0x009a0901)
info: checking v4l2_query_ext_ctrl of control 'Exposure Time,
Absolute' (0x009a0902)
info: checking v4l2_query_ext_ctrl of control 'Exposure, Dynamic
Framerate' (0x009a0903)
info: checking v4l2_query_ext_ctrl of control 'Pan, Absolute' (0x009a0908)
info: checking v4l2_query_ext_ctrl of control 'Tilt, Absolute' (0x009a0909)
info: checking v4l2_query_ext_ctrl of control 'Focus, Absolute' (0x009a090a)
info: checking v4l2_query_ext_ctrl of control 'Focus, Automatic
Continuous' (0x009a090c)
info: checking v4l2_query_ext_ctrl of control 'Zoom, Absolute' (0x009a090d)
info: checking v4l2_query_ext_ctrl of control 'Brightness' (0x00980900)
info: checking v4l2_query_ext_ctrl of control 'Contrast' (0x00980901)
info: checking v4l2_query_ext_ctrl of control 'Saturation' (0x00980902)
info: checking v4l2_query_ext_ctrl of control 'White Balance,
Automatic' (0x0098090c)
info: checking v4l2_query_ext_ctrl of control 'Gain' (0x00980913)
info: checking v4l2_query_ext_ctrl of control 'Power Line Frequency'
(0x00980918)
info: checking v4l2_query_ext_ctrl of control 'White Balance
Temperature' (0x0098091a)
info: checking v4l2_query_ext_ctrl of control 'Sharpness' (0x0098091b)
info: checking v4l2_query_ext_ctrl of control 'Backlight Compensation'
(0x0098091c)
test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
test VIDIOC_QUERYCTRL: OK
info: checking control 'User Controls' (0x00980001)
info: checking control 'Brightness' (0x00980900)
info: checking control 'Contrast' (0x00980901)
info: checking control 'Saturation' (0x00980902)
info: checking control 'White Balance, Automatic' (0x0098090c)
info: checking control 'Gain' (0x00980913)
info: checking control 'Power Line Frequency' (0x00980918)
info: checking control 'White Balance Temperature' (0x0098091a)
warn: v4l2-test-controls.cpp(483): s_ctrl returned EIO
info: checking control 'Sharpness' (0x0098091b)
info: checking control 'Backlight Compensation' (0x0098091c)
info: checking control 'Camera Controls' (0x009a0001)
info: checking control 'Auto Exposure' (0x009a0901)
info: checking control 'Exposure Time, Absolute' (0x009a0902)
warn: v4l2-test-controls.cpp(483): s_ctrl returned EIO
info: checking control 'Exposure, Dynamic Framerate' (0x009a0903)
info: checking control 'Pan, Absolute' (0x009a0908)
info: checking control 'Tilt, Absolute' (0x009a0909)
info: checking control 'Focus, Absolute' (0x009a090a)
warn: v4l2-test-controls.cpp(486): s_ctrl returned EILSEQ
info: checking control 'Focus, Automatic Continuous' (0x009a090c)
info: checking control 'Zoom, Absolute' (0x009a090d)
test VIDIOC_G/S_CTRL: OK
info: checking extended control 'User Controls' (0x00980001)
info: checking extended control 'Brightness' (0x00980900)
info: checking extended control 'Contrast' (0x00980901)
info: checking extended control 'Saturation' (0x00980902)
info: checking extended control 'White Balance, Automatic' (0x0098090c)
info: checking extended control 'Gain' (0x00980913)
info: checking extended control 'Power Line Frequency' (0x00980918)
info: checking extended control 'White Balance Temperature' (0x0098091a)
warn: v4l2-test-controls.cpp(729): s_ext_ctrls returned EIO
info: checking extended control 'Sharpness' (0x0098091b)
info: checking extended control 'Backlight Compensation' (0x0098091c)
info: checking extended control 'Camera Controls' (0x009a0001)
info: checking extended control 'Auto Exposure' (0x009a0901)
info: checking extended control 'Exposure Time, Absolute' (0x009a0902)
warn: v4l2-test-controls.cpp(729): s_ext_ctrls returned EIO
info: checking extended control 'Exposure, Dynamic Framerate' (0x009a0903)
info: checking extended control 'Pan, Absolute' (0x009a0908)
info: checking extended control 'Tilt, Absolute' (0x009a0909)
info: checking extended control 'Focus, Absolute' (0x009a090a)
warn: v4l2-test-controls.cpp(732): s_ext_ctrls returned EILSEQ
info: checking extended control 'Focus, Automatic Continuous' (0x009a090c)
info: checking extended control 'Zoom, Absolute' (0x009a090d)
warn: v4l2-test-controls.cpp(805): s_ext_ctrls returned EIO
test VIDIOC_G/S/TRY_EXT_CTRLS: OK
info: checking control event 'User Controls' (0x00980001)
info: checking control event 'Brightness' (0x00980900)
info: checking control event 'Contrast' (0x00980901)
info: checking control event 'Saturation' (0x00980902)
info: checking control event 'White Balance, Automatic' (0x0098090c)
info: checking control event 'Gain' (0x00980913)
info: checking control event 'Power Line Frequency' (0x00980918)
info: checking control event 'White Balance Temperature' (0x0098091a)
info: checking control event 'Sharpness' (0x0098091b)
info: checking control event 'Backlight Compensation' (0x0098091c)
info: checking control event 'Camera Controls' (0x009a0001)
info: checking control event 'Auto Exposure' (0x009a0901)
info: checking control event 'Exposure Time, Absolute' (0x009a0902)
info: checking control event 'Exposure, Dynamic Framerate' (0x009a0903)
info: checking control event 'Pan, Absolute' (0x009a0908)
info: checking control event 'Tilt, Absolute' (0x009a0909)
info: checking control event 'Focus, Absolute' (0x009a090a)
info: checking control event 'Focus, Automatic Continuous' (0x009a090c)
info: checking control event 'Zoom, Absolute' (0x009a090d)
test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
Standard Controls: 19 Private Controls: 0

Format ioctls (Input 0):
info: found 7 frameintervals for pixel format 56595559 (YUYV) and size 640x480
info: found 7 frameintervals for pixel format 56595559 (YUYV) and size 160x120
info: found 7 frameintervals for pixel format 56595559 (YUYV) and size 176x144
info: found 7 frameintervals for pixel format 56595559 (YUYV) and size 320x176
info: found 7 frameintervals for pixel format 56595559 (YUYV) and size 320x240
info: found 7 frameintervals for pixel format 56595559 (YUYV) and size 432x240
info: found 7 frameintervals for pixel format 56595559 (YUYV) and size 352x288
info: found 7 frameintervals for pixel format 56595559 (YUYV) and size 544x288
info: found 7 frameintervals for pixel format 56595559 (YUYV) and size 640x360
info: found 7 frameintervals for pixel format 56595559 (YUYV) and size 752x416
info: found 7 frameintervals for pixel format 56595559 (YUYV) and size 800x448
info: found 6 frameintervals for pixel format 56595559 (YUYV) and size 864x480
info: found 5 frameintervals for pixel format 56595559 (YUYV) and size 960x544
info: found 4 frameintervals for pixel format 56595559 (YUYV) and size 1024x576
info: found 6 frameintervals for pixel format 56595559 (YUYV) and size 800x600
info: found 4 frameintervals for pixel format 56595559 (YUYV) and size 1184x656
info: found 4 frameintervals for pixel format 56595559 (YUYV) and size 960x720
info: found 3 frameintervals for pixel format 56595559 (YUYV) and size 1280x720
info: found 3 frameintervals for pixel format 56595559 (YUYV) and size 1392x768
info: found 2 frameintervals for pixel format 56595559 (YUYV) and size 1504x832
info: found 2 frameintervals for pixel format 56595559 (YUYV) and size 1600x896
info: found 2 frameintervals for pixel format 56595559 (YUYV) and size 1280x960
info: found 1 frameintervals for pixel format 56595559 (YUYV) and size 1712x960
info: found 1 frameintervals for pixel format 56595559 (YUYV) and size 1792x1008
info: found 1 frameintervals for pixel format 56595559 (YUYV) and size 1920x1080
info: found 25 framesizes for pixel format 56595559 (YUYV)
info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 640x480
info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 160x120
info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 176x144
info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 320x176
info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 320x240
info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 432x240
info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 352x288
info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 544x288
info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 640x360
info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 752x416
info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 800x448
info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 864x480
info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 960x544
info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 1024x576
info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 800x600
info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 1184x656
info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 960x720
info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 1280x720
info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 1392x768
info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 1504x832
info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 1600x896
info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 1280x960
info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 1712x960
info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 1792x1008
info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 1920x1080
info: found 25 framesizes for pixel format 47504a4d (MJPG)
info: found 2 formats for buftype 1
test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
test VIDIOC_G/S_PARM: OK
test VIDIOC_G_FBUF: OK (Not Supported)
test VIDIOC_G_FMT: OK
test VIDIOC_TRY_FMT: OK
warn: v4l2-test-formats.cpp(1036): Could not set fmt2
test VIDIOC_S_FMT: OK
test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
test Cropping: OK (Not Supported)
test Composing: OK (Not Supported)
test Scaling: OK (Not Supported)

Codec ioctls (Input 0):
test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
test VIDIOC_G_ENC_INDEX: OK (Not Supported)
test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 0):
info: test buftype Video Capture
test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
test VIDIOC_EXPBUF: OK
test Requests: OK (Not Supported)

Total for uvcvideo device /dev/video0: 46, Succeeded: 46, Failed: 0, Warnings: 8

After:
v4l2-compliance 1.22.1, 64 bits, 64-bit time_t

Compliance test for uvcvideo device /dev/video0:

Driver Info:
Driver name      : uvcvideo
Card type        : HD Webcam C525
Bus info         : usb-0000:00:1a.0-1.4
Driver version   : 5.15.0
Capabilities     : 0x84a00001
Video Capture
Metadata Capture
Streaming
Extended Pix Format
Device Capabilities
Device Caps      : 0x04200001
Video Capture
Streaming
Extended Pix Format
Media Driver Info:
Driver name      : uvcvideo
Model            : HD Webcam C525
Serial           : 28D79660
Bus info         : usb-0000:00:1a.0-1.4
Media version    : 5.15.0
Hardware revision: 0x00000010 (16)
Driver version   : 5.15.0
Interface Info:
ID               : 0x03000002
Type             : V4L Video
Entity Info:
ID               : 0x00000001 (1)
Name             : Video Capture 3
Function         : V4L2 I/O
Flags            : default
Pad 0x01000007   : 0: Sink
 Link 0x02000019: from remote pad 0x100000a of entity 'Extension 5'
(Video Pixel Formatter): Data, Enabled, Immutable

Required ioctls:
test MC information (see 'Media Driver Info' above): OK
test VIDIOC_QUERYCAP: OK
test invalid ioctls: OK

Allow for multiple opens:
test second /dev/video0 open: OK
test VIDIOC_QUERYCAP: OK
test VIDIOC_G/S_PRIORITY: OK
test for unlimited opens: OK

Debug ioctls:
test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
test VIDIOC_ENUMAUDIO: OK (Not Supported)
test VIDIOC_G/S/ENUMINPUT: OK
test VIDIOC_G/S_AUDIO: OK (Not Supported)
Inputs: 1 Audio Inputs: 0 Tuners: 0

Output ioctls:
test VIDIOC_G/S_MODULATOR: OK (Not Supported)
test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
test VIDIOC_ENUMAUDOUT: OK (Not Supported)
test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
test VIDIOC_G/S_AUDOUT: OK (Not Supported)
Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls (Input 0):
info: checking v4l2_query_ext_ctrl of control 'User Controls' (0x00980001)
info: checking v4l2_query_ext_ctrl of control 'Brightness' (0x00980900)
info: checking v4l2_query_ext_ctrl of control 'Contrast' (0x00980901)
info: checking v4l2_query_ext_ctrl of control 'Saturation' (0x00980902)
info: checking v4l2_query_ext_ctrl of control 'White Balance,
Automatic' (0x0098090c)
info: checking v4l2_query_ext_ctrl of control 'Gain' (0x00980913)
info: checking v4l2_query_ext_ctrl of control 'Power Line Frequency'
(0x00980918)
info: checking v4l2_query_ext_ctrl of control 'White Balance
Temperature' (0x0098091a)
info: checking v4l2_query_ext_ctrl of control 'Sharpness' (0x0098091b)
info: checking v4l2_query_ext_ctrl of control 'Backlight Compensation'
(0x0098091c)
info: checking v4l2_query_ext_ctrl of control 'Camera Controls' (0x009a0001)
info: checking v4l2_query_ext_ctrl of control 'Auto Exposure' (0x009a0901)
info: checking v4l2_query_ext_ctrl of control 'Exposure Time,
Absolute' (0x009a0902)
info: checking v4l2_query_ext_ctrl of control 'Exposure, Dynamic
Framerate' (0x009a0903)
info: checking v4l2_query_ext_ctrl of control 'Pan, Absolute' (0x009a0908)
info: checking v4l2_query_ext_ctrl of control 'Tilt, Absolute' (0x009a0909)
info: checking v4l2_query_ext_ctrl of control 'Focus, Absolute' (0x009a090a)
info: checking v4l2_query_ext_ctrl of control 'Focus, Automatic
Continuous' (0x009a090c)
info: checking v4l2_query_ext_ctrl of control 'Zoom, Absolute' (0x009a090d)
info: checking v4l2_query_ext_ctrl of control 'Brightness' (0x00980900)
info: checking v4l2_query_ext_ctrl of control 'Contrast' (0x00980901)
info: checking v4l2_query_ext_ctrl of control 'Saturation' (0x00980902)
info: checking v4l2_query_ext_ctrl of control 'White Balance,
Automatic' (0x0098090c)
info: checking v4l2_query_ext_ctrl of control 'Gain' (0x00980913)
info: checking v4l2_query_ext_ctrl of control 'Power Line Frequency'
(0x00980918)
info: checking v4l2_query_ext_ctrl of control 'White Balance
Temperature' (0x0098091a)
info: checking v4l2_query_ext_ctrl of control 'Sharpness' (0x0098091b)
info: checking v4l2_query_ext_ctrl of control 'Backlight Compensation'
(0x0098091c)
test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
test VIDIOC_QUERYCTRL: OK
info: checking control 'User Controls' (0x00980001)
info: checking control 'Brightness' (0x00980900)
info: checking control 'Contrast' (0x00980901)
info: checking control 'Saturation' (0x00980902)
info: checking control 'White Balance, Automatic' (0x0098090c)
info: checking control 'Gain' (0x00980913)
info: checking control 'Power Line Frequency' (0x00980918)
info: checking control 'White Balance Temperature' (0x0098091a)
fail: v4l2-test-controls.cpp(489): s_ctrl returned an error (13)
test VIDIOC_G/S_CTRL: FAIL
info: checking extended control 'User Controls' (0x00980001)
info: checking extended control 'Brightness' (0x00980900)
info: checking extended control 'Contrast' (0x00980901)
info: checking extended control 'Saturation' (0x00980902)
info: checking extended control 'White Balance, Automatic' (0x0098090c)
info: checking extended control 'Gain' (0x00980913)
info: checking extended control 'Power Line Frequency' (0x00980918)
info: checking extended control 'White Balance Temperature' (0x0098091a)
fail: v4l2-test-controls.cpp(736): s_ext_ctrls returned an error (13)
test VIDIOC_G/S/TRY_EXT_CTRLS: FAIL
info: checking control event 'User Controls' (0x00980001)
info: checking control event 'Brightness' (0x00980900)
info: checking control event 'Contrast' (0x00980901)
info: checking control event 'Saturation' (0x00980902)
info: checking control event 'White Balance, Automatic' (0x0098090c)
info: checking control event 'Gain' (0x00980913)
info: checking control event 'Power Line Frequency' (0x00980918)
info: checking control event 'White Balance Temperature' (0x0098091a)
info: checking control event 'Sharpness' (0x0098091b)
info: checking control event 'Backlight Compensation' (0x0098091c)
info: checking control event 'Camera Controls' (0x009a0001)
info: checking control event 'Auto Exposure' (0x009a0901)
info: checking control event 'Exposure Time, Absolute' (0x009a0902)
info: checking control event 'Exposure, Dynamic Framerate' (0x009a0903)
info: checking control event 'Pan, Absolute' (0x009a0908)
info: checking control event 'Tilt, Absolute' (0x009a0909)
info: checking control event 'Focus, Absolute' (0x009a090a)
info: checking control event 'Focus, Automatic Continuous' (0x009a090c)
info: checking control event 'Zoom, Absolute' (0x009a090d)
test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
Standard Controls: 19 Private Controls: 0

Format ioctls (Input 0):
info: found 7 frameintervals for pixel format 56595559 (YUYV) and size 640x480
info: found 7 frameintervals for pixel format 56595559 (YUYV) and size 160x120
info: found 7 frameintervals for pixel format 56595559 (YUYV) and size 176x144
info: found 7 frameintervals for pixel format 56595559 (YUYV) and size 320x176
info: found 7 frameintervals for pixel format 56595559 (YUYV) and size 320x240
info: found 7 frameintervals for pixel format 56595559 (YUYV) and size 432x240
info: found 7 frameintervals for pixel format 56595559 (YUYV) and size 352x288
info: found 7 frameintervals for pixel format 56595559 (YUYV) and size 544x288
info: found 7 frameintervals for pixel format 56595559 (YUYV) and size 640x360
info: found 7 frameintervals for pixel format 56595559 (YUYV) and size 752x416
info: found 7 frameintervals for pixel format 56595559 (YUYV) and size 800x448
info: found 6 frameintervals for pixel format 56595559 (YUYV) and size 864x480
info: found 5 frameintervals for pixel format 56595559 (YUYV) and size 960x544
info: found 4 frameintervals for pixel format 56595559 (YUYV) and size 1024x576
info: found 6 frameintervals for pixel format 56595559 (YUYV) and size 800x600
info: found 4 frameintervals for pixel format 56595559 (YUYV) and size 1184x656
info: found 4 frameintervals for pixel format 56595559 (YUYV) and size 960x720
info: found 3 frameintervals for pixel format 56595559 (YUYV) and size 1280x720
info: found 3 frameintervals for pixel format 56595559 (YUYV) and size 1392x768
info: found 2 frameintervals for pixel format 56595559 (YUYV) and size 1504x832
info: found 2 frameintervals for pixel format 56595559 (YUYV) and size 1600x896
info: found 2 frameintervals for pixel format 56595559 (YUYV) and size 1280x960
info: found 1 frameintervals for pixel format 56595559 (YUYV) and size 1712x960
info: found 1 frameintervals for pixel format 56595559 (YUYV) and size 1792x1008
info: found 1 frameintervals for pixel format 56595559 (YUYV) and size 1920x1080
info: found 25 framesizes for pixel format 56595559 (YUYV)
info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 640x480
info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 160x120
info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 176x144
info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 320x176
info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 320x240
info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 432x240
info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 352x288
info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 544x288
info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 640x360
info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 752x416
info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 800x448
info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 864x480
info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 960x544
info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 1024x576
info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 800x600
info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 1184x656
info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 960x720
info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 1280x720
info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 1392x768
info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 1504x832
info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 1600x896
info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 1280x960
info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 1712x960
info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 1792x1008
info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 1920x1080
info: found 25 framesizes for pixel format 47504a4d (MJPG)
info: found 2 formats for buftype 1
test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
test VIDIOC_G/S_PARM: OK
test VIDIOC_G_FBUF: OK (Not Supported)
test VIDIOC_G_FMT: OK
test VIDIOC_TRY_FMT: OK
warn: v4l2-test-formats.cpp(1036): Could not set fmt2
test VIDIOC_S_FMT: OK
test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
test Cropping: OK (Not Supported)
test Composing: OK (Not Supported)
test Scaling: OK (Not Supported)

Codec ioctls (Input 0):
test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
test VIDIOC_G_ENC_INDEX: OK (Not Supported)
test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 0):
info: test buftype Video Capture
test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
test VIDIOC_EXPBUF: OK
test Requests: OK (Not Supported)

Total for uvcvideo device /dev/video0: 46, Succeeded: 44, Failed: 2, Warnings: 1
[  642.533598] usb 1-1.4: uvc_v4l2_open
[  642.587552] usb 1-1.4: Resuming interface 2
[  642.587570] usb 1-1.4: Resuming interface 3
[  642.590328] usb 1-1.4: uvc_v4l2_open
[  642.590453] usb 1-1.4: uvc_v4l2_open
[  642.590466] usb 1-1.4: uvc_v4l2_open
[  642.590478] usb 1-1.4: uvc_v4l2_open
[  642.590488] usb 1-1.4: uvc_v4l2_open
[  642.590497] usb 1-1.4: uvc_v4l2_open
[  642.590507] usb 1-1.4: uvc_v4l2_open
[  642.590517] usb 1-1.4: uvc_v4l2_open
[  642.590526] usb 1-1.4: uvc_v4l2_open
[  642.590535] usb 1-1.4: uvc_v4l2_open
[  642.590545] usb 1-1.4: uvc_v4l2_open
[  642.590554] usb 1-1.4: uvc_v4l2_open
[  642.590563] usb 1-1.4: uvc_v4l2_open
[  642.590573] usb 1-1.4: uvc_v4l2_open
[  642.590583] usb 1-1.4: uvc_v4l2_open
[  642.590592] usb 1-1.4: uvc_v4l2_open
[  642.590601] usb 1-1.4: uvc_v4l2_open
[  642.590610] usb 1-1.4: uvc_v4l2_open
[  642.590620] usb 1-1.4: uvc_v4l2_open
[  642.590629] usb 1-1.4: uvc_v4l2_open
[  642.590639] usb 1-1.4: uvc_v4l2_open
[  642.590648] usb 1-1.4: uvc_v4l2_open
[  642.590657] usb 1-1.4: uvc_v4l2_open
[  642.590666] usb 1-1.4: uvc_v4l2_open
[  642.590676] usb 1-1.4: uvc_v4l2_open
[  642.590685] usb 1-1.4: uvc_v4l2_open
[  642.590694] usb 1-1.4: uvc_v4l2_open
[  642.590703] usb 1-1.4: uvc_v4l2_open
[  642.590713] usb 1-1.4: uvc_v4l2_open
[  642.590722] usb 1-1.4: uvc_v4l2_open
[  642.590732] usb 1-1.4: uvc_v4l2_open
[  642.590741] usb 1-1.4: uvc_v4l2_open
[  642.590750] usb 1-1.4: uvc_v4l2_open
[  642.590759] usb 1-1.4: uvc_v4l2_open
[  642.590767] usb 1-1.4: uvc_v4l2_open
[  642.590776] usb 1-1.4: uvc_v4l2_open
[  642.590787] usb 1-1.4: uvc_v4l2_open
[  642.590797] usb 1-1.4: uvc_v4l2_open
[  642.590806] usb 1-1.4: uvc_v4l2_open
[  642.590815] usb 1-1.4: uvc_v4l2_open
[  642.590824] usb 1-1.4: uvc_v4l2_open
[  642.590834] usb 1-1.4: uvc_v4l2_open
[  642.590845] usb 1-1.4: uvc_v4l2_open
[  642.590854] usb 1-1.4: uvc_v4l2_open
[  642.590864] usb 1-1.4: uvc_v4l2_open
[  642.590874] usb 1-1.4: uvc_v4l2_open
[  642.590884] usb 1-1.4: uvc_v4l2_open
[  642.590893] usb 1-1.4: uvc_v4l2_open
[  642.590902] usb 1-1.4: uvc_v4l2_open
[  642.590911] usb 1-1.4: uvc_v4l2_open
[  642.590920] usb 1-1.4: uvc_v4l2_open
[  642.590929] usb 1-1.4: uvc_v4l2_open
[  642.590938] usb 1-1.4: uvc_v4l2_open
[  642.590947] usb 1-1.4: uvc_v4l2_open
[  642.590956] usb 1-1.4: uvc_v4l2_open
[  642.590965] usb 1-1.4: uvc_v4l2_open
[  642.590976] usb 1-1.4: uvc_v4l2_open
[  642.590985] usb 1-1.4: uvc_v4l2_open
[  642.590994] usb 1-1.4: uvc_v4l2_open
[  642.591007] usb 1-1.4: uvc_v4l2_open
[  642.591018] usb 1-1.4: uvc_v4l2_open
[  642.591027] usb 1-1.4: uvc_v4l2_open
[  642.591036] usb 1-1.4: uvc_v4l2_open
[  642.591045] usb 1-1.4: uvc_v4l2_open
[  642.591053] usb 1-1.4: uvc_v4l2_open
[  642.591062] usb 1-1.4: uvc_v4l2_open
[  642.591072] usb 1-1.4: uvc_v4l2_open
[  642.591083] usb 1-1.4: uvc_v4l2_open
[  642.591092] usb 1-1.4: uvc_v4l2_open
[  642.591102] usb 1-1.4: uvc_v4l2_open
[  642.591111] usb 1-1.4: uvc_v4l2_open
[  642.591120] usb 1-1.4: uvc_v4l2_open
[  642.591131] usb 1-1.4: uvc_v4l2_open
[  642.591140] usb 1-1.4: uvc_v4l2_open
[  642.591149] usb 1-1.4: uvc_v4l2_open
[  642.591159] usb 1-1.4: uvc_v4l2_open
[  642.591170] usb 1-1.4: uvc_v4l2_open
[  642.591180] usb 1-1.4: uvc_v4l2_open
[  642.591190] usb 1-1.4: uvc_v4l2_open
[  642.591201] usb 1-1.4: uvc_v4l2_open
[  642.591210] usb 1-1.4: uvc_v4l2_open
[  642.591220] usb 1-1.4: uvc_v4l2_open
[  642.591229] usb 1-1.4: uvc_v4l2_open
[  642.591238] usb 1-1.4: uvc_v4l2_open
[  642.591249] usb 1-1.4: uvc_v4l2_open
[  642.591260] usb 1-1.4: uvc_v4l2_open
[  642.591286] usb 1-1.4: uvc_v4l2_open
[  642.591297] usb 1-1.4: uvc_v4l2_open
[  642.591308] usb 1-1.4: uvc_v4l2_open
[  642.591318] usb 1-1.4: uvc_v4l2_open
[  642.591327] usb 1-1.4: uvc_v4l2_open
[  642.591337] usb 1-1.4: uvc_v4l2_open
[  642.591346] usb 1-1.4: uvc_v4l2_open
[  642.591355] usb 1-1.4: uvc_v4l2_open
[  642.591364] usb 1-1.4: uvc_v4l2_open
[  642.591373] usb 1-1.4: uvc_v4l2_open
[  642.591383] usb 1-1.4: uvc_v4l2_open
[  642.591393] usb 1-1.4: uvc_v4l2_open
[  642.591402] usb 1-1.4: uvc_v4l2_open
[  642.591411] usb 1-1.4: uvc_v4l2_open
[  642.591420] usb 1-1.4: uvc_v4l2_open
[  642.591477] usb 1-1.4: uvc_v4l2_release
[  642.591507] usb 1-1.4: uvc_v4l2_release
[  642.591531] usb 1-1.4: uvc_v4l2_release
[  642.591556] usb 1-1.4: uvc_v4l2_release
[  642.591579] usb 1-1.4: uvc_v4l2_release
[  642.591601] usb 1-1.4: uvc_v4l2_release
[  642.591624] usb 1-1.4: uvc_v4l2_release
[  642.591647] usb 1-1.4: uvc_v4l2_release
[  642.591670] usb 1-1.4: uvc_v4l2_release
[  642.591692] usb 1-1.4: uvc_v4l2_release
[  642.591715] usb 1-1.4: uvc_v4l2_release
[  642.591737] usb 1-1.4: uvc_v4l2_release
[  642.591760] usb 1-1.4: uvc_v4l2_release
[  642.591783] usb 1-1.4: uvc_v4l2_release
[  642.591805] usb 1-1.4: uvc_v4l2_release
[  642.591829] usb 1-1.4: uvc_v4l2_release
[  642.591853] usb 1-1.4: uvc_v4l2_release
[  642.591876] usb 1-1.4: uvc_v4l2_release
[  642.591899] usb 1-1.4: uvc_v4l2_release
[  642.591922] usb 1-1.4: uvc_v4l2_release
[  642.591944] usb 1-1.4: uvc_v4l2_release
[  642.591967] usb 1-1.4: uvc_v4l2_release
[  642.591990] usb 1-1.4: uvc_v4l2_release
[  642.592012] usb 1-1.4: uvc_v4l2_release
[  642.592035] usb 1-1.4: uvc_v4l2_release
[  642.592058] usb 1-1.4: uvc_v4l2_release
[  642.592081] usb 1-1.4: uvc_v4l2_release
[  642.592103] usb 1-1.4: uvc_v4l2_release
[  642.592126] usb 1-1.4: uvc_v4l2_release
[  642.592148] usb 1-1.4: uvc_v4l2_release
[  642.592170] usb 1-1.4: uvc_v4l2_release
[  642.592192] usb 1-1.4: uvc_v4l2_release
[  642.592214] usb 1-1.4: uvc_v4l2_release
[  642.592237] usb 1-1.4: uvc_v4l2_release
[  642.592259] usb 1-1.4: uvc_v4l2_release
[  642.592295] usb 1-1.4: uvc_v4l2_release
[  642.592319] usb 1-1.4: uvc_v4l2_release
[  642.592342] usb 1-1.4: uvc_v4l2_release
[  642.592364] usb 1-1.4: uvc_v4l2_release
[  642.592387] usb 1-1.4: uvc_v4l2_release
[  642.592410] usb 1-1.4: uvc_v4l2_release
[  642.592432] usb 1-1.4: uvc_v4l2_release
[  642.592455] usb 1-1.4: uvc_v4l2_release
[  642.592478] usb 1-1.4: uvc_v4l2_release
[  642.592500] usb 1-1.4: uvc_v4l2_release
[  642.592523] usb 1-1.4: uvc_v4l2_release
[  642.592546] usb 1-1.4: uvc_v4l2_release
[  642.592569] usb 1-1.4: uvc_v4l2_release
[  642.592592] usb 1-1.4: uvc_v4l2_release
[  642.592614] usb 1-1.4: uvc_v4l2_release
[  642.592637] usb 1-1.4: uvc_v4l2_release
[  642.592660] usb 1-1.4: uvc_v4l2_release
[  642.592683] usb 1-1.4: uvc_v4l2_release
[  642.592706] usb 1-1.4: uvc_v4l2_release
[  642.592728] usb 1-1.4: uvc_v4l2_release
[  642.592751] usb 1-1.4: uvc_v4l2_release
[  642.592773] usb 1-1.4: uvc_v4l2_release
[  642.592796] usb 1-1.4: uvc_v4l2_release
[  642.592819] usb 1-1.4: uvc_v4l2_release
[  642.592842] usb 1-1.4: uvc_v4l2_release
[  642.592865] usb 1-1.4: uvc_v4l2_release
[  642.592887] usb 1-1.4: uvc_v4l2_release
[  642.592910] usb 1-1.4: uvc_v4l2_release
[  642.592933] usb 1-1.4: uvc_v4l2_release
[  642.592955] usb 1-1.4: uvc_v4l2_release
[  642.592978] usb 1-1.4: uvc_v4l2_release
[  642.593001] usb 1-1.4: uvc_v4l2_release
[  642.593025] usb 1-1.4: uvc_v4l2_release
[  642.593048] usb 1-1.4: uvc_v4l2_release
[  642.593071] usb 1-1.4: uvc_v4l2_release
[  642.593094] usb 1-1.4: uvc_v4l2_release
[  642.593116] usb 1-1.4: uvc_v4l2_release
[  642.593139] usb 1-1.4: uvc_v4l2_release
[  642.593161] usb 1-1.4: uvc_v4l2_release
[  642.593184] usb 1-1.4: uvc_v4l2_release
[  642.593206] usb 1-1.4: uvc_v4l2_release
[  642.593229] usb 1-1.4: uvc_v4l2_release
[  642.593251] usb 1-1.4: uvc_v4l2_release
[  642.593287] usb 1-1.4: uvc_v4l2_release
[  642.593312] usb 1-1.4: uvc_v4l2_release
[  642.593335] usb 1-1.4: uvc_v4l2_release
[  642.593358] usb 1-1.4: uvc_v4l2_release
[  642.593381] usb 1-1.4: uvc_v4l2_release
[  642.593404] usb 1-1.4: uvc_v4l2_release
[  642.593427] usb 1-1.4: uvc_v4l2_release
[  642.593450] usb 1-1.4: uvc_v4l2_release
[  642.593473] usb 1-1.4: uvc_v4l2_release
[  642.593495] usb 1-1.4: uvc_v4l2_release
[  642.593518] usb 1-1.4: uvc_v4l2_release
[  642.593541] usb 1-1.4: uvc_v4l2_release
[  642.593565] usb 1-1.4: uvc_v4l2_release
[  642.593588] usb 1-1.4: uvc_v4l2_release
[  642.593611] usb 1-1.4: uvc_v4l2_release
[  642.593634] usb 1-1.4: uvc_v4l2_release
[  642.593656] usb 1-1.4: uvc_v4l2_release
[  642.593679] usb 1-1.4: uvc_v4l2_release
[  642.593701] usb 1-1.4: uvc_v4l2_release
[  642.593724] usb 1-1.4: uvc_v4l2_release
[  642.593747] usb 1-1.4: uvc_v4l2_release
[  642.593770] usb 1-1.4: uvc_v4l2_release
[  642.604856] usb 1-1.4: Control 0x00980001 not found
[  642.605074] usb 1-1.4: Control 0x009a0001 not found
[  642.605322] usb 1-1.4: Control 0x00000000 not found
[  642.605382] usb 1-1.4: Control 0x00980903 not found
[  642.605390] usb 1-1.4: Control 0x00980904 not found
[  642.605397] usb 1-1.4: Control 0x00980905 not found
[  642.605403] usb 1-1.4: Control 0x00980906 not found
[  642.605410] usb 1-1.4: Control 0x00980907 not found
[  642.605416] usb 1-1.4: Control 0x00980908 not found
[  642.605423] usb 1-1.4: Control 0x00980909 not found
[  642.605429] usb 1-1.4: Control 0x0098090a not found
[  642.605436] usb 1-1.4: Control 0x0098090b not found
[  642.605460] usb 1-1.4: Control 0x0098090d not found
[  642.605468] usb 1-1.4: Control 0x0098090e not found
[  642.605474] usb 1-1.4: Control 0x0098090f not found
[  642.605481] usb 1-1.4: Control 0x00980910 not found
[  642.605487] usb 1-1.4: Control 0x00980911 not found
[  642.605494] usb 1-1.4: Control 0x00980912 not found
[  642.605515] usb 1-1.4: Control 0x00980914 not found
[  642.605522] usb 1-1.4: Control 0x00980915 not found
[  642.605528] usb 1-1.4: Control 0x00980916 not found
[  642.605535] usb 1-1.4: Control 0x00980917 not found
[  642.605567] usb 1-1.4: Control 0x00980919 not found
[  642.605630] usb 1-1.4: Control 0x0098091d not found
[  642.605637] usb 1-1.4: Control 0x0098091e not found
[  642.605644] usb 1-1.4: Control 0x0098091f not found
[  642.605651] usb 1-1.4: Control 0x00980920 not found
[  642.605657] usb 1-1.4: Control 0x00980921 not found
[  642.605664] usb 1-1.4: Control 0x00980922 not found
[  642.605670] usb 1-1.4: Control 0x00980923 not found
[  642.605676] usb 1-1.4: Control 0x00980924 not found
[  642.605682] usb 1-1.4: Control 0x00980925 not found
[  642.605689] usb 1-1.4: Control 0x00980926 not found
[  642.605695] usb 1-1.4: Control 0x00980927 not found
[  642.605701] usb 1-1.4: Control 0x00980928 not found
[  642.605708] usb 1-1.4: Control 0x00980929 not found
[  642.605714] usb 1-1.4: Control 0x0098092a not found
[  642.605720] usb 1-1.4: Control 0x08000000 not found
[  642.605807] usb 1-1.4: Control 0x00000000 not found
[  642.605823] usb 1-1.4: Control 0x00980903 not found
[  642.605830] usb 1-1.4: Control 0x00980904 not found
[  642.605836] usb 1-1.4: Control 0x00980905 not found
[  642.605842] usb 1-1.4: Control 0x00980906 not found
[  642.605848] usb 1-1.4: Control 0x00980907 not found
[  642.605854] usb 1-1.4: Control 0x00980908 not found
[  642.605860] usb 1-1.4: Control 0x00980909 not found
[  642.605866] usb 1-1.4: Control 0x0098090a not found
[  642.605872] usb 1-1.4: Control 0x0098090b not found
[  642.605881] usb 1-1.4: Control 0x0098090d not found
[  642.605887] usb 1-1.4: Control 0x0098090e not found
[  642.605893] usb 1-1.4: Control 0x0098090f not found
[  642.605899] usb 1-1.4: Control 0x00980910 not found
[  642.605905] usb 1-1.4: Control 0x00980911 not found
[  642.605911] usb 1-1.4: Control 0x00980912 not found
[  642.605920] usb 1-1.4: Control 0x00980914 not found
[  642.605926] usb 1-1.4: Control 0x00980915 not found
[  642.605932] usb 1-1.4: Control 0x00980916 not found
[  642.605938] usb 1-1.4: Control 0x00980917 not found
[  642.605947] usb 1-1.4: Control 0x00980919 not found
[  642.605962] usb 1-1.4: Control 0x0098091d not found
[  642.605968] usb 1-1.4: Control 0x0098091e not found
[  642.605974] usb 1-1.4: Control 0x0098091f not found
[  642.605980] usb 1-1.4: Control 0x00980920 not found
[  642.605986] usb 1-1.4: Control 0x00980921 not found
[  642.605992] usb 1-1.4: Control 0x00980922 not found
[  642.605999] usb 1-1.4: Control 0x00980923 not found
[  642.606005] usb 1-1.4: Control 0x00980924 not found
[  642.606011] usb 1-1.4: Control 0x00980925 not found
[  642.606017] usb 1-1.4: Control 0x00980926 not found
[  642.606023] usb 1-1.4: Control 0x00980927 not found
[  642.606029] usb 1-1.4: Control 0x00980928 not found
[  642.606035] usb 1-1.4: Control 0x00980929 not found
[  642.606041] usb 1-1.4: Control 0x0098092a not found
[  642.606047] usb 1-1.4: Control 0x08000000 not found
[  642.702275] usb 1-1.4: uvc_v4l2_poll
[  642.702416] usb 1-1.4: uvc_v4l2_poll
[  642.702715] usb 1-1.4: uvc_v4l2_poll
[  642.703002] usb 1-1.4: uvc_v4l2_poll
[  642.703112] usb 1-1.4: Control 2/10 info change len 6
[  642.703340] usb 1-1.4: uvc_v4l2_poll
[  642.703618] usb 1-1.4: uvc_v4l2_poll
[  642.705438] usb 1-1.4: uvc_v4l2_poll
[  642.705831] usb 1-1.4: uvc_v4l2_poll
[  642.707683] usb 1-1.4: uvc_v4l2_poll
[  642.708078] usb 1-1.4: uvc_v4l2_poll
[  642.708397] usb 1-1.4: uvc_v4l2_poll
[  642.708681] usb 1-1.4: uvc_v4l2_poll
[  642.708841] usb 1-1.4: uvc_v4l2_poll
[  642.709132] usb 1-1.4: uvc_v4l2_poll
[  642.711317] usb 1-1.4: uvc_v4l2_poll
[  642.711761] usb 1-1.4: uvc_v4l2_poll
[  642.714197] usb 1-1.4: uvc_v4l2_poll
[  642.714622] usb 1-1.4: uvc_v4l2_poll
[  642.716415] usb 1-1.4: uvc_v4l2_poll
[  642.716806] usb 1-1.4: uvc_v4l2_poll
[  642.718561] usb 1-1.4: uvc_v4l2_poll
[  642.726868] usb 1-1.4: Setting frame interval to 0/0 (4294967295)
[  642.747068] usb 1-1.4: Setting frame interval to 0/1 (0)
[  642.767720] usb 1-1.4: Setting frame interval to 1/0 (4294967295)
[  642.788421] usb 1-1.4: Trying format 0x56595559 (YUYV): 640x480
[  642.788442] usb 1-1.4: Using default frame interval 33333.3 us (30.0 fps)
[  642.808972] usb 1-1.4: Trying format 0xffffffff (\xff\xff\xff\xff):
4294967295x4294967295
[  642.808992] usb 1-1.4: Using default frame interval 200000.0 us (5.0 fps)
[  642.830204] usb 1-1.4: Trying format 0xffffffff (\xff\xff\xff\xff):
4294967295x4294967295
[  642.830228] usb 1-1.4: Using default frame interval 200000.0 us (5.0 fps)
[  642.850304] usb 1-1.4: Trying format 0x56595559 (YUYV): 640x480
[  642.850324] usb 1-1.4: Using default frame interval 33333.3 us (30.0 fps)
[  642.871324] usb 1-1.4: Trying format 0x56595559 (YUYV): 0x0
[  642.871344] usb 1-1.4: Using default frame interval 33333.3 us (30.0 fps)
[  642.891830] usb 1-1.4: Trying format 0x56595559 (YUYV): 640x480
[  642.891850] usb 1-1.4: Using default frame interval 33333.3 us (30.0 fps)
[  642.912799] usb 1-1.4: Trying format 0x56595559 (YUYV): 1x1
[  642.912820] usb 1-1.4: Using default frame interval 33333.3 us (30.0 fps)
[  642.933624] usb 1-1.4: Trying format 0x56595559 (YUYV): 16384x16384
[  642.933645] usb 1-1.4: Using default frame interval 200000.0 us (5.0 fps)
[  642.954142] usb 1-1.4: Trying format 0x56595559 (YUYV): 640x480
[  642.954161] usb 1-1.4: Using default frame interval 33333.3 us (30.0 fps)
[  642.975364] usb 1-1.4: uvc_v4l2_release
[  642.975428] usb 1-1.4: uvc_v4l2_open
[  642.977201] usb 1-1.4: uvc_v4l2_release
[  642.977229] usb 1-1.4: uvc_v4l2_open
[  642.977769] usb 1-1.4: Setting frame interval to 1/1000 (10000)
[  642.999132] usb 1-1.4: uvc_v4l2_release
[  642.999178] usb 1-1.4: uvc_v4l2_open
[  642.999341] usb 1-1.4: uvc_v4l2_release
[  642.999373] usb 1-1.4: uvc_v4l2_open
[  642.999428] usb 1-1.4: Trying format 0x56595559 (YUYV): 640x480
[  642.999442] usb 1-1.4: Using default frame interval 33333.3 us (30.0 fps)
[  643.019814] usb 1-1.4: Setting frame interval to 1/30 (333333)
[  643.040753] usb 1-1.4: uvc_v4l2_release
[  643.040808] usb 1-1.4: uvc_v4l2_open
[  643.040860] usb 1-1.4: uvc_v4l2_release
[  643.040874] usb 1-1.4: uvc_v4l2_open
[  643.040903] usb 1-1.4: Trying format 0x56595559 (YUYV): 640x480
[  643.040912] usb 1-1.4: Using default frame interval 33333.3 us (30.0 fps)
[  643.061785] usb 1-1.4: Setting frame interval to 1/30 (333333)
[  643.082171] usb 1-1.4: uvc_v4l2_release
[  643.082236] usb 1-1.4: uvc_v4l2_open
[  643.082417] usb 1-1.4: uvc_v4l2_release
[  643.082443] usb 1-1.4: uvc_v4l2_release
[  645.416974] usb 1-1.4: Suspending interface 3
[  645.416989] usb 1-1.4: Suspending interface 2

A different camera that has not passed without errors ever:
v4l2-compliance 1.22.1, 64 bits, 64-bit time_t

Compliance test for uvcvideo device /dev/video0:

Driver Info:
Driver name      : uvcvideo
Card type        : SVS RGB USB camera: SVS RGB USB
Bus info         : usb-0000:00:14.0-2
Driver version   : 5.15.0
Capabilities     : 0x84a00001
Video Capture
Metadata Capture
Streaming
Extended Pix Format
Device Capabilities
Device Caps      : 0x04200001
Video Capture
Streaming
Extended Pix Format
Media Driver Info:
Driver name      : uvcvideo
Model            : SVS RGB USB camera: SVS RGB USB
Serial           : V20210818SWS2093
Bus info         : usb-0000:00:14.0-2
Media version    : 5.15.0
Hardware revision: 0x00000001 (1)
Driver version   : 5.15.0
Interface Info:
ID               : 0x03000002
Type             : V4L Video
Entity Info:
ID               : 0x00000001 (1)
Name             : Video Capture 4
Function         : V4L2 I/O
Flags            : default
Pad 0x01000007   : 0: Sink
 Link 0x02000010: from remote pad 0x100000a of entity 'Extension 3'
(Video Pixel Formatter): Data, Enabled, Immutable

Required ioctls:
test MC information (see 'Media Driver Info' above): OK
test VIDIOC_QUERYCAP: OK
test invalid ioctls: OK

Allow for multiple opens:
test second /dev/video0 open: OK
test VIDIOC_QUERYCAP: OK
test VIDIOC_G/S_PRIORITY: OK
test for unlimited opens: OK

Debug ioctls:
test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
test VIDIOC_ENUMAUDIO: OK (Not Supported)
test VIDIOC_G/S/ENUMINPUT: OK
test VIDIOC_G/S_AUDIO: OK (Not Supported)
Inputs: 1 Audio Inputs: 0 Tuners: 0

Output ioctls:
test VIDIOC_G/S_MODULATOR: OK (Not Supported)
test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
test VIDIOC_ENUMAUDOUT: OK (Not Supported)
test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
test VIDIOC_G/S_AUDOUT: OK (Not Supported)
Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls (Input 0):
info: checking v4l2_query_ext_ctrl of control 'User Controls' (0x00980001)
info: checking v4l2_query_ext_ctrl of control 'Brightness' (0x00980900)
info: checking v4l2_query_ext_ctrl of control 'Contrast' (0x00980901)
info: checking v4l2_query_ext_ctrl of control 'Saturation' (0x00980902)
info: checking v4l2_query_ext_ctrl of control 'White Balance,
Automatic' (0x0098090c)
info: checking v4l2_query_ext_ctrl of control 'Gamma' (0x00980910)
info: checking v4l2_query_ext_ctrl of control 'Gain' (0x00980913)
info: checking v4l2_query_ext_ctrl of control 'Power Line Frequency'
(0x00980918)
info: checking v4l2_query_ext_ctrl of control 'White Balance
Temperature' (0x0098091a)
info: checking v4l2_query_ext_ctrl of control 'Sharpness' (0x0098091b)
info: checking v4l2_query_ext_ctrl of control 'Camera Controls' (0x009a0001)
info: checking v4l2_query_ext_ctrl of control 'Auto Exposure' (0x009a0901)
info: checking v4l2_query_ext_ctrl of control 'Exposure Time,
Absolute' (0x009a0902)
info: checking v4l2_query_ext_ctrl of control 'Exposure, Dynamic
Framerate' (0x009a0903)
info: checking v4l2_query_ext_ctrl of control 'Brightness' (0x00980900)
info: checking v4l2_query_ext_ctrl of control 'Contrast' (0x00980901)
info: checking v4l2_query_ext_ctrl of control 'Saturation' (0x00980902)
info: checking v4l2_query_ext_ctrl of control 'White Balance,
Automatic' (0x0098090c)
info: checking v4l2_query_ext_ctrl of control 'Gamma' (0x00980910)
info: checking v4l2_query_ext_ctrl of control 'Gain' (0x00980913)
info: checking v4l2_query_ext_ctrl of control 'Power Line Frequency'
(0x00980918)
info: checking v4l2_query_ext_ctrl of control 'White Balance
Temperature' (0x0098091a)
info: checking v4l2_query_ext_ctrl of control 'Sharpness' (0x0098091b)
test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
test VIDIOC_QUERYCTRL: OK
info: checking control 'User Controls' (0x00980001)
info: checking control 'Brightness' (0x00980900)
info: checking control 'Contrast' (0x00980901)
info: checking control 'Saturation' (0x00980902)
info: checking control 'White Balance, Automatic' (0x0098090c)
info: checking control 'Gamma' (0x00980910)
info: checking control 'Gain' (0x00980913)
info: checking control 'Power Line Frequency' (0x00980918)
info: checking control 'White Balance Temperature' (0x0098091a)
fail: v4l2-test-controls.cpp(489): s_ctrl returned an error (13)
test VIDIOC_G/S_CTRL: FAIL
info: checking extended control 'User Controls' (0x00980001)
info: checking extended control 'Brightness' (0x00980900)
info: checking extended control 'Contrast' (0x00980901)
info: checking extended control 'Saturation' (0x00980902)
info: checking extended control 'White Balance, Automatic' (0x0098090c)
info: checking extended control 'Gamma' (0x00980910)
info: checking extended control 'Gain' (0x00980913)
info: checking extended control 'Power Line Frequency' (0x00980918)
info: checking extended control 'White Balance Temperature' (0x0098091a)
fail: v4l2-test-controls.cpp(736): s_ext_ctrls returned an error (13)
test VIDIOC_G/S/TRY_EXT_CTRLS: FAIL
info: checking control event 'User Controls' (0x00980001)
info: checking control event 'Brightness' (0x00980900)
info: checking control event 'Contrast' (0x00980901)
info: checking control event 'Saturation' (0x00980902)
info: checking control event 'White Balance, Automatic' (0x0098090c)
info: checking control event 'Gamma' (0x00980910)
info: checking control event 'Gain' (0x00980913)
info: checking control event 'Power Line Frequency' (0x00980918)
info: checking control event 'White Balance Temperature' (0x0098091a)
info: checking control event 'Sharpness' (0x0098091b)
info: checking control event 'Camera Controls' (0x009a0001)
info: checking control event 'Auto Exposure' (0x009a0901)
info: checking control event 'Exposure Time, Absolute' (0x009a0902)
info: checking control event 'Exposure, Dynamic Framerate' (0x009a0903)
test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
Standard Controls: 14 Private Controls: 0

Format ioctls (Input 0):
info: found 8 frameintervals for pixel format 47504a4d (MJPG) and size 640x480
info: found 4 frameintervals for pixel format 47504a4d (MJPG) and size 1920x1080
info: found 4 frameintervals for pixel format 47504a4d (MJPG) and size 1280x1024
info: found 4 frameintervals for pixel format 47504a4d (MJPG) and size 1280x800
info: found 4 frameintervals for pixel format 47504a4d (MJPG) and size 1280x720
info: found 4 frameintervals for pixel format 47504a4d (MJPG) and size 1024x768
info: found 4 frameintervals for pixel format 47504a4d (MJPG) and size 800x600
info: found 4 frameintervals for pixel format 47504a4d (MJPG) and size 800x500
info: found 4 frameintervals for pixel format 47504a4d (MJPG) and size 640x400
info: found 8 frameintervals for pixel format 47504a4d (MJPG) and size 640x480
info: found 10 framesizes for pixel format 47504a4d (MJPG)
info: found 8 frameintervals for pixel format 34363248 (H264) and size 640x480
info: found 4 frameintervals for pixel format 34363248 (H264) and size 1920x1080
info: found 4 frameintervals for pixel format 34363248 (H264) and size 1280x1024
info: found 4 frameintervals for pixel format 34363248 (H264) and size 1280x800
info: found 4 frameintervals for pixel format 34363248 (H264) and size 1280x720
info: found 4 frameintervals for pixel format 34363248 (H264) and size 1024x768
info: found 4 frameintervals for pixel format 34363248 (H264) and size 800x600
info: found 4 frameintervals for pixel format 34363248 (H264) and size 800x500
info: found 4 frameintervals for pixel format 34363248 (H264) and size 640x400
info: found 8 frameintervals for pixel format 34363248 (H264) and size 640x480
info: found 10 framesizes for pixel format 34363248 (H264)
info: found 8 frameintervals for pixel format 56595559 (YUYV) and size 640x480
info: found 4 frameintervals for pixel format 56595559 (YUYV) and size 1920x1080
info: found 4 frameintervals for pixel format 56595559 (YUYV) and size 1280x1024
info: found 4 frameintervals for pixel format 56595559 (YUYV) and size 1280x800
info: found 4 frameintervals for pixel format 56595559 (YUYV) and size 1280x720
info: found 4 frameintervals for pixel format 56595559 (YUYV) and size 1024x768
info: found 4 frameintervals for pixel format 56595559 (YUYV) and size 800x600
info: found 4 frameintervals for pixel format 56595559 (YUYV) and size 800x500
info: found 4 frameintervals for pixel format 56595559 (YUYV) and size 640x400
info: found 8 frameintervals for pixel format 56595559 (YUYV) and size 640x480
info: found 10 framesizes for pixel format 56595559 (YUYV)
info: found 3 formats for buftype 1
test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
test VIDIOC_G/S_PARM: OK
test VIDIOC_G_FBUF: OK (Not Supported)
fail: v4l2-test-formats.cpp(358): !colorspace
fail: v4l2-test-formats.cpp(465): testColorspace(!node->is_io_mc,
pix.pixelformat, pix.colorspace, pix.ycbcr_enc, pix.quantization)
test VIDIOC_G_FMT: FAIL
fail: v4l2-test-formats.cpp(358): !colorspace
fail: v4l2-test-formats.cpp(465): testColorspace(!node->is_io_mc,
pix.pixelformat, pix.colorspace, pix.ycbcr_enc, pix.quantization)
test VIDIOC_TRY_FMT: FAIL
fail: v4l2-test-formats.cpp(358): !colorspace
fail: v4l2-test-formats.cpp(465): testColorspace(!node->is_io_mc,
pix.pixelformat, pix.colorspace, pix.ycbcr_enc, pix.quantization)
test VIDIOC_S_FMT: FAIL
test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
test Cropping: OK (Not Supported)
test Composing: OK (Not Supported)
test Scaling: OK (Not Supported)

Codec ioctls (Input 0):
test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
test VIDIOC_G_ENC_INDEX: OK (Not Supported)
test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 0):
info: test buftype Video Capture
test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
test VIDIOC_EXPBUF: OK
test Requests: OK (Not Supported)

Total for uvcvideo device /dev/video0: 46, Succeeded: 41, Failed: 5, Warnings: 0
[  124.598214] usb 1-2: uvc_v4l2_open
[  124.693913] usb 1-2: Resuming interface 0
[  124.693927] usb 1-2: Resuming interface 1
[  124.695192] usb 1-2: uvc_v4l2_open
[  124.695378] usb 1-2: uvc_v4l2_open
[  124.695400] usb 1-2: uvc_v4l2_open
[  124.695419] usb 1-2: uvc_v4l2_open
[  124.695437] usb 1-2: uvc_v4l2_open
[  124.695451] usb 1-2: uvc_v4l2_open
[  124.695463] usb 1-2: uvc_v4l2_open
[  124.695497] usb 1-2: uvc_v4l2_open
[  124.695514] usb 1-2: uvc_v4l2_open
[  124.695529] usb 1-2: uvc_v4l2_open
[  124.695540] usb 1-2: uvc_v4l2_open
[  124.695551] usb 1-2: uvc_v4l2_open
[  124.695562] usb 1-2: uvc_v4l2_open
[  124.695573] usb 1-2: uvc_v4l2_open
[  124.695584] usb 1-2: uvc_v4l2_open
[  124.695596] usb 1-2: uvc_v4l2_open
[  124.695607] usb 1-2: uvc_v4l2_open
[  124.695619] usb 1-2: uvc_v4l2_open
[  124.695631] usb 1-2: uvc_v4l2_open
[  124.695642] usb 1-2: uvc_v4l2_open
[  124.695653] usb 1-2: uvc_v4l2_open
[  124.695665] usb 1-2: uvc_v4l2_open
[  124.695676] usb 1-2: uvc_v4l2_open
[  124.695686] usb 1-2: uvc_v4l2_open
[  124.695697] usb 1-2: uvc_v4l2_open
[  124.695708] usb 1-2: uvc_v4l2_open
[  124.695719] usb 1-2: uvc_v4l2_open
[  124.695730] usb 1-2: uvc_v4l2_open
[  124.695740] usb 1-2: uvc_v4l2_open
[  124.695751] usb 1-2: uvc_v4l2_open
[  124.695762] usb 1-2: uvc_v4l2_open
[  124.695773] usb 1-2: uvc_v4l2_open
[  124.695784] usb 1-2: uvc_v4l2_open
[  124.695796] usb 1-2: uvc_v4l2_open
[  124.695807] usb 1-2: uvc_v4l2_open
[  124.695817] usb 1-2: uvc_v4l2_open
[  124.695828] usb 1-2: uvc_v4l2_open
[  124.695839] usb 1-2: uvc_v4l2_open
[  124.695851] usb 1-2: uvc_v4l2_open
[  124.695862] usb 1-2: uvc_v4l2_open
[  124.695873] usb 1-2: uvc_v4l2_open
[  124.695884] usb 1-2: uvc_v4l2_open
[  124.695899] usb 1-2: uvc_v4l2_open
[  124.695909] usb 1-2: uvc_v4l2_open
[  124.695920] usb 1-2: uvc_v4l2_open
[  124.695931] usb 1-2: uvc_v4l2_open
[  124.695942] usb 1-2: uvc_v4l2_open
[  124.695953] usb 1-2: uvc_v4l2_open
[  124.695963] usb 1-2: uvc_v4l2_open
[  124.695974] usb 1-2: uvc_v4l2_open
[  124.695985] usb 1-2: uvc_v4l2_open
[  124.695997] usb 1-2: uvc_v4l2_open
[  124.696008] usb 1-2: uvc_v4l2_open
[  124.696018] usb 1-2: uvc_v4l2_open
[  124.696030] usb 1-2: uvc_v4l2_open
[  124.696041] usb 1-2: uvc_v4l2_open
[  124.696052] usb 1-2: uvc_v4l2_open
[  124.696062] usb 1-2: uvc_v4l2_open
[  124.696073] usb 1-2: uvc_v4l2_open
[  124.696087] usb 1-2: uvc_v4l2_open
[  124.696099] usb 1-2: uvc_v4l2_open
[  124.696109] usb 1-2: uvc_v4l2_open
[  124.696120] usb 1-2: uvc_v4l2_open
[  124.696131] usb 1-2: uvc_v4l2_open
[  124.696141] usb 1-2: uvc_v4l2_open
[  124.696152] usb 1-2: uvc_v4l2_open
[  124.696163] usb 1-2: uvc_v4l2_open
[  124.696174] usb 1-2: uvc_v4l2_open
[  124.696185] usb 1-2: uvc_v4l2_open
[  124.696196] usb 1-2: uvc_v4l2_open
[  124.696207] usb 1-2: uvc_v4l2_open
[  124.696218] usb 1-2: uvc_v4l2_open
[  124.696228] usb 1-2: uvc_v4l2_open
[  124.696239] usb 1-2: uvc_v4l2_open
[  124.696250] usb 1-2: uvc_v4l2_open
[  124.696261] usb 1-2: uvc_v4l2_open
[  124.696272] usb 1-2: uvc_v4l2_open
[  124.696283] usb 1-2: uvc_v4l2_open
[  124.696294] usb 1-2: uvc_v4l2_open
[  124.696305] usb 1-2: uvc_v4l2_open
[  124.696315] usb 1-2: uvc_v4l2_open
[  124.696327] usb 1-2: uvc_v4l2_open
[  124.696338] usb 1-2: uvc_v4l2_open
[  124.696349] usb 1-2: uvc_v4l2_open
[  124.696360] usb 1-2: uvc_v4l2_open
[  124.696371] usb 1-2: uvc_v4l2_open
[  124.696382] usb 1-2: uvc_v4l2_open
[  124.696393] usb 1-2: uvc_v4l2_open
[  124.696403] usb 1-2: uvc_v4l2_open
[  124.696414] usb 1-2: uvc_v4l2_open
[  124.696425] usb 1-2: uvc_v4l2_open
[  124.696435] usb 1-2: uvc_v4l2_open
[  124.696446] usb 1-2: uvc_v4l2_open
[  124.696457] usb 1-2: uvc_v4l2_open
[  124.696480] usb 1-2: uvc_v4l2_open
[  124.696496] usb 1-2: uvc_v4l2_open
[  124.696507] usb 1-2: uvc_v4l2_open
[  124.696518] usb 1-2: uvc_v4l2_open
[  124.696531] usb 1-2: uvc_v4l2_open
[  124.696541] usb 1-2: uvc_v4l2_open
[  124.696552] usb 1-2: uvc_v4l2_open
[  124.696577] usb 1-2: uvc_v4l2_release
[  124.696595] usb 1-2: uvc_v4l2_release
[  124.696608] usb 1-2: uvc_v4l2_release
[  124.696621] usb 1-2: uvc_v4l2_release
[  124.696636] usb 1-2: uvc_v4l2_release
[  124.696649] usb 1-2: uvc_v4l2_release
[  124.696666] usb 1-2: uvc_v4l2_release
[  124.696680] usb 1-2: uvc_v4l2_release
[  124.696695] usb 1-2: uvc_v4l2_release
[  124.696708] usb 1-2: uvc_v4l2_release
[  124.696723] usb 1-2: uvc_v4l2_release
[  124.696736] usb 1-2: uvc_v4l2_release
[  124.696752] usb 1-2: uvc_v4l2_release
[  124.696765] usb 1-2: uvc_v4l2_release
[  124.696779] usb 1-2: uvc_v4l2_release
[  124.696793] usb 1-2: uvc_v4l2_release
[  124.696806] usb 1-2: uvc_v4l2_release
[  124.696820] usb 1-2: uvc_v4l2_release
[  124.696834] usb 1-2: uvc_v4l2_release
[  124.696850] usb 1-2: uvc_v4l2_release
[  124.696863] usb 1-2: uvc_v4l2_release
[  124.696876] usb 1-2: uvc_v4l2_release
[  124.696892] usb 1-2: uvc_v4l2_release
[  124.696905] usb 1-2: uvc_v4l2_release
[  124.696919] usb 1-2: uvc_v4l2_release
[  124.696933] usb 1-2: uvc_v4l2_release
[  124.696949] usb 1-2: uvc_v4l2_release
[  124.696962] usb 1-2: uvc_v4l2_release
[  124.696975] usb 1-2: uvc_v4l2_release
[  124.696990] usb 1-2: uvc_v4l2_release
[  124.697004] usb 1-2: uvc_v4l2_release
[  124.697018] usb 1-2: uvc_v4l2_release
[  124.697032] usb 1-2: uvc_v4l2_release
[  124.697047] usb 1-2: uvc_v4l2_release
[  124.697061] usb 1-2: uvc_v4l2_release
[  124.697076] usb 1-2: uvc_v4l2_release
[  124.697089] usb 1-2: uvc_v4l2_release
[  124.697105] usb 1-2: uvc_v4l2_release
[  124.697118] usb 1-2: uvc_v4l2_release
[  124.697132] usb 1-2: uvc_v4l2_release
[  124.697146] usb 1-2: uvc_v4l2_release
[  124.697163] usb 1-2: uvc_v4l2_release
[  124.697177] usb 1-2: uvc_v4l2_release
[  124.697192] usb 1-2: uvc_v4l2_release
[  124.697206] usb 1-2: uvc_v4l2_release
[  124.697221] usb 1-2: uvc_v4l2_release
[  124.697233] usb 1-2: uvc_v4l2_release
[  124.697246] usb 1-2: uvc_v4l2_release
[  124.697261] usb 1-2: uvc_v4l2_release
[  124.697274] usb 1-2: uvc_v4l2_release
[  124.697288] usb 1-2: uvc_v4l2_release
[  124.697301] usb 1-2: uvc_v4l2_release
[  124.697317] usb 1-2: uvc_v4l2_release
[  124.697330] usb 1-2: uvc_v4l2_release
[  124.697345] usb 1-2: uvc_v4l2_release
[  124.697358] usb 1-2: uvc_v4l2_release
[  124.697373] usb 1-2: uvc_v4l2_release
[  124.697386] usb 1-2: uvc_v4l2_release
[  124.697401] usb 1-2: uvc_v4l2_release
[  124.697414] usb 1-2: uvc_v4l2_release
[  124.697429] usb 1-2: uvc_v4l2_release
[  124.697442] usb 1-2: uvc_v4l2_release
[  124.697457] usb 1-2: uvc_v4l2_release
[  124.697490] usb 1-2: uvc_v4l2_release
[  124.697504] usb 1-2: uvc_v4l2_release
[  124.697520] usb 1-2: uvc_v4l2_release
[  124.697534] usb 1-2: uvc_v4l2_release
[  124.697548] usb 1-2: uvc_v4l2_release
[  124.697562] usb 1-2: uvc_v4l2_release
[  124.697576] usb 1-2: uvc_v4l2_release
[  124.697590] usb 1-2: uvc_v4l2_release
[  124.697605] usb 1-2: uvc_v4l2_release
[  124.697618] usb 1-2: uvc_v4l2_release
[  124.697634] usb 1-2: uvc_v4l2_release
[  124.697647] usb 1-2: uvc_v4l2_release
[  124.697661] usb 1-2: uvc_v4l2_release
[  124.697675] usb 1-2: uvc_v4l2_release
[  124.697691] usb 1-2: uvc_v4l2_release
[  124.697704] usb 1-2: uvc_v4l2_release
[  124.697719] usb 1-2: uvc_v4l2_release
[  124.697733] usb 1-2: uvc_v4l2_release
[  124.697747] usb 1-2: uvc_v4l2_release
[  124.697761] usb 1-2: uvc_v4l2_release
[  124.697777] usb 1-2: uvc_v4l2_release
[  124.697790] usb 1-2: uvc_v4l2_release
[  124.697805] usb 1-2: uvc_v4l2_release
[  124.697819] usb 1-2: uvc_v4l2_release
[  124.697834] usb 1-2: uvc_v4l2_release
[  124.697848] usb 1-2: uvc_v4l2_release
[  124.697862] usb 1-2: uvc_v4l2_release
[  124.697876] usb 1-2: uvc_v4l2_release
[  124.697891] usb 1-2: uvc_v4l2_release
[  124.697905] usb 1-2: uvc_v4l2_release
[  124.697919] usb 1-2: uvc_v4l2_release
[  124.697933] usb 1-2: uvc_v4l2_release
[  124.697948] usb 1-2: uvc_v4l2_release
[  124.697961] usb 1-2: uvc_v4l2_release
[  124.697976] usb 1-2: uvc_v4l2_release
[  124.697990] usb 1-2: uvc_v4l2_release
[  124.698005] usb 1-2: uvc_v4l2_release
[  124.699147] usb 1-2: Control 0x00980001 not found
[  124.699486] usb 1-2: Control 0x009a0001 not found
[  124.699687] usb 1-2: Control 0x00000000 not found
[  124.699781] usb 1-2: Control 0x00980903 not found
[  124.699791] usb 1-2: Control 0x00980904 not found
[  124.699799] usb 1-2: Control 0x00980905 not found
[  124.699807] usb 1-2: Control 0x00980906 not found
[  124.699815] usb 1-2: Control 0x00980907 not found
[  124.699823] usb 1-2: Control 0x00980908 not found
[  124.699831] usb 1-2: Control 0x00980909 not found
[  124.699839] usb 1-2: Control 0x0098090a not found
[  124.699847] usb 1-2: Control 0x0098090b not found
[  124.699883] usb 1-2: Control 0x0098090d not found
[  124.699893] usb 1-2: Control 0x0098090e not found
[  124.699901] usb 1-2: Control 0x0098090f not found
[  124.699937] usb 1-2: Control 0x00980911 not found
[  124.699946] usb 1-2: Control 0x00980912 not found
[  124.699981] usb 1-2: Control 0x00980914 not found
[  124.699990] usb 1-2: Control 0x00980915 not found
[  124.699998] usb 1-2: Control 0x00980916 not found
[  124.700006] usb 1-2: Control 0x00980917 not found
[  124.700055] usb 1-2: Control 0x00980919 not found
[  124.700118] usb 1-2: Control 0x0098091c not found
[  124.700127] usb 1-2: Control 0x0098091d not found
[  124.700135] usb 1-2: Control 0x0098091e not found
[  124.700143] usb 1-2: Control 0x0098091f not found
[  124.700151] usb 1-2: Control 0x00980920 not found
[  124.700159] usb 1-2: Control 0x00980921 not found
[  124.700167] usb 1-2: Control 0x00980922 not found
[  124.700175] usb 1-2: Control 0x00980923 not found
[  124.700183] usb 1-2: Control 0x00980924 not found
[  124.700191] usb 1-2: Control 0x00980925 not found
[  124.700199] usb 1-2: Control 0x00980926 not found
[  124.700207] usb 1-2: Control 0x00980927 not found
[  124.700215] usb 1-2: Control 0x00980928 not found
[  124.700223] usb 1-2: Control 0x00980929 not found
[  124.700231] usb 1-2: Control 0x0098092a not found
[  124.700239] usb 1-2: Control 0x08000000 not found
[  124.700337] usb 1-2: Control 0x00000000 not found
[  124.700360] usb 1-2: Control 0x00980903 not found
[  124.700368] usb 1-2: Control 0x00980904 not found
[  124.700376] usb 1-2: Control 0x00980905 not found
[  124.700384] usb 1-2: Control 0x00980906 not found
[  124.700391] usb 1-2: Control 0x00980907 not found
[  124.700400] usb 1-2: Control 0x00980908 not found
[  124.700407] usb 1-2: Control 0x00980909 not found
[  124.700415] usb 1-2: Control 0x0098090a not found
[  124.700423] usb 1-2: Control 0x0098090b not found
[  124.700435] usb 1-2: Control 0x0098090d not found
[  124.700443] usb 1-2: Control 0x0098090e not found
[  124.700450] usb 1-2: Control 0x0098090f not found
[  124.700463] usb 1-2: Control 0x00980911 not found
[  124.700486] usb 1-2: Control 0x00980912 not found
[  124.700500] usb 1-2: Control 0x00980914 not found
[  124.700508] usb 1-2: Control 0x00980915 not found
[  124.700516] usb 1-2: Control 0x00980916 not found
[  124.700523] usb 1-2: Control 0x00980917 not found
[  124.700535] usb 1-2: Control 0x00980919 not found
[  124.700552] usb 1-2: Control 0x0098091c not found
[  124.700560] usb 1-2: Control 0x0098091d not found
[  124.700568] usb 1-2: Control 0x0098091e not found
[  124.700575] usb 1-2: Control 0x0098091f not found
[  124.700583] usb 1-2: Control 0x00980920 not found
[  124.700591] usb 1-2: Control 0x00980921 not found
[  124.700599] usb 1-2: Control 0x00980922 not found
[  124.700606] usb 1-2: Control 0x00980923 not found
[  124.700614] usb 1-2: Control 0x00980924 not found
[  124.700621] usb 1-2: Control 0x00980925 not found
[  124.700629] usb 1-2: Control 0x00980926 not found
[  124.700637] usb 1-2: Control 0x00980927 not found
[  124.700644] usb 1-2: Control 0x00980928 not found
[  124.700652] usb 1-2: Control 0x00980929 not found
[  124.700659] usb 1-2: Control 0x0098092a not found
[  124.700667] usb 1-2: Control 0x08000000 not found
[  124.706304] usb 1-2: uvc_v4l2_poll
[  124.706461] usb 1-2: uvc_v4l2_poll
[  124.706526] usb 1-2: uvc_v4l2_poll
[  124.706572] usb 1-2: uvc_v4l2_poll
[  124.706613] usb 1-2: uvc_v4l2_poll
[  124.706654] usb 1-2: uvc_v4l2_poll
[  124.706694] usb 1-2: uvc_v4l2_poll
[  124.706735] usb 1-2: uvc_v4l2_poll
[  124.706775] usb 1-2: uvc_v4l2_poll
[  124.706905] usb 1-2: uvc_v4l2_poll
[  124.706947] usb 1-2: uvc_v4l2_poll
[  124.706985] usb 1-2: uvc_v4l2_poll
[  124.707143] usb 1-2: uvc_v4l2_poll
[  124.707183] usb 1-2: uvc_v4l2_poll
[  124.707309] usb 1-2: uvc_v4l2_poll
[  124.707352] usb 1-2: uvc_v4l2_poll
[  124.709008] usb 1-2: Setting frame interval to 0/0 (4294967295)
[  124.709424] usb 1-2: Setting frame interval to 0/1 (0)
[  124.709856] usb 1-2: Setting frame interval to 1/0 (4294967295)
[  124.710572] usb 1-2: Trying format 0x47504a4d (MJPG): 640x480
[  124.710583] usb 1-2: Using default frame interval 33333.3 us (30.0 fps)
[  124.711081] usb 1-2: Trying format 0xffffffff (\xff\xff\xff\xff):
4294967295x4294967295
[  124.711095] usb 1-2: Using default frame interval 33333.3 us (30.0 fps)
[  124.711676] usb 1-2: Trying format 0x47504a4d (MJPG): 1x1
[  124.711685] usb 1-2: Using default frame interval 33333.3 us (30.0 fps)
[  124.712123] usb 1-2: Trying format 0x47504a4d (MJPG): 16384x16384
[  124.712131] usb 1-2: Using default frame interval 33333.3 us (30.0 fps)
[  124.712568] usb 1-2: Trying format 0x47504a4d (MJPG): 1920x1080
[  124.712576] usb 1-2: Using default frame interval 33333.3 us (30.0 fps)
[  124.713170] usb 1-2: uvc_v4l2_release
[  124.713206] usb 1-2: uvc_v4l2_open
[  124.722494] usb 1-2: uvc_v4l2_release
[  124.722528] usb 1-2: uvc_v4l2_open
[  124.725391] usb 1-2: Setting frame interval to 1/1000 (10000)
[  124.725946] usb 1-2: uvc_v4l2_release
[  124.725961] usb 1-2: uvc_v4l2_open
[  124.725998] usb 1-2: uvc_v4l2_release
[  124.726009] usb 1-2: uvc_v4l2_open
[  124.726034] usb 1-2: Trying format 0x47504a4d (MJPG): 640x480
[  124.726040] usb 1-2: Using default frame interval 33333.3 us (30.0 fps)
[  124.726416] usb 1-2: Setting frame interval to 1/30 (333333)
[  124.726781] usb 1-2: uvc_v4l2_release
[  124.726794] usb 1-2: uvc_v4l2_open
[  124.726818] usb 1-2: uvc_v4l2_release
[  124.726829] usb 1-2: uvc_v4l2_open
[  124.726849] usb 1-2: Trying format 0x47504a4d (MJPG): 640x480
[  124.726853] usb 1-2: Using default frame interval 33333.3 us (30.0 fps)
[  124.727215] usb 1-2: Setting frame interval to 1/30 (333333)
[  124.727571] usb 1-2: uvc_v4l2_release
[  124.727583] usb 1-2: uvc_v4l2_open
[  124.727618] usb 1-2: uvc_v4l2_release
[  124.727627] usb 1-2: uvc_v4l2_release
[  126.780964] usb 1-2: Suspending interface 1
[  126.780978] usb 1-2: Suspending interface 0

On Thu, Nov 11, 2021 at 1:32 PM Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> This patchset contains the fixes for the comments on "v10 of Fix
> v4l2-compliance errors series". In particular to the patches
>
> -uvcvideo: uvc_ctrl_is_accessible: check for INACTIVE
> -uvcvideo: improve error handling in uvc_query_ctrl()
>
>
> Hans Verkuil (2):
>   media: uvcvideo: uvc_ctrl_is_accessible: check for INACTIVE
>   media: uvcvideo: improve error logging in uvc_query_ctrl()
>
> Ricardo Ribalda (2):
>   media: uvcvideo: Return -EACCES for Wrong state error
>   media: uvcvideo: Do not return positive errors in uvc_query_ctrl()
>
>  drivers/media/usb/uvc/uvc_ctrl.c  | 47 ++++++++++++++++++++++++++++++-
>  drivers/media/usb/uvc/uvc_v4l2.c  |  4 +--
>  drivers/media/usb/uvc/uvc_video.c | 15 +++++-----
>  drivers/media/usb/uvc/uvcvideo.h  |  3 +-
>  4 files changed, 58 insertions(+), 11 deletions(-)
>
> --
> 2.33.0.153.gba50c8fa24-goog
>
>
