Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 427CC754633
	for <lists+linux-media@lfdr.de>; Sat, 15 Jul 2023 04:16:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229675AbjGOCQ1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Jul 2023 22:16:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbjGOCQZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Jul 2023 22:16:25 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DA452D68
        for <linux-media@vger.kernel.org>; Fri, 14 Jul 2023 19:16:23 -0700 (PDT)
Received: from db550.. (node-1w7jr9st5p2esmclet71ntnwp.ipv6.telus.net [IPv6:2001:569:beb1:1500:6f9d:3a5c:4d25:e949])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 53C71660702A;
        Sat, 15 Jul 2023 03:16:20 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1689387381;
        bh=NOKSDADwzLZi7Rnjsjv7gZSMvyWIPv6URB3krreMrJU=;
        h=From:To:Cc:Subject:Date:From;
        b=QzBW7WTpnAAqrrMMpi+isSxTOCXA3eZkJNlKntBqrBVbyFxAYCwV4I87hp1+ccNEw
         WNuBbzb9jzZtcniBUpkomAUleNI3/74CBKWGfmTXaAIR7eBT4NBrtCDGaDfQlMNfnb
         o02kFWaN8yCZC4a4DVATH/AaJWbaP1nkvWDuJqyIMuM8j2oIsACD/dcucKqv6fnk8i
         4rKYkGvLRKDHFM3Rn9jFiSCsWaIB+xmpcjaIaOYDVJHFt6dkx14P4TncRMzxQNaYDT
         /G4El1pgHZAPFC6LD4vErCGlaxX4Ak8d/gSgrytLqPMrXwK9qnXpsSy66yUP+7K79l
         kFOOIyRvm41fg==
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl, deborahbrouwer3563@gmail.com,
        Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH v3 00/13] media: bttv: convert to vb2
Date:   Fri, 14 Jul 2023 19:15:56 -0700
Message-Id: <cover.1689379982.git.deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi - Here is v3 of the vb1 to vb2 conversion.

I tested it with two cards:
Leadtek WinFast TV 2000 (has video, vbi and radio)
and Hauppauge WinTV (just video and vbi).

Changes since v2:
All the patches are the same except in the main
"media-bttv-convert-to-vb2" patch:
- stop dropping frames when video/vbi starts
after the other one has already started;
- assign buffer sequence numbers using the field
change bit in the interrupt status register so
that dropped frames are reflected in the sequence
numbers;
- stop setting the buffer's field when returning
it to userspace because this is redundant;
- remove the last four lines in interlaced,
sequential top/bottom, and alternating buffers
to prevent long latency and frame drops
(this is instead of just enabling the existing
VCR hack by default);
- fix g_fmt so that it returns "alternate"
instead of top/bottom for V4L2_FIELD_ALTERNATE;
- add some macros for risc and dma values to try
to make the code easier to read;

An issue that could still be improved is the
dropped frames that occur if you stop video or
vbi while the other one is still streaming. This
happens because vb2_wait_for_all_buffers()
waits for both video and vbi buffers and
temporarily stops queuing buffers for the stream
that is still running. I did try, alternatively,
to stop a stream manually while keeping the other
one running which solved the dropped frames issue
but introduced a bunch of page faults and other
bugs that were worse.

Changes since v1:
- revised commit messages in patches 04/13 and 05/13
to clearly explain treatment of format/width/height and
certain vbi fields

- In patch "media: bttv: refactor bttv_set_dma()":
  - drop superfluous parentheses
  - rename the argument 'override' as
 'start_capture' to be more descriptive of its
 function.

- In patch "media: bttv: convert to vb2":
- use BT848_CAP_CTL_* when calling bttv_set_dma()
- fix compiler warning that vb2_queue may be
 uninitialized
- fix vbi sequence counter to avoid incrementing it twice
 if both video and vbi are streaming

v4l2-compliance results:

v4l2-compliance 1.25.0-5073, 64 bits, 64-bit time_t
v4l2-compliance SHA: 16e70e28584c 2023-06-22 09:47:27

Compliance test for bttv device /dev/video0:

