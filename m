Return-Path: <linux-media+bounces-49349-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF86CD614F
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 14:05:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E9503303198D
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 13:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C465F2D46BB;
	Mon, 22 Dec 2025 13:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="aWyPAl76"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39482D73A0;
	Mon, 22 Dec 2025 13:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766408692; cv=none; b=ZDPE/HeH3WG2qp26CT1UXdsr/9yO+B/ojMrUUJDF8FAiPaLUQspEdYJ/JGmXSqijaY2cMguz+2fSXXCAAaM1eGhX2D3MaNA0ljJc/xJEOw/o7zGGC191/k1KzNFl4BdyUqq31IWipCZg+xoAM3it3apIZHUHW5G5nciov489tZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766408692; c=relaxed/simple;
	bh=rraZQRIlDpd4vKLiDt4d8Pb7FaUd6fD8q1ZfCSISFuw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gjzato9Sy0bCZi+sBUFLSaJ4T9wV/3iL2jjdKYZnuT3ixLt40yOpoOpK2Ffx5tlKGN8OQ631EtdN7wJyezBrM65poa6G5Hjlz+ILdJnMQNSVndpeFhvZo1OmQtoGYyTgejNLvoirbJ0IiLDirS7J0b6LIqyxrds8cRlEZcksgbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=aWyPAl76; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1766408681;
	bh=rraZQRIlDpd4vKLiDt4d8Pb7FaUd6fD8q1ZfCSISFuw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=aWyPAl7682IxkirnWt7RewTBF3A89nrSjDLEooeextaWHe2lVFji1l+v5tOjMuUje
	 O3nqgAeCxjtI391KCpxA+fkP2WpCDY74mZNAnKuVQyfH6aehu5bMP9YP4PqveOG5UJ
	 4uFAkxssL2pL0xMPlfsdnYkCiIplPxQSIXZcDZcvkZyucEzZQhbazsoI6LA4IHZ0Yr
	 M8623Nn+n6WeRIrn5EMQAAZdmb+B5lXpyiM/v15KqZR28C3tI6Xv9eXXMsp/aXO2u3
	 XU/fkrbFvFLs0iVB9lZ+yN14yR5iaYBoeKzEvywzmPR4S+o8UW5ZIgL9SdrqGgcwaT
	 y2LFD6oTRsvfQ==
