Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CD103CB5A4
	for <lists+linux-media@lfdr.de>; Fri, 16 Jul 2021 12:02:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237802AbhGPKFg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Jul 2021 06:05:36 -0400
Received: from cpanel.siel.si ([46.19.9.99]:45724 "EHLO cpanel.siel.si"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235960AbhGPKFf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Jul 2021 06:05:35 -0400
X-Greylist: delayed 3332 seconds by postgrey-1.27 at vger.kernel.org; Fri, 16 Jul 2021 06:05:35 EDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
        s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:
        Message-ID:Cc:To:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=kgYZ6cVz8KCmnbveYdIePZHjMyQ7ln3aqk4keat9be8=; b=o/1ZgBmfhRjvXYpJfMMVqqUFD2
        0YxYdFGk4piSP0yzAvYDLwPOnFqm+wTIkdaqaIDvz6JNC0xUKR8g0nIx25o8ztjMrvtqEs56l6Vl1
        YrBLmaAH1ajCBBAW+uBqqvGmUyVuUbdySH6i0hUOHeAyKfJFR6CQUSecl0AuzdeZ7HiL9ZfLCrn3h
        eoWjs2CKJnIHAg2w8j2AWnPoncpZ7alE5FydNAb+qgKrvXjrXfAYajMfUA/+Dej6F2XZUCuah+2Aj
        uGII7A6lS3Lz7JY+hKNQ2VzT8PJOzNKHTTfrUlkF8PHUqsT78vTS32BW6wqv0aQHq4iWf4AjvVrIF
        UZyuRulQ==;
Received: from [89.212.21.243] (port=50690 helo=[192.168.69.215])
        by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <andrej.picej@norik.com>)
        id 1m4Jo8-00Cqhb-KJ; Fri, 16 Jul 2021 11:07:03 +0200
From:   Andrej Picej <andrej.picej@norik.com>
Subject: Problem with coda h264 decoder and different color formats
To:     linux-media@vger.kernel.org
Cc:     p.zabel@pengutronix.de, mchehab@kernel.org
Message-ID: <e07c752e-4029-6640-d462-811c82dd5109@norik.com>
Date:   Fri, 16 Jul 2021 11:07:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: andrej.picej@norik.com
X-Authenticated-Sender: cpanel.siel.si: andrej.picej@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

I hope I'm sending this to the right list. If not please redirect me to 
the right one.

We have a problem with CODA960 codec (at least that's what I think:)) 
for i.MX6, and I need a little bit of help in pinpointing and solving it.
We are using it to decode a h264 video. Decoder supports 4 color formats:
- NV12,
- I420 (YU12),
- YV12 and
- YUY2.

Everything works ok if we use gstreamer pipeline with NV12 or YUY2 
decoder, but when we use I420 or YV12 format it fails.
It seams that the video is being played, but only green screen is being 
displayed.

Gstreamer pipeline:
> gst-launch-1.0 filesrc location=video_1920x960_h264_24fps.mkv ! \
> matroskademux ! \
> h264parse ! \
> v4l2h264dec ! \
> video/x-raw,format="YUY2" ! \
> videoconvert ! \
> videoscale ! \
> queue ! \
> kmssink connector-id=57 sync=false can-scale=false force-modesetting=false

If we change format to I420 or YV12 the screen goes green.

The problem is seen on kernel 5.10.50, but the same pipeline works with 
4.19.100 kernel and driver (gstreamer version 1.18.4). You might be 
wandering why we don't use gst pipeline with working formats. The reason 
for this is that we use Qt with its media player which uses gstreamers 
playbin plugin which always selects I420 format (resulting in green 
screen). For now we found a dummy workaround, which is removing 
non-working formats from supported codec formats (dst_formats). This 
works, but we would like to get to the bottom of this.

I have already enabled debug options in coda driver but I can't see 
anything wrong with it. At least logs from working formats and non 
working formats doesn't differ in anything specific (other than selected 
format of course):

