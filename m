Return-Path: <linux-media+bounces-408-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9E67ED62D
	for <lists+linux-media@lfdr.de>; Wed, 15 Nov 2023 22:46:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC7E21F2528C
	for <lists+linux-media@lfdr.de>; Wed, 15 Nov 2023 21:46:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8E3B3FE20;
	Wed, 15 Nov 2023 21:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 236F6E1
	for <linux-media@vger.kernel.org>; Wed, 15 Nov 2023 13:46:24 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mgr@pengutronix.de>)
	id 1r3NiI-0000jh-It; Wed, 15 Nov 2023 22:46:22 +0100
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mgr@pengutronix.de>)
	id 1r3NiF-009JJa-3N; Wed, 15 Nov 2023 22:46:19 +0100
Received: from mgr by pty.whiteo.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <mgr@pengutronix.de>)
	id 1r3NiE-0071oq-QR; Wed, 15 Nov 2023 22:46:18 +0100
Date: Wed, 15 Nov 2023 22:46:18 +0100
From: Michael Grzeschik <mgr@pengutronix.de>
To: Tomasz Figa <tfiga@chromium.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	m.szyprowski@samsung.com, kernel@pengutronix.de,
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH] media: videobuf2-dma-sg: use v{un,}map instead of
 vm_{un,}map_ram
Message-ID: <ZVU8Kpp83bOjq0fL@pengutronix.de>
References: <20221120234441.550908-1-m.grzeschik@pengutronix.de>
 <5e585a78-15c8-fd17-bc34-96f7ed18f592@xs4all.nl>
 <CAAFQd5Aicurw-pjYpWJK_qNemy1qszvN4rL=TfAuxhOdAOTGNg@mail.gmail.com>
 <20230510142509.GA14356@pengutronix.de>
 <CAAFQd5AmVBc6LQ1eyZ=WrvtLR4oSD4K0mMeszcuY12CK7djiUA@mail.gmail.com>
 <CAAFQd5D_o3wE98=wFXR2nbWkpCAdCDxz2tP8ssSSYVkZ5iC1Qg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="A812DbJswr9oq5mK"
Content-Disposition: inline
In-Reply-To: <CAAFQd5D_o3wE98=wFXR2nbWkpCAdCDxz2tP8ssSSYVkZ5iC1Qg@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org


--A812DbJswr9oq5mK
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 01, 2023 at 12:43:25PM +0900, Tomasz Figa wrote:
>On Tue, May 16, 2023 at 7:50=E2=80=AFPM Tomasz Figa <tfiga@chromium.org> w=
rote:
>>
>> Hi Michael,
>>
>> On Wed, May 10, 2023 at 11:25=E2=80=AFPM Michael Grzeschik <mgr@pengutro=
nix.de> wrote:
>> >
>> > Sorry for the late comeback, however here are some thoughts.
>> >
>> > On Fri, Dec 02, 2022 at 06:01:02PM +0900, Tomasz Figa wrote:
>> > >On Thu, Nov 24, 2022 at 10:35 PM Hans Verkuil <hverkuil@xs4all.nl> wr=
ote:
>> > >>
>> > >> On 21/11/2022 00:44, Michael Grzeschik wrote:
>> > >> > The comments before the vm_map_ram function state that it should =
be used
>> > >> > for up to 256 KB only, and video buffers are definitely much larg=
er. It
>> > >> > recommends using vmap in that case.
>> > >> >
>> > >> > Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>> > >> > ---
>> > >> >  drivers/media/common/videobuf2/videobuf2-dma-sg.c | 7 ++++---
>> > >>
>> > >> drivers/media/common/videobuf2/videobuf2-vmalloc.c uses it as well,
>> > >> probably also incorrectly. It makes sense to change that one as wel=
l.
>> > >
>> > >Comparing vm_map_ram() and vmap(..., VM_MAP, PAGE_KERNEL), for blocks
>> > >bigger than VMAP_MAX_ALLOC they're equivalent and for smaller blocks
>> > >the former should be faster, so I don't see what's wrong with the
>> > >current code.
>> >
>> > I got another comment on this from Andrzej Pietrasiewicz
>> > where he expands the comment on the use of vmap over vm_map_ram.
>> >
>> > https://lore.kernel.org/linux-media/64375ff4-dbbb-3d5b-eaf6-32d6780fd4=
96@collabora.com
>> >
>> > As I understand this, we should probably update the vm_map_ram to vmap,
>> > due to the expectation that video buffers are long-living objects.
>> >
>> > Since there are some more places that would probably need to be updated
>> > if we should decide to use vmap over vm_map_ram in the whole
>> > videbuf2-* users, I would like to clarify on this before making
>> > a series.
>>
>> Ah, I see. Thanks for the pointer.
>>
>> VB2 buffers would usually require long-lived mappings, so based on
>> that, we should switch to vmap() indeed.
>>
>> As a side note, not directly related to this patch, I wonder if we
>> should also call invalidate/flush_kernel_vmap_range() in
>> vb2_dma_sg_prepare/finish(). (In principle we shouldn't, but so far
>> our drivers don't explicitly call begin/end_cpu_access() and rely on
>> prepare/finish to handle the cache maintenance of the kernel
>> mapping...) Let me also add Sergey on CC for visibility.
>
>Sorry, I forgot last time, so maybe it wasn't clear I'm good with this pat=
ch:
>
>Acked-by: Tomasz Figa <tfiga@chromium.org>
>
>Hans, will you pick it? Thanks!

Gentle Ping!

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--A812DbJswr9oq5mK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmVVPCgACgkQC+njFXoe
LGSrKA/+MmJEDuPMXBkumiuUviuK1sJXlgLchgleIrNR/Kn+orZ7HmUgtDFPEss4
Y2xMji1dgNbiHRleHg2sFkF9Q4O8w1HKWRWye7DJ1sX047WdW97GxUCOiH731vcN
GQlzox9G+QaI8kUZ0rypYBMwyUZpTfM1TOd+pjv5X2aJhtCvb0JHb6FxamzvZ0IY
5MfHY6ol4HYQBUssdsURWAeWhzkcEiWOAkXS76jxO8bunQkekhmvIOCdxXO0PPuu
ZeTmi32GKJgZNN6Ill21ZJQz8viDoevRr5TYYzpciWcVB2fFrfqStG2DdBx1yB4K
HHolt/LTmXeAldslW18WE/ahrTH0Itr39Vr5U8iFTJFAa8HItDcSEC+BtQL9CmPe
QqafYwb7jYTXYfVfGi5YpwGEbA3igZzDXih55N7tqgKgp4/baujkmi9Mt8zCbXJ4
YQ+aIa+Ho7u6zFFHAO+uKfjYKIgzmv3ppH2XesCVVPgIN7LsB2wXls41k1YSZKCe
J3Qex15SnQTdI0a6mOmiSzizMkNpMuwtNFWqsR8KHHDdRfpR2XilXYJbMeBXtPXG
ptv3I/hh60GOvDE1vkTVOedT0jN/K01jBg4hv2wwP/7P5+O0W1Z5CMnY6C8I5aJy
GNEOK0HvS1zNcISh2rvHaxjEWoZfInwMlxCKCwa4n9jD08FnA4o=
=8ztV
-----END PGP SIGNATURE-----

--A812DbJswr9oq5mK--

