Return-Path: <linux-media+bounces-62169-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yK2VAxGMDGr0iwUAu9opvQ
	(envelope-from <linux-media+bounces-62169-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 18:13:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 95822582114
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 18:13:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7CF373115559
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 16:04:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71E552E9ED6;
	Tue, 19 May 2026 16:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="L8FspndC"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654DF2DF153
	for <linux-media@vger.kernel.org>; Tue, 19 May 2026 16:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779206667; cv=pass; b=JgUkLElytU80F3BvpT7S0HAjn3gfJyJUxi3elZZJn+g6twP57yylOEDMhhDQ/1vg6n8+KrpSY5ZWUlGCCfJkutFxf7vuJOU4SwzR2bdD/STKEWDebLJ+PmkrzUYfBjG4PagZ5l+f5WasYarT8r4AHmia45yUMCb3IVB/46b/AqA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779206667; c=relaxed/simple;
	bh=iqfn9b7LvsrX9N8j1+B+kLi+vjwXFN6p1qgb98OAfQY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JlgyTy0p6fI8+NrjXTR36R2abqw1g6xcgHuA1+jtqrXiGvMzAUscPkqWo356QaWYfojv+Fpch9TxVNdgLvrx6isl9cji3PeJ3/39fI4VfdERaaGD4IrMHR2rHaUkN5h++b40n45aw597h1G8l3gLnqRckB2gMMeV0jwfqyPPDdo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b=L8FspndC; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1779206658; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZoycXRtfGt5de8gkMTTs3iCvm0uFzGCY0CpYTxTqfzMXmnndxrgvGGgj6dkCv2rFAowWldVPovmn3s28on7UJKSsHcRzCl32h4Q0Jk6I4pEE696RQpJqAiqxEmJ1FXQ02xQPbVxti11Xw1IklMcrTy/0DvQ+gbkT5cHXIg78DvY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779206658; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=z0GF6sR8NlAqLNJaBDThxNHckHlSdVt5wH99EVLxGU0=; 
	b=YHKWQsnDbHXXVKNicQiAn6GGdwLwb5qXjTZsAf/z0w37kUebSG0l6KQnf7sLrPBnf3Y00Fec0GZLj8h9/c3JNeN3h7bxKEka8KCIwEuOHMDCnKFZdQpQpx0Skz1zMu+iE3TIrCRhm/1/a0UW+HB/xqfi/YRiPL3qOa8AXslY4Vg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779206658;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=z0GF6sR8NlAqLNJaBDThxNHckHlSdVt5wH99EVLxGU0=;
	b=L8FspndCpP5U8INavgetUzwjvXVOoQP7ESVslLfBdjVHiuxMO/Uat/jHg3ZGCJBg
	p3t0+Zp7hQ+OKkNKlQLDQ7DU3UcW5cajqHGzvl7MEi7nqD1QlIOQRawdz7Zt0NmDdjj
	BArcjFsXcXatQmiTN9u5oe0YVR+MIio9xtmJcJy4=
Received: by mx.zohomail.com with SMTPS id 1779206656021234.5951284234577;
	Tue, 19 May 2026 09:04:16 -0700 (PDT)
Message-ID: <5797ac61-dc61-4182-ac60-cc377564ff90@collabora.com>
Date: Tue, 19 May 2026 12:04:14 -0400
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] rkvdec-vdpu383-h264: wrong pixels at horizontal de-blocking
 edges y=4 and y=12
To: Simon Wright <simon@symple.nz>, linux-media@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org
References: <52a01f1f-5b36-429b-96cf-f1a0a1c8f5e4@symple.nz>
Content-Language: en-US
From: Detlev Casanova <detlev.casanova@collabora.com>
In-Reply-To: <52a01f1f-5b36-429b-96cf-f1a0a1c8f5e4@symple.nz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[detlev.casanova@collabora.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-62169-lists,linux-media=lfdr.de];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+]
X-Rspamd-Queue-Id: 95822582114
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Simon,

Thank you for the complete analysis !

I am not able to reproduce this, but I had a similar report before.

I am using a Radxa Rock 4D for testing and development, yours and the 
other report both were on a NanoPi board.
It should be the same SoC, but I'm not ruling out something specific to 
that board, I'll see if I can get one.

What I don't have is a test showing that the hardware behaves properly 
with the vendor driver.
Is that something you could try on the NanoPi ?

The other report also mentioned that the issue was happening 10% of the 
time, but you seem to see it every time, could be nothing though.

The MPP userspace driver is really specific to VDPU383, there is no 
special case I can see for the NanoPi.