Received: from [IPv6:2606:6d00:17:7b4b::c41] (unknown [IPv6:2606:6d00:17:7b4b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B6F0617E0125;
	Mon, 22 Dec 2025 14:04:40 +0100 (CET)
Message-ID: <1f3e55873d33dbb52e89453b0c216b2ca5b24ca8.camel@collabora.com>
Subject: Re: [PATCH v2] media: chips-media: wave5: Fix Potential Probe
 Resource Leak
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: kernel test robot <lkp@intel.com>, Brandon Brnich <b-brnich@ti.com>, Nas
 Chung <nas.chung@chipsnmedia.com>, Jackson Lee
 <jackson.lee@chipsnmedia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-media@vger.kernel.org, Darren Etheridge <detheridge@ti.com>
Date: Mon, 22 Dec 2025 08:04:38 -0500
In-Reply-To: <202512202300.9OkWzU1c-lkp@intel.com>
References: <20251216213413.2799499-1-b-brnich@ti.com>
	 <202512202300.9OkWzU1c-lkp@intel.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-ArITD+HP4AWhWFd1wHlA"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-ArITD+HP4AWhWFd1wHlA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le samedi 20 d=C3=A9cembre 2025 =C3=A0 23:57 +0800, kernel test robot a =C3=
=A9crit=C2=A0:
> Hi Brandon,

Please ignore this error, I've simply asked this patch to be rebased to hel=
p
with a conflict in a PR I'll send today.

regards,
Nicolas

>=20
> kernel test robot noticed the following build errors:
>=20
> [auto build test ERROR on linuxtv-media-pending/master]
> [also build test ERROR on media-tree/master linus/master v6.19-rc1 next-
> 20251219]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>=20
> url:=C2=A0=C2=A0=C2=A0
> https://github.com/intel-lab-lkp/linux/commits/Brandon-Brnich/media-chips=
-media-wave5-Fix-Potential-Probe-Resource-Leak/20251217-053600
> base:=C2=A0=C2=A0 https://git.linuxtv.org/media-ci/media-pending.git=C2=
=A0master
> patch link:=C2=A0=C2=A0=C2=A0
> https://lore.kernel.org/r/20251216213413.2799499-1-b-brnich%40ti.com
> patch subject: [PATCH v2] media: chips-media: wave5: Fix Potential Probe
> Resource Leak
> config: hexagon-allmodconfig
> (https://download.01.org/0day-ci/archive/20251220/202512202300.9OkWzU1c-l=
kp@in
> tel.com/config)
> compiler: clang version 17.0.6
> (https://github.com/llvm/llvm-project=C2=A06009708b4367171ccdbf4b5905cb6a=
803753fe18
> )
> reproduce (this is a W=3D1 build):
> (https://download.01.org/0day-ci/archive/20251220/202512202300.9OkWzU1c-l=
kp@in
> tel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion
> of
> the same patch/commit), kindly add following tags
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes:
> > https://lore.kernel.org/oe-kbuild-all/202512202300.9OkWzU1c-lkp@intel.c=
om/
>=20
> All errors (new ones prefixed by >>):
>=20
> > > drivers/media/platform/chips-media/wave5/wave5-vpu.c:344:11: error: n=
o
> > > member named 'irq_thread' in 'struct vpu_device'
> =C2=A0=C2=A0=C2=A0=C2=A0 344 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 if (dev->irq_thread) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ~~~=C2=A0 ^
> =C2=A0=C2=A0 drivers/media/platform/chips-media/wave5/wave5-vpu.c:345:21:=
 error: no
> member named 'irq_thread' in 'struct vpu_device'
> =C2=A0=C2=A0=C2=A0=C2=A0 345 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kthread_stop(dev->ir=
q_thread);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ~~~=C2=A0 ^
> > > drivers/media/platform/chips-media/wave5/wave5-vpu.c:346:12: error: n=
o
> > > member named 'irq_sem' in 'struct vpu_device'
> =C2=A0=C2=A0=C2=A0=C2=A0 346 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 up(&dev->irq_sem);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 ~~~=C2=A0 ^
> =C2=A0=C2=A0 drivers/media/platform/chips-media/wave5/wave5-vpu.c:347:8: =
error: no
> member named 'irq_thread' in 'struct vpu_device'
> =C2=A0=C2=A0=C2=A0=C2=A0 347 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev->irq_thread =3D =
NULL;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 ~~~=C2=A0 ^
> =C2=A0=C2=A0 4 errors generated.
>=20
>=20
> vim +344 drivers/media/platform/chips-media/wave5/wave5-vpu.c
>=20
> =C2=A0=C2=A0 195=09
> =C2=A0=C2=A0 196	static int wave5_vpu_probe(struct platform_device *pdev)
> =C2=A0=C2=A0 197	{
> =C2=A0=C2=A0 198		int ret;
> =C2=A0=C2=A0 199		struct vpu_device *dev;
> =C2=A0=C2=A0 200		const struct wave5_match_data *match_data;
> =C2=A0=C2=A0 201		u32 fw_revision;
> =C2=A0=C2=A0 202=09
> =C2=A0=C2=A0 203		match_data =3D device_get_match_data(&pdev->dev);
> =C2=A0=C2=A0 204		if (!match_data) {
> =C2=A0=C2=A0 205			dev_err(&pdev->dev, "missing device match data\n");
> =C2=A0=C2=A0 206			return -EINVAL;
> =C2=A0=C2=A0 207		}
> =C2=A0=C2=A0 208=09
> =C2=A0=C2=A0 209		/* physical addresses limited to 32 bits */
> =C2=A0=C2=A0 210		ret =3D dma_set_mask_and_coherent(&pdev->dev,
> DMA_BIT_MASK(32));
> =C2=A0=C2=A0 211		if (ret) {
> =C2=A0=C2=A0 212			dev_err(&pdev->dev, "Failed to set DMA mask: %d\n",
> ret);
> =C2=A0=C2=A0 213			return ret;
> =C2=A0=C2=A0 214		}
> =C2=A0=C2=A0 215=09
> =C2=A0=C2=A0 216		dev =3D devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERN=
EL);
> =C2=A0=C2=A0 217		if (!dev)
> =C2=A0=C2=A0 218			return -ENOMEM;
> =C2=A0=C2=A0 219=09
> =C2=A0=C2=A0 220		dev->vdb_register =3D devm_platform_ioremap_resource(pd=
ev, 0);
> =C2=A0=C2=A0 221		if (IS_ERR(dev->vdb_register))
> =C2=A0=C2=A0 222			return PTR_ERR(dev->vdb_register);
> =C2=A0=C2=A0 223		ida_init(&dev->inst_ida);
> =C2=A0=C2=A0 224=09
> =C2=A0=C2=A0 225		mutex_init(&dev->dev_lock);
> =C2=A0=C2=A0 226		mutex_init(&dev->hw_lock);
> =C2=A0=C2=A0 227		dev_set_drvdata(&pdev->dev, dev);
> =C2=A0=C2=A0 228		dev->dev =3D &pdev->dev;
> =C2=A0=C2=A0 229=09
> =C2=A0=C2=A0 230		dev->resets =3D
> devm_reset_control_array_get_optional_exclusive(&pdev->dev);
> =C2=A0=C2=A0 231		if (IS_ERR(dev->resets)) {
> =C2=A0=C2=A0 232			return dev_err_probe(&pdev->dev, PTR_ERR(dev-
> >resets),
> =C2=A0=C2=A0 233					=C2=A0=C2=A0=C2=A0=C2=A0 "Failed to get reset
> control\n");
> =C2=A0=C2=A0 234		}
> =C2=A0=C2=A0 235=09
> =C2=A0=C2=A0 236		ret =3D reset_control_deassert(dev->resets);
> =C2=A0=C2=A0 237		if (ret)
> =C2=A0=C2=A0 238			return dev_err_probe(&pdev->dev, ret, "Failed to
> deassert resets\n");
> =C2=A0=C2=A0 239=09
> =C2=A0=C2=A0 240		ret =3D devm_clk_bulk_get_all(&pdev->dev, &dev->clks);
> =C2=A0=C2=A0 241=09
> =C2=A0=C2=A0 242		/* continue without clock, assume externally managed */
> =C2=A0=C2=A0 243		if (ret < 0) {
> =C2=A0=C2=A0 244			dev_warn(&pdev->dev, "Getting clocks, fail: %d\n",
> ret);
> =C2=A0=C2=A0 245			ret =3D 0;
> =C2=A0=C2=A0 246		}
> =C2=A0=C2=A0 247		dev->num_clks =3D ret;
> =C2=A0=C2=A0 248=09
> =C2=A0=C2=A0 249		ret =3D clk_bulk_prepare_enable(dev->num_clks, dev->clk=
s);
> =C2=A0=C2=A0 250		if (ret) {
> =C2=A0=C2=A0 251			dev_err(&pdev->dev, "Enabling clocks, fail: %d\n",
> ret);
> =C2=A0=C2=A0 252			goto err_reset_assert;
> =C2=A0=C2=A0 253		}
> =C2=A0=C2=A0 254=09
> =C2=A0=C2=A0 255		dev->sram_pool =3D of_gen_pool_get(pdev->dev.of_node, "=
sram",
> 0);
> =C2=A0=C2=A0 256		if (!dev->sram_pool)
> =C2=A0=C2=A0 257			dev_warn(&pdev->dev, "sram node not found\n");
> =C2=A0=C2=A0 258=09
> =C2=A0=C2=A0 259		dev->sram_size =3D match_data->sram_size;
> =C2=A0=C2=A0 260=09
> =C2=A0=C2=A0 261		dev->product_code =3D wave5_vdi_read_register(dev,
> VPU_PRODUCT_CODE_REGISTER);
> =C2=A0=C2=A0 262		ret =3D wave5_vdi_init(&pdev->dev);
> =C2=A0=C2=A0 263		if (ret < 0) {
> =C2=A0=C2=A0 264			dev_err(&pdev->dev, "wave5_vdi_init, fail: %d\n",
> ret);
> =C2=A0=C2=A0 265			goto err_clk_dis;
> =C2=A0=C2=A0 266		}
> =C2=A0=C2=A0 267		dev->product =3D wave5_vpu_get_product_id(dev);
> =C2=A0=C2=A0 268=09
> =C2=A0=C2=A0 269		dev->irq =3D platform_get_irq(pdev, 0);
> =C2=A0=C2=A0 270		if (dev->irq < 0) {
> =C2=A0=C2=A0 271			dev_err(&pdev->dev, "failed to get irq resource,
> falling back to polling\n");
> =C2=A0=C2=A0 272			hrtimer_setup(&dev->hrtimer,
> &wave5_vpu_timer_callback, CLOCK_MONOTONIC,
> =C2=A0=C2=A0 273				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 HRTIMER_MODE_REL_PINNE=
D);
> =C2=A0=C2=A0 274			dev->worker =3D kthread_run_worker(0,
> "vpu_irq_thread");
> =C2=A0=C2=A0 275			if (IS_ERR(dev->worker)) {
> =C2=A0=C2=A0 276				dev_err(&pdev->dev, "failed to create vpu irq
> worker\n");
> =C2=A0=C2=A0 277				ret =3D PTR_ERR(dev->worker);
> =C2=A0=C2=A0 278				goto err_vdi_release;
> =C2=A0=C2=A0 279			}
> =C2=A0=C2=A0 280			dev->vpu_poll_interval =3D vpu_poll_interval;
> =C2=A0=C2=A0 281			kthread_init_work(&dev->work, wave5_vpu_irq_work_fn);
> =C2=A0=C2=A0 282		} else {
> =C2=A0=C2=A0 283			ret =3D devm_request_threaded_irq(&pdev->dev, dev->irq=
,
> NULL,
> =C2=A0=C2=A0 284							wave5_vpu_irq_thread,
> IRQF_ONESHOT, "vpu_irq", dev);
> =C2=A0=C2=A0 285			if (ret) {
> =C2=A0=C2=A0 286				dev_err(&pdev->dev, "Register interrupt
> handler, fail: %d\n", ret);
> =C2=A0=C2=A0 287				goto err_enc_unreg;
> =C2=A0=C2=A0 288			}
> =C2=A0=C2=A0 289		}
> =C2=A0=C2=A0 290=09
> =C2=A0=C2=A0 291		INIT_LIST_HEAD(&dev->instances);
> =C2=A0=C2=A0 292		ret =3D v4l2_device_register(&pdev->dev, &dev->v4l2_dev=
);
> =C2=A0=C2=A0 293		if (ret) {
> =C2=A0=C2=A0 294			dev_err(&pdev->dev, "v4l2_device_register, fail:
> %d\n", ret);
> =C2=A0=C2=A0 295			goto err_irq_release;
> =C2=A0=C2=A0 296		}
> =C2=A0=C2=A0 297=09
> =C2=A0=C2=A0 298		if (match_data->flags & WAVE5_IS_DEC) {
> =C2=A0=C2=A0 299			ret =3D wave5_vpu_dec_register_device(dev);
> =C2=A0=C2=A0 300			if (ret) {
> =C2=A0=C2=A0 301				dev_err(&pdev->dev,
> "wave5_vpu_dec_register_device, fail: %d\n", ret);
> =C2=A0=C2=A0 302				goto err_v4l2_unregister;
> =C2=A0=C2=A0 303			}
> =C2=A0=C2=A0 304		}
> =C2=A0=C2=A0 305		if (match_data->flags & WAVE5_IS_ENC) {
> =C2=A0=C2=A0 306			ret =3D wave5_vpu_enc_register_device(dev);
> =C2=A0=C2=A0 307			if (ret) {
> =C2=A0=C2=A0 308				dev_err(&pdev->dev,
> "wave5_vpu_enc_register_device, fail: %d\n", ret);
> =C2=A0=C2=A0 309				goto err_dec_unreg;
> =C2=A0=C2=A0 310			}
> =C2=A0=C2=A0 311		}
> =C2=A0=C2=A0 312=09
> =C2=A0=C2=A0 313		ret =3D wave5_vpu_load_firmware(&pdev->dev, match_data-
> >fw_name, &fw_revision);
> =C2=A0=C2=A0 314		if (ret) {
> =C2=A0=C2=A0 315			dev_err(&pdev->dev, "wave5_vpu_load_firmware, fail:
> %d\n", ret);
> =C2=A0=C2=A0 316			goto err_enc_unreg;
> =C2=A0=C2=A0 317		}
> =C2=A0=C2=A0 318=09
> =C2=A0=C2=A0 319		dev_info(&pdev->dev, "Added wave5 driver with caps: %s =
%s\n",
> =C2=A0=C2=A0 320			 (match_data->flags & WAVE5_IS_ENC) ? "'ENCODE'" :
> "",
> =C2=A0=C2=A0 321			 (match_data->flags & WAVE5_IS_DEC) ? "'DECODE'" :
> "");
> =C2=A0=C2=A0 322		dev_info(&pdev->dev, "Product Code:=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 0x%x\n", dev-
> >product_code);
> =C2=A0=C2=A0 323		dev_info(&pdev->dev, "Firmware Revision: %u\n", fw_revi=
sion);
> =C2=A0=C2=A0 324=09
> =C2=A0=C2=A0 325		pm_runtime_set_autosuspend_delay(&pdev->dev, 100);
> =C2=A0=C2=A0 326		pm_runtime_use_autosuspend(&pdev->dev);
> =C2=A0=C2=A0 327		pm_runtime_enable(&pdev->dev);
> =C2=A0=C2=A0 328		wave5_vpu_sleep_wake(&pdev->dev, true, NULL, 0);
> =C2=A0=C2=A0 329=09
> =C2=A0=C2=A0 330		return 0;
> =C2=A0=C2=A0 331=09
> =C2=A0=C2=A0 332	err_enc_unreg:
> =C2=A0=C2=A0 333		if (match_data->flags & WAVE5_IS_ENC)
> =C2=A0=C2=A0 334			wave5_vpu_enc_unregister_device(dev);
> =C2=A0=C2=A0 335	err_dec_unreg:
> =C2=A0=C2=A0 336		if (match_data->flags & WAVE5_IS_DEC)
> =C2=A0=C2=A0 337			wave5_vpu_dec_unregister_device(dev);
> =C2=A0=C2=A0 338	err_v4l2_unregister:
> =C2=A0=C2=A0 339		v4l2_device_unregister(&dev->v4l2_dev);
> =C2=A0=C2=A0 340	err_irq_release:
> =C2=A0=C2=A0 341		if (dev->irq < 0)
> =C2=A0=C2=A0 342			kthread_destroy_worker(dev->worker);
> =C2=A0=C2=A0 343	err_vdi_release:
> =C2=A0> 344		if (dev->irq_thread) {
> =C2=A0=C2=A0 345			kthread_stop(dev->irq_thread);
> =C2=A0> 346			up(&dev->irq_sem);
> =C2=A0=C2=A0 347			dev->irq_thread =3D NULL;
> =C2=A0=C2=A0 348		}
> =C2=A0=C2=A0 349		wave5_vdi_release(&pdev->dev);
> =C2=A0=C2=A0 350	err_clk_dis:
> =C2=A0=C2=A0 351		clk_bulk_disable_unprepare(dev->num_clks, dev->clks);
> =C2=A0=C2=A0 352	err_reset_assert:
> =C2=A0=C2=A0 353		reset_control_assert(dev->resets);
> =C2=A0=C2=A0 354=09
> =C2=A0=C2=A0 355		return ret;
> =C2=A0=C2=A0 356	}
> =C2=A0=C2=A0 357=09

--=-ArITD+HP4AWhWFd1wHlA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUlB5gAKCRDZQZRRKWBy
9G5sAQCokd4SYyglsRmYxrmA2CWPXhm+bADNzimh+pxXN3G/OQD+MFQ+HRYXQdiQ
SJwfLmmU7PpCSi2vgBDwk2vjDrgkUwg=
=Yhkj
-----END PGP SIGNATURE-----

--=-ArITD+HP4AWhWFd1wHlA--