Driver Info:
  Driver name      : bttv
  Card type        : BT878 video (Leadtek WinFast 20
  Bus info         : PCI:0000:06:00.0
  Driver version   : 6.4.0
  Capabilities     : 0x85250011
    Video Capture
    VBI Capture
    Tuner
    Radio
    Read/Write
    Streaming
    Extended Pix Format
    Device Capabilities
  Device Caps      : 0x05210001
    Video Capture
    Tuner
    Read/Write
    Streaming
    Extended Pix Format

Required ioctls:
  test VIDIOC_QUERYCAP: OK
  test invalid ioctls: OK

Allow for multiple opens:
  test second /dev/video0 open: OK
  test VIDIOC_QUERYCAP: OK
  test VIDIOC_G/S_PRIORITY: OK
  test for unlimited opens: OK

Debug ioctls:
  test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
  test VIDIOC_LOG_STATUS: OK

Input ioctls:
  test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK
  test VIDIOC_G/S_FREQUENCY: OK
  test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
  test VIDIOC_ENUMAUDIO: OK (Not Supported)
  test VIDIOC_G/S/ENUMINPUT: OK
  test VIDIOC_G/S_AUDIO: OK (Not Supported)
  Inputs: 4 Audio Inputs: 0 Tuners: 1

Output ioctls:
  test VIDIOC_G/S_MODULATOR: OK (Not Supported)
  test VIDIOC_G/S_FREQUENCY: OK
  test VIDIOC_ENUMAUDOUT: OK (Not Supported)
  test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
  test VIDIOC_G/S_AUDOUT: OK (Not Supported)
  Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
  test VIDIOC_ENUM/G/S/QUERY_STD: OK
  test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
  test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
  test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls (Input 0):
  test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
  test VIDIOC_QUERYCTRL: OK
  test VIDIOC_G/S_CTRL: OK
  test VIDIOC_G/S/TRY_EXT_CTRLS: OK
  test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
  test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
  Standard Controls: 8 Private Controls: 10

Format ioctls (Input 0):
  test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
  test VIDIOC_G/S_PARM: OK
  test VIDIOC_G_FBUF: OK (Not Supported)
  test VIDIOC_G_FMT: OK
    warn: v4l2-test-formats.cpp(794): TRY_FMT cannot handle an invalid pixelformat.
    warn: v4l2-test-formats.cpp(795): This may or may not be a problem. For more information see:
    warn: v4l2-test-formats.cpp(796): http://www.mail-archive.com/linux-media@vger.kernel.org/msg56550.html
  test VIDIOC_TRY_FMT: OK
    warn: v4l2-test-formats.cpp(1157): S_FMT cannot handle an invalid pixelformat.
    warn: v4l2-test-formats.cpp(1158): This may or may not be a problem. For more information see:
    warn: v4l2-test-formats.cpp(1159): http://www.mail-archive.com/linux-media@vger.kernel.org/msg56550.html
  test VIDIOC_S_FMT: OK
  test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
  test Cropping: OK
  test Composing: OK (Not Supported)
  test Scaling: OK

Codec ioctls (Input 0):
  test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
  test VIDIOC_G_ENC_INDEX: OK (Not Supported)
  test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 0):
  test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
  test VIDIOC_EXPBUF: OK (Not Supported)
  test Requests: OK (Not Supported)

Control ioctls (Input 1):
  test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
  test VIDIOC_QUERYCTRL: OK
  test VIDIOC_G/S_CTRL: OK
  test VIDIOC_G/S/TRY_EXT_CTRLS: OK
  test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
  test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
  Standard Controls: 8 Private Controls: 10

Format ioctls (Input 1):
  test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
  test VIDIOC_G/S_PARM: OK
  test VIDIOC_G_FBUF: OK (Not Supported)
  test VIDIOC_G_FMT: OK
  test VIDIOC_TRY_FMT: OK
  test VIDIOC_S_FMT: OK
  test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
  test Cropping: OK
  test Composing: OK (Not Supported)
  test Scaling: OK

