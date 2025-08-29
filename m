Return-Path: <linux-media+bounces-41350-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4487B3C235
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 20:03:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 659C0A22E03
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 18:03:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF73734164C;
	Fri, 29 Aug 2025 18:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="o3Y5aoCu"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373433090DB;
	Fri, 29 Aug 2025 18:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756490621; cv=none; b=tiPFdxVJl47NY4Mn2vkargX4uFbeQyIqcQQBT8REoyM1jJyCTNueND4DQI7cAcAMspL75Yb767N/yIghxdYMowdpwxZw54hPv0kg9XmEavVYO16YNGFmcRaDbVYVbncN7ruUu2K63GE5gQt7wJlppnMgFmf7YUNT/UnfsQNKclw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756490621; c=relaxed/simple;
	bh=ae9NfavzUih8dLP3LyefmIM2zL228f+H5fV25gOfX3A=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CoTwNou2U454MreKbulmJBp/xgcl3nuOhiu4M5v8sB1S6P+MGuFAuZefPQnvQZsuz8Hpl0Zy8cvN1R91q3U/Ys5oxFq+BlZ30Qgf3ChQIJ9r71epNIJIhlyqC0ljD6CVkWsaB3MZ8CtL/eg+LSKeydQeuglIHIy9HtY9Ga0Is6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=o3Y5aoCu; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756490616;
	bh=ae9NfavzUih8dLP3LyefmIM2zL228f+H5fV25gOfX3A=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=o3Y5aoCu9bRiwvv0lRLiV2wSctdHR4Sis8hvMFdzgZbElecJo6Fs1kXJmf7+x3oQv
	 v/u1g8k4ngBBQ1b3OC6yejnddc5JvMJa8gXRauC+KGDcBw4GEhcz26GbrLwbQNJBy2
	 wusc4zKhLWJPJ+FZabjTtkuikWItBDCQbZ6UbsfB7XYuZVCyjLuutmp2EKhnDOLVOd
	 nMFaa7Ly7F9/hEoseBc6wbGzPG+fUEaF8kMlzNqmVqtW91uEwssZbpeXRH6ONdBJaH
	 LfyQJnff+4sexrP27Ewr37ftQHA5DK4B9VwgLS2+4QAAmZATMWCXMkDpzEIj+EFdMO
	 AQioEh51Y5D0g==
