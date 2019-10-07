Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34BF0CE6F4
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 17:12:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728519AbfJGPMj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 11:12:39 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:41441 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726334AbfJGPMj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 7 Oct 2019 11:12:39 -0400
Received: from [IPv6:2001:983:e9a7:1:3d61:cdd2:8085:cc8] ([IPv6:2001:983:e9a7:1:3d61:cdd2:8085:cc8])
        by smtp-cloud8.xs4all.net with ESMTPA
        id HUgbiQKwJop0AHUgciIxxp; Mon, 07 Oct 2019 17:12:36 +0200
Subject: Re: [PATCH 0/2] media: meson: vdec: Add compliant H264 support
To:     Maxime Jourdan <mjourdan@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>
Cc:     Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org
References: <20191007145909.29979-1-mjourdan@baylibre.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <8563127e-fe2c-a633-556b-8a883cebb171@xs4all.nl>
Date:   Mon, 7 Oct 2019 17:12:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191007145909.29979-1-mjourdan@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfC6BOvYYABLQppUZDsWuWCv7V0/FTqcjtJekO917tM0rMXM8cBGGw7wlmLJUEz9LEpZEpUlBhMHyvdHrQVxCyOAL+c8kgDyrVHP43YH92ZrDfESmROBd
 q3eytp8N5zcThju7XelwC5qqi6rdZLmsSWY0UGwVgjJVezpHB1bU+uMjxdNesFnI2hYaMMUv9bLbdufuIz37jAFrCSdBKO/VA8WLCFzeO6IUSA2DKRnq0+R2
 tyDXf88C8nBDwxMgVFZcFyYxGrjqSHujAxRNdh/uFy6aECampq0RJAsoT/04m1Yw+sOaGFKxqw3D4A3rfkA2uEyWmBiY6sNLSu8hNOOGd5anYIXE1E7mhlp5
 1jbh4ShIXohO5qrozt1JesiA2nszc6J1FTyju8d1mTFtVvrBmvt4RYbPEZ1l2kV/BRQMhjuJ7dnGF7lPcLmnzHZtKx/oCKokKmvzS8Iwnf3+bYUpMRvnUMel
 l/Ew3RG4Hbk9/B8QMYV7QZ7pBvNSGYj2b2OBx6xsSQCmwOAS6tWbA6niRkeOQWFUNs132rTGyNsEGuktvCRockxAOjCy7FI4OfvirPlGT6bV9hH7uGdbTwr6
 ofLY3cL/DA14cgvmEodViAjqZblWPX8Paokj9AIAFiCjS2TY7OV6py20fwdK9HnsnBKjPaV5aTUix/qA2Gaspz7h
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/7/19 4:59 PM, Maxime Jourdan wrote:
> Hello,
> 
> This patch series aims to bring H.264 support as well as compliance update
> to the amlogic stateful video decoder driver.
> 
> There is 1 issue that remains currently:
> 
>  - The following codepath had to be commented out from v4l2-compliance as
> it led to stalling:
> 
> if (node->codec_mask & STATEFUL_DECODER) {
> 	struct v4l2_decoder_cmd cmd;
> 	buffer buf_cap(m2m_q);
> 
> 	memset(&cmd, 0, sizeof(cmd));
> 	cmd.cmd = V4L2_DEC_CMD_STOP;
> 
> 	/* No buffers are queued, call STREAMON, then STOP */
> 	fail_on_test(node->streamon(q.g_type()));
> 	fail_on_test(node->streamon(m2m_q.g_type()));
> 	fail_on_test(doioctl(node, VIDIOC_DECODER_CMD, &cmd));
> 
> 	fail_on_test(buf_cap.querybuf(node, 0));
> 	fail_on_test(buf_cap.qbuf(node));
> 	fail_on_test(buf_cap.dqbuf(node));
> 	fail_on_test(!(buf_cap.g_flags() & V4L2_BUF_FLAG_LAST));
> 	for (unsigned p = 0; p < buf_cap.g_num_planes(); p++)
> 		fail_on_test(buf_cap.g_bytesused(p));
> 	fail_on_test(node->streamoff(q.g_type()));
> 	fail_on_test(node->streamoff(m2m_q.g_type()));
> 
> 	/* Call STREAMON, queue one CAPTURE buffer, then STOP */
> 	fail_on_test(node->streamon(q.g_type()));
> 	fail_on_test(node->streamon(m2m_q.g_type()));
> 	fail_on_test(buf_cap.querybuf(node, 0));
> 	fail_on_test(buf_cap.qbuf(node));
> 	fail_on_test(doioctl(node, VIDIOC_DECODER_CMD, &cmd));
> 
> 	fail_on_test(buf_cap.dqbuf(node));
> 	fail_on_test(!(buf_cap.g_flags() & V4L2_BUF_FLAG_LAST));
> 	for (unsigned p = 0; p < buf_cap.g_num_planes(); p++)
> 		fail_on_test(buf_cap.g_bytesused(p));
> 	fail_on_test(node->streamoff(q.g_type()));
> 	fail_on_test(node->streamoff(m2m_q.g_type()));
> }
> 
> The reason for this is because the driver has a limitation where all
> capturebuffers must be queued to the driver before STREAMON is effective.
> The firmware needs to know in advance what all the buffers are before
> starting to decode.
> This limitation is enforced via q->min_buffers_needed.
> As such, in this compliance codepath, STREAMON is never actually called
> driver-side and there is a stall on fail_on_test(buf_cap.dqbuf(node));