Codec ioctls (Input 1):
  test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
  test VIDIOC_G_ENC_INDEX: OK (Not Supported)
  test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 1):
  test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
  test VIDIOC_EXPBUF: OK (Not Supported)
  test Requests: OK (Not Supported)

Control ioctls (Input 2):
  test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
  test VIDIOC_QUERYCTRL: OK
  test VIDIOC_G/S_CTRL: OK
  test VIDIOC_G/S/TRY_EXT_CTRLS: OK
  test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
  test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
  Standard Controls: 8 Private Controls: 10

Format ioctls (Input 2):
  test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
  test VIDIOC_G/S_PARM: OK
  test VIDIOC_G_FBUF: OK (Not Supported)
  test VIDIOC_G_FMT: OK
  test VIDIOC_TRY_FMT: OK
  test VIDIOC_S_FMT: OK
  test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
  test Cropping: OK
  test Composing: OK (Not Supported)
  test Scaling: OK

Codec ioctls (Input 2):
  test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
  test VIDIOC_G_ENC_INDEX: OK (Not Supported)
  test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 2):
  test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
  test VIDIOC_EXPBUF: OK (Not Supported)
  test Requests: OK (Not Supported)

Control ioctls (Input 3):
  test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
  test VIDIOC_QUERYCTRL: OK
  test VIDIOC_G/S_CTRL: OK
  test VIDIOC_G/S/TRY_EXT_CTRLS: OK
  test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
  test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
  Standard Controls: 8 Private Controls: 10

Format ioctls (Input 3):
  test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
  test VIDIOC_G/S_PARM: OK
  test VIDIOC_G_FBUF: OK (Not Supported)
  test VIDIOC_G_FMT: OK
  test VIDIOC_TRY_FMT: OK
  test VIDIOC_S_FMT: OK
  test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
  test Cropping: OK
  test Composing: OK (Not Supported)
  test Scaling: OK

Codec ioctls (Input 3):
  test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
  test VIDIOC_G_ENC_INDEX: OK (Not Supported)
  test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 3):
  test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
  test VIDIOC_EXPBUF: OK (Not Supported)
  test Requests: OK (Not Supported)

Total for bttv device /dev/video0: 111, Succeeded: 111, Failed: 0, Warnings: 6

v4l2-compliance 1.25.0-5073, 64 bits, 64-bit time_t
v4l2-compliance SHA: 16e70e28584c 2023-06-22 09:47:27

Compliance test for bttv device /dev/vbi0:

