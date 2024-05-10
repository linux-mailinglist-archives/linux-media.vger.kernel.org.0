Return-Path: <linux-media+bounces-11313-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9738C22A0
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 12:58:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2268280E90
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 10:58:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC4C616D317;
	Fri, 10 May 2024 10:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="SA7UjkAQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8096F82C6C
	for <linux-media@vger.kernel.org>; Fri, 10 May 2024 10:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715338721; cv=none; b=XI6I+ADoVg8AaYmd4d06T02LMiul58rhL8vDQPntoPSBE8DJ4N4NEaNyuYsNqsOZRDEoupaWYdKGVb+THP5NiWatxugGYgggLiYfRaqwNuMAGetaN78rcOnzCsH8FZUX2OKYl73vOrpguyEfa5wrlGDX13KNlXWC6112CfXLqaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715338721; c=relaxed/simple;
	bh=VEbzNCuT1mFTYiXRZZ5heOjKQqqV1TmOK3nG9o78ebk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EjF58k9aNcurbErveyKcaUnLbgjp/CynDvq7U9zXG0O5fqO35vAh/sePQmnBzaj+7o0NjhKI0j2hS7b9Aqhq04aW92lKCnVXPWqYUf/P01TnqZ/QNBGHbq1brjrbQ+92Y8mlhZ2936yfZlMdNxw4wLaDwAe+j4A2tEJcihlboNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=SA7UjkAQ; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-de5acdb3838so2024849276.1
        for <linux-media@vger.kernel.org>; Fri, 10 May 2024 03:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1715338717; x=1715943517; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BjnAlPfZY4TfujEcI3iV79jI4S+SSRIgUkbkJdjdqLw=;
        b=SA7UjkAQC/ThzZo71IAdTlmdv/M1rjrt2Lno0X91r2swPBn8yBQasyKeVflUIDoas2
         WLjS+aMDdnBcyfIICnmuhhqbqYD14V0W+ZJtWUXpW9nKzAL0kUq018Ak0qtKPzVrPbSU
         Wqf3clEXmpVKhK8mLri5milJxqNktPx+irPEBHnP+vRSg4/X4J+m8ufIqg0xwiVGb2l3
         hgGQ4b3/OJhGyCIn0u/KMFopLniTQKU1pjJu4joGN1IU5CLPjRCCCpzfm/ANLOkfFMYn
         uphBxyhWsQKAsh4qpHOMsEAHVpQe876pOS/mSC7tMfLj9ZpkVtjmcDKIjPykwo7UZ3HL
         do4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715338717; x=1715943517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BjnAlPfZY4TfujEcI3iV79jI4S+SSRIgUkbkJdjdqLw=;
        b=VX2K5fYSQPrm8GK3HdAHuDQ3SlpA+N0/s7vCdV6sFjvRD4Ylq6d4sKLZcQ+hrHXLBo
         996kMUb6J0EM7rF9DhT/hSbJ/lAttyOzYv+wuZdpC+Ot3SMvifyye8LLqv8zZWvggDkO
         AC2uRLGmejpaoZF23asKIL+kub5CwMtrM/cWK/2aEemwD91v8g4XOVNaL8Omde0ux9el
         pOttW0GIMmPF/vgH1B/vMCSnKISSbD1vGk+QrwO5h1gIxPEyuayw+2duu9yW08RlXBmv
         UCe1c5yU3gXLOblGFH3SMzC9NZHyscvHFsChyJjQpk1C0E4YGCg3ZrLcrLhxRxm2vNZn
         Rc4g==
X-Gm-Message-State: AOJu0Yw0bK8Hco5libVKClYpGgseApGmvOBdTjWhoVo1Qz4rzKeOmYeY
	hnzvu+suYNc0Evkm6QmvRhSiMDGXegehJOiQvIm21fNB6zgGIq3xvXH+eE+QAcgtjoltzGOEDRz
	SYFFNM9o75hmZjntgp4q9tCfmpwEhPCBJgeQhHkpjalUsKIhhq9k=
