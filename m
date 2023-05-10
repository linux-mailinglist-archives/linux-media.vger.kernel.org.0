Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2177F6FE01C
	for <lists+linux-media@lfdr.de>; Wed, 10 May 2023 16:25:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237447AbjEJOZw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 May 2023 10:25:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237445AbjEJOZs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 May 2023 10:25:48 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4EA949F7
        for <linux-media@vger.kernel.org>; Wed, 10 May 2023 07:25:16 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1pwkkh-0006JQ-Mn; Wed, 10 May 2023 16:25:11 +0200
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1pwkkf-0001aC-Qi; Wed, 10 May 2023 16:25:09 +0200
Date:   Wed, 10 May 2023 16:25:09 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        m.szyprowski@samsung.com, kernel@pengutronix.de,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCH] media: videobuf2-dma-sg: use v{un,}map instead of
 vm_{un,}map_ram
Message-ID: <20230510142509.GA14356@pengutronix.de>
References: <20221120234441.550908-1-m.grzeschik@pengutronix.de>
 <5e585a78-15c8-fd17-bc34-96f7ed18f592@xs4all.nl>
 <CAAFQd5Aicurw-pjYpWJK_qNemy1qszvN4rL=TfAuxhOdAOTGNg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="sdtB3X0nJg68CQEu"
Content-Disposition: inline
In-Reply-To: <CAAFQd5Aicurw-pjYpWJK_qNemy1qszvN4rL=TfAuxhOdAOTGNg@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Sorry for the late comeback, however here are some thoughts.

On Fri, Dec 02, 2022 at 06:01:02PM +0900, Tomasz Figa wrote:
>On Thu, Nov 24, 2022 at 10:35 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>> On 21/11/2022 00:44, Michael Grzeschik wrote:
>> > The comments before the vm_map_ram function state that it should be us=
ed
>> > for up to 256 KB only, and video buffers are definitely much larger. It
>> > recommends using vmap in that case.
>> >
>> > Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>> > ---
>> >  drivers/media/common/videobuf2/videobuf2-dma-sg.c | 7 ++++---
>>
>> drivers/media/common/videobuf2/videobuf2-vmalloc.c uses it as well,
>> probably also incorrectly. It makes sense to change that one as well.
>
>Comparing vm_map_ram() and vmap(..., VM_MAP, PAGE_KERNEL), for blocks
>bigger than VMAP_MAX_ALLOC they're equivalent and for smaller blocks
>the former should be faster, so I don't see what's wrong with the
>current code.

I got another comment on this from Andrzej Pietrasiewicz
where he expands the comment on the use of vmap over vm_map_ram.

https://lore.kernel.org/linux-media/64375ff4-dbbb-3d5b-eaf6-32d6780fd496@co=
llabora.com

As I understand this, we should probably update the vm_map_ram to vmap,
due to the expectation that video buffers are long-living objects.

Since there are some more places that would probably need to be updated
if we should decide to use vmap over vm_map_ram in the whole
videbuf2-* users, I would like to clarify on this before making
a series.

Regards,
Michael

>> >  1 file changed, 4 insertions(+), 3 deletions(-)
>> >
>> > diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drive=
rs/media/common/videobuf2/videobuf2-dma-sg.c
>> > index dcb8de5ab3e84a..e86621fba350f3 100644
>> > --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
>> > +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
>> > @@ -188,7 +188,7 @@ static void vb2_dma_sg_put(void *buf_priv)
>> >               dma_unmap_sgtable(buf->dev, sgt, buf->dma_dir,
>> >                                 DMA_ATTR_SKIP_CPU_SYNC);
>> >               if (buf->vaddr)
>> > -                     vm_unmap_ram(buf->vaddr, buf->num_pages);
>> > +                     vunmap(buf->vaddr);
>> >               sg_free_table(buf->dma_sgt);
>> >               while (--i >=3D 0)
>> >                       __free_page(buf->pages[i]);
>> > @@ -289,7 +289,7 @@ static void vb2_dma_sg_put_userptr(void *buf_priv)
>> >              __func__, buf->num_pages);
>> >       dma_unmap_sgtable(buf->dev, sgt, buf->dma_dir, DMA_ATTR_SKIP_CPU=
_SYNC);
>> >       if (buf->vaddr)
>> > -             vm_unmap_ram(buf->vaddr, buf->num_pages);
>> > +             vunmap(buf->vaddr);
>> >       sg_free_table(buf->dma_sgt);
>> >       if (buf->dma_dir =3D=3D DMA_FROM_DEVICE ||
>> >           buf->dma_dir =3D=3D DMA_BIDIRECTIONAL)
>> > @@ -312,7 +312,8 @@ static void *vb2_dma_sg_vaddr(struct vb2_buffer *v=
b, void *buf_priv)
>> >                       ret =3D dma_buf_vmap(buf->db_attach->dmabuf, &ma=
p);
>> >                       buf->vaddr =3D ret ? NULL : map.vaddr;
>> >               } else {
>> > -                     buf->vaddr =3D vm_map_ram(buf->pages, buf->num_p=
ages, -1);
>> > +                     buf->vaddr =3D vmap(buf->pages, buf->num_pages, =
VM_MAP,
>> > +                                       PAGE_KERNEL);
>> >               }
>> >       }
>> >
>>
>

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--sdtB3X0nJg68CQEu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmRbqUIACgkQC+njFXoe
LGQdJRAAwPrIEAQ/PU5Lp14o7hRfUXZQsFECknFBKTb2EtBn6MVrEVDr9kO5lmeA
/ZW4g1t/+TY30B+cRyeifVsNJfaarXz5Wf8R/P3CUTtvsr1jksUniIqNaRp9Kz/y
9TdFdF9xujajTGrp/Fc7qfsMenB1QcfXyDQ9kH7c+krSEvj1tqBrXVmVbtEbeYg7
k9Vd8y3OF/RwqaRKiq2hzMFV0IXmuTTeQsTQ2BecRcBaR6ltRBk9zitNJOF7av5B
9DMCwzbJvBNhoVo+u3fGb9fuPTVMy9B5RRCFKEFSe/aBwPzJHRmS08H4AgDzEkwg
B1CNrlGijLwONa306TFP2d6ARfJc1HlOqGqxEm97i1iKsclBGupI3UBAo5HWcDxQ
HnDSrbmdJccTqTTpb4pON7oBiokKj3sZ5Ku9rFldy7Lsbn3CCSJYdonJb8MLUifS
THXm0magV6AFChZWk1290MgCbKIaypbIJ9YUqFtgKQ9UaEJtaBl+jXtVW0/7PBEo
pKprfwvsd+g8sVWCdSapoxYPUwP/6XBqp5F8Y0AfJanedLMkQZimEQg3Ii+Smc5T
HYO9vTDe5Yv0MOkoMmcqlrHNhWXmd1i7h+BZwURiSjG817psYOxTBVW+nM5eK3KL
0OTH9w9AEGLDgxaeuTYnanC58oG2Ho3ucn+F0UWqMnZ1Qe5l5Hk=
=UL6W
-----END PGP SIGNATURE-----

--sdtB3X0nJg68CQEu--
