Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6494031B6B8
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 10:52:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230353AbhBOJug (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Feb 2021 04:50:36 -0500
Received: from mx2.suse.de ([195.135.220.15]:41250 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230345AbhBOJuf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Feb 2021 04:50:35 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 8E166ADDB;
        Mon, 15 Feb 2021 09:49:52 +0000 (UTC)
To:     =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        linux-media <linux-media@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linaro-mm-sig@lists.linaro.org, lkml <linux-kernel@vger.kernel.org>
Cc:     "Sharma, Shashank" <Shashank.Sharma@amd.com>
References: <91ff0bbb-ea3a-2663-3453-dea96ccd6dd8@amd.com>
From:   Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: DMA-buf and uncached system memory
Message-ID: <e6897f92-4c61-cd42-2822-43c50a744d4c@suse.de>
Date:   Mon, 15 Feb 2021 10:49:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <91ff0bbb-ea3a-2663-3453-dea96ccd6dd8@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="LluPYbmWKdgRFCbIZHJRJ0mnf2n5y8vWh"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--LluPYbmWKdgRFCbIZHJRJ0mnf2n5y8vWh
Content-Type: multipart/mixed; boundary="WqE607JVvyKj3o3LH8LRRld6sBuAbrkEo";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linux-media <linux-media@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org,
 lkml <linux-kernel@vger.kernel.org>
Cc: "Sharma, Shashank" <Shashank.Sharma@amd.com>
Message-ID: <e6897f92-4c61-cd42-2822-43c50a744d4c@suse.de>
Subject: Re: DMA-buf and uncached system memory
References: <91ff0bbb-ea3a-2663-3453-dea96ccd6dd8@amd.com>
In-Reply-To: <91ff0bbb-ea3a-2663-3453-dea96ccd6dd8@amd.com>

--WqE607JVvyKj3o3LH8LRRld6sBuAbrkEo
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 15.02.21 um 09:58 schrieb Christian K=C3=B6nig:
> Hi guys,
>=20
> we are currently working an Freesync and direct scan out from system=20
> memory on AMD APUs in A+A laptops.
>=20
> On problem we stumbled over is that our display hardware needs to scan =

> out from uncached system memory and we currently don't have a way to=20
> communicate that through DMA-buf.
>=20
> For our specific use case at hand we are going to implement something=20
> driver specific, but the question is should we have something more=20
> generic for this?

For vmap operations, we return the address as struct dma_buf_map, which=20
contains additional information about the memory buffer. In vram=20
helpers, we have the interface drm_gem_vram_offset() that returns the=20
offset of the GPU device memory.

Would it be feasible to combine both concepts into a dma-buf interface=20
that returns the device-memory offset plus the additional caching flag?

There'd be a structure and a getter function returning the structure.

struct dma_buf_offset {
	bool cached;
	u64 address;
};

// return offset in *off
int dma_buf_offset(struct dma_buf *buf, struct dma_buf_off *off);

Whatever settings are returned by dma_buf_offset() are valid while the=20
dma_buf is pinned.

Best regards
Thomas

>=20
> After all the system memory access pattern is a PCIe extension and as=20
> such something generic.
>=20
> Regards,
> Christian.
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--WqE607JVvyKj3o3LH8LRRld6sBuAbrkEo--

--LluPYbmWKdgRFCbIZHJRJ0mnf2n5y8vWh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAqQ78FAwAAAAAACgkQlh/E3EQov+DT
8RAAgPMFZgw0YGSkfKlQB+8K2KbUEA9pbSX/KVkX7kscn7E54s4ESbQmqNM8DTnKiBiHtHY1wa22
LkgLGAqngffUNHLaPPCB1dcf7xhT2NhpDjDPoGRQ44sWuJEPmlE+i4EzLeqqRtK/FB0U+KKziSIP
rANbiI5osQeldOw1B/8tsGuYC2ylk4zCACMIgQJJGggXDxzChBb4Ax+SWVNRcFWMvUYTnKbsb1kB
l6HSWDqM3BjggMk8G6rniidWjEI7iz9cDNUZEU4GYNKN4ug34Y9ulXtynw65xLh8M6CXP3sZ1yi2
pKUjzMPosxq2RDB+PB6SJSfqcyHdbSaFpV25nPY9STkwGAdUU9hob/HDiu3R0K1yth32MF3ebGwX
744d3JhA13Q81iJQczCUEDSL7KQHqFOpGizuMfEnes9jEAKDxnHC/RDkZ8rRPFKa8fUV2tuiDycP
GtG2HoO49xrB6pJ8VJrxizBicE7u9QFS6QLDRSidG9WK0f0g1SKcbu4e/GhWNuBCQyBd2ptxq8B+
Eq+PdGQRQAG3Gq+knZwDhnYw/tiI+Yt72w9Wrfe8Q9nxobQr+tZigsASNJZlhZpTWVpafS8q+0jJ
WfuHfL/wvYK96x4a4pLSp6uSR3lhzRMwT+gNDMMlr0Y5HxWg2YyK7cqgYCNF5QFDEOmQokjE+26S
idA=
=YHd/
-----END PGP SIGNATURE-----

--LluPYbmWKdgRFCbIZHJRJ0mnf2n5y8vWh--
