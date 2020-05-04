Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AE721C4312
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 19:40:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730205AbgEDRky (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 13:40:54 -0400
Received: from mx2.suse.de ([195.135.220.15]:42024 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729597AbgEDRky (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 4 May 2020 13:40:54 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id BE7E3AEEE;
        Mon,  4 May 2020 17:40:53 +0000 (UTC)
Message-ID: <00cc89e24aa5c3d4286b6f42347aa87e7699c4e5.camel@suse.de>
Subject: Re: [PATCH v2 29/34] staging: vchiq: Add 36-bit address support
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Niklas =?ISO-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>,
        Naushir Patuck <naush@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.org>
Date:   Mon, 04 May 2020 19:40:50 +0200
In-Reply-To: <20200504092611.9798-30-laurent.pinchart@ideasonboard.com>
References: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
         <20200504092611.9798-30-laurent.pinchart@ideasonboard.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-MwYIV7ZwdThTmAOcsIkg"
User-Agent: Evolution 3.36.2 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-MwYIV7ZwdThTmAOcsIkg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Phil, Laurent,

On Mon, 2020-05-04 at 12:26 +0300, Laurent Pinchart wrote:
> From: Phil Elwell <phil@raspberrypi.org>
>=20
> Conditional on a new compatible string, change the pagelist encoding
> such that the top 24 bits are the pfn, leaving 8 bits for run length
> (-1).
>=20
> Signed-off-by: Phil Elwell <phil@raspberrypi.org>
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  .../interface/vchiq_arm/vchiq_2835_arm.c      | 88 ++++++++++++++-----
>  .../interface/vchiq_arm/vchiq_arm.c           |  6 ++
>  .../interface/vchiq_arm/vchiq_arm.h           |  1 +
>  3 files changed, 74 insertions(+), 21 deletions(-)
>=20
> diff --git
> a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_2835_arm.c
> b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_2835_arm.c
> index 3e422a7eb3f1..ecec84ad4345 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_2835_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_2835_arm.c
> @@ -16,6 +16,8 @@
>  #include <soc/bcm2835/raspberrypi-firmware.h>
> =20
>  #define TOTAL_SLOTS (VCHIQ_SLOT_ZERO_SLOTS + 2 * 32)
> +#define VC_SAFE(x) (g_use_36bit_addrs ? ((u32)(x) | 0xc0000000) : (u32)(=
x))
> +#define IS_VC_SAFE(x) (g_use_36bit_addrs ? !((x) & ~0x3fffffffull) : 1)

As I commented earlier, this is a sign your dma-ranges are wrong, most of t=
he
code below reimplements what is already done by dma-direct (see
kernel/dma/direct.c). Once properly setup, you should be able to use whatev=
er
phys address dmam_alloc_coherent() provides and drop g_use_36bit_addrs.

Note that on arm32+LPAE, dma-direct/swiotlb are the default dma_ops, so thi=
s
also applies there.

Regards,
Nicolas

>  #include "vchiq_arm.h"
>  #include "vchiq_connected.h"
> @@ -62,6 +64,7 @@ static void __iomem *g_regs;
>   */
>  static unsigned int g_cache_line_size =3D 32;
>  static struct dma_pool *g_dma_pool;
> +static unsigned int g_use_36bit_addrs =3D 0;
>  static unsigned int g_fragments_size;
>  static char *g_fragments_base;
>  static char *g_free_fragments;
> @@ -104,6 +107,8 @@ int vchiq_platform_init(struct platform_device *pdev,
> struct vchiq_state *state)
>  	g_cache_line_size =3D drvdata->cache_line_size;
>  	g_fragments_size =3D 2 * g_cache_line_size;
> =20
> +	g_use_36bit_addrs =3D (dev->dma_pfn_offset =3D=3D 0);
> +
>  	/* Allocate space for the channels in coherent memory */
>  	slot_mem_size =3D PAGE_ALIGN(TOTAL_SLOTS * VCHIQ_SLOT_SIZE);
>  	frag_mem_size =3D PAGE_ALIGN(g_fragments_size * MAX_FRAGMENTS);
> @@ -115,14 +120,21 @@ int vchiq_platform_init(struct platform_device *pde=
v,
> struct vchiq_state *state)
>  		return -ENOMEM;
>  	}
> =20
> +	if (!IS_VC_SAFE(slot_phys)) {
> +		dev_err(dev, "allocated DMA memory %pad is not VC-safe\n",
> +			&slot_phys);
> +		return -ENOMEM;
> +	}
> +
>  	WARN_ON(((unsigned long)slot_mem & (PAGE_SIZE - 1)) !=3D 0);
> +	channelbase =3D VC_SAFE(slot_phys);
> =20
>  	vchiq_slot_zero =3D vchiq_init_slots(slot_mem, slot_mem_size);
>  	if (!vchiq_slot_zero)
>  		return -EINVAL;
> =20
>  	vchiq_slot_zero->platform_data[VCHIQ_PLATFORM_FRAGMENTS_OFFSET_IDX] =3D
> -		(int)slot_phys + slot_mem_size;
> +		channelbase + slot_mem_size;
>  	vchiq_slot_zero->platform_data[VCHIQ_PLATFORM_FRAGMENTS_COUNT_IDX] =3D
>  		MAX_FRAGMENTS;
> =20
> @@ -155,7 +167,6 @@ int vchiq_platform_init(struct platform_device *pdev,
> struct vchiq_state *state)
>  	}
> =20
>  	/* Send the base address of the slots to VideoCore */
> -	channelbase =3D slot_phys;
>  	err =3D rpi_firmware_property(fw, RPI_FIRMWARE_VCHIQ_INIT,
>  				    &channelbase, sizeof(channelbase));
>  	if (err || channelbase) {
> @@ -241,7 +252,7 @@ vchiq_prepare_bulk_data(struct vchiq_bulk *bulk, void
> *offset, int size,
>  	if (!pagelistinfo)
>  		return VCHIQ_ERROR;
> =20
> -	bulk->data =3D (void *)(unsigned long)pagelistinfo->dma_addr;
> +	bulk->data =3D (void *)VC_SAFE(pagelistinfo->dma_addr);
> =20
>  	/*
>  	 * Store the pagelistinfo address in remote_data,
> @@ -475,25 +486,60 @@ create_pagelist(char __user *buf, size_t count, uns=
igned
> short type)
> =20
>  	/* Combine adjacent blocks for performance */
>  	k =3D 0;
> -	for_each_sg(scatterlist, sg, dma_buffers, i) {
> -		u32 len =3D sg_dma_len(sg);
> -		u32 addr =3D sg_dma_address(sg);
> +	if (g_use_36bit_addrs) {
> +		for_each_sg(scatterlist, sg, dma_buffers, i) {
> +			u32 len =3D sg_dma_len(sg);
> +			u64 addr =3D sg_dma_address(sg);
> +			u32 page_id =3D (u32)((addr >> 4) & ~0xff);
> +			u32 sg_pages =3D (len + PAGE_SIZE - 1) >> PAGE_SHIFT;
> =20
> -		/* Note: addrs is the address + page_count - 1
> -		 * The firmware expects blocks after the first to be page-
> -		 * aligned and a multiple of the page size
> -		 */
> -		WARN_ON(len =3D=3D 0);
> -		WARN_ON(i && (i !=3D (dma_buffers - 1)) && (len & ~PAGE_MASK));
> -		WARN_ON(i && (addr & ~PAGE_MASK));
> -		if (k > 0 &&
> -		    ((addrs[k - 1] & PAGE_MASK) +
> -		     (((addrs[k - 1] & ~PAGE_MASK) + 1) << PAGE_SHIFT))
> -		    =3D=3D (addr & PAGE_MASK))
> -			addrs[k - 1] +=3D ((len + PAGE_SIZE - 1) >> PAGE_SHIFT);
> -		else
> -			addrs[k++] =3D (addr & PAGE_MASK) |
> -				(((len + PAGE_SIZE - 1) >> PAGE_SHIFT) - 1);
> +			/* Note: addrs is the address + page_count - 1
> +			 * The firmware expects blocks after the first to be
> page-
> +			 * aligned and a multiple of the page size
> +			 */
> +			WARN_ON(len =3D=3D 0);
> +			WARN_ON(i &&
> +				(i !=3D (dma_buffers - 1)) && (len & ~PAGE_MASK));
> +			WARN_ON(i && (addr & ~PAGE_MASK));
> +			WARN_ON(upper_32_bits(addr) > 0xf);
> +			if (k > 0 &&
> +			    ((addrs[k - 1] & ~0xff) +
> +			     (((addrs[k - 1] & 0xff) + 1) << 8)
> +			     =3D=3D page_id)) {
> +				u32 inc_pages =3D min(sg_pages,
> +						    0xff - (addrs[k - 1] &
> 0xff));
> +				addrs[k - 1] +=3D inc_pages;
> +				page_id +=3D inc_pages << 8;
> +				sg_pages -=3D inc_pages;
> +			}
> +			while (sg_pages) {
> +				u32 inc_pages =3D min(sg_pages, 0x100u);
> +				addrs[k++] =3D page_id | (inc_pages - 1);
> +				page_id +=3D inc_pages << 8;
> +				sg_pages -=3D inc_pages;
> +			}
> +		}
> +	} else {
> +		for_each_sg(scatterlist, sg, dma_buffers, i) {
> +			u32 len =3D sg_dma_len(sg);
> +			u32 addr =3D VC_SAFE(sg_dma_address(sg));
> +			u32 new_pages =3D (len + PAGE_SIZE - 1) >> PAGE_SHIFT;
> +
> +			/* Note: addrs is the address + page_count - 1
> +			 * The firmware expects blocks after the first to be
> page-
> +			 * aligned and a multiple of the page size
> +			 */
> +			WARN_ON(len =3D=3D 0);
> +			WARN_ON(i && (i !=3D (dma_buffers - 1)) && (len &
> ~PAGE_MASK));
> +			WARN_ON(i && (addr & ~PAGE_MASK));
> +			if (k > 0 &&
> +			    ((addrs[k - 1] & PAGE_MASK) +
> +			     (((addrs[k - 1] & ~PAGE_MASK) + 1) << PAGE_SHIFT))
> +			    =3D=3D (addr & PAGE_MASK))
> +				addrs[k - 1] +=3D new_pages;
> +			else
> +				addrs[k++] =3D (addr & PAGE_MASK) | (new_pages -
> 1);
> +		}
>  	}
> =20
>  	/* Partial cache lines (fragments) require special measures */
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.=
c
> b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index d1a556f16499..dd3c8f829daa 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -117,6 +117,11 @@ static struct vchiq_drvdata bcm2836_drvdata =3D {
>  	.cache_line_size =3D 64,
>  };
> =20
> +static struct vchiq_drvdata bcm2711_drvdata =3D {
> +	.cache_line_size =3D 64,
> +	.use_36bit_addrs =3D true,
> +};
> +
>  static const char *const ioctl_names[] =3D {
>  	"CONNECT",
>  	"SHUTDOWN",
> @@ -2710,6 +2715,7 @@ void vchiq_platform_conn_state_changed(struct
> vchiq_state *state,
>  static const struct of_device_id vchiq_of_match[] =3D {
>  	{ .compatible =3D "brcm,bcm2835-vchiq", .data =3D &bcm2835_drvdata },
>  	{ .compatible =3D "brcm,bcm2836-vchiq", .data =3D &bcm2836_drvdata },
> +	{ .compatible =3D "brcm,bcm2711-vchiq", .data =3D &bcm2711_drvdata },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, vchiq_of_match);
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.=
h
> b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
> index 0784c5002417..f8b1c005af62 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
> @@ -52,6 +52,7 @@ struct vchiq_arm_state {
> =20
>  struct vchiq_drvdata {
>  	const unsigned int cache_line_size;
> +	const bool use_36bit_addrs;
>  	struct rpi_firmware *fw;
>  };
> =20


--=-MwYIV7ZwdThTmAOcsIkg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl6wU6IACgkQlfZmHno8
x/7SyQf+MZzbZbwNfAF8ZpCx54NZf/o05U9g9Bo2TrqCDk402d32DxMjFDnR6nCh
NjxjFXFjvao7IixJ7qZ/SQsgsuOAtfgaNykBzevODolefJkErcrstOsdLG+59DYV
hzEt8qBpPyJxLND+fjITlH04MM+M8hI/Le3iP80aW+thj+bhXEY5RB12HRVcgKa4
Ney3VrsZpwkdXf/fvcOBZQY6/7XtomA/UIpe2QKCpQQMHWomdgsO7vC+Fvi6Rzr8
5kJ+gPM2k/ZGwM1dV7TSZlB2VkWfYqNfignch+IuW9RpClSzDQU2xd3LfkWd1Yyo
F+B+ihM4PDoc1bm7OAYUeugukD0Vxw==
=UDkI
-----END PGP SIGNATURE-----

--=-MwYIV7ZwdThTmAOcsIkg--

