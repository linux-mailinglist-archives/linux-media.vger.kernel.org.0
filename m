Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99D475F3E0E
	for <lists+linux-media@lfdr.de>; Tue,  4 Oct 2022 10:17:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229949AbiJDIRk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Oct 2022 04:17:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229904AbiJDIRW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Oct 2022 04:17:22 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E076A20B
        for <linux-media@vger.kernel.org>; Tue,  4 Oct 2022 01:17:00 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id au23so6425449ejc.1
        for <linux-media@vger.kernel.org>; Tue, 04 Oct 2022 01:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=xgjou/E9RMgyWOKXOkKgvhoFLxO2vjORF4Nvzhyzy7w=;
        b=Z+o4L7mxVqamNeSnIyeMRfSJcb7V7DnTh+u/ESeBU2WaWUdpYK8SM75AzhohgsEuqc
         gDnF9YIG+sjf5zK5zJNTavW1vLY2kMPOOXYf1ecnSWpDI4B0xaTOxLQTIBVdVEoOHrKa
         cQSHvXw6kIlP+8hQa8YEe1E2Ev4qDhr3jMH7JDKeacXP/OqjmREvhBarbU5u4ww3bO6q
         b8uQ3LyoKP7MOaepybd74OFScDpWx2y/OhIIcXwSZSjDRc8h1ZTi7gr0xC2pH9eXFVpR
         qF2WpmWdZ2IQcEfJ9h0ewzoA9ewkrR/wH4RW1cnFnz42EW7L86weX10okhWwIu/K1XTX
         HY4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=xgjou/E9RMgyWOKXOkKgvhoFLxO2vjORF4Nvzhyzy7w=;
        b=huOhFzdYbjygS5xjmn5alR+DNzP+h30orNzkQw9E65jxXhMmwJanN9UNlb2IcOTFvg
         KnHiEDvzAPufnccjsx6EGDGHw2xNlntFhpUy9Jfz8gHrKmeF+rtr83Xj/IebR3FPA3vx
         lGcBw4i03mIEZCtJ17anSc0ZgC9E/Y168lnXMntDfn8UrQTyfKt1F424TjDtM3zq0klR
         kJz7HriPl/WZ7+n037UB4IpCZe5RW5spB5TziUb4vFBmmyKF85CPr0UUtGdj22oJ7CFr
         F3Qx5vRfoOPLqcIv1R2mW4WAk+l6dg66YdF5uvN84Zhr/Az1+AuRYrrP55I3xXw+JaQ0
         SD8g==
X-Gm-Message-State: ACrzQf2LEpzpNkLST/wo60lkHw4fnw8NaSXSzBlxfjodJnH5MngsVQ0A
        xMmZY6NKBT9lKI5Gqc1N4MAjuGZlVoqc1lofRmPkZDY0vcA=
X-Google-Smtp-Source: AMsMyM7E4Tg82mAu34gMPW+rAfCE44kvfm3c0vmSxe1Nk6HDD2WZ3F84+RTne+/Dpvyh8WGqphO8BVG8ceKzZJb3FJc=
X-Received: by 2002:a17:907:6288:b0:72f:90ba:f0b2 with SMTP id
 nd8-20020a170907628800b0072f90baf0b2mr17740110ejc.696.1664871419310; Tue, 04
 Oct 2022 01:16:59 -0700 (PDT)
MIME-Version: 1.0
From:   =?UTF-8?Q?Martin_D=C3=B8rum?= <martid0311@gmail.com>
Date:   Tue, 4 Oct 2022 10:16:47 +0200
Message-ID: <CAMesyg1Wfa1pucPZs=GWBYKprQZdb14Eg2NVHJD03qX4EWgZ+A@mail.gmail.com>
Subject: Venus video encoder device doesn't produce any frames
To:     "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi, I'm sorry if this is not the place for this kind of question.
I have a Qualcomm Venus video encoder, on a SnapDragon 410.
I'm trying to make use of the onboard hardware video encoder that's
exposed as a V4L2 device.
However, when I follow the M2M Stateful Video Encoder Interface,
and write raw frames to the encoder, I only get exactly one encoded
frame back.
poll() on the file descriptor only ever emits one POLLIN at the
beginning, despite emitting POLLOUT for every frame I send it.
As far as I can see, my logic for when I dequeue and enqueue buffers
on the OUTPUT and the CAPTURE side is correct according to the
interface.

I have a small(ish) test program which does the minimum necessary to
exercise the encoder (included at the bottom).
Here's what that outputs:

Found Qualcomm Venus video encoder (/dev/video5, fd 8)
Output format 0: NV12: Y/CbCr 4:2:0
Capture format 0: MPG4: MPEG-4 Part 2 ES
Capture format 1: H263: H.263
Capture format 2: H264: H.264
Capture format 3: VP80: VP8
Mapped buffer 0: 0xffffb40d0000, 1048576
Mapped buffer 1: 0xffffb3fd0000, 1048576
Mapped buffer 2: 0xffffb3ed0000, 1048576
Mapped buffer 3: 0xffffb3dd0000, 1048576
Mapped buffer 0: 0xffffb3d5c000, 475136
Mapped buffer 1: 0xffffb3ce8000, 475136
Mapped buffer 2: 0xffffb3c74000, 475136
Mapped buffer 3: 0xffffb3c00000, 475136
Mapped buffer 4: 0xffffb3b8c000, 475136
Output buffer 0 enqueued, marking not ready
Capture buffer 0 dequeued (at: 0xffffb40d0000, length: 1264)
Capture buffer 0 enqueued
Output buffer 0 dequeued, marking ready
Output buffer 0 enqueued, marking not ready
Output buffer 0 dequeued, marking ready
Output buffer 0 enqueued, marking not ready
Output buffer 0 dequeued, marking ready
Output buffer 0 enqueued, marking not ready
Output buffer 0 dequeued, marking ready
Output buffer 0 enqueued, marking not ready
Output buffer 0 dequeued, marking ready
....

As you can see, I'm enqueuing one OUTPUT buffer, then dequeuing one
CAPTURE buffer (because poll() returns POLLIN), I re-enqueue that
CAPTURE buffer, but after that, I only ever dequeue OUTPUT buffers
because poll() never results in POLLIN again, only POLLOUT.

Here's a log which includes debug info from the 'videobuf2_common'
module and the '/dev/video5' device:

Found Qualcomm Venus video encoder (/dev/video5, fd 8)
Output format 0: NV12: Y/CbCr 4:2:0
Capture format 0: MPG4: MPEG-4 Part 2 ES
Capture format 1: H263: H.263
Capture format 2: H264: H.264
Capture format 3: VP80: VP8
[76714.885397] videodev: v4l2_open: video5: open (0)
[76714.885418] video5: VIDIOC_QUERYCAP: driver=qcom-venus,
card=Qualcomm Venus video encoder, bus=platform:qcom-venus,
version=0x00050a8a, capabilities=0x84204000, device_caps=0x04204000
[76714.885732] video5: VIDIOC_S_FMT: type=vid-cap-mplane, width=640,
height=480, format=H264, field=none, colorspace=0, num_planes=1,
flags=0x0, ycbcr_enc=0, quantization=0, xfer_func=0
[76714.885769] plane 0: bytesperline=0 sizeimage=1048576
[76714.885787] video5: VIDIOC_ENUM_FMT: index=0, type=vid-out-mplane,
flags=0x0, pixelformat=NV12, mbus_code=0x0000, description='Y/CbCr
4:2:0'
[76714.885844] video5: VIDIOC_ENUM_FMT: error -22: index=1,
type=vid-out-mplane, flags=0x0, pixelformat=\x00\x00\x00\x00,
mbus_code=0x0000, description=''
[76714.885882] video5: VIDIOC_ENUM_FMT: index=0, type=vid-cap-mplane,
flags=0x1, pixelformat=MPG4, mbus_code=0x0000, description='MPEG-4
Part 2 ES'
[76714.885928] video5: VIDIOC_ENUM_FMT: index=1, type=vid-cap-mplane,
flags=0x1, pixelformat=H263, mbus_code=0x0000, description='H.263'
[76714.885971] video5: VIDIOC_ENUM_FMT: index=2, type=vid-cap-mplane,
flags=0x1, pixelformat=H264, mbus_code=0x0000, description='H.264'
[76714.886029] video5: VIDIOC_ENUM_FMT: index=3, type=vid-cap-mplane,
flags=0x1, pixelformat=VP80, mbus_code=0x0000, description='VP8'
[76714.886081] video5: VIDIOC_ENUM_FMT: error -22: index=4,
type=vid-cap-mplane, flags=0x0, pixelformat=\x00\x00\x00\x00,
mbus_code=0x0000, description=''
[76714.886122] video5: VIDIOC_S_FMT: type=vid-out-mplane, width=640,
height=480, format=NV12, field=none, colorspace=0, num_planes=1,
flags=0x0, ycbcr_enc=0, quantization=0, xfer_func=0
[76714.886149] plane 0: bytesperline=640 sizeimage=475136
[76714.886165] video5: VIDIOC_S_PARM: type=vid-out-mplane,
capability=0x1000, outputmode=0x0, timeperframe=1/30, extendedmode=0,
writebuffers=0
[76714.886207] video5: VIDIOC_S_PARM: type=vid-cap-mplane,
capability=0x1000, capturemode=0x0, timeperframe=1/30, extendedmode=0,
readbuffers=0
Mapped buffer 0: 0xffff84530000, 1048576
Mapped buffer 1: 0xffff84430000, 1048576
Mapped buffer 2: 0xffff84330000, 1048576
[76714.889190] video5: VIDIOC_REQBUFS: count=4, type=vid-cap-mplane, memory=mmap
[76714.889344] video5: VIDIOC_QUERYBUF: 00:00:00.000000000 index=0,
type=vid-cap-mplane, request_fd=0, flags=0x00004000, field=any,
sequence=0, memory=mmap
[76714.889376] plane 0: bytesused=0, data_offset=0x00000000,
offset/userptr=0x40000000, length=1048576
Mapped buffer 3: 0xffff84230000, 1048576
[76714.889384] timecode=00:00:00 type=0, flags=0x00000000, frames=0,
userbits=0x00000000
[76714.889729] videodev: v4l2_mmap: video5: mmap (0)
[76714.889821] video5: VIDIOC_QUERYBUF: 00:00:00.000000000 index=1,
type=vid-cap-mplane, request_fd=0, flags=0x00004000, field=any,
sequence=0, memory=mmap
[76714.889860] plane 0: bytesused=0, data_offset=0x00000000,
offset/userptr=0x40100000, length=1048576
[76714.889868] timecode=00:00:00 type=0, flags=0x00000000, frames=0,
userbits=0x00000000
[76714.890111] videodev: v4l2_mmap: video5: mmap (0)
[76714.890170] video5: VIDIOC_QUERYBUF: 00:00:00.000000000 index=2,
type=vid-cap-mplane, request_fd=0, flags=0x00004000, field=any,
sequence=0, memory=mmap
[76714.890207] plane 0: bytesused=0, data_offset=0x00000000,
offset/userptr=0x40200000, length=1048576
[76714.890215] timecode=00:00:00 type=0, flags=0x00000000, frames=0,
userbits=0x00000000
[76714.890462] videodev: v4l2_mmap: video5: mmap (0)
[76714.890518] video5: VIDIOC_QUERYBUF: 00:00:00.000000000 index=3,
type=vid-cap-mplane, request_fd=0, flags=0x00004000, field=any,
sequence=0, memory=mmap
[76714.890547] plane 0: bytesused=0, data_offset=0x00000000,
offset/userptr=0x40300000, length=1048576
[76714.890555] timecode=00:00:00 type=0, flags=0x00000000, frames=0,
userbits=0x00000000
[76714.890783] videodev: v4l2_mmap: video5: mmap (0)
Mapped buffer 0: 0xffff841bc000, 475136
Mapped buffer 1: 0xffff84148000, 475136
Mapped buffer 2: 0xffff840d4000, 475136
Mapped buffer 3: 0xffff84060000, 475136
Mapped buffer 4: 0xffff83fec000, 475136
[76714.894347] video5: VIDIOC_REQBUFS: count=5, type=vid-out-mplane, memory=mmap
[76714.894402] video5: VIDIOC_QUERYBUF: 00:00:00.000000000 index=0,
type=vid-out-mplane, request_fd=0, flags=0x00004000, field=any,
sequence=0, memory=mmap
[76714.894425] plane 0: bytesused=0, data_offset=0x00000000,
offset/userptr=0x0, length=475136
[76714.894432] timecode=00:00:00 type=0, flags=0x00000000, frames=0,
userbits=0x00000000
[76714.894564] videodev: v4l2_mmap: video5: mmap (0)
[76714.894649] video5: VIDIOC_QUERYBUF: 00:00:00.000000000 index=1,
type=vid-out-mplane, request_fd=0, flags=0x00004000, field=any,
sequence=0, memory=mmap
[76714.894679] plane 0: bytesused=0, data_offset=0x00000000,
offset/userptr=0x74000, length=475136
[76714.894686] timecode=00:00:00 type=0, flags=0x00000000, frames=0,
userbits=0x00000000
[76714.894789] videodev: v4l2_mmap: video5: mmap (0)
[76714.894843] video5: VIDIOC_QUERYBUF: 00:00:00.000000000 index=2,
type=vid-out-mplane, request_fd=0, flags=0x00004000, field=any,
sequence=0, memory=mmap
[76714.894866] plane 0: bytesused=0, data_offset=0x00000000,
offset/userptr=0xe8000, length=475136
[76714.894873] timecode=00:00:00 type=0, flags=0x00000000, frames=0,
userbits=0x00000000
[76714.894972] videodev: v4l2_mmap: video5: mmap (0)
[76714.895024] video5: VIDIOC_QUERYBUF: 00:00:00.000000000 index=3,
type=vid-out-mplane, request_fd=0, flags=0x00004000, field=any,
sequence=0, memory=mmap
[76714.895047] plane 0: bytesused=0, data_offset=0x00000000,
offset/userptr=0x15c000, length=475136
[76714.895054] timecode=00:00:00 type=0, flags=0x00000000, frames=0,
userbits=0x00000000
[76714.895147] videodev: v4l2_mmap: video5: mmap (0)
[76714.895188] video5: VIDIOC_QUERYBUF: 00:00:00.000000000 index=4,
type=vid-out-mplane, request_fd=0, flags=0x00004000, field=any,
sequence=0, memory=mmap
[76714.895211] plane 0: bytesused=0, data_offset=0x00000000,
offset/userptr=0x1d0000, length=475136
[76714.895219] timecode=00:00:00 type=0, flags=0x00000000, frames=0,
userbits=0x00000000
[76714.895329] videodev: v4l2_mmap: video5: mmap (0)
[76714.895371] __v4l2_m2m_try_queue: Trying to schedule a job for
m2m_ctx: 000000009db4c1e9
[76714.895377] __v4l2_m2m_try_queue: Streaming needs to be on for both queues
[76714.895382] v4l2_m2m_try_run: No job pending
[76714.895386] video5: VIDIOC_STREAMON: type=vid-cap-mplane
[76714.895409] __v4l2_m2m_try_queue: Trying to schedule a job for
m2m_ctx: 000000009db4c1e9
[76714.895414] __v4l2_m2m_try_queue: No input buffers available
[76714.895418] v4l2_m2m_try_run: No job pending
[76714.895422] video5: VIDIOC_STREAMON: type=vid-out-mplane
[76714.895550] __v4l2_m2m_try_queue: Trying to schedule a job for
m2m_ctx: 000000009db4c1e9
[76714.895554] __v4l2_m2m_try_queue: No input buffers available
[76714.895558] v4l2_m2m_try_run: No job pending
[76714.895563] video5: VIDIOC_QBUF: 00:00:00.000000000 index=0,
type=vid-cap-mplane, request_fd=0, flags=0x00004003, field=any,
sequence=0, memory=mmap
[76714.895584] plane 0: bytesused=0, data_offset=0x00000000,
offset/userptr=0x40000000, length=1048576
[76714.895591] timecode=00:00:00 type=0, flags=0x00000000, frames=0,
userbits=0x00000000
[76714.895708] __v4l2_m2m_try_queue: Trying to schedule a job for
m2m_ctx: 000000009db4c1e9
[76714.895712] __v4l2_m2m_try_queue: No input buffers available
[76714.895716] v4l2_m2m_try_run: No job pending
[76714.895720] video5: VIDIOC_QBUF: 00:00:00.000000000 index=1,
type=vid-cap-mplane, request_fd=0, flags=0x00004003, field=any,
sequence=0, memory=mmap
[76714.895741] plane 0: bytesused=0, data_offset=0x00000000,
offset/userptr=0x40100000, length=1048576
[76714.895747] timecode=00:00:00 type=0, flags=0x00000000, frames=0,
userbits=0x00000000
[76714.895860] __v4l2_m2m_try_queue: Trying to schedule a job for
m2m_ctx: 000000009db4c1e9
[76714.895864] __v4l2_m2m_try_queue: No input buffers available
[76714.895868] v4l2_m2m_try_run: No job pending
[76714.895872] video5: VIDIOC_QBUF: 00:00:00.000000000 index=2,
type=vid-cap-mplane, request_fd=0, flags=0x00004003, field=any,
sequence=0, memory=mmap
[76714.895893] plane 0: bytesused=0, data_offset=0x00000000,
offset/userptr=0x40200000, length=1048576
[76714.895899] timecode=00:00:00 type=0, flags=0x00000000, frames=0,
userbits=0x00000000
[76714.896009] __v4l2_m2m_try_queue: Trying to schedule a job for
m2m_ctx: 000000009db4c1e9
[76714.896013] __v4l2_m2m_try_queue: No input buffers available
[76714.896017] v4l2_m2m_try_run: No job pending
[76714.896021] video5: VIDIOC_QBUF: 00:00:00.000000000 index=3,
type=vid-cap-mplane, request_fd=0, flags=0x00004003, field=any,
sequence=0, memory=mmap
[76714.896041] plane 0: bytesused=0, data_offset=0x00000000,
offset/userptr=0x40300000, length=1048576
[76714.896048] timecode=00:00:00 type=0, flags=0x00000000, frames=0,
userbits=0x00000000
[76714.896072] videodev: v4l2_poll: video5: poll: 00000000
Output buffer 0 enqueued, marking not ready
[76714.908897] __v4l2_m2m_try_queue: Trying to schedule a job for
m2m_ctx: 000000009db4c1e9
[76714.908911] v4l2_m2m_try_run: Running job on m2m_ctx: 000000009db4c1e9
[76714.908936] video5: VIDIOC_QBUF: 00:00:00.000000000 index=0,
type=vid-out-mplane, request_fd=0, flags=0x00004003, field=none,
sequence=0, memory=mmap
[76714.908965] plane 0: bytesused=460800, data_offset=0x00000000,
offset/userptr=0x0, length=475136
[76714.908971] timecode=00:00:00 type=0, flags=0x00000000, frames=0,
userbits=0x00000000
Capture buffer 0 dequeued (at: 0xffff84530000, length: 1264)
Capture buffer 0 enqueued
Output buffer 0 dequeued, marking ready
Output buffer 0 enqueued, marking not ready
[76714.942341] videodev: v4l2_poll: video5: poll: 00000145
[76714.942377] video5: VIDIOC_DQBUF: 00:00:00.000000000 index=0,
type=vid-cap-mplane, request_fd=0, flags=0x00004009, field=any,
sequence=0, memory=mmap
[76714.942410] plane 0: bytesused=1264, data_offset=0x00000000,
offset/userptr=0x40000000, length=1048576
[76714.942418] timecode=00:00:00 type=0, flags=0x00000000, frames=0,
userbits=0x00000000
[76714.942645] __v4l2_m2m_try_queue: Trying to schedule a job for
m2m_ctx: 000000009db4c1e9
[76714.942654] __v4l2_m2m_try_queue: On job queue already
[76714.942661] v4l2_m2m_try_run: Another instance is running, won't run now
[76714.942667] video5: VIDIOC_QBUF: 00:00:00.000000000 index=0,
type=vid-cap-mplane, request_fd=0, flags=0x00004003, field=any,
sequence=0, memory=mmap
[76714.942697] plane 0: bytesused=0, data_offset=0x00000000,
offset/userptr=0x40000000, length=1048576
[76714.942705] timecode=00:00:00 type=0, flags=0x00000000, frames=0,
userbits=0x00000000
[76714.942759] video5: VIDIOC_DQBUF: 00:00:00.000000000 index=0,
type=vid-out-mplane, request_fd=0, flags=0x00004001, field=none,
sequence=0, memory=mmap
[76714.942789] plane 0: bytesused=460800, data_offset=0x00000000,
offset/userptr=0x0, length=475136
[76714.942797] timecode=00:00:00 type=0, flags=0x00000000, frames=0,
userbits=0x00000000
[76714.942827] videodev: v4l2_poll: video5: poll: 00000000
[76714.943110] __v4l2_m2m_try_queue: Trying to schedule a job for
m2m_ctx: 000000009db4c1e9
[76714.943115] __v4l2_m2m_try_queue: On job queue already
[76714.943121] v4l2_m2m_try_run: Another instance is running, won't run now
[76714.943125] video5: VIDIOC_QBUF: 00:00:00.000000000 index=0,
type=vid-out-mplane, request_fd=0, flags=0x00004003, field=none,
sequence=0, memory=mmap
[76714.943153] plane 0: bytesused=460800, data_offset=0x00000000,
offset/userptr=0x0, length=475136
[76714.943160] timecode=00:00:00 type=0, flags=0x00000000, frames=0,
userbits=0x00000000
Output buffer 0 dequeued, marking ready
Output buffer 0 enqueued, marking not ready
[76714.976561] videodev: v4l2_poll: video5: poll: 00000104
[76714.976595] video5: VIDIOC_DQBUF: 00:00:00.000000000 index=0,
type=vid-out-mplane, request_fd=0, flags=0x00004001, field=none,
sequence=1, memory=mmap
[76714.976627] plane 0: bytesused=460800, data_offset=0x00000000,
offset/userptr=0x0, length=475136
[76714.976635] timecode=00:00:00 type=0, flags=0x00000000, frames=0,
userbits=0x00000000
[76714.976716] videodev: v4l2_poll: video5: poll: 00000000
[76714.976997] __v4l2_m2m_try_queue: Trying to schedule a job for
m2m_ctx: 000000009db4c1e9
[76714.977005] __v4l2_m2m_try_queue: On job queue already
[76714.977012] v4l2_m2m_try_run: Another instance is running, won't run now
[76714.977017] video5: VIDIOC_QBUF: 00:00:00.000000000 index=0,
type=vid-out-mplane, request_fd=0, flags=0x00004003, field=none,
sequence=0, memory=mmap
[76714.977045] plane 0: bytesused=460800, data_offset=0x00000000,
offset/userptr=0x0, length=475136
[76714.977053] timecode=00:00:00 type=0, flags=0x00000000, frames=0,
userbits=0x00000000
Output buffer 0 dequeued, marking ready
Output buffer 0 enqueued, marking not ready

