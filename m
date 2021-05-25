Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E86D738FBD0
	for <lists+linux-media@lfdr.de>; Tue, 25 May 2021 09:33:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231629AbhEYHfD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 May 2021 03:35:03 -0400
Received: from comms.puri.sm ([159.203.221.185]:47054 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230005AbhEYHfC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 May 2021 03:35:02 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 9F1BEDFA0E;
        Tue, 25 May 2021 00:33:02 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id PRcilnll0Cu9; Tue, 25 May 2021 00:33:00 -0700 (PDT)
Message-ID: <d5091b38da0216c581f9bcc13a1704ff09f6b310.camel@puri.sm>
Subject: Re: [PATCH 00/23] media: imx: imx7-mipi-csis: Add i.MX8MM support /
 imx8mq support
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     devicetree@vger.kernel.org, festevam@gmail.com,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, marex@denx.de, p.zabel@pengutronix.de,
        rmfrfs@gmail.com, robh@kernel.org, slongerbeam@gmail.com
Date:   Tue, 25 May 2021 09:32:54 +0200
In-Reply-To: <YKe3aQHr+BsJ3ueY@pendragon.ideasonboard.com>
References: <YKBRXesDsXk9K15J@pendragon.ideasonboard.com>
         <1da3de6c879474b814f4d820ca5eb5ba07174a26.camel@puri.sm>
         <YKRmhSn65fiqshsp@pendragon.ideasonboard.com>
         <7f922c8b3d4396c00ba15ad99dd572699f4b69b1.camel@puri.sm>
         <YKUy8gu3Jc3VDy5i@pendragon.ideasonboard.com>
         <f1d44bbd85edf547bc2b7c758b5e822e08cc80d0.camel@puri.sm>
         <YKZX8z1Vb0PAYk+G@pendragon.ideasonboard.com>
         <eff48d63017dc4ed1111b7d87a731d587f51885d.camel@puri.sm>
         <YKeAuGJbr9CorhZR@pendragon.ideasonboard.com>
         <bd5dc783e39d750693ac2b49050681c5e3088330.camel@puri.sm>
         <YKe3aQHr+BsJ3ueY@pendragon.ideasonboard.com>
Content-Type: multipart/mixed; boundary="=-YRESJibxgvGpEPGuPuzK"
User-Agent: Evolution 3.38.3-1 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-YRESJibxgvGpEPGuPuzK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Am Freitag, dem 21.05.2021 um 16:36 +0300 schrieb Laurent Pinchart:
> Hi Martin,
> 
> On Fri, May 21, 2021 at 01:02:30PM +0200, Martin Kepplinger wrote:
> > Am Freitag, dem 21.05.2021 um 12:43 +0300 schrieb Laurent Pinchart:
> > > On Fri, May 21, 2021 at 11:25:20AM +0200, Martin Kepplinger
> > > wrote:
> > > > Am Donnerstag, dem 20.05.2021 um 15:37 +0300 schrieb Laurent
> > > > Pinchart:
> > > > > On Thu, May 20, 2021 at 12:54:27PM +0200, Martin Kepplinger
> > > > > wrote:
> > > > > > Am Mittwoch, dem 19.05.2021 um 18:46 +0300 schrieb Laurent
> > > > > > Pinchart:
> > > > > > > On Wed, May 19, 2021 at 05:21:11PM +0200, Martin
> > > > > > > Kepplinger wrote:
> > > > > > > > Am Mittwoch, dem 19.05.2021 um 04:14 +0300 schrieb
> > > > > > > > Laurent Pinchart:
> > > > > > > > > On Tue, May 18, 2021 at 04:39:00PM +0200, Martin
> > > > > > > > > Kepplinger wrote:
> > > > > > > > > > Am Sonntag, dem 16.05.2021 um 01:55 +0300 schrieb
> > > > > > > > > > Laurent Pinchart:
> > > > > > > > > > > On Tue, May 04, 2021 at 05:59:39PM +0200, Martin
> > > > > > > > > > > Kepplinger wrote:
> > > > > 
> > > > > [snip]
> > > > > 
> > > > > > I fixed mipi -> csi link. I had the DT port descriptions
> > > > > > for
> > > > > > mipi csi wrong.
> > > > > 
> > > > > \o/
> > > > > 
> > > > > > now, just because I think it makes sense, I do:
> > > > > > 
> > > > > > media-ctl --set-v4l2 "'csi':0 [fmt:SGBRG10/640x480
> > > > > > colorspace:raw]"
> > > > > > 
> > > > > > which now prints:
> > > > > > 
> > > > > > Device topology
> > > > > > - entity 1: csi (2 pads, 2 links)
> > > > > >             type V4L2 subdev subtype Unknown flags 0
> > > > > >             device node name /dev/v4l-subdev0
> > > > > >         pad0: Sink
> > > > > >                 [fmt:SGBRG10_1X10/640x480 field:none
> > > > > > colorspace:raw xfer:none ycbcr:601 quantization:full-range]
> > > > > >                 <- "imx8mq-mipi-csis.0":1
> > > > > > [ENABLED,IMMUTABLE]
> > > > > >         pad1: Source
> > > > > >                 [fmt:SGBRG10_1X10/640x480 field:none
> > > > > > colorspace:raw xfer:none ycbcr:601 quantization:full-range]
> > > > > >                 -> "csi capture":0 [ENABLED,IMMUTABLE]
> > > > > > 
> > > > > > - entity 4: csi capture (1 pad, 1 link)
> > > > > >             type Node subtype V4L flags 0
> > > > > >             device node name /dev/video1
> > > > > >         pad0: Sink
> > > > > >                 <- "csi":1 [ENABLED,IMMUTABLE]
> > > > > > 
> > > > > > - entity 10: imx8mq-mipi-csis.0 (2 pads, 2 links)
> > > > > >              type V4L2 subdev subtype Unknown flags 0
> > > > > >              device node name /dev/v4l-subdev1
> > > > > >         pad0: Sink
> > > > > >                 <- "hi846 2-0020":0 []
> > > > > >         pad1: Source
> > > > > >                 -> "csi":0 [ENABLED,IMMUTABLE]
> > > > > 
> > > > > This subdev doesn't seem to report formats on its sink and
> > > > > source pads,
> > > > > which is weird. I've had a quick look at the .get_fmt() and
> > > > > .set_fmt()
> > > > > implementations in the code you've posted, and they're wrong.
> > > > > They
> > > > > shouldn't pass the calls to the source subdev with
> > > > > v4l2_subdev_call(),
> > > > > they should instead implement get and set format on this
> > > > > subdev. You can
> > > > > look at the imx7-mipi-csis driver to see how that's done.
> > > > > Once you'll
> > > > > have fixed this, you'll have to set the format on each pad
> > > > > with
> > > > > media-ctl to make sure formats through the pipeline match.
> > > > > 
> > > > > The only location where you imx8mq-mipi-csis driver should
> > > > > use
> > > > > v4l2_subdev_call() is in .s_stream(), to propagate the
> > > > > operation to the
> > > > > source.
> > > > > 
> > > > > By the way, I'd replace every occurence of "csis" with "csi2"
> > > > > in your
> > > > > driver. The name "csis" in the i.MX7 driver comes from the
> > > > > CSI-2 RX IP
> > > > > core that is named CSIS. That's not the case on the i.MX8QM.
> > > > > 
> > > > > > - entity 15: hi846 2-0020 (1 pad, 1 link)
> > > > > >              type V4L2 subdev subtype Sensor flags 0
> > > > > >              device node name /dev/v4l-subdev2
> > > > > >         pad0: Source
> > > > > >                 [fmt:SGBRG10_1X10/640x480 field:none
> > > > > > colorspace:raw]
> > > > > >                 -> "imx8mq-mipi-csis.0":0 []
> > > > > 
> > > > > You need to enable this link, the following should do
> > > > > 
> > > > > media-ctl -l "'hi846 2-0020':0 -> 'imx8mq-mipi-csis.0':0 [1]"
> > > > 
> > > > ok makes sense, even though I basically just allow a set of
> > > > formats
> > > > without yet having to configure anything format-specific (I can
> > > > at
> > > > least use bits-per-pixel later, so it makes sense to have
> > > > them).
> > > > nevermind. I again append the current driver I use here.
> > > > 
> > > > then I do:
> > > > 
> > > > media-ctl --set-v4l2 "'csi':0 [fmt:SGBRG10/640x480
> > > > colorspace:raw]"
> > > > media-ctl --set-v4l2 "'imx8mq-mipi-csi2.0':0
> > > > [fmt:SGBRG10/640x480
> > > > colorspace:raw]"
> > > > media-ctl -l "'hi846 2-0020':0 -> 'imx8mq-mipi-csi2.0':0 [1]"
> > > > 
> > > > which gets me:
> > > > 
> > > > Device topology
> > > > - entity 1: csi (2 pads, 2 links)
> > > >             type V4L2 subdev subtype Unknown flags 0
> > > >             device node name /dev/v4l-subdev0
> > > >         pad0: Sink
> > > >                 [fmt:SGBRG10_1X10/640x480 field:none
> > > > colorspace:raw xfer:none ycbcr:601 quantization:full-range]
> > > >                 <- "imx8mq-mipi-csi2.0":1 [ENABLED,IMMUTABLE]
> > > >         pad1: Source
> > > >                 [fmt:SGBRG10_1X10/640x480 field:none
> > > > colorspace:raw xfer:none ycbcr:601 quantization:full-range]
> > > >                 -> "csi capture":0 [ENABLED,IMMUTABLE]
> > > > 
> > > > - entity 4: csi capture (1 pad, 1 link)
> > > >             type Node subtype V4L flags 0
> > > >             device node name /dev/video0
> > > >         pad0: Sink
> > > >                 <- "csi":1 [ENABLED,IMMUTABLE]
> > > > 
> > > > - entity 10: imx8mq-mipi-csi2.0 (2 pads, 2 links)
> > > >              type V4L2 subdev subtype Unknown flags 0
> > > >              device node name /dev/v4l-subdev1
> > > >         pad0: Sink
> > > >                 [fmt:SGBRG10_1X10/640x480]
> > > >                 <- "hi846 2-0020":0 [ENABLED]
> > > >         pad1: Source
> > > >                 [fmt:SGBRG10_1X10/640x480]
> > > >                 -> "csi":0 [ENABLED,IMMUTABLE]
> > > > 
> > > > - entity 15: hi846 2-0020 (1 pad, 1 link)
> > > >              type V4L2 subdev subtype Sensor flags 0
> > > >              device node name /dev/v4l-subdev2
> > > >         pad0: Source
> > > >                 [fmt:SGBRG10_1X10/640x480 field:none
> > > > colorspace:raw]
> > > >                 -> "imx8mq-mipi-csi2.0":0 [ENABLED]
> > > 
> > > This looks better.
> > > 
> > > > but streaming still fails with:
> > > > 
> > > > [  352.255129] imx7-csi 30a90000.csi1_bridge: media bus code
> > > > not
> > > > compatible with the pixel format set on the video node: 1 != 0
> > > 
> > > What is the capture command line ? Can you trace this (I assume
> > > the
> > > message is printed by capture_validate_fmt(), it's not present in
> > > mainline so I don't know what 1 and 0 correspond to, even though
> > > I
> > > suspect they would be IPUV3_COLORSPACE_* values) to see why it
> > > fails
> > > ?
> > 
> > capture command:
> > 
> > v4l2-ctl -d "/dev/v4l/by-path/platform-30a90000.csi1_bridge-video-
> > index0" --set-fmt-video=width=640,height=480 --stream-mmap --
> > stream-
> > to=test.raw --stream-count=1
> > 
> > I'll have to continue after the weekend, but let's share some logs.
> > Yes, "1 != 0" is from capture_validate_fmt():
> > 
> > priv->vdev.cc->cs != cc->cs
> > 
> > When I print the format the imx_media_find_mbus_format() finds and
> > do:
> > 
> > media-ctl --set-v4l2 "'csi':0 [fmt:SGBRG10/640x480 colorspace:raw]"
> > 
> > I see:
> > 
> > [  184.251144] mc: media_release: Media Release
> > [  184.254397] selected specific mbus code 0 for list nr 0 (fourcc
> > 0x59565955)
> > [  184.264564] selected specific mbus code 0 for list nr 0 (fourcc
> > 0x59565955)
> > [  184.274763] selected specific mbus code 0 for list nr 21 (fourcc
> > 0x36314247)
> > [  184.285102] selected specific mbus code 0 for list nr 21 (fourcc
> > 0x36314247)
> > [  184.295383] selected specific mbus code 0 for list nr 21 (fourcc
> > 0x36314247)
> > [  184.305752] selected specific mbus code 0 for list nr 21 (fourcc
> > 0x36314247)
> > 
> > 21 is the correct bayer format I want, but there's 0, so
> > "MEDIA_BUS_FMT_UYVY8_2X8" found the first 2 times. That is
> > IPUV3_COLORSPACE_YUV (1) while the correct Bayer format 21 is
> > IPUV3_COLORSPACE_RGB (0).
> > 
> > so some format settings not yet correct.
> 
> You need to specify the capture pixel format to v4l2-ctl. The driver
> defaults to YUYV (I think) otherwise. The CSI bridge will pad data
> with
> 0's on the right, so you need SGBRG16 (if I recall correctly, try
> SGRBG10 if it doesn't work).
> 

