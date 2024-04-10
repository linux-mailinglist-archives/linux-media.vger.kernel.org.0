Return-Path: <linux-media+bounces-8981-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 605B789EF4C
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 11:56:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AC8FEB2192D
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 09:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4F9C156C6B;
	Wed, 10 Apr 2024 09:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="BpqRXUrV"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8038B8BE8
	for <linux-media@vger.kernel.org>; Wed, 10 Apr 2024 09:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712742960; cv=none; b=eDpoO/GZKlVwvzWBQa1mmJ6f6hJF0EAOV66XCoHhQeN5+kOgBvVpUMPipdae/sekUZz21HjtcO4/Zb69PuHTqfQMJmksdsgYhtgQUbecCKBCguhJOPGjxJdb293GaaZQa4cBnbhoWZY6/Dcj6rKTnGIXF85J4p5OFr0CZU4cC84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712742960; c=relaxed/simple;
	bh=ZO7ay8exjcPDwFiDpRGMtvyNEpc10oC7S09+5Hun+T4=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rOkplkiSNRQ9+RynGN7CjZVvH8DLfLD0+CGXCoFD/NBLTZzBDYTgW0g49SVN0/PsOy5TiW87+ER7S7dn7mnM/9BPi0Omdwwm+o+oOD0WApSr2Qf7uts2nIHmztXRs6K9xnKos/lXyjL1zk8QULTpSjjaL2ty0Vb0vrNpGcqVLOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=BpqRXUrV; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712742956;
	bh=ZO7ay8exjcPDwFiDpRGMtvyNEpc10oC7S09+5Hun+T4=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=BpqRXUrV7wXu01jpOKl6iK0slZ6CDexw69mLqWtTnKg2zqFAfaszEcvrAM0ehjP9g
	 e8M0Tq34d0grMtqz4iZMZVpPDZGcalH2NDBvdWmgMjemtEXAzEYRoCi9WImVvQGi5k
	 YPFhE+74oEvCOVtkv4wuMQCjCYaAc8uscoSKRR6cJz0nTejJkn5uVx3pSruqL9aWXh
	 VGN3jE0IjZkvUHWrB3VKCZLRq2IexyE+2rtBS69be+qG5MfcKJSZPeqRjrNJ6ACmv3
	 CkflHGkrvKmO5jPpEHMhx3BHHlTCO/q7qQk3RV512KcqmmmFf434mEk9I2MSvzQIuR
	 ii08/DwSB3Iow==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sebastianfricke)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 89D8E378000E;
	Wed, 10 Apr 2024 09:55:56 +0000 (UTC)
Date: Wed, 10 Apr 2024 11:55:55 +0200
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Matthijs Kooijman <matthijs@stdin.nl>,
	Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	linux-media@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Bob Beckett <bob.beckett@collabora.com>
Subject: Re: media: cedrus: h264: Decoding fails or produces artifacts
Message-ID: <20240410095555.std6q4g223fupkju@basti-XPS-13-9310>
References: <ZhMNNazVsu8EXqMU@login.tika.stderr.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gdo5utdlxkc6f6v3"
Content-Disposition: inline
In-Reply-To: <ZhMNNazVsu8EXqMU@login.tika.stderr.nl>


--gdo5utdlxkc6f6v3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Matthijs,

On 07.04.2024 23:16, Matthijs Kooijman wrote:
>Hi,
>
>I've been chasing a decoder bug in the cedrus h264 hardware decoder and af=
ter a
>few days have been able to work around it by removing the
>DMA_ATTR_NO_KERNEL_MAPPING argument when allocating the neighbour info dma
>buffer (full patch at the end of the mail):
>
>--- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
>+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
>@@ -581,7 +581,7 @@ static int cedrus_h264_start(struct cedrus_ctx *ctx)
>        ctx->codec.h264.neighbor_info_buf =3D
>                dma_alloc_attrs(dev->dev, CEDRUS_NEIGHBOR_INFO_BUF_SIZE,
>                                &ctx->codec.h264.neighbor_info_buf_dma,
>-                               GFP_KERNEL, DMA_ATTR_NO_KERNEL_MAPPING);
>+                               GFP_KERNEL, 0);
>
>This does not seem like a proper fix to me (or maybe it is - I do not real=
ly
>understand the problem yet), but it very effective.

