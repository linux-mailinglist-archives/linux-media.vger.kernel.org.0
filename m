Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C63A6ED927
	for <lists+linux-media@lfdr.de>; Tue, 25 Apr 2023 02:10:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231189AbjDYAKc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Apr 2023 20:10:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229756AbjDYAKb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Apr 2023 20:10:31 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90E8C4C16
        for <linux-media@vger.kernel.org>; Mon, 24 Apr 2023 17:10:28 -0700 (PDT)
Received: from localhost.localdomain (node-1w7jr9st5p2etziuntaazujnj.ipv6.telus.net [IPv6:2001:569:beb1:1500:c96f:992f:7c34:9ff])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 8AD306603298;
        Tue, 25 Apr 2023 01:10:25 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1682381426;
        bh=ayxcKs5QhUJcr9D2VgZkVV/qoMm3+/Rfyglz/USLc3o=;
        h=From:To:Cc:Subject:Date:From;
        b=QjH84oj6CjaT0xQgsTpuVbrI8tEtqnlj0hGyKbl7veKdDuFxKUe3IuBqYmrcEO8q0
         k4F+oWBievIf6rS7m6J49Zss7/ZbGTGVhINWpTSumCFUResrIqhpiHrt8cQ1C1unIj
         s4uWQ8adR4Wza0TTbEINJScYlMNHcBYVNMaIYL1oOWAOpvKHaJOWECYV0FF2JDVPlF
         5SphetkOMocMpnrYPWKCqQXXlfBAiwqSTOZ+bsbwKgbxUT+SEsfdjO6d+rFgZFsELM
         12P7Um1bgHb/DKVuUNywiEpZxuAaB3m5f8lxE51ql7nO81s9T3rh9zJ+RT+Gr419IH
         MqVpVifWa0ndQ==
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH 00/13] bttv: convert to vb2
Date:   Mon, 24 Apr 2023 17:09:59 -0700
Message-Id: <cover.1682379348.git.deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,
This series converts the bttv driver to vb2.

I tested it with two cards:
Leadtek WinFast TV 2000 (has video, vbi and radio) and
Hauppauge WinTV (just video and vbi).

It applies on top of Hans' series to drop destructive overlay support:

git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.4b

Here are the v4l2-compliance results:

v4l2-compliance 1.25.0-5042, 64 bits, 64-bit time_t
v4l2-compliance SHA: 42567298311a 2023-04-21 08:43:10

Compliance test for bttv device /dev/video0:

Driver Info:
  Driver name      : bttv
  Card type        : BT878 video (Leadtek WinFast 20
  Bus info         : PCI:0000:05:00.0
  Driver version   : 6.3.0
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
  test VIDIOC_DBG_G/S_REGISTER: OK
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

v4l2-compliance 1.25.0-5042, 64 bits, 64-bit time_t
v4l2-compliance SHA: 42567298311a 2023-04-21 08:43:10

Compliance test for bttv device /dev/vbi0:

Driver Info:
  Driver name      : bttv
  Card type        : BT878 video (Leadtek WinFast 20
  Bus info         : PCI:0000:05:00.0
  Driver version   : 6.3.0
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
  test VIDIOC_DBG_G/S_REGISTER: OK
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

v4l2-compliance 1.25.0-5042, 64 bits, 64-bit time_t
v4l2-compliance SHA: 42567298311a 2023-04-21 08:43:10

Compliance test for bttv device /dev/radio0:

Driver Info:
  Driver name      : bttv
  Card type        : BT878 video (Leadtek WinFast 20
  Bus info         : PCI:0000:05:00.0
  Driver version   : 6.3.0
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
  test VIDIOC_DBG_G/S_REGISTER: OK
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
  media: bttv: move vid fmt/width/height out of fh
  media: bttv: move vbi_fmt out of bttv_fh
  media: bttv: move do_crop flag out of bttv_fh
  media: bttv: remove format field from bttv_buffer
  media: bttv: remove tvnorm field from bttv_buffer
  media: bttv: remove crop info from bttv_buffer
  media: bttv: move vbi_skip/vbi_count out of buffer
  media: bttv: refactor bttv_set_dma()
  media: bttv: use audio defaults for winfast2000
  media: bttv: convert to vb2

 drivers/media/pci/bt8xx/Kconfig           |   2 +-
 drivers/media/pci/bt8xx/bttv-audio-hook.c |  10 +-
 drivers/media/pci/bt8xx/bttv-driver.c     | 990 +++++++---------------
 drivers/media/pci/bt8xx/bttv-risc.c       | 412 +++++----
 drivers/media/pci/bt8xx/bttv-vbi.c        | 266 +++---
 drivers/media/pci/bt8xx/bttvp.h           |  78 +-
 6 files changed, 677 insertions(+), 1081 deletions(-)


base-commit: eeac8ede17557680855031c6f305ece2378af326
prerequisite-patch-id: 69cddf0b964a5c6299b9d2bcf0dcfa9d7565b291
prerequisite-patch-id: 5d97ec85b44b9766bd62d8579cb80c88925923a4
prerequisite-patch-id: 633d3c02b48cc594395a0cce311b52f39c8407c0
prerequisite-patch-id: d1077c4aaa0cb3f7f44f72a7eb6c15f761ebdc48
prerequisite-patch-id: 904419a08aeb3188dcc256acea2e3d94436948d5
prerequisite-patch-id: ec37f240e767b2a5d4c23a9b1b61947d48a7a487
prerequisite-patch-id: 7c4857cd34459d98c1025c6cd1b3a40940f22e7c
prerequisite-patch-id: b18f03790a5b31759c957481eda0f38c1c1e098d
prerequisite-patch-id: a424f90eb7f66ad8c9b141507a22e0ccaab55c53
-- 
2.39.2

