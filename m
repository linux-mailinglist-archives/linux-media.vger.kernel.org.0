Return-Path: <linux-media+bounces-64288-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hv43OwLqJ2oK4wIAu9opvQ
	(envelope-from <linux-media+bounces-64288-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 12:25:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAE365ED71
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 12:25:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=SiiHsY3G;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64288-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64288-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2F3EB3044879
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2026 10:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BF583EFFB5;
	Tue,  9 Jun 2026 10:21:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDA817BB21
	for <linux-media@vger.kernel.org>; Tue,  9 Jun 2026 10:21:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781000476; cv=none; b=qyMwKzM/eeoin9SOK4QcGBWRnWlDUOvgo2WV2nnLjxhX6NDMY4eYkMf1BjS6Qr1HOkHUk/LOWtApDDLG2cxZIpOCiBcC/SamXBQyqfOfwrjc+bFMiNtGANN/Qd32H7vDMsRWRUrjm5G4OT5BF6jQBZpjKuaB3r/hZ994kHc+ur4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781000476; c=relaxed/simple;
	bh=ojLC0KM/vy4qphQcFZJDwBj9OzEE0h3nKChZd5WhFfM=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=d2ZTt3OQeFnq9Pj2J0URtf/z/Knt59f5nvTBcbuBeKQ8oxHphTaHaD10PNqtoyWNhsmpdItyerKEgVF4395qRpnQTEmkEu3iD3x2AX0SqikXLmZfBeqRB68OlNKefR2oZTZdJy7qfYrZTpmPRX1Iiej4rJ9ne5JExPGSfqbsoaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SiiHsY3G; arc=none smtp.client-ip=209.85.218.46
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-bef1e6423e7so586582066b.1
        for <linux-media@vger.kernel.org>; Tue, 09 Jun 2026 03:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781000473; x=1781605273; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Egy4TrUR+gY6bcg2A7IogdParF/pDBDlgmLvRV6n53s=;
        b=SiiHsY3GkchU+K8koH32l8aTaet0utwuCoX59zB4B1csDn4lrkQblGf7bXe56QLGwV
         JtgRx1Y6E/gVP0r+iLVWQNPltvok6EvS+ilr65dAnXHK6I1xBGauQvwFUr/qy6/ewozC
         W5RT4Du0OnVE7dzFZTz8BVGm/TAV0N1RVKGs+cJ5Z/3Vy1Ve2CeyAN8b0/rIT9Caa0Sa
         YaIQJWMtqNzI3R8mxpWVi/H+5FHuQxmPq0kWygVlefsSpX7Ve1Z63YCHLtj4hFOpZk4H
         9fN+7qSg3/TW+SCCwYk7ZnKgRW/5gzXVPp4kPbGqg3Lu6rf3Av4DyG1h6p92Ux4Q3jRt
         P3LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781000473; x=1781605273;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Egy4TrUR+gY6bcg2A7IogdParF/pDBDlgmLvRV6n53s=;
        b=nSms/ZEWNrufaPtSUh5NJj6ZJe/QSZ2noTV34VW/IcKNo0ppzihDzGcBUNOqPbDG/s
         +TsIjxG8YUyXHUr7iqRYA1beN5aEf2WulFESFmADZg8gpZN76LiDtkMg1Oy3uaxD/oPE
         T9dXqF2KzpCq0fuGip2VOFQ9cK8II1lxZfxF8lF1sQRWpVbKImwf1N3ch6CPGratZScS
         73YxsM0ssIPLaxxJz3ealYrLp8P0bLaMto5klHBPcaKAaTH5J9GKdBBbwB2FfVLa1Y/n
         +NTvtWcfDrPbliAy3uzndp/8Z22YZUnk4nC4F8+xAUAlGSmwP/DejYnby8sGtYYscqos
         MOVA==
X-Gm-Message-State: AOJu0YysAPMr8Dnse1mbm4g00Q36h68NzRTzyq5E6d8cNB1LJmfvDXni
	f93ezDs5Zekw0mXQvy5qydUO4auDhA17FSIMw67Zv0fkG+8ujgtdB69G2BqK+g==
X-Gm-Gg: Acq92OE8NABsFaM9vp6UM2uLgRrqyW0u7RtCuIXuhBBrF+BByGzg/+FI9AmCf6DnT51
	K78cqcPBBGDOMdiIPNTe/Uuus3krmXAJrvmnnznv4wcW0o6LYRcR9GB1iDqIkW7UWAPFXntB/H2
	dHDufMKbqEQThDalKiknaAlLFwVTACk54InoEcZLvRm/NJ/y8VF4M8NHAL+G8FqK8AdkyYeHyPR
	oT0iiagAYHk3ongpzVWyWzCNELAKVpuL9XDiHFU7Ok8tzZLNoymUdzc4dYSKGlm6Sfz6cvg7nxC
	c1XKHNfkyL8CL1Wg48j+1CaFH2NH0oMzNjFbeO1B1rGLXhwKOvL3wqTjJ8917N5A7WoZAaz4ADZ
	27SI1E18UWCHWA1p0B0nXgfh9dc1lEtQOUyZ3sqsVSFVmol1KTqTNAgfnZ4ctHB7Lf72ArGYGFd
	BQ9YuJohmtR2YTu8xheLUax1AaHqrnFSIWcDsDLQyHOT4TcQP1O0L+0xBwedhIpE7/H39tIGbCo
	xHarslsfsrF0sF0Hqhc
X-Received: by 2002:a17:907:2d08:b0:bec:4b96:5fb4 with SMTP id a640c23a62f3a-bf37145c8d2mr1026677566b.11.1781000472520;
        Tue, 09 Jun 2026 03:21:12 -0700 (PDT)
Received: from smtpclient.apple (89-66-237-154.dynamic.play.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf41f05041esm608446866b.62.2026.06.09.03.21.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jun 2026 03:21:12 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [BUG] rkvdec-vdpu383-h264: wrong pixels at horizontal de-blocking
 edges y=4 and y=12
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <52a01f1f-5b36-429b-96cf-f1a0a1c8f5e4@symple.nz>
Date: Tue, 9 Jun 2026 12:21:01 +0200
Cc: linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 Detlev Casanova <detlev.casanova@collabora.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <5939C396-3A70-458F-8E6B-A55319929564@gmail.com>
References: <52a01f1f-5b36-429b-96cf-f1a0a1c8f5e4@symple.nz>
To: Simon Wright <Simon@symple.nz>
X-Mailer: Apple Mail (2.3864.600.51.1.1)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64288-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:detlev.casanova@collabora.com,m:Simon@symple.nz,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[piotroniszczuk@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[piotroniszczuk@gmail.com,linux-media@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,symple.nz:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7CAE365ED71

Simon,

You done fantastic work with nailing this issue!

In fact I suspect this issue is exact long time blocker for all on mine =
rk3576 users wanting to use 3576 in media player use-case.

I have 3 diff 3576 devices (nanopi-m5, nanopi-r76s and rock4d) and =
really want to verify are mine h264 hw decoding issues on 3576 caused by =
issue you discovered.

Have you PoC patch for 7.1 to verify this?



> Wiadomo=C5=9B=C4=87 napisana przez Simon Wright <Simon@symple.nz> w =
dniu 15 maj 2026, o godz. 08:20:
>=20
> Hi Detlev,
>=20
> I'm seeing systematic pixel corruption on VDPU383 H.264 decodes on =
RK3576 (NanoPi
> R76S).  The decoded luma plane is correct for rows 0=E2=80=933 and row =
8, but wrong for rows
> 4 and 12 (and the corresponding rows in every subsequent macroblock =
row).  The error
> propagates to all following P-frames.
>=20
> I confirmed the mismatch is in the raw V4L2 CAPTURE buffer two =
independent ways:
>=20
>   1. GStreamer v4l2slh264dec output compared to avdec_h264 with no =
videoconvert step.
>   2. A hand-written Rust V4L2 decoder that submits only =
SPS+PPS+SCALING_MATRIX+
>      DECODE_PARAMS (SLICE_PARAMS returns EINVAL on =
VIDIOC_QUERY_EXT_CTRL on this BSP,
>      so the control set is the same as GStreamer's actual submission) =
=E2=80=94 identical
>      20.3% mismatch at the identical first-diff byte.  This rules out =
any GStreamer
>      post-processing or control-submission effect as the cause.
>=20
> Hardware:
>   Board:      NanoPi R76S (RK3576, VDPU383)
>   Kernel:     Linux 7.0.1 (mainline rkvdec-vdpu383-h264.c, unmodified)
>   GStreamer:  1.28.2 (with v4l2slh264dec from gst-plugins-bad)
>   Content:    1920=C3=971080 Baseline H.264, SMPTE colour bars, =
openh264enc
>=20
>=20
> MINIMAL REPRODUCER
> ------------------
>=20
> Generate a test file (any H.264 Annex-B with visible content works; I =
used openh264enc
> with SMPTE bars):
>=20
>   gst-launch-1.0 videotestsrc num-buffers=3D60 pattern=3Dsmpte \
>     ! video/x-raw,width=3D1920,height=3D1080,framerate=3D30/1 \
>     ! openh264enc ! h264parse ! filesink location=3Dtest.h264
>=20
> Decode via HW, capture raw NV12:
>=20
>   gst-launch-1.0 filesrc location=3Dtest.h264 num-buffers=3D60 \
>     ! h264parse ! v4l2slh264dec ! 'video/x-raw' \
>     ! filesink location=3Dhw.raw
>=20
> Decode via SW, capture raw NV12:
>=20
>   gst-launch-1.0 filesrc location=3Dtest.h264 num-buffers=3D60 \
>     ! h264parse ! avdec_h264 ! videoconvert ! =
'video/x-raw,format=3DNV12' \
>     ! filesink location=3Dsw.raw
>=20
> For a 1920=C3=971080 NV12 frame (frame 0), compare the first 3,110,400 =
bytes:
>=20
>   cmp hw.raw sw.raw
>=20
> Expected: identical.
> Observed: first mismatch at byte 7680 (Y plane, row=3D4, col=3D0).
>=20
> With SMPTE bars (white region at the top), SW Y[row=3D3] =3D 0xe9 =
(correct white-bar luma).
> HW Y[row=3D4] =3D 0xaf instead of 0xe9; HW Y[row=3D3] =3D 0xe9 =
(correct).
> Overall mismatch rate: 20.3% of bytes in frame 0.
>=20
>=20
> QUANTIFIED EVIDENCE (frame 0, IDR)
> -----------------------------------
>=20
>   SW decode:  Y bytes [7680..7695] =3D e9 e9 e9 e9 e9 e9 e9 e9 e9 e9 =
e9 e9 e9 e9 e9 e9
>   HW decode:  Y bytes [7680..7695] =3D af af af af af af af af af af =
af af af af af af
>   First diff: byte 7680 =E2=86=92 Y plane row=3D4, col=3D0
>=20
> Error propagation:
>   Frame 0 (IDR):  20.3% mismatch, first_diff =3D byte 7680 (Y row=3D4)
>   Frame 1 (P):    23.0% mismatch, first_diff =3D byte 253 (error =
propagated to row=3D0)
>   Frames 5=E2=80=9330 (P): 25=E2=80=9326% mismatch, stable
>=20
> ANALYSIS
> --------
>=20
> A diagnostic experiment implicates the filterd_rcb buffer (RCB index =
6).  Redirecting
> filterd_rcb buffers 6, 7, 8 to point at the output buffer produced =
98.4% corruption
> with first diff at row=3D1, which indicates the hardware reads p-side =
pixel context from
> filterd_rcb (rather than from the reconstruction buffer) when applying =
horizontal
> deblocking.
>=20
> Based on the error pattern, our hypothesis is that filterd_rcb uses an =
8-row circular
> index (slot =3D row mod 8).  If so, H.264's 4-row deblocking =
boundaries within each
> 16-row macroblock row would cause a slot collision that HEVC (with =
8-row CTU boundaries)
> does not encounter:
>=20
>   Edge y=3D4:  p0 from row 3  =E2=86=92 slot 3  (zero-initialised on =
IDR =E2=86=92 wrong)
>   Edge y=3D8:  p0 from row 7  =E2=86=92 slot 7  (written before this =
edge is reached =E2=86=92 correct)
>   Edge y=3D12: p0 from row 11 =E2=86=92 slot 3  (still holds row-3 =
data from the y=3D4 pass =E2=86=92 wrong)
>=20
> This would explain why y=3D8 decodes correctly while y=3D4 and y=3D12 =
do not.  We don't have
> hardware documentation for VDPU383, so we can't confirm whether this =
is the actual
> mechanism.
>=20
> We tried several register adjustments hoping to change the filterd_rcb =
update granularity:
> ctu_align_wr_en (reg027), buf_empty_en (reg009), ref strides =
(reg083=E2=80=93106), and
> num_views in the SPS table.  None changed the corruption.
>=20
> Is there a known configuration difference for H.264's narrower =
deblocking edges, or a
> BSP-level fix we've missed?
>=20
>=20
> ATTACHED REPRODUCER
> -------------------
>=20
> The C program below (builds against GStreamer on-device, ~100 lines) =
automates the
> comparison and produces per-frame mismatch statistics:
>=20
>   gcc -O0 -g -o h264_hw_vs_sw_dump h264_hw_vs_sw_dump.c \
>       $(pkg-config --cflags --libs gstreamer-1.0 gstreamer-video-1.0 =
gstreamer-app-1.0)
>=20
>   ./h264_hw_vs_sw_dump /path/to/test.h264
>=20
> --- BEGIN h264_hw_vs_sw_dump.c ---
> /*
>  * H.264 HW vs SW byte-level comparison via GStreamer appsink.
>  *
>  * Decodes one frame of an H.264 Annex-B file via two paths:
>  *   SW:  h264parse ! avdec_h264 ! videoconvert ! NV12 appsink
>  *   HW:  h264parse ! v4l2slh264dec             ! NV12 appsink
>  *
>  * Reports first divergent byte, mismatch percentage, and unique Y =
values for
>  * both decoders.  If HW bytes differ from SW bytes, the bug is in the =
kernel
>  * rkvdec-vdpu383-h264.c driver.
>  *
>  * Build on device:
>  *   gcc -O0 -g -o h264_hw_vs_sw_dump h264_hw_vs_sw_dump.c \
>  *       $(pkg-config --cflags --libs gstreamer-1.0 =
gstreamer-video-1.0 gstreamer-app-1.0)
>  */
>=20
> #include <stdio.h>
> #include <stdlib.h>
> #include <string.h>
> #include <stdint.h>
> #include <unistd.h>
> #include <gst/gst.h>
> #include <gst/video/video.h>
> #include <gst/app/gstappsink.h>
>=20
> typedef struct {
>     uint8_t *data;
>     int      width, height;
>     size_t   y_size, uv_size, total;
> } DecodedFrame;
>=20
> static void free_frame(DecodedFrame *f) { if (f) { free(f->data); =
f->data =3D NULL; } }
>=20
> static DecodedFrame *run_pipeline(const char *pipeline_str, const char =
*label)
> {
>     fprintf(stderr, "[%s] pipeline: %s\n", label, pipeline_str);
>     GError *err =3D NULL;
>     GstElement *pipeline =3D gst_parse_launch(pipeline_str, &err);
>     if (!pipeline || err) {
>         fprintf(stderr, "[%s] gst_parse_launch: %s\n", label, err ? =
err->message : "unknown");
>         return NULL;
>     }
>     GstElement *sink =3D gst_bin_get_by_name(GST_BIN(pipeline), =
"sink");
>     gst_app_sink_set_emit_signals(GST_APP_SINK(sink), FALSE);
>     gst_app_sink_set_drop(GST_APP_SINK(sink), FALSE);
>     gst_app_sink_set_max_buffers(GST_APP_SINK(sink), 1);
>     gst_element_set_state(pipeline, GST_STATE_PLAYING);
>=20
>     GstSample *sample =3D =
gst_app_sink_pull_sample(GST_APP_SINK(sink));
>     if (!sample) {
>         fprintf(stderr, "[%s] no sample\n", label);
>         gst_element_set_state(pipeline, GST_STATE_NULL);
>         gst_object_unref(sink); gst_object_unref(pipeline);
>         return NULL;
>     }
>     GstBuffer *buf  =3D gst_sample_get_buffer(sample);
>     GstCaps   *caps =3D gst_sample_get_caps(sample);
>     GstVideoInfo vinfo;
>     gst_video_info_from_caps(&vinfo, caps);
>=20
>     int w =3D GST_VIDEO_INFO_WIDTH(&vinfo);
>     int h =3D GST_VIDEO_INFO_HEIGHT(&vinfo);
>     GstVideoFrame vframe;
>     gst_video_frame_map(&vframe, &vinfo, buf, GST_MAP_READ);
>=20
>     size_t y_size  =3D (size_t)w * h;
>     size_t uv_size =3D (size_t)w * (h / 2);
>     DecodedFrame *frame =3D calloc(1, sizeof(*frame));
>     frame->data  =3D malloc(y_size + uv_size);
>     frame->width =3D w; frame->height =3D h;
>     frame->y_size =3D y_size; frame->uv_size =3D uv_size;
>     frame->total =3D y_size + uv_size;
>=20
>     uint8_t *y_src =3D GST_VIDEO_FRAME_PLANE_DATA(&vframe, 0);
>     int y_stride   =3D GST_VIDEO_FRAME_PLANE_STRIDE(&vframe, 0);
>     for (int row =3D 0; row < h; row++)
>         memcpy(frame->data + row * w, y_src + row * y_stride, w);
>=20
>     uint8_t *uv_src =3D GST_VIDEO_FRAME_PLANE_DATA(&vframe, 1);
>     int uv_stride   =3D GST_VIDEO_FRAME_PLANE_STRIDE(&vframe, 1);
>     uint8_t *uv_dst =3D frame->data + y_size;
>     for (int row =3D 0; row < h / 2; row++)
>         memcpy(uv_dst + row * w, uv_src + row * uv_stride, w);
>=20
>     gst_video_frame_unmap(&vframe);
>     gst_sample_unref(sample);
>     gst_element_set_state(pipeline, GST_STATE_NULL);
>     gst_object_unref(sink); gst_object_unref(pipeline);
>     return frame;
> }
>=20
> static void compare_frames(DecodedFrame *sw, DecodedFrame *hw)
> {
>     size_t n =3D sw->total < hw->total ? sw->total : hw->total;
>     size_t first_diff =3D (size_t)-1, diffs =3D 0;
>     for (size_t i =3D 0; i < n; i++) {
>         if (sw->data[i] !=3D hw->data[i]) {
>             if (first_diff =3D=3D (size_t)-1) first_diff =3D i;
>             diffs++;
>         }
>     }
>     if (!diffs) {
>         fprintf(stderr, "MATCH: HW =3D=3D SW (%zu bytes)\n", n);
>         return;
>     }
>     size_t y_size  =3D (size_t)sw->width * sw->height;
>     const char *plane =3D first_diff < y_size ? "Y" : "UV";
>     size_t off =3D first_diff < y_size ? first_diff : first_diff - =
y_size;
>     fprintf(stderr, "MISMATCH: %zu/%zu bytes differ (%.1f%%)\n", =
diffs, n, 100.0*diffs/n);
>     fprintf(stderr, "  First diff: byte %zu -> %s plane offset %zu =
(row=3D%zu col=3D%zu)\n",
>             first_diff, plane, off, off / sw->width, off % sw->width);
>     fprintf(stderr, "  SW[%zu..]: ", first_diff);
>     for (size_t i =3D first_diff; i < first_diff+16 && i < n; i++)
>         fprintf(stderr, "%02x ", sw->data[i]);
>     fprintf(stderr, "\n  HW[%zu..]: ", first_diff);
>     for (size_t i =3D first_diff; i < first_diff+16 && i < n; i++)
>         fprintf(stderr, "%02x ", hw->data[i]);
>     fprintf(stderr, "\n");
> }
>=20
> int main(int argc, char **argv)
> {
>     if (argc < 2) { fprintf(stderr, "Usage: %s <h264_annex_b>\n", =
argv[0]); return 1; }
>     gst_init(NULL, NULL);
>     char sw_pipe[1024], hw_pipe[1024];
>     snprintf(sw_pipe, sizeof(sw_pipe),
>         "filesrc location=3D%s ! h264parse ! avdec_h264 ! videoconvert =
! "
>         "video/x-raw,format=3DNV12 ! appsink name=3Dsink", argv[1]);
>     snprintf(hw_pipe, sizeof(hw_pipe),
>         "filesrc location=3D%s ! h264parse ! v4l2slh264dec ! "
>         "video/x-raw,format=3DNV12 ! appsink name=3Dsink", argv[1]);
>=20
>     DecodedFrame *sw =3D run_pipeline(sw_pipe, "SW");
>     DecodedFrame *hw =3D run_pipeline(hw_pipe, "HW");
>     if (sw && hw) compare_frames(sw, hw);
>     if (sw) { free_frame(sw); free(sw); }
>     if (hw) { free_frame(hw); free(hw); }
>     return 0;
> }
> --- END h264_hw_vs_sw_dump.c ---
>=20
> Thanks,
> Simon Wright
> Symple Solutions, Dunedin, New Zealand
>=20
>=20


