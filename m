Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9D8B158B0F
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2020 09:08:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727685AbgBKIIn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Feb 2020 03:08:43 -0500
Received: from mail1.skidata.com ([91.230.2.99]:48073 "EHLO mail1.skidata.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727618AbgBKIIn (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Feb 2020 03:08:43 -0500
X-Greylist: delayed 431 seconds by postgrey-1.27 at vger.kernel.org; Tue, 11 Feb 2020 03:08:42 EST
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1581408522; x=1612944522;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=IllaSt1ArmriAOeKoQzwT1j3E006qiGC32F5mmM1HJc=;
  b=lelUQKXq4AbV4mYgp9yPA11VdX3+oegzE64Wzt3X1103a4b1NyzLcRg3
   lp+SAQVR0smXq9K18qEFnrD49vijHDHdm4zPrzMKn58XxV1jjGVdNvuuO
   PjXm5f908L9cx+DK+u2PE4WGJr1WYMzq2IzNUP6kwhb6HnISEJP3yOduA
   UIZjqGTkPtbahT14IlFsaOkyuiWH9Ct2vD/vNcxcuPW0hT9J+Sc9rid0X
   awo/c/J0IbqOdQMxBfguCMBMALz69BtnVJMcTvUCA9T7frai3anUOT3uu
   Ym35Y526tXtP0Ds9MuW6MoG2YY0U5eHxB1nxw1vsk0HTzra1Kol3HzDER
   w==;
IronPort-SDR: YlEoP2/ITMfr5GCDm4GEE5Kyw1F1aU8TxYPXOIJMZXqM3v2EacaTgADNeSBC9L6PnSInq9K4V/
 SbzhwXU7SrusiJY+w1pCEutRL8ykzRAtDSx0UUgw4uOyHkT9+tD/Cs2tv7VB2t9SZP7Db5iYHf
 lDEvKOFpb1WuhMJg//pdkCUclqhMasWekY48uDaRuOU5bFDzFPSTQ7DtQz8pwRXruqoD0Edqqa
 7c5FYXgIurpyDcFeXz9YEWOTlXMqO7K7wB5z6gipLGwwU6TJb/obV4k8M5+RMD8sfOkxJ2lSON
 PDk=
X-IronPort-AV: E=Sophos;i="5.70,428,1574118000"; 
   d="scan'208";a="22588507"
From:   Benjamin Bara - SKIDATA <Benjamin.Bara@skidata.com>
To:     Michael Tretter <m.tretter@pengutronix.de>
CC:     "linux-arm@lists.infradead.org" <linux-arm@lists.infradead.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "Richard Leitner - SKIDATA" <Richard.Leitner@skidata.com>
Subject: RE: [i.MX6][CODA] certain resolutions are not working in YUYV format
Thread-Topic: [i.MX6][CODA] certain resolutions are not working in YUYV format
Thread-Index: AdWxrOwnZuVtf9YcQEOltE2oJImbmACf+ImAACiyrmAK9/gZ8A==
Date:   Tue, 11 Feb 2020 08:01:29 +0000
Message-ID: <33f64557817d43af9b9267e107ba9723@skidata.com>
References: <c79be4d41e414ae5b50ba1e26544b6c2@skidata.com>
 <20191216182101.3676c280@litschi.hi.pengutronix.de>
 <43c38b41ad7547c6baaa56c41a05be87@skidata.com>
In-Reply-To: <43c38b41ad7547c6baaa56c41a05be87@skidata.com>
Accept-Language: en-US, de-AT
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.111.252]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Michael,

any news from your side?
We did some further testing with MPEG4-2 videos and the new 5.5 kernel.

Summary:
1.) decoding of videos with a height not divisible by 16 (macroblock size) =
brings erroneous pixels/fragments in the top area.
2.) decoding of videos with BVOP2 (2 B-Frames) [a] results in macroblock er=
rors [1].
3.) decoding of "static" videos with low bitrates and a GoP size > 1 result=
s in timeouts [2].
4.) encoded videos with low bitrates and GoP size > 1 show ffmpeg errors [3=
] during re-encoding with a different tag (in software) [b].

ad 1.)
When running [c], the fragments are not shown.
But when the stream is stored in a file and then played (as in [d]), some o=
f the top pixel rows are erroneous.
These fragments also occur on other videos, encoded with different software=
 libraries.