That's interesting. I will have to look more closely at this.

> 
> 
> One last detail: V4L2_FMT_FLAG_DYN_RESOLUTION is currently not recognized
> by v4l2-compliance, so it was left out for the test. However, it is
> present in the patch series.

It is definitely recognized by v4l2-compliance.

> 
> The second patch has 3 "Alignment should match open parenthesis" lines
> where I preferred to keep them that way.
> 
> Thanks Stanimir for sharing your HDR file creation tools, this was very
> helpful :).
> 
> Maxime
> 
> # v4l2-compliance --stream-from-hdr test-25fps.h264.hdr -s250
> v4l2-compliance SHA: a162244d47d4bb01d0692da879dce5a070f118e7, 64 bits

But this SHA isn't in the v4l-utils repo, so this makes me wonder where you
got this repo from.

Regards,

	Hans

> 
> Compliance test for meson-vdec device /dev/video0:
> 
> Driver Info:
> 	Driver name      : meson-vdec
> 	Card type        : Amlogic Video Decoder
> 	Bus info         : platform:meson-vdec
> 	Driver version   : 5.4.0
> 	Capabilities     : 0x84204000
> 		Video Memory-to-Memory Multiplanar
> 		Streaming
> 		Extended Pix Format
> 		Device Capabilities
> 	Device Caps      : 0x04204000
> 		Video Memory-to-Memory Multiplanar
> 		Streaming
> 		Extended Pix Format
> 	Detected Stateful Decoder
> 
> Required ioctls:
> 	test VIDIOC_QUERYCAP: OK
> 
> Allow for multiple opens:
> 	test second /dev/video0 open: OK
> 	test VIDIOC_QUERYCAP: OK
> 	test VIDIOC_G/S_PRIORITY: OK
> 	test for unlimited opens: OK
> 
> Debug ioctls:
> 	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> 	test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
> 	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> 	test VIDIOC_ENUMAUDIO: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDIO: OK (Not Supported)
> 	Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
> 	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> 	Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
> 	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> 	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> 	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> 	test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls:
> 	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
> 	test VIDIOC_QUERYCTRL: OK
> 	test VIDIOC_G/S_CTRL: OK
> 	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
> 	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
> 	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> 	Standard Controls: 2 Private Controls: 0
> 
> Format ioctls:
> 	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> 	test VIDIOC_G/S_PARM: OK (Not Supported)
> 	test VIDIOC_G_FBUF: OK (Not Supported)
> 	test VIDIOC_G_FMT: OK
> 	test VIDIOC_TRY_FMT: OK
> 	test VIDIOC_S_FMT: OK
> 	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> 	test Cropping: OK (Not Supported)
> 	test Composing: OK (Not Supported)
> 	test Scaling: OK
> 
> Codec ioctls:
> 	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> 	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> 	test VIDIOC_(TRY_)DECODER_CMD: OK
> 
> Buffer ioctls:
> 	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> 	test VIDIOC_EXPBUF: OK
> 	test Requests: OK (Not Supported)
> 
> Test input 0:
> 
> Streaming ioctls:
> 	test read/write: OK (Not Supported)
> 	test blocking wait: OK
> 	Video Capture Multiplanar: Captured 250 buffers   
> 	test MMAP (select): OK
> 	Video Capture Multiplanar: Captured 250 buffers   
> 	test MMAP (epoll): OK
> 	test USERPTR (select): OK (Not Supported)
> 	test DMABUF: Cannot test, specify --expbuf-device
> 
> Total for meson-vdec device /dev/video0: 49, Succeeded: 49, Failed: 0, Warnings: 0
> 
> Maxime Jourdan (2):
>   media: meson: vdec: bring up to compliance
>   media: meson: vdec: add H.264 decoding support
> 
>  drivers/staging/media/meson/vdec/Makefile     |   2 +-
>  drivers/staging/media/meson/vdec/codec_h264.c | 482 ++++++++++++++++++
>  drivers/staging/media/meson/vdec/codec_h264.h |  14 +
>  drivers/staging/media/meson/vdec/esparser.c   |  34 +-
>  drivers/staging/media/meson/vdec/vdec.c       |  70 ++-
>  drivers/staging/media/meson/vdec/vdec.h       |  14 +-
>  .../staging/media/meson/vdec/vdec_helpers.c   |  85 ++-
>  .../staging/media/meson/vdec/vdec_helpers.h   |   6 +-
>  .../staging/media/meson/vdec/vdec_platform.c  |  43 ++
>  9 files changed, 654 insertions(+), 96 deletions(-)
>  create mode 100644 drivers/staging/media/meson/vdec/codec_h264.c
>  create mode 100644 drivers/staging/media/meson/vdec/codec_h264.h
> 

