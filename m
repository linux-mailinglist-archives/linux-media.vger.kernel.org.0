Return-Path: <linux-media+bounces-674-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBDC7F2E56
	for <lists+linux-media@lfdr.de>; Tue, 21 Nov 2023 14:31:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2380528285A
	for <lists+linux-media@lfdr.de>; Tue, 21 Nov 2023 13:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 097F051C33;
	Tue, 21 Nov 2023 13:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11450D5B
	for <linux-media@vger.kernel.org>; Tue, 21 Nov 2023 05:30:56 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mgr@pengutronix.de>)
	id 1r5Qq6-00078O-E9; Tue, 21 Nov 2023 14:30:54 +0100
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mgr@pengutronix.de>)
	id 1r5Qq4-00Aarh-Nf; Tue, 21 Nov 2023 14:30:52 +0100
Received: from mgr by pty.whiteo.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <mgr@pengutronix.de>)
	id 1r5Qq4-00Fo2P-EB; Tue, 21 Nov 2023 14:30:52 +0100
Date: Tue, 21 Nov 2023 14:30:52 +0100
From: Michael Grzeschik <mgr@pengutronix.de>
To: Tomasz Figa <tfiga@chromium.org>
Cc: linux-media@vger.kernel.org, hverkuil@xs4all.nl,
	m.szyprowski@samsung.com, mchehab@kernel.org,
	sumit.semwal@linaro.org, christian.koenig@amd.com,
	kernel@pengutronix.de, stable@kernel.org
Subject: Re: [PATCH v3] media: videobuf2-dma-sg: fix vmap and vunmap callbacks
Message-ID: <ZVyxDAKYz1OaGGQZ@pengutronix.de>
References: <20231031230435.3356103-1-m.grzeschik@pengutronix.de>
 <CAAFQd5CCr0ivS8REcwHwJweCTk29+wVGZVjgL0mnZzPQ47kAVw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gPO2K019tpUL9G3V"
Content-Disposition: inline
In-Reply-To: <CAAFQd5CCr0ivS8REcwHwJweCTk29+wVGZVjgL0mnZzPQ47kAVw@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org


--gPO2K019tpUL9G3V
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 01, 2023 at 12:48:21PM +0900, Tomasz Figa wrote:
>Hi Michael,
>
>
>On Wed, Nov 1, 2023 at 8:04=E2=80=AFAM Michael Grzeschik
><m.grzeschik@pengutronix.de> wrote:
>>
>> For dmabuf import users to be able to use the vaddr from another
>> videobuf2-dma-sg source, the exporter needs to set a proper vaddr on
>> vb2_dma_sg_dmabuf_ops_vmap callback.
>>
>> This patch adds vmap on map if buf->vaddr was not set, and also
>> adds the vb2_dma_sg_dmabuf_ops_vunmap function to remove the mapping
>> afterwards.
>>
>> Cc: stable@kernel.org
>> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>>
>> ---
>> v2 -> v3: resend as a single patch
>> v1 -> v2: using vmap and vunmap instead of vm_map_ram and vm_unmap_ram
>>
>
>First of all, thanks for the patch!
>
>Please check my comments inline.
>
>>  .../media/common/videobuf2/videobuf2-dma-sg.c    | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>>
>> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers=
/media/common/videobuf2/videobuf2-dma-sg.c
>> index 28f3fdfe23a298..05b43edda94a7e 100644
>> --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
>> +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
>> @@ -489,11 +489,26 @@ static int vb2_dma_sg_dmabuf_ops_vmap(struct dma_b=
uf *dbuf,
>>  {
>>         struct vb2_dma_sg_buf *buf =3D dbuf->priv;
>>
>> +       if (!buf->vaddr)
>> +               buf->vaddr =3D vmap(buf->pages, buf->num_pages, VM_MAP,
>> +                                 PAGE_KERNEL);
>> +
>
>Would it make sense to use vb2_dma_sg_vaddr() instead of open coding
>the mapping again?
>

So in the end the whole patch would look like this:

	buf->vaddr =3D vb2_dma_sg_vaddr(NULL, buf);
	if (!buf->vaddr)
		return -ENOMEM;

>>         iosys_map_set_vaddr(map, buf->vaddr);
>>
>>         return 0;
>>  }
>>
>> +static void vb2_dma_sg_dmabuf_ops_vunmap(struct dma_buf *dbuf,
>> +                                     struct iosys_map *map)
>> +{
>> +       struct vb2_dma_sg_buf *buf =3D dbuf->priv;
>> +
>> +       if (buf->vaddr)
>> +               vunmap(buf->vaddr);
>> +
>> +       buf->vaddr =3D NULL;
>> +}
>
>This could be potentially dangerous. Please consider the situation
>when the exporting V4L2 driver needs the CPU mapping for its own
>usage. It would call vb2_dma_sg_vaddr(), which would return the
>mapping. Then the importer could call vunmap, which would destroy the
>mapping that is still in use by the exporter internally.
>
>The idea of the current implementation is that we just create a kernel
>mapping when it's needed first and just keep it around until the
>entire buffer is destroyed.

In this patch I will drop the while vunmap callback then.

Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--gPO2K019tpUL9G3V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmVcsQgACgkQC+njFXoe
LGQ2jA//S0uft7K6+Y/2DZxrl7vMexv6bvqASK8Ayruh5HgyKkp16mDBRKaHiXgg
F4SeEAx3akpnD9sjFN3yLMg08TP02pL6lkNRO3mGqpw5oE5nvBRj0gzH0Oug8hab
XxGGA2lP2BHKeCE2CoiaydNltcvyJ9mYEJ6oY5bvRXm9seGScV1RIXOGClGZecBE
5hdx7eEkbW86RZfRGibsh4tjzcIV8H0Vp48UjMSrD0DvTiwma5jjsReFUP4CCmlH
HsYocvzWpPjmQrNLbg4W9pm7WHUZZIsdp0Yldp3J/4BKZqY6M3EfasX7Av+C1xMi
F5QJrqEJMQkWbxuNLW7AHywVXhwSUbmypJvPNUGn+p1mx+POPCI/UqBrf6Mw2QMT
bQhPazr83nnvZXQ9FO4iT4DoVQZl23hFmaP3ki6APsEQgM56x4fMXN+mV/vlQAdk
NLloTlPbF8Mcnr65hwwko5FZ0NFLY9qIQJCJsGUbvlfePIqqqjOlCSOu39U9irMC
7Bu+EZ8G9JdsorAT7+Wird2eTSviFFrbT4kQODzS8GciED8H1MRCx4eSr3buxzLX
nvZIUCnymNdj328vtDeNo0024PBl47I+FYI4Yc395MyWt4kZfHYJqfXjJrZ2254t
VFgt2sPC2f1m4W/SnEiCptJBW51lL6+TE7N3vy8S2wI/VoJP974=
=oKDJ
-----END PGP SIGNATURE-----

--gPO2K019tpUL9G3V--

