Return-Path: <linux-media+bounces-45934-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EA433C19D33
	for <lists+linux-media@lfdr.de>; Wed, 29 Oct 2025 11:45:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B5BB9564B46
	for <lists+linux-media@lfdr.de>; Wed, 29 Oct 2025 10:38:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B23003346A2;
	Wed, 29 Oct 2025 10:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nZ0nvffT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5192DC76B
	for <linux-media@vger.kernel.org>; Wed, 29 Oct 2025 10:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761733838; cv=none; b=OXIEX0MPHIIj2XQqmz1fYt7yOwHDMLFqLGqEBF77tbi6JvxtVo1aue8jBYOfIc/d7oqewhNmU0Bd5CMfHGd+80Sl7sQAv2XoYPo6XA+C80SL4jAb3p6dYqEUQPTkonzyGS4kiOhRbbfOWlF9nEVs5mhuZC2VEQX1z3t9yQpIVzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761733838; c=relaxed/simple;
	bh=Yy09G9oEtbZ16ELXgMJMoG+B1gUDzONzof/no1EK12Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iFf++Xs3Z2+xJumHCemhE8sF/dx//yUWK+MJ+LVfCMjAHkNQrddWtHejncCLCdQQOJdigaP+1trN6E0RhdOG7EgYKRof8FNC7ZR8sDpbgdRn+DQz0/6M4/rPwCFhWnDMu+wB0Y8M3Z1h0Z6DFUmKGdHo8MG9L+bXjJPBkYP6770=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nZ0nvffT; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-378e603f7e4so65523041fa.0
        for <linux-media@vger.kernel.org>; Wed, 29 Oct 2025 03:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1761733834; x=1762338634; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zAk1NteFooOFNt9HpHhjSeM7o2+eVRnucBTBl4R5fNk=;
        b=nZ0nvffT0Yk2RDNkFEu6MgQTPIYvVlot9r9R7ic4b+g5iHbT5mCfR28QRmqZb/RID7
         2dfSsl8TjtOAszD7qkSnqWy+gblXyQ3fGKiz2fWicGWYWEU4IDVBfkToZsE39HXuQDfZ
         l8veptAQfIdbmOG+2h715Pj8r0K88YBm7zAiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761733834; x=1762338634;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zAk1NteFooOFNt9HpHhjSeM7o2+eVRnucBTBl4R5fNk=;
        b=QguZEeN5nb7cq//ji6mIJDcsaNnchgBxiWqJtFrxJEYBnX/kb2GXIPoq5CAnQoOXPb
         qbUiZSC3cBqzGOU/6ksXjbg0T7nIXsgaI+czI4UayuHIjIEgQMAU+/H5o8PCh+XtXPb6
         K7CBPLwgTHBDF0UM9eL3Rfxfbws+XXKGRDW3q2FwtcnYbdku8/nWBAxGyCFHpl9TBuJE
         G7I3NKCTA+4wdaxc23Qt78hjfw4TKC+AQk4ez116GSnRzQzRjberOn4VUYAmxvsLPcn1
         NHYfHflGBaSlHnuJ/dwO0ooSBVcgl7gTmwIqi69DcwGRZ1vILG9wHFcpc5OZpuAs0k1I
         rzbw==
X-Gm-Message-State: AOJu0YzuBxBEts2lNj499zO6UQ7Cy0kpvkBcGdmSvbR0az6HLHRCWj9t
	OSz+sXBnzBnn74YjL5Uq5vhdowRzWzpAmGoqxnVbELdZzVCuwOXp6mR//HgO3OpdqMd28+hG72y
	paZc=
X-Gm-Gg: ASbGncsB10j/AuEHU6ADxPZJDTdCKBlt/Xv+irnuOIDhFQFzqBZWCMTqmEqRZxYLUBT
	DaSMvbjumRcR9iSlDV/teA4E6zw86BbYLvSDw3XsrZOIekTdOeGN7s9NWDEMNy6lIlpJ3fh1rtV
	GGP1fOSWm2LlLTVBw6LLlhCqzuft6gp9Vuph2aq47RCkx5r6nYQbqrJKyY/+NdHh+qORJvhavK6
	dt4lNbFLJav+GbqG8R2IjAuum2T86C5CjX7OoKGZdEWnoUkwIWEufUkzVqTdCWjZbOG060+qgLK
	pM5NrGJcrzJvt6YqbLVHehx5zrwqVmwnDzkwUY797UoCc1Fbfkt9cjuVBqWHP4W0qstl1CKqZfo
	hYiEo9REwfBt26FDjKaVkd2uycvXYqHN/FLZzAYxpJgQteZPOpc2jnO740GBP8EG1alniBRv85I
	yxDVecNm2YZWfcBs3yUgiMA+kg3vxvvMfhkkPicWd+9Q==