ad 3.)
This is especially the case if the video is static and the size of a P-fram=
e packet is low.
Can e.g. be reproduced with [e], but also happens during decoding with in s=
oftware encoded videos with similar attributes.
The size of a P-frame packet of such a video is around 94 bytes. Is it poss=
ible that there is a limitation regarding minimum packet size?

ad 4.)
Did [b] with a bitrate from 100k to 2M in 25k steps and a GoP size from 1 t=
o 16.
The following combinations result in at least P-frame errors. Some also con=
tain I-frame errors, as can be seen in [3]:
100k: 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
125k: 4, 5, 7, 8, 9, 10, 13, 14, 15
150k: 4, 5, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
175k: 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
200k: 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
225k: 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
250k: 2, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
275k: 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
300k: 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
325k: 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
350k: 2, 3, 4, 6, 7, 8, 9, 10
375k: 2, 3, 4, 5, 6, 7, 8, 10
400k: 2, 3, 4, 5, 6, 7, 9, 10, 11, 13, 15, 16
425k: 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 16
450k: 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
475k: 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 14, 15
500k: 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
525k: 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 14, 16

GoP size of 1 did not show any errors.

=3D> Point 3.) and 4.) might be related?

Also noticeable: The expected/configured bitrate strongly varies from the d=
etected bitrate.


If you need further info or if we should take further actions, just drop us=
 a mail.

thanks & br,
Benjamin


[a]
# create video
gst-launch-1.0 videotestsrc num-buffers=3D200 ! video/x-raw,width=3D270,hei=
ght=3D480 ! v4l2mpeg4enc output-io-mode=3D4 ! avimux ! filesink location=3D=
/tmp/input.avi

# re-encode in software: SP@L1 w/ BVOP2
ffmpeg -i /tmp/input.avi -c:v mpeg4 -vtag XVID -profile:v 0 -level 1 -bf 2 =
/tmp/output.avi

# re-encode in software: ASP@L5 w/ BVOP2
ffmpeg -i /tmp/input.avi -c:v mpeg4 -vtag XVID -profile:v 15 -level 5 -bf 2=
 /tmp/output.avi

# play
gst-launch-1.0 playbin uri=3Dfile:///tmp/output.avi
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[b]
# create video
gst-launch-1.0 videotestsrc num-buffers=3D200 ! video/x-raw,width=3D270,hei=
ght=3D480 ! v4l2mpeg4enc output-io-mode=3D4 extra-controls=3D"c,video_gop_s=
ize=3D11,video_bitrate=3D100000" ! avimux ! filesink location=3Ddivx/test_1=
00000_11.avi

# re-encode it in software with different tag
ffmpeg -i divx/test_100000_11.avi -vtag "XVID" xvid/test_100000_11.avi
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[c]
# directly insert the encoded stream into the decoder
gst-launch-1.0 videotestsrc ! video/x-raw,width=3D480,height=3D360 ! v4l2mp=
eg4enc output-io-mode=3D4 ! v4l2mpeg4dec ! videoconvert ! ximagesink
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[d]
# store in avi file
gst-launch-1.0 videotestsrc num-buffers=3D200 ! video/x-raw,width=3D270,hei=
ght=3D480 ! v4l2mpeg4enc output-io-mode=3D4 ! avimux ! filesink location=3D=
/tmp/input.avi

# convert tag in software, since gstreamer decoder plugin doesn't take DIVX=
 tag but avimux plugin forces it
ffmpeg -i /tmp/input.avi -vtag "XVID" /tmp/output.avi

# play it
gst-launch-1.0 playbin uri=3Dfile:///tmp/output.avi
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[e]
# run a static video and try to encode, decode and then play it
gst-launch-1.0 videotestsrc num-buffers=3D200 pattern=3Dblue ! video/x-raw,=
width=3D480,height=3D360 ! v4l2mpeg4enc output-io-mode=3D4 ! v4l2mpeg4dec !=
 videoconvert ! ximagesink
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[1]
[853909.824215] coda 2040000.vpu: errors in 6 macroblocks
[853909.832120] coda 2040000.vpu: errors in 6 macroblocks
[853909.845459] coda 2040000.vpu: errors in 27 macroblocks
[853909.854856] coda 2040000.vpu: errors in 27 macroblocks
[853909.901550] coda 2040000.vpu: errors in 303 macroblocks
[853909.908588] coda 2040000.vpu: errors in 303 macroblocks
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[2]
[441877.923839] coda 2040000.vpu: CODA PIC_RUN timeout
[441878.963854] coda 2040000.vpu: CODA PIC_RUN timeout
[441880.003842] coda 2040000.vpu: CODA PIC_RUN timeout
[441881.043854] coda 2040000.vpu: CODA PIC_RUN timeout
[441882.093818] coda 2040000.vpu: CODA PIC_RUN timeout
[441883.123883] coda 2040000.vpu: CODA PIC_RUN timeout
[441884.173863] coda 2040000.vpu: CODA PIC_RUN timeout
[441885.203834] coda 2040000.vpu: CODA PIC_RUN timeout
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[3]
Input #0, avi, from 'divx/test_100000_11.avi':
  Duration: 00:00:06.67, start: 0.000000, bitrate: 902 kb/s
    Stream #0:0: Video: mpeg4 (Simple Profile) (DIVX / 0x58564944), yuv420p=