Received: from [IPv6:2606:6d00:11:5a76::5ac] (unknown [IPv6:2606:6d00:11:5a76::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 42C4917E1259;
	Fri, 29 Aug 2025 20:03:35 +0200 (CEST)
Message-ID: <95eaccb7612bdfa798c8d69071dbcf66326b8cba.camel@collabora.com>
Subject: Re: [PATCH v3 1/4] media: chips-media: wave5: Fix SError of kernel
 panic when closed
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: "Jackson.lee" <jackson.lee@chipsnmedia.com>, mchehab@kernel.org, 
	hverkuil-cisco@xs4all.nl, bob.beckett@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	lafley.kim@chipsnmedia.com, b-brnich@ti.com, hverkuil@xs4all.nl, 
	nas.chung@chipsnmedia.com
Date: Fri, 29 Aug 2025 14:03:33 -0400
In-Reply-To: <20250623002153.51-2-jackson.lee@chipsnmedia.com>
References: <20250623002153.51-1-jackson.lee@chipsnmedia.com>
	 <20250623002153.51-2-jackson.lee@chipsnmedia.com>
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
	protocol="application/pgp-signature"; boundary="=-qcx6p61t5E39Vq8TX6Vn"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-qcx6p61t5E39Vq8TX6Vn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 23 juin 2025 =C3=A0 09:21 +0900, Jackson.lee a =C3=A9crit=C2=A0:
> From: Jackson Lee <jackson.lee@chipsnmedia.com>
>=20
> SError of kernel panic rarely happened while testing fluster.
> The root cause was to enter suspend mode because timeout of autosuspend
> delay happened.
>=20
> [=C2=A0=C2=A0 48.834439] SError Interrupt on CPU0, code 0x00000000bf00000=
0 -- SError
> [=C2=A0=C2=A0 48.834455] CPU: 0 UID: 0 PID: 1067 Comm: v4l2h265dec0:sr No=
t tainted
> 6.12.9-gc9e21a1ebd75-dirty #7
> [=C2=A0=C2=A0 48.834461] Hardware name: ti Texas Instruments J721S2 EVM/T=
exas
> Instruments J721S2 EVM, BIOS 2025.01-00345-gbaf3aaa8ecfa 01/01/2025
> [=C2=A0=C2=A0 48.834464] pstate: 20000005 (nzCv daif -PAN -UAO -TCO -DIT =
-SSBS BTYPE=3D--)
> [=C2=A0=C2=A0 48.834468] pc : wave5_dec_clr_disp_flag+0x40/0x80 [wave5]
> [=C2=A0=C2=A0 48.834488] lr : wave5_dec_clr_disp_flag+0x40/0x80 [wave5]
> [=C2=A0=C2=A0 48.834495] sp : ffff8000856e3a30
> [=C2=A0=C2=A0 48.834497] x29: ffff8000856e3a30 x28: ffff0008093f6010 x27:
> ffff000809158130
> [=C2=A0=C2=A0 48.834504] x26: 0000000000000000 x25: ffff00080b625000 x24:
> ffff000804a9ba80
> [=C2=A0=C2=A0 48.834509] x23: ffff000802343028 x22: ffff000809158150 x21:
> ffff000802218000
> [=C2=A0=C2=A0 48.834513] x20: ffff0008093f6000 x19: ffff0008093f6000 x18:
> 0000000000000000
> [=C2=A0=C2=A0 48.834518] x17: 0000000000000000 x16: 0000000000000000 x15:
> 0000ffff74009618
> [=C2=A0=C2=A0 48.834523] x14: 000000010000000c x13: 0000000000000000 x12:
> 0000000000000000
> [=C2=A0=C2=A0 48.834527] x11: ffffffffffffffff x10: ffffffffffffffff x9 :
> ffff000802343028
> [=C2=A0=C2=A0 48.834532] x8 : ffff00080b6252a0 x7 : 0000000000000038 x6 :
> 0000000000000000
> [=C2=A0=C2=A0 48.834536] x5 : ffff00080b625060 x4 : 0000000000000000 x3 :
> 0000000000000000
> [=C2=A0=C2=A0 48.834541] x2 : 0000000000000000 x1 : ffff800084bf0118 x0 :
> ffff800084bf0000
> [=C2=A0=C2=A0 48.834547] Kernel panic - not syncing: Asynchronous SError =
Interrupt
> [=C2=A0=C2=A0 48.834549] CPU: 0 UID: 0 PID: 1067 Comm: v4l2h265dec0:sr No=
t tainted
> 6.12.9-gc9e21a1ebd75-dirty #7
> [=C2=A0=C2=A0 48.834554] Hardware name: ti Texas Instruments J721S2 EVM/T=
exas
> Instruments J721S2 EVM, BIOS 2025.01-00345-gbaf3aaa8ecfa 01/01/2025
> [=C2=A0=C2=A0 48.834556] Call trace:
> [=C2=A0=C2=A0 48.834559]=C2=A0 dump_backtrace+0x94/0xec
> [=C2=A0=C2=A0 48.834574]=C2=A0 show_stack+0x18/0x24
> [=C2=A0=C2=A0 48.834579]=C2=A0 dump_stack_lvl+0x38/0x90
> [=C2=A0=C2=A0 48.834585]=C2=A0 dump_stack+0x18/0x24
> [=C2=A0=C2=A0 48.834588]=C2=A0 panic+0x35c/0x3e0
> [=C2=A0=C2=A0 48.834592]=C2=A0 nmi_panic+0x40/0x8c
> [=C2=A0=C2=A0 48.834595]=C2=A0 arm64_serror_panic+0x64/0x70
> [=C2=A0=C2=A0 48.834598]=C2=A0 do_serror+0x3c/0x78
> [=C2=A0=C2=A0 48.834601]=C2=A0 el1h_64_error_handler+0x34/0x4c
> [=C2=A0=C2=A0 48.834605]=C2=A0 el1h_64_error+0x64/0x68
> [=C2=A0=C2=A0 48.834608]=C2=A0 wave5_dec_clr_disp_flag+0x40/0x80 [wave5]
> [=C2=A0=C2=A0 48.834615]=C2=A0 wave5_vpu_dec_clr_disp_flag+0x54/0x80 [wav=
e5]
> [=C2=A0=C2=A0 48.834622]=C2=A0 wave5_vpu_dec_buf_queue+0x19c/0x1a0 [wave5=
]
> [=C2=A0=C2=A0 48.834628]=C2=A0 __enqueue_in_driver+0x3c/0x74 [videobuf2_c=
ommon]
> [=C2=A0=C2=A0 48.834639]=C2=A0 vb2_core_qbuf+0x508/0x61c [videobuf2_commo=
n]
> [=C2=A0=C2=A0 48.834646]=C2=A0 vb2_qbuf+0xa4/0x168 [videobuf2_v4l2]
> [=C2=A0=C2=A0 48.834656]=C2=A0 v4l2_m2m_qbuf+0x80/0x238 [v4l2_mem2mem]
> [=C2=A0=C2=A0 48.834666]=C2=A0 v4l2_m2m_ioctl_qbuf+0x18/0x24 [v4l2_mem2me=
m]
> [=C2=A0=C2=A0 48.834673]=C2=A0 v4l_qbuf+0x48/0x5c [videodev]
> [=C2=A0=C2=A0 48.834704]=C2=A0 __video_do_ioctl+0x180/0x3f0 [videodev]
> [=C2=A0=C2=A0 48.834725]=C2=A0 video_usercopy+0x2ec/0x68c [videodev]
> [=C2=A0=C2=A0 48.834745]=C2=A0 video_ioctl2+0x18/0x24 [videodev]
> [=C2=A0=C2=A0 48.834766]=C2=A0 v4l2_ioctl+0x40/0x60 [videodev]
> [=C2=A0=C2=A0 48.834786]=C2=A0 __arm64_sys_ioctl+0xa8/0xec
> [=C2=A0=C2=A0 48.834793]=C2=A0 invoke_syscall+0x44/0x100
> [=C2=A0=C2=A0 48.834800]=C2=A0 el0_svc_common.constprop.0+0xc0/0xe0
> [=C2=A0=C2=A0 48.834804]=C2=A0 do_el0_svc+0x1c/0x28
> [=C2=A0=C2=A0 48.834809]=C2=A0 el0_svc+0x30/0xd0
> [=C2=A0=C2=A0 48.834813]=C2=A0 el0t_64_sync_handler+0xc0/0xc4
> [=C2=A0=C2=A0 48.834816]=C2=A0 el0t_64_sync+0x190/0x194
> [=C2=A0=C2=A0 48.834820] SMP: stopping secondary CPUs
> [=C2=A0=C2=A0 48.834831] Kernel Offset: disabled
> [=C2=A0=C2=A0 48.834833] CPU features: 0x08,00002002,80200000,4200421b
> [=C2=A0=C2=A0 48.834837] Memory Limit: none
> [=C2=A0=C2=A0 49.161404] ---[ end Kernel panic - not syncing: Asynchronou=
s SError
> Interrupt ]---
>=20
> Fixes: 2092b3833487 ("media: chips-media: wave5: Support runtime
> suspend/resume")
> Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

cheers,
Nicolas

> ---
> =C2=A0.../platform/chips-media/wave5/wave5-vpu-dec.c=C2=A0=C2=A0=C2=A0 |=
=C2=A0 3 ---
> =C2=A0.../platform/chips-media/wave5/wave5-vpu-enc.c=C2=A0=C2=A0=C2=A0 |=
=C2=A0 3 ---
> =C2=A0.../media/platform/chips-media/wave5/wave5-vpu.c=C2=A0 |=C2=A0 2 +-
> =C2=A0.../platform/chips-media/wave5/wave5-vpuapi.c=C2=A0=C2=A0=C2=A0=C2=
=A0 | 15 ---------------
> =C2=A04 files changed, 1 insertion(+), 22 deletions(-)
>=20
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> index fd71f0c43ac3..216b024c42d8 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> @@ -1830,9 +1830,6 @@ static int wave5_vpu_open_dec(struct file *filp)
> =C2=A0	if (ret)
> =C2=A0		goto cleanup_inst;
> =C2=A0
> -	if (list_empty(&dev->instances))
> -		pm_runtime_use_autosuspend(inst->dev->dev);
> -
> =C2=A0	list_add_tail(&inst->list, &dev->instances);
> =C2=A0
> =C2=A0	mutex_unlock(&dev->dev_lock);
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> index 1e5fc5f8b856..cf20f774ed1b 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> @@ -1774,9 +1774,6 @@ static int wave5_vpu_open_enc(struct file *filp)
> =C2=A0	if (ret)
> =C2=A0		goto cleanup_inst;
> =C2=A0
> -	if (list_empty(&dev->instances))
> -		pm_runtime_use_autosuspend(inst->dev->dev);
> -
> =C2=A0	list_add_tail(&inst->list, &dev->instances);
> =C2=A0
> =C2=A0	mutex_unlock(&dev->dev_lock);
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
> b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
> index e1715d3f43b0..b3c633dd3df1 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
> @@ -322,7 +322,7 @@ static int wave5_vpu_probe(struct platform_device *pd=
ev)
> =C2=A0	dev_info(&pdev->dev, "Product Code:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0x%x\n", dev->product_code);
> =C2=A0	dev_info(&pdev->dev, "Firmware Revision: %u\n", fw_revision);
> =C2=A0
> -	pm_runtime_set_autosuspend_delay(&pdev->dev, 100);
> +	pm_runtime_set_autosuspend_delay(&pdev->dev, 500);
> =C2=A0	pm_runtime_use_autosuspend(&pdev->dev);
> =C2=A0	pm_runtime_enable(&pdev->dev);
> =C2=A0	wave5_vpu_sleep_wake(&pdev->dev, true, NULL, 0);
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
> b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
> index e5e879a13e8b..e94d6ebc9f81 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
> @@ -207,8 +207,6 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u3=
2
> *fail_res)
> =C2=A0	int retry =3D 0;
> =C2=A0	struct vpu_device *vpu_dev =3D inst->dev;
> =C2=A0	int i;
> -	int inst_count =3D 0;
> -	struct vpu_instance *inst_elm;
> =C2=A0
> =C2=A0	*fail_res =3D 0;
> =C2=A0	if (!inst->codec_info)
> @@ -250,11 +248,6 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u=
32
> *fail_res)
> =C2=A0
> =C2=A0	wave5_vdi_free_dma_memory(vpu_dev, &p_dec_info->vb_task);
> =C2=A0
> -	list_for_each_entry(inst_elm, &vpu_dev->instances, list)
> -		inst_count++;
> -	if (inst_count =3D=3D 1)
> -		pm_runtime_dont_use_autosuspend(vpu_dev->dev);
> -
> =C2=A0unlock_and_return:
> =C2=A0	mutex_unlock(&vpu_dev->hw_lock);
> =C2=A0	pm_runtime_put_sync(inst->dev->dev);
> @@ -720,8 +713,6 @@ int wave5_vpu_enc_close(struct vpu_instance *inst, u3=
2
> *fail_res)
> =C2=A0	int ret;
> =C2=A0	int retry =3D 0;
> =C2=A0	struct vpu_device *vpu_dev =3D inst->dev;
> -	int inst_count =3D 0;
> -	struct vpu_instance *inst_elm;
> =C2=A0
> =C2=A0	*fail_res =3D 0;
> =C2=A0	if (!inst->codec_info)
> @@ -764,12 +755,6 @@ int wave5_vpu_enc_close(struct vpu_instance *inst, u=
32
> *fail_res)
> =C2=A0	}
> =C2=A0
> =C2=A0	wave5_vdi_free_dma_memory(vpu_dev, &p_enc_info->vb_task);
> -
> -	list_for_each_entry(inst_elm, &vpu_dev->instances, list)
> -		inst_count++;
> -	if (inst_count =3D=3D 1)
> -		pm_runtime_dont_use_autosuspend(vpu_dev->dev);
> -
> =C2=A0	mutex_unlock(&vpu_dev->hw_lock);
> =C2=A0	pm_runtime_put_sync(inst->dev->dev);
> =C2=A0

--=-qcx6p61t5E39Vq8TX6Vn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaLHrdQAKCRDZQZRRKWBy
9EbHAQDtlihcnxUuYzHSS78oM8pAkBY0bGwGt6WYoot1A36mPQEAqw0VgijWbMIv
oMTIqoOzgz9gX0jbt7pIsr3EBZqy6gA=
=MGLG
-----END PGP SIGNATURE-----

--=-qcx6p61t5E39Vq8TX6Vn--

