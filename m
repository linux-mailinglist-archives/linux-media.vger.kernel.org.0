Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17714ECEBD
	for <lists+linux-media@lfdr.de>; Sat,  2 Nov 2019 13:50:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726396AbfKBMuQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 2 Nov 2019 08:50:16 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:48463 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726329AbfKBMuQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 2 Nov 2019 08:50:16 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id Qsr2irNawTzKrQsr5id3bI; Sat, 02 Nov 2019 13:50:13 +0100
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [ANN] Report of Media Summit: Codecs
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Tomasz Figa <tfiga@chromium.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Daniel Gomez <daniel@qtec.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Helen Koike <helen.koike@collabora.com>,
        Jan Schmidt <jan@centricular.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Matthew Waters <matthew@centricular.com>
Message-ID: <311a152e-b773-76d6-a17e-86112b583179@xs4all.nl>
Date:   Sat, 2 Nov 2019 13:50:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJkEjYSNxBpJByQzPwjDgHP7dL/C8fHZmEC+5cCTutJhGssxLXFUUqE2LYjdhF7zDXBHShr+p1ayr2IxvzdvnMO1bn80+9GQng9t6VbcKK1EuwiIPlLz
 uNDFEgt2KuewfHENibM2RnJ0FYdhnw9oPe0ItKv6qNp8eRBcNSUCOGifumQI3D6l43OkG40STEPuFomBqhBC5mQwteVJ8RPDSXkBgNI8ggw+6RGDH8+ZlCFu
 fA/m821tNIndZXTeT3BplKHI6z40Ofb4KLkRyyE2FK/Qn3vBgeLDsKX74hZkz+P9i8HN8+54kivFXWdeayE2t8+9a0KJ7UkWB2qXnq5qEZKtEFlSU8BFBtpt
 qEY6W/XidEMkzW1f6/RZz2oKigBwtOqArlrn6vGQV48JjZwD8msrtkXPP5zayKsFn53wrsJ/paHcg3iz91z026XaIkQcI0M3M+coZWCSmNg++Ublu/n3syhN
 t1R5QT2xLEg5zAnqMCpL2h9akUxfxVdOlN69rNLGEYFNEKJPmmjyOeO5rhGn9Bh2jvhJbMJUU8TgGPk3QibwZ44HGy3PzfB2TVU9xk8/M0aN5uxVs9EkOHru
 IQuWNcKjkYTEEeswPHz3LbW6b2d/Ioi1X2m+iMTQmiuoVGAqoMydrpTlTXATkEhbQXvQOlTLkWVS0u9CV3bK8Q5jsRO35+KOdv1+fanNZhiw/1FO2eRI+dq9
 ZBMBmKkLldNDa7J7WBfr7TeVDNS7EhOC
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Media Summit: Codecs
October 29, 2019 - Lyon, France

Many thanks to the Linux Foundation for hosting this meeting. Much appreciated!

Please reply to this report with any comments/corrections. Especially if I missed
any action items!


Original announcement:

https://lore.kernel.org/linux-media/c8380b43-2742-f1cb-0fb9-2c3c90e29a33@xs4all.nl/T/


Attendees:

Boris Brezillon <boris.brezillon@collabora.com>
Alexandre Courbot <acourbot@chromium.org>, Google Chrome OS
Nicolas Dufresne <nicolas@ndufresne.ca>
Tomasz Figa <tfiga@chromium.org>, Google Chrome OS
Ezequiel Garcia <ezequiel.garcia@collabora.com>
Daniel Gomez <daniel@qtec.com>
Peter Griffin <Peter.griffin@linaro.org>
Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Bootlin
Helen Koike <helen.koike@collabora.com>
Jan Schmidt <jan@centricular.com>
Dave Stevenson <dave.stevenson@raspberrypi.org>
Michael Tretter <m.tretter@pengutronix.de>
Stanimir Varbanov <stanimir.varbanov@linaro.org>
Hans Verkuil <hverkuil@xs4all.nl>, Cisco Systems Norway
Matthew Waters <matthew@centricular.com>


Discussion of pending codec patches
-----------------------------------

A v3 series for v5.4 hantro fixes will be posted soon.


Requirements for moving drivers out of staging
----------------------------------------------

- More testing is needed for these two H.264 and HEVC features:
  Multiview (used by 3D video, hantro supports this)
  Stream with sublayers

- Improve standard references in the control metadata documentation.

- Look into the ability to add fields to a compound control in the
  future: requires some investigation into the control framework.
  Helps to make the API more future proof.

- Document that metadata controls must stick to the standard as much
  as possible. No hardware specific data is allowed.

