Return-Path: <linux-media+bounces-8984-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0B389EF9E
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 12:09:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 616571F21235
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 10:09:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82307158207;
	Wed, 10 Apr 2024 10:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mail.tikatika.nl header.i=@mail.tikatika.nl header.b="XVMsdjCg"
X-Original-To: linux-media@vger.kernel.org
Received: from tika.stderr.nl (tika.stderr.nl [94.142.244.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD55D4D59F;
	Wed, 10 Apr 2024 10:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.142.244.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712743766; cv=none; b=o5BvAvovLskA4LbVM6JWHYD4MIMNJDck7sAyhVcogEsaVtloLiKtocXcW4Br4WF89LambO7tvrrG2MHFoeWBIfO3Eg43Bqwc+9NjJCHpp90oDZM5nmVNVudLF2ZL2tqI2EbAroYa5CajgxA+X4pmOECsot9V4jf7drLM7N2DOjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712743766; c=relaxed/simple;
	bh=vO6cDUbWofNcXI7vcWnltL8/dFxFw179aPW9H2eOPyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q+ZkoNhmfwj/u38oxDATamwWKUS+Z2QkUT3/zRQmUj78HH0/gP7nsnsuLQpsssDR+bES3cWWfVlJF1tRwarwaNRgPyk2XO/EWmtN2RNe58Vov8pLRUIpQq3LV4jRpHH1GI5y4dAAXWkcOKk4ZehBiuCVLLNhSX62xhOYhmJuVqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stdin.nl; spf=fail smtp.mailfrom=stdin.nl; dkim=pass (1024-bit key) header.d=mail.tikatika.nl header.i=@mail.tikatika.nl header.b=XVMsdjCg; arc=none smtp.client-ip=94.142.244.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stdin.nl
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=stdin.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mail.tikatika.nl; s=201709.tika; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=By0+hdO0zIvU3a4laGl59jYpM/uus1pQ33Oot82bbQU=; b=XVMsdjCg7PJAcRuX9VS4MkM+jg
	7SRwl/e634R1PML21iLRNIg7l9MMH9v8/QzFchZAWZCyLoLasgUzCkb8cE9iE5JCeqZNJVWn1w4C3
	8gGh+jWPaGZfqvr4LF213AgRgO7gPBNERSTmBwhKvuw3G6d81rKJ97RME7A+afwUYIOE=;
X-Preliminary-Spam-Score: -1.3 (-)
Received: from [10.42.0.16] (helo=login.tika.stderr.nl)
	by tika.stderr.nl with smtp (Exim 4.96)
	(envelope-from <matthijs@stdin.nl>)
	id 1ruUtD-002PIm-0K;
	Wed, 10 Apr 2024 12:09:11 +0200
Received: (nullmailer pid 689061 invoked by uid 2001);
	Wed, 10 Apr 2024 10:09:10 -0000
Date: Wed, 10 Apr 2024 12:09:10 +0200
From: Matthijs Kooijman <matthijs@stdin.nl>
To: Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, linux-media@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>, Bob Beckett <bob.beckett@collabora.com>, linux-sunxi@lists.linux.dev
Subject: Re: media: cedrus: h264: Decoding fails or produces artifacts
Message-ID: <ZhZlRpqkjMukosw4@login.tika.stderr.nl>
Mail-Followup-To: Matthijs Kooijman <matthijs@stdin.nl>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	linux-media@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Bob Beckett <bob.beckett@collabora.com>,
	linux-sunxi@lists.linux.dev
References: <ZhMNNazVsu8EXqMU@login.tika.stderr.nl>
 <20240410095555.std6q4g223fupkju@basti-XPS-13-9310>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QQzzBhrJ5C6IXQzp"
Content-Disposition: inline
In-Reply-To: <20240410095555.std6q4g223fupkju@basti-XPS-13-9310>
X-PGP-Fingerprint: E7D0 C6A7 5BEE 6D84 D638  F60A 3798 AF15 A156 5658
X-PGP-Key: http://www.stderr.nl/static/files/gpg_pubkey.asc


--QQzzBhrJ5C6IXQzp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sebastian,

On Wed, Apr 10, 2024 at 11:55:55AM +0200, Sebastian Fricke wrote:
> Hey Matthijs,
>=20
> On 07.04.2024 23:16, Matthijs Kooijman wrote:
> > Hi,
> >=20
> > I've been chasing a decoder bug in the cedrus h264 hardware decoder and=
 after a
> > few days have been able to work around it by removing the
> > DMA_ATTR_NO_KERNEL_MAPPING argument when allocating the neighbour info =
dma
> > buffer (full patch at the end of the mail):
> >=20
> > --- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > @@ -581,7 +581,7 @@ static int cedrus_h264_start(struct cedrus_ctx *ctx)
> >        ctx->codec.h264.neighbor_info_buf =3D
> >                dma_alloc_attrs(dev->dev, CEDRUS_NEIGHBOR_INFO_BUF_SIZE,
> >                                &ctx->codec.h264.neighbor_info_buf_dma,
> > -                               GFP_KERNEL, DMA_ATTR_NO_KERNEL_MAPPING);
> > +                               GFP_KERNEL, 0);
> >=20
> > This does not seem like a proper fix to me (or maybe it is - I do not r=
eally
> > understand the problem yet), but it very effective.
>=20
> thanks for the patch, I don't think we can take it as due to, as you
> highlighted, it relies on unknown side effects. Perhaps if you or
> someone else in the community can investigate this further and answer
> some more questions we can move it forward.
>=20
> Some questions to help move the discussions along:
>=20
> - Does the platform have an IOMMU?
> - What does the IOMMU driver do when it sees the
>   DMA_ATTR_NO_KERNEL_MAPPING flag?
> - On the platform in question do coherent allocations get handled with
>   cached snooped mappings or uncached?
> - Does changing that flag affect any cacheablility
> - Does the codec block expect any particular intialized data in that
>   buffer?

I have no idea about any of these, but I agree that they are good
questions to ask.

I've CC'd linux-sunxi@lists.linux.dev in this mail, maybe someone there
can answer these questions for the Allwinner H3 platform.


> > The actual problem is that sometimes (about 10%-50%) the first frame
> > of a h264 stream incorrectly decodes, producing all-zero data in the bo=
ttom
> > part of the frame. See attached error-green.png for an example. In some=
 even
> > more rare cases, more subtle decoding errors would occur, for example a=
 lighter
> > rectangle in the bottom left dark blue band in error-blue-bar.png, or s=
ome
> > misplaced pixels in the bottom right "noise" area (compare error-noise.=
png with
> > error-blue-bar.png to see).
> >=20
> > To reproduce:
> >=20
> > 	# Create a h264-encoded 320x240 single-frame stream
> > 	gst-launch-1.0 videotestsrc num-buffers=3D1 ! openh264enc ! filesink l=
ocation=3Dtest.h264
> > 	# Decode it again using hardware decoding (repeat until seeing a broke=
n frame)
> > 	gst-launch-1.0 filesrc location=3Dtest.h264 ! v4l2slh264dec ! videocon=
vert ! pngenc ! filesink location=3Dtest.png
> >=20
> > I've been testing on an Orange Pi PC with an allwinner H3 running
> > Armbian 22.04 (based on Ubuntu Jammy), a 6.7.12 kernel (mostly with
> > Armbian-patched, but also clean mainline) and gstreamer
> > 1.20.3. The problem also occurred on older kernel versions (tested clean
> > mainline down to 6.2 and then a bit earlier, but 6.1 mainline would
> > not boot for me). I have also observed the problem (or at least the same
> > symptom) on the Armbian-patched 6.1 kernel, but there it was extremely =
unlikely
> > (saw it once in 700 or so playbacks).
> >=20
> > I've seen three variants of this issue:
> >=20
> > 1. With the 320x240 test pattern, showing the green area in the frame.
> >    In this case, the decoder would actually return an error IRQ status
> >    (VE_H264_STATUS register would be 0x10010003 or 0x70010003, instead
> >    of the normal 0x60000001, bit 0 is VE_H264_STATUS_SLICE_DECODE_INT,
> >    bit 1 is VE_H264_STATUS_DECODE_ERR_INT).
> >=20
> > 2. With the 320x240 test pattern, showing more subtle decoding errors (=
as
> >    shown in attachments).  In these cases, the IRQ status would not ind=
icate a
> >    decoding error.
> >=20
> > 3. With another test video (1920x1080) that I cannot share, there would
> >    be the same green areas (occasionally also green squares splattered
> >    around the frame), but *no* decoding error in the IRQ status.
> >=20
> > None of these three issues occur anymore with the workaround applied (b=
oth on
> > clean 6.7.12 and on top of the Armbian patches), the gstreamer decoding=
 then