X-Google-Smtp-Source: AGHT+IElGp5RL9/EyeG9ZpPGQQbDSGyvCnAPMGn2ozKcMZpokTvCb+8CyTpELELE/hUB3Xc59OR2QQ==
X-Received: by 2002:a05:6512:3b91:b0:592:fbb1:c31c with SMTP id 2adb3069b0e04-5941287939fmr763529e87.20.1761733833911;
        Wed, 29 Oct 2025 03:30:33 -0700 (PDT)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com. [209.85.208.178])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59304239899sm3381506e87.95.2025.10.29.03.30.33
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 03:30:33 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-36d77de259bso46277431fa.3
        for <linux-media@vger.kernel.org>; Wed, 29 Oct 2025 03:30:33 -0700 (PDT)
X-Received: by 2002:a05:6512:1087:b0:592:f40a:25f3 with SMTP id
 2adb3069b0e04-594128bc800mr788743e87.27.1761733833095; Wed, 29 Oct 2025
 03:30:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <b960f0fc-36e9-46c3-b56f-a06f6525d5ad@kernel.org>
In-Reply-To: <b960f0fc-36e9-46c3-b56f-a06f6525d5ad@kernel.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 29 Oct 2025 11:30:19 +0100
X-Gmail-Original-Message-ID: <CANiDSCsh1_1G_8QPBE88eTrOb3TLPfuJryEgfQQxYjJsOR3Zdg@mail.gmail.com>
X-Gm-Features: AWmQ_bnG6TrGMVBsN7ppPJ_71J4Ojp2Kvgjyy2RRs6MrZIKI3eYl72gvRtE2ouM
Message-ID: <CANiDSCsh1_1G_8QPBE88eTrOb3TLPfuJryEgfQQxYjJsOR3Zdg@mail.gmail.com>
Subject: Re: [PATCH] v4l2-compliance: skip V4L2_CID_PRIVATE_BASE check for UVC
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Hans

Thanks for the patch

On Wed, 29 Oct 2025 at 11:15, Hans Verkuil <hverkuil+cisco@kernel.org> wrote:
>
> UVC doesn't support V4L2_CID_PRIVATE_BASE, so skip the check.
>
> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
Tested-by: Ricardo Ribalda <ribalda@chromium.org>
> ---

I have used this patch on top of v4l2-utils 1.28
Using a kernel 6.12 +
https://patchwork.linuxtv.org/project/linux-media/patch/20251028-uvc-fix-which-v1-1-a7e6b82672a3@chromium.org/

The missing error is due to a non compliant module. Working also to fix that.

Regards!


v4l2-compliance 1.28.1GIT_COMMIT_CNT, 64 bits, 64-bit time_t
v4l2-compliance SHA: GIT_SHA GIT_COMMIT_DATE

Compliance test for uvcvideo device /dev/video0:

Driver Info:
        Driver name      : uvcvideo
        Card type        : ACER FHD VHDR User Facing: ACER
        Bus info         : usb-0000:00:14.0-6
        Driver version   : 6.12.45
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
        Model            : ACER FHD VHDR User Facing: ACER
        Serial           : 200901010001
        Bus info         : usb-0000:00:14.0-6
        Media version    : 6.12.45
        Hardware revision: 0x00000015 (21)
        Driver version   : 6.12.45
Interface Info:
        ID               : 0x03000002
        Type             : V4L Video
Entity Info:
        ID               : 0x00000001 (1)
        Name             : ACER FHD VHDR User Facing: ACER
        Function         : V4L2 I/O
        Flags            : default
        Pad 0x01000007   : 0: Sink
          Link 0x02000010: from remote pad 0x100000a of entity
'Extension 4' (Video Pixel Formatter): Data, Enabled, Immutable

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
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
                fail: v4l2-test-controls.cpp(571): could not set maximum value
        test VIDIOC_G/S_CTRL: FAIL
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 16 Private Controls: 1
        Standard Compound Controls: 0 Private Compound Controls: 1

Format ioctls (Input 0):
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
                warn: v4l2-test-formats.cpp(1110): Could not set fmt2
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
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)
        test blocking wait: OK

Total for uvcvideo device /dev/video0: 49, Succeeded: 48, Failed: 1, Warnings: 1