- At least one stateless encoder should be present, ideally for each
  codec. This is needed to see if the existing metadata controls can
  be reused by encoders. Check the Intel encoder and VA API. Also
  check if there is any source code for the AMD encoder.

  For reference: this is the Rockchip H.264 stateless encoder metadata:

	struct rk3288_h264e_reg_params {
		u32 frame_coding_type;
		s32 pic_init_qp;
		s32 slice_alpha_offset;
		s32 slice_beta_offset;
		s32 chroma_qp_index_offset;
		s32 filter_disable;
		u16 idr_pic_id;
		s32 pps_id;
		s32 frame_num;
		s32 slice_size_mb_rows;
		s32 h264_inter4x4_disabled;
		s32 enable_cabac;
		s32 transform8x8_mode;
		s32 cabac_init_idc;
		/* rate control relevant */
		s32 qp;
		s32 mad_qp_delta;
		s32 mad_threshold;
		s32 qp_min;
		s32 qp_max;
		s32 cp_distance_mbs;
		s32 cp_target[10];
		s32 target_error[7];
		s32 delta_qp[7];
	};

  And this is the VP8 metadata:

	struct rk3399_vp8e_reg_params {
		u32 is_intra;
		u32 frm_hdr_size;
		u32 qp;
		s32 mv_prob[2][19];
		s32 intra_prob;
		u32 bool_enc_value;
		u32 bool_enc_value_bits;
		u32 bool_enc_range;
		u32 filterDisable;
		u32 filter_sharpness;
		u32 filter_level;
		s32 intra_frm_delta;
		s32 last_frm_delta;
		s32 golden_frm_delta;
		s32 altref_frm_delta;
		s32 bpred_mode_delta;
		s32 zero_mode_delta;
		s32 newmv_mode_delta;
		s32 splitmv_mode_delta;
	};

	Source:
https://chromium.googlesource.com/chromiumos/third_party/libv4lplugins/+/79286ece8624ab016575a5ad8965a61b334ab169/libv4l-rockchip_v2/libvepu/common/rk_venc.h

  And the metadata for cedrus:

	struct h264enc_params {
		unsigned int width;
		unsigned int height;
		unsigned int src_width;
		unsigned int src_height;
		enum color_format { H264_FMT_NV12 = 0, H264_FMT_NV16 = 1 } src_format;
		unsigned int profile_idc, level_idc;
		enum { H264_EC_CAVLC = 0, H264_EC_CABAC = 1 } entropy_coding_mode;
		unsigned int qp;
		unsigned int keyframe_interval;
	};

        Source: https://github.com/jemk/cedrus/blob/master/h264enc/h264enc.c

  Cisco also has a requirement that the bitrate can be controlled per-frame.

  Conclusion: stateless encoder support needs some research. However, the general
  suspicion is that the decoder metadata controls are unlikely to be reused for
  stateless encoders.


Finalize Stateful Encoder
-------------------------

Currently S_PARM/ENUM_FRAMEINTERVALS is used to set the framerate which is needed
by encoders together with the desired bitrate to determine the compression ratio.

After some discussion we realized that this should actually refer to the rate at
which the encoder produces compressed frames: this is needed when you want to
encoder multiple streams in parallel and you want to indicate how the encoder
hardware should balance these encoder processes. E.g. the Xilinx encoder can
reserve N encoding cores depending on the demand.

Setting the actual framerate (which is needed to determine the compression ratio)
is separate from this and should be done through a new control of type v4l2_fract
that indicates the framerate (not interval, the userspace people very much preferred
framerate over frameinterval).

This requires the introduction of V4L2_CTRL_WHICH_{MIN,MAX}_VAL to obtain the min
and max values of a compound control. But this tries in nicely with the work
Ricardo Ribalda Delgado is doing for the V4L2_CTRL_TYPE_AREA controls.

Hans will implement this in the control framework, Michael Tretter will add support
for this in his Xilinx driver.


The other outstanding issue with stateful encoders is what to do if the capture
buffer is too small. It turns out that it is next to impossible to precisely
predict the minimum size of a capture buffers, so some mechanism is needed to
handle this corner case.

We agreed that the best way is to mark the capture buffer that's too small with
V4L2_BUF_FLAG_ERROR and indicate that the reason is that it is too small with
a new buffer flag: V4L2_BUF_FLAG_TOO_SMALL (0x00080000). When userspace sees
this it should stop streaming on the capture side, reallocate and requeue
capture buffers, and restart streaming.

This will work fine if there are no B frames. If the encoder produces B frames
as well, then this approach can produce an invalid stream. The only way this can
be resolved is if the HW/FW can rollback its internal state to before the point
this error was detected. In the future we need a pixelformat flag to indicate
that the HW/FW can rollback.

If the HW can fragment the encoded frames over multiple capture buffers, then it
should do so. The driver should set V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM for
this. However, this feature should probably be expliticly requested. This can be
done through a new V4L2_PIX_FMT_FLAG_ flag. Some more discussion is needed for this.


Nicolas mentioned that some codec drivers used to return wrong values for
ENUM_FRAMEINTERVALS (swapped numerator/denominator): v4l2-compliance should check
if the returned values are sane.

Nicolas also mentioned that it is not clear how drivers should round S_FMT
resolutions for codecs: this is currently driver specific. He would like this
to be documented (and checked) as rounding up.


Touched upon but not really discussed in-depth: SVC (Scalable Video Coding)
support.


Action Items
------------

Hans Verkuil:

- Ask Cisco colleagues which bitrate-related parameters have to be per-frame for
  an encoder
- make stateful encoder infrastructure + documentation for the missing bits
- investigate using different sizes for metadata controls in the control framework:
  is this possible?

Michael Tretter:

- Support the new encoder stateful controls in the driver

Tomasz Figa:

- look up AMD encoder support

Boris Brezillon:

- send v3 of hantro g1 fixes

Nicolas Dufresne:

- look into multiview and sublayers support

Paul Kocialkowski:

- check metadata controls against the standards and update the docs if needed

Ezequiel Garcia and Boris Brezillon:

- add VP9 support

