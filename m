Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40D3010F826
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2019 07:56:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727286AbfLCG4g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Dec 2019 01:56:36 -0500
Received: from mail-ed1-f45.google.com ([209.85.208.45]:42053 "EHLO
        mail-ed1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727192AbfLCG4g (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Dec 2019 01:56:36 -0500
Received: by mail-ed1-f45.google.com with SMTP id e10so2162761edv.9
        for <linux-media@vger.kernel.org>; Mon, 02 Dec 2019 22:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1c9qazyKsSmv2JWzHBY7LJfOEfags/E88SUAezoE49Y=;
        b=gW6qYxVuR5RYg6vOf5BQ8jOB7FHFfPqDdet1RLJcPo8iY6WbT7tE6jsXym/uFHsMrS
         LqdrIwtaG97g7x0Qq7U72/zipKkxGyVKFoln6xFppIBIzlX2IoDZ7grid8tAAdLEKRck
         I2V+ptVU/cmWtyZKgyw+9DABcgC1iDQqifzqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1c9qazyKsSmv2JWzHBY7LJfOEfags/E88SUAezoE49Y=;
        b=Ggji7zNol6RZLR4SlPmvFGFB2/du++4bwzCnJvTFGipjN1xfdzGFrEtdws0WWCt/+r
         xj5/auOzk/l76J17nnBnrf92N4Ujc7YeMDUK7om03aDTkVzxeXJIVr49P4P+0hAW1IB+
         lbSeXMtGu1JNsnL/9TGluhROWYR1XTxwcx0G2WRw/G6QYMNIDW97x+X9F7LAFa1mCYkT
         ihTOWSjMTcOPnk2T9e8mDegs4Dr3YWg3kfKzDUaeARshgqzxbB4pmCG4/vFROqxWjM3s
         K1LTlROlvap+wuMBDLKdMWzOf72PIxA+ddv7BB5ntA9nMjtae651Nvt7UFI88sDxryua
         A54g==
X-Gm-Message-State: APjAAAWkKYqlQ4u9DaYRWaYwVITTQCXCS9PFf+uZbCGLWCUMn55G4BX9
        dsqkm4arhMXsHfmAxYFAqWMVn+LqOBY=
X-Google-Smtp-Source: APXvYqy5mbLND6lwesDQW5wPaFb0CaqCe8Ed38b1ykq3YJHn0yJxx/zpQNWno6UhWf5N0ddjpiaHOQ==
X-Received: by 2002:a05:6402:1694:: with SMTP id a20mr1405271edv.211.1575356192616;
        Mon, 02 Dec 2019 22:56:32 -0800 (PST)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com. [209.85.128.53])
        by smtp.gmail.com with ESMTPSA id by9sm48476edb.30.2019.12.02.22.56.31
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2019 22:56:31 -0800 (PST)
Received: by mail-wm1-f53.google.com with SMTP id s14so2146198wmh.4
        for <linux-media@vger.kernel.org>; Mon, 02 Dec 2019 22:56:31 -0800 (PST)
X-Received: by 2002:a7b:c764:: with SMTP id x4mr18204484wmk.113.1575356190432;
 Mon, 02 Dec 2019 22:56:30 -0800 (PST)
MIME-Version: 1.0
References: <311a152e-b773-76d6-a17e-86112b583179@xs4all.nl>
In-Reply-To: <311a152e-b773-76d6-a17e-86112b583179@xs4all.nl>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 3 Dec 2019 15:56:19 +0900
X-Gmail-Original-Message-ID: <CAAFQd5D7RZOfR-Kwa0-Kawv9ccczC-3YOdmASyRPfHq6q=434w@mail.gmail.com>
Message-ID: <CAAFQd5D7RZOfR-Kwa0-Kawv9ccczC-3YOdmASyRPfHq6q=434w@mail.gmail.com>
Subject: Re: [ANN] Report of Media Summit: Codecs
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Alexandre Courbot <acourbot@chromium.org>,
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
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Nov 2, 2019 at 9:50 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> Media Summit: Codecs
> October 29, 2019 - Lyon, France
>
> Many thanks to the Linux Foundation for hosting this meeting. Much appreciated!
>
> Please reply to this report with any comments/corrections. Especially if I missed
> any action items!
>

Thanks Hans for the report. It looks good to me. Just replied to my
action item inline.

>
> Original announcement:
>
> https://lore.kernel.org/linux-media/c8380b43-2742-f1cb-0fb9-2c3c90e29a33@xs4all.nl/T/
>
>
> Attendees:
>
> Boris Brezillon <boris.brezillon@collabora.com>
> Alexandre Courbot <acourbot@chromium.org>, Google Chrome OS
> Nicolas Dufresne <nicolas@ndufresne.ca>
> Tomasz Figa <tfiga@chromium.org>, Google Chrome OS
> Ezequiel Garcia <ezequiel.garcia@collabora.com>
> Daniel Gomez <daniel@qtec.com>
> Peter Griffin <Peter.griffin@linaro.org>
> Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Bootlin
> Helen Koike <helen.koike@collabora.com>
> Jan Schmidt <jan@centricular.com>
> Dave Stevenson <dave.stevenson@raspberrypi.org>
> Michael Tretter <m.tretter@pengutronix.de>
> Stanimir Varbanov <stanimir.varbanov@linaro.org>
> Hans Verkuil <hverkuil@xs4all.nl>, Cisco Systems Norway
> Matthew Waters <matthew@centricular.com>
>
>
> Discussion of pending codec patches
> -----------------------------------
>
> A v3 series for v5.4 hantro fixes will be posted soon.
>
>
> Requirements for moving drivers out of staging
> ----------------------------------------------
>
> - More testing is needed for these two H.264 and HEVC features:
>   Multiview (used by 3D video, hantro supports this)
>   Stream with sublayers
>
> - Improve standard references in the control metadata documentation.
>
> - Look into the ability to add fields to a compound control in the
>   future: requires some investigation into the control framework.
>   Helps to make the API more future proof.
>
> - Document that metadata controls must stick to the standard as much
>   as possible. No hardware specific data is allowed.
>
> - At least one stateless encoder should be present, ideally for each
>   codec. This is needed to see if the existing metadata controls can
>   be reused by encoders. Check the Intel encoder and VA API. Also
>   check if there is any source code for the AMD encoder.
>
>   For reference: this is the Rockchip H.264 stateless encoder metadata:
>
>         struct rk3288_h264e_reg_params {
>                 u32 frame_coding_type;
>                 s32 pic_init_qp;
>                 s32 slice_alpha_offset;
>                 s32 slice_beta_offset;
>                 s32 chroma_qp_index_offset;
>                 s32 filter_disable;
>                 u16 idr_pic_id;
>                 s32 pps_id;
>                 s32 frame_num;
>                 s32 slice_size_mb_rows;
>                 s32 h264_inter4x4_disabled;
>                 s32 enable_cabac;
>                 s32 transform8x8_mode;
>                 s32 cabac_init_idc;
>                 /* rate control relevant */
>                 s32 qp;
>                 s32 mad_qp_delta;
>                 s32 mad_threshold;
>                 s32 qp_min;
>                 s32 qp_max;
>                 s32 cp_distance_mbs;
>                 s32 cp_target[10];
>                 s32 target_error[7];
>                 s32 delta_qp[7];
>         };
>
>   And this is the VP8 metadata:
>
>         struct rk3399_vp8e_reg_params {
>                 u32 is_intra;
>                 u32 frm_hdr_size;
>                 u32 qp;
>                 s32 mv_prob[2][19];
>                 s32 intra_prob;
>                 u32 bool_enc_value;
>                 u32 bool_enc_value_bits;
>                 u32 bool_enc_range;
>                 u32 filterDisable;
>                 u32 filter_sharpness;
>                 u32 filter_level;
>                 s32 intra_frm_delta;
>                 s32 last_frm_delta;
>                 s32 golden_frm_delta;
>                 s32 altref_frm_delta;
>                 s32 bpred_mode_delta;
>                 s32 zero_mode_delta;
>                 s32 newmv_mode_delta;
>                 s32 splitmv_mode_delta;
>         };
>
>         Source:
> https://chromium.googlesource.com/chromiumos/third_party/libv4lplugins/+/79286ece8624ab016575a5ad8965a61b334ab169/libv4l-rockchip_v2/libvepu/common/rk_venc.h
>
>   And the metadata for cedrus:
>
>         struct h264enc_params {
>                 unsigned int width;
>                 unsigned int height;
>                 unsigned int src_width;
>                 unsigned int src_height;
>                 enum color_format { H264_FMT_NV12 = 0, H264_FMT_NV16 = 1 } src_format;
>                 unsigned int profile_idc, level_idc;
>                 enum { H264_EC_CAVLC = 0, H264_EC_CABAC = 1 } entropy_coding_mode;
>                 unsigned int qp;
>                 unsigned int keyframe_interval;
>         };
>
>         Source: https://github.com/jemk/cedrus/blob/master/h264enc/h264enc.c
>
>   Cisco also has a requirement that the bitrate can be controlled per-frame.
>
>   Conclusion: stateless encoder support needs some research. However, the general
>   suspicion is that the decoder metadata controls are unlikely to be reused for
>   stateless encoders.
>
>
> Finalize Stateful Encoder
> -------------------------
>
> Currently S_PARM/ENUM_FRAMEINTERVALS is used to set the framerate which is needed
> by encoders together with the desired bitrate to determine the compression ratio.
>
> After some discussion we realized that this should actually refer to the rate at
> which the encoder produces compressed frames: this is needed when you want to
> encoder multiple streams in parallel and you want to indicate how the encoder
> hardware should balance these encoder processes. E.g. the Xilinx encoder can
> reserve N encoding cores depending on the demand.
>
> Setting the actual framerate (which is needed to determine the compression ratio)
> is separate from this and should be done through a new control of type v4l2_fract
> that indicates the framerate (not interval, the userspace people very much preferred
> framerate over frameinterval).
>
> This requires the introduction of V4L2_CTRL_WHICH_{MIN,MAX}_VAL to obtain the min
> and max values of a compound control. But this tries in nicely with the work
> Ricardo Ribalda Delgado is doing for the V4L2_CTRL_TYPE_AREA controls.
>
> Hans will implement this in the control framework, Michael Tretter will add support
> for this in his Xilinx driver.
>
>
> The other outstanding issue with stateful encoders is what to do if the capture
> buffer is too small. It turns out that it is next to impossible to precisely
> predict the minimum size of a capture buffers, so some mechanism is needed to
> handle this corner case.
>
> We agreed that the best way is to mark the capture buffer that's too small with
> V4L2_BUF_FLAG_ERROR and indicate that the reason is that it is too small with
> a new buffer flag: V4L2_BUF_FLAG_TOO_SMALL (0x00080000). When userspace sees
> this it should stop streaming on the capture side, reallocate and requeue
> capture buffers, and restart streaming.
>
> This will work fine if there are no B frames. If the encoder produces B frames
> as well, then this approach can produce an invalid stream. The only way this can
> be resolved is if the HW/FW can rollback its internal state to before the point
> this error was detected. In the future we need a pixelformat flag to indicate
> that the HW/FW can rollback.
>
> If the HW can fragment the encoded frames over multiple capture buffers, then it
> should do so. The driver should set V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM for
> this. However, this feature should probably be expliticly requested. This can be
> done through a new V4L2_PIX_FMT_FLAG_ flag. Some more discussion is needed for this.
>
>
> Nicolas mentioned that some codec drivers used to return wrong values for
> ENUM_FRAMEINTERVALS (swapped numerator/denominator): v4l2-compliance should check
> if the returned values are sane.
>
> Nicolas also mentioned that it is not clear how drivers should round S_FMT
> resolutions for codecs: this is currently driver specific. He would like this
> to be documented (and checked) as rounding up.
>
>
> Touched upon but not really discussed in-depth: SVC (Scalable Video Coding)
> support.
>
>
> Action Items
> ------------
>
> Hans Verkuil:
>
> - Ask Cisco colleagues which bitrate-related parameters have to be per-frame for
>   an encoder
> - make stateful encoder infrastructure + documentation for the missing bits
> - investigate using different sizes for metadata controls in the control framework:
>   is this possible?
>
> Michael Tretter:
>
> - Support the new encoder stateful controls in the driver
>
> Tomasz Figa:
>
> - look up AMD encoder support
>

We haven't enabled it on our system yet, but the code is based on the
Mesa Gallium VA state tracker:
https://gitlab.freedesktop.org/mesa/mesa/tree/master/src/gallium/state_trackers/va/
https://gitlab.freedesktop.org/mesa/mesa/tree/master/src/gallium/drivers/radeon/

Best regards,
Tomasz

> Boris Brezillon:
>
> - send v3 of hantro g1 fixes
>
> Nicolas Dufresne:
>
> - look into multiview and sublayers support
>
> Paul Kocialkowski:
>
> - check metadata controls against the standards and update the docs if needed
>
> Ezequiel Garcia and Boris Brezillon:
>
> - add VP9 support
>