And finally, here's my C code; it's long, but pretty straightforward:

#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <linux/videodev2.h>
#include <errno.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/eventfd.h>
#include <sys/mman.h>
#include <sys/ioctl.h>
#include <fcntl.h>
#include <poll.h>

#define xioctl(a, b, c) do { \
    if (ioctl(a, b, c) < 0) { \
        fprintf(stderr, "%s:%i: IOCTL %s: %s\n", __FILE__, __LINE__,
#b, strerror(errno)); \
        abort(); \
    } \
} while (0)

struct mmbuffer {
    void *start;
    size_t length;
    int ready;
};

int main() {
    int width = 640;
    int height = 480;
    int fd = -1;

    struct v4l2_capability cap;
    for (int id = 0; id < 16; ++id) {
        char pathbuf[64];
        snprintf(pathbuf, sizeof(pathbuf), "/dev/video%d", id);
        int tfd = open(pathbuf, O_RDWR);
        if (tfd < 0) {
            continue;
        }

        memset(&cap, 0, sizeof(cap));
        if (ioctl(tfd, VIDIOC_QUERYCAP, &cap) < 0) {
            close(tfd);
            continue;
        }

        if (strcmp((const char *)cap.card, "Qualcomm Venus video
encoder") == 0) {
            fprintf(stderr, "Found %s (%s, fd %i)\n", cap.card, pathbuf, tfd);
            fd = tfd;
            break;
        }
    }

    if (fd < 0) {
        fprintf(stderr, "Found no encoder\n");
        return 1;
    }

    // 1. Set the coded format on the CAPTURE queue via VIDIOC_S_FMT().
    struct v4l2_format fmt;
    memset(&fmt, 0, sizeof(fmt));
    fmt.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
    fmt.fmt.pix_mp.pixelformat = V4L2_PIX_FMT_H264;
    fmt.fmt.pix_mp.num_planes = 1;
    fmt.fmt.pix_mp.width = width;
    fmt.fmt.pix_mp.height = height;
    fmt.fmt.pix_mp.plane_fmt[0].sizeimage = 1024 * 1024;
    xioctl(fd, VIDIOC_S_FMT, &fmt);

    // 2. Optional. Enumerate supported OUTPUT formats (raw formats
for source) for the selected
    // coded format via VIDIOC_ENUM_FMT().
    struct v4l2_fmtdesc fmtdesc;
    memset(&fmtdesc, 0, sizeof(fmtdesc));
    fmtdesc.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
    while (ioctl(fd, VIDIOC_ENUM_FMT, &fmtdesc) == 0) {
        char fcc[4];
        memcpy(fcc, &fmtdesc.pixelformat, 4);
        fprintf(stderr, "Output format %i: %c%c%c%c: %s\n",
fmtdesc.index, fcc[0], fcc[1], fcc[2], fcc[3], fmtdesc.description);
        fmtdesc.index += 1;
    }

    // Let's do the same with CAPTURE
    memset(&fmtdesc, 0, sizeof(fmtdesc));
    fmtdesc.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
    while (ioctl(fd, VIDIOC_ENUM_FMT, &fmtdesc) == 0) {
        char fcc[4];
        memcpy(fcc, &fmtdesc.pixelformat, 4);
        fprintf(stderr, "Capture format %i: %c%c%c%c: %s\n",
fmtdesc.index, fcc[0], fcc[1], fcc[2], fcc[3], fmtdesc.description);
        fmtdesc.index += 1;
    }

    // 3. Set the raw source format on the OUTPUT queue via VIDIOC_S_FMT().
    memset(&fmt, 0, sizeof(fmt));
    fmt.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
    fmt.fmt.pix_mp.pixelformat = V4L2_PIX_FMT_NV12;
    fmt.fmt.pix_mp.width = width;
    fmt.fmt.pix_mp.height = height;
    xioctl(fd, VIDIOC_S_FMT, &fmt);

    // 4. Set the raw frame interval on the OUTPUT queue via
VIDIOC_S_PARM(). This also sets the
    // coded frame interval on the CAPTURE queue to the same value.
    struct v4l2_streamparm parm;
    memset(&parm, 0, sizeof(parm));
    parm.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
    parm.parm.output.timeperframe.numerator = 1;
    parm.parm.output.timeperframe.denominator = 30;
    xioctl(fd, VIDIOC_S_PARM, &parm);

    // 5. Optional. Set the coded frame interval on the CAPTURE queue
via VIDIOC_S_PARM().
    memset(&parm, 0, sizeof(parm));
    parm.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
    parm.parm.capture.timeperframe.numerator = 1;
    parm.parm.capture.timeperframe.denominator = 30;
    xioctl(fd, VIDIOC_S_PARM, &parm);

    // 6. Optional. Set the visible resolution for the stream metadata
via VIDIOC_S_SELECTION() on
    // the OUTPUT queue if it is desired to be different than the full
OUTPUT resolution.

    // 7. Allocate buffers for both OUTPUT and CAPTURE via VIDIOC_REQBUFS().
    // This may be performed in any order.

    struct mmbuffer *captureBufs = NULL;
    size_t captureBufCount;
    { // CAPTURE
        struct v4l2_requestbuffers reqbufs;
        memset(&reqbufs, 0, sizeof(reqbufs));
        reqbufs.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
        reqbufs.memory = V4L2_MEMORY_MMAP;
        reqbufs.count = 4;
        xioctl(fd, VIDIOC_REQBUFS, &reqbufs);

        captureBufCount = reqbufs.count;
        captureBufs = (struct mmbuffer *)malloc(captureBufCount *
sizeof(*captureBufs));
        for (size_t i = 0; i < captureBufCount; ++i) {
            struct v4l2_buffer buffer;
            memset(&buffer, 0, sizeof(buffer));
            struct v4l2_plane plane;
            memset(&plane, 0, sizeof(plane));
            buffer.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
            buffer.length = 1;
            buffer.m.planes = &plane;
            buffer.memory = V4L2_MEMORY_MMAP;
            buffer.index = i;
            xioctl(fd, VIDIOC_QUERYBUF, &buffer);

            captureBufs[i].ready = 1;
            captureBufs[i].start = mmap(NULL, plane.length, PROT_READ
| PROT_WRITE, MAP_SHARED,
                fd, plane.m.mem_offset);
            captureBufs[i].length = plane.length;
            if (captureBufs[i].start == MAP_FAILED) {
                fprintf(stderr, "mmap: %s\n", strerror(errno));
                return 1;
            }

            fprintf(stderr, "Mapped buffer %zi: %p, %i\n", i,
captureBufs[i].start, plane.length);
        }
    }

    struct mmbuffer *outputBufs = NULL;
    size_t outputBufCount;
    { // OUTPUT
        struct v4l2_requestbuffers reqbufs;
        memset(&reqbufs, 0, sizeof(reqbufs));
        reqbufs.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
        reqbufs.memory = V4L2_MEMORY_MMAP;
        reqbufs.count = 4;
        xioctl(fd, VIDIOC_REQBUFS, &reqbufs);

        outputBufCount = reqbufs.count;
        outputBufs = (struct mmbuffer *)malloc(outputBufCount *
sizeof(*captureBufs));
        for (size_t i = 0; i < outputBufCount; ++i) {
            struct v4l2_buffer buffer;
            memset(&buffer, 0, sizeof(buffer));
            struct v4l2_plane plane;
            memset(&plane, 0, sizeof(plane));
            buffer.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
            buffer.length = 1;
            buffer.m.planes = &plane;
            buffer.memory = V4L2_MEMORY_MMAP;
            buffer.index = i;
            xioctl(fd, VIDIOC_QUERYBUF, &buffer);

            outputBufs[i].ready = 1;
            outputBufs[i].start = mmap(NULL, plane.length, PROT_READ |
PROT_WRITE, MAP_SHARED,
                fd, plane.m.mem_offset);
            outputBufs[i].length = plane.length;
            if (outputBufs[i].start == MAP_FAILED) {
                fprintf(stderr, "mmap: %s\n", strerror(errno));
                return 1;
            }

            fprintf(stderr, "Mapped buffer %zi: %p, %i\n", i,
outputBufs[i].start, plane.length);
        }
    }

    // 8. Begin streaming on both OUTPUT and CAPTURE queues via
VIDIOC_STREAMON().
    // This may be performed in any order.

    int buftype = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
    xioctl(fd, VIDIOC_STREAMON, &buftype);

    buftype = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
    xioctl(fd, VIDIOC_STREAMON, &buftype);

    // Then enqueue all the capture buffers, to let the driver put
encoded frames in them
    for (size_t i = 0; i < captureBufCount; ++i) {
        struct v4l2_buffer buffer;
        memset(&buffer, 0, sizeof(buffer));
        struct v4l2_plane plane;
        memset(&plane, 0, sizeof(plane));
        buffer.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
        buffer.index = i;
        buffer.length = 1;
        buffer.m.planes = &plane;
        buffer.memory = V4L2_MEMORY_MMAP;
        xioctl(fd, VIDIOC_QBUF, &buffer);
    }

    // This is the main loop, where we dequeue and re-enqueue
available CAPTURE buffers,
    // dequeue available OUTPUT buffers, and write frames to the OUTPUT
    uint8_t fill = 0;
    while (1) {
        // Handle events from the driver
        struct pollfd pfd = {fd, POLLIN | POLLOUT, 0};
        while (1) {
            int ret = poll(&pfd, 1, 0);
            if (ret < 0 && errno == EINTR) {
                continue;
            } else if (ret < 0) {
                fprintf(stderr, "Poll error: %s\n", strerror(errno));
                return 1;
            } else if (ret == 0) {
                break;
            }

            if (pfd.revents & POLLIN) {
                // A capture buffer is ready, we have encoded data!
                struct v4l2_buffer buffer;
                memset(&buffer, 0, sizeof(buffer));
                struct v4l2_plane plane;
                memset(&plane, 0, sizeof(plane));
                buffer.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
                buffer.memory = V4L2_MEMORY_MMAP;
                buffer.length = 1;
                buffer.m.planes = &plane;
                xioctl(fd, VIDIOC_DQBUF, &buffer);

                // Do something with the data
                struct mmbuffer *buf = &captureBufs[buffer.index];
                fprintf(stderr, "Capture buffer %i dequeued (at: %p,
length: %i)\n", buffer.index, buf->start, plane.bytesused);

                // Re-enqueue the buffer
                size_t index = buffer.index;
                memset(&buffer, 0, sizeof(buffer));
                memset(&plane, 0, sizeof(plane));
                buffer.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
                buffer.memory = V4L2_MEMORY_MMAP;
                buffer.length = 1;
                buffer.m.planes = &plane;
                buffer.index = index;
                xioctl(fd, VIDIOC_QBUF, &buffer);

                fprintf(stderr, "Capture buffer %i enqueued\n", buffer.index);
            }

            if (pfd.revents & POLLOUT) {
                // An output buffer is ready, dequeue it and mark it ready
                struct v4l2_buffer buffer;
                memset(&buffer, 0, sizeof(buffer));
                struct v4l2_plane plane;
                memset(&plane, 0, sizeof(plane));
                buffer.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
                buffer.memory = V4L2_MEMORY_MMAP;
                buffer.length = 1;
                buffer.m.planes = &plane;
                if (ioctl(fd, VIDIOC_DQBUF, &buffer) < 0) {
                    fprintf(stderr, "VIDIOC_DQBUF (output): %s\n",
strerror(errno));
                    return 1;
                }

                fprintf(stderr, "Output buffer %i dequeued, marking
ready\n", buffer.index);
                outputBufs[buffer.index].ready = 1;
            }

            if (pfd.revents & ~(POLLIN | POLLOUT)) {
                fprintf(stderr, "Unexpected revents: %i. Error?\n",
pfd.revents);
                return 1;
            }
        }

        // Find an available output buffer
        int outputIdx = -1;
        struct mmbuffer *outputBuf = NULL;
        for (size_t i = 0; i < outputBufCount; ++i) {
            if (outputBufs[i].ready) {
                outputIdx = i;
                outputBuf = &outputBufs[i];
                break;
            }
        }

        // Produce a raw frame and queue it, if possible
        if (outputBuf) {
            size_t len = width * height + width * height / 2;
            memset(outputBuf->start, fill, len);
            fill += 1;

            struct v4l2_buffer buffer;
            memset(&buffer, 0, sizeof(buffer));
            struct v4l2_plane plane;
            memset(&plane, 0, sizeof(plane));
            buffer.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
            buffer.length = 1;
            buffer.m.planes = &plane;
            buffer.memory = V4L2_MEMORY_MMAP;
            buffer.index = outputIdx;
            plane.bytesused = len;

            if (ioctl(fd, VIDIOC_QBUF, &buffer) < 0) {
                fprintf(stderr, "VIDIOC_QBUF (output): %s\n", strerror(errno));
                return 1;
            }

            fprintf(stderr, "Output buffer %i enqueued, marking not
ready\n", buffer.index);
            outputBufs[outputIdx].ready = 0;
        } else {
            fprintf(stderr, "No output buffers ready!\n");
        }

        usleep(33 * 1000);
    }
}

Any help with this would be greatly appreciated,
because I truly have no idea what I might be doing wrong.

Regards,
Martin
