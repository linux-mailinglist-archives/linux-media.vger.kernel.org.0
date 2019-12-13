Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A14D611E357
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2019 13:09:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726861AbfLMMJj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Dec 2019 07:09:39 -0500
Received: from mail1.skidata.com ([91.230.2.99]:62445 "EHLO mail1.skidata.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726717AbfLMMJj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Dec 2019 07:09:39 -0500
X-Greylist: delayed 428 seconds by postgrey-1.27 at vger.kernel.org; Fri, 13 Dec 2019 07:09:38 EST
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1576238978; x=1607774978;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=Lgf2OgsTxWXOctuDUoDgtroPiX5sMCN8aUGr27H47Kg=;
  b=Jb3unxtULWEsilRxsbu1SNJPCPHALeIbAHBjqv+W72yWnf00Q14TVkED
   d0/SvJm17wANiMkikO1Ezgt8rHJFV9M1D7Yc5ESabj8F4z9B7NbT5+zpS
   VHDp30mLPlAaXCJgod+i5nZvLS9ctqhXgDtuVOf7PSA82hQTshaIWAyTK
   3ABpPvYpBVM/6/lmVT9YNBm9p+oI0zWAHJKzljWft5I6KRoOpC/aXqQhZ
   kb99+KM3edfQFlIm993iLl394Y0rJrMBdKFP25LODZc2n5IhCCRotzQ7A
   bn9vbFGB38QR/3IyaxnMhxRmX1KWXWkgeKBpb6zCrIbGIcTXH5oPQEUuW
   w==;
IronPort-SDR: YzpZhNt6dpduNNI1bjBQ+XmOA4ksp3I74ko56LU1yx9LzlvfuEgXqZrc0nlqvejK8MFKWzuHgZ
 tG1tT0PRoQIusl6klpofBCeMCZQWJlhSnfZR5aC0gSQqzwc7Jqv2hIwRivd2FoE+cBHnkLwfaa
 +m4Aw029k5twffYtQmIL/MtIh70SnfefqWc7yzGLxX0syoKFxFSkRSRX4Ryq2vymO1Lr72EYl3
 oRMDxSGjrCPdM8OpDqvUs06avIep3baSK5qPb0oW4JHyq6UKFEqy2qHaKmRX5lqE5vN86tfCaG
 ua4=
X-IronPort-AV: E=Sophos;i="5.69,309,1571695200"; 
   d="scan'208";a="21497936"
From:   Benjamin Bara - SKIDATA <Benjamin.Bara@skidata.com>
To:     "linux-arm@lists.infradead.org" <linux-arm@lists.infradead.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
CC:     Richard Leitner - SKIDATA <Richard.Leitner@skidata.com>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "m.tretter@pengutronix.de" <m.tretter@pengutronix.de>
Subject: [i.MX6][CODA] certain resolutions are not working in YUYV format
Thread-Topic: [i.MX6][CODA] certain resolutions are not working in YUYV format
Thread-Index: AdWxrOwnZuVtf9YcQEOltE2oJImbmA==
Date:   Fri, 13 Dec 2019 12:02:25 +0000
Message-ID: <c79be4d41e414ae5b50ba1e26544b6c2@skidata.com>
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

Hey all,

we are currently facing a problem with the i.MX6DL and MPEG4-2 encoded vide=
os.
The decoder seem to fail to decode videos of certain resolutions (video out=
put becomes green).
For the latest test run, we used Linux kernel 5.4.2 and GStreamer version 1=
.16.1.

When hunting the problem down, it seems like the problem is related to the =
YUY2 (=3D YUYV) output format.
Unfortunately, gst always takes YUY2 as the default format for the v4l2mpeg=
4dec sink pad and=20
forcing a different format does not work (video becomes even more green).

We saw commit d40e98c13b3e7cb1aa16e9c14f35db3c8c3dd033, which added YUYV if=
 VDOA is used,
but could not find anything related in the i.MX 6Dual/6Quad VPU API Linux R=
eference Manual except:
"One pixel value of a component occupies one byte and the frame data is in =
YCbCr 4:2:0 format=20
for H.264, H.264 and MPEG-4 codecs." [sic] (Rev. L3.0.35_1.1.0, 01/2013)

For debug purposes, we changed the dst_formats of the decoder driver to onl=
y support YUV420 (=3D I420).
All tested resolutions are working with this setup.

Does anyone else face similar issues?

Please just drop me a mail if we should perform further debug actions or pr=
ovide further debug output.

BR,
Benjamin


*gst-launch pipeline to reproduce the error:*
gst-launch-1.0 -v videotestsrc ! video/x-raw,width=3D480,height=3D270 ! v4l=
2mpeg4enc output-io-mode=3D4 ! \
	v4l2mpeg4dec ! xvimagesink

*failing gst-launch pipeline to force the I420 format:*
gst-launch-1.0 -v videotestsrc ! video/x-raw,width=3D480,height=3D270 ! v4l=
2mpeg4enc output-io-mode=3D4 ! \
	v4l2mpeg4dec ! video/x-raw,format=3DI420 ! xvimagesink

*some other failing resolutions:*
- 320x200
- 400x270
- 400x300
- 480x250
- 480x270
- 480x500
- 640x200
- 800x600

*working resolutions:*
- 320x240
- 1024x576
- ...

*resulting dmesg output:*
[ 6159.838070] coda 2040000.vpu: CODA_COMMAND_SEQ_INIT failed, error code =
=3D 0x1
[ 6159.895636] coda 2040000.vpu: errors in 504 macroblocks
[ 6159.900877] coda 2040000.vpu: decoded frame index out of range: 0
[ 6160.963450] coda 2040000.vpu: CODA PIC_RUN timeout
[ 6162.003422] coda 2040000.vpu: CODA PIC_RUN timeout

*verbose output of failing gst-launch pipeline (GST_DEBUG=3D1):*
Setting pipeline to PAUSED ...
Pipeline is PREROLLING ...
/GstPipeline:pipeline0/GstVideoTestSrc:videotestsrc0.GstPad:src: caps =3D v=
ideo/x-raw, format=3D(string)I420, width=3D(int)480, height=3D(int)270, fra=
merate=3D(fraction)30/1, multiview-mode=3D(string)mono, interlace-mode=3D(s=
tring)progressive, colorimetry=3D(string)bt601, pixel-aspect-ratio=3D(fract=
ion)1/1
/GstPipeline:pipeline0/GstCapsFilter:capsfilter0.GstPad:src: caps =3D video=
/x-raw, format=3D(string)I420, width=3D(int)480, height=3D(int)270, framera=
te=3D(fraction)30/1, multiview-mode=3D(string)mono, interlace-mode=3D(strin=
g)progressive, colorimetry=3D(string)bt601, pixel-aspect-ratio=3D(fraction)=
1/1
/GstPipeline:pipeline0/v4l2mpeg4enc:v4l2mpeg4enc0.GstPad:src: caps =3D vide=
o/mpeg, mpegversion=3D(int)4, systemstream=3D(boolean)false, profile=3D(str=
ing)simple, level=3D(string)5, width=3D(int)480, height=3D(int)270, pixel-a=
spect-ratio=3D(fraction)1/1, framerate=3D(fraction)30/1, interlace-mode=3D(=
string)progressive, colorimetry=3D(string)bt601, multiview-mode=3D(string)m=
ono, multiview-flags=3D(GstVideoMultiviewFlagsSet)0:ffffffff:/right-view-fi=
rst/left-flipped/left-flopped/right-flipped/right-flopped/half-aspect/mixed=
-mono
/GstPipeline:pipeline0/v4l2mpeg4dec:v4l2mpeg4dec0.GstPad:sink: caps =3D vid=
eo/mpeg, mpegversion=3D(int)4, systemstream=3D(boolean)false, profile=3D(st=
ring)simple, level=3D(string)5, width=3D(int)480, height=3D(int)270, pixel-=
aspect-ratio=3D(fraction)1/1, framerate=3D(fraction)30/1, interlace-mode=3D=
(string)progressive, colorimetry=3D(string)bt601, multiview-mode=3D(string)=
mono, multiview-flags=3D(GstVideoMultiviewFlagsSet)0:ffffffff:/right-view-f=
irst/left-flipped/left-flopped/right-flipped/right-flopped/half-aspect/mixe=
d-mono
Redistribute latency...
/GstPipeline:pipeline0/v4l2mpeg4enc:v4l2mpeg4enc0.GstPad:sink: caps =3D vid=
eo/x-raw, format=3D(string)I420, width=3D(int)480, height=3D(int)270, frame=
rate=3D(fraction)30/1, multiview-mode=3D(string)mono, interlace-mode=3D(str=
ing)progressive, colorimetry=3D(string)bt601, pixel-aspect-ratio=3D(fractio=
n)1/1
/GstPipeline:pipeline0/GstCapsFilter:capsfilter0.GstPad:sink: caps =3D vide=
o/x-raw, format=3D(string)I420, width=3D(int)480, height=3D(int)270, framer=
ate=3D(fraction)30/1, multiview-mode=3D(string)mono, interlace-mode=3D(stri=
ng)progressive, colorimetry=3D(string)bt601, pixel-aspect-ratio=3D(fraction=
)1/1
/GstPipeline:pipeline0/v4l2mpeg4dec:v4l2mpeg4dec0.GstPad:src: caps =3D vide=
o/x-raw, format=3D(string)YUY2, width=3D(int)480, height=3D(int)270, interl=
ace-mode=3D(string)progressive, multiview-mode=3D(string)mono, multiview-fl=
ags=3D(GstVideoMultiviewFlagsSet)0:ffffffff:/right-view-first/left-flipped/=
left-flopped/right-flipped/right-flopped/half-aspect/mixed-mono, pixel-aspe=
ct-ratio=3D(fraction)1/1, chroma-site=3D(string)jpeg, colorimetry=3D(string=
)bt601, framerate=3D(fraction)30/1
/GstPipeline:pipeline0/GstXvImageSink:xvimagesink0.GstPad:sink: caps =3D vi=
deo/x-raw, format=3D(string)YUY2, width=3D(int)480, height=3D(int)270, inte=
rlace-mode=3D(string)progressive, multiview-mode=3D(string)mono, multiview-=
flags=3D(GstVideoMultiviewFlagsSet)0:ffffffff:/right-view-first/left-flippe=
d/left-flopped/right-flipped/right-flopped/half-aspect/mixed-mono, pixel-as=
pect-ratio=3D(fraction)1/1, chroma-site=3D(string)jpeg, colorimetry=3D(stri=
ng)bt601, framerate=3D(fraction)30/1
Pipeline is PREROLLED ...
Setting pipeline to PLAYING ...