X-Google-Smtp-Source: AGHT+IG0RfW7jflfPpLtgjWJw4ctWWL94YAeEPTFFUGo/ub0Rqa2ar/Qq2jR9xXFEG/WpPJRc9IzXfmXL0lC7gWsF0A=
X-Received: by 2002:a5b:bc3:0:b0:dc6:cbb9:e with SMTP id 3f1490d57ef6-dee4f36015amr2132631276.41.1715338717286;
 Fri, 10 May 2024 03:58:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <PA6PR03MB1049647A33345EA7C1461EBFC80E72@PA6PR03MB10496.eurprd03.prod.outlook.com>
 <PA6PR03MB10496A3FF3ADC31B5C3D31DE980E72@PA6PR03MB10496.eurprd03.prod.outlook.com>
In-Reply-To: <PA6PR03MB10496A3FF3ADC31B5C3D31DE980E72@PA6PR03MB10496.eurprd03.prod.outlook.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 10 May 2024 11:58:21 +0100
Message-ID: <CAPY8ntCrOqULHF6bXo939PeTFvfmeP6wh9uy7jg+ntRQ9AEQ-Q@mail.gmail.com>
Subject: Re: Reducing Decoding Delay with h264_v4l2m2m on raspberry pi Zero 2
 (bookwrom o.s.)
To: Alessandro Longobardi <alessandro.longobardi@vrmedia.it>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Franco Tecchia <tecchia@vrmedia.it>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alessandro

