Return-Path: <linux-media+bounces-47649-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3B4C7F7B2
	for <lists+linux-media@lfdr.de>; Mon, 24 Nov 2025 10:10:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F23AC4E3B57
	for <lists+linux-media@lfdr.de>; Mon, 24 Nov 2025 09:10:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D86392F49E9;
	Mon, 24 Nov 2025 09:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="da4BI0GW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95622F49E3
	for <linux-media@vger.kernel.org>; Mon, 24 Nov 2025 09:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763975427; cv=none; b=Pi6IduKYLbM+xVFZxrOwoTuVJNz1spjvuxsglZARRQS+eGUjNoMO3F/NZ6UPJYMoz7N0rVzkViiAKNMiuGgw/tpfLVQcl/qdPLIuftQxfEObwuSRUay+IOnKOWclMFyw1fInDUB1ZqkOrEwPWXz2mZVTogndYGUYhigDnT6x2hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763975427; c=relaxed/simple;
	bh=sPUy8E3s+P+dVSShif8vlYlGNMtjy1pWL3wnmJTy7VQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=te/ykd7x+P16m0y9UNaOvle3UH5syLzLIsq5P8NXYr7QV6Tj2gsLNXCEytWJqGkG0Cw94iE0xtpstwVEbZKR+njbqS40EBqiP/QJBUDGWg/3myQ1mRfJqD3HjGKBQXiqaDzmyGDpl6STQuiMz4dZsIiTy1k+0ajxni8dq5PMmpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=da4BI0GW; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-30cce892b7dso1626471fac.1
        for <linux-media@vger.kernel.org>; Mon, 24 Nov 2025 01:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763975425; x=1764580225; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SGQ7fOhuGjklM+6EKSeD3AG5lsuiXUEs5XjFzLgCv6g=;
        b=da4BI0GWDryEL0cKXfy+RjfE+ikHO/zBF30Ca7eRT8gkjLoI/gddU/gZtttrMy8UfN
         ZVbZxNdgRvkBjnX159yMRoAwX8ZRHEQtZ2qPXBJdvWkn5evAL5cRAKcZ20awVFdNdrFv
         KojAbJoKVMLGUugztqIDbWLfU+Hhfbe8oHDSR6jk0yzz/M14PQJSgpBKVMxYs8OzetEB
         7Tel1DWn2CYSInZy4pPGjew1qIhohtScEGnrd7gFVbulFfeTfynJ56rDvFmT1/vDkVqV
         +O4hIHib8byFov0g9V2Cj8lxkyTlHpeoXzYnKt65vdytLVoEwilnP8u0bpUBPECvU2tg
         6Sdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763975425; x=1764580225;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SGQ7fOhuGjklM+6EKSeD3AG5lsuiXUEs5XjFzLgCv6g=;
        b=jle4f5OdheDpUOht/gd/CrjLD9FEfBhNWE2eRdY7oxTzTRFbNjIq1D+mZx02hY1iKZ
         SzmUtUXPnuo/Pxzhwb30fzEnbfAq3fycvUyj+U9ywCBJiQ76JkavPTMpRu0af4LR27Ql
         aravyJcyXbmlom6fDNQeZMlxBx96URAkJ9DHTLUgJiq6te7TwA5oT+BeE7+U+mXFm/Ks
         6mFYn2rPWzZpQdlT2AEiqJU1ExpnHqOSyQ2k5YpEFMmfRFKp96H8xBwcWH8MvyYCkUwe
         PVunptFEvyrPVXr4+zDHmjez3C914GIp3o2Q72SpdFZHPplpOSrOCDHhBqye3EK3CWaA
         Sv4Q==
X-Gm-Message-State: AOJu0YxzbPXNywArU2pKqWQXHfmo6csDoDZ72qcOfDu7wH2FRgtpnlmA
	PFPQJGiPkg/0EVu+62cBubh2xXwVvaPw3dJr+QjL1+A7UGBRTeLF0P2iRNqbLqxY8B0zau0bjsr
	f4twvdj9mgZCtpBkStA6LJVMhrDaehlLnkXLNdbs=
X-Gm-Gg: ASbGncu81cw1565E8mEZyjEZMysDu+dOWKSDdrB3dy2MDq466fMyzCSirbPfO1ZmB+L
	CHPF4wty2qq1U3IzanzZn7RAZVMg9GWcH0xtbU+4av4ZA8TwhVzEsTPGLPFcR/Hhatd/jyzvfnf
	QSzbwkR7hgqoVePsKiAmNQ6VOI0Yeg/8s5qjUm5w0e/0N0wUBq8wRlEumXiMQuEqAzPKyivtcDc
	8sblXsbRVncCd97E9N74JxOjPyqR0d1b0AeUjsiyAs4JKL0AYir1iSrq0cO17jxzYKaxLZTMx3T
	BT2rm+4=