right, now with:

v4l2-ctl -d "/dev/v4l/by-path/platform-30a90000.csi1_bridge-video-
index0" --set-fmt-video=width=640,height=480,pixelformat='GB16' --
stream-mmap --stream-to=test.raw --stream-count=1

indeed the colorspace mismatch is gone.

__media_pipeline_start returns broken pipe because of:
link validation failed for 'hi846 2-0020':0 -> 'imx8mq-mipi-csi2.0':0,
error -32:

imx7-csi 30a90000.csi1_bridge: walk: returning entity 'hi846 2-0020'  
imx7-csi 30a90000.csi1_bridge: walk: returning entity 'imx8mq-mipi-
csi2.0'      
hi846 2-0020: hi846: starting hi846_get_format                        
hi846 2-0020: Get format w=640 h=480 code=0x300e colorspace=0xb       
imx7-csi 30a90000.csi1_bridge: v4l2_subdev_link_validate_default: field
does not match (source 1, sink 0)
imx7-csi 30a90000.csi1_bridge: v4l2_subdev_link_validate_default: link
was "hi846 2-0020":0 -> "imx8mq-mipi-csi2.0":0
imx7-csi 30a90000.csi1_bridge: link validation failed for 'hi846 2-
0020':0 -> 'imx8mq-mipi-csi2.0':0, error -32
...
imx7-csi 30a90000.csi1_bridge: pipeline start failed with -32


then I added the init_cfg() callback (that sets sink field to NONE) and
I could stream frames. So the v4l2/mc side of things looks ok, despite
the one thing:

Also, now when saying "--list-formats-ext" on the video node, it lists
all formats that the mipi driver supports (since it doesn't ask the
sensor anymore about that). That seems to be wrong.

Also, the frames are all black, so I'll need to debug the driver side
of things.

But I again append the current driver in case you want to have a look.

thanks so much for walking through this with me :) I won't forget the
dt properties and upstreaming - after I get correct frames.

                          martin

--=-YRESJibxgvGpEPGuPuzK
Content-Disposition: attachment; filename="imx8mq-mipi-csi2.c"
Content-Transfer-Encoding: base64
Content-Type: text/x-csrc; name="imx8mq-mipi-csi2.c"; charset="UTF-8"

