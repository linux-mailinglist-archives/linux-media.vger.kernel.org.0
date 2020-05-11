Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7B6C1CE2F2
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 20:43:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731163AbgEKSnB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 May 2020 14:43:01 -0400
Received: from mx2.suse.de ([195.135.220.15]:55876 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729727AbgEKSnB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 14:43:01 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id E10ABAC40;
        Mon, 11 May 2020 18:43:01 +0000 (UTC)
Message-ID: <9b42ad8c4c39ac3873e7c3ea2951bea1caef8bd1.camel@suse.de>
Subject: Re: [PATCH v2 06/34] staging: vc04_services: Add new vc-sm-cma
 driver
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Niklas =?ISO-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>,
        Naushir Patuck <naush@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>
Date:   Mon, 11 May 2020 20:42:57 +0200
In-Reply-To: <20200504092611.9798-7-laurent.pinchart@ideasonboard.com>
References: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
         <20200504092611.9798-7-laurent.pinchart@ideasonboard.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-wPP+hY/a92Z3c3Ov9kaN"
User-Agent: Evolution 3.36.2 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-wPP+hY/a92Z3c3Ov9kaN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dave,
some questions/comments.

On Mon, 2020-05-04 at 12:25 +0300, Laurent Pinchart wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.org>
>=20
> Add Broadcom VideoCore Shared Memory support.
>=20
> This new driver allows contiguous memory blocks to be imported
> into the VideoCore VPU memory map, and manages the lifetime of
> those objects, only releasing the source dmabuf once the VPU has
> confirmed it has finished with it.
>=20
> Driver upported from the RaspberryPi BSP at revision:
> 890691d1c996 ("staging: vc04_services: Fix vcsm overflow bug when countin=
g
> transactions")
> forward ported to recent mainline kernel version.
>=20
> Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---

[...]

> +
> +/* Import a dma_buf to be shared with VC. */
> +int
> +vc_sm_cma_import_dmabuf_internal(struct vc_sm_privdata_t *private,
> +				 struct dma_buf *dma_buf,
> +				 int fd,
> +				 struct dma_buf **imported_buf)
> +{
> +	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
> +	struct vc_sm_buffer *buffer =3D NULL;
> +	struct vc_sm_import import =3D { };
> +	struct vc_sm_import_result result =3D { };
> +	struct dma_buf_attachment *attach =3D NULL;
> +	struct sg_table *sgt =3D NULL;
> +	dma_addr_t dma_addr;
> +	int ret =3D 0;
> +	int status;
> +
> +	/* Setup our allocation parameters */
> +	pr_debug("%s: importing dma_buf %p/fd %d\n", __func__, dma_buf, fd);
> +
> +	if (fd < 0)
> +		get_dma_buf(dma_buf);
> +	else
> +		dma_buf =3D dma_buf_get(fd);
> +
> +	if (!dma_buf)
> +		return -EINVAL;
> +
> +	attach =3D dma_buf_attach(dma_buf, &sm_state->pdev->dev);
> +	if (IS_ERR(attach)) {
> +		ret =3D PTR_ERR(attach);
> +		goto error;
> +	}
> +
> +	sgt =3D dma_buf_map_attachment(attach, DMA_BIDIRECTIONAL);
> +	if (IS_ERR(sgt)) {
> +		ret =3D PTR_ERR(sgt);
> +		goto error;
> +	}
> +
> +	/* Verify that the address block is contiguous */
> +	if (sgt->nents !=3D 1) {
> +		ret =3D -ENOMEM;
> +		goto error;
> +	}
> +
> +	/* Allocate local buffer to track this allocation. */
> +	buffer =3D kzalloc(sizeof(*buffer), GFP_KERNEL);
> +	if (!buffer) {
> +		ret =3D -ENOMEM;
> +		goto error;
> +	}
> +
> +	import.type =3D VC_SM_ALLOC_NON_CACHED;
> +	dma_addr =3D sg_dma_address(sgt->sgl);
> +	import.addr =3D (u32)dma_addr;
> +	if ((import.addr & 0xC0000000) !=3D 0xC0000000) {
> +		pr_err("%s: Expecting an uncached alias for dma_addr %pad\n",
> +		       __func__, &dma_addr);
> +		import.addr |=3D 0xC0000000;
> +	}

Just so we don't forget about it, this shouldn't be needed once dma-ranges =
are
fixed.

> +	import.size =3D sg_dma_len(sgt->sgl);
> +	import.allocator =3D current->tgid;
> +	import.kernel_id =3D get_kernel_id(buffer);
> +
> +	memcpy(import.name, VC_SM_RESOURCE_NAME_DEFAULT,
> +	       sizeof(VC_SM_RESOURCE_NAME_DEFAULT));
> +
> +	pr_debug("[%s]: attempt to import \"%s\" data - type %u, addr %pad, siz=
e
> %u.\n",
> +		 __func__, import.name, import.type, &dma_addr, import.size);
> +
> +	/* Allocate the videocore buffer. */
> +	status =3D vc_sm_cma_vchi_import(sm_state->sm_handle, &import, &result,
> +				       &sm_state->int_trans_id);
> +	if (status =3D=3D -EINTR) {
> +		pr_debug("[%s]: requesting import memory action restart
> (trans_id: %u)\n",
> +			 __func__, sm_state->int_trans_id);
> +		ret =3D -ERESTARTSYS;
> +		private->restart_sys =3D -EINTR;
> +		private->int_action =3D VC_SM_MSG_TYPE_IMPORT;
> +		goto error;
> +	} else if (status || !result.res_handle) {
> +		pr_debug("[%s]: failed to import memory on videocore (status:
> %u, trans_id: %u)\n",
> +			 __func__, status, sm_state->int_trans_id);
> +		ret =3D -ENOMEM;
> +		goto error;
> +	}
> +
> +	mutex_init(&buffer->lock);
> +	INIT_LIST_HEAD(&buffer->attachments);
> +	memcpy(buffer->name, import.name,
> +	       min(sizeof(buffer->name), sizeof(import.name) - 1));
> +
> +	/* Keep track of the buffer we created. */
> +	buffer->private =3D private;
> +	buffer->vc_handle =3D result.res_handle;
> +	buffer->size =3D import.size;
> +	buffer->vpu_state =3D VPU_MAPPED;
> +
> +	buffer->imported =3D 1;
> +	buffer->import.dma_buf =3D dma_buf;
> +
> +	buffer->import.attach =3D attach;
> +	buffer->import.sgt =3D sgt;
> +	buffer->dma_addr =3D dma_addr;
> +	buffer->in_use =3D 1;
> +	buffer->kernel_id =3D import.kernel_id;
> +
> +	/*
> +	 * We're done - we need to export a new dmabuf chaining through most
> +	 * functions, but enabling us to release our own internal references
> +	 * here.
> +	 */
> +	exp_info.ops =3D &dma_buf_import_ops;
> +	exp_info.size =3D import.size;
> +	exp_info.flags =3D O_RDWR;
> +	exp_info.priv =3D buffer;
> +
> +	buffer->dma_buf =3D dma_buf_export(&exp_info);

Could you comment on the need for this second dma_buf? I've only reviewed c=
ode
related to mmal-vchiq imports, but it seems to me that it would be saner to=
 do
the unmapping and unattaching explicitly as opposed to having this second
buffer refcount hit 0. Although, I can imagine this being needed for the
userspace interface.

When you talk about moving to dmabuf heaps, I've pictured a specific dmabuf
heap for vc4 that takes care of all the importing and unimporting (aside fr=
om
cma allocations). Am I right? If so, I'm pretty confident we can do away wi=
th
this.

Regards,
Nicolas




--=-wPP+hY/a92Z3c3Ov9kaN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl65nLEACgkQlfZmHno8
x/463Af/dRfeXnCddovM+WKzVax26zXVGLOanGufICRAiOr8eMtHM1kbik272KJD
+yE0d0qpOEEE3vM4MsY4cuk/3JHDCg13Wk3l2vVZZJbXYJ1bd5QcvFvmrjUFKZW0
9bH5ZdsfD4721aoJBmutCOe0R29waFMYtj61Mj272/0QtJqtLP0BxsEtq10KBlpv
ScoJ1clXOt8eqG4q/0zTU8ph/wBdu3GGyyWAXUTto8bTSKHcqLKv/DMwAOImYuDa
jf+XRv0wAiCAw8CSuvj1CA1eEzJClovtByh+abOl5aM8MU2Ej77JFSkoQRlUS6i+
yh0pATzZ+8hWAQSfa5D1dQeHtwIMRA==
=EgzJ
-----END PGP SIGNATURE-----

--=-wPP+hY/a92Z3c3Ov9kaN--