X-Google-Smtp-Source: AGHT+IEVIwwxMg1bOJJEduxfdPeXn/dk6N51i3qeLQ7FHMP5vZBFtgD7Xg2AKvvlltkVQY7IPD0Wj6/tVIUIfSbiw/M=
X-Received: by 2002:a05:6830:440c:b0:79f:19f:7f2 with SMTP id
 46e09a7af769-7c798e1b962mr4962438a34.0.1763975424679; Mon, 24 Nov 2025
 01:10:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAN7C2SA34JN71qvqyefmr9h11SsmCaeGGVyc=GW408+MrC-aRg@mail.gmail.com>
 <3qt2yxwubrxhbhst5o2ig5ng4wqokzfg6uqzrtc2lfzq2cjbds@uwdb3zg2a7vi>
 <CAN7C2SC+nDhoHonOB=AkKgsunyijuV0aAYvBJ1C5iaU76Q0U5Q@mail.gmail.com> <57px3akwyj6usy6llbichpu4ioaj7kj2sbv3jzqt3fo4bjknvd@hnw6docub3nr>
In-Reply-To: <57px3akwyj6usy6llbichpu4ioaj7kj2sbv3jzqt3fo4bjknvd@hnw6docub3nr>
From: Sune Brian <briansune@gmail.com>
Date: Mon, 24 Nov 2025 17:10:12 +0800
X-Gm-Features: AWmQ_bk_4Y9UIgG5DVZxyEtCQTUUu26lebYgFP2d8MCfsZt54sHQxArTZGJZ4wQ
Message-ID: <CAN7C2SB1ZG+6or=WMFEYu3DW2e4DBT7QEWE0SzUGt2dn9x=9gQ@mail.gmail.com>
Subject: Re: [HELP] V4L2 kept reporting CROPCAP fail
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Through which app ? which gstreamer version ? which camera input ?
> (I'm trying to identify where I should suggest you to enable debug on,
> without details, it's hard to guess).
>
> > The camera driver w/o any modification works but again
> > that message is so puzzling and I cannot understand why.
> >
> > For kernel 6.12 that is even more trouble but I think if 6.18
> > works why use old kernel when new kernel have its benefit.
> > Yet, still worth to point out the issue a bit.

Sure, I am going to enclose a very long log and brace yourself !!!
Brian

uname -a
Linux nanopi 6.18.0-rc6-00277-gd13f3ac64efb-dirty

v4l2-ctl --version
v4l2-ctl 1.33.0-5422
* system compiled replaced distro default install.
gst-launch-1.0 --version
gst-launch-1.0 version 1.26.0
GStreamer 1.26.0
* distro default
distro - Ubuntu 25.04

* PRINT the ISP links

CAMERA
                [stream:0 fmt:SBGGR10_1X10/2688x1520 field:none
                 crop.bounds:(0,0)/2720x1536
                 crop:(16,8)/2688x1520]
CSI
                [stream:0 fmt:SBGGR10_1X10/2688x1520 field:none]
ISP 0
                [stream:0 fmt:SBGGR10_1X10/2688x1520 field:none
colorspace:raw xfer:none ycbcr:601 quantization:full-range
                 crop.bounds:(0,0)/2688x1520
                 crop:(0,0)/2688x1520]
ISP 2
                [stream:0 fmt:YUYV8_2X8/2688x1520 field:none
colorspace:raw xfer:none ycbcr:601 quantization:lim-range
                 crop.bounds:(0,0)/2688x1520
                 crop:(0,0)/2688x1520]
MAINPATH 0
                [stream:0 fmt:YUYV8_2X8/2688x1520 field:none
colorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range
                 crop.bounds:(0,0)/2688x1520
                 crop:(0,0)/2688x1520]
MAINPATH 1
                [stream:0 fmt:YUYV8_2X8/2688x1520 field:none
colorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range]
vIDEO 0
Format Video Capture Multiplanar:
        Width/Height      : 2688/1520
        Pixel Format      : 'YUYV' (YUYV 4:2:2)
        Field             : None
        Number of planes  : 1
        Flags             :
        Colorspace        : Default
        Transfer Function : Default
        YCbCr/HSV Encoding: Default
        Quantization      : Default
        Plane 0           :
           Bytes per Line : 5376
           Size Image     : 8171520

* debug set to
GST_DEBUG=3

gst-launch-1.0 -e v4l2src device=/dev/video0 io-mode=4 num-buffers=1 ! \
video/x-raw,width=2688,height=1520,format=YUY2 ! \
videoconvert ! \
video/x-raw,format=RGB ! \
pngenc ! filesink location=frame.png

* Image capture

Setting pipeline to PAUSED ...
Pipeline is live and does not need PREROLL ...
0:00:00.189451347  1586 0xffffb8000b70 WARN                    v4l2
gstv4l2object.c:5032:gst_v4l2_object_get_crop_rect:<v4l2src0:src>
VIDIOC_CROPCAP failed
Pipeline is PREROLLED ...
Setting pipeline to PLAYING ...
New clock: GstSystemClock
0:00:00.201199128  1586 0xffffb8000b70 WARN                    v4l2
gstv4l2object.c:5032:gst_v4l2_object_get_crop_rect:<v4l2src0:src>
VIDIOC_CROPCAP failed
Redistribute latency...
Got EOS from element "pipeline0".
EOS received - stopping pipeline...
Execution ended after 0:00:02.288976246
Setting pipeline to NULL ...
Freeing pipeline ...

* Image do successfully capture and normal

Thanks
Brian

