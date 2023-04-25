Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D10676EDDBC
	for <lists+linux-media@lfdr.de>; Tue, 25 Apr 2023 10:13:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233543AbjDYINT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Apr 2023 04:13:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231189AbjDYINS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Apr 2023 04:13:18 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3969549E8
        for <linux-media@vger.kernel.org>; Tue, 25 Apr 2023 01:13:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AA199621C9
        for <linux-media@vger.kernel.org>; Tue, 25 Apr 2023 08:13:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7856AC433EF;
        Tue, 25 Apr 2023 08:13:10 +0000 (UTC)
Message-ID: <b861df48-eb55-3e56-50ed-cb646cf6dd08@xs4all.nl>
Date:   Tue, 25 Apr 2023 10:13:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 00/13] bttv: convert to vb2
Content-Language: en-US
To:     Deborah Brouwer <deborah.brouwer@collabora.com>,
        linux-media@vger.kernel.org
References: <cover.1682379348.git.deborah.brouwer@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <cover.1682379348.git.deborah.brouwer@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Deb!

Thank you so much for working on this, once this is merged we can finally
get rid of the old videobuf framework.

I did an initial review and found a few minor issues. In the meantime I will
be testing this series with some of my bttv hardware this week (I hope).

I will especially check for PAL support since you only could test with NTSC.

Regards,

	Hans