Ly8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKLyoKICogRnJlZXNjYWxlIGkuTVg4
TVEgU29DIHNlcmllcyBNSVBJLUNTSSByZWNlaXZlciBkcml2ZXIKICoKICogQ29weXJpZ2h0IChD
KSAyMDIxIFB1cmlzbSBTUEMKICogQ29weXJpZ2h0IChDKSAyMDE5IExpbmFybyBMdGQKICogQ29w
eXJpZ2h0IChDKSAyMDE1LTIwMTYgRnJlZXNjYWxlIFNlbWljb25kdWN0b3IsIEluYy4gQWxsIFJp
Z2h0cyBSZXNlcnZlZC4KICogQ29weXJpZ2h0IChDKSAyMDExIC0gMjAxMyBTYW1zdW5nIEVsZWN0
cm9uaWNzIENvLiwgTHRkLgogKgogKi8KCiNpbmNsdWRlIDxsaW51eC9jbGsuaD4KI2luY2x1ZGUg
PGxpbnV4L2RlbGF5Lmg+CiNpbmNsdWRlIDxsaW51eC9lcnJuby5oPgojaW5jbHVkZSA8bGludXgv
aW50ZXJydXB0Lmg+CiNpbmNsdWRlIDxsaW51eC9pby5oPgojaW5jbHVkZSA8bGludXgva2VybmVs
Lmg+CiNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KI2luY2x1ZGUgPGxpbnV4L211dGV4Lmg+CiNp
bmNsdWRlIDxsaW51eC9vZi5oPgojaW5jbHVkZSA8bGludXgvb2ZfZGV2aWNlLmg+CiNpbmNsdWRl
IDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KI2luY2x1ZGUgPGxpbnV4L3BtX3J1bnRpbWUuaD4K
I2luY2x1ZGUgPGxpbnV4L3JlZ21hcC5oPgojaW5jbHVkZSA8bGludXgvbWZkL3N5c2Nvbi5oPgoj
aW5jbHVkZSA8bGludXgvcmVndWxhdG9yL2NvbnN1bWVyLmg+CiNpbmNsdWRlIDxsaW51eC9yZXNl
dC5oPgojaW5jbHVkZSA8bGludXgvc3BpbmxvY2suaD4KCiNpbmNsdWRlIDxtZWRpYS92NGwyLWNv
bW1vbi5oPgojaW5jbHVkZSA8bWVkaWEvdjRsMi1kZXZpY2UuaD4KI2luY2x1ZGUgPG1lZGlhL3Y0
bDItZndub2RlLmg+CiNpbmNsdWRlIDxtZWRpYS92NGwyLW1jLmg+CiNpbmNsdWRlIDxtZWRpYS92
NGwyLXN1YmRldi5oPgoKI2RlZmluZSBDU0lTX0RSSVZFUl9OQU1FCQkJImlteDhtcS1taXBpLWNz
aTIiCiNkZWZpbmUgQ1NJU19TVUJERVZfTkFNRQkJCUNTSVNfRFJJVkVSX05BTUUKCiNkZWZpbmUg
Q1NJU19QQURfU0lOSwkJCQkwCiNkZWZpbmUgQ1NJU19QQURfU09VUkNFCQkJCTEKI2RlZmluZSBD
U0lTX1BBRFNfTlVNCQkJCTIKCiNkZWZpbmUgTUlQSV9DU0lTX0RFRl9QSVhfV0lEVEgJCQk2NDAK
I2RlZmluZSBNSVBJX0NTSVNfREVGX1BJWF9IRUlHSFQJCTQ4MAoKLyogUmVnaXN0ZXIgbWFwIGRl
ZmluaXRpb24gKi8KCi8qIGkuTVg4TVEgQ1NJLTIgY29udHJvbGxlciBDU1IgKi8KLyogVE9ETyAw
eDEwMCwgdG8gZHRzPyAqLwojZGVmaW5lIENTSTJSWF9DRkdfTlVNX0xBTkVTCQkJMHgxMDAKI2Rl
ZmluZSBDU0kyUlhfQ0ZHX0RJU0FCTEVfREFUQV9MQU5FUwkJMHgxMDQKI2RlZmluZSBDU0kyUlhf
QklUX0VSUgkJCQkweDEwOAojZGVmaW5lIENTSTJSWF9JUlFfU1RBVFVTCQkJMHgxMEMKI2RlZmlu
ZSBDU0kyUlhfSVJRX01BU0sJCQkJMHgxMTAKI2RlZmluZSBDU0kyUlhfVUxQU19TVEFUVVMJCQkw
eDExNAojZGVmaW5lIENTSTJSWF9QUElfRVJSU09UX0hTCQkJMHgxMTgKI2RlZmluZSBDU0kyUlhf
UFBJX0VSUlNPVFNZTkNfSFMJCTB4MTFDCiNkZWZpbmUgQ1NJMlJYX1BQSV9FUlJFU0MJIAkJMHgx
MjAKI2RlZmluZSBDU0kyUlhfUFBJX0VSUlNZTkNFU0MJCQkweDEyNAojZGVmaW5lIENTSTJSWF9Q
UElfRVJSQ09OVFJPTAkJCTB4MTI4CiNkZWZpbmUgQ1NJMlJYX0NGR19ESVNBQkxFX1BBWUxPQURf
MAkJMHgxMkMKI2RlZmluZSBDU0kyUlhfQ0ZHX0RJU0FCTEVfUEFZTE9BRF8xCQkweDEzMAoKZW51
bSB7CglTVF9QT1dFUkVECT0gMSwKCVNUX1NUUkVBTUlORwk9IDIsCglTVF9TVVNQRU5ERUQJPSA0
LAp9OwoKc3RhdGljIGNvbnN0IGNoYXIgKiBjb25zdCBtaXBpX2NzaXNfY2xrX2lkW10gPSB7Cgki
Y2xrX2NvcmUiLAoJImNsa19lc2MiLAoJImNsa19weGwiLAoJImNsa19jbGtvMiIsCn07CgpzdHJ1
Y3QgY3Npc19pbXg4bXFfaHdfcmVzZXQgewoJc3RydWN0IHJlZ21hcCAqc3JjOwoJdTggcmVxX3Ny
YzsKCXU4IHJzdF92YWw7Cn07CgpzdHJ1Y3QgY3Npc19pbXg4bXFfcGh5X2dwciB7CglzdHJ1Y3Qg
cmVnbWFwICpncHI7Cgl1OCByZXFfc3JjOwp9OwoKI2RlZmluZQlHUFJfQ1NJMl8xX1JYX0VOQUJM
RQkJQklUKDEzKQojZGVmaW5lCUdQUl9DU0kyXzFfVklEX0lOVEZDX0VOQglCSVQoMTIpCiNkZWZp
bmUJR1BSX0NTSTJfMV9IU0VMCQkJQklUKDEwKQojZGVmaW5lCUdQUl9DU0kyXzFfQ09OVF9DTEtf
TU9ERSAJQklUKDgpCiNkZWZpbmUJR1BSX0NTSTJfMV9TX1BSR19SWEhTX1NFVFRMRSh4KQkoKCh4
KSAmIDB4M0YpIDw8IDIpCi8qCiAqIHJ4aHNfc2V0dGxlWzBdIC4uLiA8NzIweDQ4MAogKiByeGhz
X3NldHRsZVsxXSAuLi4gPjcyMCo0ODAKICoKICogaHR0cHM6Ly9jb21tdW5pdHkubnhwLmNvbS90
NS9pLU1YLVByb2Nlc3NvcnMvRXhwbGVuYXRpb24tZm9yLUhTLVNFVFRMRS1wYXJhbWV0ZXItaW4t
TUlQSS1DU0ktRC1QSFktcmVnaXN0ZXJzL20tcC83NjQyNzUvaGlnaGxpZ2h0L3RydWUjTTExODc0
NAogKi8Kc3RhdGljIHU4IHJ4aHNfc2V0dGxlWzJdID0geyAweDE0LCAweDkgfTsKCnN0cnVjdCBj
c2lfc3RhdGUgewoJc3RydWN0IGRldmljZSAqZGV2OwoJdm9pZCBfX2lvbWVtICpyZWdzOwoJc3Ry
dWN0IGNsa19idWxrX2RhdGEgKmNsa3M7CglzdHJ1Y3QgcmVzZXRfY29udHJvbCAqbXJzdDsKCXN0
cnVjdCByZWd1bGF0b3IgKm1pcGlfcGh5X3JlZ3VsYXRvcjsKCXU4IGluZGV4OwoKCXN0cnVjdCB2
NGwyX3N1YmRldiBzZDsKCXN0cnVjdCBtZWRpYV9wYWQgcGFkc1tDU0lTX1BBRFNfTlVNXTsKCXN0
cnVjdCB2NGwyX2FzeW5jX25vdGlmaWVyIG5vdGlmaWVyOwoJc3RydWN0IHY0bDJfc3ViZGV2ICpz
cmNfc2Q7CgoJc3RydWN0IHY0bDJfZndub2RlX2J1c19taXBpX2NzaTIgYnVzOwoJdTMyIGhzX3Nl
dHRsZTsKCXUzMiBjbGtfc2V0dGxlOwoKCXN0cnVjdCBtdXRleCBsb2NrOwkvKiBQcm90ZWN0IGNz
aXNfZm10LCBmb3JtYXRfbWJ1cyBhbmQgc3RhdGUgKi8KCWNvbnN0IHN0cnVjdCBjc2lzX3BpeF9m
b3JtYXQgKmNzaXNfZm10OwoJc3RydWN0IHY0bDJfbWJ1c19mcmFtZWZtdCBmb3JtYXRfbWJ1czsK
CXUzMiBzdGF0ZTsKCglzdHJ1Y3QgY3Npc19pbXg4bXFfaHdfcmVzZXQgaHdfcmVzZXQ7CglzdHJ1
Y3QgY3Npc19pbXg4bXFfcGh5X2dwciBwaHlfZ3ByOwoJdTMyIHNlbmRfbGV2ZWw7Cn07CgovKiAt
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQogKiBGb3JtYXQgaGVscGVycwogKi8KCnN0cnVjdCBjc2lzX3Bp
eF9mb3JtYXQgewoJdTMyIGNvZGU7Cgl1OCB3aWR0aDsKfTsKCnN0YXRpYyBjb25zdCBzdHJ1Y3Qg
Y3Npc19waXhfZm9ybWF0IG1pcGlfY3Npc19mb3JtYXRzW10gPSB7CgkvKiBSQVcgKEJheWVyIGFu
ZCBncmV5c2NhbGUpIGZvcm1hdHMuICovCgl7CgkJLmNvZGUgPSBNRURJQV9CVVNfRk1UX1NCR0dS
OF8xWDgsCgkJLndpZHRoID0gOCwKCX0sIHsKCQkuY29kZSA9IE1FRElBX0JVU19GTVRfU0dCUkc4
XzFYOCwKCQkud2lkdGggPSA4LAoJfSwgewoJCS5jb2RlID0gTUVESUFfQlVTX0ZNVF9TR1JCRzhf
MVg4LAoJCS53aWR0aCA9IDgsCgl9LCB7CgkJLmNvZGUgPSBNRURJQV9CVVNfRk1UX1NSR0dCOF8x
WDgsCgkJLndpZHRoID0gOCwKCX0sIHsKCQkuY29kZSA9IE1FRElBX0JVU19GTVRfWThfMVg4LAoJ
CS53aWR0aCA9IDgsCgl9LCB7CgkJLmNvZGUgPSBNRURJQV9CVVNfRk1UX1NCR0dSMTBfMVgxMCwK
CQkud2lkdGggPSAxMCwKCX0sIHsKCQkuY29kZSA9IE1FRElBX0JVU19GTVRfU0dCUkcxMF8xWDEw
LAoJCS53aWR0aCA9IDEwLAoJfSwgewoJCS5jb2RlID0gTUVESUFfQlVTX0ZNVF9TR1JCRzEwXzFY
MTAsCgkJLndpZHRoID0gMTAsCgl9LCB7CgkJLmNvZGUgPSBNRURJQV9CVVNfRk1UX1NSR0dCMTBf
MVgxMCwKCQkud2lkdGggPSAxMCwKCX0sIHsKCQkuY29kZSA9IE1FRElBX0JVU19GTVRfWTEwXzFY
MTAsCgkJLndpZHRoID0gMTAsCgl9LCB7CgkJLmNvZGUgPSBNRURJQV9CVVNfRk1UX1NCR0dSMTJf
MVgxMiwKCQkud2lkdGggPSAxMiwKCX0sIHsKCQkuY29kZSA9IE1FRElBX0JVU19GTVRfU0dCUkcx
Ml8xWDEyLAoJCS53aWR0aCA9IDEyLAoJfSwgewoJCS5jb2RlID0gTUVESUFfQlVTX0ZNVF9TR1JC
RzEyXzFYMTIsCgkJLndpZHRoID0gMTIsCgl9LCB7CgkJLmNvZGUgPSBNRURJQV9CVVNfRk1UX1NS
R0dCMTJfMVgxMiwKCQkud2lkdGggPSAxMiwKCX0sIHsKCQkuY29kZSA9IE1FRElBX0JVU19GTVRf
WTEyXzFYMTIsCgkJLndpZHRoID0gMTIsCgl9LCB7CgkJLmNvZGUgPSBNRURJQV9CVVNfRk1UX1NC
R0dSMTRfMVgxNCwKCQkud2lkdGggPSAxNCwKCX0sIHsKCQkuY29kZSA9IE1FRElBX0JVU19GTVRf
U0dCUkcxNF8xWDE0LAoJCS53aWR0aCA9IDE0LAoJfSwgewoJCS5jb2RlID0gTUVESUFfQlVTX0ZN
VF9TR1JCRzE0XzFYMTQsCgkJLndpZHRoID0gMTQsCgl9LCB7CgkJLmNvZGUgPSBNRURJQV9CVVNf
Rk1UX1NSR0dCMTRfMVgxNCwKCQkud2lkdGggPSAxNCwKCX0KfTsKCnN0YXRpYyBjb25zdCBzdHJ1
Y3QgY3Npc19waXhfZm9ybWF0ICpmaW5kX2NzaXNfZm9ybWF0KHUzMiBjb2RlKQp7Cgl1bnNpZ25l
ZCBpbnQgaTsKCglmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShtaXBpX2NzaXNfZm9ybWF0cyk7
IGkrKykKCQlpZiAoY29kZSA9PSBtaXBpX2NzaXNfZm9ybWF0c1tpXS5jb2RlKQoJCQlyZXR1cm4g
Jm1pcGlfY3Npc19mb3JtYXRzW2ldOwoJcmV0dXJuIE5VTEw7Cn0KCi8qIC0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCiAqIEhhcmR3YXJlIGNvbmZpZ3VyYXRpb24KICovCgpzdGF0aWMgaW5saW5lIHUzMiBt
aXBpX2NzaXNfcmVhZChzdHJ1Y3QgY3NpX3N0YXRlICpzdGF0ZSwgdTMyIHJlZykKewoJcmV0dXJu
IHJlYWRsKHN0YXRlLT5yZWdzICsgcmVnKTsKfQoKc3RhdGljIGlubGluZSB2b2lkIG1pcGlfY3Np
c193cml0ZShzdHJ1Y3QgY3NpX3N0YXRlICpzdGF0ZSwgdTMyIHJlZywgdTMyIHZhbCkKewoJd3Jp
dGVsKHZhbCwgc3RhdGUtPnJlZ3MgKyByZWcpOwp9CgpzdGF0aWMgdm9pZCBtaXBpX2NzaXNfc3df
cmVzZXQoc3RydWN0IGNzaV9zdGF0ZSAqc3RhdGUpCnsKCXN0cnVjdCBkZXZpY2UgKmRldiA9IHN0
YXRlLT5kZXY7CglzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wID0gZGV2LT5vZl9ub2RlOwoJc3RydWN0
IGRldmljZV9ub2RlICpub2RlOwoJcGhhbmRsZSBwaGFuZGxlOwoJdTMyIG91dF92YWxbM107Cglp
bnQgcmV0OwoKCWRldl9kYmcoZGV2LCAiJXM6IHN0YXJ0aW5nXG4iLCBfX2Z1bmNfXyk7CgoJcmV0
ID0gb2ZfcHJvcGVydHlfcmVhZF91MzJfYXJyYXkobnAsICJjc2lzLXBoeS1yZXNldCIsIG91dF92
YWwsIDMpOwoJaWYgKHJldCkgewoJCWRldl9pbmZvKGRldiwgIm5vIGNzaXMtaHctcmVzZXQgcHJv
cGVydHkgZm91bmQ6ICVkXG4iLCByZXQpOwoJCXJldHVybjsKCX0KCglwaGFuZGxlID0gKm91dF92
YWw7CgoJbm9kZSA9IG9mX2ZpbmRfbm9kZV9ieV9waGFuZGxlKHBoYW5kbGUpOwoJaWYgKCFub2Rl
KSB7CgkJcmV0ID0gUFRSX0VSUihub2RlKTsKCQlkZXZfZGJnKGRldiwgIm5vdCBmaW5kIHNyYyBu
b2RlIGJ5IHBoYW5kbGU6ICVkXG4iLCByZXQpOwoJfQoJc3RhdGUtPmh3X3Jlc2V0LnNyYyA9IHN5
c2Nvbl9ub2RlX3RvX3JlZ21hcChub2RlKTsKCWlmIChJU19FUlIoc3RhdGUtPmh3X3Jlc2V0LnNy
YykpIHsKCQlyZXQgPSBQVFJfRVJSKHN0YXRlLT5od19yZXNldC5zcmMpOwoJCWRldl9lcnIoZGV2
LCAiZmFpbGVkIHRvIGdldCBzcmMgcmVnbWFwOiAlZFxuIiwgcmV0KTsKCX0KCW9mX25vZGVfcHV0
KG5vZGUpOwoJaWYgKHJldCA8IDApCgkJcmV0dXJuOwoKCXN0YXRlLT5od19yZXNldC5yZXFfc3Jj
ID0gb3V0X3ZhbFsxXTsKCXN0YXRlLT5od19yZXNldC5yc3RfdmFsID0gb3V0X3ZhbFsyXTsKCgkv
KiByZXNldCBpbXg4bXEgbWlwaSBwaHkgKi8KCXJlZ21hcF91cGRhdGVfYml0cyhzdGF0ZS0+aHdf
cmVzZXQuc3JjLAoJCQkgICBzdGF0ZS0+aHdfcmVzZXQucmVxX3NyYywKCQkJICAgc3RhdGUtPmh3
X3Jlc2V0LnJzdF92YWwsCgkJCSAgIHN0YXRlLT5od19yZXNldC5yc3RfdmFsKTsKCW1zbGVlcCgy
MCk7CgoJZGV2X2RiZyhkZXYsICIlczogZG9uZVxuIiwgX19mdW5jX18pOwoKCXJldHVybjsKfQoK
c3RhdGljIHZvaWQgbWlwaV9jc2lzX3N5c3RlbV9lbmFibGUoc3RydWN0IGNzaV9zdGF0ZSAqc3Rh
dGUsIGludCBvbikKewoJc3RydWN0IGRldmljZSAqZGV2ID0gc3RhdGUtPmRldjsKCXN0cnVjdCBk
ZXZpY2Vfbm9kZSAqbnAgPSBkZXYtPm9mX25vZGU7CglzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGU7
CglwaGFuZGxlIHBoYW5kbGU7Cgl1MzIgb3V0X3ZhbFsyXTsKCWludCByZXQ7CgoJaWYgKCFvbikg
ewoJCS8qIERpc2FibGUgRGF0YSBsYW5lcyAqLwoJCW1pcGlfY3Npc193cml0ZShzdGF0ZSwgQ1NJ
MlJYX0NGR19ESVNBQkxFX0RBVEFfTEFORVMsIDB4Zik7CgkJcmV0dXJuOwoJfQoKCXJldCA9IG9m
X3Byb3BlcnR5X3JlYWRfdTMyX2FycmF5KG5wLCAicGh5LWdwciIsIG91dF92YWwsIDIpOwoJaWYg
KHJldCkgewoJCWRldl9pbmZvKGRldiwgIm5vIHBoeS1ncHIgcHJvcGVydHkgZm91bmRcbiIpOwoJ
CXJldHVybjsKCX0KCglwaGFuZGxlID0gKm91dF92YWw7CgoJbm9kZSA9IG9mX2ZpbmRfbm9kZV9i
eV9waGFuZGxlKHBoYW5kbGUpOwoJaWYgKCFub2RlKSB7CgkJZGV2X2RiZyhkZXYsICJub3QgZmlu
ZCBncHIgbm9kZSBieSBwaGFuZGxlXG4iKTsKCQlyZXQgPSBQVFJfRVJSKG5vZGUpOwoJfQoJc3Rh
dGUtPnBoeV9ncHIuZ3ByID0gc3lzY29uX25vZGVfdG9fcmVnbWFwKG5vZGUpOwoJaWYgKElTX0VS
UihzdGF0ZS0+cGh5X2dwci5ncHIpKSB7CgkJZGV2X2VycihkZXYsICJmYWlsZWQgdG8gZ2V0IGdw
ciByZWdtYXBcbiIpOwoJCXJldCA9IFBUUl9FUlIoc3RhdGUtPnBoeV9ncHIuZ3ByKTsKCX0KCW9m
X25vZGVfcHV0KG5vZGUpOwoJaWYgKHJldCA8IDApCgkJcmV0dXJuOwoKCXN0YXRlLT5waHlfZ3By
LnJlcV9zcmMgPSBvdXRfdmFsWzFdOwoKCXJlZ21hcF91cGRhdGVfYml0cyhzdGF0ZS0+cGh5X2dw
ci5ncHIsCgkJCSAgIHN0YXRlLT5waHlfZ3ByLnJlcV9zcmMsCgkJCSAgIDB4M0ZGRiwKCQkJICAg
R1BSX0NTSTJfMV9SWF9FTkFCTEUgfAoJCQkgICBHUFJfQ1NJMl8xX1ZJRF9JTlRGQ19FTkIgfAoJ
CQkgICBHUFJfQ1NJMl8xX0hTRUwgfAoJCQkgICBHUFJfQ1NJMl8xX0NPTlRfQ0xLX01PREUgfAoJ
CQkgICBHUFJfQ1NJMl8xX1NfUFJHX1JYSFNfU0VUVExFKHN0YXRlLT4KCQkJCQkJCWhzX3NldHRs
ZSkpOwoKCWRldl9kYmcoZGV2LCAiJXM6IGhzX3NldHRsZTogMHglWFxuIiwgX19mdW5jX18sIHN0
YXRlLT5oc19zZXR0bGUpOwoKCXJldHVybjsKfQoKc3RhdGljIGludCBtaXBpX2NzaXNfY2FsY3Vs
YXRlX3BhcmFtcyhzdHJ1Y3QgY3NpX3N0YXRlICpzdGF0ZSkKewoJczY0IGxpbmtfZnJlcTsKCgkv
KiBDYWxjdWxhdGUgdGhlIGxpbmUgcmF0ZSBmcm9tIHRoZSBwaXhlbCByYXRlLiAqLwoJbGlua19m
cmVxID0gdjRsMl9nZXRfbGlua19mcmVxKHN0YXRlLT5zcmNfc2QtPmN0cmxfaGFuZGxlciwKCQkJ
CSAgICAgICBzdGF0ZS0+Y3Npc19mbXQtPndpZHRoLAoJCQkJICAgICAgIHN0YXRlLT5idXMubnVt
X2RhdGFfbGFuZXMgKiAyKTsKCWlmIChsaW5rX2ZyZXEgPCAwKSB7CgkJZGV2X2VycihzdGF0ZS0+
ZGV2LCAiVW5hYmxlIHRvIG9idGFpbiBsaW5rIGZyZXF1ZW5jeTogJWRcbiIsCgkJCShpbnQpbGlu
a19mcmVxKTsKCQlyZXR1cm4gbGlua19mcmVxOwoJfQpkZXZfZXJyKHN0YXRlLT5kZXYsICJsaW5r
IGZyZXF1ZW5jeSBjYWxjdWxhdGVkIHdpdGggJWQgYnBwOiAlbGxkXG4iLCBzdGF0ZS0+Y3Npc19m
bXQtPndpZHRoLCBsaW5rX2ZyZXEpOwoKCXN0YXRlLT5oc19zZXR0bGUgPSByeGhzX3NldHRsZVsw
XTsKCglyZXR1cm4gMDsKfQoKc3RhdGljIHZvaWQgbWlwaV9jc2lzX3NldF9wYXJhbXMoc3RydWN0
IGNzaV9zdGF0ZSAqc3RhdGUpCnsKCWludCBsYW5lcyA9IHN0YXRlLT5idXMubnVtX2RhdGFfbGFu
ZXM7Cgl1MzIgdmFsID0gMDsKCWludCBpOwoKCS8qIExhbmVzICovCgltaXBpX2NzaXNfd3JpdGUo
c3RhdGUsIENTSTJSWF9DRkdfTlVNX0xBTkVTLCBsYW5lcyAtIDEpOwoKCWZvciAoaSA9IDA7IGkg
PCBsYW5lczsgaSsrKQoJCXZhbCB8PSAoMSA8PCBpKTsKCgl2YWwgPSAweEYgJiB+dmFsOwoJbWlw
aV9jc2lzX3dyaXRlKHN0YXRlLCBDU0kyUlhfQ0ZHX0RJU0FCTEVfREFUQV9MQU5FUywgdmFsKTsK
CglkZXZfZGJnKHN0YXRlLT5kZXYsICJpbXg4bXE6IENTSTJSWF9DRkdfRElTQUJMRV9EQVRBX0xB
TkVTOiAweCVYXG4iLCB2YWwpOwoKCS8qIE1hc2sgaW50ZXJydXB0ICovCgkvLyBEb24ndCBsZXQg
VUxQUyAodWx0cmEtbG93IHBvd2VyIHN0YXR1cykgaW50ZXJydXB0cyBmbG9vZAoJbWlwaV9jc2lz
X3dyaXRlKHN0YXRlLCBDU0kyUlhfSVJRX01BU0ssIDB4MWZmKTsKCgltaXBpX2NzaXNfd3JpdGUo
c3RhdGUsIDB4MTgwLCAxKTsKCS8qIHZpZF92YyAqLwoJbWlwaV9jc2lzX3dyaXRlKHN0YXRlLCAw
eDE4NCwgMSk7CgltaXBpX2NzaXNfd3JpdGUoc3RhdGUsIDB4MTg4LCBzdGF0ZS0+c2VuZF9sZXZl
bCk7Cn0KCnN0YXRpYyBpbnQgbWlwaV9jc2lzX2Nsa19lbmFibGUoc3RydWN0IGNzaV9zdGF0ZSAq
c3RhdGUpCnsKCXJldHVybiBjbGtfYnVsa19wcmVwYXJlX2VuYWJsZShBUlJBWV9TSVpFKG1pcGlf
Y3Npc19jbGtfaWQpLCBzdGF0ZS0+Y2xrcyk7Cn0KCnN0YXRpYyB2b2lkIG1pcGlfY3Npc19jbGtf
ZGlzYWJsZShzdHJ1Y3QgY3NpX3N0YXRlICpzdGF0ZSkKewoJY2xrX2J1bGtfZGlzYWJsZV91bnBy
ZXBhcmUoQVJSQVlfU0laRShtaXBpX2NzaXNfY2xrX2lkKSwgc3RhdGUtPmNsa3MpOwp9CgpzdGF0
aWMgaW50IG1pcGlfY3Npc19jbGtfZ2V0KHN0cnVjdCBjc2lfc3RhdGUgKnN0YXRlKQp7Cgl1bnNp
Z25lZCBpbnQgaTsKCWludCByZXQ7CgoJc3RhdGUtPmNsa3MgPSBkZXZtX2tjYWxsb2Moc3RhdGUt
PmRldiwgQVJSQVlfU0laRShtaXBpX2NzaXNfY2xrX2lkKSwKCQkJCSAgIHNpemVvZigqc3RhdGUt
PmNsa3MpLCBHRlBfS0VSTkVMKTsKCglpZiAoIXN0YXRlLT5jbGtzKQoJCXJldHVybiAtRU5PTUVN
OwoKCWZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKG1pcGlfY3Npc19jbGtfaWQpOyBpKyspCgkJ
c3RhdGUtPmNsa3NbaV0uaWQgPSBtaXBpX2NzaXNfY2xrX2lkW2ldOwoKCXJldCA9IGRldm1fY2xr
X2J1bGtfZ2V0KHN0YXRlLT5kZXYsIEFSUkFZX1NJWkUobWlwaV9jc2lzX2Nsa19pZCksCgkJCQlz
dGF0ZS0+Y2xrcyk7CglyZXR1cm4gcmV0Owp9CgpzdGF0aWMgdm9pZCBtaXBpX2NzaXNfc3RhcnRf
c3RyZWFtKHN0cnVjdCBjc2lfc3RhdGUgKnN0YXRlKQp7CgltaXBpX2NzaXNfc3dfcmVzZXQoc3Rh
dGUpOwoJbWlwaV9jc2lzX3NldF9wYXJhbXMoc3RhdGUpOwoJbWlwaV9jc2lzX3N5c3RlbV9lbmFi
bGUoc3RhdGUsIHRydWUpOwp9CgpzdGF0aWMgdm9pZCBtaXBpX2NzaXNfc3RvcF9zdHJlYW0oc3Ry
dWN0IGNzaV9zdGF0ZSAqc3RhdGUpCnsKCW1pcGlfY3Npc19zeXN0ZW1fZW5hYmxlKHN0YXRlLCBm
YWxzZSk7Cn0KCi8qIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAqIFY0TDIgc3ViZGV2IG9wZXJhdGlv
bnMKICovCgpzdGF0aWMgc3RydWN0IGNzaV9zdGF0ZSAqbWlwaV9zZF90b19jc2lzX3N0YXRlKHN0
cnVjdCB2NGwyX3N1YmRldiAqc2RldikKewoJcmV0dXJuIGNvbnRhaW5lcl9vZihzZGV2LCBzdHJ1
Y3QgY3NpX3N0YXRlLCBzZCk7Cn0KCnN0YXRpYyBpbnQgbWlwaV9jc2lzX3Nfc3RyZWFtKHN0cnVj
dCB2NGwyX3N1YmRldiAqc2QsIGludCBlbmFibGUpCnsKCXN0cnVjdCBjc2lfc3RhdGUgKnN0YXRl
ID0gbWlwaV9zZF90b19jc2lzX3N0YXRlKHNkKTsKCWludCByZXQ7CgoJbWlwaV9jc2lzX3dyaXRl
KHN0YXRlLCBDU0kyUlhfSVJRX01BU0ssIDB4MDA4KTsKCglkZXZfZGJnKHN0YXRlLT5kZXYsICIl
czogZW5hYmxlOiAlZFxuIiwgX19mdW5jX18sIGVuYWJsZSk7CgoJaWYgKGVuYWJsZSkgewoJCXJl
dCA9IG1pcGlfY3Npc19jYWxjdWxhdGVfcGFyYW1zKHN0YXRlKTsKCQlpZiAocmV0IDwgMCkKCQkJ
cmV0dXJuIHJldDsKCgkJcmV0ID0gcG1fcnVudGltZV9nZXRfc3luYyhzdGF0ZS0+ZGV2KTsKCQlp
ZiAocmV0IDwgMCkgewoJCQlwbV9ydW50aW1lX3B1dF9ub2lkbGUoc3RhdGUtPmRldik7CgkJCXJl
dHVybiByZXQ7CgkJfQoJCXJldCA9IHY0bDJfc3ViZGV2X2NhbGwoc3RhdGUtPnNyY19zZCwgY29y
ZSwgc19wb3dlciwgMSk7CgkJaWYgKHJldCA8IDAgJiYgcmV0ICE9IC1FTk9JT0NUTENNRCkKCQkJ
Z290byBkb25lOwoJfQoKCW11dGV4X2xvY2soJnN0YXRlLT5sb2NrKTsKCglpZiAoZW5hYmxlKSB7
CgkJaWYgKHN0YXRlLT5zdGF0ZSAmIFNUX1NVU1BFTkRFRCkgewoJCQlyZXQgPSAtRUJVU1k7CgkJ
CWdvdG8gdW5sb2NrOwoJCX0KCgkJbWlwaV9jc2lzX3N0YXJ0X3N0cmVhbShzdGF0ZSk7CgkJcmV0
ID0gdjRsMl9zdWJkZXZfY2FsbChzdGF0ZS0+c3JjX3NkLCB2aWRlbywgc19zdHJlYW0sIDEpOwoJ
CWlmIChyZXQgPCAwKQoJCQlnb3RvIHVubG9jazsKCgkJc3RhdGUtPnN0YXRlIHw9IFNUX1NUUkVB
TUlORzsKCX0gZWxzZSB7CgkJdjRsMl9zdWJkZXZfY2FsbChzdGF0ZS0+c3JjX3NkLCB2aWRlbywg
c19zdHJlYW0sIDApOwoJCXJldCA9IHY0bDJfc3ViZGV2X2NhbGwoc3RhdGUtPnNyY19zZCwgY29y
ZSwgc19wb3dlciwgMCk7CgkJaWYgKHJldCA9PSAtRU5PSU9DVExDTUQpCgkJCXJldCA9IDA7CgkJ
bWlwaV9jc2lzX3N0b3Bfc3RyZWFtKHN0YXRlKTsKCQlzdGF0ZS0+c3RhdGUgJj0gflNUX1NUUkVB
TUlORzsKCX0KCnVubG9jazoKCW11dGV4X3VubG9jaygmc3RhdGUtPmxvY2spOwoKZG9uZToKCWlm
ICghZW5hYmxlIHx8IHJldCA8IDApCgkJcG1fcnVudGltZV9wdXQoc3RhdGUtPmRldik7CgoJcmV0
dXJuIHJldDsKfQoKc3RhdGljIHN0cnVjdCB2NGwyX21idXNfZnJhbWVmbXQgKgptaXBpX2NzaXNf
Z2V0X2Zvcm1hdChzdHJ1Y3QgY3NpX3N0YXRlICpzdGF0ZSwKCQkgICAgIHN0cnVjdCB2NGwyX3N1
YmRldl9wYWRfY29uZmlnICpjZmcsCgkJICAgICBlbnVtIHY0bDJfc3ViZGV2X2Zvcm1hdF93aGVu
Y2Ugd2hpY2gsCgkJICAgICB1bnNpZ25lZCBpbnQgcGFkKQp7CglpZiAod2hpY2ggPT0gVjRMMl9T
VUJERVZfRk9STUFUX1RSWSkKCQlyZXR1cm4gdjRsMl9zdWJkZXZfZ2V0X3RyeV9mb3JtYXQoJnN0
YXRlLT5zZCwgY2ZnLCBwYWQpOwoKCXJldHVybiAmc3RhdGUtPmZvcm1hdF9tYnVzOwp9CgpzdGF0
aWMgaW50IG1pcGlfY3NpMl9pbml0X2NmZyhzdHJ1Y3QgdjRsMl9zdWJkZXYgKnNkLAoJCQkgICAg
ICBzdHJ1Y3QgdjRsMl9zdWJkZXZfcGFkX2NvbmZpZyAqY2ZnKQp7CglzdHJ1Y3QgY3NpX3N0YXRl
ICpzdGF0ZSA9IG1pcGlfc2RfdG9fY3Npc19zdGF0ZShzZCk7CglzdHJ1Y3QgdjRsMl9tYnVzX2Zy
YW1lZm10ICpmbXRfc2luazsKCXN0cnVjdCB2NGwyX21idXNfZnJhbWVmbXQgKmZtdF9zb3VyY2U7
CgllbnVtIHY0bDJfc3ViZGV2X2Zvcm1hdF93aGVuY2Ugd2hpY2g7CgoJd2hpY2ggPSBjZmcgPyBW
NEwyX1NVQkRFVl9GT1JNQVRfVFJZIDogVjRMMl9TVUJERVZfRk9STUFUX0FDVElWRTsKCWZtdF9z
aW5rID0gbWlwaV9jc2lzX2dldF9mb3JtYXQoc3RhdGUsIGNmZywgd2hpY2gsIENTSVNfUEFEX1NJ
TkspOwoKCWZtdF9zaW5rLT5jb2RlID0gTUVESUFfQlVTX0ZNVF9TR0JSRzEwXzFYMTA7CglmbXRf
c2luay0+d2lkdGggPSBNSVBJX0NTSVNfREVGX1BJWF9XSURUSDsKCWZtdF9zaW5rLT5oZWlnaHQg
PSBNSVBJX0NTSVNfREVGX1BJWF9IRUlHSFQ7CglmbXRfc2luay0+ZmllbGQgPSBWNEwyX0ZJRUxE
X05PTkU7CgoJZm10X3NpbmstPmNvbG9yc3BhY2UgPSBWNEwyX0NPTE9SU1BBQ0VfUkFXOwoJZm10
X3NpbmstPnhmZXJfZnVuYyA9IFY0TDJfTUFQX1hGRVJfRlVOQ19ERUZBVUxUKGZtdF9zaW5rLT5j
b2xvcnNwYWNlKTsKCWZtdF9zaW5rLT55Y2Jjcl9lbmMgPSBWNEwyX01BUF9ZQ0JDUl9FTkNfREVG
QVVMVChmbXRfc2luay0+Y29sb3JzcGFjZSk7CglmbXRfc2luay0+cXVhbnRpemF0aW9uID0KCQlW
NEwyX01BUF9RVUFOVElaQVRJT05fREVGQVVMVChmYWxzZSwgZm10X3NpbmstPmNvbG9yc3BhY2Us
CgkJCQkJICAgICAgZm10X3NpbmstPnljYmNyX2VuYyk7CgoJLyoKCSAqIFdoZW4gY2FsbGVkIGZy
b20gbWlwaV9jc2lzX3N1YmRldl9pbml0KCkgdG8gaW5pdGlhbGl6ZSB0aGUgYWN0aXZlCgkgKiBj
b25maWd1cmF0aW9uLCBjZmcgaXMgTlVMTCwgd2hpY2ggaW5kaWNhdGVzIHRoZXJlJ3Mgbm8gc291
cmNlIHBhZAoJICogY29uZmlndXJhdGlvbiB0byBzZXQuCgkgKi8KCWlmICghY2ZnKQoJCXJldHVy
biAwOwoKCWZtdF9zb3VyY2UgPSBtaXBpX2NzaXNfZ2V0X2Zvcm1hdChzdGF0ZSwgY2ZnLCB3aGlj
aCwgQ1NJU19QQURfU09VUkNFKTsKCSpmbXRfc291cmNlID0gKmZtdF9zaW5rOwoKCXJldHVybiAw
Owp9CgpzdGF0aWMgaW50IG1pcGlfY3Npc19nZXRfZm10KHN0cnVjdCB2NGwyX3N1YmRldiAqc2Qs
CgkJCSAgICAgc3RydWN0IHY0bDJfc3ViZGV2X3BhZF9jb25maWcgKmNmZywKCQkJICAgICBzdHJ1
Y3QgdjRsMl9zdWJkZXZfZm9ybWF0ICpzZGZvcm1hdCkKewoJc3RydWN0IGNzaV9zdGF0ZSAqc3Rh
dGUgPSBtaXBpX3NkX3RvX2NzaXNfc3RhdGUoc2QpOwoJc3RydWN0IHY0bDJfbWJ1c19mcmFtZWZt
dCAqZm10OwoKCWZtdCA9IG1pcGlfY3Npc19nZXRfZm9ybWF0KHN0YXRlLCBjZmcsIHNkZm9ybWF0
LT53aGljaCwgc2Rmb3JtYXQtPnBhZCk7CgoJbXV0ZXhfbG9jaygmc3RhdGUtPmxvY2spOwoJc2Rm
b3JtYXQtPmZvcm1hdCA9ICpmbXQ7CgltdXRleF91bmxvY2soJnN0YXRlLT5sb2NrKTsKCglyZXR1
cm4gMDsKfQoKc3RhdGljIGludCBtaXBpX2NzaXNfZW51bV9tYnVzX2NvZGUoc3RydWN0IHY0bDJf
c3ViZGV2ICpzZCwKCQkJCSAgICBzdHJ1Y3QgdjRsMl9zdWJkZXZfcGFkX2NvbmZpZyAqY2ZnLAoJ
CQkJICAgIHN0cnVjdCB2NGwyX3N1YmRldl9tYnVzX2NvZGVfZW51bSAqY29kZSkKewoJc3RydWN0
IGNzaV9zdGF0ZSAqc3RhdGUgPSBtaXBpX3NkX3RvX2NzaXNfc3RhdGUoc2QpOwoKCS8qCgkgKiBX
ZSBjYW4ndCB0cmFuc2NvZGUgaW4gYW55IHdheSwgdGhlIHNvdXJjZSBmb3JtYXQgaXMgaWRlbnRp
Y2FsCgkgKiB0byB0aGUgc2luayBmb3JtYXQuCgkgKi8KCWlmIChjb2RlLT5wYWQgPT0gQ1NJU19Q
QURfU09VUkNFKSB7CgkJc3RydWN0IHY0bDJfbWJ1c19mcmFtZWZtdCAqZm10OwoKCQlpZiAoY29k
ZS0+aW5kZXggPiAwKQoJCQlyZXR1cm4gLUVJTlZBTDsKCgkJZm10ID0gbWlwaV9jc2lzX2dldF9m
b3JtYXQoc3RhdGUsIGNmZywgY29kZS0+d2hpY2gsIGNvZGUtPnBhZCk7CgkJY29kZS0+Y29kZSA9
IGZtdC0+Y29kZTsKCQlyZXR1cm4gMDsKCX0KCglpZiAoY29kZS0+cGFkICE9IENTSVNfUEFEX1NJ
TkspCgkJcmV0dXJuIC1FSU5WQUw7CgoJaWYgKGNvZGUtPmluZGV4ID49IEFSUkFZX1NJWkUobWlw
aV9jc2lzX2Zvcm1hdHMpKQoJCXJldHVybiAtRUlOVkFMOwoKCWNvZGUtPmNvZGUgPSBtaXBpX2Nz
aXNfZm9ybWF0c1tjb2RlLT5pbmRleF0uY29kZTsKCglyZXR1cm4gMDsKfQoKc3RhdGljIGludCBt
aXBpX2NzaXNfc2V0X2ZtdChzdHJ1Y3QgdjRsMl9zdWJkZXYgKnNkLAoJCQkgICAgIHN0cnVjdCB2
NGwyX3N1YmRldl9wYWRfY29uZmlnICpjZmcsCgkJCSAgICAgc3RydWN0IHY0bDJfc3ViZGV2X2Zv
cm1hdCAqc2Rmb3JtYXQpCnsKCXN0cnVjdCBjc2lfc3RhdGUgKnN0YXRlID0gbWlwaV9zZF90b19j
c2lzX3N0YXRlKHNkKTsKCXN0cnVjdCBjc2lzX3BpeF9mb3JtYXQgY29uc3QgKmNzaXNfZm10OwoJ
c3RydWN0IHY0bDJfbWJ1c19mcmFtZWZtdCAqZm10OwoKCS8qCgkgKiBUaGUgQ1NJUyBjYW4ndCB0
cmFuc2NvZGUgaW4gYW55IHdheSwgdGhlIHNvdXJjZSBmb3JtYXQgY2FuJ3QgYmUKCSAqIG1vZGlm
aWVkLgoJICovCglpZiAoc2Rmb3JtYXQtPnBhZCA9PSBDU0lTX1BBRF9TT1VSQ0UpCgkJcmV0dXJu
IG1pcGlfY3Npc19nZXRfZm10KHNkLCBjZmcsIHNkZm9ybWF0KTsKCglpZiAoc2Rmb3JtYXQtPnBh
ZCAhPSBDU0lTX1BBRF9TSU5LKQoJCXJldHVybiAtRUlOVkFMOwoKCWRldl9lcnIoc3RhdGUtPmRl
diwgInRyeWluZyB0byBmaW5kIGZvcm1hdCBmb3IgY29kZSAlZFxuIiwKCQlzZGZvcm1hdC0+Zm9y
bWF0LmNvZGUpOwoJY3Npc19mbXQgPSBmaW5kX2NzaXNfZm9ybWF0KHNkZm9ybWF0LT5mb3JtYXQu
Y29kZSk7CglpZiAoIWNzaXNfZm10KSB7CgkJZGV2X2VycihzdGF0ZS0+ZGV2LCAibm8gZm9ybWF0
IGZvdW5kIGJhc2VkIG9uIGNvZGUgJWRcbiIsCgkJCXNkZm9ybWF0LT5mb3JtYXQuY29kZSk7CgkJ
Y3Npc19mbXQgPSAmbWlwaV9jc2lzX2Zvcm1hdHNbMF07Cgl9CgoJZm10ID0gbWlwaV9jc2lzX2dl
dF9mb3JtYXQoc3RhdGUsIGNmZywgc2Rmb3JtYXQtPndoaWNoLCBzZGZvcm1hdC0+cGFkKTsKCglt
dXRleF9sb2NrKCZzdGF0ZS0+bG9jayk7CgoJZm10LT5jb2RlID0gY3Npc19mbXQtPmNvZGU7Cglm
bXQtPndpZHRoID0gc2Rmb3JtYXQtPmZvcm1hdC53aWR0aDsKCWZtdC0+aGVpZ2h0ID0gc2Rmb3Jt
YXQtPmZvcm1hdC5oZWlnaHQ7CgoJc2Rmb3JtYXQtPmZvcm1hdCA9ICpmbXQ7CgoJLyogUHJvcGFn
YXRlIHRoZSBmb3JtYXQgZnJvbSBzaW5rIHRvIHNvdXJjZS4gKi8KCWZtdCA9IG1pcGlfY3Npc19n
ZXRfZm9ybWF0KHN0YXRlLCBjZmcsIHNkZm9ybWF0LT53aGljaCwKCQkJCSAgIENTSVNfUEFEX1NP
VVJDRSk7CgkqZm10ID0gc2Rmb3JtYXQtPmZvcm1hdDsKCgkvKiBTdG9yZSB0aGUgQ1NJMiBmb3Jt
YXQgZGVzY3JpcHRvciBmb3IgYWN0aXZlIGZvcm1hdHMuICovCglpZiAoc2Rmb3JtYXQtPndoaWNo
ID09IFY0TDJfU1VCREVWX0ZPUk1BVF9BQ1RJVkUpCgkJc3RhdGUtPmNzaXNfZm10ID0gY3Npc19m
bXQ7CgoJbXV0ZXhfdW5sb2NrKCZzdGF0ZS0+bG9jayk7CgoJaWYgKHNkZm9ybWF0LT5mb3JtYXQu
d2lkdGggKiBzZGZvcm1hdC0+Zm9ybWF0LmhlaWdodCA+IDcyMCAqIDQ4MCkgewoJCXN0YXRlLT5o
c19zZXR0bGUgPSByeGhzX3NldHRsZVsxXTsKCX0gZWxzZSB7CgkJc3RhdGUtPmhzX3NldHRsZSA9
IHJ4aHNfc2V0dGxlWzBdOwoJfQoJc3RhdGUtPnNlbmRfbGV2ZWwgPSA2NDsKCglkZXZfZGJnKHN0
YXRlLT5kZXYsCgkJIiVzOiBmb3JtYXQgJWR4JWQgc2VuZF9sZXZlbCAlZCBoc19zZXR0bGUgMHgl
WFxuIiwgX19mdW5jX18sCgkJc2Rmb3JtYXQtPmZvcm1hdC53aWR0aCwgc2Rmb3JtYXQtPmZvcm1h
dC5oZWlnaHQsCgkJc3RhdGUtPnNlbmRfbGV2ZWwsIHN0YXRlLT5oc19zZXR0bGUpOwoKCXJldHVy
biAwOwp9CgpzdGF0aWMgaW50IG1pcGlfY3Npc19sb2dfc3RhdHVzKHN0cnVjdCB2NGwyX3N1YmRl
diAqc2QpCnsKCXN0cnVjdCBjc2lfc3RhdGUgKnN0YXRlID0gbWlwaV9zZF90b19jc2lzX3N0YXRl
KHNkKTsKCgltdXRleF9sb2NrKCZzdGF0ZS0+bG9jayk7CgltdXRleF91bmxvY2soJnN0YXRlLT5s
b2NrKTsKCglyZXR1cm4gMDsKfQoKc3RhdGljIGNvbnN0IHN0cnVjdCB2NGwyX3N1YmRldl9jb3Jl
X29wcyBtaXBpX2NzaXNfY29yZV9vcHMgPSB7CgkubG9nX3N0YXR1cwk9IG1pcGlfY3Npc19sb2df
c3RhdHVzLAp9OwoKc3RhdGljIGNvbnN0IHN0cnVjdCB2NGwyX3N1YmRldl92aWRlb19vcHMgbWlw
aV9jc2lzX3ZpZGVvX29wcyA9IHsKCS5zX3N0cmVhbQk9IG1pcGlfY3Npc19zX3N0cmVhbSwKfTsK
CnN0YXRpYyBjb25zdCBzdHJ1Y3QgdjRsMl9zdWJkZXZfcGFkX29wcyBtaXBpX2NzaXNfcGFkX29w
cyA9IHsKCS5pbml0X2NmZwkJPSBtaXBpX2NzaTJfaW5pdF9jZmcsCgkuZW51bV9tYnVzX2NvZGUJ
CT0gbWlwaV9jc2lzX2VudW1fbWJ1c19jb2RlLAoJLmdldF9mbXQJCT0gbWlwaV9jc2lzX2dldF9m
bXQsCgkuc2V0X2ZtdAkJPSBtaXBpX2NzaXNfc2V0X2ZtdCwKfTsKCnN0YXRpYyBjb25zdCBzdHJ1
Y3QgdjRsMl9zdWJkZXZfb3BzIG1pcGlfY3Npc19zdWJkZXZfb3BzID0gewoJLmNvcmUJPSAmbWlw
aV9jc2lzX2NvcmVfb3BzLAoJLnZpZGVvCT0gJm1pcGlfY3Npc192aWRlb19vcHMsCgkucGFkCT0g
Jm1pcGlfY3Npc19wYWRfb3BzLAp9OwoKLyogLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KICogTWVkaWEg
ZW50aXR5IG9wZXJhdGlvbnMKICovCgpzdGF0aWMgaW50IG1pcGlfY3Npc19saW5rX3NldHVwKHN0
cnVjdCBtZWRpYV9lbnRpdHkgKmVudGl0eSwKCQkJCWNvbnN0IHN0cnVjdCBtZWRpYV9wYWQgKmxv
Y2FsX3BhZCwKCQkJCWNvbnN0IHN0cnVjdCBtZWRpYV9wYWQgKnJlbW90ZV9wYWQsIHUzMiBmbGFn
cykKewoJc3RydWN0IHY0bDJfc3ViZGV2ICpzZCA9IG1lZGlhX2VudGl0eV90b192NGwyX3N1YmRl
dihlbnRpdHkpOwoJc3RydWN0IGNzaV9zdGF0ZSAqc3RhdGUgPSBtaXBpX3NkX3RvX2NzaXNfc3Rh
dGUoc2QpOwoJc3RydWN0IHY0bDJfc3ViZGV2ICpyZW1vdGVfc2Q7CgoJZGV2X2RiZyhzdGF0ZS0+
ZGV2LCAibGluayBzZXR1cCAlcyAtPiAlcyIsIHJlbW90ZV9wYWQtPmVudGl0eS0+bmFtZSwKCQls
b2NhbF9wYWQtPmVudGl0eS0+bmFtZSk7CgoJLyogV2Ugb25seSBjYXJlIGFib3V0IHRoZSBsaW5r
IHRvIHRoZSBzb3VyY2UuICovCglpZiAoIShsb2NhbF9wYWQtPmZsYWdzICYgTUVESUFfUEFEX0ZM
X1NJTkspKQoJCXJldHVybiAwOwoKCXJlbW90ZV9zZCA9IG1lZGlhX2VudGl0eV90b192NGwyX3N1
YmRldihyZW1vdGVfcGFkLT5lbnRpdHkpOwoKCWlmIChmbGFncyAmIE1FRElBX0xOS19GTF9FTkFC
TEVEKSB7CgkJaWYgKHN0YXRlLT5zcmNfc2QpCgkJCXJldHVybiAtRUJVU1k7CgoJCXN0YXRlLT5z
cmNfc2QgPSByZW1vdGVfc2Q7Cgl9IGVsc2UgewoJCXN0YXRlLT5zcmNfc2QgPSBOVUxMOwoJfQoK
CXJldHVybiAwOwp9CgpzdGF0aWMgY29uc3Qgc3RydWN0IG1lZGlhX2VudGl0eV9vcGVyYXRpb25z
IG1pcGlfY3Npc19lbnRpdHlfb3BzID0gewoJLmxpbmtfc2V0dXAJPSBtaXBpX2NzaXNfbGlua19z
ZXR1cCwKCS5saW5rX3ZhbGlkYXRlCT0gdjRsMl9zdWJkZXZfbGlua192YWxpZGF0ZSwKCS5nZXRf
Zndub2RlX3BhZCA9IHY0bDJfc3ViZGV2X2dldF9md25vZGVfcGFkXzFfdG9fMSwKfTsKCi8qIC0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCiAqIEFzeW5jIHN1YmRldiBub3RpZmllcgogKi8KCnN0YXRpYyBz
dHJ1Y3QgY3NpX3N0YXRlICoKbWlwaV9ub3RpZmllcl90b19jc2lzX3N0YXRlKHN0cnVjdCB2NGwy
X2FzeW5jX25vdGlmaWVyICpuKQp7CglyZXR1cm4gY29udGFpbmVyX29mKG4sIHN0cnVjdCBjc2lf
c3RhdGUsIG5vdGlmaWVyKTsKfQoKc3RhdGljIGludCBtaXBpX2NzaXNfbm90aWZ5X2JvdW5kKHN0
cnVjdCB2NGwyX2FzeW5jX25vdGlmaWVyICpub3RpZmllciwKCQkJCSAgc3RydWN0IHY0bDJfc3Vi
ZGV2ICpzZCwKCQkJCSAgc3RydWN0IHY0bDJfYXN5bmNfc3ViZGV2ICphc2QpCnsKCXN0cnVjdCBj
c2lfc3RhdGUgKnN0YXRlID0gbWlwaV9ub3RpZmllcl90b19jc2lzX3N0YXRlKG5vdGlmaWVyKTsK
CXN0cnVjdCBtZWRpYV9wYWQgKnNpbmsgPSAmc3RhdGUtPnNkLmVudGl0eS5wYWRzW0NTSVNfUEFE
X1NJTktdOwoKCXJldHVybiB2NGwyX2NyZWF0ZV9md25vZGVfbGlua3NfdG9fcGFkKHNkLCBzaW5r
LCAwKTsKfQoKc3RhdGljIGNvbnN0IHN0cnVjdCB2NGwyX2FzeW5jX25vdGlmaWVyX29wZXJhdGlv
bnMgbWlwaV9jc2lzX25vdGlmeV9vcHMgPSB7CgkuYm91bmQgPSBtaXBpX2NzaXNfbm90aWZ5X2Jv
dW5kLAp9OwoKc3RhdGljIGludCBtaXBpX2NzaXNfYXN5bmNfcmVnaXN0ZXIoc3RydWN0IGNzaV9z
dGF0ZSAqc3RhdGUpCnsKCXN0cnVjdCB2NGwyX2Z3bm9kZV9lbmRwb2ludCB2ZXAgPSB7CgkJLmJ1
c190eXBlID0gVjRMMl9NQlVTX0NTSTJfRFBIWSwKCX07CglzdHJ1Y3QgdjRsMl9hc3luY19zdWJk
ZXYgKmFzZDsKCXN0cnVjdCBmd25vZGVfaGFuZGxlICplcDsKCXVuc2lnbmVkIGludCBpOwoJaW50
IHJldDsKCgl2NGwyX2FzeW5jX25vdGlmaWVyX2luaXQoJnN0YXRlLT5ub3RpZmllcik7CgoJZXAg
PSBmd25vZGVfZ3JhcGhfZ2V0X2VuZHBvaW50X2J5X2lkKGRldl9md25vZGUoc3RhdGUtPmRldiks
IDAsIDAsCgkJCQkJICAgICBGV05PREVfR1JBUEhfRU5EUE9JTlRfTkVYVCk7CglpZiAoIWVwKQoJ
CXJldHVybiAtRU5PVENPTk47CgoJcmV0ID0gdjRsMl9md25vZGVfZW5kcG9pbnRfcGFyc2UoZXAs
ICZ2ZXApOwoJaWYgKHJldCkKCQlnb3RvIGVycl9wYXJzZTsKCglmb3IgKGkgPSAwOyBpIDwgdmVw
LmJ1cy5taXBpX2NzaTIubnVtX2RhdGFfbGFuZXM7ICsraSkgewoJCWlmICh2ZXAuYnVzLm1pcGlf
Y3NpMi5kYXRhX2xhbmVzW2ldICE9IGkgKyAxKSB7CgkJCWRldl9lcnIoc3RhdGUtPmRldiwKCQkJ
CSJkYXRhIGxhbmVzIHJlb3JkZXJpbmcgaXMgbm90IHN1cHBvcnRlZCIpOwoJCQlnb3RvIGVycl9w
YXJzZTsKCQl9Cgl9CgoJc3RhdGUtPmJ1cyA9IHZlcC5idXMubWlwaV9jc2kyOwoKCWRldl9kYmco
c3RhdGUtPmRldiwgImRhdGEgbGFuZXM6ICVkXG4iLCBzdGF0ZS0+YnVzLm51bV9kYXRhX2xhbmVz
KTsKCWRldl9kYmcoc3RhdGUtPmRldiwgImZsYWdzOiAweCUwOHhcbiIsIHN0YXRlLT5idXMuZmxh
Z3MpOwoKCWFzZCA9IHY0bDJfYXN5bmNfbm90aWZpZXJfYWRkX2Z3bm9kZV9yZW1vdGVfc3ViZGV2
KAoJCSZzdGF0ZS0+bm90aWZpZXIsIGVwLCBzdHJ1Y3QgdjRsMl9hc3luY19zdWJkZXYpOwoJaWYg
KElTX0VSUihhc2QpKSB7CgkJcmV0ID0gUFRSX0VSUihhc2QpOwoJCWdvdG8gZXJyX3BhcnNlOwoJ
fQoKCWZ3bm9kZV9oYW5kbGVfcHV0KGVwKTsKCglzdGF0ZS0+bm90aWZpZXIub3BzID0gJm1pcGlf
Y3Npc19ub3RpZnlfb3BzOwoKCXJldCA9IHY0bDJfYXN5bmNfc3ViZGV2X25vdGlmaWVyX3JlZ2lz
dGVyKCZzdGF0ZS0+c2QsICZzdGF0ZS0+bm90aWZpZXIpOwoJaWYgKHJldCkKCQlyZXR1cm4gcmV0
OwoKCXJldHVybiB2NGwyX2FzeW5jX3JlZ2lzdGVyX3N1YmRldigmc3RhdGUtPnNkKTsKCmVycl9w
YXJzZToKCWZ3bm9kZV9oYW5kbGVfcHV0KGVwKTsKCglyZXR1cm4gcmV0Owp9CgovKiAtLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQogKiBTdXNwZW5kL3Jlc3VtZQogKi8KCnN0YXRpYyBpbnQgbWlwaV9jc2lz
X3BtX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2LCBib29sIHJ1bnRpbWUpCnsKCXN0cnVjdCB2
NGwyX3N1YmRldiAqc2QgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKCXN0cnVjdCBjc2lfc3RhdGUg
KnN0YXRlID0gbWlwaV9zZF90b19jc2lzX3N0YXRlKHNkKTsKCWludCByZXQgPSAwOwoKCW11dGV4
X2xvY2soJnN0YXRlLT5sb2NrKTsKCWlmIChzdGF0ZS0+c3RhdGUgJiBTVF9QT1dFUkVEKSB7CgkJ
bWlwaV9jc2lzX3N0b3Bfc3RyZWFtKHN0YXRlKTsKCQltaXBpX2NzaXNfY2xrX2Rpc2FibGUoc3Rh
dGUpOwoJCXN0YXRlLT5zdGF0ZSAmPSB+U1RfUE9XRVJFRDsKCQlpZiAoIXJ1bnRpbWUpCgkJCXN0
YXRlLT5zdGF0ZSB8PSBTVF9TVVNQRU5ERUQ7Cgl9CgoJbXV0ZXhfdW5sb2NrKCZzdGF0ZS0+bG9j
ayk7CgoJcmV0dXJuIHJldCA/IC1FQUdBSU4gOiAwOwp9CgpzdGF0aWMgaW50IG1pcGlfY3Npc19w
bV9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2LCBib29sIHJ1bnRpbWUpCnsKCXN0cnVjdCB2NGwy
X3N1YmRldiAqc2QgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKCXN0cnVjdCBjc2lfc3RhdGUgKnN0
YXRlID0gbWlwaV9zZF90b19jc2lzX3N0YXRlKHNkKTsKCWludCByZXQgPSAwOwoKCW11dGV4X2xv
Y2soJnN0YXRlLT5sb2NrKTsKCWlmICghcnVudGltZSAmJiAhKHN0YXRlLT5zdGF0ZSAmIFNUX1NV
U1BFTkRFRCkpCgkJZ290byB1bmxvY2s7CgoJaWYgKCEoc3RhdGUtPnN0YXRlICYgU1RfUE9XRVJF
RCkpIHsKCQlzdGF0ZS0+c3RhdGUgfD0gU1RfUE9XRVJFRDsKCQltaXBpX2NzaXNfY2xrX2VuYWJs
ZShzdGF0ZSk7Cgl9CglpZiAoc3RhdGUtPnN0YXRlICYgU1RfU1RSRUFNSU5HKQoJCW1pcGlfY3Np
c19zdGFydF9zdHJlYW0oc3RhdGUpOwoKCXN0YXRlLT5zdGF0ZSAmPSB+U1RfU1VTUEVOREVEOwoK
dW5sb2NrOgoJbXV0ZXhfdW5sb2NrKCZzdGF0ZS0+bG9jayk7CgoJcmV0dXJuIHJldCA/IC1FQUdB
SU4gOiAwOwp9CgpzdGF0aWMgaW50IF9fbWF5YmVfdW51c2VkIG1pcGlfY3Npc19zdXNwZW5kKHN0
cnVjdCBkZXZpY2UgKmRldikKewoJcmV0dXJuIG1pcGlfY3Npc19wbV9zdXNwZW5kKGRldiwgZmFs
c2UpOwp9CgpzdGF0aWMgaW50IF9fbWF5YmVfdW51c2VkIG1pcGlfY3Npc19yZXN1bWUoc3RydWN0
IGRldmljZSAqZGV2KQp7CglyZXR1cm4gbWlwaV9jc2lzX3BtX3Jlc3VtZShkZXYsIGZhbHNlKTsK
fQoKc3RhdGljIGludCBfX21heWJlX3VudXNlZCBtaXBpX2NzaXNfcnVudGltZV9zdXNwZW5kKHN0
cnVjdCBkZXZpY2UgKmRldikKewoJcmV0dXJuIG1pcGlfY3Npc19wbV9zdXNwZW5kKGRldiwgdHJ1
ZSk7Cn0KCnN0YXRpYyBpbnQgX19tYXliZV91bnVzZWQgbWlwaV9jc2lzX3J1bnRpbWVfcmVzdW1l
KHN0cnVjdCBkZXZpY2UgKmRldikKewoJcmV0dXJuIG1pcGlfY3Npc19wbV9yZXN1bWUoZGV2LCB0
cnVlKTsKfQoKc3RhdGljIGNvbnN0IHN0cnVjdCBkZXZfcG1fb3BzIG1pcGlfY3Npc19wbV9vcHMg
PSB7CglTRVRfUlVOVElNRV9QTV9PUFMobWlwaV9jc2lzX3J1bnRpbWVfc3VzcGVuZCwgbWlwaV9j
c2lzX3J1bnRpbWVfcmVzdW1lLAoJCQkgICBOVUxMKQoJU0VUX1NZU1RFTV9TTEVFUF9QTV9PUFMo
bWlwaV9jc2lzX3N1c3BlbmQsIG1pcGlfY3Npc19yZXN1bWUpCn07CgovKiAtLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQogKiBQcm9iZS9yZW1vdmUgJiBwbGF0Zm9ybSBkcml2ZXIKICovCgpzdGF0aWMgaW50
IG1pcGlfY3Npc19zdWJkZXZfaW5pdChzdHJ1Y3QgY3NpX3N0YXRlICpzdGF0ZSkKewoJc3RydWN0
IHY0bDJfc3ViZGV2ICpzZCA9ICZzdGF0ZS0+c2Q7CgoJdjRsMl9zdWJkZXZfaW5pdChzZCwgJm1p
cGlfY3Npc19zdWJkZXZfb3BzKTsKCXNkLT5vd25lciA9IFRISVNfTU9EVUxFOwoJc25wcmludGYo
c2QtPm5hbWUsIHNpemVvZihzZC0+bmFtZSksICIlcy4lZCIsCgkJIENTSVNfU1VCREVWX05BTUUs
IHN0YXRlLT5pbmRleCk7CgoJc2QtPmZsYWdzIHw9IFY0TDJfU1VCREVWX0ZMX0hBU19ERVZOT0RF
OwoJc2QtPmN0cmxfaGFuZGxlciA9IE5VTEw7CgoJc2QtPmVudGl0eS5mdW5jdGlvbiA9IE1FRElB
X0VOVF9GX1ZJRF9JRl9CUklER0U7CglzZC0+ZW50aXR5Lm9wcyA9ICZtaXBpX2NzaXNfZW50aXR5
X29wczsKCglzZC0+ZGV2ID0gc3RhdGUtPmRldjsKCglzdGF0ZS0+Y3Npc19mbXQgPSAmbWlwaV9j
c2lzX2Zvcm1hdHNbMF07CgltaXBpX2NzaTJfaW5pdF9jZmcoc2QsIE5VTEwpOwoKCXN0YXRlLT5w
YWRzW0NTSVNfUEFEX1NJTktdLmZsYWdzID0gTUVESUFfUEFEX0ZMX1NJTksKCQkJCQkgfCBNRURJ
QV9QQURfRkxfTVVTVF9DT05ORUNUOwoJc3RhdGUtPnBhZHNbQ1NJU19QQURfU09VUkNFXS5mbGFn
cyA9IE1FRElBX1BBRF9GTF9TT1VSQ0UKCQkJCQkgICB8IE1FRElBX1BBRF9GTF9NVVNUX0NPTk5F
Q1Q7CglyZXR1cm4gbWVkaWFfZW50aXR5X3BhZHNfaW5pdCgmc2QtPmVudGl0eSwgQ1NJU19QQURT
X05VTSwKCQkJCSAgICAgIHN0YXRlLT5wYWRzKTsKfQoKLyogVE9ETyBuZWVkZWQ/ICovCnN0YXRp
YyBpbnQgbWlwaV9jc2lzX3BhcnNlX2R0KHN0cnVjdCBjc2lfc3RhdGUgKnN0YXRlKQp7CglzdHJ1
Y3QgZGV2aWNlX25vZGUgKm5vZGUgPSBzdGF0ZS0+ZGV2LT5vZl9ub2RlOwoKCXJldHVybiAwOwp9
CgpzdGF0aWMgaW50IG1pcGlfY3Npc19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQp7CglzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2OwoJc3RydWN0IGNzaV9zdGF0ZSAq
c3RhdGU7CglpbnQgcmV0OwoKCXN0YXRlID0gZGV2bV9remFsbG9jKGRldiwgc2l6ZW9mKCpzdGF0
ZSksIEdGUF9LRVJORUwpOwoJaWYgKCFzdGF0ZSkKCQlyZXR1cm4gLUVOT01FTTsKCgltdXRleF9p
bml0KCZzdGF0ZS0+bG9jayk7CgoJc3RhdGUtPmRldiA9IGRldjsKCgkvKiBQYXJzZSBEVCBwcm9w
ZXJ0aWVzLiAqLwoJcmV0ID0gbWlwaV9jc2lzX3BhcnNlX2R0KHN0YXRlKTsKCWlmIChyZXQgPCAw
KSB7CgkJZGV2X2VycihkZXYsICJGYWlsZWQgdG8gcGFyc2UgZGV2aWNlIHRyZWU6ICVkXG4iLCBy
ZXQpOwoJCXJldHVybiByZXQ7Cgl9CgoJLyogQWNxdWlyZSByZXNvdXJjZXMuICovCglzdGF0ZS0+
cmVncyA9IGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZShwZGV2LCAwKTsKCWlmIChJU19F
UlIoc3RhdGUtPnJlZ3MpKQoJCXJldHVybiBQVFJfRVJSKHN0YXRlLT5yZWdzKTsKCglyZXQgPSBt
aXBpX2NzaXNfY2xrX2dldChzdGF0ZSk7CglpZiAocmV0IDwgMCkKCQlyZXR1cm4gcmV0OwoKCXJl
dCA9IG1pcGlfY3Npc19jbGtfZW5hYmxlKHN0YXRlKTsKCWlmIChyZXQgPCAwKSB7CgkJZGV2X2Vy
cihzdGF0ZS0+ZGV2LCAiZmFpbGVkIHRvIGVuYWJsZSBjbG9ja3M6ICVkXG4iLCByZXQpOwoJCXJl
dHVybiByZXQ7Cgl9CgoJLyogSW5pdGlhbGl6ZSBhbmQgcmVnaXN0ZXIgdGhlIHN1YmRldi4gKi8K
CXJldCA9IG1pcGlfY3Npc19zdWJkZXZfaW5pdChzdGF0ZSk7CglpZiAocmV0IDwgMCkKCQlnb3Rv
IGRpc2FibGVfY2xvY2s7CgoJcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgJnN0YXRlLT5zZCk7
CgoJcmV0ID0gbWlwaV9jc2lzX2FzeW5jX3JlZ2lzdGVyKHN0YXRlKTsKCWlmIChyZXQgPCAwKSB7
CgkJZGV2X2VycihkZXYsICJhc3luYyByZWdpc3RlciBmYWlsZWQ6ICVkXG4iLCByZXQpOwoJCWdv
dG8gY2xlYW51cDsKCX0KCgkvKiBFbmFibGUgcnVudGltZSBQTS4gKi8KCXBtX3J1bnRpbWVfZW5h
YmxlKGRldik7CglpZiAoIXBtX3J1bnRpbWVfZW5hYmxlZChkZXYpKSB7CgkJcmV0ID0gbWlwaV9j
c2lzX3BtX3Jlc3VtZShkZXYsIHRydWUpOwoJCWlmIChyZXQgPCAwKQoJCQlnb3RvIGNsZWFudXA7
Cgl9CgoJZGV2X2luZm8oZGV2LCAibGFuZXM6ICVkXG4iLCBzdGF0ZS0+YnVzLm51bV9kYXRhX2xh
bmVzKTsKCglyZXR1cm4gMDsKCmNsZWFudXA6CgltZWRpYV9lbnRpdHlfY2xlYW51cCgmc3RhdGUt
PnNkLmVudGl0eSk7Cgl2NGwyX2FzeW5jX25vdGlmaWVyX3VucmVnaXN0ZXIoJnN0YXRlLT5ub3Rp
Zmllcik7Cgl2NGwyX2FzeW5jX25vdGlmaWVyX2NsZWFudXAoJnN0YXRlLT5ub3RpZmllcik7Cgl2
NGwyX2FzeW5jX3VucmVnaXN0ZXJfc3ViZGV2KCZzdGF0ZS0+c2QpOwpkaXNhYmxlX2Nsb2NrOgoJ
bWlwaV9jc2lzX2Nsa19kaXNhYmxlKHN0YXRlKTsKCW11dGV4X2Rlc3Ryb3koJnN0YXRlLT5sb2Nr
KTsKCglyZXR1cm4gcmV0Owp9CgpzdGF0aWMgaW50IG1pcGlfY3Npc19yZW1vdmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldikKewoJc3RydWN0IHY0bDJfc3ViZGV2ICpzZCA9IHBsYXRmb3Jt
X2dldF9kcnZkYXRhKHBkZXYpOwoJc3RydWN0IGNzaV9zdGF0ZSAqc3RhdGUgPSBtaXBpX3NkX3Rv
X2NzaXNfc3RhdGUoc2QpOwoKCXY0bDJfYXN5bmNfbm90aWZpZXJfdW5yZWdpc3Rlcigmc3RhdGUt
Pm5vdGlmaWVyKTsKCXY0bDJfYXN5bmNfbm90aWZpZXJfY2xlYW51cCgmc3RhdGUtPm5vdGlmaWVy
KTsKCXY0bDJfYXN5bmNfdW5yZWdpc3Rlcl9zdWJkZXYoJnN0YXRlLT5zZCk7CgoJcG1fcnVudGlt
ZV9kaXNhYmxlKCZwZGV2LT5kZXYpOwoJbWlwaV9jc2lzX3BtX3N1c3BlbmQoJnBkZXYtPmRldiwg
dHJ1ZSk7CgltaXBpX2NzaXNfY2xrX2Rpc2FibGUoc3RhdGUpOwoJbWVkaWFfZW50aXR5X2NsZWFu
dXAoJnN0YXRlLT5zZC5lbnRpdHkpOwoJbXV0ZXhfZGVzdHJveSgmc3RhdGUtPmxvY2spOwoJcG1f
cnVudGltZV9zZXRfc3VzcGVuZGVkKCZwZGV2LT5kZXYpOwoKCXJldHVybiAwOwp9CgpzdGF0aWMg
Y29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBtaXBpX2NzaXNfb2ZfbWF0Y2hbXSA9IHsKCXsgLmNv
bXBhdGlibGUgPSAiZnNsLGlteDhtcS1taXBpLWNzaTIiLH0sCgl7IC8qIHNlbnRpbmVsICovIH0s
Cn07Ck1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIG1pcGlfY3Npc19vZl9tYXRjaCk7CgpzdGF0aWMg
c3RydWN0IHBsYXRmb3JtX2RyaXZlciBtaXBpX2NzaXNfZHJpdmVyID0gewoJLnByb2JlCQk9IG1p
cGlfY3Npc19wcm9iZSwKCS5yZW1vdmUJCT0gbWlwaV9jc2lzX3JlbW92ZSwKCS5kcml2ZXIJCT0g
ewoJCS5vZl9tYXRjaF90YWJsZSA9IG1pcGlfY3Npc19vZl9tYXRjaCwKCQkubmFtZQkJPSBDU0lT
X0RSSVZFUl9OQU1FLAoJCS5wbQkJPSAmbWlwaV9jc2lzX3BtX29wcywKCX0sCn07Cgptb2R1bGVf
cGxhdGZvcm1fZHJpdmVyKG1pcGlfY3Npc19kcml2ZXIpOwoKTU9EVUxFX0RFU0NSSVBUSU9OKCJp
Lk1YOE1RIE1JUEkgQ1NJLTIgcmVjZWl2ZXIgZHJpdmVyIik7Ck1PRFVMRV9MSUNFTlNFKCJHUEwg
djIiKTsKTU9EVUxFX0FMSUFTKCJwbGF0Zm9ybTppbXg4bXEtbWlwaS1jc2kyIik7Cg==


--=-YRESJibxgvGpEPGuPuzK--