thanks for the patch, I don't think we can take it as due to, as you
highlighted, it relies on unknown side effects. Perhaps if you or
someone else in the community can investigate this further and answer
some more questions we can move it forward.

Some questions to help move the discussions along:

- Does the platform have an IOMMU?
- What does the IOMMU driver do when it sees the
   DMA_ATTR_NO_KERNEL_MAPPING flag?
- On the platform in question do coherent allocations get handled with
   cached snooped mappings or uncached?
- Does changing that flag affect any cacheablility
- Does the codec block expect any particular intialized data in that
   buffer?

Greetings,
Sebastian

>
>
>The actual problem is that sometimes (about 10%-50%) the first frame
>of a h264 stream incorrectly decodes, producing all-zero data in the bottom
>part of the frame. See attached error-green.png for an example. In some ev=
en
>more rare cases, more subtle decoding errors would occur, for example a li=
ghter
>rectangle in the bottom left dark blue band in error-blue-bar.png, or some
>misplaced pixels in the bottom right "noise" area (compare error-noise.png=
 with
>error-blue-bar.png to see).
>
>To reproduce:
>
>	# Create a h264-encoded 320x240 single-frame stream
>	gst-launch-1.0 videotestsrc num-buffers=3D1 ! openh264enc ! filesink loca=
tion=3Dtest.h264
>	# Decode it again using hardware decoding (repeat until seeing a broken f=
rame)
>	gst-launch-1.0 filesrc location=3Dtest.h264 ! v4l2slh264dec ! videoconver=
t ! pngenc ! filesink location=3Dtest.png
>
>I've been testing on an Orange Pi PC with an allwinner H3 running
>Armbian 22.04 (based on Ubuntu Jammy), a 6.7.12 kernel (mostly with
>Armbian-patched, but also clean mainline) and gstreamer
>1.20.3. The problem also occurred on older kernel versions (tested clean
>mainline down to 6.2 and then a bit earlier, but 6.1 mainline would
>not boot for me). I have also observed the problem (or at least the same
>symptom) on the Armbian-patched 6.1 kernel, but there it was extremely unl=
ikely
>(saw it once in 700 or so playbacks).
>
>I've seen three variants of this issue:
>
> 1. With the 320x240 test pattern, showing the green area in the frame.
>    In this case, the decoder would actually return an error IRQ status
>    (VE_H264_STATUS register would be 0x10010003 or 0x70010003, instead
>    of the normal 0x60000001, bit 0 is VE_H264_STATUS_SLICE_DECODE_INT,
>    bit 1 is VE_H264_STATUS_DECODE_ERR_INT).
>
> 2. With the 320x240 test pattern, showing more subtle decoding errors (as
>    shown in attachments).  In these cases, the IRQ status would not indic=
ate a
>    decoding error.
>
> 3. With another test video (1920x1080) that I cannot share, there would
>    be the same green areas (occasionally also green squares splattered
>    around the frame), but *no* decoding error in the IRQ status.
>
>None of these three issues occur anymore with the workaround applied (both=
 on
>clean 6.7.12 and on top of the Armbian patches), the gstreamer decoding th=
en
>produces bit-for-bit identical results every time (tested hundreds of
>decodings).
>
>
>I have no clue why removing DMA_ATTR_NO_KERNEL_MAPPING from this
>allocation helps - I just tried it on a whim when I nothing else seemed
>to help. I suspect that mapping the memory into kernel space might have
>some side effect that helps, but I am not familiar enough with either
>the cedrus hardware or the DMA system to tell.
>
>I initially thought there might be an alignment issue and tried
>increasing the allocation sizes of all DMA buffers to 256K (which
>I think enforces a bigger alignment), but that did not help. The reason
>I was looking at memory allocation (and also timing differences, but no
>luck there) was that bisecting pointed me at commit fec94f8c995 ("media:
>cedrus: h264: Optimize mv col buffer allocation") which seemed to make
>the problem 2-4=C3=97 likely to occur (but looking back, I think I might h=
ave
>been bisecting noise there).
>
>
>I hope you folks can make more sense of this to figure out a proper fix.
>For the short term my problem is solved (I'll just apply this patch and sh=
ip
>it), so will not be investing more time right now.
>
>If there's anything I can contribute, just let me know (I have done some t=
ests
>with extra debug output added to the kernel, and a testscript for repeated=
ly
>testing the decoding that I could share, and I am happy to test any
>patches/hypothesis that you have).
>
>Gr.
>
>Matthijs
>
>diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/st=
aging/media/sunxi/cedrus/cedrus_h264.c
>index dfb401df138..7cd3b6a5434 100644
>--- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
>+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
>@@ -581,7 +581,7 @@ static int cedrus_h264_start(struct cedrus_ctx *ctx)
>        ctx->codec.h264.neighbor_info_buf =3D
>                dma_alloc_attrs(dev->dev, CEDRUS_NEIGHBOR_INFO_BUF_SIZE,
>                                &ctx->codec.h264.neighbor_info_buf_dma,
>-                               GFP_KERNEL, DMA_ATTR_NO_KERNEL_MAPPING);
>+                               GFP_KERNEL, 0);
>        if (!ctx->codec.h264.neighbor_info_buf) {
>                ret =3D -ENOMEM;
>                goto err_pic_buf;
>@@ -634,7 +634,7 @@ static int cedrus_h264_start(struct cedrus_ctx *ctx)
>        dma_free_attrs(dev->dev, CEDRUS_NEIGHBOR_INFO_BUF_SIZE,
>                       ctx->codec.h264.neighbor_info_buf,
>                       ctx->codec.h264.neighbor_info_buf_dma,
>-                      DMA_ATTR_NO_KERNEL_MAPPING);
>+                      0);
>
> err_pic_buf:
>        dma_free_attrs(dev->dev, ctx->codec.h264.pic_info_buf_size,
>@@ -670,7 +670,7 @@ static void cedrus_h264_stop(struct cedrus_ctx *ctx)
>        dma_free_attrs(dev->dev, CEDRUS_NEIGHBOR_INFO_BUF_SIZE,
>                       ctx->codec.h264.neighbor_info_buf,
>                       ctx->codec.h264.neighbor_info_buf_dma,
>-                      DMA_ATTR_NO_KERNEL_MAPPING);
>+                      0);
>        dma_free_attrs(dev->dev, ctx->codec.h264.pic_info_buf_size,
>                       ctx->codec.h264.pic_info_buf,
>                       ctx->codec.h264.pic_info_buf_dma,







--gdo5utdlxkc6f6v3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEwRT2sQmtCGwCtJIPfUYSv152pPAFAmYWYisACgkQfUYSv152
pPAJTw//ZJ04iFX2T1bBjAb7CYG+CSxj4xYbknhzed3mcVF69XtAaf+EBD/9hm5R
jZ716GCmoDjdo7v/qozZ2cw7/UnVEkUkcBAjmZ5A5Gy9T/Ww6w/t4FEu3PF80dtV
rbB5gXzLj99x9/UUyBSc+F8gbwF4J8CNnS/0PzQtpZLgfh2ypfoXRCUsj51fobx7
jKckvvBE2ciPzx/4r+z6gE3j7Yh1ktMoi3A9iM7iMNbQtNo45nLWgBymRZ/15or9
mTbu0kNMkv1XxM3GEn7BmE/HmrWtoQsXkUC07+5DYBDZWbQztgyyAWXmESxSfDHg
3RiWAHuSUPQydGBoRwqHqOoCc+9htGH+xs/uoivSAHLXJmU/cdFbPfxPGu0DJ/Qh
J1FRjyM04VY6/SIajNXTB7LnRu6/KAENRd3CqsEtpiGxqzu4fNyFtXDYdiOlUC3y
lsq94+oMIiab0p0j+WNWkzozY6LZyoj7W4nr0sBMwAMZko8/VFuv3OiK7AW/EDgA
Ib5fMc2bxalujqwBXOry0pRFHJ1ROuhXAD25Z6kK6ejbVAraal/HQtA9MCALs6vR
VnMx5ZGjrXIxeMZU7h02kewtvfibXiJQTpJQgcH6wfU0v9ui5JgRlva0btXjiNO0
zwobO8DV/XxIg1WgCVpbAgFNrHlrcBKPX9zNukZB8SHk0a36whA=
=uISC
-----END PGP SIGNATURE-----

--gdo5utdlxkc6f6v3--

