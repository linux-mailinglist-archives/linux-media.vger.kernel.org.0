Return-Path: <linux-media+bounces-8801-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B37289B419
	for <lists+linux-media@lfdr.de>; Sun,  7 Apr 2024 23:33:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A9C21C20A90
	for <lists+linux-media@lfdr.de>; Sun,  7 Apr 2024 21:33:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 765F244C6C;
	Sun,  7 Apr 2024 21:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mail.tikatika.nl header.i=@mail.tikatika.nl header.b="BD4yOpzj"
X-Original-To: linux-media@vger.kernel.org
Received: from tika.stderr.nl (tika.stderr.nl [94.142.244.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E644AEC5
	for <linux-media@vger.kernel.org>; Sun,  7 Apr 2024 21:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.142.244.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712525578; cv=none; b=h9N2LRE0ognfYfBoEf5JcMSf50Z8kOxoif3aXQQGalh6OLci/5oDi7PtVZRKsBxaLroDj14mOMASJDHkUAD+XaQohlGKnRFqoeKHFF8HWWjaeApSYizmTMe8j7qC2EUNaJ1r1EvktcZ8bdP/xwGnmMYrfdA00PpNRj0uuVrX+y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712525578; c=relaxed/simple;
	bh=neA9jwkTinrCbbYwWoOfjDPn84lxHI5PLuSKl5QmCE8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YHGr+0gXTpcOz2GssRQCCxQ1GT7TwtXmcWnUPBaR1jk6Tio38QtSfbOeNX1mfywY/Zwoc33oWfAaPIlM2imJ22OvxMfbOM/HFqbjiwX5YrcOqF+Fyuv1s74GUFg14xnnac96GkMv4lwxKvJguMrRvvECNbOej3NtwDtEV1sQkNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stdin.nl; spf=fail smtp.mailfrom=stdin.nl; dkim=pass (1024-bit key) header.d=mail.tikatika.nl header.i=@mail.tikatika.nl header.b=BD4yOpzj; arc=none smtp.client-ip=94.142.244.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stdin.nl
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=stdin.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mail.tikatika.nl; s=201709.tika; h=Content-Type:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=E2Es9rK9Toy60pqbwKeSb1q7c9jfLeLS59Fzz9ZOEig=; b=BD4yOpzjLEZBE7UCncnUwSEPvz
	PLVaMSZHOIj1X/m0CUmD1cfLTOTKt66XtuwMzLI0rrrkkw1/t1Ja8afY4hobmj2KvJTA+Pht63DY9
	bPhppuRlvl7286G2KKOCL6KbxlX5vBWvQSluoTSGLtuU6hDhiHziwOz1R82DR9OjyW5Q=;
X-Preliminary-Spam-Score: -2.5 (--)
Received: from [10.42.0.16] (helo=login.tika.stderr.nl)
	by tika.stderr.nl with smtp (Exim 4.96)
	(envelope-from <matthijs@stdin.nl>)
	id 1rtZsT-002DaW-2I;
	Sun, 07 Apr 2024 23:16:38 +0200
Received: (nullmailer pid 627251 invoked by uid 2001);
	Sun, 07 Apr 2024 21:16:37 -0000
Date: Sun, 7 Apr 2024 23:16:37 +0200
From: Matthijs Kooijman <matthijs@stdin.nl>
To: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: linux-media@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: media: cedrus: h264: Decoding fails or produces artifacts
Message-ID: <ZhMNNazVsu8EXqMU@login.tika.stderr.nl>
Mail-Followup-To: Matthijs Kooijman <matthijs@stdin.nl>,
	Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	linux-media@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Z6ZdA3TkR5JGhpQC"
Content-Disposition: inline
X-PGP-Fingerprint: E7D0 C6A7 5BEE 6D84 D638  F60A 3798 AF15 A156 5658
X-PGP-Key: http://www.stderr.nl/static/files/gpg_pubkey.asc


--Z6ZdA3TkR5JGhpQC
Content-Type: multipart/mixed; boundary="tjjApBYnz6xtrZNo"
Content-Disposition: inline


--tjjApBYnz6xtrZNo
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

I've been chasing a decoder bug in the cedrus h264 hardware decoder and aft=
er a
few days have been able to work around it by removing the
DMA_ATTR_NO_KERNEL_MAPPING argument when allocating the neighbour info dma
buffer (full patch at the end of the mail):

--- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
@@ -581,7 +581,7 @@ static int cedrus_h264_start(struct cedrus_ctx *ctx)
        ctx->codec.h264.neighbor_info_buf =3D
                dma_alloc_attrs(dev->dev, CEDRUS_NEIGHBOR_INFO_BUF_SIZE,
                                &ctx->codec.h264.neighbor_info_buf_dma,
-                               GFP_KERNEL, DMA_ATTR_NO_KERNEL_MAPPING);
+                               GFP_KERNEL, 0);

This does not seem like a proper fix to me (or maybe it is - I do not really
understand the problem yet), but it very effective.


The actual problem is that sometimes (about 10%-50%) the first frame
of a h264 stream incorrectly decodes, producing all-zero data in the bottom
part of the frame. See attached error-green.png for an example. In some even
more rare cases, more subtle decoding errors would occur, for example a lig=
hter
rectangle in the bottom left dark blue band in error-blue-bar.png, or some
misplaced pixels in the bottom right "noise" area (compare error-noise.png =
with
error-blue-bar.png to see).

To reproduce:

	# Create a h264-encoded 320x240 single-frame stream
	gst-launch-1.0 videotestsrc num-buffers=3D1 ! openh264enc ! filesink locat=
ion=3Dtest.h264
	# Decode it again using hardware decoding (repeat until seeing a broken fr=
ame)
	gst-launch-1.0 filesrc location=3Dtest.h264 ! v4l2slh264dec ! videoconvert=
 ! pngenc ! filesink location=3Dtest.png