, 270x480 [SAR 1:1 DAR 9:16], 899 kb/s, 30 fps, 30 tbr, 30 tbn, 30 tbc
Stream mapping:
  Stream #0:0 -> #0:0 (mpeg4 (native) -> mpeg4 (native))
Press [q] to stop, [?] for help
[mpeg4 @ 0x5649b529bfc0] Error at MB: 360
[mpeg4 @ 0x5649b529bfc0] concealing 227 DC, 227 AC, 227 MV errors in P fram=
e
Output #0, avi, to 'xvid/test_100000_11.avi':
  Metadata:
    ISFT            : Lavf58.20.100
    Stream #0:0: Video: mpeg4 (XVID / 0x44495658), yuv420p, 270x480 [SAR 1:=
1 DAR 9:16], q=3D2-31, 200 kb/s, 30 fps, 30 tbn, 30 tbc
    Metadata:
      encoder         : Lavc58.35.100 mpeg4
    Side data:
      cpb: bitrate max/min/avg: 0/0/200000 buffer size: 0 vbv_delay: -1
[mpeg4 @ 0x5649b529bfc0] slice end not reached but screenspace end (47 left=
 7E01DC, score=3D -6)
[mpeg4 @ 0x5649b529bfc0] concealing 510 DC, 510 AC, 510 MV errors in I fram=
e
[mpeg4 @ 0x5649b52b2a80] slice end not reached but screenspace end (45 left=
 780321, score=3D -25)
[mpeg4 @ 0x5649b52b2a80] concealing 510 DC, 510 AC, 510 MV errors in I fram=
e
[mpeg4 @ 0x5649b5295a00] slice end not reached but screenspace end (44 left=
 700DE7, score=3D -46)
[mpeg4 @ 0x5649b5295a00] concealing 510 DC, 510 AC, 510 MV errors in I fram=
e
[mpeg4 @ 0x5649b529bfc0] slice end not reached but screenspace end (43 left=
 6796F1, score=3D -56)
[mpeg4 @ 0x5649b529bfc0] concealing 510 DC, 510 AC, 510 MV errors in I fram=
e
[mpeg4 @ 0x5649b5297c40] slice end not reached but screenspace end (48 left=
 7F1AE9, score=3D -65)
[mpeg4 @ 0x5649b5297c40] concealing 510 DC, 510 AC, 510 MV errors in I fram=
e
[mpeg4 @ 0x5649b52b2a80] slice end not reached but screenspace end (47 left=
 7E0095, score=3D -74)
[mpeg4 @ 0x5649b52b2a80] concealing 510 DC, 510 AC, 510 MV errors in I fram=
e
[mpeg4 @ 0x5649b529bfc0] slice end not reached but screenspace end (42 left=
 400392, score=3D -102)
[mpeg4 @ 0x5649b529bfc0] concealing 510 DC, 510 AC, 510 MV errors in I fram=
e
[mpeg4 @ 0x5649b5297c40] slice end not reached but screenspace end (46 left=
 7C0283, score=3D -164)
[mpeg4 @ 0x5649b5297c40] concealing 510 DC, 510 AC, 510 MV errors in I fram=
e
[mpeg4 @ 0x5649b52b2a80] slice end not reached but screenspace end (42 left=
 68845C, score=3D -174)
[mpeg4 @ 0x5649b52b2a80] concealing 510 DC, 510 AC, 510 MV errors in I fram=
e
frame=3D  200 fps=3D0.0 q=3D31.0 Lsize=3D     477kB time=3D00:00:06.66 bitr=
ate=3D 586.2kbits/s speed=3D50.7x   =20
video:467kB audio:0kB subtitle:0kB other streams:0kB global headers:0kB mux=
ing overhead: 2.229403%

