Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB78C6D3261
	for <lists+linux-media@lfdr.de>; Sat,  1 Apr 2023 17:28:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229538AbjDAP2K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Apr 2023 11:28:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjDAP2J (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Apr 2023 11:28:09 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FFAB1E73D
        for <linux-media@vger.kernel.org>; Sat,  1 Apr 2023 08:28:07 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id cj15so16962695qtb.5
        for <linux-media@vger.kernel.org>; Sat, 01 Apr 2023 08:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112; t=1680362886;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DniKdMjY/ZXiWG4Rr8bTykeSjt897IFpe4FHAfn2mwM=;
        b=77eWsgBO2iY/OSNNtMhAhMwrqTVKj/Ye7JZBFk6U5fNkxxqNNnWeVmf67iihfey+pL
         y0e9Gp8GzcozXjaWaSJclOkhyfYmMk11a7ToXLT/5POkz/XFLd6ZNBwUuBHs/NCzMlnX
         9DdtqEUFx+a8HEL7fAUFcsaU9EDIeSUV6kTk210j3NPfEcGd7uv+nHfI+Jbau+E3NEac
         gbXiiiApZ9ZUaXDQE9ruwOV3hASg1F0KhXd5LLYWvHUIkTnTfpTvyxnhCou6mYZohX4N
         Fu/UTIgO48UXXR+j7S7Y1nBDoRzaPHi6eOkWuSFo0n7jZE+7PQqqCmbehrTQVnD/RX5A
         7rXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680362886;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DniKdMjY/ZXiWG4Rr8bTykeSjt897IFpe4FHAfn2mwM=;
        b=C7pHebVZNipsrP7Vcd0FdGcu1OPCn3cuzwHQf4f6q9n4sacJFr4ANhqtd/29uglwBY
         pdgsL+o99lID72Kl9ODQcofxHN55qrSQsKXKk4MByWF2sHNElMJbNMqITn3A3HXgYUEN
         0/jQ9DD2GABa6/uwHbr5amIh3ZcxkCDD4Up/TunRFEGon8jmPVq8Sf1kndBlQy++mLHM
         P3GoxxE/KPk2b1pwr6XUVZbaPquCxIAvMTcSlAAQlOf+XxOZOE8AwHha2PT700xXPOji
         i8G9W8+WzLXJah4MprsYBTnFzaDcxtx53up+yPEdKUPA02fnJcAKYUgunjG/bZY47kxE
         y+cw==
X-Gm-Message-State: AO0yUKUh/zbYgDd+1Lo7lWr4iTpyAFKZlo7pHoCuHYPOSXf1f8SE4HGD
        OHnBGaL30fWrvDLu7/lsVMyU1nvepCMrxUaVXBaaUg==
X-Google-Smtp-Source: AK7set/T3tKL3E2WCw/4JciIB4Juddip9EwSk3paV6/pvHD6kybzKqRSuxrEeloKdNzZEBKHwei5ZQ==
X-Received: by 2002:a05:622a:647:b0:3bf:d9ee:882d with SMTP id a7-20020a05622a064700b003bfd9ee882dmr48395644qtb.40.1680362886107;
        Sat, 01 Apr 2023 08:28:06 -0700 (PDT)
Received: from nicolas-tpx395.localdomain ([2606:6d00:15:a07e::580])
        by smtp.gmail.com with ESMTPSA id f11-20020ac8470b000000b003e3860f12f7sm454683qtp.56.2023.04.01.08.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Apr 2023 08:28:05 -0700 (PDT)
Message-ID: <415e2013019e8f4b2193130050d6123e469782ca.camel@ndufresne.ca>
Subject: Re: [RFC PATCH] media: hantro: respect data_offset in vb2_plane
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Michael Tretter <m.tretter@pengutronix.de>
Cc:     ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Date:   Sat, 01 Apr 2023 11:28:04 -0400
In-Reply-To: <20230331162449.GF7238@pengutronix.de>
References: <20230327132324.1781416-1-m.tretter@pengutronix.de>
         <1f1a5acbd8951cfec250b78fff5a9fec731c3488.camel@ndufresne.ca>
         <20230331162449.GF7238@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le vendredi 31 mars 2023 =C3=A0 18:24 +0200, Michael Tretter a =C3=A9crit=
=C2=A0:
> Hi Nicolas,
>=20
> On Fri, 31 Mar 2023 11:07:44 -0400, Nicolas Dufresne wrote:
> > Le lundi 27 mars 2023 =C3=A0 15:23 +0200, Michael Tretter a =C3=A9crit=
=C2=A0:
> > > The vb2_plane in the vb2_v4l2_buffer may have a data_offset, which is
> > > written by user space to tell the driver that the data starts at an
> > > offset into the buffer. Currently the hantro driver assumes that the
> > > data starts directly at the base address of the buffer.
> > >=20
> > > Add the data_offset to the plane dma_address to make sure that the
> > > encoder actually reads the plane data if the user space put the plane
> > > data at an offset into the buffer. Otherwise the encoded data may not=
 be
> > > the data that userspace expected to be encoded.
> > >=20
> >=20
> > The data_offset for this purpose have limited use, and this usage is on=
ly valid
> > for encoders (OUTPUT queues). Would it be possible to state this clearl=
y in the
> > subject ?
>=20
> I'll update the subject.
>=20
> >=20
> > >=20
> > > Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> > > ---
> > > Hi,
> > >=20
> > > Most other drivers also assume that the address returned by
> > > vb2_dma_contig_plane_dma_addr() is the start of the plane data. Maybe=
 it
> > > would be better to change vb2_dma_contig_plane_dma_addr() to already =
add
> > > the data_offset to the plane address. However, there are a few driver=
s
> > > that already have a helper that respects the data_offset, but that se=
ems
> > > to be the exception rather than the rule.
> >=20
> > I had this discussion recently, and its a bit hardware specific. Some H=
W may
> > support any random offset, in which case you will program the original =
(and
> > aligned) address, and program the offset in the HW. But some HW may not=
, in
> > which case you need to add alignment validation in the driver.
>=20
> This makes sense, but it's still a bit surprising that some drivers don't
> respect the data_offset. Maybe there should be a check that warns or retu=
rns
> an error to userspace if the data_offset is set but ignored by the driver=
?
> With such an error, the behavior of vb2_dma_contig_plane_dma_addr() would=
 be
> obvious. OTOH, the warning would have to be added in the driver, too.

I would not be surprised if this is yet another "after the fact" API, or th=
at we
didn't realize that by adding it, it became mandatory, Hans has been adding
capability flags for all the old one. My suggestion, cause there is no way =
we
can fix all the drivers is to introduce:

  V4L2_BUF_CAP_SUPPORTS_DATA_OFFSET

At least we could fix userspace to avoid it if its not set. By the way, you=
'd be
impressed how many time we "fixed" GPU and Display drivers because they for=
got
to take an offset into account.

>=20
> >=20
> > >=20
> > > What I am actually trying to achieve is to import a V4L2_PIX_FMT_NV12
> > > buffer from a Rockchip RGA2 (which doesn't support the multi-planar A=
PI)
> > > as a V4L2_PIX_FMT_NV12M buffer into the Hantro JPEG encoder (which
> > > doesn't support V4L2_PIX_FMT_NV12). Solving this by importing the sam=
e
> > > FD for each plane with a respective offset is how one would import su=
ch
> > > a buffer with the DRM API. Please tell me, if my approach is wrong an=
d,
> > > if so, how I should solve it differently.
> >=20
> > The approach is fine, this is the only valid usage of data_offset when =
passed by
> > userspace. Though, you are making your live much more difficult then ne=
eded,
> > adding NV12 (contiguous) support to the jpeg encoder should be fairly e=
asy too.
>=20
> It is fairly easy to add this in the driver, but the negotiation in GStre=
amer
> is becomes a bit cumbersome as the caps don't distinguish between
> V4L2_PIX_FMT_NV12 and V4L2_PIX_FMT_NV12M and the encoder will prefer
> V4L2_PIX_FMT_NV12M if NV12 is negotiated. Letting userspace explicitly st=
ate
> the offset of the second plane makes things easier as well. Thus, I disca=
rded
> the option of adding NV12 contiguous support to this encoder.
>=20

By the way, currently encoder imports only works by pure luck. You have to =
fix
GStreamer video encoder, the authors (yes I'm on of them) forgot to apply t=
he
alignment from the imported buffers, so sometimes that padding will screw-u=
p
your image. In short, it completely ignores the incoming bytesperline, whic=
h is
a terrible idea. Guillaume Desmottes introduced a try_import() function tha=
t
update the FMT and SELECTION with the padding.

https://gitlab.freedesktop.org/gstreamer/gstreamer/-/blob/main/subprojects/=
gst-plugins-good/sys/v4l2/gstv4l2object.c#L5372

For CAPTURE queues (his use case was v4l2src), this is handled by the buffe=
r
pool already:

https://gitlab.freedesktop.org/gstreamer/gstreamer/-/blob/main/subprojects/=
gst-plugins-good/sys/v4l2/gstv4l2bufferpool.c#L796

But for OUTPUT queue (sink pads), it has to be handled by the element, like
v4l2transform does today (in theory, we should also re-validate every buffe=
r, in
case it changes, but V4L2 allocator makes the fallback impractical):

https://gitlab.freedesktop.org/gstreamer/gstreamer/-/blob/main/subprojects/=
gst-plugins-good/sys/v4l2/gstv4l2transform.c#L909

But you'll see this is missing here:

https://gitlab.freedesktop.org/gstreamer/gstreamer/-/blob/main/subprojects/=
gst-plugins-good/sys/v4l2/gstv4l2videoenc.c#L742

DMAbuf importation in this plugin is highly experimental, and missing a lot=
 of
bits (and may also fail to detect some of the V4L2 API limitations). So far=
,
folks have been adding bits they need, the challenge in adding everything i=
s
that most folks can't actually test it. And so you are warned now, you'll k=
now
what to do if it fails randomly on you with a completely broken image.

I personally think its great that you fix that data_offset here, but clearl=
y
GStreamer use of it will generally not work until we patch all drivers that
literally don't support it to fail QBUF. But that won't make it great, as
userspace won't have a clue if it could have switch NV12M -> NV12.=20

I think updating this function, which purpose is exactly that, to prefer
changing the format to NV12 rather then padding the same dmabuf N times thr=
ough
NV12M would improve a lot the general import support.

https://gitlab.freedesktop.org/gstreamer/gstreamer/-/blob/main/subprojects/=
gst-plugins-good/sys/v4l2/gstv4l2object.c#L4766

Hope this is useful information for the success of your project. In any cas=
es,
your patches are part of the right direction, and one step further.

>=20
> >=20
> > >=20
> > > Michael
> > > ---
> > >  .../verisilicon/rockchip_vpu2_hw_jpeg_enc.c   | 24 +++++++++++++----=
--
> > >  1 file changed, 17 insertions(+), 7 deletions(-)
> > >=20
> > > diff --git a/drivers/media/platform/verisilicon/rockchip_vpu2_hw_jpeg=
_enc.c b/drivers/media/platform/verisilicon/rockchip_vpu2_hw_jpeg_enc.c
> > > index 8395c4d48dd0..05df7768187d 100644
> > > --- a/drivers/media/platform/verisilicon/rockchip_vpu2_hw_jpeg_enc.c
> > > +++ b/drivers/media/platform/verisilicon/rockchip_vpu2_hw_jpeg_enc.c
> > > @@ -32,6 +32,16 @@
> > > =20
> > >  #define VEPU_JPEG_QUANT_TABLE_COUNT 16
> > > =20
> > > +static dma_addr_t rockchip_vpu2_plane_dma_addr(struct vb2_buffer *vb=
,
> > > +					       unsigned int plane_no)
> > > +{
> > > +	struct vb2_v4l2_buffer *v4l2_buf =3D to_vb2_v4l2_buffer(vb);
> > > +	dma_addr_t base =3D vb2_dma_contig_plane_dma_addr(vb, plane_no);
> > > +	unsigned int offset =3D v4l2_buf->planes[plane_no].data_offset;
> > > +
> > > +	return base + offset;
> >=20
> > As the offset is not being passed as a control to the HW, you need to g=
o back to
> > the datasheet, and figure-out what is the required alignment. This alig=
ment then
> > needs to be validated. I don't know the exact answer for you, we don't =
check the
> > dma address because they are all page aligned, so its not needed.
> >=20
> > If the alignment is not acceptable, you have to fail synchronously in
> > VIDIOC_QBUF, so that userspace knows and can fallback to copy.
>=20
> I will add the necessary checks and send a proper version of the patch.
>=20
> Thanks a lot!
>=20
> Michael
>=20

Thanks to you,
Nicolas

>=20
>=20
> >=20
> > > +}
> > > +
> > >  static void rockchip_vpu2_set_src_img_ctrl(struct hantro_dev *vpu,
> > >  					   struct hantro_ctx *ctx)
> > >  {
> > > @@ -79,23 +89,23 @@ static void rockchip_vpu2_jpeg_enc_set_buffers(st=
ruct hantro_dev *vpu,
> > > =20
> > >  	WARN_ON(pix_fmt->num_planes > 3);
> > > =20
> > > -	vepu_write_relaxed(vpu, vb2_dma_contig_plane_dma_addr(dst_buf, 0) +
> > > +	vepu_write_relaxed(vpu, rockchip_vpu2_plane_dma_addr(dst_buf, 0) +
> > >  				ctx->vpu_dst_fmt->header_size,
> > >  			   VEPU_REG_ADDR_OUTPUT_STREAM);
> > >  	vepu_write_relaxed(vpu, size_left, VEPU_REG_STR_BUF_LIMIT);
> > > =20
> > >  	if (pix_fmt->num_planes =3D=3D 1) {
> > > -		src[0] =3D vb2_dma_contig_plane_dma_addr(src_buf, 0);
> > > +		src[0] =3D rockchip_vpu2_plane_dma_addr(src_buf, 0);
> > >  		vepu_write_relaxed(vpu, src[0], VEPU_REG_ADDR_IN_PLANE_0);
> > >  	} else if (pix_fmt->num_planes =3D=3D 2) {
> > > -		src[0] =3D vb2_dma_contig_plane_dma_addr(src_buf, 0);
> > > -		src[1] =3D vb2_dma_contig_plane_dma_addr(src_buf, 1);
> > > +		src[0] =3D rockchip_vpu2_plane_dma_addr(src_buf, 0);
> > > +		src[1] =3D rockchip_vpu2_plane_dma_addr(src_buf, 1);
> > >  		vepu_write_relaxed(vpu, src[0], VEPU_REG_ADDR_IN_PLANE_0);
> > >  		vepu_write_relaxed(vpu, src[1], VEPU_REG_ADDR_IN_PLANE_1);
> > >  	} else {
> > > -		src[0] =3D vb2_dma_contig_plane_dma_addr(src_buf, 0);
> > > -		src[1] =3D vb2_dma_contig_plane_dma_addr(src_buf, 1);
> > > -		src[2] =3D vb2_dma_contig_plane_dma_addr(src_buf, 2);
> > > +		src[0] =3D rockchip_vpu2_plane_dma_addr(src_buf, 0);
> > > +		src[1] =3D rockchip_vpu2_plane_dma_addr(src_buf, 1);
> > > +		src[2] =3D rockchip_vpu2_plane_dma_addr(src_buf, 2);
> > >  		vepu_write_relaxed(vpu, src[0], VEPU_REG_ADDR_IN_PLANE_0);
> > >  		vepu_write_relaxed(vpu, src[1], VEPU_REG_ADDR_IN_PLANE_1);
> > >  		vepu_write_relaxed(vpu, src[2], VEPU_REG_ADDR_IN_PLANE_2);
> >=20
> >=20