I've been testing on an Orange Pi PC with an allwinner H3 running
Armbian 22.04 (based on Ubuntu Jammy), a 6.7.12 kernel (mostly with
Armbian-patched, but also clean mainline) and gstreamer
1.20.3. The problem also occurred on older kernel versions (tested clean
mainline down to 6.2 and then a bit earlier, but 6.1 mainline would
not boot for me). I have also observed the problem (or at least the same
symptom) on the Armbian-patched 6.1 kernel, but there it was extremely unli=
kely
(saw it once in 700 or so playbacks).

I've seen three variants of this issue:

 1. With the 320x240 test pattern, showing the green area in the frame.
    In this case, the decoder would actually return an error IRQ status
    (VE_H264_STATUS register would be 0x10010003 or 0x70010003, instead
    of the normal 0x60000001, bit 0 is VE_H264_STATUS_SLICE_DECODE_INT,
    bit 1 is VE_H264_STATUS_DECODE_ERR_INT).

 2. With the 320x240 test pattern, showing more subtle decoding errors (as
    shown in attachments).  In these cases, the IRQ status would not indica=
te a
    decoding error.

 3. With another test video (1920x1080) that I cannot share, there would
    be the same green areas (occasionally also green squares splattered
    around the frame), but *no* decoding error in the IRQ status.

None of these three issues occur anymore with the workaround applied (both =
on
clean 6.7.12 and on top of the Armbian patches), the gstreamer decoding then
produces bit-for-bit identical results every time (tested hundreds of
decodings).


I have no clue why removing DMA_ATTR_NO_KERNEL_MAPPING from this
allocation helps - I just tried it on a whim when I nothing else seemed
to help. I suspect that mapping the memory into kernel space might have
some side effect that helps, but I am not familiar enough with either
the cedrus hardware or the DMA system to tell.

I initially thought there might be an alignment issue and tried
increasing the allocation sizes of all DMA buffers to 256K (which
I think enforces a bigger alignment), but that did not help. The reason
I was looking at memory allocation (and also timing differences, but no
luck there) was that bisecting pointed me at commit fec94f8c995 ("media:
cedrus: h264: Optimize mv col buffer allocation") which seemed to make
the problem 2-4=D7 likely to occur (but looking back, I think I might have
been bisecting noise there).


I hope you folks can make more sense of this to figure out a proper fix.
For the short term my problem is solved (I'll just apply this patch and ship
it), so will not be investing more time right now.

If there's anything I can contribute, just let me know (I have done some te=
sts
with extra debug output added to the kernel, and a testscript for repeatedly
testing the decoding that I could share, and I am happy to test any
patches/hypothesis that you have).

Gr.