Driver Info:
  Driver name      : bttv
  Card type        : BT878 video (Leadtek WinFast 20
  Bus info         : PCI:0000:06:00.0
  Driver version   : 6.4.0
  Capabilities     : 0x85250011
    Video Capture
    VBI Capture
    Tuner
    Radio
    Read/Write
    Streaming
    Extended Pix Format
    Device Capabilities
  Device Caps      : 0x05210010
    VBI Capture
    Tuner
    Read/Write
    Streaming
    Extended Pix Format

Required ioctls:
  test VIDIOC_QUERYCAP: OK
  test invalid ioctls: OK

Allow for multiple opens:
  test second /dev/vbi0 open: OK
  test VIDIOC_QUERYCAP: OK
  test VIDIOC_G/S_PRIORITY: OK
  test for unlimited opens: OK

Debug ioctls:
  test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
  test VIDIOC_LOG_STATUS: OK

Input ioctls:
  test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK
  test VIDIOC_G/S_FREQUENCY: OK
  test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
  test VIDIOC_ENUMAUDIO: OK (Not Supported)
  test VIDIOC_G/S/ENUMINPUT: OK
  test VIDIOC_G/S_AUDIO: OK (Not Supported)
  Inputs: 4 Audio Inputs: 0 Tuners: 1

Output ioctls:
  test VIDIOC_G/S_MODULATOR: OK (Not Supported)
  test VIDIOC_G/S_FREQUENCY: OK
  test VIDIOC_ENUMAUDOUT: OK (Not Supported)
  test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
  test VIDIOC_G/S_AUDOUT: OK (Not Supported)
  Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
  test VIDIOC_ENUM/G/S/QUERY_STD: OK
  test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
  test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
  test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls (Input 0):
  test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
  test VIDIOC_QUERYCTRL: OK
  test VIDIOC_G/S_CTRL: OK
  test VIDIOC_G/S/TRY_EXT_CTRLS: OK
  test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
  test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
  Standard Controls: 8 Private Controls: 10

Format ioctls (Input 0):
  test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
  test VIDIOC_G/S_PARM: OK (Not Supported)
  test VIDIOC_G_FBUF: OK (Not Supported)
  test VIDIOC_G_FMT: OK
  test VIDIOC_TRY_FMT: OK
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
  test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
  test VIDIOC_EXPBUF: OK (Not Supported)
  test Requests: OK (Not Supported)

Control ioctls (Input 1):
  test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
  test VIDIOC_QUERYCTRL: OK
  test VIDIOC_G/S_CTRL: OK
  test VIDIOC_G/S/TRY_EXT_CTRLS: OK
  test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
  test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
  Standard Controls: 8 Private Controls: 10

Format ioctls (Input 1):
  test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
  test VIDIOC_G/S_PARM: OK (Not Supported)
  test VIDIOC_G_FBUF: OK (Not Supported)
  test VIDIOC_G_FMT: OK
  test VIDIOC_TRY_FMT: OK
  test VIDIOC_S_FMT: OK
  test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
  test Cropping: OK (Not Supported)
  test Composing: OK (Not Supported)
  test Scaling: OK (Not Supported)

Codec ioctls (Input 1):
  test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
  test VIDIOC_G_ENC_INDEX: OK (Not Supported)
  test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 1):
  test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
  test VIDIOC_EXPBUF: OK (Not Supported)
  test Requests: OK (Not Supported)

Control ioctls (Input 2):
  test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
  test VIDIOC_QUERYCTRL: OK
  test VIDIOC_G/S_CTRL: OK
  test VIDIOC_G/S/TRY_EXT_CTRLS: OK
  test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
  test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
  Standard Controls: 8 Private Controls: 10

Format ioctls (Input 2):
  test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
  test VIDIOC_G/S_PARM: OK (Not Supported)
  test VIDIOC_G_FBUF: OK (Not Supported)
  test VIDIOC_G_FMT: OK
  test VIDIOC_TRY_FMT: OK
  test VIDIOC_S_FMT: OK
  test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
  test Cropping: OK (Not Supported)
  test Composing: OK (Not Supported)
  test Scaling: OK (Not Supported)

Codec ioctls (Input 2):
  test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
  test VIDIOC_G_ENC_INDEX: OK (Not Supported)
  test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 2):
  test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
  test VIDIOC_EXPBUF: OK (Not Supported)
  test Requests: OK (Not Supported)

Control ioctls (Input 3):
  test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
  test VIDIOC_QUERYCTRL: OK
  test VIDIOC_G/S_CTRL: OK
  test VIDIOC_G/S/TRY_EXT_CTRLS: OK
  test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
  test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
  Standard Controls: 8 Private Controls: 10

Format ioctls (Input 3):
  test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
  test VIDIOC_G/S_PARM: OK (Not Supported)
  test VIDIOC_G_FBUF: OK (Not Supported)
  test VIDIOC_G_FMT: OK
  test VIDIOC_TRY_FMT: OK
  test VIDIOC_S_FMT: OK
  test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
  test Cropping: OK (Not Supported)
  test Composing: OK (Not Supported)
  test Scaling: OK (Not Supported)

Codec ioctls (Input 3):
  test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
  test VIDIOC_G_ENC_INDEX: OK (Not Supported)
  test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 3):
  test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
  test VIDIOC_EXPBUF: OK (Not Supported)
  test Requests: OK (Not Supported)

Total for bttv device /dev/vbi0: 111, Succeeded: 111, Failed: 0, Warnings: 0

v4l2-compliance 1.25.0-5073, 64 bits, 64-bit time_t
v4l2-compliance SHA: 16e70e28584c 2023-06-22 09:47:27

Compliance test for bttv device /dev/radio0:

Driver Info:
  Driver name      : bttv
  Card type        : BT878 video (Leadtek WinFast 20
  Bus info         : PCI:0000:06:00.0
  Driver version   : 6.4.0
  Capabilities     : 0x85250011
    Video Capture
    VBI Capture
    Tuner
    Radio
    Read/Write
    Streaming
    Extended Pix Format
    Device Capabilities
  Device Caps      : 0x00250000
    Tuner
    Radio
    Extended Pix Format

Required ioctls:
  test VIDIOC_QUERYCAP: OK
  test invalid ioctls: OK

Allow for multiple opens:
  test second /dev/radio0 open: OK
  test VIDIOC_QUERYCAP: OK
  test VIDIOC_G/S_PRIORITY: OK
  test for unlimited opens: OK

Debug ioctls:
  test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
  test VIDIOC_LOG_STATUS: OK

Input ioctls:
  test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK
  test VIDIOC_G/S_FREQUENCY: OK
  test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
  test VIDIOC_ENUMAUDIO: OK (Not Supported)
  test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
  test VIDIOC_G/S_AUDIO: OK (Not Supported)
  Inputs: 0 Audio Inputs: 0 Tuners: 1

Output ioctls:
  test VIDIOC_G/S_MODULATOR: OK (Not Supported)
  test VIDIOC_G/S_FREQUENCY: OK
  test VIDIOC_ENUMAUDOUT: OK (Not Supported)
  test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
  test VIDIOC_G/S_AUDOUT: OK (Not Supported)
  Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
  test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
  test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
  test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
  test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
  test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
  test VIDIOC_QUERYCTRL: OK
  test VIDIOC_G/S_CTRL: OK
  test VIDIOC_G/S/TRY_EXT_CTRLS: OK
  test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
  test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
  Standard Controls: 2 Private Controls: 0

Format ioctls:
  test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
  test VIDIOC_G/S_PARM: OK (Not Supported)
  test VIDIOC_G_FBUF: OK (Not Supported)
  test VIDIOC_G_FMT: OK (Not Supported)
  test VIDIOC_TRY_FMT: OK (Not Supported)
  test VIDIOC_S_FMT: OK (Not Supported)
  test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
  test Cropping: OK (Not Supported)
  test Composing: OK (Not Supported)
  test Scaling: OK (Not Supported)

Codec ioctls:
  test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
  test VIDIOC_G_ENC_INDEX: OK (Not Supported)
  test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
  test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
  test VIDIOC_EXPBUF: OK (Not Supported)
  test Requests: OK (Not Supported)

Total for bttv device /dev/radio0: 45, Succeeded: 45, Failed: 0, Warnings: 0

Deborah Brouwer (13):
  media: bttv: use video_drvdata to get bttv
  media: bttv: replace BUG with WARN_ON
  media: bttv: radio use v4l2_fh instead of bttv_fh
  media: bttv: copy vid fmt/width/height from fh
  media: bttv: copy vbi_fmt from bttv_fh
  media: bttv: move do_crop flag out of bttv_fh
  media: bttv: remove format field from bttv_buffer
  media: bttv: remove tvnorm field from bttv_buffer
  media: bttv: remove crop info from bttv_buffer
  media: bttv: move vbi_skip/vbi_count out of buffer
  media: bttv: refactor bttv_set_dma()
  media: bttv: use audio defaults for winfast2000
  media: bttv: convert to vb2

 drivers/media/pci/bt8xx/Kconfig           |    2 +-
 drivers/media/pci/bt8xx/bt848.h           |    8 +
 drivers/media/pci/bt8xx/bttv-audio-hook.c |   10 +-
 drivers/media/pci/bt8xx/bttv-driver.c     | 1014 +++++++--------------
 drivers/media/pci/bt8xx/bttv-risc.c       |  415 +++++----
 drivers/media/pci/bt8xx/bttv-vbi.c        |  281 +++---
 drivers/media/pci/bt8xx/bttvp.h           |   79 +-
 7 files changed, 720 insertions(+), 1089 deletions(-)

-- 
2.40.1