LOG for I420 (YU12)
> [ 1125.250709] coda 2040000.vpu: 0: open instance (254d2371)
> [ 1125.250743] coda 2040000.vpu: genpd_runtime_resume()
> [ 1125.252142] coda 2040000.vpu: 0: s_ctrl: id = 0x980914, name = "Horizontal Flip", val = 0
> [ 1125.252155] coda 2040000.vpu: 0: s_ctrl: id = 0x980915, name = "Vertical Flip", val = 0
> [ 1125.252961] coda 2040000.vpu: 0: release instance (254d2371)
> [ 1125.252998] coda 2040000.vpu: genpd_runtime_suspend()
> [ 1125.253125] coda 2040000.vpu: 0: open instance (254d2371)
> [ 1125.253145] coda 2040000.vpu: genpd_runtime_resume()
> [ 1125.254526] coda 2040000.vpu: 0: s_ctrl: id = 0x980914, name = "Horizontal Flip", val = 0
> [ 1125.254538] coda 2040000.vpu: 0: s_ctrl: id = 0x980915, name = "Vertical Flip", val = 0
> [ 1125.254545] coda 2040000.vpu: 0: s_ctrl: id = 0x9909cf, name = "Video Bitrate", val = 0
> [ 1125.254553] coda 2040000.vpu: 0: s_ctrl: id = 0x9909cb, name = "Video GOP Size", val = 16
> [ 1125.254562] coda 2040000.vpu: 0: s_ctrl: id = 0x990a5e, name = "H264 I-Frame QP Value", val = 25
> [ 1125.254569] coda 2040000.vpu: 0: s_ctrl: id = 0x990a5f, name = "H264 P-Frame QP Value", val = 25
> [ 1125.254576] coda 2040000.vpu: 0: s_ctrl: id = 0x990a62, name = "H264 Maximum QP Value", val = 51
> [ 1125.254583] coda 2040000.vpu: 0: s_ctrl: id = 0x990a68, name = "H264 Loop Filter Alpha Offset", val = 0
> [ 1125.254591] coda 2040000.vpu: 0: s_ctrl: id = 0x990a69, name = "H264 Loop Filter Beta Offset", val = 0
> [ 1125.254599] coda 2040000.vpu: 0: s_ctrl: id = 0x990a6a, name = "H264 Loop Filter Mode", val = 0 ("Enabled")
> [ 1125.254606] coda 2040000.vpu: 0: s_ctrl: id = 0x990a7f, name = "H264 Constrained Intra Pred", val = 0
> [ 1125.254613] coda 2040000.vpu: 0: s_ctrl: id = 0x9909d7, name = "Frame Level Rate Control Enable", val = 1
> [ 1125.254621] coda 2040000.vpu: 0: s_ctrl: id = 0x9909da, name = "H264 MB Level Rate Control", val = 1
> [ 1125.254627] coda 2040000.vpu: 0: s_ctrl: id = 0x990a80, name = "H264 Chroma QP Index Offset", val = 0
> [ 1125.254635] coda 2040000.vpu: 0: s_ctrl: id = 0x990a6b, name = "H264 Profile", val = 0 ("Baseline")
> [ 1125.254643] coda 2040000.vpu: 0: s_ctrl: id = 0x990a67, name = "H264 Level", val = 11 ("4")
> [ 1125.254649] coda 2040000.vpu: 0: s_ctrl: id = 0x990a90, name = "MPEG4 I-Frame QP Value", val = 2
> [ 1125.254656] coda 2040000.vpu: 0: s_ctrl: id = 0x990a91, name = "MPEG4 P-Frame QP Value", val = 2
> [ 1125.254663] coda 2040000.vpu: 0: s_ctrl: id = 0x990a96, name = "MPEG4 Profile", val = 0 ("Simple")
> [ 1125.254670] coda 2040000.vpu: 0: s_ctrl: id = 0x990a95, name = "MPEG4 Level", val = 7 ("5")
> [ 1125.254678] coda 2040000.vpu: 0: s_ctrl: id = 0x9909dd, name = "Slice Partitioning Method", val = 0 ("Single")
> [ 1125.254686] coda 2040000.vpu: 0: s_ctrl: id = 0x9909dc, name = "Number of MBs in a Slice", val = 1
> [ 1125.254693] coda 2040000.vpu: 0: s_ctrl: id = 0x9909db, name = "Maximum Bytes in a Slice", val = 500
> [ 1125.254700] coda 2040000.vpu: 0: s_ctrl: id = 0x9909d8, name = "Sequence Header Mode", val = 1 ("Joined With 1st Frame")
> [ 1125.254707] coda 2040000.vpu: 0: s_ctrl: id = 0x9909d6, name = "Number of Intra Refresh MBs", val = 0
> [ 1125.254716] coda 2040000.vpu: 0: s_ctrl: id = 0x9909e1, name = "Initial Delay for VBV Control", val = 0
> [ 1125.254722] coda 2040000.vpu: 0: s_ctrl: id = 0x9909de, name = "VBV Buffer Size", val = 0
> [ 1125.255954] coda 2040000.vpu: 0: release instance (254d2371)
> [ 1125.256092] coda 2040000.vpu: genpd_runtime_suspend()
> [ 1125.256210] coda 2040000.vpu: 0: open instance (254d2371)
> [ 1125.256234] coda 2040000.vpu: genpd_runtime_resume()
> [ 1125.257564] coda 2040000.vpu: 0: s_ctrl: id = 0x980914, name = "Horizontal Flip", val = 0
> [ 1125.257574] coda 2040000.vpu: 0: s_ctrl: id = 0x980915, name = "Vertical Flip", val = 0
> [ 1125.258590] coda 2040000.vpu: 0: release instance (254d2371)
> [ 1125.258686] coda 2040000.vpu: genpd_runtime_suspend()
> [ 1125.258792] coda 2040000.vpu: 0: open instance (254d2371)
> [ 1125.258812] coda 2040000.vpu: genpd_runtime_resume()
> [ 1125.260118] coda 2040000.vpu: 0: s_ctrl: id = 0x980914, name = "Horizontal Flip", val = 0
> [ 1125.260127] coda 2040000.vpu: 0: s_ctrl: id = 0x980915, name = "Vertical Flip", val = 0
> [ 1125.260136] coda 2040000.vpu: 0: s_ctrl: id = 0x9d0903, name = "Compression Quality", val = 50
> [ 1125.260145] coda 2040000.vpu: 0: s_ctrl: id = 0x9d0902, name = "Restart Interval", val = 0
> [ 1125.260901] coda 2040000.vpu: 0: release instance (254d2371)
> [ 1125.260936] coda 2040000.vpu: genpd_runtime_suspend()
> [ 1125.424576] coda 2040000.vpu: 0: open instance (254d2371)
> [ 1125.424608] coda 2040000.vpu: genpd_runtime_resume()
> [ 1125.426076] coda 2040000.vpu: 0: s_ctrl: id = 0x980914, name = "Horizontal Flip", val = 0
> [ 1125.426090] coda 2040000.vpu: 0: s_ctrl: id = 0x980915, name = "Vertical Flip", val = 0
> [ 1125.469178] coda 2040000.vpu: 0: Setting vid-out format, wxh: 1920x960, fmt: H264 L
> [ 1125.469198] coda 2040000.vpu: 0: Setting vid-cap format, wxh: 1920x960, fmt: NV12 T
> [ 1125.472390] coda 2040000.vpu: 0: get 2 buffer(s) of size 2097152 each.
> [ 1125.527767] coda 2040000.vpu: 0: Parsed H264 profile: Main
> [ 1125.527786] coda 2040000.vpu: 0: s_ctrl: id = 0x990a6b, name = "H264 Profile", val = 2 ("Main")
> [ 1125.527795] coda 2040000.vpu: 0: Parsed H264 level: 4
> [ 1125.527804] coda 2040000.vpu: 0: s_ctrl: id = 0x990a67, name = "H264 Level", val = 11 ("4")
> [ 1125.527813] coda 2040000.vpu: 0: start streaming vid-out
> [ 1125.527919] coda 2040000.vpu: 0: Video Data Order Adapter: Enabled
> [ 1125.528150] coda 2040000.vpu: 0: start decoding: 1920x960
> [ 1125.528159] coda 2040000.vpu: 0: Parsed H264 profile: Main
> [ 1125.528167] coda 2040000.vpu: 0: Parsed H264 level: 4
> [ 1125.533700] coda 2040000.vpu: 0: Setting vid-cap format, wxh: 1920x960, fmt: YU12 L
> [ 1125.548872] coda 2040000.vpu: 0: get 3 buffer(s) of size 2764800 each.
> [ 1125.594757] coda 2040000.vpu: 0: start streaming vid-cap
> [ 1125.720761] coda 2040000.vpu: 0: not ready: need 2 buffers available (queue:1 + bitstream:0)
> [ 1125.722028] coda 2040000.vpu: 0: job ready
> [ 1125.739506] coda 2040000.vpu: 0: job finished: decoded I frame 0, no frame returned (-1)
> [ 1125.739589] coda 2040000.vpu: 0: job ready
> [ 1125.760636] coda 2040000.vpu: 0: job finished: decoded P frame 1, no frame returned (-3)
> [ 1125.760759] coda 2040000.vpu: 0: job ready
> [ 1125.783325] coda 2040000.vpu: 0: job finished: decoded P frame 2, no frame returned (-3)
> [ 1125.783426] coda 2040000.vpu: 0: job ready
> [ 1125.806338] coda 2040000.vpu: 0: job finished: decoded P frame 3, no frame returned (-3)
> [ 1125.806463] coda 2040000.vpu: 0: job ready
> [ 1125.828919] coda 2040000.vpu: 0: job finished: decoded P frame 4, no frame returned (-3)
> [ 1125.829023] coda 2040000.vpu: 0: job ready
> [ 1125.867298] coda 2040000.vpu: 0: job finished: decoded P frame 5, returned I frame 0 (0/12)
> [ 1125.867420] coda 2040000.vpu: 0: job ready
> [ 1125.907192] coda 2040000.vpu: 0: job finished: decoded P frame 6, returned P frame 1 (1/13)
> [ 1125.907269] coda 2040000.vpu: 0: job ready
> [ 1125.948222] coda 2040000.vpu: 0: job finished: decoded P frame 7, returned P frame 2 (2/14)
> .
> .
> .
> [ 1143.100362] coda 2040000.vpu: 0: job ready
> [ 1143.158070] coda 2040000.vpu: 0: job finished: decoded B frame 359, returned B frame 354 (354/366)
> [ 1143.158141] coda 2040000.vpu: 0: job ready
> [ 1143.199042] coda 2040000.vpu: 0: job finished: decoded P frame 360, returned P frame 353 (355/367)
> [ 1143.199075] coda 2040000.vpu: 0: job ready
> [ 1143.257097] coda 2040000.vpu: 0: job finished: decoded B frame 361, returned B frame 357 (356/368)
> [ 1143.257225] coda 2040000.vpu: 0: job ready
> [ 1143.298403] coda 2040000.vpu: 0: job finished: decoded P frame 362, returned P frame 356 (357/369)
> [ 1143.298441] coda 2040000.vpu: 0: job ready
> [ 1143.356782] coda 2040000.vpu: 0: job finished: decoded B frame 363, returned B frame 359 (358/370)
> [ 1143.356845] coda 2040000.vpu: 0: job ready
> [ 1143.397682] coda 2040000.vpu: 0: job finished: decoded P frame 364, returned P frame 358 (359/371)
> [ 1143.397721] coda 2040000.vpu: 0: job ready
> [ 1143.455782] coda 2040000.vpu: 0: job finished: decoded B frame 365, returned B frame 361 (360/372)
> [ 1143.455917] coda 2040000.vpu: 0: job ready
> [ 1143.496796] coda 2040000.vpu: 0: job finished: decoded P frame 366, returned P frame 360 (361/373)
> [ 1143.496848] coda 2040000.vpu: 0: job ready
> [ 1143.555144] coda 2040000.vpu: 0: job finished: decoded B frame 367, returned B frame 363 (362/374)
> [ 1143.555235] coda 2040000.vpu: 0: job ready
> [ 1143.596554] coda 2040000.vpu: 0: job finished: decoded P frame 368, returned P frame 362 (363/375)
> [ 1143.596598] coda 2040000.vpu: 0: job ready
> [ 1143.655568] coda 2040000.vpu: 0: job finished: decoded B frame 369, returned B frame 365 (364/376)
> [ 1143.655684] coda 2040000.vpu: 0: job ready
> [ 1143.712949] coda 2040000.vpu: 0: job finished: decoded B frame 370, returned P frame 364 (365/377)
> [ 1143.712998] coda 2040000.vpu: 0: job ready
> [ 1143.771309] coda 2040000.vpu: 0: job finished: decoded B frame 371, returned B frame 367 (366/378)
> [ 1143.771377] coda 2040000.vpu: 0: job ready
> [ 1143.813531] coda 2040000.vpu: 0: job finished: decoded P frame 372, returned P frame 366 (367/379)
> [ 1143.813564] coda 2040000.vpu: 0: job ready
> [ 1143.871319] coda 2040000.vpu: 0: job finished: decoded B frame 373, returned B frame 370 (368/380)
> [ 1143.871419] coda 2040000.vpu: 0: job ready
> [ 1143.928322] coda 2040000.vpu: 0: job finished: decoded B frame 374, returned B frame 369 (369/381)
> [ 1143.928356] coda 2040000.vpu: 0: job ready
> [ 1143.985776] coda 2040000.vpu: 0: job finished: decoded B frame 375, returned B frame 371 (370/382)
> [ 1143.985819] coda 2040000.vpu: 0: job ready
> [ 1143.986139] coda 2040000.vpu: 0: marking last pending buffer
> [ 1144.026244] coda 2040000.vpu: 0: job finished: decoded P frame 376, returned P frame 368 (371/383)
> [ 1144.026265] coda 2040000.vpu: 0: marking last meta
> [ 1144.026278] coda 2040000.vpu: 0: job ready
> [ 1144.083816] coda 2040000.vpu: 0: job finished: decoded B frame 377, returned B frame 374 (372/384)
> [ 1144.083845] coda 2040000.vpu: 0: job ready
> [ 1144.124164] coda 2040000.vpu: 0: job finished: decoded P frame 378, returned B frame 373 (373/384)
> [ 1144.124188] coda 2040000.vpu: 0: job ready
> [ 1144.181616] coda 2040000.vpu: 0: job finished: decoded B frame 379, returned B frame 375 (374/384)
> [ 1144.181644] coda 2040000.vpu: 0: job ready
> [ 1144.222073] coda 2040000.vpu: 0: job finished: decoded P frame 380, returned P frame 372 (375/384)
> [ 1144.222087] coda 2040000.vpu: 0: job ready
> [ 1144.279784] coda 2040000.vpu: 0: job finished: decoded B frame 381, returned B frame 377 (376/384)
> [ 1144.279799] coda 2040000.vpu: 0: job ready
> [ 1144.320212] coda 2040000.vpu: 0: job finished: decoded P frame 382, returned P frame 376 (377/384)
> [ 1144.320225] coda 2040000.vpu: 0: job ready
> [ 1144.377865] coda 2040000.vpu: 0: job finished: decoded B frame 383, returned B frame 379 (378/384)
> [ 1144.377894] coda 2040000.vpu: 0: job ready
> [ 1144.400697] coda 2040000.vpu: 0: job finished: no frame decoded (-2), returned P frame 378 (379/384)
> [ 1144.400712] coda 2040000.vpu: 0: job ready
> [ 1144.423469] coda 2040000.vpu: 0: job finished: no frame decoded (-2), returned B frame 381 (380/384)
> [ 1144.423482] coda 2040000.vpu: 0: job ready
> [ 1144.446163] coda 2040000.vpu: 0: job finished: no frame decoded (-2), returned P frame 380 (381/384)
> [ 1144.446911] coda 2040000.vpu: 0: job ready
> [ 1144.469671] coda 2040000.vpu: 0: job finished: no frame decoded (-2), returned B frame 383 (382/384)
> [ 1144.476081] coda 2040000.vpu: 0: job ready
> [ 1144.498897] coda 2040000.vpu: 0: no more frames to return, marking as last frame
> [ 1144.498914] coda 2040000.vpu: 0: job finished: no frame decoded (-2), returned P frame 382 (383/384) (last)
> [ 1144.505357] coda 2040000.vpu: 0: not ready: on hold for more buffers.
> [ 1144.531903] coda 2040000.vpu: 0: not ready: on hold for more buffers.
> [ 1144.558465] coda 2040000.vpu: 0: not ready: on hold for more buffers.
> [ 1144.674586] coda 2040000.vpu: 0: stop streaming vid-out
> [ 1144.674675] coda 2040000.vpu: 0: coda_seq_end_work: sent command 'SEQ_END' to coda
> [ 1144.690893] coda 2040000.vpu: 0: stop streaming vid-cap
> [ 1144.738017] coda 2040000.vpu: 0: release instance (254d2371)
> [ 1144.738202] coda 2040000.vpu: genpd_runtime_suspend()

END LOG

If you want I can attach some more debug logs. Please fill free to ask, 
I just didn't want to paste a bunch of log files which wouldn't have any 
meaning.
There might be something wrong in other drivers but I'm really not sure 
how to pinpoint that.

Do you maybe have some suggestions what the source of this problem might be?

Thank you in advance.

Best regards,
Andrej