Matthijs

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/sta=
ging/media/sunxi/cedrus/cedrus_h264.c
index dfb401df138..7cd3b6a5434 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
@@ -581,7 +581,7 @@ static int cedrus_h264_start(struct cedrus_ctx *ctx)
        ctx->codec.h264.neighbor_info_buf =3D
                dma_alloc_attrs(dev->dev, CEDRUS_NEIGHBOR_INFO_BUF_SIZE,
                                &ctx->codec.h264.neighbor_info_buf_dma,
-                               GFP_KERNEL, DMA_ATTR_NO_KERNEL_MAPPING);
+                               GFP_KERNEL, 0);
        if (!ctx->codec.h264.neighbor_info_buf) {
                ret =3D -ENOMEM;
                goto err_pic_buf;
@@ -634,7 +634,7 @@ static int cedrus_h264_start(struct cedrus_ctx *ctx)
        dma_free_attrs(dev->dev, CEDRUS_NEIGHBOR_INFO_BUF_SIZE,
                       ctx->codec.h264.neighbor_info_buf,
                       ctx->codec.h264.neighbor_info_buf_dma,
-                      DMA_ATTR_NO_KERNEL_MAPPING);
+                      0);
=20
 err_pic_buf:
        dma_free_attrs(dev->dev, ctx->codec.h264.pic_info_buf_size,
@@ -670,7 +670,7 @@ static void cedrus_h264_stop(struct cedrus_ctx *ctx)
        dma_free_attrs(dev->dev, CEDRUS_NEIGHBOR_INFO_BUF_SIZE,
                       ctx->codec.h264.neighbor_info_buf,
                       ctx->codec.h264.neighbor_info_buf_dma,
-                      DMA_ATTR_NO_KERNEL_MAPPING);
+                      0);
        dma_free_attrs(dev->dev, ctx->codec.h264.pic_info_buf_size,
                       ctx->codec.h264.pic_info_buf,
                       ctx->codec.h264.pic_info_buf_dma,

--tjjApBYnz6xtrZNo
Content-Type: image/png
Content-Disposition: attachment; filename="error-blue-bar.png"
Content-Transfer-Encoding: base64

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
BiG5Jk2icAAAAABJRU5ErkJggg==

--tjjApBYnz6xtrZNo
Content-Type: image/png
Content-Disposition: attachment; filename="error-green.png"
Content-Transfer-Encoding: base64

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
9AGSlNT/Aw5Yocmy5xbNAAAAAElFTkSuQmCC

--tjjApBYnz6xtrZNo
Content-Type: image/png
Content-Disposition: attachment; filename="error-in-noise.png"
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAAUAAAADwCAYAAABxLb1rAAAgAElEQVR4nO3dB5xkVZn+8eqe
nhxhAAkDIplBJAkDguiaRTIGBLOrrn8RVMCcUHdXVMCwQVdBEZWoKOi6IioCoqIiICLiwIjE
IQ4TO5//+Z6q25N6GCZ1V828/fm8U91V995z7p2uXz/P+773VK27uzutSfT09Kz96O7Lx04l
enL0dqXU35nyN/fkfy5KC/pemx5P26b5qSMtTG2ps7eWunpWL7p7Vy96eurR1z149Hbl4+dY
mL+/M22fLksnpVc+/Pm0zZw/pY6FXWnEop7U1tmT2vO5ilpP84T5jMgxpveuNLb/m6n20BH5
+a1Tra+2OHob0TNc0VaP7hGNaE+1zhzza+klv3hJ+v6My1L3iPy71N6T+tqWj9TWl/prvSnV
+kv01/pWK/ryMVYn0kD0L472a9P82r6pu5Z/h3KkgWjLMSI/N1i0NaI2pNFfoj1/Pyb9ZvSR
af/a5amj1pWnuzDHoiViQSMWLRNdjeheInqGPgKAAcAAYAAwABgADAAGAAOAAcAAYAAwABgA
DAAGAAOAAcAAYAAwABgADAAGAAOAAcAAYAAwABgADAAGAAOAAcAAYAAwABgADAAGAAOAAcAA
YAAwABgADAAGAAOAAcAAYAAwABgADAAGAAOAAcAAYAAwABgADAAGAAOAawTACwcAOC+NCAAG
AAOAwwjA/trY9NsxR6UDaj9MIwvEloRb1yDAq0db3rZtKfgFAJ80AB/venUAMAD4pAHYm99c
ywb4VQBcXfgFANcDAK4prPr6+tZ+5N+L3kb4vj//wU4ZhKn/vvzPBWlu93Hp0b6tMwTbBgC4
uiALAK6/AOxqz3+k25aHn+jLv/xiTUG2IQKwf4k5AeD1Y49OB9b+N40qUFlsa+uQ62xE9wqi
p8SwwK81AXh+UYCP9E4LAAYAA4DDDMBUG7daAGzP27Y34BcAXCUAfifN6Ty2AHBOqqUF/bUA
YADwCQHYk9+Uy0YFwKEGXwAwABgADAAGANcjAP5u3DHpoNqP0+h8PlUur60BuPZ8revRM2gE
AAOAAcAAYAAwABgAbJYIAAYAA4ABwABgADAAGAAMAAYAA4ABwABgADAAGAAMAAYAA4ABwABg
ADAAGAAMAAYAA4ABwABgADAAGAAMAAYAA4ABwABgAHBdAvCxRa8KAAYABwfggrYAYABw/Qbg
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
erq608teekj64ue/UPb77a9/kzbZeGqZ00te9OL0w8suTyNHdKR/ftOb03/9x3+mf3nr28p1
mH3/A+W5Wm3G59Iaxf5nrJs4IMezPptqB/57fjw9h+cy/Pb/Qo6zGpGfm5G3mZFfn5G32+vU
DMxj05UNtvT0gF9aMfzWMQD7Mvx6ctQhmKNT9JUPOXZsH/nZ3zN49Hblx0WpfNhMuiNl8Hw9
vb12a4bgrRlMt6Z35zhxmThpleKWRtzciBsH4sRGeP3k2sz0ntqsPPbtGYS35bg9vTXHO/L3
J+Y4Kce7c5y8GnF07ey0cW36kCiUoUyHbDR5Ypo8cfxKwjaT0qSJU0pMnLhxidH5ezFufD3G
j5+Uxk+YkGN8jrHLxaWXfi/dfPNNaY89npHe//73pXe966T0zneekC644Pz0l7/cmu75x93p
4x/9WDrmqKPTV7/yP1lxt6W77/pHAcVznn1wAROwvOF1ry/PAcP9996XPvKhD6dHH34kfebT
p6ezv/q1cpzPn3lW2m3X6emuWX9Prznu+DRh3Pj0p5tuLrC68oqfFuC968ST0rQttypgfcfb
/1+ase9+5dg//ckV6awzzkx//Uv+vTnhnQWoh7zkpekr//3l9PCDD6XfXPfr9KPLf1iuydw5
j6c//uGGMuab3vDGsm/Xos4yV6/tsN32BXw3/P4P6ZGHHk5bbr5F+txnPpsWLVhY5vXRD3+k
zAX8XvC85xcwn/v1b5TxbXvQsw5ME8dPSKeefEr+/9rvzLRGMeOsdRMHVBA8vQ7CgThjcRyQ
f96vESC41/uyOjwu/aQBwN4nAcBeIBok1hSE1X7VscqHG3f3FjACYmcS9eWABgdgPk7nYgC+
LMPiHQU2MwuU6nF7gU8FoFNWKW5txC2NuHkgTh6AIlDenkE3M499Z3pbCd/PLM9X49cheOsq
x5FZ1W5U23U9BODkBuCeKCalyROm5Ni4xKSJ9Rg/fmqJCRM2yjE5Tcjb1mNCjnHLxeOPz0lv
fetb0o03/jF95CMfTjNn/i2dcsrJad68uWmzzTYtb3rQAoVPnvaJooKuvfqaAgLQeuXLX5F+
9tMr03HHvrrA5NZb/py2f9p2BWK/v/53aZeddh5QUbb92Ec+mv7ny19J/+9f3l7A9Y1zvl4A
CXg/+fH/FZh+51vfLkrL89Qepfeed707/e631xcVufeee5VwrbbealpRomBsnuY3daONiz2+
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

--tjjApBYnz6xtrZNo--

--Z6ZdA3TkR5JGhpQC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMyF3AetYrDfGJ9el6ZMxy91tJYwFAmYTDTEACgkQ6ZMxy91t
JYzopQ/9HqTDIAI4KvSA1afqfRqeCzNpkUx+kF4C2rgWtzdh22T5ddQUl8S7sVIQ
MqMhf/W1KdwTrvx5rAQm7U3GCm5RhgN3+nsC5j1f5Uboo1DYldDi9vftiX8ayht7
Sko5GFKBEb8KeEzfwDgqy1KXx1Cib49VXvwTI4Mm8sh/IsHHgdkjL4qT20KtHk+/
1StTS7VUytcgbHutmbgJHfvyPNiW/PZHes9C3qXz/iIxuRZkxmcIPkn6RRchw9Fc
E9xeYUm8HN1fw+c+xgiCS+MJ25Hh1Elh4n9oy+kDs+acfSKGxhfkcQcddZE2GKLG
bJ7eoNUsQrfhsU3hsRyAkHsdBNp/+34a5ETpfU74adBQw4m7Uhxl4nLVpvwo2M7H
/myDuH3JWRXJ97aeeTovtSnMYNvmeqJf4L1JYl7xzOv4r+zM3xczzU0ZZ6E5Wlrb
eDl8KB8YQ0kXWqkze2lOHZpxp2gpAJNJZ7TUIVWzrdlQYluxwzAVWksqfGT4Ia9K
oHgIT5NgDsWhlzSzIxfDy1XmfBBzOyXoVeFV94tGYfQtM6/xdEtQGGjoZ2x2sOJ9
kcQ7l3reDoXmz2S8bSUafkdhtTKMXfCS7veRGDoa0EJlIt2m86j5wf8fVHvaRVyO
Cgam8SVU8TgCShy1m2YtDP6+B2hdj+SKd0MfTYcqDkn4ZtHOmMw=
=d0ka
-----END PGP SIGNATURE-----

--Z6ZdA3TkR5JGhpQC--