> > produces bit-for-bit identical results every time (tested hundreds of
> > decodings).
> >=20
> >=20
> > I have no clue why removing DMA_ATTR_NO_KERNEL_MAPPING from this
> > allocation helps - I just tried it on a whim when I nothing else seemed
> > to help. I suspect that mapping the memory into kernel space might have
> > some side effect that helps, but I am not familiar enough with either
> > the cedrus hardware or the DMA system to tell.
> >=20
> > I initially thought there might be an alignment issue and tried
> > increasing the allocation sizes of all DMA buffers to 256K (which
> > I think enforces a bigger alignment), but that did not help. The reason
> > I was looking at memory allocation (and also timing differences, but no
> > luck there) was that bisecting pointed me at commit fec94f8c995 ("media:
> > cedrus: h264: Optimize mv col buffer allocation") which seemed to make
> > the problem 2-4=D7 likely to occur (but looking back, I think I might h=
ave
> > been bisecting noise there).
> >=20
> >=20
> > I hope you folks can make more sense of this to figure out a proper fix.
> > For the short term my problem is solved (I'll just apply this patch and=
 ship
> > it), so will not be investing more time right now.
> >=20
> > If there's anything I can contribute, just let me know (I have done som=
e tests
> > with extra debug output added to the kernel, and a testscript for repea=
tedly
> > testing the decoding that I could share, and I am happy to test any
> > patches/hypothesis that you have).
> >=20
> > Gr.
> >=20
> > Matthijs
> >=20
> > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers=
/staging/media/sunxi/cedrus/cedrus_h264.c
> > index dfb401df138..7cd3b6a5434 100644
> > --- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > @@ -581,7 +581,7 @@ static int cedrus_h264_start(struct cedrus_ctx *ctx)
> >        ctx->codec.h264.neighbor_info_buf =3D
> >                dma_alloc_attrs(dev->dev, CEDRUS_NEIGHBOR_INFO_BUF_SIZE,
> >                                &ctx->codec.h264.neighbor_info_buf_dma,
> > -                               GFP_KERNEL, DMA_ATTR_NO_KERNEL_MAPPING);
> > +                               GFP_KERNEL, 0);
> >        if (!ctx->codec.h264.neighbor_info_buf) {
> >                ret =3D -ENOMEM;
> >                goto err_pic_buf;
> > @@ -634,7 +634,7 @@ static int cedrus_h264_start(struct cedrus_ctx *ctx)
> >        dma_free_attrs(dev->dev, CEDRUS_NEIGHBOR_INFO_BUF_SIZE,
> >                       ctx->codec.h264.neighbor_info_buf,
> >                       ctx->codec.h264.neighbor_info_buf_dma,
> > -                      DMA_ATTR_NO_KERNEL_MAPPING);
> > +                      0);
> >=20
> > err_pic_buf:
> >        dma_free_attrs(dev->dev, ctx->codec.h264.pic_info_buf_size,
> > @@ -670,7 +670,7 @@ static void cedrus_h264_stop(struct cedrus_ctx *ctx)
> >        dma_free_attrs(dev->dev, CEDRUS_NEIGHBOR_INFO_BUF_SIZE,
> >                       ctx->codec.h264.neighbor_info_buf,
> >                       ctx->codec.h264.neighbor_info_buf_dma,
> > -                      DMA_ATTR_NO_KERNEL_MAPPING);
> > +                      0);
> >        dma_free_attrs(dev->dev, ctx->codec.h264.pic_info_buf_size,
> >                       ctx->codec.h264.pic_info_buf,
> >                       ctx->codec.h264.pic_info_buf_dma,

--QQzzBhrJ5C6IXQzp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMyF3AetYrDfGJ9el6ZMxy91tJYwFAmYWZUEACgkQ6ZMxy91t
JYwJAg//akyFiDBqWNsdF5I/75S+SnnxdynI7bH/doS9JOCi34L9MzLCeQNBPv3u
JmSQNdK30Oer0M8nH2Wi1x9QbVDfiln4wobVsEKjbw3gdopl2p10geKnmAC5nrN+
6u2/7mzJyqcBwRl2sp+pOiMgbHsv+IaJYdn3aaLr7lS8TldTdDlJftdU34patYNB
pUkBADlsMkBKxOGHfjQeILwiQ45/YGG4Rb12cl8HH/uYIBZG7U8Ph/MD1RIpCRBq
v4nNT2wGK10I2KG/vBb1UcXkhMB8QYjwK53mbC56iJtX3v1glFSQwcAKDweViMt6
lBTq6ZxoYN3SeGyTcmyRNNzSVK8qJZCldWlD1fP0JP0qyUg8xjIcYo5Q6OH9Sqz3
R5DZrl5DiNtLHY2ZQ2aBzFC/6vHyjtAxfZlScJWLdJtTRj0B0GscZuKxmccTA+sK
ysKLo217AW6hNQtPsKBy/wTjNKkSIYVwVdj1+ltEpvzWUtquQunojfHDUmpOBqyU
yb6qSZPnOXYfSAGLSt+oRT1e8bE92OM156KtSu0IMu7l3HSA/ajGQ0Ob5MG8/9rS
1t0b93zQPuqxK3fzoSbCAqmtIq1uCB3lZvoNVQPjYwWDoUCT55bhqGRoOoejBrMo
WGcCTdsvqvv18Ugi9XuSrWv3rFVlZCMFog/mqY6LinpUMDCxDCU=
=XxG7
-----END PGP SIGNATURE-----

--QQzzBhrJ5C6IXQzp--

