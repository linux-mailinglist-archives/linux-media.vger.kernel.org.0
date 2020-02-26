Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9192117043A
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2020 17:22:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727078AbgBZQWw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Feb 2020 11:22:52 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:60493 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726583AbgBZQWw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Feb 2020 11:22:52 -0500
Received: from litschi.hi.pengutronix.de ([2001:67c:670:100:feaa:14ff:fe6a:8db5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <m.tretter@pengutronix.de>)
        id 1j6zSS-0005Cn-S0; Wed, 26 Feb 2020 17:22:48 +0100
Date:   Wed, 26 Feb 2020 17:22:47 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Benjamin Bara - SKIDATA <Benjamin.Bara@skidata.com>
Cc:     "linux-arm@lists.infradead.org" <linux-arm@lists.infradead.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "Richard Leitner - SKIDATA" <Richard.Leitner@skidata.com>
Subject: Re: [i.MX6][CODA] certain resolutions are not working in YUYV
 format
Message-ID: <20200226172247.02875ca7@litschi.hi.pengutronix.de>
In-Reply-To: <33f64557817d43af9b9267e107ba9723@skidata.com>
References: <c79be4d41e414ae5b50ba1e26544b6c2@skidata.com>
        <20191216182101.3676c280@litschi.hi.pengutronix.de>
        <43c38b41ad7547c6baaa56c41a05be87@skidata.com>
        <33f64557817d43af9b9267e107ba9723@skidata.com>
Organization: Pengutronix
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:feaa:14ff:fe6a:8db5
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benjamin,

On Tue, 11 Feb 2020 08:01:29 +0000, Benjamin Bara - SKIDATA wrote:
> any news from your side?
> We did some further testing with MPEG4-2 videos and the new 5.5 kernel.

The H.264 encoding and decoding is much better tested than the MPEG4-2
encoder and decoder. Thus, it might be worth to check the driver for
any H.264 specific code and see if you need the code for MPEG4 as well.

> 
> Summary:
> 1.) decoding of videos with a height not divisible by 16 (macroblock size) brings erroneous pixels/fragments in the top area.

The decoder only works on macroblocks. For h.264 the driver rounds the
size to 16, adds some padding and crops the output. You probably have
to enable the code for MPEG4 as well.

> 2.) decoding of videos with BVOP2 (2 B-Frames) [a] results in macroblock errors [1].

No idea about that one.

> 3.) decoding of "static" videos with low bitrates and a GoP size > 1 results in timeouts [2].

There is a minimum amount of data that the decoder needs to start
decoding. For H.264, we feed some padding data to the decoder to make
it start. Probably something similar must be done for MPEG4, too.

> 4.) encoded videos with low bitrates and GoP size > 1 show ffmpeg errors [3] during re-encoding with a different tag (in software) [b].

Maybe this is related to 3.), but I'm not sure. Does just decoding the
videos without re-encoding work without errors?

Michael