On 25/04/2023 02:09, Deborah Brouwer wrote:
> Hi,
> This series converts the bttv driver to vb2.
> 
> I tested it with two cards:
> Leadtek WinFast TV 2000 (has video, vbi and radio) and
> Hauppauge WinTV (just video and vbi).
> 
> It applies on top of Hans' series to drop destructive overlay support:
> 
> git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.4b
> 
> Here are the v4l2-compliance results:
> 
> v4l2-compliance 1.25.0-5042, 64 bits, 64-bit time_t
> v4l2-compliance SHA: 42567298311a 2023-04-21 08:43:10
> 
> Compliance test for bttv device /dev/video0:
> 
> Driver Info:
>   Driver name      : bttv
>   Card type        : BT878 video (Leadtek WinFast 20
>   Bus info         : PCI:0000:05:00.0
>   Driver version   : 6.3.0
>   Capabilities     : 0x85250011
>     Video Capture
>     VBI Capture
>     Tuner
>     Radio
>     Read/Write
>     Streaming
>     Extended Pix Format
>     Device Capabilities
>   Device Caps      : 0x05210001
>     Video Capture
>     Tuner
>     Read/Write
>     Streaming
>     Extended Pix Format
> 
> Required ioctls:
>   test VIDIOC_QUERYCAP: OK
>   test invalid ioctls: OK
> 
> Allow for multiple opens:
>   test second /dev/video0 open: OK
>   test VIDIOC_QUERYCAP: OK
>   test VIDIOC_G/S_PRIORITY: OK
>   test for unlimited opens: OK
> 
> Debug ioctls:
>   test VIDIOC_DBG_G/S_REGISTER: OK
>   test VIDIOC_LOG_STATUS: OK
> 
> Input ioctls:
>   test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK
>   test VIDIOC_G/S_FREQUENCY: OK
>   test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>   test VIDIOC_ENUMAUDIO: OK (Not Supported)
>   test VIDIOC_G/S/ENUMINPUT: OK
>   test VIDIOC_G/S_AUDIO: OK (Not Supported)
>   Inputs: 4 Audio Inputs: 0 Tuners: 1
> 
> Output ioctls:
>   test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>   test VIDIOC_G/S_FREQUENCY: OK
>   test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>   test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>   test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>   Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
>   test VIDIOC_ENUM/G/S/QUERY_STD: OK
>   test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>   test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>   test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls (Input 0):
>   test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>   test VIDIOC_QUERYCTRL: OK
>   test VIDIOC_G/S_CTRL: OK
>   test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>   test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>   test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>   Standard Controls: 8 Private Controls: 10
> 
> Format ioctls (Input 0):
>   test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>   test VIDIOC_G/S_PARM: OK
>   test VIDIOC_G_FBUF: OK (Not Supported)
>   test VIDIOC_G_FMT: OK
>     warn: v4l2-test-formats.cpp(794): TRY_FMT cannot handle an invalid pixelformat.
>     warn: v4l2-test-formats.cpp(795): This may or may not be a problem. For more information see:
>     warn: v4l2-test-formats.cpp(796): http://www.mail-archive.com/linux-media@vger.kernel.org/msg56550.html
>   test VIDIOC_TRY_FMT: OK
>     warn: v4l2-test-formats.cpp(1157): S_FMT cannot handle an invalid pixelformat.
>     warn: v4l2-test-formats.cpp(1158): This may or may not be a problem. For more information see:
>     warn: v4l2-test-formats.cpp(1159): http://www.mail-archive.com/linux-media@vger.kernel.org/msg56550.html
>   test VIDIOC_S_FMT: OK
>   test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>   test Cropping: OK
>   test Composing: OK (Not Supported)
>   test Scaling: OK
> 
> Codec ioctls (Input 0):
>   test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>   test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>   test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls (Input 0):
>   test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>   test VIDIOC_EXPBUF: OK (Not Supported)
>   test Requests: OK (Not Supported)
> 
> Control ioctls (Input 1):
>   test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>   test VIDIOC_QUERYCTRL: OK
>   test VIDIOC_G/S_CTRL: OK
>   test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>   test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>   test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>   Standard Controls: 8 Private Controls: 10
> 
> Format ioctls (Input 1):
>   test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>   test VIDIOC_G/S_PARM: OK
>   test VIDIOC_G_FBUF: OK (Not Supported)
>   test VIDIOC_G_FMT: OK
>   test VIDIOC_TRY_FMT: OK
>   test VIDIOC_S_FMT: OK
>   test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>   test Cropping: OK
>   test Composing: OK (Not Supported)
>   test Scaling: OK
> 
> Codec ioctls (Input 1):
>   test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>   test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>   test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls (Input 1):
>   test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>   test VIDIOC_EXPBUF: OK (Not Supported)
>   test Requests: OK (Not Supported)
> 
> Control ioctls (Input 2):
>   test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>   test VIDIOC_QUERYCTRL: OK
>   test VIDIOC_G/S_CTRL: OK
>   test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>   test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>   test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>   Standard Controls: 8 Private Controls: 10
> 
> Format ioctls (Input 2):
>   test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>   test VIDIOC_G/S_PARM: OK
>   test VIDIOC_G_FBUF: OK (Not Supported)
>   test VIDIOC_G_FMT: OK
>   test VIDIOC_TRY_FMT: OK
>   test VIDIOC_S_FMT: OK
>   test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>   test Cropping: OK
>   test Composing: OK (Not Supported)
>   test Scaling: OK
> 
> Codec ioctls (Input 2):
>   test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>   test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>   test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls (Input 2):
>   test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>   test VIDIOC_EXPBUF: OK (Not Supported)
>   test Requests: OK (Not Supported)
> 
> Control ioctls (Input 3):
>   test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>   test VIDIOC_QUERYCTRL: OK
>   test VIDIOC_G/S_CTRL: OK
>   test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>   test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>   test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>   Standard Controls: 8 Private Controls: 10
> 
> Format ioctls (Input 3):
>   test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>   test VIDIOC_G/S_PARM: OK
>   test VIDIOC_G_FBUF: OK (Not Supported)
>   test VIDIOC_G_FMT: OK
>   test VIDIOC_TRY_FMT: OK
>   test VIDIOC_S_FMT: OK
>   test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>   test Cropping: OK
>   test Composing: OK (Not Supported)
>   test Scaling: OK
> 
> Codec ioctls (Input 3):
>   test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>   test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>   test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls (Input 3):
>   test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>   test VIDIOC_EXPBUF: OK (Not Supported)
>   test Requests: OK (Not Supported)
> 
> Total for bttv device /dev/video0: 111, Succeeded: 111, Failed: 0, Warnings: 6
> 
> v4l2-compliance 1.25.0-5042, 64 bits, 64-bit time_t
> v4l2-compliance SHA: 42567298311a 2023-04-21 08:43:10
> 
> Compliance test for bttv device /dev/vbi0:
> 
> Driver Info:
>   Driver name      : bttv
>   Card type        : BT878 video (Leadtek WinFast 20
>   Bus info         : PCI:0000:05:00.0
>   Driver version   : 6.3.0
>   Capabilities     : 0x85250011
>     Video Capture
>     VBI Capture
>     Tuner
>     Radio
>     Read/Write
>     Streaming
>     Extended Pix Format
>     Device Capabilities
>   Device Caps      : 0x05210010
>     VBI Capture
>     Tuner
>     Read/Write
>     Streaming
>     Extended Pix Format
> 
> Required ioctls:
>   test VIDIOC_QUERYCAP: OK
>   test invalid ioctls: OK
> 
> Allow for multiple opens:
>   test second /dev/vbi0 open: OK
>   test VIDIOC_QUERYCAP: OK
>   test VIDIOC_G/S_PRIORITY: OK
>   test for unlimited opens: OK
> 
> Debug ioctls:
>   test VIDIOC_DBG_G/S_REGISTER: OK
>   test VIDIOC_LOG_STATUS: OK
> 
> Input ioctls:
>   test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK
>   test VIDIOC_G/S_FREQUENCY: OK
>   test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>   test VIDIOC_ENUMAUDIO: OK (Not Supported)
>   test VIDIOC_G/S/ENUMINPUT: OK
>   test VIDIOC_G/S_AUDIO: OK (Not Supported)
>   Inputs: 4 Audio Inputs: 0 Tuners: 1
> 
> Output ioctls:
>   test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>   test VIDIOC_G/S_FREQUENCY: OK
>   test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>   test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>   test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>   Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
>   test VIDIOC_ENUM/G/S/QUERY_STD: OK
>   test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>   test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>   test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls (Input 0):
>   test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>   test VIDIOC_QUERYCTRL: OK
>   test VIDIOC_G/S_CTRL: OK
>   test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>   test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>   test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>   Standard Controls: 8 Private Controls: 10
> 
> Format ioctls (Input 0):
>   test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
>   test VIDIOC_G/S_PARM: OK (Not Supported)
>   test VIDIOC_G_FBUF: OK (Not Supported)
>   test VIDIOC_G_FMT: OK
>   test VIDIOC_TRY_FMT: OK
>   test VIDIOC_S_FMT: OK
>   test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>   test Cropping: OK (Not Supported)
>   test Composing: OK (Not Supported)
>   test Scaling: OK (Not Supported)
> 
> Codec ioctls (Input 0):
>   test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>   test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>   test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls (Input 0):
>   test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>   test VIDIOC_EXPBUF: OK (Not Supported)
>   test Requests: OK (Not Supported)
> 
> Control ioctls (Input 1):
>   test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>   test VIDIOC_QUERYCTRL: OK
>   test VIDIOC_G/S_CTRL: OK
>   test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>   test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>   test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>   Standard Controls: 8 Private Controls: 10
> 
> Format ioctls (Input 1):
>   test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
>   test VIDIOC_G/S_PARM: OK (Not Supported)
>   test VIDIOC_G_FBUF: OK (Not Supported)
>   test VIDIOC_G_FMT: OK
>   test VIDIOC_TRY_FMT: OK
>   test VIDIOC_S_FMT: OK
>   test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>   test Cropping: OK (Not Supported)
>   test Composing: OK (Not Supported)
>   test Scaling: OK (Not Supported)
> 
> Codec ioctls (Input 1):
>   test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>   test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>   test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls (Input 1):
>   test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>   test VIDIOC_EXPBUF: OK (Not Supported)
>   test Requests: OK (Not Supported)
> 
> Control ioctls (Input 2):
>   test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>   test VIDIOC_QUERYCTRL: OK
>   test VIDIOC_G/S_CTRL: OK
>   test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>   test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>   test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>   Standard Controls: 8 Private Controls: 10
> 
> Format ioctls (Input 2):
>   test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
>   test VIDIOC_G/S_PARM: OK (Not Supported)
>   test VIDIOC_G_FBUF: OK (Not Supported)
>   test VIDIOC_G_FMT: OK
>   test VIDIOC_TRY_FMT: OK
>   test VIDIOC_S_FMT: OK
>   test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>   test Cropping: OK (Not Supported)
>   test Composing: OK (Not Supported)
>   test Scaling: OK (Not Supported)
> 
> Codec ioctls (Input 2):
>   test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>   test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>   test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls (Input 2):
>   test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>   test VIDIOC_EXPBUF: OK (Not Supported)
>   test Requests: OK (Not Supported)
> 
> Control ioctls (Input 3):
>   test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>   test VIDIOC_QUERYCTRL: OK
>   test VIDIOC_G/S_CTRL: OK
>   test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>   test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>   test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>   Standard Controls: 8 Private Controls: 10
> 
> Format ioctls (Input 3):
>   test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
>   test VIDIOC_G/S_PARM: OK (Not Supported)
>   test VIDIOC_G_FBUF: OK (Not Supported)
>   test VIDIOC_G_FMT: OK
>   test VIDIOC_TRY_FMT: OK
>   test VIDIOC_S_FMT: OK
>   test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>   test Cropping: OK (Not Supported)
>   test Composing: OK (Not Supported)
>   test Scaling: OK (Not Supported)
> 
> Codec ioctls (Input 3):
>   test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>   test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>   test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls (Input 3):
>   test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>   test VIDIOC_EXPBUF: OK (Not Supported)
>   test Requests: OK (Not Supported)
> 
> Total for bttv device /dev/vbi0: 111, Succeeded: 111, Failed: 0, Warnings: 0
> 
> v4l2-compliance 1.25.0-5042, 64 bits, 64-bit time_t
> v4l2-compliance SHA: 42567298311a 2023-04-21 08:43:10
> 
> Compliance test for bttv device /dev/radio0:
> 
> Driver Info:
>   Driver name      : bttv
>   Card type        : BT878 video (Leadtek WinFast 20
>   Bus info         : PCI:0000:05:00.0
>   Driver version   : 6.3.0
>   Capabilities     : 0x85250011
>     Video Capture
>     VBI Capture
>     Tuner
>     Radio
>     Read/Write
>     Streaming
>     Extended Pix Format
>     Device Capabilities
>   Device Caps      : 0x00250000
>     Tuner
>     Radio
>     Extended Pix Format
> 
> Required ioctls:
>   test VIDIOC_QUERYCAP: OK
>   test invalid ioctls: OK
> 
> Allow for multiple opens:
>   test second /dev/radio0 open: OK
>   test VIDIOC_QUERYCAP: OK
>   test VIDIOC_G/S_PRIORITY: OK
>   test for unlimited opens: OK
> 
> Debug ioctls:
>   test VIDIOC_DBG_G/S_REGISTER: OK
>   test VIDIOC_LOG_STATUS: OK
> 
> Input ioctls:
>   test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK
>   test VIDIOC_G/S_FREQUENCY: OK
>   test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>   test VIDIOC_ENUMAUDIO: OK (Not Supported)
>   test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>   test VIDIOC_G/S_AUDIO: OK (Not Supported)
>   Inputs: 0 Audio Inputs: 0 Tuners: 1
> 
> Output ioctls:
>   test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>   test VIDIOC_G/S_FREQUENCY: OK
>   test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>   test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>   test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>   Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
>   test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>   test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>   test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>   test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls:
>   test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>   test VIDIOC_QUERYCTRL: OK
>   test VIDIOC_G/S_CTRL: OK
>   test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>   test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>   test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>   Standard Controls: 2 Private Controls: 0
> 
> Format ioctls:
>   test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
>   test VIDIOC_G/S_PARM: OK (Not Supported)
>   test VIDIOC_G_FBUF: OK (Not Supported)
>   test VIDIOC_G_FMT: OK (Not Supported)
>   test VIDIOC_TRY_FMT: OK (Not Supported)
>   test VIDIOC_S_FMT: OK (Not Supported)
>   test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>   test Cropping: OK (Not Supported)
>   test Composing: OK (Not Supported)
>   test Scaling: OK (Not Supported)
> 
> Codec ioctls:
>   test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>   test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>   test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls:
>   test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
>   test VIDIOC_EXPBUF: OK (Not Supported)
>   test Requests: OK (Not Supported)
> 
> Total for bttv device /dev/radio0: 45, Succeeded: 45, Failed: 0, Warnings: 0
> 
> Deborah Brouwer (13):
>   media: bttv: use video_drvdata to get bttv
>   media: bttv: replace BUG with WARN_ON
>   media: bttv: radio use v4l2_fh instead of bttv_fh
>   media: bttv: move vid fmt/width/height out of fh
>   media: bttv: move vbi_fmt out of bttv_fh
>   media: bttv: move do_crop flag out of bttv_fh
>   media: bttv: remove format field from bttv_buffer
>   media: bttv: remove tvnorm field from bttv_buffer
>   media: bttv: remove crop info from bttv_buffer
>   media: bttv: move vbi_skip/vbi_count out of buffer
>   media: bttv: refactor bttv_set_dma()
>   media: bttv: use audio defaults for winfast2000
>   media: bttv: convert to vb2
> 
>  drivers/media/pci/bt8xx/Kconfig           |   2 +-
>  drivers/media/pci/bt8xx/bttv-audio-hook.c |  10 +-
>  drivers/media/pci/bt8xx/bttv-driver.c     | 990 +++++++---------------
>  drivers/media/pci/bt8xx/bttv-risc.c       | 412 +++++----
>  drivers/media/pci/bt8xx/bttv-vbi.c        | 266 +++---
>  drivers/media/pci/bt8xx/bttvp.h           |  78 +-
>  6 files changed, 677 insertions(+), 1081 deletions(-)
> 
> 
> base-commit: eeac8ede17557680855031c6f305ece2378af326
> prerequisite-patch-id: 69cddf0b964a5c6299b9d2bcf0dcfa9d7565b291
> prerequisite-patch-id: 5d97ec85b44b9766bd62d8579cb80c88925923a4
> prerequisite-patch-id: 633d3c02b48cc594395a0cce311b52f39c8407c0
> prerequisite-patch-id: d1077c4aaa0cb3f7f44f72a7eb6c15f761ebdc48
> prerequisite-patch-id: 904419a08aeb3188dcc256acea2e3d94436948d5
> prerequisite-patch-id: ec37f240e767b2a5d4c23a9b1b61947d48a7a487
> prerequisite-patch-id: 7c4857cd34459d98c1025c6cd1b3a40940f22e7c
> prerequisite-patch-id: b18f03790a5b31759c957481eda0f38c1c1e098d
> prerequisite-patch-id: a424f90eb7f66ad8c9b141507a22e0ccaab55c53