We do not have documentation for this decoder, but could you check your 
decoder version ? It is store in register 0 and I get 0x38321746.

Regards,
Detlev.

On 5/15/26 02:20, Simon Wright wrote:
> Hi Detlev,
>
> I'm seeing systematic pixel corruption on VDPU383 H.264 decodes on 
> RK3576 (NanoPi
> R76S).  The decoded luma plane is correct for rows 0–3 and row 8, but 
> wrong for rows
> 4 and 12 (and the corresponding rows in every subsequent macroblock 
> row).  The error
> propagates to all following P-frames.
>
> I confirmed the mismatch is in the raw V4L2 CAPTURE buffer two 
> independent ways:
>
>   1. GStreamer v4l2slh264dec output compared to avdec_h264 with no 
> videoconvert step.
>   2. A hand-written Rust V4L2 decoder that submits only 
> SPS+PPS+SCALING_MATRIX+
>      DECODE_PARAMS (SLICE_PARAMS returns EINVAL on 
> VIDIOC_QUERY_EXT_CTRL on this BSP,
>      so the control set is the same as GStreamer's actual submission) 
> — identical
>      20.3% mismatch at the identical first-diff byte.  This rules out 
> any GStreamer
>      post-processing or control-submission effect as the cause.
>
> Hardware:
>   Board:      NanoPi R76S (RK3576, VDPU383)
>   Kernel:     Linux 7.0.1 (mainline rkvdec-vdpu383-h264.c, unmodified)
>   GStreamer:  1.28.2 (with v4l2slh264dec from gst-plugins-bad)
>   Content:    1920×1080 Baseline H.264, SMPTE colour bars, openh264enc
>
>
> MINIMAL REPRODUCER
> ------------------
>
> Generate a test file (any H.264 Annex-B with visible content works; I 
> used openh264enc
> with SMPTE bars):
>
>   gst-launch-1.0 videotestsrc num-buffers=60 pattern=smpte \
>     ! video/x-raw,width=1920,height=1080,framerate=30/1 \
>     ! openh264enc ! h264parse ! filesink location=test.h264
>
> Decode via HW, capture raw NV12:
>
>   gst-launch-1.0 filesrc location=test.h264 num-buffers=60 \
>     ! h264parse ! v4l2slh264dec ! 'video/x-raw' \
>     ! filesink location=hw.raw
>
> Decode via SW, capture raw NV12:
>
>   gst-launch-1.0 filesrc location=test.h264 num-buffers=60 \
>     ! h264parse ! avdec_h264 ! videoconvert ! 'video/x-raw,format=NV12' \
>     ! filesink location=sw.raw
>
> For a 1920×1080 NV12 frame (frame 0), compare the first 3,110,400 bytes:
>
>   cmp hw.raw sw.raw
>
> Expected: identical.
> Observed: first mismatch at byte 7680 (Y plane, row=4, col=0).
>
> With SMPTE bars (white region at the top), SW Y[row=3] = 0xe9 (correct 
> white-bar luma).
> HW Y[row=4] = 0xaf instead of 0xe9; HW Y[row=3] = 0xe9 (correct).
> Overall mismatch rate: 20.3% of bytes in frame 0.
>
>
> QUANTIFIED EVIDENCE (frame 0, IDR)
> -----------------------------------
>
>   SW decode:  Y bytes [7680..7695] = e9 e9 e9 e9 e9 e9 e9 e9 e9 e9 e9 
> e9 e9 e9 e9 e9
>   HW decode:  Y bytes [7680..7695] = af af af af af af af af af af af 
> af af af af af
>   First diff: byte 7680 → Y plane row=4, col=0
>
> Error propagation:
>   Frame 0 (IDR):  20.3% mismatch, first_diff = byte 7680 (Y row=4)
>   Frame 1 (P):    23.0% mismatch, first_diff = byte 253 (error 
> propagated to row=0)
>   Frames 5–30 (P): 25–26% mismatch, stable
>
> ANALYSIS
> --------
>
> A diagnostic experiment implicates the filterd_rcb buffer (RCB index 
> 6).  Redirecting
> filterd_rcb buffers 6, 7, 8 to point at the output buffer produced 
> 98.4% corruption
> with first diff at row=1, which indicates the hardware reads p-side 
> pixel context from
> filterd_rcb (rather than from the reconstruction buffer) when applying 
> horizontal
> deblocking.
>
> Based on the error pattern, our hypothesis is that filterd_rcb uses an 
> 8-row circular
> index (slot = row mod 8).  If so, H.264's 4-row deblocking boundaries 
> within each
> 16-row macroblock row would cause a slot collision that HEVC (with 
> 8-row CTU boundaries)
> does not encounter:
>
>   Edge y=4:  p0 from row 3  → slot 3  (zero-initialised on IDR → wrong)
>   Edge y=8:  p0 from row 7  → slot 7  (written before this edge is 
> reached → correct)
>   Edge y=12: p0 from row 11 → slot 3  (still holds row-3 data from the 
> y=4 pass → wrong)
>
> This would explain why y=8 decodes correctly while y=4 and y=12 do 
> not.  We don't have
> hardware documentation for VDPU383, so we can't confirm whether this 
> is the actual
> mechanism.
>
> We tried several register adjustments hoping to change the filterd_rcb 
> update granularity:
> ctu_align_wr_en (reg027), buf_empty_en (reg009), ref strides 
> (reg083–106), and
> num_views in the SPS table.  None changed the corruption.
>
> Is there a known configuration difference for H.264's narrower 
> deblocking edges, or a
> BSP-level fix we've missed?
>
>
> ATTACHED REPRODUCER
> -------------------
>
> The C program below (builds against GStreamer on-device, ~100 lines) 
> automates the
> comparison and produces per-frame mismatch statistics:
>
>   gcc -O0 -g -o h264_hw_vs_sw_dump h264_hw_vs_sw_dump.c \
>       $(pkg-config --cflags --libs gstreamer-1.0 gstreamer-video-1.0 
> gstreamer-app-1.0)
>
>   ./h264_hw_vs_sw_dump /path/to/test.h264
>
> --- BEGIN h264_hw_vs_sw_dump.c ---
> /*
>  * H.264 HW vs SW byte-level comparison via GStreamer appsink.
>  *
>  * Decodes one frame of an H.264 Annex-B file via two paths:
>  *   SW:  h264parse ! avdec_h264 ! videoconvert ! NV12 appsink
>  *   HW:  h264parse ! v4l2slh264dec             ! NV12 appsink
>  *
>  * Reports first divergent byte, mismatch percentage, and unique Y 
> values for
>  * both decoders.  If HW bytes differ from SW bytes, the bug is in the 
> kernel
>  * rkvdec-vdpu383-h264.c driver.
>  *
>  * Build on device:
>  *   gcc -O0 -g -o h264_hw_vs_sw_dump h264_hw_vs_sw_dump.c \
>  *       $(pkg-config --cflags --libs gstreamer-1.0 
> gstreamer-video-1.0 gstreamer-app-1.0)
>  */
>
> #include <stdio.h>
> #include <stdlib.h>
> #include <string.h>
> #include <stdint.h>
> #include <unistd.h>
> #include <gst/gst.h>
> #include <gst/video/video.h>
> #include <gst/app/gstappsink.h>
>
> typedef struct {
>     uint8_t *data;
>     int      width, height;
>     size_t   y_size, uv_size, total;
> } DecodedFrame;
>
> static void free_frame(DecodedFrame *f) { if (f) { free(f->data); 
> f->data = NULL; } }
>
> static DecodedFrame *run_pipeline(const char *pipeline_str, const char 
> *label)
> {
>     fprintf(stderr, "[%s] pipeline: %s\n", label, pipeline_str);
>     GError *err = NULL;
>     GstElement *pipeline = gst_parse_launch(pipeline_str, &err);
>     if (!pipeline || err) {
>         fprintf(stderr, "[%s] gst_parse_launch: %s\n", label, err ? 
> err->message : "unknown");
>         return NULL;
>     }
>     GstElement *sink = gst_bin_get_by_name(GST_BIN(pipeline), "sink");
>     gst_app_sink_set_emit_signals(GST_APP_SINK(sink), FALSE);
>     gst_app_sink_set_drop(GST_APP_SINK(sink), FALSE);
>     gst_app_sink_set_max_buffers(GST_APP_SINK(sink), 1);
>     gst_element_set_state(pipeline, GST_STATE_PLAYING);
>
>     GstSample *sample = gst_app_sink_pull_sample(GST_APP_SINK(sink));
>     if (!sample) {
>         fprintf(stderr, "[%s] no sample\n", label);
>         gst_element_set_state(pipeline, GST_STATE_NULL);
>         gst_object_unref(sink); gst_object_unref(pipeline);
>         return NULL;
>     }
>     GstBuffer *buf  = gst_sample_get_buffer(sample);
>     GstCaps   *caps = gst_sample_get_caps(sample);
>     GstVideoInfo vinfo;
>     gst_video_info_from_caps(&vinfo, caps);
>
>     int w = GST_VIDEO_INFO_WIDTH(&vinfo);
>     int h = GST_VIDEO_INFO_HEIGHT(&vinfo);
>     GstVideoFrame vframe;
>     gst_video_frame_map(&vframe, &vinfo, buf, GST_MAP_READ);
>
>     size_t y_size  = (size_t)w * h;
>     size_t uv_size = (size_t)w * (h / 2);
>     DecodedFrame *frame = calloc(1, sizeof(*frame));
>     frame->data  = malloc(y_size + uv_size);
>     frame->width = w; frame->height = h;
>     frame->y_size = y_size; frame->uv_size = uv_size;
>     frame->total = y_size + uv_size;
>
>     uint8_t *y_src = GST_VIDEO_FRAME_PLANE_DATA(&vframe, 0);
>     int y_stride   = GST_VIDEO_FRAME_PLANE_STRIDE(&vframe, 0);
>     for (int row = 0; row < h; row++)
>         memcpy(frame->data + row * w, y_src + row * y_stride, w);
>
>     uint8_t *uv_src = GST_VIDEO_FRAME_PLANE_DATA(&vframe, 1);
>     int uv_stride   = GST_VIDEO_FRAME_PLANE_STRIDE(&vframe, 1);
>     uint8_t *uv_dst = frame->data + y_size;
>     for (int row = 0; row < h / 2; row++)
>         memcpy(uv_dst + row * w, uv_src + row * uv_stride, w);
>
>     gst_video_frame_unmap(&vframe);
>     gst_sample_unref(sample);
>     gst_element_set_state(pipeline, GST_STATE_NULL);
>     gst_object_unref(sink); gst_object_unref(pipeline);
>     return frame;
> }
>
> static void compare_frames(DecodedFrame *sw, DecodedFrame *hw)
> {
>     size_t n = sw->total < hw->total ? sw->total : hw->total;
>     size_t first_diff = (size_t)-1, diffs = 0;
>     for (size_t i = 0; i < n; i++) {
>         if (sw->data[i] != hw->data[i]) {
>             if (first_diff == (size_t)-1) first_diff = i;
>             diffs++;
>         }
>     }
>     if (!diffs) {
>         fprintf(stderr, "MATCH: HW == SW (%zu bytes)\n", n);
>         return;
>     }
>     size_t y_size  = (size_t)sw->width * sw->height;
>     const char *plane = first_diff < y_size ? "Y" : "UV";
>     size_t off = first_diff < y_size ? first_diff : first_diff - y_size;
>     fprintf(stderr, "MISMATCH: %zu/%zu bytes differ (%.1f%%)\n", 
> diffs, n, 100.0*diffs/n);
>     fprintf(stderr, "  First diff: byte %zu -> %s plane offset %zu 
> (row=%zu col=%zu)\n",
>             first_diff, plane, off, off / sw->width, off % sw->width);
>     fprintf(stderr, "  SW[%zu..]: ", first_diff);
>     for (size_t i = first_diff; i < first_diff+16 && i < n; i++)
>         fprintf(stderr, "%02x ", sw->data[i]);
>     fprintf(stderr, "\n  HW[%zu..]: ", first_diff);
>     for (size_t i = first_diff; i < first_diff+16 && i < n; i++)
>         fprintf(stderr, "%02x ", hw->data[i]);
>     fprintf(stderr, "\n");
> }
>
> int main(int argc, char **argv)
> {
>     if (argc < 2) { fprintf(stderr, "Usage: %s <h264_annex_b>\n", 
> argv[0]); return 1; }
>     gst_init(NULL, NULL);
>     char sw_pipe[1024], hw_pipe[1024];
>     snprintf(sw_pipe, sizeof(sw_pipe),
>         "filesrc location=%s ! h264parse ! avdec_h264 ! videoconvert ! "
>         "video/x-raw,format=NV12 ! appsink name=sink", argv[1]);
>     snprintf(hw_pipe, sizeof(hw_pipe),
>         "filesrc location=%s ! h264parse ! v4l2slh264dec ! "
>         "video/x-raw,format=NV12 ! appsink name=sink", argv[1]);
>
>     DecodedFrame *sw = run_pipeline(sw_pipe, "SW");
>     DecodedFrame *hw = run_pipeline(hw_pipe, "HW");
>     if (sw && hw) compare_frames(sw, hw);
>     if (sw) { free_frame(sw); free(sw); }
>     if (hw) { free_frame(hw); free(hw); }
>     return 0;
> }
> --- END h264_hw_vs_sw_dump.c ---
>
> Thanks,
> Simon Wright
> Symple Solutions, Dunedin, New Zealand
>


