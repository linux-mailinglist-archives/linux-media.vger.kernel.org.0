Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C0FF67A5F2
	for <lists+linux-media@lfdr.de>; Tue, 24 Jan 2023 23:36:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234110AbjAXWgY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Jan 2023 17:36:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233778AbjAXWgW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Jan 2023 17:36:22 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4638D4E529
        for <linux-media@vger.kernel.org>; Tue, 24 Jan 2023 14:35:50 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1pKRsV-0008Uy-AJ; Tue, 24 Jan 2023 23:34:55 +0100
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1pKRsT-0002s3-UZ; Tue, 24 Jan 2023 23:34:53 +0100
Date:   Tue, 24 Jan 2023 23:34:53 +0100
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     linux-media@vger.kernel.org, gregkh@linuxfoundation.org,
        balbi@kernel.org, laurent.pinchart@ideasonboard.com,
        kernel@pengutronix.de, stable <stable@kernel.org>
Subject: Re: [PATCH v2 1/2] media: videobuf2-dma-sg: fix vmap and vunmap
 callbacks
Message-ID: <20230124223453.GB7611@pengutronix.de>
References: <20221125153450.344392-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="R3G7APHDIzY6R/pk"
Content-Disposition: inline
In-Reply-To: <20221125153450.344392-1-m.grzeschik@pengutronix.de>
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
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--R3G7APHDIzY6R/pk
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Gentle Ping!

On Fri, Nov 25, 2022 at 04:34:49PM +0100, Michael Grzeschik wrote:
>For dmabuf import users to be able to use the vaddr from another
>videobuf2-dma-sg source, the exporter needs to set a proper vaddr on
>vb2_dma_sg_dmabuf_ops_vmap callback.
>
>This patch adds vm_map_ram on map if buf->vaddr was not set, and also
>adds the vb2_dma_sg_dmabuf_ops_vunmap function to remove the mapping
>afterwards.
>
>Cc: stable <stable@kernel.org>
>Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>
>---
>v1 -> v2: using vmap and vunmap instead of vm_map_ram and vm_unmap_ram
>
> .../media/common/videobuf2/videobuf2-dma-sg.c    | 16 ++++++++++++++++
> 1 file changed, 16 insertions(+)
>
>diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/m=
edia/common/videobuf2/videobuf2-dma-sg.c
>index fa69158a65b1fd..dcb8de5ab3e84a 100644
>--- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
>+++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
>@@ -496,11 +496,26 @@ static int vb2_dma_sg_dmabuf_ops_vmap(struct dma_buf=
 *dbuf,
> {
> 	struct vb2_dma_sg_buf *buf =3D dbuf->priv;
>
>+	if (!buf->vaddr)
>+		buf->vaddr =3D vmap(buf->pages, buf->num_pages, VM_MAP,
>+				  PAGE_KERNEL);
>+
> 	iosys_map_set_vaddr(map, buf->vaddr);
>
> 	return 0;
> }
>
>+static void vb2_dma_sg_dmabuf_ops_vunmap(struct dma_buf *dbuf,
>+				      struct iosys_map *map)
>+{
>+	struct vb2_dma_sg_buf *buf =3D dbuf->priv;
>+
>+	if (buf->vaddr)
>+		vunmap(buf->vaddr);
>+
>+	buf->vaddr =3D NULL;
>+}
>+
> static int vb2_dma_sg_dmabuf_ops_mmap(struct dma_buf *dbuf,
> 	struct vm_area_struct *vma)
> {
>@@ -515,6 +530,7 @@ static const struct dma_buf_ops vb2_dma_sg_dmabuf_ops =
=3D {
> 	.begin_cpu_access =3D vb2_dma_sg_dmabuf_ops_begin_cpu_access,
> 	.end_cpu_access =3D vb2_dma_sg_dmabuf_ops_end_cpu_access,
> 	.vmap =3D vb2_dma_sg_dmabuf_ops_vmap,
>+	.vunmap =3D vb2_dma_sg_dmabuf_ops_vunmap,
> 	.mmap =3D vb2_dma_sg_dmabuf_ops_mmap,
> 	.release =3D vb2_dma_sg_dmabuf_ops_release,
> };
>--=20
>2.30.2
>

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--R3G7APHDIzY6R/pk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmPQXQsACgkQC+njFXoe
LGS69RAAibc0X4wb2SgUdW6gHJEIGjEQ+RmvNVXvFko0nYxmmwYbD2NGuMwLsPQx
zmT98lQwxycwQ88/ftrMmJplJc8Hg1+166ex4CsWJtdEURpZu+3g5pTM6Ak2CrOM
BIRzp8rfTWcOaHRuc4sz6txfEswkr3OwPQ9d+dcBA/wGMMsMb7IgdqvNPQa1LcXG
D+Pxq8vDcHDMNNVopFNu4zDiPaHnP55ScXOR+8h3sWZfiOvpGpNlLpemOcdYDlul
HaV0XNNHlkH8srpTNhdNpBhKxtvmx2QjYR+sPZU8XcLDIRRWzh/PoGt1uoiewxNg
8ffZieowyaDBYcP3xpYFxzGXX/f8nweT3zMAgF8B8Qg7bUIRIxKU0xr4N1DcJ1v/
8aswpncwfHSvSMVRBXU5biuxTNNTkYhJ1mZ2NTGja/HfxwfiySgFNQF3voIahVxt
SG+NvuqAIYGIAFcfHYGdifBB7F4NC/J6XW8rwmZ7c1CeUN+rKO+0YeXx5BRtAgxd
+9K/dkDPA1uBvv95bUwnuzrBQWILywg571qTEj8+d3YVz9m3IjD4DFB4LiyaShhm
SxMHag753uOLXDNh1phUT9wRYaD7Oq+FT7nH89vB/fqNQEf8Q8Xw7eBpgCeKbpTH
2+fsdshacWy1KkWAP8WTnjld8EJqjKdITET0VIYVC9zCGbHAob8=
=shkw
-----END PGP SIGNATURE-----

--R3G7APHDIzY6R/pk--
