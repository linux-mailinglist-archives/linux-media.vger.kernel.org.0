Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4792E122AD1
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2019 12:59:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726709AbfLQL7k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Dec 2019 06:59:40 -0500
Received: from mail1.skidata.com ([91.230.2.99]:30991 "EHLO mail1.skidata.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726571AbfLQL7k (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Dec 2019 06:59:40 -0500
X-Greylist: delayed 429 seconds by postgrey-1.27 at vger.kernel.org; Tue, 17 Dec 2019 06:59:37 EST
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1576583977; x=1608119977;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=hGG6CubuzBBr5HBRwAFdhI4RWU5bgGDl+4SKNtATbnc=;
  b=kfUDUZ/cKx+gHdfSgPfaNScPndGqUZZrznrW/x+MwIwy4h46QarsDHDI
   5mu53HrVkgCPKef+w2ndYWNvM+jx039oJjJf41FfGO36WfB68UlpPWaUp
   hMSybNLe1zu6/OzjA10wzwkInR+35GMg7PWM8iidlc3qbL9JzIVAvA2l4
   XdAYT5yTP9r6gxIa3tscWhyNKn6Z7TbZ300scetBpvkS1Vcu6nxLhUubK
   g1Zh/JvF6zQMXfPRzEJQ342RHlMLLtQykTpF+x+MXtgDf47kgK1331qOZ
   2DoWCY3RKe152PmtGyU+Pkl6o/IPmY8gDqfmg8Yqq6yTDCKDXWTLgvUFz
   w==;
IronPort-SDR: b00AF1NpqUimrlly03DcsvqwVmqTBzrGpcgvol8HWLpGnQEWnWFuK4xNvD2+cKe68W20IikRYS
 zuuTqOwsF5GESt9G2OJ8c5zk+uqRnxnyC3RF4cVGYJUM1pHCksdW7YmCceLpfdGv3a3X6B86fv
 Rhc49aiK00pE2S7RAEwLYRWFFgjIf0q6gkxvsJIu18lf/RefnjHvV0spdGzhRJA6yIvqO919P0
 hyuit/4lT6bIfrIJaa25fEKaLyyFlVqreSZv/iaIPmcumKmPJxTUJozqnYXwMrOFubFtLoRX39
 5Rg=
X-IronPort-AV: E=Sophos;i="5.69,325,1571695200"; 
   d="scan'208";a="21565749"
From:   Benjamin Bara - SKIDATA <Benjamin.Bara@skidata.com>
To:     Michael Tretter <m.tretter@pengutronix.de>
CC:     "linux-arm@lists.infradead.org" <linux-arm@lists.infradead.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "Richard Leitner - SKIDATA" <Richard.Leitner@skidata.com>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>
Subject: RE: [i.MX6][CODA] certain resolutions are not working in YUYV format
Thread-Topic: [i.MX6][CODA] certain resolutions are not working in YUYV format
Thread-Index: AdWxrOwnZuVtf9YcQEOltE2oJImbmACf+ImAACiyrmA=
Date:   Tue, 17 Dec 2019 11:52:26 +0000
Message-ID: <43c38b41ad7547c6baaa56c41a05be87@skidata.com>
References: <c79be4d41e414ae5b50ba1e26544b6c2@skidata.com>
 <20191216182101.3676c280@litschi.hi.pengutronix.de>
In-Reply-To: <20191216182101.3676c280@litschi.hi.pengutronix.de>
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

Hi Michael,

thanks for your fast reply.

> Did you remove all other formats except for YUV420 from the driver?=20

Exactly.

> Once you did that, all resolutions are decoded correctly?

Exactly.
But it happens very often that decoding the resolutions 320x200 and 400x300=
=20
fails completely (see log on bottom). This occurs independent from the form=
at in use.
However, independent from that, the decoding is correct, even on videos wit=
h a height
not divisible by 16.

> What happens if you force the driver to produce NV12 as destination forma=
t?

Artefacts appear on the top of each video with a height not divisible by 16=
.
The amount of incorrect pixel rows varies.
For example, with 480x500 the top 23 pixel rows and with 400x270 the top 3 =
pixel rows=20
are "wrong".
We again removed all other formats in the driver.

> The height of the working resolutions seems to be a multiple of 16,=20
> which is the macroblock size.=20

We can confirm that.=20
We tried a couple more heights, the problem seems to be related to that.
However, the width seems to have no influence.

> Do you see the problems only with videos that are encoded by the CODA or
> also with other mpeg4 encoded videos?

We also tried videos that are encoded with libxvid with the same outcome.


For further debugging, we also disabled the VDOA (by setting disable_vdoa=
=3D1) with the unmodified driver.
The result is exactly the same as forcing the I420 with a gst filter, as pr=
eviously described.
The decoded output turns out to be completely green, also for "working reso=
lutions".

Another finding, when modifying the driver:=20
When forcing NV12, the VDOA is only enabled on the two "working resolutions=
" (dmesg output).
When forcing YUV420, the VDOA is always disabled (dmesg output).

BR,
Benjamin


*NV12 VDOA state log, disabled ones have artefacts*
width=3D1024,height=3D576.log:  [ 3470.252753] coda 2040000.vpu: 0: Video D=
ata Order Adapter: Enabled
width=3D320,height=3D200.log:  [ 3447.371954] coda 2040000.vpu: 0: Video Da=
ta Order Adapter: Disabled
width=3D320,height=3D240.log:  [ 3468.941241] coda 2040000.vpu: 0: Video Da=
ta Order Adapter: Enabled
width=3D400,height=3D270.log:  [ 3453.788067] coda 2040000.vpu: 0: Video Da=
ta Order Adapter: Disabled
width=3D400,height=3D300.log:  [ 3455.110895] coda 2040000.vpu: 0: Video Da=
ta Order Adapter: Disabled
width=3D480,height=3D250.log:  [ 3461.457987] coda 2040000.vpu: 0: Video Da=
ta Order Adapter: Disabled
width=3D480,height=3D270.log:  [ 3462.803341] coda 2040000.vpu: 0: Video Da=
ta Order Adapter: Disabled
width=3D480,height=3D500.log:  [ 3464.198940] coda 2040000.vpu: 0: Video Da=
ta Order Adapter: Disabled
width=3D640,height=3D200.log:  [ 3465.745334] coda 2040000.vpu: 0: Video Da=
ta Order Adapter: Disabled
width=3D800,height=3D600.log:  [ 3467.132577] coda 2040000.vpu: 0: Video Da=
ta Order Adapter: Disabled


*disabled VDOA results to I420 format*
Setting pipeline to PAUSED ...
Pipeline is PREROLLING ...
/GstPipeline:pipeline0/GstVideoTestSrc:videotestsrc0.GstPad:src: caps =3D v=
ideo/x-raw, format=3D(string)I420, width=3D(int)320, height=3D(int)240, fra=
merate=3D(fraction)30/1, multiview-mode=3D(string)mono, interlace-mode=3D(s=
tring)progressive, colorimetry=3D(string)bt601, pixel-aspect-ratio=3D(fract=
ion)1/1
/GstPipeline:pipeline0/GstCapsFilter:capsfilter0.GstPad:src: caps =3D video=
/x-raw, format=3D(string)I420, width=3D(int)320, height=3D(int)240, framera=
te=3D(fraction)30/1, multiview-mode=3D(string)mono, interlace-mode=3D(strin=
g)progressive, colorimetry=3D(string)bt601, pixel-aspect-ratio=3D(fraction)=
1/1
/GstPipeline:pipeline0/v4l2mpeg4enc:v4l2mpeg4enc0.GstPad:src: caps =3D vide=
o/mpeg, mpegversion=3D(int)4, systemstream=3D(boolean)false, profile=3D(str=
ing)simple, level=3D(string)5, width=3D(int)320, height=3D(int)240, pixel-a=
spect-ratio=3D(fraction)1/1, framerate=3D(fraction)30/1, interlace-mode=3D(=
string)progressive, colorimetry=3D(string)bt601, multiview-mode=3D(string)m=
ono, multiview-flags=3D(GstVideoMultiviewFlagsSet)0:ffffffff:/right-view-fi=
rst/left-flipped/left-flopped/right-flipped/right-flopped/half-aspect/mixed=
-mono
/GstPipeline:pipeline0/v4l2mpeg4dec:v4l2mpeg4dec0.GstPad:sink: caps =3D vid=
eo/mpeg, mpegversion=3D(int)4, systemstream=3D(boolean)false, profile=3D(st=
ring)simple, level=3D(string)5, width=3D(int)320, height=3D(int)240, pixel-=
aspect-ratio=3D(fraction)1/1, framerate=3D(fraction)30/1, interlace-mode=3D=
(string)progressive, colorimetry=3D(string)bt601, multiview-mode=3D(string)=
mono, multiview-flags=3D(GstVideoMultiviewFlagsSet)0:ffffffff:/right-view-f=
irst/left-flipped/left-flopped/right-flipped/right-flopped/half-aspect/mixe=
d-mono
Redistribute latency...
/GstPipeline:pipeline0/v4l2mpeg4enc:v4l2mpeg4enc0.GstPad:sink: caps =3D vid=
eo/x-raw, format=3D(string)I420, width=3D(int)320, height=3D(int)240, frame=
rate=3D(fraction)30/1, multiview-mode=3D(string)mono, interlace-mode=3D(str=
ing)progressive, colorimetry=3D(string)bt601, pixel-aspect-ratio=3D(fractio=
n)1/1
/GstPipeline:pipeline0/GstCapsFilter:capsfilter0.GstPad:sink: caps =3D vide=
o/x-raw, format=3D(string)I420, width=3D(int)320, height=3D(int)240, framer=
ate=3D(fraction)30/1, multiview-mode=3D(string)mono, interlace-mode=3D(stri=
ng)progressive, colorimetry=3D(string)bt601, pixel-aspect-ratio=3D(fraction=
)1/1
/GstPipeline:pipeline0/v4l2mpeg4dec:v4l2mpeg4dec0.GstPad:src: caps =3D vide=
o/x-raw, format=3D(string)I420, width=3D(int)320, height=3D(int)240, interl=
ace-mode=3D(string)progressive, multiview-mode=3D(string)mono, multiview-fl=
ags=3D(GstVideoMultiviewFlagsSet)0:ffffffff:/right-view-first/left-flipped/=
left-flopped/right-flipped/right-flopped/half-aspect/mixed-mono, pixel-aspe=
ct-ratio=3D(fraction)1/1, chroma-site=3D(string)jpeg, colorimetry=3D(string=
)bt601, framerate=3D(fraction)30/1
/GstPipeline:pipeline0/GstJpegEnc:jpegenc0.GstPad:sink: caps =3D video/x-ra=
w, format=3D(string)I420, width=3D(int)320, height=3D(int)240, interlace-mo=
de=3D(string)progressive, multiview-mode=3D(string)mono, multiview-flags=3D=
(GstVideoMultiviewFlagsSet)0:ffffffff:/right-view-first/left-flipped/left-f=
lopped/right-flipped/right-flopped/half-aspect/mixed-mono, pixel-aspect-rat=
io=3D(fraction)1/1, chroma-site=3D(string)jpeg, colorimetry=3D(string)bt601=
, framerate=3D(fraction)30/1
/GstPipeline:pipeline0/GstJpegEnc:jpegenc0.GstPad:src: caps =3D image/jpeg,=
 sof-marker=3D(int)0, width=3D(int)320, height=3D(int)240, pixel-aspect-rat=
io=3D(fraction)1/1, framerate=3D(fraction)30/1, interlace-mode=3D(string)pr=
ogressive, colorimetry=3D(string)bt601, chroma-site=3D(string)jpeg, multivi=
ew-mode=3D(string)mono, multiview-flags=3D(GstVideoMultiviewFlagsSet)0:ffff=
ffff:/right-view-first/left-flipped/left-flopped/right-flipped/right-floppe=
d/half-aspect/mixed-mono
/GstPipeline:pipeline0/GstMultiFileSink:multifilesink0.GstPad:sink: caps =
=3D image/jpeg, sof-marker=3D(int)0, width=3D(int)320, height=3D(int)240, p=
ixel-aspect-ratio=3D(fraction)1/1, framerate=3D(fraction)30/1, interlace-mo=
de=3D(string)progressive, colorimetry=3D(string)bt601, chroma-site=3D(strin=
g)jpeg, multiview-mode=3D(string)mono, multiview-flags=3D(GstVideoMultiview=
FlagsSet)0:ffffffff:/right-view-first/left-flipped/left-flopped/right-flipp=
ed/right-flopped/half-aspect/mixed-mono
Pipeline is PREROLLED ...
Setting pipeline to PLAYING ...

=20
*failed 320x200 decoding (this time with NV12 format)*
  [ 3446.527178] coda 2040000.vpu: Using fallback firmware vpu/vpu_fw_imx6d=
.bin
  [ 3446.530688] coda 2040000.vpu: Firmware code revision: 570363
  [ 3446.530699] coda 2040000.vpu: Initialized CODA960.
  [ 3446.530704] coda 2040000.vpu: Firmware version: 3.1.1
  [ 3446.533544] coda 2040000.vpu: encoder registered as video4
  [ 3446.534523] coda 2040000.vpu: decoder registered as video5
  [ 3446.539369] coda 2040000.vpu: 0: open instance (11a120f6)
  [ 3446.539485] coda 2040000.vpu: 0: s_ctrl: id =3D 0x980914, name =3D "Ho=
rizontal Flip", val =3D 0
  [ 3446.539494] coda 2040000.vpu: 0: s_ctrl: id =3D 0x980915, name =3D "Ve=
rtical Flip", val =3D 0
  [ 3446.539502] coda 2040000.vpu: 0: s_ctrl: id =3D 0x9909cf, name =3D "Vi=
deo Bitrate", val =3D 0
  [ 3446.539509] coda 2040000.vpu: 0: s_ctrl: id =3D 0x9909cb, name =3D "Vi=
deo GOP Size", val =3D 16
  [ 3446.539515] coda 2040000.vpu: 0: s_ctrl: id =3D 0x990a5e, name =3D "H2=
64 I-Frame QP Value", val =3D 25
  [ 3446.539521] coda 2040000.vpu: 0: s_ctrl: id =3D 0x990a5f, name =3D "H2=
64 P-Frame QP Value", val =3D 25
  [ 3446.539526] coda 2040000.vpu: 0: s_ctrl: id =3D 0x990a62, name =3D "H2=
64 Maximum QP Value", val =3D 51
  [ 3446.539533] coda 2040000.vpu: 0: s_ctrl: id =3D 0x990a68, name =3D "H2=
64 Loop Filter Alpha Offset", val =3D 0
  [ 3446.539538] coda 2040000.vpu: 0: s_ctrl: id =3D 0x990a69, name =3D "H2=
64 Loop Filter Beta Offset", val =3D 0
  [ 3446.539545] coda 2040000.vpu: 0: s_ctrl: id =3D 0x990a6a, name =3D "H2=
64 Loop Filter Mode", val =3D 0 ("Enabled")
  [ 3446.539551] coda 2040000.vpu: 0: s_ctrl: id =3D 0x990a7f, name =3D "H2=
64 Constrained Intra Pred", val =3D 0
  [ 3446.539556] coda 2040000.vpu: 0: s_ctrl: id =3D 0x990a80, name =3D "H2=
64 Chroma QP Index Offset", val =3D 0
  [ 3446.539563] coda 2040000.vpu: 0: s_ctrl: id =3D 0x990a6b, name =3D "H2=
64 Profile", val =3D 0 ("Baseline")
  [ 3446.539569] coda 2040000.vpu: 0: s_ctrl: id =3D 0x990a67, name =3D "H2=
64 Level", val =3D 11 ("4")
  [ 3446.539575] coda 2040000.vpu: 0: s_ctrl: id =3D 0x990a90, name =3D "MP=
EG4 I-Frame QP Value", val =3D 2
  [ 3446.539581] coda 2040000.vpu: 0: s_ctrl: id =3D 0x990a91, name =3D "MP=
EG4 P-Frame QP Value", val =3D 2
  [ 3446.539587] coda 2040000.vpu: 0: s_ctrl: id =3D 0x990a96, name =3D "MP=
EG4 Profile", val =3D 0 ("Simple")
  [ 3446.539593] coda 2040000.vpu: 0: s_ctrl: id =3D 0x990a95, name =3D "MP=
EG4 Level", val =3D 7 ("5")
  [ 3446.539599] coda 2040000.vpu: 0: s_ctrl: id =3D 0x9909dd, name =3D "Sl=
ice Partitioning Method", val =3D 0 ("Single")
  [ 3446.539605] coda 2040000.vpu: 0: s_ctrl: id =3D 0x9909dc, name =3D "Nu=
mber of MBs in a Slice", val =3D 1
  [ 3446.539611] coda 2040000.vpu: 0: s_ctrl: id =3D 0x9909db, name =3D "Ma=
ximum Bytes in a Slice", val =3D 500
  [ 3446.539617] coda 2040000.vpu: 0: s_ctrl: id =3D 0x9909d8, name =3D "Se=
quence Header Mode", val =3D 1 ("Joined With 1st Frame")
  [ 3446.539623] coda 2040000.vpu: 0: s_ctrl: id =3D 0x9909d6, name =3D "Nu=
mber of Intra Refresh MBs", val =3D 0
  [ 3446.539629] coda 2040000.vpu: 0: s_ctrl: id =3D 0x9909e1, name =3D "In=
itial Delay for VBV Control", val =3D 0
  [ 3446.539635] coda 2040000.vpu: 0: s_ctrl: id =3D 0x9909de, name =3D "VB=
V Buffer Size", val =3D 0
  [ 3446.540164] coda 2040000.vpu: 0: release instance (11a120f6)
  [ 3446.549095] coda 2040000.vpu: 0: open instance (11a120f6)
  [ 3446.549210] coda 2040000.vpu: 0: s_ctrl: id =3D 0x980914, name =3D "Ho=
rizontal Flip", val =3D 0
  [ 3446.549226] coda 2040000.vpu: 0: s_ctrl: id =3D 0x980915, name =3D "Ve=
rtical Flip", val =3D 0
  [ 3446.549832] coda 2040000.vpu: 0: release instance (11a120f6)
  [ 3447.149581] coda 2040000.vpu: 0: open instance (11a120f6)
  [ 3447.149690] coda 2040000.vpu: 0: s_ctrl: id =3D 0x980914, name =3D "Ho=
rizontal Flip", val =3D 0
  [ 3447.149699] coda 2040000.vpu: 0: s_ctrl: id =3D 0x980915, name =3D "Ve=
rtical Flip", val =3D 0
  [ 3447.149706] coda 2040000.vpu: 0: s_ctrl: id =3D 0x9909cf, name =3D "Vi=
deo Bitrate", val =3D 0
  [ 3447.149713] coda 2040000.vpu: 0: s_ctrl: id =3D 0x9909cb, name =3D "Vi=
deo GOP Size", val =3D 16
  [ 3447.149720] coda 2040000.vpu: 0: s_ctrl: id =3D 0x990a5e, name =3D "H2=
64 I-Frame QP Value", val =3D 25
  [ 3447.149726] coda 2040000.vpu: 0: s_ctrl: id =3D 0x990a5f, name =3D "H2=
64 P-Frame QP Value", val =3D 25
  [ 3447.149731] coda 2040000.vpu: 0: s_ctrl: id =3D 0x990a62, name =3D "H2=
64 Maximum QP Value", val =3D 51
  [ 3447.149737] coda 2040000.vpu: 0: s_ctrl: id =3D 0x990a68, name =3D "H2=
64 Loop Filter Alpha Offset", val =3D 0
  [ 3447.149743] coda 2040000.vpu: 0: s_ctrl: id =3D 0x990a69, name =3D "H2=
64 Loop Filter Beta Offset", val =3D 0
  [ 3447.149750] coda 2040000.vpu: 0: s_ctrl: id =3D 0x990a6a, name =3D "H2=
64 Loop Filter Mode", val =3D 0 ("Enabled")
  [ 3447.149756] coda 2040000.vpu: 0: s_ctrl: id =3D 0x990a7f, name =3D "H2=
64 Constrained Intra Pred", val =3D 0
  [ 3447.149761] coda 2040000.vpu: 0: s_ctrl: id =3D 0x990a80, name =3D "H2=
64 Chroma QP Index Offset", val =3D 0
  [ 3447.149768] coda 2040000.vpu: 0: s_ctrl: id =3D 0x990a6b, name =3D "H2=
64 Profile", val =3D 0 ("Baseline")
  [ 3447.149774] coda 2040000.vpu: 0: s_ctrl: id =3D 0x990a67, name =3D "H2=
64 Level", val =3D 11 ("4")
  [ 3447.149780] coda 2040000.vpu: 0: s_ctrl: id =3D 0x990a90, name =3D "MP=
EG4 I-Frame QP Value", val =3D 2
  [ 3447.149785] coda 2040000.vpu: 0: s_ctrl: id =3D 0x990a91, name =3D "MP=
EG4 P-Frame QP Value", val =3D 2
  [ 3447.149791] coda 2040000.vpu: 0: s_ctrl: id =3D 0x990a96, name =3D "MP=
EG4 Profile", val =3D 0 ("Simple")
  [ 3447.149797] coda 2040000.vpu: 0: s_ctrl: id =3D 0x990a95, name =3D "MP=
EG4 Level", val =3D 7 ("5")
  [ 3447.149804] coda 2040000.vpu: 0: s_ctrl: id =3D 0x9909dd, name =3D "Sl=
ice Partitioning Method", val =3D 0 ("Single")
  [ 3447.149809] coda 2040000.vpu: 0: s_ctrl: id =3D 0x9909dc, name =3D "Nu=
mber of MBs in a Slice", val =3D 1
  [ 3447.149815] coda 2040000.vpu: 0: s_ctrl: id =3D 0x9909db, name =3D "Ma=
ximum Bytes in a Slice", val =3D 500
  [ 3447.149821] coda 2040000.vpu: 0: s_ctrl: id =3D 0x9909d8, name =3D "Se=
quence Header Mode", val =3D 1 ("Joined With 1st Frame")
  [ 3447.149827] coda 2040000.vpu: 0: s_ctrl: id =3D 0x9909d6, name =3D "Nu=
mber of Intra Refresh MBs", val =3D 0
  [ 3447.149833] coda 2040000.vpu: 0: s_ctrl: id =3D 0x9909e1, name =3D "In=
itial Delay for VBV Control", val =3D 0
  [ 3447.149839] coda 2040000.vpu: 0: s_ctrl: id =3D 0x9909de, name =3D "VB=
V Buffer Size", val =3D 0
  [ 3447.155934] coda 2040000.vpu: 0: release instance (11a120f6)
  [ 3447.156186] coda 2040000.vpu: 0: open instance (11a120f6)
  [ 3447.156254] coda 2040000.vpu: 0: s_ctrl: id =3D 0x980914, name =3D "Ho=
rizontal Flip", val =3D 0
  [ 3447.156263] coda 2040000.vpu: 0: s_ctrl: id =3D 0x980915, name =3D "Ve=
rtical Flip", val =3D 0
  [ 3447.157910] coda 2040000.vpu: 0: release instance (11a120f6)
  [ 3447.309740] coda 2040000.vpu: 0: open instance (205d8a8f)
  [ 3447.309848] coda 2040000.vpu: 0: s_ctrl: id =3D 0x980914, name =3D "Ho=
rizontal Flip", val =3D 0
  [ 3447.309856] coda 2040000.vpu: 0: s_ctrl: id =3D 0x980915, name =3D "Ve=
rtical Flip", val =3D 0
  [ 3447.309863] coda 2040000.vpu: 0: s_ctrl: id =3D 0x9909cf, name =3D "Vi=
deo Bitrate", val =3D 0
  [ 3447.309870] coda 2040000.vpu: 0: s_ctrl: id =3D 0x9909cb, name =3D "Vi=
deo GOP Size", val =3D 16
  [ 3447.309876] coda 2040000.vpu: 0: s_ctrl: id =3D 0x990a5e, name =3D "H2=
64 I-Frame QP Value", val =3D 25
  [ 3447.309882] coda 2040000.vpu: 0: s_ctrl: id =3D 0x990a5f, name =3D "H2=
64 P-Frame QP Value", val =3D 25
  [ 3447.309887] coda 2040000.vpu: 0: s_ctrl: id =3D 0x990a62, name =3D "H2=
64 Maximum QP Value", val =3D 51
  [ 3447.309893] coda 2040000.vpu: 0: s_ctrl: id =3D 0x990a68, name =3D "H2=
64 Loop Filter Alpha Offset", val =3D 0
  [ 3447.309899] coda 2040000.vpu: 0: s_ctrl: id =3D 0x990a69, name =3D "H2=
64 Loop Filter Beta Offset", val =3D 0
  [ 3447.309906] coda 2040000.vpu: 0: s_ctrl: id =3D 0x990a6a, name =3D "H2=
64 Loop Filter Mode", val =3D 0 ("Enabled")
  [ 3447.309912] coda 2040000.vpu: 0: s_ctrl: id =3D 0x990a7f, name =3D "H2=
64 Constrained Intra Pred", val =3D 0
  [ 3447.309917] coda 2040000.vpu: 0: s_ctrl: id =3D 0x990a80, name =3D "H2=
64 Chroma QP Index Offset", val =3D 0
  [ 3447.309924] coda 2040000.vpu: 0: s_ctrl: id =3D 0x990a6b, name =3D "H2=
64 Profile", val =3D 0 ("Baseline")
  [ 3447.309930] coda 2040000.vpu: 0: s_ctrl: id =3D 0x990a67, name =3D "H2=
64 Level", val =3D 11 ("4")
  [ 3447.309936] coda 2040000.vpu: 0: s_ctrl: id =3D 0x990a90, name =3D "MP=
EG4 I-Frame QP Value", val =3D 2
  [ 3447.309941] coda 2040000.vpu: 0: s_ctrl: id =3D 0x990a91, name =3D "MP=
EG4 P-Frame QP Value", val =3D 2
  [ 3447.309947] coda 2040000.vpu: 0: s_ctrl: id =3D 0x990a96, name =3D "MP=
EG4 Profile", val =3D 0 ("Simple")
  [ 3447.309953] coda 2040000.vpu: 0: s_ctrl: id =3D 0x990a95, name =3D "MP=
EG4 Level", val =3D 7 ("5")
  [ 3447.309959] coda 2040000.vpu: 0: s_ctrl: id =3D 0x9909dd, name =3D "Sl=
ice Partitioning Method", val =3D 0 ("Single")
  [ 3447.309965] coda 2040000.vpu: 0: s_ctrl: id =3D 0x9909dc, name =3D "Nu=
mber of MBs in a Slice", val =3D 1
  [ 3447.309970] coda 2040000.vpu: 0: s_ctrl: id =3D 0x9909db, name =3D "Ma=
ximum Bytes in a Slice", val =3D 500
  [ 3447.309977] coda 2040000.vpu: 0: s_ctrl: id =3D 0x9909d8, name =3D "Se=
quence Header Mode", val =3D 1 ("Joined With 1st Frame")
  [ 3447.309983] coda 2040000.vpu: 0: s_ctrl: id =3D 0x9909d6, name =3D "Nu=
mber of Intra Refresh MBs", val =3D 0
  [ 3447.309989] coda 2040000.vpu: 0: s_ctrl: id =3D 0x9909e1, name =3D "In=
itial Delay for VBV Control", val =3D 0
  [ 3447.309994] coda 2040000.vpu: 0: s_ctrl: id =3D 0x9909de, name =3D "VB=
V Buffer Size", val =3D 0
  [ 3447.315188] coda 2040000.vpu: 0: release instance (205d8a8f)
  [ 3447.316311] coda 2040000.vpu: 0: open instance (11a120f6)
  [ 3447.316387] coda 2040000.vpu: 0: s_ctrl: id =3D 0x980914, name =3D "Ho=
rizontal Flip", val =3D 0
  [ 3447.316396] coda 2040000.vpu: 0: s_ctrl: id =3D 0x980915, name =3D "Ve=
rtical Flip", val =3D 0
  [ 3447.316917] coda 2040000.vpu: 0: release instance (11a120f6)
  [ 3447.329495] coda 2040000.vpu: 0: open instance (11a120f6)
  [ 3447.329565] coda 2040000.vpu: 0: s_ctrl: id =3D 0x980914, name =3D "Ho=
rizontal Flip", val =3D 0
  [ 3447.329573] coda 2040000.vpu: 0: s_ctrl: id =3D 0x980915, name =3D "Ve=
rtical Flip", val =3D 0
  [ 3447.330165] coda 2040000.vpu: 1: open instance (c8a897db)
  [ 3447.330252] coda 2040000.vpu: 1: s_ctrl: id =3D 0x980914, name =3D "Ho=
rizontal Flip", val =3D 0
  [ 3447.330260] coda 2040000.vpu: 1: s_ctrl: id =3D 0x980915, name =3D "Ve=
rtical Flip", val =3D 0
  [ 3447.330267] coda 2040000.vpu: 1: s_ctrl: id =3D 0x9909cf, name =3D "Vi=
deo Bitrate", val =3D 0
  [ 3447.330274] coda 2040000.vpu: 1: s_ctrl: id =3D 0x9909cb, name =3D "Vi=
deo GOP Size", val =3D 16
  [ 3447.330280] coda 2040000.vpu: 1: s_ctrl: id =3D 0x990a5e, name =3D "H2=
64 I-Frame QP Value", val =3D 25
  [ 3447.330286] coda 2040000.vpu: 1: s_ctrl: id =3D 0x990a5f, name =3D "H2=
64 P-Frame QP Value", val =3D 25
  [ 3447.330292] coda 2040000.vpu: 1: s_ctrl: id =3D 0x990a62, name =3D "H2=
64 Maximum QP Value", val =3D 51
  [ 3447.330298] coda 2040000.vpu: 1: s_ctrl: id =3D 0x990a68, name =3D "H2=
64 Loop Filter Alpha Offset", val =3D 0
  [ 3447.330303] coda 2040000.vpu: 1: s_ctrl: id =3D 0x990a69, name =3D "H2=
64 Loop Filter Beta Offset", val =3D 0
  [ 3447.330310] coda 2040000.vpu: 1: s_ctrl: id =3D 0x990a6a, name =3D "H2=
64 Loop Filter Mode", val =3D 0 ("Enabled")
  [ 3447.330316] coda 2040000.vpu: 1: s_ctrl: id =3D 0x990a7f, name =3D "H2=
64 Constrained Intra Pred", val =3D 0
  [ 3447.330322] coda 2040000.vpu: 1: s_ctrl: id =3D 0x990a80, name =3D "H2=
64 Chroma QP Index Offset", val =3D 0
  [ 3447.330328] coda 2040000.vpu: 1: s_ctrl: id =3D 0x990a6b, name =3D "H2=
64 Profile", val =3D 0 ("Baseline")
  [ 3447.330334] coda 2040000.vpu: 1: s_ctrl: id =3D 0x990a67, name =3D "H2=
64 Level", val =3D 11 ("4")
  [ 3447.330340] coda 2040000.vpu: 1: s_ctrl: id =3D 0x990a90, name =3D "MP=
EG4 I-Frame QP Value", val =3D 2
  [ 3447.330346] coda 2040000.vpu: 1: s_ctrl: id =3D 0x990a91, name =3D "MP=
EG4 P-Frame QP Value", val =3D 2
  [ 3447.330352] coda 2040000.vpu: 1: s_ctrl: id =3D 0x990a96, name =3D "MP=
EG4 Profile", val =3D 0 ("Simple")
  [ 3447.330358] coda 2040000.vpu: 1: s_ctrl: id =3D 0x990a95, name =3D "MP=
EG4 Level", val =3D 7 ("5")
  [ 3447.330364] coda 2040000.vpu: 1: s_ctrl: id =3D 0x9909dd, name =3D "Sl=
ice Partitioning Method", val =3D 0 ("Single")
  [ 3447.330370] coda 2040000.vpu: 1: s_ctrl: id =3D 0x9909dc, name =3D "Nu=
mber of MBs in a Slice", val =3D 1
  [ 3447.330375] coda 2040000.vpu: 1: s_ctrl: id =3D 0x9909db, name =3D "Ma=
ximum Bytes in a Slice", val =3D 500
  [ 3447.330382] coda 2040000.vpu: 1: s_ctrl: id =3D 0x9909d8, name =3D "Se=
quence Header Mode", val =3D 1 ("Joined With 1st Frame")
  [ 3447.330387] coda 2040000.vpu: 1: s_ctrl: id =3D 0x9909d6, name =3D "Nu=
mber of Intra Refresh MBs", val =3D 0
  [ 3447.330393] coda 2040000.vpu: 1: s_ctrl: id =3D 0x9909e1, name =3D "In=
itial Delay for VBV Control", val =3D 0
  [ 3447.330399] coda 2040000.vpu: 1: s_ctrl: id =3D 0x9909de, name =3D "VB=
V Buffer Size", val =3D 0
  [ 3447.338565] coda 2040000.vpu: 0: Setting vid-out format, wxh: 320x200,=
 fmt: MPG4 L
  [ 3447.338581] coda 2040000.vpu: 0: Setting vid-cap format, wxh: 320x200,=
 fmt: NV12 T
  [ 3447.340112] coda 2040000.vpu: 1: Setting vid-cap format, wxh: 320x200,=
 fmt: MPG4 L
  [ 3447.341558] coda 2040000.vpu: 1: Setting vid-out format, wxh: 320x200,=
 fmt: YU12 L
  [ 3447.343192] coda 2040000.vpu: 1: get 2 buffer(s) of size 96000 each.
  [ 3447.355307] coda 2040000.vpu: 1: get 4 buffer(s) of size 131072 each.
  [ 3447.359470] coda 2040000.vpu: 1: start streaming vid-cap
  [ 3447.360096] coda 2040000.vpu: 1: start streaming vid-out
  [ 3447.364167] coda 2040000.vpu: 1: start encoding 320x200 YU12->MPG4 @ 3=
0/1 Hz
  [ 3447.364649] coda 2040000.vpu: 1: job ready
  [ 3447.364683] coda 2040000.vpu: 1: parameter change: intra Qp 25
  [ 3447.364689] coda 2040000.vpu: 1: parameter change: bitrate 0 kbit/s
  [ 3447.364694] coda 2040000.vpu: 1: parameter change: frame rate 30/1 Hz
  [ 3447.364699] coda 2040000.vpu: 1: parameter change: intra refresh MBs 0
  [ 3447.366167] coda 2040000.vpu: 1: frame size =3D 8970
  [ 3447.366185] coda 2040000.vpu: 1: job finished: encoded I frame (0)
  [ 3447.367206] coda 2040000.vpu: 0: get 2 buffer(s) of size 131072 each.
  [ 3447.370479] coda 2040000.vpu: 1: job ready
  [ 3447.370833] coda 2040000.vpu: 0: start streaming vid-out
  [ 3447.371921] coda 2040000.vpu: 1: frame size =3D 6048
  [ 3447.371934] coda 2040000.vpu: 1: job finished: encoded P frame (1)
  [ 3447.371954] coda 2040000.vpu: 0: Video Data Order Adapter: Disabled
  [ 3447.372105] coda 2040000.vpu: CODA_COMMAND_SEQ_INIT failed, error code=
 =3D 0x4
  [ 3447.380404] coda 2040000.vpu: 1: job ready
  [ 3447.381651] coda 2040000.vpu: 0: Setting vid-cap format, wxh: 320x200,=
 fmt: NV12 T
  [ 3447.383805] coda 2040000.vpu: 0: get 3 buffer(s) of size 96000 each.
  [ 3447.384828] coda 2040000.vpu: 1: frame size =3D 5957
  [ 3447.384853] coda 2040000.vpu: 1: job finished: encoded P frame (2)
  [ 3447.387027] coda 2040000.vpu: 1: job ready
  [ 3447.388486] coda 2040000.vpu: 0: start streaming vid-cap
  [ 3447.388493] coda 2040000.vpu: 1: frame size =3D 6027
  [ 3447.388507] coda 2040000.vpu: 1: job finished: encoded P frame (3)
  [ 3447.389010] coda 2040000.vpu: 0: not ready: need 2 buffers available (=
queue:1 + bitstream:0)
  [ 3447.389839] coda 2040000.vpu: 0: job ready
  [ 3447.391311] coda 2040000.vpu: 1: job ready
  [ 3447.400762] coda 2040000.vpu: errors in 254 macroblocks
  [ 3447.405999] coda 2040000.vpu: decoded frame index out of range: 0
  [ 3447.412254] coda 2040000.vpu: 0: job finished: no frame decoded (0) or=
 returned (-1)
  [ 3447.412269] coda 2040000.vpu: 0: job ready
  [ 3447.413677] coda 2040000.vpu: 1: frame size =3D 6016
  [ 3447.416004] coda 2040000.vpu: 1: job finished: encoded P frame (4)
  [ 3447.416015] coda 2040000.vpu: 1: job ready
  [ 3448.486249] coda 2040000.vpu: CODA PIC_RUN timeout
  [ 3448.491089] coda 2040000.vpu: 0: not ready: on hold for more buffers.
  [ 3448.492545] coda 2040000.vpu: 1: frame size =3D 6143
  [ 3448.496929] coda 2040000.vpu: 0: job ready
  [ 3448.497205] coda 2040000.vpu: 1: job finished: encoded ? frame (0)
  [ 3448.497225] coda 2040000.vpu: 1: job ready
  [ 3449.526215] coda 2040000.vpu: CODA PIC_RUN timeout
  [ 3449.531052] coda 2040000.vpu: 0: not ready: on hold for more buffers.
  [ 3449.532503] coda 2040000.vpu: 1: frame size =3D 5996
  [ 3449.533163] coda 2040000.vpu: 0: job ready
  [ 3449.533391] coda 2040000.vpu: 1: job finished: encoded ? frame (0)
  [ 3449.533408] coda 2040000.vpu: 1: job ready
  [ 3450.566215] coda 2040000.vpu: CODA PIC_RUN timeout
  [ 3450.571062] coda 2040000.vpu: 0: not ready: on hold for more buffers.
  [ 3450.572531] coda 2040000.vpu: 1: frame size =3D 6141
  [ 3450.573251] coda 2040000.vpu: 0: job ready
  [ 3450.573488] coda 2040000.vpu: 1: job finished: encoded ? frame (0)
  [ 3450.573504] coda 2040000.vpu: 1: job ready
  [ 3451.606228] coda 2040000.vpu: CODA PIC_RUN timeout
  [ 3451.611071] coda 2040000.vpu: 0: not ready: on hold for more buffers.
  [ 3451.612525] coda 2040000.vpu: 1: frame size =3D 6039
  [ 3451.613005] coda 2040000.vpu: 1: job finished: encoded P frame (8)
  [ 3451.613027] coda 2040000.vpu: 1: job ready
  [ 3451.613354] coda 2040000.vpu: 0: job ready
  [ 3451.615012] coda 2040000.vpu: 1: frame size =3D 6137
  [ 3451.615779] coda 2040000.vpu: 1: job finished: encoded ? frame (0)
  [ 3451.617103] coda 2040000.vpu: 0: marking last meta
  [ 3451.617117] coda 2040000.vpu: 0: all remaining buffers queued
  [ 3452.646240] coda 2040000.vpu: CODA PIC_RUN timeout
  [ 3452.651332] coda 2040000.vpu: 0: not ready: on hold for more buffers.
  [ 3452.659515] coda 2040000.vpu: 0: stop streaming vid-out
  [ 3452.659623] coda 2040000.vpu: 0: coda_seq_end_work: sent command 'SEQ_=
END' to coda
  [ 3452.660617] coda 2040000.vpu: 0: stop streaming vid-cap
  [ 3452.661567] coda 2040000.vpu: 1: stop streaming vid-out
  [ 3452.661642] coda 2040000.vpu: 1: coda_seq_end_work: sent command 'SEQ_=
END' to coda
  [ 3452.662671] coda 2040000.vpu: 1: stop streaming vid-cap
  [ 3452.665111] coda 2040000.vpu: 0: release instance (11a120f6)
  [ 3452.665563] coda 2040000.vpu: 1: release instance (c8a897db)

