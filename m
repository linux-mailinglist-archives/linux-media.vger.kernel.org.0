Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D2063CD82A
	for <lists+linux-media@lfdr.de>; Mon, 19 Jul 2021 17:02:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242493AbhGSOVA convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 19 Jul 2021 10:21:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242586AbhGSOUB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Jul 2021 10:20:01 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD1D6C061794
        for <linux-media@vger.kernel.org>; Mon, 19 Jul 2021 07:28:10 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1m5Ujl-00078m-49; Mon, 19 Jul 2021 16:59:17 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1m5Ujk-0007Er-Rz; Mon, 19 Jul 2021 16:59:16 +0200
Message-ID: <e134ee8dc40aa1acbce2fb86779cd1dab82357c1.camel@pengutronix.de>
Subject: Re: Problem with coda h264 decoder and different color formats
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Andrej Picej <andrej.picej@norik.com>, linux-media@vger.kernel.org
Cc:     mchehab@kernel.org
Date:   Mon, 19 Jul 2021 16:59:16 +0200
In-Reply-To: <e07c752e-4029-6640-d462-811c82dd5109@norik.com>
References: <e07c752e-4029-6640-d462-811c82dd5109@norik.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andrej,

thank you for the report!

On Fri, 2021-07-16 at 11:07 +0200, Andrej Picej wrote:
> Hi all,
> 
> I hope I'm sending this to the right list. If not please redirect me to 
> the right one.
> 
> We have a problem with CODA960 codec (at least that's what I think:)) 
> for i.MX6, and I need a little bit of help in pinpointing and solving it.
> We are using it to decode a h264 video. Decoder supports 4 color formats:
> - NV12,
> - I420 (YU12),
> - YV12 and
> - YUY2.
> 
> Everything works ok if we use gstreamer pipeline with NV12 or YUY2 
> decoder, but when we use I420 or YV12 format it fails.
> It seams that the video is being played, but only green screen is being 
> displayed.
>
> Gstreamer pipeline:
> > gst-launch-1.0 filesrc location=video_1920x960_h264_24fps.mkv ! \
> > matroskademux ! \
> > h264parse ! \
> > v4l2h264dec ! \
> > video/x-raw,format="YUY2" ! \
> > videoconvert ! \
> > videoscale ! \
> > queue ! \
> > kmssink connector-id=57 sync=false can-scale=false force-modesetting=false
> 
> If we change format to I420 or YV12 the screen goes green.
> 
> The problem is seen on kernel 5.10.50, but the same pipeline works with 
> 4.19.100 kernel and driver (gstreamer version 1.18.4).

Can you confirm this works with 4.19.100 with exactly the same coda
firmware that shows the broken behavior on 5.10.50?

> You might be 
> wandering why we don't use gst pipeline with working formats. The reason 
> for this is that we use Qt with its media player which uses gstreamers 
> playbin plugin which always selects I420 format (resulting in green 
> screen). For now we found a dummy workaround, which is removing 
> non-working formats from supported codec formats (dst_formats). This 
> works, but we would like to get to the bottom of this.

An alternative workaround would be to patch GStreamer to prefer the NV12
format over I420 [1].

[1] https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/merge_requests/857

> I have already enabled debug options in coda driver but I can't see 
> anything wrong with it. At least logs from working formats and non 
> working formats doesn't differ in anything specific (other than selected 
> format of course):
> 
> LOG for I420 (YU12)
> > [ 1125.250709] coda 2040000.vpu: 0: open instance (254d2371)
> > [ 1125.250743] coda 2040000.vpu: genpd_runtime_resume()
> > [ 1125.252142] coda 2040000.vpu: 0: s_ctrl: id = 0x980914, name = "Horizontal Flip", val = 0
> > [ 1125.252155] coda 2040000.vpu: 0: s_ctrl: id = 0x980915, name = "Vertical Flip", val = 0
> > [ 1125.252961] coda 2040000.vpu: 0: release instance (254d2371)
> > [ 1125.252998] coda 2040000.vpu: genpd_runtime_suspend()
> > [ 1125.253125] coda 2040000.vpu: 0: open instance (254d2371)
> > [ 1125.253145] coda 2040000.vpu: genpd_runtime_resume()
> > [ 1125.254526] coda 2040000.vpu: 0: s_ctrl: id = 0x980914, name = "Horizontal Flip", val = 0
> > [ 1125.254538] coda 2040000.vpu: 0: s_ctrl: id = 0x980915, name = "Vertical Flip", val = 0
> > [ 1125.254545] coda 2040000.vpu: 0: s_ctrl: id = 0x9909cf, name = "Video Bitrate", val = 0
> > [ 1125.254553] coda 2040000.vpu: 0: s_ctrl: id = 0x9909cb, name = "Video GOP Size", val = 16
> > [ 1125.254562] coda 2040000.vpu: 0: s_ctrl: id = 0x990a5e, name = "H264 I-Frame QP Value", val = 25
> > [ 1125.254569] coda 2040000.vpu: 0: s_ctrl: id = 0x990a5f, name = "H264 P-Frame QP Value", val = 25
> > [ 1125.254576] coda 2040000.vpu: 0: s_ctrl: id = 0x990a62, name = "H264 Maximum QP Value", val = 51
> > [ 1125.254583] coda 2040000.vpu: 0: s_ctrl: id = 0x990a68, name = "H264 Loop Filter Alpha Offset", val = 0
> > [ 1125.254591] coda 2040000.vpu: 0: s_ctrl: id = 0x990a69, name = "H264 Loop Filter Beta Offset", val = 0
> > [ 1125.254599] coda 2040000.vpu: 0: s_ctrl: id = 0x990a6a, name = "H264 Loop Filter Mode", val = 0 ("Enabled")
> > [ 1125.254606] coda 2040000.vpu: 0: s_ctrl: id = 0x990a7f, name = "H264 Constrained Intra Pred", val = 0
> > [ 1125.254613] coda 2040000.vpu: 0: s_ctrl: id = 0x9909d7, name = "Frame Level Rate Control Enable", val = 1
> > [ 1125.254621] coda 2040000.vpu: 0: s_ctrl: id = 0x9909da, name = "H264 MB Level Rate Control", val = 1
> > [ 1125.254627] coda 2040000.vpu: 0: s_ctrl: id = 0x990a80, name = "H264 Chroma QP Index Offset", val = 0
> > [ 1125.254635] coda 2040000.vpu: 0: s_ctrl: id = 0x990a6b, name = "H264 Profile", val = 0 ("Baseline")
> > [ 1125.254643] coda 2040000.vpu: 0: s_ctrl: id = 0x990a67, name = "H264 Level", val = 11 ("4")
> > [ 1125.254649] coda 2040000.vpu: 0: s_ctrl: id = 0x990a90, name = "MPEG4 I-Frame QP Value", val = 2
> > [ 1125.254656] coda 2040000.vpu: 0: s_ctrl: id = 0x990a91, name = "MPEG4 P-Frame QP Value", val = 2
> > [ 1125.254663] coda 2040000.vpu: 0: s_ctrl: id = 0x990a96, name = "MPEG4 Profile", val = 0 ("Simple")
> > [ 1125.254670] coda 2040000.vpu: 0: s_ctrl: id = 0x990a95, name = "MPEG4 Level", val = 7 ("5")
> > [ 1125.254678] coda 2040000.vpu: 0: s_ctrl: id = 0x9909dd, name = "Slice Partitioning Method", val = 0 ("Single")
> > [ 1125.254686] coda 2040000.vpu: 0: s_ctrl: id = 0x9909dc, name = "Number of MBs in a Slice", val = 1
> > [ 1125.254693] coda 2040000.vpu: 0: s_ctrl: id = 0x9909db, name = "Maximum Bytes in a Slice", val = 500
> > [ 1125.254700] coda 2040000.vpu: 0: s_ctrl: id = 0x9909d8, name = "Sequence Header Mode", val = 1 ("Joined With 1st Frame")
> > [ 1125.254707] coda 2040000.vpu: 0: s_ctrl: id = 0x9909d6, name = "Number of Intra Refresh MBs", val = 0
> > [ 1125.254716] coda 2040000.vpu: 0: s_ctrl: id = 0x9909e1, name = "Initial Delay for VBV Control", val = 0
> > [ 1125.254722] coda 2040000.vpu: 0: s_ctrl: id = 0x9909de, name = "VBV Buffer Size", val = 0
> > [ 1125.255954] coda 2040000.vpu: 0: release instance (254d2371)
> > [ 1125.256092] coda 2040000.vpu: genpd_runtime_suspend()
> > [ 1125.256210] coda 2040000.vpu: 0: open instance (254d2371)
> > [ 1125.256234] coda 2040000.vpu: genpd_runtime_resume()
> > [ 1125.257564] coda 2040000.vpu: 0: s_ctrl: id = 0x980914, name = "Horizontal Flip", val = 0
> > [ 1125.257574] coda 2040000.vpu: 0: s_ctrl: id = 0x980915, name = "Vertical Flip", val = 0
> > [ 1125.258590] coda 2040000.vpu: 0: release instance (254d2371)
> > [ 1125.258686] coda 2040000.vpu: genpd_runtime_suspend()
> > [ 1125.258792] coda 2040000.vpu: 0: open instance (254d2371)
> > [ 1125.258812] coda 2040000.vpu: genpd_runtime_resume()
> > [ 1125.260118] coda 2040000.vpu: 0: s_ctrl: id = 0x980914, name = "Horizontal Flip", val = 0
> > [ 1125.260127] coda 2040000.vpu: 0: s_ctrl: id = 0x980915, name = "Vertical Flip", val = 0
> > [ 1125.260136] coda 2040000.vpu: 0: s_ctrl: id = 0x9d0903, name = "Compression Quality", val = 50
> > [ 1125.260145] coda 2040000.vpu: 0: s_ctrl: id = 0x9d0902, name = "Restart Interval", val = 0
> > [ 1125.260901] coda 2040000.vpu: 0: release instance (254d2371)
> > [ 1125.260936] coda 2040000.vpu: genpd_runtime_suspend()
> > [ 1125.424576] coda 2040000.vpu: 0: open instance (254d2371)
> > [ 1125.424608] coda 2040000.vpu: genpd_runtime_resume()
> > [ 1125.426076] coda 2040000.vpu: 0: s_ctrl: id = 0x980914, name = "Horizontal Flip", val = 0
> > [ 1125.426090] coda 2040000.vpu: 0: s_ctrl: id = 0x980915, name = "Vertical Flip", val = 0
> > [ 1125.469178] coda 2040000.vpu: 0: Setting vid-out format, wxh: 1920x960, fmt: H264 L
> > [ 1125.469198] coda 2040000.vpu: 0: Setting vid-cap format, wxh: 1920x960, fmt: NV12 T
> > [ 1125.472390] coda 2040000.vpu: 0: get 2 buffer(s) of size 2097152 each.
> > [ 1125.527767] coda 2040000.vpu: 0: Parsed H264 profile: Main
> > [ 1125.527786] coda 2040000.vpu: 0: s_ctrl: id = 0x990a6b, name = "H264 Profile", val = 2 ("Main")
> > [ 1125.527795] coda 2040000.vpu: 0: Parsed H264 level: 4
> > [ 1125.527804] coda 2040000.vpu: 0: s_ctrl: id = 0x990a67, name = "H264 Level", val = 11 ("4")
> > [ 1125.527813] coda 2040000.vpu: 0: start streaming vid-out
> > [ 1125.527919] coda 2040000.vpu: 0: Video Data Order Adapter: Enabled
> > [ 1125.528150] coda 2040000.vpu: 0: start decoding: 1920x960           <<<<<<<<<<<<<<<<<<<<<<<<<
> > [ 1125.528159] coda 2040000.vpu: 0: Parsed H264 profile: Main
> > [ 1125.528167] coda 2040000.vpu: 0: Parsed H264 level: 4
> > [ 1125.533700] coda 2040000.vpu: 0: Setting vid-cap format, wxh: 1920x960, fmt: YU12 L
> > [ 1125.548872] coda 2040000.vpu: 0: get 3 buffer(s) of size 2764800 each.
> > [ 1125.594757] coda 2040000.vpu: 0: start streaming vid-cap
[...]
> END LOG
> 
> If you want I can attach some more debug logs. Please fill free to ask, 
> I just didn't want to paste a bunch of log files which wouldn't have any 
> meaning.
> There might be something wrong in other drivers but I'm really not sure 
> how to pinpoint that.
> 
> Do you maybe have some suggestions what the source of this problem might be?

I think the culprit is commit 497e6b8559a6 ("media: coda: add sequence
initialization work"), which moves some initialization earlier before
userspace selects the final capture format.
During __coda_decoder_seq_init() (which prints the "start decoding:
1920x960" line above), the ctx->frame_mem_ctrl is set for the default
NV12/tiled output format. This is never corrected when streaming
actually starts.

Could you check if this patch [1] helps?

[1] https://lore.kernel.org/linux-media/20210719145708.10643-1-p.zabel@pengutronix.de/T/#u

regards
Philipp
