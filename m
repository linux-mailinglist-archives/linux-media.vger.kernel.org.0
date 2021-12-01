Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F31A4659DD
	for <lists+linux-media@lfdr.de>; Thu,  2 Dec 2021 00:29:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353789AbhLAXct (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Dec 2021 18:32:49 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45700 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343976AbhLAXcs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Dec 2021 18:32:48 -0500
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 25C7BD6E;
        Thu,  2 Dec 2021 00:29:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1638401366;
        bh=UFrJaJwIQHDy5KoDUIM9lpotKomer7zNaYq+5w9eXW8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ZLimrVDA7crdGZgXwIz3Q3wvvpbcWZrcSBfryr0Vx6o+8ELEnJlV2U68jrlA2oxX2
         fX9BA4N5UDUmLuyGys9oQL94YyFfE0ndgbPCAo3bp2+LKjddnM8+sXq61HOjuC2pHw
         mnTE5UwQoRMv5VzxhmDa6EvB+bpADHOyNC+gIQnE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1fe2d411ad7e2b4a9a23d7064a4be43aec5c2f24.camel@collabora.com>
References: <20211120110257.22775-1-dafna.hirschfeld@collabora.com> <YZjrWdrZzyEE8G7g@pendragon.ideasonboard.com> <abc40fe3-6529-17f3-a6d3-4ab741afe849@collabora.com> <YZuNOzlVWteTaNYt@pendragon.ideasonboard.com> <88434c9b-a682-7da5-ce3b-adec28b89471@collabora.com> <YZupE2zKojGCKuTT@pendragon.ideasonboard.com> <d3f7ad1e-4ace-c6e7-db05-9afd92a5e2ef@collabora.com> <1fe2d411ad7e2b4a9a23d7064a4be43aec5c2f24.camel@collabora.com>
Subject: Re: [PATCH] media: rkisp1: remove support for V4L2_PIX_FMT_GREY
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, mchehab@kernel.org
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Date:   Wed, 01 Dec 2021 23:29:24 +0000
Message-ID: <163840136428.3570436.7897802701733761132@Monstersaurus>
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Nicolas Dufresne (2021-12-01 18:14:45)
> Le mercredi 01 d=C3=A9cembre 2021 =C3=A0 09:03 +0200, Dafna Hirschfeld a =
=C3=A9crit=C2=A0:
> >=20
> > On 22.11.21 16:28, Laurent Pinchart wrote:
> > > Hi Dafna,
> > >=20
> > > On Mon, Nov 22, 2021 at 04:21:25PM +0200, Dafna Hirschfeld wrote:
> > > > On 22.11.21 14:29, Laurent Pinchart wrote:
> > > > > On Mon, Nov 22, 2021 at 01:20:47PM +0200, Dafna Hirschfeld wrote:
> > > > > > On 20.11.21 14:34, Laurent Pinchart wrote:
> > > > > > > On Sat, Nov 20, 2021 at 01:02:57PM +0200, Dafna Hirschfeld wr=
ote:
> > > > > > > > When trying to stream on both mainpatch and selfpatch
> > > > > > > > with grey format, I get an iommu page fault.
> > > > > > > > The fault is on the address at the end of the buffer,
> > > > > > > > so it seems that the device is somehow wrongly
> > > > > > > > configured and thinks there is another plane.
> > > > > > >=20
> > > > > > > Could we try to fix that instead ? There are IR sensors for w=
hich the
> > > > > > > GREY format is useful.
> > > > > >=20
> > > > > > Hi, the doc is not very useful so I can try doing a bit trial a=
nd error.
> > > > > > I see that there are several greyscale formats: [1]
> > > > > > which make me think that maybe the device support one of the ot=
her greyscale formats.
> > > > > > Do you know if some formats are more likely than other?
> > > > >=20
> > > > > GREY seems the most likely (useful for IR sensors for instance, a=
fter
> > > > > ISP processing). Formats with a higher bpp would require processi=
ng of
> > > > > more than 8bpp through the ISP pipeline, I don't know if that's
> > > > > supported.
> >=20
> > I tried all kind of things but was not able to stream greyscale.
> > When ISP processing works it outputs YUV 422 format and then the resizer
> > is used to change the format to YUV 420 if wanted.
> > I tried to chance the scale to YUV 400 (grey) or change the mainpath/se=
lfpath
> > configuration but still had that iommu page fault errors.
> >=20
> > Interestingly when I bypass the iommu and dma allocation is direct
> > the streaming works and even the output frames seems okayish greyscale =
format
> > but that might be by accident.
>=20
> Just a guess, but its possible they use a short cut to gray scale, and wr=
ite to
> NV12 buffers. planar YUV 420 are somewhat compatible with grayscale, so t=
hat's
> always a possible cheat.

NV12 would be a pain, as it would require bigger buffers to be provided
for the capture, which if coming from an external source rather than
allocated on the device might not be given ...

Is there an explicit way to configure the UV plane on the RKISP to an
internal scratch buffer that would get discarded? or will it always
assume the UV data is immediately after the Y data?

--
Kieran


> > > > > Formats with a higher bpp (both greyscale and bayer formats) are =
also
> > > > > useful to capture raw images (before ISP processing). Is that som=
ething
> > > > > the hardware and driver support ?
> > > >=20
> > > > hi, yes the variations of V4L2_PIX_FMT_Sxxxx10, V4L2_PIX_FMT_Sxxxx12
> > > > are supported on mainpath.
> > >=20
> > > That's nice. Does it bypass the whole ISP then ? Is it possible to
> > > capture raw frames on the main path and processed frames on the self
> > > path at the same time, or are we restricted to raw only when we captu=
re
> > > raw frames ?
> >=20
> > I think we are restricted to raw only when we capture raw frames.
> > The doc describe the isp_ctl register that set the isp output to either=
 raw or yuv.
> > It seems not to be possible to send raw to mainpath and yuv to selfpath.
> >=20
> > Thanks,
> > Dafna
> >=20
> > >=20
> > > > > > [1] https://www.kernel.org/doc/html/latest/userspace-api/media/=
v4l/pixfmt-yuv-luma.html
> > > > > >=20
> > > > > > > > Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora=
.com>
> > > > > > > > ---
> > > > > > > >     .../platform/rockchip/rkisp1/rkisp1-capture.c     | 15 =
---------------
> > > > > > > >     1 file changed, 15 deletions(-)
> > > > > > > >=20
> > > > > > > > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-=
capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> > > > > > > > index 768987d5f2dd..7f78f361dd5e 100644
> > > > > > > > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture=
.c
> > > > > > > > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture=
.c
> > > > > > > > @@ -116,13 +116,6 @@ static const struct rkisp1_capture_fmt=
_cfg rkisp1_mp_fmts[] =3D {
> > > > > > > >                   .write_format =3D RKISP1_MI_CTRL_MP_WRITE=
_YUV_PLA_OR_RAW8,
> > > > > > > >                   .mbus =3D MEDIA_BUS_FMT_YUYV8_2X8,
> > > > > > > >           },
> > > > > > > > - /* yuv400 */
> > > > > > > > - {
> > > > > > > > -         .fourcc =3D V4L2_PIX_FMT_GREY,
> > > > > > > > -         .uv_swap =3D 0,
> > > > > > > > -         .write_format =3D RKISP1_MI_CTRL_MP_WRITE_YUV_PLA=
_OR_RAW8,
> > > > > > > > -         .mbus =3D MEDIA_BUS_FMT_YUYV8_2X8,
> > > > > > > > - },
> > > > > > > >           /* yuv420 */
> > > > > > > >           {
> > > > > > > >                   .fourcc =3D V4L2_PIX_FMT_NV21,
> > > > > > > > @@ -244,14 +237,6 @@ static const struct rkisp1_capture_fmt=
_cfg rkisp1_sp_fmts[] =3D {
> > > > > > > >                   .output_format =3D RKISP1_MI_CTRL_SP_OUTP=
UT_YUV422,
> > > > > > > >                   .mbus =3D MEDIA_BUS_FMT_YUYV8_2X8,
> > > > > > > >           },
> > > > > > > > - /* yuv400 */
> > > > > > > > - {
> > > > > > > > -         .fourcc =3D V4L2_PIX_FMT_GREY,
> > > > > > > > -         .uv_swap =3D 0,
> > > > > > > > -         .write_format =3D RKISP1_MI_CTRL_SP_WRITE_PLA,
> > > > > > > > -         .output_format =3D RKISP1_MI_CTRL_SP_OUTPUT_YUV40=
0,
> > > > > > > > -         .mbus =3D MEDIA_BUS_FMT_YUYV8_2X8,
> > > > > > > > - },
> > > > > > > >           /* rgb */
> > > > > > > >           {
> > > > > > > >                   .fourcc =3D V4L2_PIX_FMT_XBGR32,
> > >=20
> >=20
>
