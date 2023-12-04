Return-Path: <linux-media+bounces-1541-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 119798032B1
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 13:30:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 94A6EB20B1B
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 12:30:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D19F422EEE;
	Mon,  4 Dec 2023 12:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u7zOMsTy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A3EA107
	for <linux-media@vger.kernel.org>; Mon,  4 Dec 2023 04:30:26 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-40c032962c5so24988325e9.3
        for <linux-media@vger.kernel.org>; Mon, 04 Dec 2023 04:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701693024; x=1702297824; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LnurAMgPTNtYPhlalbgbBo9KUl/1DX0Eg73UPMVA0ww=;
        b=u7zOMsTyv7PsLC7LlDPItVi1vfmonzgMaZ5vMVQhe+wXztJ+l/M/XSZ9l92XD5MDfn
         hET0ZSsccGn1DwYRO4fCFQbwpI+PVEvN8zGuICGrRoD8l/i0Ij29TYEzLAiyAjDm9egW
         ka57ATJ2Rb9rVY3izXwGCqYM4/wEzMgpEqlc017iwJ6woUljdhLyisGFxe3KrrWZXN62
         aDQFWFsYa6w8c4QQfxckFICxAMJEfFvCHhWpeBhGlHA8QbDxVuL4S8+m0NhYz0TFMpho
         SK6eLFgdfyf/vCq3F+iyRLqaYZU02rgfYv7ic2tLLTYdIy8nwvi8xueo0CFhXrsRrwgp
         wK6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701693025; x=1702297825;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LnurAMgPTNtYPhlalbgbBo9KUl/1DX0Eg73UPMVA0ww=;
        b=hfRKbA4bwiLpYil0/T2IEMtoqAPGpgSp0Hb/2aDI68lJHw2xVV28BgNSpyjt1GfA4o
         Bp+7lbvIHydaBfbXy++e0V3cRrbEB94mLtATPSuSVuGsiToeS4seAhx85zaVY67tvAcT
         qv36C8GStGeh8sq682HqLKxSrcNWxtLDogjmfeeNa9lWs/PuJ9rolxw8UocdANkwDxph
         fMnnDQNoc1l/UoDQV1vF1TyJB4GwiwmuggEcbpmFpiuaeSGpm31y8Va3TBju7OUNWrpn
         kJpZDVCZXGaMBB6cimnH0QoqWN7anZA6CiDBt6iaWRl4Rz7WtVRXz8GK5j+GcmV003CN
         h+aQ==
X-Gm-Message-State: AOJu0YyLwOC4Ae9sepNkaiE4g55+KFgZJpvVinQ8oa/X3wg9j1U7o22e
	rfYnDuMzGuPSij4bSArADK3qDNvV5Ml35uQpw3A=
X-Google-Smtp-Source: AGHT+IHghZZW0bOcQK0Gj0C6hTvPA6H5Xjz6jh2OoKfo0I8+v8U6i8KwyfVc0xi/+nkk7HJQQOkWEQ==
X-Received: by 2002:a05:600c:43d4:b0:40c:91f:506e with SMTP id f20-20020a05600c43d400b0040c091f506emr824564wmn.126.1701693024746;
        Mon, 04 Dec 2023 04:30:24 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id v9-20020a05600c444900b0040b461550c4sm18555545wmn.42.2023.12.04.04.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 04:30:24 -0800 (PST)
Date: Mon, 4 Dec 2023 15:30:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: nas.chung@chipsnmedia.com
Cc: linux-media@vger.kernel.org
Subject: [bug report] media: chips-media: wave5: Add the v4l2 layer
Message-ID: <f2ba82c3-ff04-4843-acb3-6e43d9156b0e@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Nas Chung,

The patch 9707a6254a8a: "media: chips-media: wave5: Add the v4l2
layer" from Nov 8, 2023 (linux-next), leads to the following Smatch
static checker warning:

	drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c:387 handle_dynamic_resolution_change()
	warn: sleeping in atomic context

drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
    359 static int handle_dynamic_resolution_change(struct vpu_instance *inst)
    360 {
    361         struct v4l2_fh *fh = &inst->v4l2_fh;
    362         struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
    363 
    364         static const struct v4l2_event vpu_event_src_ch = {
    365                 .type = V4L2_EVENT_SOURCE_CHANGE,
    366                 .u.src_change.changes = V4L2_EVENT_SRC_CH_RESOLUTION,
    367         };
    368         struct dec_info *p_dec_info = &inst->codec_info->dec_info;
    369         struct dec_initial_info *initial_info = &inst->codec_info->dec_info.initial_info;
    370 
    371         lockdep_assert_held(&inst->state_spinlock);
                                     ^^^^^^^^^^^^^^^^^^^^
We are holding a spinlock.

    372 
    373         dev_dbg(inst->dev->dev, "%s: rd_ptr %pad", __func__, &initial_info->rd_ptr);
    374 
    375         dev_dbg(inst->dev->dev, "%s: width: %u height: %u profile: %u | minbuffer: %u\n",
    376                 __func__, initial_info->pic_width, initial_info->pic_height,
    377                 initial_info->profile, initial_info->min_frame_buffer_count);
    378 
    379         inst->needs_reallocation = true;
    380         inst->fbc_buf_count = initial_info->min_frame_buffer_count + 1;
    381         if (inst->fbc_buf_count != v4l2_m2m_num_dst_bufs_ready(m2m_ctx)) {
    382                 struct v4l2_ctrl *ctrl;
    383 
    384                 ctrl = v4l2_ctrl_find(&inst->v4l2_ctrl_hdl,
    385                                       V4L2_CID_MIN_BUFFERS_FOR_CAPTURE);
    386                 if (ctrl)
--> 387                         v4l2_ctrl_s_ctrl(ctrl, inst->fbc_buf_count);
                                ^^^^^^^^^^^^^^^^
v4l2_ctrl_lock() is a sleeping lock (mutex).  So we can't call it while
holding a spinlock.

    388         }
    389 
    390         if (p_dec_info->initial_info_obtained) {
    391                 inst->conf_win.left = initial_info->pic_crop_rect.left;
    392                 inst->conf_win.top = initial_info->pic_crop_rect.top;
    393                 inst->conf_win.width = initial_info->pic_width -
    394                         initial_info->pic_crop_rect.left - initial_info->pic_crop_rect.right;
    395                 inst->conf_win.height = initial_info->pic_height -
    396                         initial_info->pic_crop_rect.top - initial_info->pic_crop_rect.bottom;
    397 
    398                 wave5_update_pix_fmt(&inst->src_fmt, initial_info->pic_width,
    399                                      initial_info->pic_height);
    400                 wave5_update_pix_fmt(&inst->dst_fmt, initial_info->pic_width,
    401                                      initial_info->pic_height);
    402         }
    403 
    404         v4l2_event_queue_fh(fh, &vpu_event_src_ch);
    405 
    406         return 0;
    407 }

regards,
dan carpenter