On Fri, 10 May 2024 at 11:42, Alessandro Longobardi
<alessandro.longobardi@vrmedia.it> wrote:
>
>
> Hi,
> I am using the h264_v4l2m2m decoder with libavcodec on a Raspberry Pi Zer=
o 2 running Bookworm OS. My codec has the AV_CODEC_CAP_DELAY capability set=
, which means "The decoder has a non-zero delay" (reference: https://ffmpeg=
.org/doxygen/6.0/group__lavc__core.html#ga3f55f5bcfbb12e06c7cb1195028855e6)=
. I have observed that the decoder stores N encoded frames before outputtin=
g a decoded frame, and the value of N varies depending on the resolution, w=
ith higher resolution leading to a larger N. It means i have a delay in dec=
oding about N*time_per_frame (e.g., at 25 fps, time_per_frame=3D40 millisec=
onds).

The bcm2835 stateful decoder driver isn't in mainline (yet), so this
is the wrong place to be asking this question.

I've also already responded to your email yesterday and your forum post[1].

It looks like it is FFmpeg getting a little overeager in the number of
buffers it allocates (20 on both OUTPUT and CAPTURE queues), and ends
up trying to fill all buffers on one queue before looking at the other
one, so decode becomes quite lumpy. Reduce the number of OUTPUT
buffers to 2, and after waiting for the DPB to be full, decode latency
is 1 frame (assuming no B-frames).

  Dave

[1] https://forums.raspberrypi.com/viewtopic.php?t=3D370289

> Is there a way to reduce this N value?
>
> I am using an h624 1280x960 baseline streaming, I am observing that it st=
ores internally 4 encoded frames before outputting a decoded one (check the=
 log below):
> AV_CODEC_CAP_DELAY is set for the codec.
> Codec Format: h264_v4l2m2m
> [h264_mp4toannexb @ 0x68201020] The input looks like it is Annex B alread=
y
> [h264_v4l2m2m @ 0x68200490] probing device /dev/video1
> [h264_v4l2m2m @ 0x68200490] driver 'unicam' on card 'unicam' in splane mo=
de
> [h264_v4l2m2m @ 0x68200490] v4l2 output format not supported
> [h264_v4l2m2m @ 0x68200490] probing device /dev/video0
> [h264_v4l2m2m @ 0x68200490] driver 'unicam' on card 'unicam' in splane mo=
de
> [h264_v4l2m2m @ 0x68200490] v4l2 output format not supported
> [h264_v4l2m2m @ 0x68200490] probing device /dev/video31
> [h264_v4l2m2m @ 0x68200490] driver 'bcm2835-codec' on card 'bcm2835-codec=
-encode_image' in mplane mode
> [h264_v4l2m2m @ 0x68200490] v4l2 output format not supported
> [h264_v4l2m2m @ 0x68200490] probing device /dev/video18
> [h264_v4l2m2m @ 0x68200490] driver 'bcm2835-codec' on card 'bcm2835-codec=
-image_fx' in mplane mode
> [h264_v4l2m2m @ 0x68200490] v4l2 output format not supported
> [h264_v4l2m2m @ 0x68200490] probing device /dev/video12
> [h264_v4l2m2m @ 0x68200490] driver 'bcm2835-codec' on card 'bcm2835-codec=
-isp' in mplane mode
> [h264_v4l2m2m @ 0x68200490] v4l2 output format not supported
> [h264_v4l2m2m @ 0x68200490] probing device /dev/video11
> [h264_v4l2m2m @ 0x68200490] driver 'bcm2835-codec' on card 'bcm2835-codec=
-encode' in mplane mode
> [h264_v4l2m2m @ 0x68200490] v4l2 output format not supported
> [h264_v4l2m2m @ 0x68200490] probing device /dev/video10
> [h264_v4l2m2m @ 0x68200490] driver 'bcm2835-codec' on card 'bcm2835-codec=
-decode' in mplane mode
> [h264_v4l2m2m @ 0x68200490] Using device /dev/video10
> [h264_v4l2m2m @ 0x68200490] driver 'bcm2835-codec' on card 'bcm2835-codec=
-decode' in mplane mode
> [h264_v4l2m2m @ 0x68200490] requesting formats: output=3DH264 capture=3DY=
U12
> [h264_v4l2m2m @ 0x68200490] output: H264 16 buffers initialized: 0000x000=
0, sizeimage 00524288, bytesperline 00000000
> [h264_v4l2m2m @ 0x68200490] Driver 'bcm2835-codec': Quirks=3D0
> [h264_v4l2m2m @ 0x68200490] Profile -99 <=3D 0 - check skipped
> [h264_v4l2m2m @ 0x68200490] Format drm_prime chosen by get_format().
> [h264_v4l2m2m @ 0x68200490] avctx requested=3D-1 ((null)) 0x0; get_format=
 requested=3D179 (drm_prime)
> plane_id: 61
> sending an encoded pkt, tot_pkts sent: 1
> [h264_v4l2m2m @ 0x68200490] output set status ON OK
> [h264_v4l2m2m @ 0x68200490] --- output pre VIDIOC_QBUF: index 0, ts=3D0.0=
00001 count=3D0
> [h264_v4l2m2m @ 0x68200490] --- output VIDIOC_QBUF: index 0, ts=3D0.00000=
1 count=3D1
> Execution time of decode_write: 4.303000 milliseconds
> encoded pkt -> decoded frame: 7 millisecs
> sending an encoded pkt, tot_pkts sent: 2
> [h264_v4l2m2m @ 0x68200490] --- output pre VIDIOC_QBUF: index 0, ts=3D0.0=
00002 count=3D0
> [h264_v4l2m2m @ 0x68200490] --- output VIDIOC_QBUF: index 0, ts=3D0.00000=
2 count=3D1
> Execution time of decode_write: 0.648000 milliseconds
> encoded pkt -> decoded frame: 4 millisecs
> sending an encoded pkt, tot_pkts sent: 3
> [h264_v4l2m2m @ 0x68200490] --- output pre VIDIOC_QBUF: index 0, ts=3D0.0=
00003 count=3D0
> [h264_v4l2m2m @ 0x68200490] --- output VIDIOC_QBUF: index 0, ts=3D0.00000=
3 count=3D1
> [h264_v4l2m2m @ 0x68200490] Dq event 5
> [h264_v4l2m2m @ 0x68200490] V4L2 capture changed: alloc=3D0 (32x32) -> (1=
280x960)
> [h264_v4l2m2m @ 0x68200490] Source change: Fmt: YU12, SAR: 0/0, wxh 1280x=
960 crop 1280x960 @ 0,0, reinit=3D1
> [h264_v4l2m2m @ 0x68200490] capture: YU12 20 buffers initialized: 1280x09=
60, sizeimage 01843200, bytesperline 00001280
> [h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 0, ts=3D0.0000=
00 count=3D1
> [h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 1, ts=3D0.0000=
00 count=3D2
> [h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 2, ts=3D0.0000=
00 count=3D3
> [h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 3, ts=3D0.0000=
00 count=3D4
> [h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 4, ts=3D0.0000=
00 count=3D5
> [h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 5, ts=3D0.0000=
00 count=3D6
> [h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 6, ts=3D0.0000=
00 count=3D7
> [h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 7, ts=3D0.0000=
00 count=3D8
> [h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 8, ts=3D0.0000=
00 count=3D9
> [h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 9, ts=3D0.0000=
00 count=3D10
> [h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 10, ts=3D0.000=
000 count=3D11
> [h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 11, ts=3D0.000=
000 count=3D12
> [h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 12, ts=3D0.000=
000 count=3D13
> [h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 13, ts=3D0.000=
000 count=3D14
> [h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 14, ts=3D0.000=
000 count=3D15
> [h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 15, ts=3D0.000=
000 count=3D16
> [h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 16, ts=3D0.000=
000 count=3D17
> [h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 17, ts=3D0.000=
000 count=3D18
> [h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 18, ts=3D0.000=
000 count=3D19
> [h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 19, ts=3D0.000=
000 count=3D20
> [h264_v4l2m2m @ 0x68200490] capture set status ON OK
> Execution time of decode_write: 70.186000 milliseconds
> encoded pkt -> decoded frame: 72 millisecs
> sending an encoded pkt, tot_pkts sent: 4
> [h264_v4l2m2m @ 0x68200490] --- output pre VIDIOC_QBUF: index 0, ts=3D0.0=
00004 count=3D0
> [h264_v4l2m2m @ 0x68200490] --- output VIDIOC_QBUF: index 0, ts=3D0.00000=
4 count=3D1
> Execution time of decode_write: 0.636000 milliseconds
> encoded pkt -> decoded frame: 30 millisecs
> sending an encoded pkt, tot_pkts sent: 5
> [h264_v4l2m2m @ 0x68200490] --- output pre VIDIOC_QBUF: index 1, ts=3D0.0=
00005 count=3D1
> [h264_v4l2m2m @ 0x68200490] --- output VIDIOC_QBUF: index 1, ts=3D0.00000=
5 count=3D2
> [h264_v4l2m2m @ 0x68200490] ff_v4l2_context_frames_set: HWFramesContext s=
et to yuv420p, 1280x960
> [h264_v4l2m2m @ 0x68200490] Decode running //////////////////////////////=
///////////////////////////////////////////////////////////////////////////=
/ =E2=86=90- FROME HERE I STARTS RECEIVING DECODED FRAME, THEN MY STREAMING=
 IS DELAYED OF 4 FRAMES.
> frame received ! type: 0 ,keyframe: 0, tot frame decoded: 1
> [h264_v4l2m2m @ 0x68200490] capture: Buffer requeue
> [h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 0, ts=3D0.0000=
01 count=3D20
> Execution time of decode_write: 0.964000 milliseconds
> //FROM NOW I AM GETTING EXACTLY ONE DECODED FRAME FOR EACH ENCODED PACKET=
 (AS EXPECTED)
> encoded pkt -> decoded frame: 2 millisecs
> sending an encoded pkt, tot_pkts sent: 6
> [h264_v4l2m2m @ 0x68200490] --- output pre VIDIOC_QBUF: index 0, ts=3D0.0=
00006 count=3D0
> [h264_v4l2m2m @ 0x68200490] --- output VIDIOC_QBUF: index 0, ts=3D0.00000=
6 count=3D1
> frame received ! type: 0 ,keyframe: 0, tot frame decoded: 2
> h264_v4l2m2m @ 0x68200490] capture: Buffer requeue
> [h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 1, ts=3D0.0000=
02 count=3D20
> Execution time of decode_write: 1.181000 milliseconds
> encoded pkt -> decoded frame: 3 millisecs
> sending an encoded pkt, tot_pkts sent: 7
> [h264_v4l2m2m @ 0x68200490] --- output pre VIDIOC_QBUF: index 0, ts=3D0.0=
00007 count=3D0
> [h264_v4l2m2m @ 0x68200490] --- output VIDIOC_QBUF: index 0, ts=3D0.00000=
7 count=3D1
> frame received ! type: 0 ,keyframe: 0, tot frame decoded: 3
> [h264_v4l2m2m @ 0x68200490] capture: Buffer requeue
> [h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 2, ts=3D0.0000=
03 count=3D20
> Execution time of decode_write: 0.883000 milliseconds
> encoded pkt -> decoded frame: 2 millisecs
> sending an encoded pkt, tot_pkts sent: 8
> [h264_v4l2m2m @ 0x68200490] --- output pre VIDIOC_QBUF: index 0, ts=3D0.0=
00008 count=3D0
> [h264_v4l2m2m @ 0x68200490] --- output VIDIOC_QBUF: index 0, ts=3D0.00000=
8 count=3D1
> frame received ! type: 0 ,keyframe: 0, tot frame decoded: 4
> [h264_v4l2m2m @ 0x68200490] capture: Buffer requeue
> [h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 3, ts=3D0.0000=
04 count=3D20
> Execution time of decode_write: 42.602000 milliseconds
> encoded pkt -> decoded frame: 44 millisecs
> sending an encoded pkt, tot_pkts sent: 9
> [h264_v4l2m2m @ 0x68200490] --- output pre VIDIOC_QBUF: index 0, ts=3D0.0=
00009 count=3D0
> [h264_v4l2m2m @ 0x68200490] --- output VIDIOC_QBUF: index 0, ts=3D0.00000=
9 count=3D1
> frame received ! type: 0 ,keyframe: 0, tot frame decoded: 5
> [h264_v4l2m2m @ 0x68200490] capture: Buffer requeue
> [h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 4, ts=3D0.0000=
05 count=3D20
> Execution time of decode_write: 0.948000 milliseconds
> encoded pkt -> decoded frame: 7 millisecs
> sending an encoded pkt, tot_pkts sent: 10
> [h264_v4l2m2m @ 0x68200490] --- output pre VIDIOC_QBUF: index 0, ts=3D0.0=
00010 count=3D0
> [h264_v4l2m2m @ 0x68200490] --- output VIDIOC_QBUF: index 0, ts=3D0.00001=
0 count=3D1
> frame received ! type: 0 ,keyframe: 0, tot frame decoded: 6
> [h264_v4l2m2m @ 0x68200490] capture: Buffer requeue
> [h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 5, ts=3D0.0000=
06 count=3D20
> Execution time of decode_write: 0.993000 milliseconds
> encoded pkt -> decoded frame: 2 millisecs
> sending an encoded pkt, tot_pkts sent: 11
> [h264_v4l2m2m @ 0x68200490] --- output pre VIDIOC_QBUF: index 0, ts=3D0.0=
00011 count=3D0
> [h264_v4l2m2m @ 0x68200490] --- output VIDIOC_QBUF: index 0, ts=3D0.00001=
1 count=3D1
> frame received ! type: 0 ,keyframe: 0, tot frame decoded: 7
> [h264_v4l2m2m @ 0x68200490] capture: Buffer requeue
> [h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 6, ts=3D0.0000=
07 count=3D20
> Execution time of decode_write: 1.356000 milliseconds
> encoded pkt -> decoded frame: 4 millisecs
> sending an encoded pkt, tot_pkts sent: 12
> [h264_v4l2m2m @ 0x68200490] --- output pre VIDIOC_QBUF: index 0, ts=3D0.0=
00012 count=3D0
> [h264_v4l2m2m @ 0x68200490] --- output VIDIOC_QBUF: index 0, ts=3D0.00001=
2 count=3D1
> frame received ! type: 0 ,keyframe: 0, tot frame decoded: 8
> [h264_v4l2m2m @ 0x68200490] capture: Buffer requeue
> [h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 7, ts=3D0.0000=
08 count=3D20
> Execution time of decode_write: 15.023000 milliseconds
> encoded pkt -> decoded frame: 21 millisecs
> sending an encoded pkt, tot_pkts sent: 13
> [h264_v4l2m2m @ 0x68200490] --- output pre VIDIOC_QBUF: index 0, ts=3D0.0=
00013 count=3D0
> [h264_v4l2m2m @ 0x68200490] --- output VIDIOC_QBUF: index 0, ts=3D0.00001=
3 count=3D1
> frame received ! type: 0 ,keyframe: 0, tot frame decoded: 9
> [h264_v4l2m2m @ 0x68200490] capture: Buffer requeue
> [h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 8, ts=3D0.0000=
09 count=3D20
> Execution time of decode_write: 18.632000 milliseconds
> encoded pkt -> decoded frame: 27 millisecs
> sending an encoded pkt, tot_pkts sent: 14
> [h264_v4l2m2m @ 0x68200490] --- output pre VIDIOC_QBUF: index 0, ts=3D0.0=
00014 count=3D0
> [h264_v4l2m2m @ 0x68200490] --- output VIDIOC_QBUF: index 0, ts=3D0.00001=
4 count=3D1
> frame received ! type: 0 ,keyframe: 0, tot frame decoded: 10
> [h264_v4l2m2m @ 0x68200490] capture: Buffer requeue
> [h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 9, ts=3D0.0000=
10 count=3D20
> Execution time of decode_write: 8.249000 milliseconds
> encoded pkt -> decoded frame: 12 millisecs
> sending an encoded pkt, tot_pkts sent: 15
> [h264_v4l2m2m @ 0x68200490] --- output pre VIDIOC_QBUF: index 0, ts=3D0.0=
00015 count=3D0
> [h264_v4l2m2m @ 0x68200490] --- output VIDIOC_QBUF: index 0, ts=3D0.00001=
5 count=3D1
> frame received ! type: 0 ,keyframe: 0, tot frame decoded: 11
> [h264_v4l2m2m @ 0x68200490] capture: Buffer requeue
> [h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 10, ts=3D0.000=
011 count=3D20
> Execution time of decode_write: 9.017000 milliseconds
> encoded pkt -> decoded frame: 15 millisecs
> sending an encoded pkt, tot_pkts sent: 16
> [h264_v4l2m2m @ 0x68200490] --- output pre VIDIOC_QBUF: index 0, ts=3D0.0=
00016 count=3D0
> [h264_v4l2m2m @ 0x68200490] --- output VIDIOC_QBUF: index 0, ts=3D0.00001=
6 count=3D1
> frame received ! type: 0 ,keyframe: 0, tot frame decoded: 12
> [h264_v4l2m2m @ 0x68200490] capture: Buffer requeue
> [h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 11, ts=3D0.000=
012 count=3D20
> Execution time of decode_write: 0.882000 milliseconds
> encoded pkt -> decoded frame: 2 millisecs
> sending an encoded pkt, tot_pkts sent: 17
> [h264_v4l2m2m @ 0x68200490] --- output pre VIDIOC_QBUF: index 0, ts=3D0.0=
00017 count=3D0
> [h264_v4l2m2m @ 0x68200490] --- output VIDIOC_QBUF: index 0, ts=3D0.00001=
7 count=3D1
> frame received ! type: 0 ,keyframe: 0, tot frame decoded: 13
> [h264_v4l2m2m @ 0x68200490] capture: Buffer requeue
> [h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 12, ts=3D0.000=
013 count=3D20
> Execution time of decode_write: 1.041000 milliseconds
> encoded pkt -> decoded frame: 5 millisecs
> sending an encoded pkt, tot_pkts sent: 18
> [h264_v4l2m2m @ 0x68200490] --- output pre VIDIOC_QBUF: index 0, ts=3D0.0=
00018 count=3D0
> [h264_v4l2m2m @ 0x68200490] --- output VIDIOC_QBUF: index 0, ts=3D0.00001=
8 count=3D1
> frame received ! type: 0 ,keyframe: 0, tot frame decoded: 14
> [h264_v4l2m2m @ 0x68200490] capture: Buffer requeue
> [h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 13, ts=3D0.000=
014 count=3D20
> Execution time of decode_write: 0.865000 milliseconds
> encoded pkt -> decoded frame: 3 millisecs
> sending an encoded pkt, tot_pkts sent: 19
> [h264_v4l2m2m @ 0x68200490] --- output pre VIDIOC_QBUF: index 0, ts=3D0.0=
00019 count=3D0
> [h264_v4l2m2m @ 0x68200490] --- output VIDIOC_QBUF: index 0, ts=3D0.00001=
9 count=3D1
> frame received ! type: 0 ,keyframe: 0, tot frame decoded: 15
> [h264_v4l2m2m @ 0x68200490] capture: Buffer requeue
> [h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 14, ts=3D0.000=
015 count=3D20
> Execution time of decode_write: 6.163000 milliseconds
> encoded pkt -> decoded frame: 8 millisecs
> sending an encoded pkt, tot_pkts sent: 20
> [h264_v4l2m2m @ 0x68200490] --- output pre VIDIOC_QBUF: index 0, ts=3D0.0=
00020 count=3D0
> [h264_v4l2m2m @ 0x68200490] --- output VIDIOC_QBUF: index 0, ts=3D0.00002=
0 count=3D1
> frame received ! type: 0 ,keyframe: 0, tot frame decoded: 16
> [h264_v4l2m2m @ 0x68200490] capture: Buffer requeue
> [h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 15, ts=3D0.000=
016 count=3D20
> Execution time of decode_write: 3.917000 milliseconds
> encoded pkt -> decoded frame: 8 millisecs
> sending an encoded pkt, tot_pkts sent: 21
> [h264_v4l2m2m @ 0x68200490] --- output pre VIDIOC_QBUF: index 0, ts=3D0.0=
00021 count=3D0
> [h264_v4l2m2m @ 0x68200490] --- output VIDIOC_QBUF: index 0, ts=3D0.00002=
1 count=3D1
> frame received ! type: 0 ,keyframe: 0, tot frame decoded: 17
> [h264_v4l2m2m @ 0x68200490] capture: Buffer requeue
> [h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 16, ts=3D0.000=
017 count=3D20
> Execution time of decode_write: 1.443000 milliseconds
> encoded pkt -> decoded frame: 4 millisecs
> sending an encoded pkt, tot_pkts sent: 22
> [h264_v4l2m2m @ 0x68200490] --- output pre VIDIOC_QBUF: index 0, ts=3D0.0=
00022 count=3D0
> [h264_v4l2m2m @ 0x68200490] --- output VIDIOC_QBUF: index 0, ts=3D0.00002=
2 count=3D1
> frame received ! type: 0 ,keyframe: 0, tot frame decoded: 18
> [h264_v4l2m2m @ 0x68200490] capture: Buffer requeue
> [h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 17, ts=3D0.000=
018 count=3D20
> Execution time of decode_write: 10.558000 milliseconds
> encoded pkt -> decoded frame: 13 millisecs
> sending an encoded pkt, tot_pkts sent: 23
> [h264_v4l2m2m @ 0x68200490] --- output pre VIDIOC_QBUF: index 0, ts=3D0.0=
00023 count=3D0
> [h264_v4l2m2m @ 0x68200490] --- output VIDIOC_QBUF: index 0, ts=3D0.00002=
3 count=3D1
> frame received ! type: 0 ,keyframe: 0, tot frame decoded: 19
> [h264_v4l2m2m @ 0x68200490] capture: Buffer requeue
> [h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 18, ts=3D0.000=
019 count=3D20
> Execution time of decode_write: 1.837000 milliseconds
> encoded pkt -> decoded frame: 5 millisecs
> sending an encoded pkt, tot_pkts sent: 24
> [h264_v4l2m2m @ 0x68200490] --- output pre VIDIOC_QBUF: index 0, ts=3D0.0=
00024 count=3D0
> [h264_v4l2m2m @ 0x68200490] --- output VIDIOC_QBUF: index 0, ts=3D0.00002=
4 count=3D1
> frame received ! type: 0 ,keyframe: 0, tot frame decoded: 20
> [h264_v4l2m2m @ 0x68200490] capture: Buffer requeue
> [h264_v4l2m2m @ 0x68200490] --- capture VIDIOC_QBUF: index 19, ts=3D0.000=
020 count=3D20
> Execution time of decode_write: 1.110000 milliseconds
> encoded pkt -> decoded frame: 3 millisecs
> =E2=80=A6
>
> Thank you,
> Alessandro Longobardi
>
>