> 
> ad 1.)
> When running [c], the fragments are not shown.
> But when the stream is stored in a file and then played (as in [d]), some of the top pixel rows are erroneous.
> These fragments also occur on other videos, encoded with different software libraries.
> 
> ad 3.)
> This is especially the case if the video is static and the size of a P-frame packet is low.
> Can e.g. be reproduced with [e], but also happens during decoding with in software encoded videos with similar attributes.
> The size of a P-frame packet of such a video is around 94 bytes. Is it possible that there is a limitation regarding minimum packet size?
> 
> ad 4.)
> Did [b] with a bitrate from 100k to 2M in 25k steps and a GoP size from 1 to 16.
> The following combinations result in at least P-frame errors. Some also contain I-frame errors, as can be seen in [3]:
> 100k: 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
> 125k: 4, 5, 7, 8, 9, 10, 13, 14, 15
> 150k: 4, 5, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
> 175k: 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
> 200k: 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
> 225k: 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
> 250k: 2, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
> 275k: 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
> 300k: 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
> 325k: 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
> 350k: 2, 3, 4, 6, 7, 8, 9, 10
> 375k: 2, 3, 4, 5, 6, 7, 8, 10
> 400k: 2, 3, 4, 5, 6, 7, 9, 10, 11, 13, 15, 16
> 425k: 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 16
> 450k: 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
> 475k: 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 14, 15
> 500k: 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
> 525k: 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 14, 16
> 
> GoP size of 1 did not show any errors.
> 
> => Point 3.) and 4.) might be related?  
> 
> Also noticeable: The expected/configured bitrate strongly varies from the detected bitrate.
> 
> 
> If you need further info or if we should take further actions, just drop us a mail.
> 
> thanks & br,
> Benjamin
> 
> 
> [a]
> # create video
> gst-launch-1.0 videotestsrc num-buffers=200 ! video/x-raw,width=270,height=480 ! v4l2mpeg4enc output-io-mode=4 ! avimux ! filesink location=/tmp/input.avi
> 
> # re-encode in software: SP@L1 w/ BVOP2
> ffmpeg -i /tmp/input.avi -c:v mpeg4 -vtag XVID -profile:v 0 -level 1 -bf 2 /tmp/output.avi
> 
> # re-encode in software: ASP@L5 w/ BVOP2
> ffmpeg -i /tmp/input.avi -c:v mpeg4 -vtag XVID -profile:v 15 -level 5 -bf 2 /tmp/output.avi
> 
> # play
> gst-launch-1.0 playbin uri=file:///tmp/output.avi
> ================================================================
> [b]
> # create video
> gst-launch-1.0 videotestsrc num-buffers=200 ! video/x-raw,width=270,height=480 ! v4l2mpeg4enc output-io-mode=4 extra-controls="c,video_gop_size=11,video_bitrate=100000" ! avimux ! filesink location=divx/test_100000_11.avi
> 
> # re-encode it in software with different tag
> ffmpeg -i divx/test_100000_11.avi -vtag "XVID" xvid/test_100000_11.avi
> ================================================================
> [c]
> # directly insert the encoded stream into the decoder
> gst-launch-1.0 videotestsrc ! video/x-raw,width=480,height=360 ! v4l2mpeg4enc output-io-mode=4 ! v4l2mpeg4dec ! videoconvert ! ximagesink
> ================================================================
> [d]
> # store in avi file
> gst-launch-1.0 videotestsrc num-buffers=200 ! video/x-raw,width=270,height=480 ! v4l2mpeg4enc output-io-mode=4 ! avimux ! filesink location=/tmp/input.avi
> 
> # convert tag in software, since gstreamer decoder plugin doesn't take DIVX tag but avimux plugin forces it
> ffmpeg -i /tmp/input.avi -vtag "XVID" /tmp/output.avi
> 
> # play it
> gst-launch-1.0 playbin uri=file:///tmp/output.avi
> ================================================================
> [e]
> # run a static video and try to encode, decode and then play it
> gst-launch-1.0 videotestsrc num-buffers=200 pattern=blue ! video/x-raw,width=480,height=360 ! v4l2mpeg4enc output-io-mode=4 ! v4l2mpeg4dec ! videoconvert ! ximagesink
> ================================================================
> ================================================================
> [1]
> [853909.824215] coda 2040000.vpu: errors in 6 macroblocks
> [853909.832120] coda 2040000.vpu: errors in 6 macroblocks
> [853909.845459] coda 2040000.vpu: errors in 27 macroblocks
> [853909.854856] coda 2040000.vpu: errors in 27 macroblocks
> [853909.901550] coda 2040000.vpu: errors in 303 macroblocks
> [853909.908588] coda 2040000.vpu: errors in 303 macroblocks
> ================================================================
> [2]
> [441877.923839] coda 2040000.vpu: CODA PIC_RUN timeout
> [441878.963854] coda 2040000.vpu: CODA PIC_RUN timeout
> [441880.003842] coda 2040000.vpu: CODA PIC_RUN timeout
> [441881.043854] coda 2040000.vpu: CODA PIC_RUN timeout
> [441882.093818] coda 2040000.vpu: CODA PIC_RUN timeout
> [441883.123883] coda 2040000.vpu: CODA PIC_RUN timeout
> [441884.173863] coda 2040000.vpu: CODA PIC_RUN timeout
> [441885.203834] coda 2040000.vpu: CODA PIC_RUN timeout
> ================================================================
> [3]
> Input #0, avi, from 'divx/test_100000_11.avi':
>   Duration: 00:00:06.67, start: 0.000000, bitrate: 902 kb/s
>     Stream #0:0: Video: mpeg4 (Simple Profile) (DIVX / 0x58564944), yuv420p, 270x480 [SAR 1:1 DAR 9:16], 899 kb/s, 30 fps, 30 tbr, 30 tbn, 30 tbc
> Stream mapping:
>   Stream #0:0 -> #0:0 (mpeg4 (native) -> mpeg4 (native))
> Press [q] to stop, [?] for help
> [mpeg4 @ 0x5649b529bfc0] Error at MB: 360
> [mpeg4 @ 0x5649b529bfc0] concealing 227 DC, 227 AC, 227 MV errors in P frame
> Output #0, avi, to 'xvid/test_100000_11.avi':
>   Metadata:
>     ISFT            : Lavf58.20.100
>     Stream #0:0: Video: mpeg4 (XVID / 0x44495658), yuv420p, 270x480 [SAR 1:1 DAR 9:16], q=2-31, 200 kb/s, 30 fps, 30 tbn, 30 tbc
>     Metadata:
>       encoder         : Lavc58.35.100 mpeg4
>     Side data:
>       cpb: bitrate max/min/avg: 0/0/200000 buffer size: 0 vbv_delay: -1
> [mpeg4 @ 0x5649b529bfc0] slice end not reached but screenspace end (47 left 7E01DC, score= -6)
> [mpeg4 @ 0x5649b529bfc0] concealing 510 DC, 510 AC, 510 MV errors in I frame
> [mpeg4 @ 0x5649b52b2a80] slice end not reached but screenspace end (45 left 780321, score= -25)
> [mpeg4 @ 0x5649b52b2a80] concealing 510 DC, 510 AC, 510 MV errors in I frame
> [mpeg4 @ 0x5649b5295a00] slice end not reached but screenspace end (44 left 700DE7, score= -46)
> [mpeg4 @ 0x5649b5295a00] concealing 510 DC, 510 AC, 510 MV errors in I frame
> [mpeg4 @ 0x5649b529bfc0] slice end not reached but screenspace end (43 left 6796F1, score= -56)
> [mpeg4 @ 0x5649b529bfc0] concealing 510 DC, 510 AC, 510 MV errors in I frame
> [mpeg4 @ 0x5649b5297c40] slice end not reached but screenspace end (48 left 7F1AE9, score= -65)
> [mpeg4 @ 0x5649b5297c40] concealing 510 DC, 510 AC, 510 MV errors in I frame
> [mpeg4 @ 0x5649b52b2a80] slice end not reached but screenspace end (47 left 7E0095, score= -74)
> [mpeg4 @ 0x5649b52b2a80] concealing 510 DC, 510 AC, 510 MV errors in I frame
> [mpeg4 @ 0x5649b529bfc0] slice end not reached but screenspace end (42 left 400392, score= -102)
> [mpeg4 @ 0x5649b529bfc0] concealing 510 DC, 510 AC, 510 MV errors in I frame
> [mpeg4 @ 0x5649b5297c40] slice end not reached but screenspace end (46 left 7C0283, score= -164)
> [mpeg4 @ 0x5649b5297c40] concealing 510 DC, 510 AC, 510 MV errors in I frame
> [mpeg4 @ 0x5649b52b2a80] slice end not reached but screenspace end (42 left 68845C, score= -174)
> [mpeg4 @ 0x5649b52b2a80] concealing 510 DC, 510 AC, 510 MV errors in I frame
> frame=  200 fps=0.0 q=31.0 Lsize=     477kB time=00:00:06.66 bitrate= 586.2kbits/s speed=50.7x    
> video:467kB audio:0kB subtitle:0kB other streams:0kB global headers:0kB muxing overhead: 2.229403%
> 
> 
