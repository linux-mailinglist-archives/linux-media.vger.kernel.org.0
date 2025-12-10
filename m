Return-Path: <linux-media+bounces-48580-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2798CCB3E68
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 20:53:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1E5E83011A96
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 19:53:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95164329E67;
	Wed, 10 Dec 2025 19:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="A4C+ebs9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D420301470
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 19:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765396427; cv=none; b=mcReCn3E92NlPKNyebXvh+pJh5kb8R/gD/VXI1rWg691QzMBXjNa4r17v2Lm+6j5CMiIqok/4KvZv2ONwwsg2MERO1bovV7Ve2o9OtmstgTTdyqxPNMeLiInIPkRX0W63Y/rMq0oMkA7IVJWxfVNbOmQo5fTS/DB1YwP+ZgmtJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765396427; c=relaxed/simple;
	bh=/dDT7PxmkYrQpXbkgpJuAkPu5CAoRy7LxLc6hxngesk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=N5uxxkFdeGZKFmIW30b/J7lJbjUZ9d9ErzbIhYQNxDof3BVIb9QQvSmTOs/uNwgQ/4PRkXccdG1ksnJj08869O0XFBKPOohIyqeKpGNB8nhi6scKr0d9MAJDVSXh6yNjXU6fbVjET6ZyBHdJjJegU2uIepN/hB41eFJR59pKOQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=A4C+ebs9; arc=none smtp.client-ip=209.85.219.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f66.google.com with SMTP id 6a1803df08f44-8824ce9812cso2541146d6.0
        for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 11:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1765396421; x=1766001221; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oblBRbatwZC9Zf+D3Xrp5l+sBFMqpZcgS02zU+IwiFk=;
        b=A4C+ebs9iFQQr3nRAJ1lFtsJKX2rl5Vx2p001LlEnXcYCBHRFpWM/5tVEn/e1UTNna
         hK+Bm36IXaXXeFynd6q2G07ARu9FnI1Wqm4lRg2gTF4EZ7lqprI7Fq/wjJWw3k7ndu9b
         QtcTeP5uWMJwNsjcwQVlc6U3LCsmvhahzi3D3RgQWg38x5TBCv2z50dYoIXQZO7720Wp
         6zTYZxNKl1nHuV5/VDFUiq4b7FShpWnRo169/T62zSlfYCzjFGXh3TfMK6bbf2iNIf8M
         HN3XH/aAYZdxPZEJvaL9yf1EYpP7iDLnDiUTT9sEsiGYaqI7yqf1zsyBaYg4C8qKNDpE
         57cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765396421; x=1766001221;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oblBRbatwZC9Zf+D3Xrp5l+sBFMqpZcgS02zU+IwiFk=;
        b=oCAsIEKYJ0auwGvEbbM6ui+gA3NLWTcWJOP4dlK0FJjSGbjBpF0drT7Ta3KbQph8Mu
         f9FCYozoJGwxSwVKIFteqrpPVO1/xtYbKh4CxwH/upbqYqCsh+XJdslxVCLgb6Asdn4m
         39Dr88z4xmeoykTv6HenEeUqijpOA//SZ/s5vclGT0VsRDrGxKlIWvhYAbPrwMCCafAm
         YeLlENqUgTT7PCiY9dgbxPSoiqARbcqzWXKZfNLwd3ZWXlEu/+Gm0L64/xvISGu52iFC
         08xWTXPWIUYMLfOETwsrigIPpMzUsiIHxVJ6ysXTNXcYF6mTJmmuURwxT86C+DmB+U85
         ebfg==
X-Gm-Message-State: AOJu0YxgNVw4eWJ5+yL1CLkGRbdgGHHFmyxJZ5vOLLYbB9zXt75L7DdK
	GLSJM0dqf2T6ygwplmmUK9GdAwsEH2CGucKalBC/guBMWVHypYvAeGjcE9AizqU1n4M=
X-Gm-Gg: AY/fxX5zOuXs7Q7DeBvuMxSYYIzuhUxZgZOnG501Noop1uv9tEcch+ioOHpi/DWESUX
	tZPCXV8T+1x/K4K8rsi2et9cd0FnUsPOsnpzVWh46/MoFoI4Qp96ZeosVT3PV0W6wtcvrPhrLXK
	TqRzTqXUBM+FZeUUQgm3uV1unWRsJSj2CkCE3xt+oZr2g///QGuIgfOVB9i0RnILMUSn290z6gp
	ck+1mm9qi5LegBFKlUS1BTBqroLiTbYgI5EpdAzmiL76pY6sydXm4wyYMLl6bVG4+FFIhT01p3N
	C7rEpoALV1CV9QaRETfHO5DbMYJ+7j9bxPrF1vGxzQuZCVByJtPOhB0mSC1vPBIAcUhKM7WUn2p
	xF7BJyBQfJaFvrW7/OipxhcFhKHGriicpNAFMqJ8Wf0SmzGDAG/6hjBfQp2QX6Uv8hWCXmOPWk+
	NrSrGhbv+hAuBU/COh
X-Google-Smtp-Source: AGHT+IF8ya/58WIU3DLAyn+kPqIwmYhY9WWAxRjGku9lZqS9Iut4WADprwTW18Bo5nZJ+W+DB3mmHw==
X-Received: by 2002:a05:6214:3d9f:b0:880:40cf:ab8a with SMTP id 6a1803df08f44-88863ae961emr54184216d6.39.1765396420419;
        Wed, 10 Dec 2025 11:53:40 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8886ec2b99esm4974926d6.1.2025.12.10.11.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 11:53:39 -0800 (PST)
Message-ID: <7306c00b626f4030d92b908022b9a39669b07bb7.camel@ndufresne.ca>
Subject: Re: [PATCH v4 3/9] media: chips-media: wave6: Add Wave6 VPU
 interface
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Nas Chung <nas.chung@chipsnmedia.com>, mchehab@kernel.org, 
	hverkuil@xs4all.nl, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, 	shawnguo@kernel.org, s.hauer@pengutronix.de
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-imx@nxp.com, 
	linux-arm-kernel@lists.infradead.org, jackson.lee@chipsnmedia.com, 
	lafley.kim@chipsnmedia.com, marek.vasut@mailbox.org, Ming Qian
	 <ming.qian@oss.nxp.com>
Date: Wed, 10 Dec 2025 14:53:37 -0500
In-Reply-To: <20251022074710.575-4-nas.chung@chipsnmedia.com>
References: <20251022074710.575-1-nas.chung@chipsnmedia.com>
	 <20251022074710.575-4-nas.chung@chipsnmedia.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
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
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-2DaQ66HMtUQYkiXhQzyu"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-2DaQ66HMtUQYkiXhQzyu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 22 octobre 2025 =C3=A0 16:47 +0900, Nas Chung a =C3=A9crit=C2=
=A0:
> Add an interface layer to manage hardware register configuration
> and communication with the Chips&Media Wave6 video codec IP.
>=20
> The interface provides low-level helper functions used by the
> Wave6 core driver to implement video encoding and decoding operations.
> It handles command submission to the firmware via MMIO registers,
> and waits for a response by polling the firmware busy flag.
>=20
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
> Tested-by: Ming Qian <ming.qian@oss.nxp.com>
> Tested-by: Marek Vasut <marek.vasut@mailbox.org>
> ---
> =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0=C2=A0 1 +
> =C2=A0.../platform/chips-media/wave6/wave6-hw.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
 2929 +++++++++++++++++
> =C2=A0.../platform/chips-media/wave6/wave6-hw.h=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 73 +
> =C2=A0.../chips-media/wave6/wave6-regdefine.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 641 ++++
> =C2=A0.../platform/chips-media/wave6/wave6-vdi.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 92 +
> =C2=A0.../platform/chips-media/wave6/wave6-vpuapi.c |=C2=A0 725 ++++
> =C2=A0.../platform/chips-media/wave6/wave6-vpuapi.h | 1026 ++++++
> =C2=A0.../chips-media/wave6/wave6-vpuconfig.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 71 +
> =C2=A0.../chips-media/wave6/wave6-vpuerror.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 262 ++
> =C2=A09 files changed, 5820 insertions(+)
> =C2=A0create mode 100644 drivers/media/platform/chips-media/wave6/wave6-h=
w.c
> =C2=A0create mode 100644 drivers/media/platform/chips-media/wave6/wave6-h=
w.h
> =C2=A0create mode 100644 drivers/media/platform/chips-media/wave6/wave6-r=
egdefine.h
> =C2=A0create mode 100644 drivers/media/platform/chips-media/wave6/wave6-v=
di.h
> =C2=A0create mode 100644 drivers/media/platform/chips-media/wave6/wave6-v=
puapi.c
> =C2=A0create mode 100644 drivers/media/platform/chips-media/wave6/wave6-v=
puapi.h
> =C2=A0create mode 100644 drivers/media/platform/chips-media/wave6/wave6-v=
puconfig.h
> =C2=A0create mode 100644 drivers/media/platform/chips-media/wave6/wave6-v=
puerror.h
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a57fee506d57..3c8c123ebe04 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -27564,6 +27564,7 @@ M:	Jackson Lee <jackson.lee@chipsnmedia.com>
> =C2=A0L:	linux-media@vger.kernel.org
> =C2=A0S:	Maintained
> =C2=A0F:	Documentation/devicetree/bindings/media/nxp,imx95-vpu.yaml
> +F:	drivers/media/platform/chips-media/wave6/
> =C2=A0
> =C2=A0WHISKEYCOVE PMIC GPIO DRIVER
> =C2=A0M:	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.int=
el.com>
> diff --git a/drivers/media/platform/chips-media/wave6/wave6-hw.c b/driver=
s/media/platform/chips-media/wave6/wave6-hw.c
> new file mode 100644
> index 000000000000..69a70416acdc
> --- /dev/null
> +++ b/drivers/media/platform/chips-media/wave6/wave6-hw.c
> @@ -0,0 +1,2929 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
> +/*
> + * Wave6 series multi-standard codec IP - wave6 backend interface
> + *
> + * Copyright (C) 2025 CHIPS&MEDIA INC
> + */
> +
> +#include <linux/iopoll.h>
> +#include "wave6-vpu-core.h"
> +#include "wave6-hw.h"
> +#include "wave6-regdefine.h"
> +#include "wave6-trace.h"
> +
> +void wave6_vpu_writel(struct vpu_core_device *core, u32 addr, u32 data)
> +{
> +	wave6_vdi_writel(core->reg_base, addr, data);
> +	trace_wave6_vpu_writel(core->dev, addr, data);
> +}
> +
> +u32 wave6_vpu_readl(struct vpu_core_device *core, u32 addr)
> +{
> +	u32 data;
> +
> +	data =3D wave6_vdi_readl(core->reg_base, addr);
> +	trace_wave6_vpu_readl(core->dev, addr, data);
> +
> +	return data;
> +}
> +
> +static void wave6_print_reg_err(struct vpu_core_device *core, u32 fail_r=
eason)
> +{
> +	char *caller =3D __builtin_return_address(0);
> +	struct device *dev =3D core->dev;
> +
> +	switch (fail_reason) {
> +	case WAVE6_SYSERR_QUEUEING_FAIL:
> +		dev_dbg(dev, "%s: queueing failure 0x%x\n", caller, fail_reason);
> +		break;
> +	case WAVE6_SYSERR_RESULT_NOT_READY:
> +		dev_err(dev, "%s: result not ready 0x%x\n", caller, fail_reason);
> +		break;
> +	case WAVE6_SYSERR_ACCESS_VIOLATION_HW:
> +		dev_err(dev, "%s: access violation 0x%x\n", caller, fail_reason);
> +		break;
> +	case WAVE6_SYSERR_WATCHDOG_TIMEOUT:
> +		dev_err(dev, "%s: watchdog timeout 0x%x\n", caller, fail_reason);
> +		break;
> +	case WAVE6_SYSERR_BUS_ERROR:
> +		dev_err(dev, "%s: bus error 0x%x\n", caller, fail_reason);
> +		break;
> +	case WAVE6_SYSERR_DOUBLE_FAULT:
> +		dev_err(dev, "%s: double fault 0x%x\n", caller, fail_reason);
> +		break;
> +	case WAVE6_SYSERR_VPU_STILL_RUNNING:
> +		dev_err(dev, "%s: still running 0x%x\n", caller, fail_reason);
> +		break;
> +	default:
> +		dev_err(dev, "%s: failure: 0x%x\n", caller, fail_reason);
> +		break;
> +	}
> +}
> +
> +static void wave6_dec_set_display_buffer(struct vpu_instance *inst, stru=
ct frame_buffer fb)
> +{
> +	struct dec_info *p_dec_info =3D &inst->codec_info->dec_info;
> +	int index;
> +
> +	for (index =3D 0; index < WAVE6_MAX_FBS; index++) {
> +		if (!p_dec_info->disp_buf[index].buf_y) {
> +			p_dec_info->disp_buf[index] =3D fb;
> +			p_dec_info->disp_buf[index].index =3D index;
> +			break;
> +		}
> +	}
> +}
> +
> +static struct frame_buffer wave6_dec_get_display_buffer(struct vpu_insta=
nce *inst,
> +							dma_addr_t addr)
> +{
> +	struct dec_info *p_dec_info =3D &inst->codec_info->dec_info;
> +	int i;
> +	struct frame_buffer fb;
> +
> +	memset(&fb, 0, sizeof(struct frame_buffer));
> +
> +	for (i =3D 0; i < WAVE6_MAX_FBS; i++) {
> +		if (p_dec_info->disp_buf[i].buf_y =3D=3D addr) {
> +			fb =3D p_dec_info->disp_buf[i];
> +			break;
> +		}
> +	}
> +
> +	return fb;

nit: You can avoid the spurious memset with:

+	struct frame_buffer fb;
+
+	for (i =3D 0; i < WAVE6_MAX_FBS; i++) {
+		if (p_dec_info->disp_buf[i].buf_y =3D=3D addr) {
+			return p_dec_info->disp_buf[i];
+		}
+	}
+
+	memset(&fb, 0, sizeof(struct frame_buffer));
+	return fb;


> +}
> +
> +static void wave6_dec_remove_display_buffer(struct vpu_instance *inst,
> +					=C2=A0=C2=A0=C2=A0 dma_addr_t addr)
> +{
> +	struct dec_info *p_dec_info =3D &inst->codec_info->dec_info;
> +	int i;
> +
> +	for (i =3D 0; i < WAVE6_MAX_FBS; i++) {
> +		if (p_dec_info->disp_buf[i].buf_y =3D=3D addr) {
> +			memset(&p_dec_info->disp_buf[i], 0, sizeof(struct frame_buffer));
> +			break;
> +		}
> +	}
> +}
> +
> +static enum chroma_format_idc get_chroma_format_idc(enum frame_buffer_fo=
rmat fmt)
> +{
> +	switch (fmt) {
> +	case FORMAT_420:
> +	case FORMAT_420_P10_16BIT_MSB:
> +	case FORMAT_420_P10_16BIT_LSB:
> +	case FORMAT_420_P10_32BIT_MSB:
> +	case FORMAT_420_P10_32BIT_LSB:
> +		return C_FMT_IDC_YUV420;
> +	case FORMAT_422:
> +	case FORMAT_422_P10_16BIT_MSB:
> +	case FORMAT_422_P10_16BIT_LSB:
> +	case FORMAT_422_P10_32BIT_MSB:
> +	case FORMAT_422_P10_32BIT_LSB:
> +	case FORMAT_YUYV:
> +	case FORMAT_YVYU:
> +	case FORMAT_UYVY:
> +	case FORMAT_VYUY:
> +	case FORMAT_YUYV_P10_16BIT_MSB:
> +	case FORMAT_YVYU_P10_16BIT_MSB:
> +	case FORMAT_UYVY_P10_16BIT_MSB:
> +	case FORMAT_VYUY_P10_16BIT_MSB:
> +	case FORMAT_YUYV_P10_16BIT_LSB:
> +	case FORMAT_YVYU_P10_16BIT_LSB:
> +	case FORMAT_UYVY_P10_16BIT_LSB:
> +	case FORMAT_VYUY_P10_16BIT_LSB:
> +	case FORMAT_YUYV_P10_32BIT_MSB:
> +	case FORMAT_YVYU_P10_32BIT_MSB:
> +	case FORMAT_UYVY_P10_32BIT_MSB:
> +	case FORMAT_VYUY_P10_32BIT_MSB:
> +	case FORMAT_YUYV_P10_32BIT_LSB:
> +	case FORMAT_YVYU_P10_32BIT_LSB:
> +	case FORMAT_UYVY_P10_32BIT_LSB:
> +	case FORMAT_VYUY_P10_32BIT_LSB:
> +		return C_FMT_IDC_YUV422;
> +	case FORMAT_444:
> +	case FORMAT_444_P10_16BIT_MSB:
> +	case FORMAT_444_P10_16BIT_LSB:
> +	case FORMAT_444_P10_32BIT_MSB:
> +	case FORMAT_444_P10_32BIT_LSB:
> +		return C_FMT_IDC_YUV444;
> +	case FORMAT_400:
> +	case FORMAT_400_P10_16BIT_MSB:
> +	case FORMAT_400_P10_16BIT_LSB:
> +	case FORMAT_400_P10_32BIT_MSB:
> +	case FORMAT_400_P10_32BIT_LSB:
> +	case FORMAT_YUV444_24BIT:
> +		return C_FMT_IDC_YUV400;
> +	case FORMAT_RGB_24BIT_PACKED:
> +	case FORMAT_YUV444_24BIT_PACKED:
> +	case FORMAT_RGB_32BIT_PACKED:
> +	case FORMAT_RGB_P10_32BIT_PACKED:
> +	case FORMAT_YUV444_32BIT_PACKED:
> +	case FORMAT_YUV444_P10_32BIT_PACKED:
> +		return C_FMT_IDC_RGB;
> +	default:
> +		return C_FMT_IDC_YUV400;
> +	}
> +}
> +
> +static int wave6_wait_vpu_busy(struct vpu_core_device *core, unsigned in=
t addr)
> +{
> +	u32 data;
> +
> +	lockdep_assert_held(&core->hw_lock);
> +
> +	return read_poll_timeout(vpu_read_reg, data, !data,
> +				 W6_VPU_POLL_DELAY_US, W6_VPU_POLL_TIMEOUT,
> +				 false, core, addr);
> +}
> +
> +void wave6_vpu_enable_interrupt(struct vpu_core_device *core)
> +{
> +	u32 data;
> +
> +	lockdep_assert_held(&core->hw_lock);
> +
> +	data =3D BIT(W6_INT_BIT_ENC_SET_PARAM);
> +	data |=3D BIT(W6_INT_BIT_ENC_PIC);
> +	data |=3D BIT(W6_INT_BIT_INIT_SEQ);
> +	data |=3D BIT(W6_INT_BIT_DEC_PIC);
> +	data |=3D BIT(W6_INT_BIT_BSBUF_ERROR);
> +	data |=3D BIT(W6_INT_BIT_REQ_WORK_BUF);
> +	vpu_write_reg(core, W6_VPU_VINT_ENABLE, data);
> +}
> +
> +bool wave6_vpu_is_init(struct vpu_core_device *core)
> +{
> +	lockdep_assert_held(&core->hw_lock);
> +
> +	return vpu_read_reg(core, W6_VPU_VCPU_CUR_PC) !=3D 0;
> +}
> +
> +static int32_t wave6_vpu_get_product_id(struct vpu_core_device *core)
> +{
> +	u32 product_id =3D PRODUCT_ID_NONE;
> +	u32 val;
> +
> +	lockdep_assert_held(&core->hw_lock);
> +
> +	val =3D vpu_read_reg(core, W6_VPU_RET_PRODUCT_CODE);
> +
> +	switch (val) {
> +	case WAVE617_CODE:
> +		product_id =3D PRODUCT_ID_617; break;
> +	case WAVE627_CODE:
> +		product_id =3D PRODUCT_ID_627; break;
> +	case WAVE633_CODE:
> +	case WAVE637_CODE:
> +	case WAVE663_CODE:
> +	case WAVE677_CODE:
> +		product_id =3D PRODUCT_ID_637; break;
> +	default:
> +		dev_err(core->dev, "Invalid product (%x)\n", val);
> +		break;
> +	}
> +
> +	return product_id;
> +}
> +
> +static void wave6_send_command(struct vpu_core_device *core, u32 id, u32=
 std, u32 cmd)
> +{
> +	u32 reg_val;
> +
> +	lockdep_assert_held(&core->hw_lock);
> +
> +	if (cmd =3D=3D W6_CMD_CREATE_INSTANCE)
> +		reg_val =3D INSTANCE_INFO_CODEC_STD(std);
> +	else
> +		reg_val =3D INSTANCE_INFO_CODEC_STD(std) | INSTANCE_INFO_ID(id);
> +	vpu_write_reg(core, W6_CMD_INSTANCE_INFO, reg_val);
> +
> +	vpu_write_reg(core, W6_VPU_BUSY_STATUS, BUSY_STATUS_SET);
> +	vpu_write_reg(core, W6_COMMAND, cmd);
> +	vpu_write_reg(core, W6_VPU_HOST_INT_REQ, HOST_INT_REQ_ON);
> +
> +	trace_wave6_vpu_send_command(core, id, std, cmd);
> +}
> +
> +static int wave6_send_query(struct vpu_core_device *core, u32 id, u32 st=
d,
> +			=C2=A0=C2=A0=C2=A0 enum wave6_query_option query_opt)
> +{
> +	int ret;
> +	u32 reg_val;
> +
> +	lockdep_assert_held(&core->hw_lock);
> +
> +	vpu_write_reg(core, W6_QUERY_OPTION, query_opt);
> +	wave6_send_command(core, id, std, W6_CMD_QUERY);
> +
> +	ret =3D wave6_wait_vpu_busy(core, W6_VPU_BUSY_STATUS);
> +	if (ret) {
> +		dev_err(core->dev, "query timed out opt=3D0x%x\n", query_opt);
> +		return ret;
> +	}
> +
> +	if (!vpu_read_reg(core, W6_RET_SUCCESS)) {
> +		reg_val =3D vpu_read_reg(core, W6_RET_FAIL_REASON);
> +		wave6_print_reg_err(core, reg_val);
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
> +int wave6_vpu_get_version(struct vpu_core_device *core)
> +{
> +	struct vpu_attr *attr =3D &core->attr;
> +	u32 reg_val;
> +	u8 *str;
> +	int ret;
> +	u32 std_def1, conf_feature;
> +
> +	lockdep_assert_held(&core->hw_lock);
> +
> +	ret =3D wave6_send_query(core, 0, 0, W6_QUERY_OPT_GET_VPU_INFO);
> +	if (ret)
> +		return ret;
> +
> +	reg_val =3D vpu_read_reg(core, W6_RET_PRODUCT_NAME);
> +	str =3D (u8 *)&reg_val;
> +	attr->product_name[0] =3D str[3];
> +	attr->product_name[1] =3D str[2];
> +	attr->product_name[2] =3D str[1];
> +	attr->product_name[3] =3D str[0];
> +	attr->product_name[4] =3D 0;
> +
> +	attr->product_id =3D wave6_vpu_get_product_id(core);
> +	attr->product_code =3D vpu_read_reg(core, W6_VPU_RET_PRODUCT_CODE);
> +	attr->product_version =3D vpu_read_reg(core, W6_RET_PRODUCT_VERSION);
> +	attr->fw_version =3D vpu_read_reg(core, W6_RET_FW_API_VERSION);
> +	attr->fw_revision =3D vpu_read_reg(core, W6_RET_FW_VERSION);
> +	attr->hw_version =3D vpu_read_reg(core, W6_RET_CONF_HW_VERSION);
> +	std_def1 =3D vpu_read_reg(core, W6_RET_STD_DEF1);
> +	conf_feature =3D vpu_read_reg(core, W6_RET_CONF_FEATURE);
> +
> +	attr->support_decoders =3D 0;
> +	attr->support_encoders =3D 0;
> +	attr->support_decoders |=3D STD_DEF1_HEVC_DEC(std_def1) << W_HEVC_DEC;
> +	attr->support_hevc10bit_dec =3D CONF_FEATURE_HEVC10BIT_DEC(conf_feature=
);
> +	attr->support_decoders |=3D STD_DEF1_AVC_DEC(std_def1) << W_AVC_DEC;
> +	attr->support_avc10bit_dec =3D CONF_FEATURE_AVC10BIT_DEC(conf_feature);
> +	attr->support_encoders |=3D STD_DEF1_HEVC_ENC(std_def1) << W_HEVC_ENC;
> +	attr->support_hevc10bit_enc =3D CONF_FEATURE_HEVC10BIT_ENC(conf_feature=
);
> +	attr->support_encoders |=3D STD_DEF1_AVC_ENC(std_def1) << W_AVC_ENC;
> +	attr->support_avc10bit_enc =3D CONF_FEATURE_AVC10BIT_ENC(conf_feature);
> +
> +	return 0;
> +}
> +
> +int wave6_vpu_dec_check_open_param(struct vpu_instance *inst,
> +				=C2=A0=C2=A0 struct dec_open_param *param)
> +{
> +	struct vpu_attr *attr =3D &inst->dev->attr;
> +
> +	if (!(BIT(inst->std) & attr->support_decoders)) {
> +		dev_err(inst->dev->dev, "std: %d, support_decoders: 0x%x\n",
> +			inst->std, attr->support_decoders);
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return 0;
> +}
> +
> +int wave6_vpu_build_up_dec_param(struct vpu_instance *inst,
> +				 struct dec_open_param *param)
> +{
> +	struct dec_info *p_dec_info =3D &inst->codec_info->dec_info;
> +	u32 reg_val;
> +	int ret;
> +
> +	lockdep_assert_held(&inst->dev->hw_lock);
> +
> +	p_dec_info->sec_axi.use_dec_ip =3D true;
> +	p_dec_info->sec_axi.use_dec_lf_row =3D true;
> +	switch (inst->std) {
> +	case W_HEVC_DEC:
> +		p_dec_info->seq_change_mask =3D SEQ_CHANGE_ENABLE_ALL_HEVC;
> +		break;
> +	case W_AVC_DEC:
> +		p_dec_info->seq_change_mask =3D SEQ_CHANGE_ENABLE_ALL_AVC;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	vpu_write_reg(inst->dev, W6_CMD_CREATE_INST_TEMP_BASE, param->inst_buff=
er.temp_base);
> +	vpu_write_reg(inst->dev, W6_CMD_CREATE_INST_TEMP_SIZE, param->inst_buff=
er.temp_size);
> +	vpu_write_reg(inst->dev, W6_CMD_CREATE_INST_BS_PARAM, VPU_STREAM_ENDIAN=
);
> +	vpu_write_reg(inst->dev, W6_CMD_CREATE_INST_ADDR_EXT, param->ext_addr_v=
cpu);
> +	vpu_write_reg(inst->dev, W6_CMD_CREATE_INST_DISP_MODE, param->disp_mode=
);
> +
> +	reg_val =3D CREATE_INST_CORE_INFO_CQ_DEPTH(COMMAND_QUEUE_DEPTH) |
> +		=C2=A0 CREATE_INST_CORE_INFO_CORE_IDC(SINGLE_CORE_IDC) |
> +		=C2=A0 CREATE_INST_CORE_INFO_CORE_NUM(SINGLE_CORE);
> +	vpu_write_reg(inst->dev, W6_CMD_CREATE_INST_CORE_INFO, reg_val);
> +
> +	reg_val =3D CREATE_INST_PRIORITY_SECURITY_FLAG(param->is_secure_inst) |
> +		=C2=A0 CREATE_INST_PRIORITY_VALUE(param->inst_priority);
> +	vpu_write_reg(inst->dev, W6_CMD_CREATE_INST_PRIORITY, reg_val);
> +	vpu_write_reg(inst->dev, W6_CMD_CREATE_INST_TIMEOUT_CYCLE_COUNT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 W6_VPU_TIMEOUT_CYCLE_COUNT);
> +
> +	wave6_send_command(inst->dev, 0, inst->std, W6_CMD_CREATE_INSTANCE);
> +	ret =3D wave6_wait_vpu_busy(inst->dev, W6_VPU_BUSY_STATUS);
> +	if (ret) {
> +		dev_err(inst->dev->dev, "%s: timeout\n", __func__);
> +		return ret;
> +	}
> +
> +	if (!vpu_read_reg(inst->dev, W6_RET_SUCCESS)) {
> +		u32 reason_code =3D vpu_read_reg(inst->dev, W6_RET_FAIL_REASON);
> +
> +		wave6_print_reg_err(inst->dev, reason_code);
> +		return -EIO;
> +	}
> +
> +	inst->id =3D vpu_read_reg(inst->dev, W6_RET_INSTANCE_ID);
> +
> +	return 0;
> +}
> +
> +int wave6_vpu_dec_init_seq(struct vpu_instance *inst)
> +{
> +	struct dec_info *p_dec_info =3D &inst->codec_info->dec_info;
> +	u32 reg_val;
> +	int ret;
> +
> +	lockdep_assert_held(&inst->dev->hw_lock);
> +
> +	p_dec_info =3D &inst->codec_info->dec_info;
> +
> +	vpu_write_reg(inst->dev, W6_CMD_DEC_INIT_SEQ_BS_RD_PTR, p_dec_info->str=
eam_rd_ptr);
> +	vpu_write_reg(inst->dev, W6_CMD_DEC_INIT_SEQ_BS_WR_PTR, p_dec_info->str=
eam_wr_ptr);
> +
> +	reg_val =3D DEC_PIC_BS_OPTION_STREAM_END(p_dec_info->stream_end) |
> +		=C2=A0 DEC_PIC_BS_OPTION_EXPLICIT_END_ON;
> +	vpu_write_reg(inst->dev, W6_CMD_DEC_INIT_SEQ_BS_OPTION, reg_val);
> +	reg_val =3D INIT_SEQ_OPTION_MODE(W6_INIT_SEQ_OPT_NORMAL);
> +	vpu_write_reg(inst->dev, W6_CMD_DEC_INIT_SEQ_OPTION, reg_val);
> +
> +	wave6_send_command(inst->dev, inst->id, inst->std, W6_CMD_INIT_SEQ);
> +	ret =3D wave6_wait_vpu_busy(inst->dev, W6_VPU_BUSY_STATUS);
> +	if (ret) {
> +		dev_err(inst->dev->dev, "%s: timeout\n", __func__);
> +		return ret;
> +	}
> +
> +	if (!vpu_read_reg(inst->dev, W6_RET_SUCCESS)) {
> +		u32 reason_code =3D vpu_read_reg(inst->dev, W6_RET_FAIL_REASON);
> +
> +		wave6_print_reg_err(inst->dev, reason_code);
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
> +static void wave6_get_dec_seq_result(struct vpu_instance *inst, struct d=
ec_seq_info *info)
> +{
> +	u32 reg_val;
> +	u32 profile, profile_comp;
> +
> +	lockdep_assert_held(&inst->dev->hw_lock);
> +
> +	info->rd_ptr =3D wave6_vpu_dec_get_rd_ptr(inst);
> +
> +	reg_val =3D vpu_read_reg(inst->dev, W6_RET_DEC_PIC_SIZE);
> +	info->pic_width =3D DEC_PIC_SIZE_WIDTH(reg_val);
> +	info->pic_height =3D DEC_PIC_SIZE_HEIGHT(reg_val);
> +
> +	info->min_frame_buffer_count =3D vpu_read_reg(inst->dev, W6_RET_DEC_NUM=
_REQUIRED_FBC_FB);
> +	info->frame_buf_delay =3D vpu_read_reg(inst->dev, W6_RET_DEC_NUM_REORDE=
R_DELAY);
> +	info->req_mv_buffer_count =3D vpu_read_reg(inst->dev, W6_RET_DEC_NUM_RE=
QUIRED_COL_BUF);
> +
> +	reg_val =3D vpu_read_reg(inst->dev, W6_RET_DEC_CROP_TOP_BOTTOM);
> +	info->pic_crop_rect.top =3D DEC_CROP_TOP(reg_val);
> +	info->pic_crop_rect.bottom =3D info->pic_height - DEC_CROP_BOTTOM(reg_v=
al);
> +
> +	reg_val =3D vpu_read_reg(inst->dev, W6_RET_DEC_CROP_LEFT_RIGHT);
> +	info->pic_crop_rect.left =3D DEC_CROP_LEFT(reg_val);
> +	info->pic_crop_rect.right =3D info->pic_width - DEC_CROP_RIGHT(reg_val)=
;
> +
> +	info->f_rate_numerator =3D vpu_read_reg(inst->dev, W6_RET_DEC_FRAME_RAT=
E_NR);
> +	info->f_rate_denominator =3D vpu_read_reg(inst->dev, W6_RET_DEC_FRAME_R=
ATE_DR);
> +
> +	reg_val =3D vpu_read_reg(inst->dev, W6_RET_DEC_COLOR_SAMPLE);
> +	info->luma_bit_depth =3D DEC_COLOR_SAMPLE_L_BIT_DEPTH(reg_val);
> +	info->chroma_bit_depth =3D DEC_COLOR_SAMPLE_C_BIT_DEPTH(reg_val);
> +	info->c_fmt_idc =3D DEC_COLOR_SAMPLE_C_FMT_IDC(reg_val);
> +	info->aspect_rate_info =3D DEC_COLOR_SAMPLE_ASPECT_RATIO_IDC(reg_val);
> +	info->is_ext_sar =3D info->aspect_rate_info =3D=3D H264_VUI_SAR_IDC_EXT=
ENDED;
> +	if (info->is_ext_sar)
> +		info->aspect_rate_info =3D vpu_read_reg(inst->dev, W6_RET_DEC_ASPECT_R=
ATIO);
> +	info->bitrate =3D vpu_read_reg(inst->dev, W6_RET_DEC_BIT_RATE);
> +
> +	reg_val =3D vpu_read_reg(inst->dev, W6_RET_DEC_SEQ_PARAM);
> +	info->level =3D DEC_SEQ_PARAM_LEVEL(reg_val);
> +	info->tier =3D DEC_SEQ_PARAM_TIER(reg_val);
> +
> +	profile =3D DEC_SEQ_PARAM_PROFILE(reg_val);
> +	profile_comp =3D DEC_SEQ_PARAM_PROFILE_COMPATIBILITY(reg_val);
> +	if (inst->std =3D=3D W_HEVC_DEC) {
> +		info->profile =3D profile;
> +		if (!info->profile) {
> +			if ((profile_comp & PROFILE_COMPATIBILITY_MAIN) &&
> +			=C2=A0=C2=A0=C2=A0 (profile_comp & PROFILE_COMPATIBILITY_MAIN10))
> +				info->profile =3D HEVC_PROFILE_MAIN;
> +			else if (profile_comp & PROFILE_COMPATIBILITY_MAIN10)
> +				info->profile =3D HEVC_PROFILE_MAIN10;
> +			else if (profile_comp & PROFILE_COMPATIBILITY_STILL_PICTURE)
> +				info->profile =3D HEVC_PROFILE_STILLPICTURE;
> +			else
> +				info->profile =3D HEVC_PROFILE_MAIN;
> +		}
> +	} else if (inst->std =3D=3D W_AVC_DEC) {
> +		if (profile =3D=3D PROFILE_H264_BP)
> +			info->profile =3D H264_PROFILE_BP;
> +		else if (profile =3D=3D PROFILE_H264_HP)
> +			info->profile =3D H264_PROFILE_HP;
> +		else if (profile =3D=3D PROFILE_H264_MP)
> +			info->profile =3D H264_PROFILE_MP;
> +		else if (profile =3D=3D PROFILE_H264_HIGH10)
> +			info->profile =3D H264_PROFILE_HIGH10;
> +		else if (profile =3D=3D PROFILE_H264_EXTENDED)
> +			info->profile =3D H264_PROFILE_EXTENDED;
> +		else
> +			info->profile =3D H264_PROFILE_BP;
> +	}
> +
> +	reg_val =3D vpu_read_reg(inst->dev, W6_RET_DEC_COLOR_CONFIG);
> +	if (reg_val) {
> +		info->color.video_signal_type_present =3D true;
> +		info->color.color_description_present =3D DEC_COLOR_CONFIG_COLOR_PRESE=
NT(reg_val);
> +		info->color.color_primaries =3D DEC_COLOR_CONFIG_COLOR_PRIMARIES(reg_v=
al);
> +		info->color.transfer_characteristics =3D DEC_COLOR_CONFIG_TRANS_CHAR(r=
eg_val);
> +		info->color.matrix_coefficients =3D DEC_COLOR_CONFIG_MATRIX_COEFF(reg_=
val);
> +		info->color.color_range =3D DEC_COLOR_CONFIG_COLOR_RANGE(reg_val);
> +	} else {
> +		info->color.video_signal_type_present =3D false;
> +	}
> +}
> +
> +int wave6_vpu_dec_get_seq_info(struct vpu_instance *inst, struct dec_seq=
_info *info)
> +{
> +	int ret;
> +
> +	lockdep_assert_held(&inst->dev->hw_lock);
> +
> +	ret =3D wave6_send_query(inst->dev, inst->id, inst->std, W6_QUERY_OPT_G=
ET_RESULT);
> +	if (ret)
> +		return ret;
> +
> +	if (vpu_read_reg(inst->dev, W6_RET_DEC_DECODING_SUCCESS) !=3D 1) {
> +		info->err_reason =3D vpu_read_reg(inst->dev, W6_RET_DEC_ERR_INFO);
> +		ret =3D -EIO;
> +	} else {
> +		info->warn_info =3D vpu_read_reg(inst->dev, W6_RET_DEC_WARN_INFO);
> +	}
> +
> +	wave6_get_dec_seq_result(inst, info);
> +
> +	return ret;
> +}
> +
> +int wave6_vpu_dec_register_frame_buffer(struct vpu_instance *inst,
> +					struct frame_buffer *fb_arr,
> +					enum tiled_map_type map_type, u32 count)
> +{
> +	struct dec_info *p_dec_info =3D &inst->codec_info->dec_info;
> +	size_t fbc_remain, mv_remain, fbc_idx =3D 0, mv_idx =3D 0;
> +	size_t i, k, group_num, mv_count;
> +	dma_addr_t fbc_cr_tbl_addr;
> +	u32 reg_val;
> +	int ret;
> +
> +	lockdep_assert_held(&inst->dev->hw_lock);
> +
> +	mv_count =3D p_dec_info->seq_info.req_mv_buffer_count;
> +
> +	for (i =3D 0; i < count; i++) {
> +		if (!p_dec_info->vb_fbc_y_tbl[i].daddr)
> +			return -EINVAL;
> +		if (!p_dec_info->vb_fbc_c_tbl[i].daddr)
> +			return -EINVAL;
> +	}
> +	for (i =3D 0; i < mv_count; i++) {
> +		if (!p_dec_info->vb_mv[i].daddr)
> +			return -EINVAL;
> +	}
> +
> +	reg_val =3D SET_FB_PIC_SIZE_WIDTH(p_dec_info->seq_info.pic_width) |
> +		=C2=A0 SET_FB_PIC_SIZE_HEIGHT(p_dec_info->seq_info.pic_height);
> +	vpu_write_reg(inst->dev, W6_CMD_SET_FB_PIC_SIZE, reg_val);
> +	reg_val =3D SET_FB_PIC_INFO_C_FMT_IDC(p_dec_info->seq_info.c_fmt_idc) |
> +		=C2=A0 SET_FB_PIC_INFO_L_BIT_DEPTH(p_dec_info->seq_info.luma_bit_depth=
) |
> +		=C2=A0 SET_FB_PIC_INFO_C_BIT_DEPTH(p_dec_info->seq_info.chroma_bit_dep=
th);
> +	vpu_write_reg(inst->dev, W6_CMD_SET_FB_PIC_INFO, reg_val);
> +	vpu_write_reg(inst->dev, W6_CMD_SET_FB_DEFAULT_CDF, 0);
> +	vpu_write_reg(inst->dev, W6_CMD_SET_FB_SEGMAP, 0);
> +	vpu_write_reg(inst->dev, W6_CMD_SET_FB_MV_COL_PRE_ENT, 0);
> +
> +	fbc_remain =3D count;
> +	mv_remain =3D mv_count;
> +	group_num =3D (count > mv_count) ? ((ALIGN(count, 16) / 16) - 1) :
> +					 ((ALIGN(mv_count, 16) / 16) - 1);
> +	for (i =3D 0; i <=3D group_num; i++) {
> +		bool first_group =3D i =3D=3D 0;
> +		bool last_group =3D i =3D=3D group_num;
> +		u32 set_fbc_num =3D (fbc_remain >=3D 16) ? 16 : fbc_remain;
> +		u32 set_mv_num =3D (mv_remain >=3D 16) ? 16 : mv_remain;
> +		u32 fbc_start_no =3D i * 16;
> +		u32 fbc_end_no =3D fbc_start_no + set_fbc_num - 1;
> +		u32 mv_start_no =3D i * 16;
> +		u32 mv_end_no =3D mv_start_no + set_mv_num - 1;
> +
> +		reg_val =3D SET_FB_OPTION_ENDIAN(VDI_128BIT_BIG_ENDIAN);
> +		if (first_group)
> +			reg_val |=3D SET_FB_OPTION_START;
> +		if (last_group)
> +			reg_val |=3D SET_FB_OPTION_END;
> +		vpu_write_reg(inst->dev, W6_CMD_SET_FB_OPTION, reg_val);
> +
> +		reg_val =3D SET_FB_NUM_FBC_START_IDX(fbc_start_no) |
> +			=C2=A0 SET_FB_NUM_FBC_END_IDX(fbc_end_no) |
> +			=C2=A0 SET_FB_NUM_MV_COL_START_IDX(mv_start_no) |
> +			=C2=A0 SET_FB_NUM_MV_COL_END_IDX(mv_end_no);
> +		vpu_write_reg(inst->dev, W6_CMD_SET_FB_NUM, reg_val);
> +
> +		for (k =3D 0; k < set_fbc_num; k++) {
> +			vpu_write_reg(inst->dev, W6_CMD_SET_FB_FBC_Y(k),
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fb_arr[fbc_idx].buf_y);
> +			vpu_write_reg(inst->dev, W6_CMD_SET_FB_FBC_C(k),
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fb_arr[fbc_idx].buf_cb);
> +			vpu_write_reg(inst->dev, W6_CMD_SET_FB_FBC_CR(k),
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fb_arr[fbc_idx].buf_cr);
> +			vpu_write_reg(inst->dev, W6_CMD_SET_FB_FBC_Y_OFFSET(k),
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p_dec_info->vb_fbc_y_tbl[fbc_idx].dad=
dr);
> +			vpu_write_reg(inst->dev, W6_CMD_SET_FB_FBC_C_OFFSET(k),
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p_dec_info->vb_fbc_c_tbl[fbc_idx].dad=
dr);
> +			fbc_cr_tbl_addr =3D p_dec_info->vb_fbc_c_tbl[fbc_idx].daddr +
> +						(p_dec_info->vb_fbc_c_tbl[fbc_idx].size >> 1);
> +			vpu_write_reg(inst->dev, W6_CMD_SET_FB_FBC_CR_OFFSET(k),
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fbc_cr_tbl_addr);
> +			fbc_idx++;
> +		}
> +		fbc_remain -=3D k;
> +
> +		for (k =3D 0; k < set_mv_num; k++) {
> +			vpu_write_reg(inst->dev, W6_CMD_SET_FB_MV_COL(k),
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p_dec_info->vb_mv[mv_idx].daddr);
> +			mv_idx++;
> +		}
> +		mv_remain -=3D k;
> +
> +		wave6_send_command(inst->dev, inst->id, inst->std, W6_CMD_SET_FB);
> +		ret =3D wave6_wait_vpu_busy(inst->dev, W6_VPU_BUSY_STATUS);
> +		if (ret) {
> +			dev_err(inst->dev->dev, "%s: timeout\n", __func__);
> +			return ret;
> +		}
> +	}
> +
> +	if (!vpu_read_reg(inst->dev, W6_RET_SUCCESS))
> +		return -EIO;
> +
> +	return 0;
> +}
> +
> +int wave6_vpu_dec_register_display_buffer(struct vpu_instance *inst, str=
uct frame_buffer fb)
> +{
> +	int ret;
> +	struct dec_info *p_dec_info =3D &inst->codec_info->dec_info;
> +	u32 reg_val;
> +	u32 c_fmt_idc, out_fmt, out_mode;
> +
> +	lockdep_assert_held(&inst->dev->hw_lock);
> +
> +	vpu_write_reg(inst->dev, W6_CMD_DEC_SET_DISP_SCL_PARAM,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst->scaler_info.enable);
> +	reg_val =3D SET_DISP_SCL_PIC_SIZE_WIDTH(inst->scaler_info.width) |
> +		=C2=A0 SET_DISP_SCL_PIC_SIZE_HEIGHT(inst->scaler_info.height);
> +	vpu_write_reg(inst->dev, W6_CMD_DEC_SET_DISP_SCL_PIC_SIZE, reg_val);
> +	reg_val =3D SET_DISP_PIC_SIZE_WIDTH(p_dec_info->seq_info.pic_width) |
> +		=C2=A0 SET_DISP_PIC_SIZE_HEIGHT(p_dec_info->seq_info.pic_height);
> +	vpu_write_reg(inst->dev, W6_CMD_DEC_SET_DISP_PIC_SIZE, reg_val);
> +
> +	c_fmt_idc =3D get_chroma_format_idc(p_dec_info->wtl_format);
> +	switch (p_dec_info->wtl_format) {
> +	case FORMAT_420_P10_16BIT_MSB:
> +	case FORMAT_422_P10_16BIT_MSB:
> +	case FORMAT_444_P10_16BIT_MSB:
> +	case FORMAT_400_P10_16BIT_MSB:
> +		out_mode =3D (WTL_RIGHT_JUSTIFIED << 2) | WTL_PIXEL_16BIT;
> +		break;
> +	case FORMAT_420_P10_16BIT_LSB:
> +	case FORMAT_422_P10_16BIT_LSB:
> +	case FORMAT_444_P10_16BIT_LSB:
> +	case FORMAT_400_P10_16BIT_LSB:
> +		out_mode =3D (WTL_LEFT_JUSTIFIED << 2) | WTL_PIXEL_16BIT;
> +		break;
> +	case FORMAT_420_P10_32BIT_MSB:
> +	case FORMAT_422_P10_32BIT_MSB:
> +	case FORMAT_444_P10_32BIT_MSB:
> +	case FORMAT_400_P10_32BIT_MSB:
> +		out_mode =3D (WTL_RIGHT_JUSTIFIED << 2) | WTL_PIXEL_32BIT;
> +		break;
> +	case FORMAT_420_P10_32BIT_LSB:
> +	case FORMAT_422_P10_32BIT_LSB:
> +	case FORMAT_444_P10_32BIT_LSB:
> +	case FORMAT_400_P10_32BIT_LSB:
> +		out_mode =3D (WTL_LEFT_JUSTIFIED << 2) | WTL_PIXEL_32BIT;
> +		break;
> +	default:
> +		out_mode =3D (WTL_RIGHT_JUSTIFIED << 2) | WTL_PIXEL_8BIT;
> +		break;
> +	}
> +	out_fmt =3D (inst->nv21 << 1) | inst->cbcr_interleave;
> +
> +	reg_val =3D SET_DISP_COMMON_PIC_INFO_BWB_ON |
> +		=C2=A0 SET_DISP_COMMON_PIC_INFO_C_FMT_IDC(c_fmt_idc) |
> +		=C2=A0 SET_DISP_COMMON_PIC_INFO_PIXEL_ORDER(PIXEL_ORDER_INCREASING) |
> +		=C2=A0 SET_DISP_COMMON_PIC_INFO_OUT_MODE(out_mode) |
> +		=C2=A0 SET_DISP_COMMON_PIC_INFO_OUT_FMT(out_fmt) |
> +		=C2=A0 SET_DISP_COMMON_PIC_INFO_STRIDE(fb.stride);
> +	vpu_write_reg(inst->dev, W6_CMD_DEC_SET_DISP_COMMON_PIC_INFO, reg_val);
> +	reg_val =3D SET_DISP_OPTION_ENDIAN(VDI_128BIT_BIG_ENDIAN);
> +	vpu_write_reg(inst->dev, W6_CMD_DEC_SET_DISP_OPTION, reg_val);
> +	reg_val =3D SET_DISP_PIC_INFO_L_BIT_DEPTH(fb.luma_bit_depth) |
> +		=C2=A0 SET_DISP_PIC_INFO_C_BIT_DEPTH(fb.chroma_bit_depth) |
> +		=C2=A0 SET_DISP_PIC_INFO_C_FMT_IDC(fb.c_fmt_idc);
> +	vpu_write_reg(inst->dev, W6_CMD_DEC_SET_DISP_PIC_INFO, reg_val);
> +	vpu_write_reg(inst->dev, W6_CMD_DEC_SET_DISP_Y_BASE, fb.buf_y);
> +	vpu_write_reg(inst->dev, W6_CMD_DEC_SET_DISP_CB_BASE, fb.buf_cb);
> +	vpu_write_reg(inst->dev, W6_CMD_DEC_SET_DISP_CR_BASE, fb.buf_cr);
> +
> +	wave6_send_command(inst->dev, inst->id, inst->std, W6_CMD_DEC_SET_DISP)=
;
> +	ret =3D wave6_wait_vpu_busy(inst->dev, W6_VPU_BUSY_STATUS);
> +	if (ret) {
> +		dev_err(inst->dev->dev, "%s: timeout\n", __func__);
> +		return ret;
> +	}
> +
> +	if (!vpu_read_reg(inst->dev, W6_RET_SUCCESS))
> +		return -EIO;
> +
> +	wave6_dec_set_display_buffer(inst, fb);
> +
> +	return 0;
> +}
> +
> +int wave6_vpu_decode(struct vpu_instance *inst, struct dec_param *option=
, u32 *fail_res)
> +{
> +	struct dec_info *p_dec_info =3D &inst->codec_info->dec_info;
> +	u32 reg_val;
> +	int ret;
> +
> +	lockdep_assert_held(&inst->dev->hw_lock);
> +
> +	vpu_write_reg(inst->dev, W6_CMD_DEC_PIC_BS_RD_PTR, p_dec_info->stream_r=
d_ptr);
> +	vpu_write_reg(inst->dev, W6_CMD_DEC_PIC_BS_WR_PTR, p_dec_info->stream_w=
r_ptr);
> +
> +	reg_val =3D DEC_PIC_BS_OPTION_STREAM_END(p_dec_info->stream_end) |
> +		=C2=A0 DEC_PIC_BS_OPTION_EXPLICIT_END_ON;
> +	vpu_write_reg(inst->dev, W6_CMD_DEC_PIC_BS_OPTION, reg_val);
> +
> +	reg_val =3D DEC_PIC_SEC_AXI_IP_ENABLE(p_dec_info->sec_axi.use_dec_ip) |
> +		=C2=A0 DEC_PIC_SEC_AXI_LF_ENABLE(p_dec_info->sec_axi.use_dec_lf_row);
> +	vpu_write_reg(inst->dev, W6_CMD_DEC_PIC_SEC_AXI, reg_val);
> +
> +	reg_val =3D DEC_PIC_OPTION_MODE(W6_DEC_PIC_OPT_NORMAL);
> +	vpu_write_reg(inst->dev, W6_CMD_DEC_PIC_OPTION, reg_val);
> +
> +	reg_val =3D DEC_PIC_TEMPORAL_ID_PLUS1_SPATIAL(DECODE_ALL_SPATIAL_LAYERS=
) |
> +		=C2=A0 DEC_PIC_TEMPORAL_ID_PLUS1(DECODE_ALL_TEMPORAL_LAYERS);
> +	vpu_write_reg(inst->dev, W6_CMD_DEC_PIC_TEMPORAL_ID_PLUS1, reg_val);
> +	vpu_write_reg(inst->dev, W6_CMD_DEC_PIC_SEQ_CHANGE_ENABLE_FLAG,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p_dec_info->seq_change_mask);
> +	reg_val =3D lower_32_bits(option->timestamp);
> +	vpu_write_reg(inst->dev, W6_CMD_DEC_PIC_TIMESTAMP_LOW, reg_val);
> +	reg_val =3D upper_32_bits(option->timestamp);
> +	vpu_write_reg(inst->dev, W6_CMD_DEC_PIC_TIMESTAMP_HIGH, reg_val);
> +
> +	wave6_send_command(inst->dev, inst->id, inst->std, W6_CMD_DEC_PIC);
> +	ret =3D wave6_wait_vpu_busy(inst->dev, W6_VPU_BUSY_STATUS);
> +	if (ret) {
> +		dev_err(inst->dev->dev, "%s: timeout\n", __func__);
> +		return ret;
> +	}
> +
> +	if (!vpu_read_reg(inst->dev, W6_RET_SUCCESS)) {
> +		*fail_res =3D vpu_read_reg(inst->dev, W6_RET_FAIL_REASON);
> +		wave6_print_reg_err(inst->dev, *fail_res);
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
> +int wave6_vpu_dec_get_result(struct vpu_instance *inst, struct dec_outpu=
t_info *result)
> +{
> +	struct dec_info *p_dec_info =3D &inst->codec_info->dec_info;
> +	u32 reg_val, i;
> +	int decoded_idx =3D -1, disp_idx =3D -1;
> +	int ret;
> +
> +	lockdep_assert_held(&inst->dev->hw_lock);
> +
> +	ret =3D wave6_send_query(inst->dev, inst->id, inst->std, W6_QUERY_OPT_G=
ET_RESULT);
> +	if (ret)
> +		return ret;
> +
> +	result->decoding_success =3D vpu_read_reg(inst->dev, W6_RET_DEC_DECODIN=
G_SUCCESS);
> +	if (!result->decoding_success)
> +		result->error_reason =3D vpu_read_reg(inst->dev, W6_RET_DEC_ERR_INFO);
> +	else
> +		result->warn_info =3D vpu_read_reg(inst->dev, W6_RET_DEC_WARN_INFO);
> +
> +	reg_val =3D vpu_read_reg(inst->dev, W6_RET_DEC_PIC_TYPE);
> +	result->ctu_size =3D DEC_PIC_TYPE_CTU_SIZE(reg_val);
> +	result->nal_type =3D DEC_PIC_TYPE_NAL_UNIT_TYPE(reg_val);
> +
> +	if (reg_val & DEC_PIC_TYPE_B)
> +		result->pic_type =3D PIC_TYPE_B;
> +	else if (reg_val & DEC_PIC_TYPE_P)
> +		result->pic_type =3D PIC_TYPE_P;
> +	else if (reg_val & DEC_PIC_TYPE_I)
> +		result->pic_type =3D PIC_TYPE_I;
> +	else
> +		result->pic_type =3D PIC_TYPE_MAX;
> +	if (inst->std =3D=3D W_HEVC_DEC) {
> +		if (result->pic_type =3D=3D PIC_TYPE_I &&
> +		=C2=A0=C2=A0=C2=A0 (result->nal_type =3D=3D H265_NAL_UNIT_TYPE_IDR_W_R=
ADL ||
> +		=C2=A0=C2=A0=C2=A0=C2=A0 result->nal_type =3D=3D H265_NAL_UNIT_TYPE_ID=
R_N_LP))
> +			result->pic_type =3D PIC_TYPE_IDR;
> +	} else if (inst->std =3D=3D W_AVC_DEC) {
> +		if (result->pic_type =3D=3D PIC_TYPE_I &&
> +		=C2=A0=C2=A0=C2=A0 result->nal_type =3D=3D H264_NAL_UNIT_TYPE_IDR_PICT=
URE)
> +			result->pic_type =3D PIC_TYPE_IDR;
> +	}
> +
> +	reg_val =3D vpu_read_reg(inst->dev, W6_RET_DEC_DECODED_FLAG);
> +	if (reg_val) {
> +		struct frame_buffer fb;
> +		dma_addr_t addr =3D vpu_read_reg(inst->dev, W6_RET_DEC_DECODED_ADDR);
> +
> +		fb =3D wave6_dec_get_display_buffer(inst, addr);
> +		result->frame_decoded_addr =3D addr;
> +		result->frame_decoded =3D true;
> +		decoded_idx =3D fb.index;
> +	}
> +
> +	reg_val =3D vpu_read_reg(inst->dev, W6_RET_DEC_DISPLAY_FLAG);
> +	if (reg_val) {
> +		struct frame_buffer fb;
> +		dma_addr_t addr =3D vpu_read_reg(inst->dev, W6_RET_DEC_DISPLAY_ADDR);
> +
> +		fb =3D wave6_dec_get_display_buffer(inst, addr);
> +		result->frame_display_addr =3D addr;
> +		result->frame_display =3D true;
> +		disp_idx =3D fb.index;
> +	}
> +
> +	reg_val =3D vpu_read_reg(inst->dev, W6_RET_DEC_DISP_IDC);
> +	for (i =3D 0; i < WAVE6_MAX_FBS; i++) {
> +		if (reg_val & (1 << i)) {
> +			dma_addr_t addr;
> +
> +			addr =3D vpu_read_reg(inst->dev, W6_RET_DEC_DISP_LINEAR_ADDR(i));
> +
> +			result->disp_frame_addr[result->disp_frame_num] =3D addr;
> +			result->disp_frame_num++;
> +		}
> +	}
> +
> +	reg_val =3D vpu_read_reg(inst->dev, W6_RET_DEC_RELEASE_IDC);
> +	for (i =3D 0; i < WAVE6_MAX_FBS; i++) {
> +		if (reg_val & (1 << i)) {
> +			dma_addr_t addr;
> +
> +			addr =3D vpu_read_reg(inst->dev, W6_RET_DEC_DISP_LINEAR_ADDR(i));
> +
> +			wave6_dec_remove_display_buffer(inst, addr);
> +			result->release_disp_frame_addr[result->release_disp_frame_num] =3D a=
ddr;
> +			result->release_disp_frame_num++;
> +		}
> +	}
> +
> +	if (inst->std =3D=3D W_HEVC_DEC) {
> +		result->decoded_poc =3D -1;
> +		result->display_poc =3D -1;
> +		if (decoded_idx >=3D 0)
> +			result->decoded_poc =3D vpu_read_reg(inst->dev, W6_RET_DEC_PIC_POC);
> +	} else if (inst->std =3D=3D W_AVC_DEC) {
> +		result->decoded_poc =3D -1;
> +		result->display_poc =3D -1;
> +		if (decoded_idx >=3D 0)
> +			result->decoded_poc =3D vpu_read_reg(inst->dev, W6_RET_DEC_PIC_POC);
> +	}
> +
> +	reg_val =3D vpu_read_reg(inst->dev, W6_RET_DEC_PIC_SIZE);
> +	result->dec_pic_width =3D DEC_PIC_SIZE_WIDTH(reg_val);
> +	result->dec_pic_height =3D DEC_PIC_SIZE_HEIGHT(reg_val);
> +
> +	result->rd_ptr =3D wave6_vpu_dec_get_rd_ptr(inst);
> +	result->wr_ptr =3D p_dec_info->stream_wr_ptr;
> +	result->byte_pos_frame_start =3D vpu_read_reg(inst->dev, W6_RET_DEC_AU_=
START_POS);
> +	result->byte_pos_frame_end =3D vpu_read_reg(inst->dev, W6_RET_DEC_AU_EN=
D_POS);
> +	result->stream_end =3D vpu_read_reg(inst->dev, W6_RET_DEC_STREAM_END);
> +	result->notification_flags =3D vpu_read_reg(inst->dev, W6_RET_DEC_NOTIF=
ICATION);
> +	result->last_frame_in_au =3D vpu_read_reg(inst->dev, W6_RET_DEC_LAST_FR=
AME_FLAG);
> +
> +	reg_val =3D vpu_read_reg(inst->dev, W6_RET_DEC_TIMESTAMP_LOW);
> +	result->timestamp =3D vpu_read_reg(inst->dev, W6_RET_DEC_TIMESTAMP_HIGH=
);
> +	result->timestamp =3D (result->timestamp << 32) | reg_val;
> +
> +	result->cycle.host_cmd_s =3D vpu_read_reg(inst->dev, W6_RET_CQ_IN_TICK)=
;
> +	result->cycle.host_cmd_e =3D vpu_read_reg(inst->dev, W6_RET_RQ_OUT_TICK=
);
> +	result->cycle.proc_s =3D vpu_read_reg(inst->dev, W6_RET_HW_RUN_TICK);
> +	result->cycle.proc_e =3D vpu_read_reg(inst->dev, W6_RET_HW_DONE_TICK);
> +	result->cycle.vpu_s =3D vpu_read_reg(inst->dev, W6_RET_FW_RUN_TICK);
> +	result->cycle.vpu_e =3D vpu_read_reg(inst->dev, W6_RET_FW_DONE_TICK);
> +	result->cycle.frame_cycle =3D (result->cycle.vpu_e - result->cycle.host=
_cmd_s) *
> +				=C2=A0=C2=A0=C2=A0 CYCLE_PER_TICK_VALUE;
> +	result->cycle.proc_cycle =3D (result->cycle.proc_e - result->cycle.proc=
_s) *
> +				=C2=A0=C2=A0 CYCLE_PER_TICK_VALUE;
> +	result->cycle.vpu_cycle =3D ((result->cycle.vpu_e - result->cycle.vpu_s=
) -
> +				=C2=A0=C2=A0 (result->cycle.proc_e - result->cycle.proc_s)) *
> +				=C2=A0 CYCLE_PER_TICK_VALUE;
> +
> +	if (decoded_idx >=3D 0 && decoded_idx < WAVE6_MAX_FBS)
> +		p_dec_info->dec_out_info[decoded_idx].decoded_poc =3D result->decoded_=
poc;
> +
> +	if (disp_idx >=3D 0 && disp_idx < WAVE6_MAX_FBS) {
> +		result->display_poc =3D p_dec_info->dec_out_info[disp_idx].decoded_poc=
;
> +		result->disp_pic_width =3D p_dec_info->dec_out_info[disp_idx].dec_pic_=
width;
> +		result->disp_pic_height =3D p_dec_info->dec_out_info[disp_idx].dec_pic=
_height;
> +	}
> +
> +	result->sequence_no =3D p_dec_info->seq_info.sequence_no;
> +	if (decoded_idx >=3D 0 && decoded_idx < WAVE6_MAX_FBS)
> +		p_dec_info->dec_out_info[decoded_idx] =3D *result;
> +
> +	if (result->notification_flags & DEC_NOTI_FLAG_SEQ_CHANGE) {
> +		wave6_get_dec_seq_result(inst, &p_dec_info->seq_info);
> +		p_dec_info->seq_info.sequence_no++;
> +	}
> +
> +	return 0;
> +}
> +
> +int wave6_vpu_dec_fini_seq(struct vpu_instance *inst, u32 *fail_res)
> +{
> +	int ret;
> +
> +	lockdep_assert_held(&inst->dev->hw_lock);
> +
> +	wave6_send_command(inst->dev, inst->id, inst->std, W6_CMD_DESTROY_INSTA=
NCE);
> +	ret =3D wave6_wait_vpu_busy(inst->dev, W6_VPU_BUSY_STATUS);
> +	if (ret)
> +		return -ETIMEDOUT;
> +
> +	if (!vpu_read_reg(inst->dev, W6_RET_SUCCESS)) {
> +		*fail_res =3D vpu_read_reg(inst->dev, W6_RET_FAIL_REASON);
> +		wave6_print_reg_err(inst->dev, *fail_res);
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
> +dma_addr_t wave6_vpu_dec_get_rd_ptr(struct vpu_instance *inst)
> +{
> +	lockdep_assert_held(&inst->dev->hw_lock);
> +
> +	return vpu_read_reg(inst->dev, W6_RET_DEC_BS_RD_PTR);
> +}
> +
> +int wave6_vpu_dec_flush(struct vpu_instance *inst)
> +{
> +	int ret, index;
> +	u32 unused_idc;
> +	u32 used_idc;
> +	u32 using_idc;
> +
> +	lockdep_assert_held(&inst->dev->hw_lock);
> +
> +	wave6_send_command(inst->dev, inst->id, inst->std, W6_CMD_FLUSH_INSTANC=
E);
> +	ret =3D wave6_wait_vpu_busy(inst->dev, W6_VPU_BUSY_STATUS);
> +	if (ret)
> +		return -ETIMEDOUT;
> +
> +	if (!vpu_read_reg(inst->dev, W6_RET_SUCCESS)) {
> +		u32 reg_val;
> +
> +		reg_val =3D vpu_read_reg(inst->dev, W6_RET_FAIL_REASON);
> +		wave6_print_reg_err(inst->dev, reg_val);
> +		return -EIO;
> +	}
> +
> +	ret =3D wave6_send_query(inst->dev, inst->id, inst->std, W6_QUERY_OPT_G=
ET_FLUSH_CMD_INFO);
> +	if (ret)
> +		return ret;
> +
> +	unused_idc =3D vpu_read_reg(inst->dev, W6_RET_DEC_FLUSH_CMD_BUF_STATE_U=
NUSED_IDC);
> +	if (unused_idc)
> +		dev_dbg(inst->dev->dev, "%s: unused_idc %d\n", __func__, unused_idc);
> +
> +	used_idc =3D vpu_read_reg(inst->dev, W6_RET_DEC_FLUSH_CMD_BUF_STATE_USE=
D_IDC);
> +	if (used_idc)
> +		dev_dbg(inst->dev->dev, "%s: used_idc %d\n", __func__, used_idc);
> +
> +	using_idc =3D vpu_read_reg(inst->dev, W6_RET_DEC_FLUSH_CMD_BUF_STATE_US=
ING_IDC);
> +	if (using_idc)
> +		dev_err(inst->dev->dev, "%s: using_idc %d\n", __func__, using_idc);

The dev_err() with no error handling seems suspicious. Can you clarify?

> +
> +	for (index =3D 0; index < WAVE6_MAX_FBS; index++) {
> +		dma_addr_t addr;
> +
> +		addr =3D vpu_read_reg(inst->dev, W6_RET_DEC_FLUSH_CMD_DISP_ADDR(index)=
);
> +
> +		if ((unused_idc >> index) & 0x1)
> +			wave6_dec_remove_display_buffer(inst, addr);
> +		if ((used_idc >> index) & 0x1)
> +			wave6_dec_remove_display_buffer(inst, addr);

Used or not, they are removed, can you have a single variable of IDC, and o=
r the
value ?

> +	}
> +
> +	return 0;
> +}
> +
> +struct enc_cmd_set_param_reg {
> +	u32 enable;
> +	u32 src_size;
> +	u32 custom_map_endian;
> +	u32 sps;
> +	u32 pps;
> +	u32 gop;
> +	u32 intra;
> +	u32 conf_win0;
> +	u32 conf_win1;
> +	u32 rdo;
> +	u32 slice;
> +	u32 intra_refresh;
> +	u32 intra_qp;
> +	u32 rc_frame_rate;
> +	u32 rc_target_rate;
> +	u32 rc;
> +	u32 hvs;
> +	u32 rc_max_bitrate;
> +	u32 rc_vbv_buffer_size;
> +	u32 inter_qp;
> +	u32 rot_param;
> +	u32 num_units_in_tick;
> +	u32 time_scale;
> +	u32 num_ticks_poc_diff_one;
> +	u32 max_intra_pic_bit;
> +	u32 max_inter_pic_bit;
> +	u32 bg;
> +	u32 non_vcl_param;
> +	u32 vui_rbsp_addr;
> +	u32 hrd_rbsp_addr;
> +	u32 qround_offset;
> +	u32 quant1;
> +	u32 quant2;
> +	u32 custom_gop;
> +	u32 custom_gop_pic[MAX_CUSTOM_GOP_NUM];
> +	u32 tile_param;
> +	u32 custom_lambda[MAX_CUSTOM_LAMBDA_NUM];
> +	u32 temp_layer_qp[MAX_NUM_CHANGEABLE_TEMP_LAYER];
> +	u32 scaler_size;
> +	u32 scaler;
> +	u32 color;
> +	u32 sar;
> +	u32 sar_extended;
> +};
> +
> +struct enc_cmd_change_param_reg {
> +	u32 enable;
> +	u32 rc_target_rate;
> +};
> +
> +int wave6_vpu_build_up_enc_param(struct device *dev, struct vpu_instance=
 *inst,
> +				 struct enc_open_param *param)
> +{
> +	struct enc_info *p_enc_info =3D &inst->codec_info->enc_info;
> +	u32 reg_val;
> +	int ret;
> +
> +	lockdep_assert_held(&inst->dev->hw_lock);
> +
> +	p_enc_info->stride =3D 0;
> +	p_enc_info->seq_info_obtained =3D false;
> +	p_enc_info->sec_axi.use_enc_rdo =3D true;
> +	p_enc_info->sec_axi.use_enc_lf =3D true;
> +	p_enc_info->mir_dir =3D param->mir_dir;
> +	p_enc_info->rot_angle =3D param->rot_angle;
> +
> +	vpu_write_reg(inst->dev, W6_CMD_CREATE_INST_TEMP_BASE, param->inst_buff=
er.temp_base);
> +	vpu_write_reg(inst->dev, W6_CMD_CREATE_INST_TEMP_SIZE, param->inst_buff=
er.temp_size);
> +	vpu_write_reg(inst->dev, W6_CMD_CREATE_INST_AR_TABLE_BASE, param->inst_=
buffer.ar_base);
> +	vpu_write_reg(inst->dev, W6_CMD_CREATE_INST_BS_PARAM, VPU_STREAM_ENDIAN=
);
> +	vpu_write_reg(inst->dev, W6_CMD_CREATE_INST_SRC_OPT, 0);
> +	vpu_write_reg(inst->dev, W6_CMD_CREATE_INST_ADDR_EXT, param->ext_addr_v=
cpu);
> +
> +	reg_val =3D CREATE_INST_CORE_INFO_CQ_DEPTH(COMMAND_QUEUE_DEPTH) |
> +		=C2=A0 CREATE_INST_CORE_INFO_CORE_IDC(SINGLE_CORE_IDC) |
> +		=C2=A0 CREATE_INST_CORE_INFO_CORE_NUM(SINGLE_CORE);
> +	vpu_write_reg(inst->dev, W6_CMD_CREATE_INST_CORE_INFO, reg_val);
> +
> +	reg_val =3D CREATE_INST_PRIORITY_SECURITY_FLAG(param->is_secure_inst) |
> +		=C2=A0 CREATE_INST_PRIORITY_VALUE(param->inst_priority);
> +	vpu_write_reg(inst->dev, W6_CMD_CREATE_INST_PRIORITY, reg_val);
> +	vpu_write_reg(inst->dev, W6_CMD_CREATE_INST_TIMEOUT_CYCLE_COUNT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 W6_VPU_TIMEOUT_CYCLE_COUNT);
> +
> +	wave6_send_command(inst->dev, 0, inst->std, W6_CMD_CREATE_INSTANCE);
> +	ret =3D wave6_wait_vpu_busy(inst->dev, W6_VPU_BUSY_STATUS);
> +	if (ret) {
> +		dev_err(inst->dev->dev, "%s: timeout\n", __func__);
> +		return ret;
> +	}
> +
> +	if (!vpu_read_reg(inst->dev, W6_RET_SUCCESS)) {
> +		u32 reason_code =3D vpu_read_reg(inst->dev, W6_RET_FAIL_REASON);
> +
> +		wave6_print_reg_err(inst->dev, reason_code);
> +		return -EIO;
> +	}
> +
> +	inst->id =3D vpu_read_reg(inst->dev, W6_RET_INSTANCE_ID);
> +
> +	return 0;
> +}
> +
> +static int wave6_set_enc_crop_info(u32 codec, struct enc_codec_param *pa=
ram, int rot_mode,
> +				=C2=A0=C2=A0 int width, int height)
> +{
> +	int aligned_width =3D (codec =3D=3D W_HEVC_ENC) ? ALIGN(width, 32) : AL=
IGN(width, 16);
> +	int aligned_height =3D (codec =3D=3D W_HEVC_ENC) ? ALIGN(height, 32) : =
ALIGN(height, 16);

Can you dehardcode this ? Perhap each "codec" can have a stastic const stru=
cture
that hold the needed information ?

> +	int pad_right, pad_bot;
> +	int crop_right, crop_left, crop_top, crop_bot;
> +	int prp_mode =3D rot_mode >> 1;
> +
> +	if (codec =3D=3D W_HEVC_ENC &&
> +	=C2=A0=C2=A0=C2=A0 (!rot_mode || prp_mode =3D=3D 14))
> +		return 0;

Can you use a define that help see what does prp_mode 14 stands for &

> +
> +	pad_right =3D aligned_width - width;
> +	pad_bot =3D aligned_height - height;
> +
> +	if (param->conf_win.right > 0)
> +		crop_right =3D param->conf_win.right + pad_right;
> +	else
> +		crop_right =3D pad_right;
> +
> +	if (param->conf_win.bottom > 0)
> +		crop_bot =3D param->conf_win.bottom + pad_bot;
> +	else
> +		crop_bot =3D pad_bot;
> +
> +	crop_top =3D param->conf_win.top;
> +	crop_left =3D param->conf_win.left;
> +
> +	param->conf_win.top =3D crop_top;
> +	param->conf_win.left =3D crop_left;
> +	param->conf_win.bottom =3D crop_bot;
> +	param->conf_win.right =3D crop_right;
> +
> +	if (prp_mode =3D=3D 1 || prp_mode =3D=3D 15) {

Same here and below.

> +		param->conf_win.top =3D crop_right;
> +		param->conf_win.left =3D crop_top;
> +		param->conf_win.bottom =3D crop_left;
> +		param->conf_win.right =3D crop_bot;
> +	} else if (prp_mode =3D=3D 2 || prp_mode =3D=3D 12) {
> +		param->conf_win.top =3D crop_bot;
> +		param->conf_win.left =3D crop_right;
> +		param->conf_win.bottom =3D crop_top;
> +		param->conf_win.right =3D crop_left;
> +	} else if (prp_mode =3D=3D 3 || prp_mode =3D=3D 13) {
> +		param->conf_win.top =3D crop_left;
> +		param->conf_win.left =3D crop_bot;
> +		param->conf_win.bottom =3D crop_right;
> +		param->conf_win.right =3D crop_top;
> +	} else if (prp_mode =3D=3D 4 || prp_mode =3D=3D 10) {
> +		param->conf_win.top =3D crop_bot;
> +		param->conf_win.bottom =3D crop_top;
> +	} else if (prp_mode =3D=3D 8 || prp_mode =3D=3D 6) {
> +		param->conf_win.left =3D crop_right;
> +		param->conf_win.right =3D crop_left;
> +	} else if (prp_mode =3D=3D 5 || prp_mode =3D=3D 11) {
> +		param->conf_win.top =3D crop_left;
> +		param->conf_win.left =3D crop_top;
> +		param->conf_win.bottom =3D crop_right;
> +		param->conf_win.right =3D crop_bot;
> +	} else if (prp_mode =3D=3D 7 || prp_mode =3D=3D 9) {
> +		param->conf_win.top =3D crop_right;
> +		param->conf_win.left =3D crop_bot;
> +		param->conf_win.bottom =3D crop_left;
> +		param->conf_win.right =3D crop_top;
> +	}
> +
> +	return 0;
> +}
> +
> +static void wave6_update_enc_info(struct enc_info *p_enc_info)
> +{
> +	struct enc_open_param op =3D p_enc_info->open_param;
> +
> +	p_enc_info->width =3D op.pic_width;
> +	p_enc_info->height =3D op.pic_height;
> +	p_enc_info->c_fmt_idc =3D get_chroma_format_idc(op.output_format);
> +}
> +
> +static void wave6_gen_set_param_reg_common(struct enc_info *p_enc_info, =
enum codec_std std,
> +					=C2=A0=C2=A0 struct enc_cmd_set_param_reg *reg)
> +{
> +	struct enc_open_param *p_open_param =3D &p_enc_info->open_param;
> +	struct enc_codec_param *p_param =3D &p_open_param->codec_param;
> +	unsigned int i;
> +	u32 rot_mir_mode =3D 0;
> +
> +	switch (p_enc_info->rot_angle) {
> +	case ROT_0:
> +		rot_mir_mode |=3D 0x0; break;
> +	case ROT_90:
> +		rot_mir_mode |=3D 0x3; break;
> +	case ROT_180:
> +		rot_mir_mode |=3D 0x5; break;
> +	case ROT_270:
> +		rot_mir_mode |=3D 0x7; break;
> +	}
> +
> +	switch (p_enc_info->mir_dir) {
> +	case MIR_NONE:
> +		rot_mir_mode |=3D 0x0; break;
> +	case MIR_VER:
> +		rot_mir_mode |=3D 0x9; break;
> +	case MIR_HOR:
> +		rot_mir_mode |=3D 0x11; break;
> +	case MIR_HOR_VER:
> +		rot_mir_mode |=3D 0x19; break;
> +	}

Could be nicer with defines, its a bit strange that the bits overlap, but I
guess its a flip/rotate trick ?

> +
> +	wave6_set_enc_crop_info(std, p_param, rot_mir_mode, p_enc_info->width, =
p_enc_info->height);
> +
> +	reg->custom_map_endian =3D VPU_USER_DATA_ENDIAN;
> +	reg->rot_param =3D rot_mir_mode;
> +	reg->src_size =3D SET_PARAM_SRC_SIZE_HEIGHT(p_enc_info->height) |
> +			SET_PARAM_SRC_SIZE_WIDTH(p_enc_info->width);
> +	reg->conf_win0 =3D SET_PARAM_CONF_WIN0_BOTTOM(p_param->conf_win.bottom)=
 |
> +			 SET_PARAM_CONF_WIN0_TOP(p_param->conf_win.top);
> +	reg->conf_win1 =3D SET_PARAM_CONF_WIN1_RIGHT(p_param->conf_win.right) |
> +			 SET_PARAM_CONF_WIN1_LEFT(p_param->conf_win.left);
> +	reg->gop =3D SET_PARAM_GOP_TEMP_LAYER_CNT(p_param->temp_layer_cnt) |
> +		=C2=A0=C2=A0 SET_PARAM_GOP_TEMP_LAYER3_QP_ENABLE(p_param->temp_layer[3=
].change_qp) |
> +		=C2=A0=C2=A0 SET_PARAM_GOP_TEMP_LAYER2_QP_ENABLE(p_param->temp_layer[2=
].change_qp) |
> +		=C2=A0=C2=A0 SET_PARAM_GOP_TEMP_LAYER1_QP_ENABLE(p_param->temp_layer[1=
].change_qp) |
> +		=C2=A0=C2=A0 SET_PARAM_GOP_TEMP_LAYER0_QP_ENABLE(p_param->temp_layer[0=
].change_qp) |
> +		=C2=A0=C2=A0 SET_PARAM_GOP_PRESET_IDX(p_param->gop_preset_idx);
> +	for (i =3D 0; i < MAX_NUM_CHANGEABLE_TEMP_LAYER; i++) {
> +		reg->temp_layer_qp[i] =3D SET_PARAM_TEMP_LAYER_QP_B(p_param->temp_laye=
r[i].qp_b) |
> +					SET_PARAM_TEMP_LAYER_QP_P(p_param->temp_layer[i].qp_p) |
> +					SET_PARAM_TEMP_LAYER_QP_I(p_param->temp_layer[i].qp_i);
> +	}
> +	reg->intra_refresh =3D SET_PARAM_INTRA_REFRESH_ARGUMENT(p_param->intra_=
refresh_arg) |
> +			=C2=A0=C2=A0=C2=A0=C2=A0 SET_PARAM_INTRA_REFRESH_MODE(p_param->intra_=
refresh_mode);
> +	reg->intra_qp =3D SET_PARAM_INTRA_QP_MAX(p_param->max_qp_i) |
> +			SET_PARAM_INTRA_QP_MIN(p_param->min_qp_i);
> +	reg->inter_qp =3D SET_PARAM_INTER_QP_MAX_B(p_param->max_qp_b) |
> +			SET_PARAM_INTER_QP_MIN_B(p_param->min_qp_b) |
> +			SET_PARAM_INTER_QP_MAX_P(p_param->max_qp_p) |
> +			SET_PARAM_INTER_QP_MIN_P(p_param->min_qp_p);
> +	reg->rc_frame_rate =3D p_param->frame_rate;
> +	reg->rc_target_rate =3D p_param->bitrate;
> +	reg->rc_max_bitrate =3D p_param->max_bitrate;
> +	reg->rc_vbv_buffer_size =3D p_param->cpb_size;
> +	reg->rc =3D SET_PARAM_RC_UPDATE_SPEED(p_param->rc_update_speed) |
> +		=C2=A0 SET_PARAM_RC_INITIAL_LEVEL(p_param->rc_initial_level) |
> +		=C2=A0 SET_PARAM_RC_INITIAL_QP(p_param->rc_initial_qp) |
> +		=C2=A0 SET_PARAM_RC_MODE(p_param->rc_mode) |
> +		=C2=A0 SET_PARAM_RC_PIC_LEVEL_MAX_DELTA_QP(p_param->pic_rc_max_dqp) |
> +		=C2=A0 SET_PARAM_RC_VBV_OVERFLOW_DROP_FRAME(p_param->en_skip_frame) |
> +		=C2=A0 SET_PARAM_RC_CU_LEVEL_ENABLE(p_param->en_cu_level_rate_control)=
 |
> +		=C2=A0 SET_PARAM_RC_ENABLE(p_param->en_rate_control);
> +	reg->hvs =3D SET_PARAM_HVS_MAX_DELTA_QP(p_param->max_delta_qp) |
> +		=C2=A0=C2=A0 SET_PARAM_HVS_QP_SCALE(p_param->hvs_qp_scale_div2);
> +	reg->num_units_in_tick =3D p_param->num_units_in_tick;
> +	reg->time_scale =3D p_param->time_scale;
> +	reg->num_ticks_poc_diff_one =3D p_param->num_ticks_poc_diff_one;
> +	reg->max_intra_pic_bit =3D p_param->max_intra_pic_bit;
> +	reg->max_inter_pic_bit =3D p_param->max_inter_pic_bit;
> +	reg->bg =3D SET_PARAM_BG_DELTA_QP(p_param->bg_delta_qp) |
> +		=C2=A0 SET_PARAM_BG_THRESHOLD_MEAN_DIFF(p_param->bg_th_mean_diff) |
> +		=C2=A0 SET_PARAM_BG_THRESHOLD_MAX_DIFF(p_param->bg_th_diff) |
> +		=C2=A0 SET_PARAM_BG_ENABLE(p_param->en_bg_detect);
> +	reg->qround_offset =3D SET_PARAM_QROUND_OFFSET_INTER(p_param->qround_in=
ter) |
> +			=C2=A0=C2=A0=C2=A0=C2=A0 SET_PARAM_QROUND_OFFSET_INTRA(p_param->qroun=
d_intra);
> +	reg->custom_gop =3D p_param->gop_param.size;
> +	for (i =3D 0; i < p_param->gop_param.size; i++) {
> +		struct custom_gop_pic_param pic =3D p_param->gop_param.pic[i];
> +
> +		reg->custom_gop_pic[i] =3D SET_PARAM_CUSTOM_GOP_PIC_TEMP_ID(pic.tempor=
al_id) |
> +					 SET_PARAM_CUSTOM_GOP_PIC_REF1_POC(pic.ref_poc_l1) |
> +					 SET_PARAM_CUSTOM_GOP_PIC_REF0_POC(pic.ref_poc_l0) |
> +					 SET_PARAM_CUSTOM_GOP_PIC_MULTI_REF_P(pic.multi_ref_p) |
> +					 SET_PARAM_CUSTOM_GOP_PIC_QP(pic.pic_qp) |
> +					 SET_PARAM_CUSTOM_GOP_PIC_POC_OFFSET(pic.poc_offset) |
> +					 SET_PARAM_CUSTOM_GOP_PIC_TYPE(pic.pic_type);
> +	}
> +	for (i =3D 0; i < MAX_CUSTOM_LAMBDA_NUM; i++) {
> +		reg->custom_lambda[i] =3D SET_PARAM_CUSTOM_LAMBDA_SSD(p_param->lambda_=
ssd[i]) |
> +					SET_PARAM_CUSTOM_LAMBDA_SAD(p_param->lambda_sad[i]);
> +	}
> +	reg->scaler_size =3D SET_PARAM_SCALER_SIZE_HEIGHT(p_enc_info->height) |
> +			=C2=A0=C2=A0 SET_PARAM_SCALER_SIZE_WIDTH(p_enc_info->width);
> +	reg->scaler =3D SET_PARAM_SCALER_COEF_MODE(p_enc_info->scaler.coef_mode=
) |
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SET_PARAM_SCALER_ENABLE(p_enc_info->sca=
ler.enable);
> +	reg->color =3D SET_PARAM_COLOR_RANGE(p_param->color.color_range) |
> +		=C2=A0=C2=A0=C2=A0=C2=A0 SET_PARAM_COLOR_MATRIX_COEFF(p_param->color.m=
atrix_coefficients) |
> +		=C2=A0=C2=A0=C2=A0=C2=A0 SET_PARAM_COLOR_TRANS_CHAR(p_param->color.tra=
nsfer_characteristics) |
> +		=C2=A0=C2=A0=C2=A0=C2=A0 SET_PARAM_COLOR_PRIMARIES(p_param->color.colo=
r_primaries) |
> +		=C2=A0=C2=A0=C2=A0=C2=A0 SET_PARAM_COLOR_DESCRIPTION_PRESENT_ON;
> +	reg->sar =3D SET_PARAM_SAR_ASPECT_RATIO_IDC(p_param->sar.idc) |
> +		=C2=A0=C2=A0 SET_PARAM_SAR_ASPECT_RATIO_ENABLE(p_param->sar.enable);
> +	reg->sar_extended =3D SET_PARAM_SAR_EXTENDED_HEIGHT(p_param->sar.height=
) |
> +			=C2=A0=C2=A0=C2=A0 SET_PARAM_SAR_EXTENDED_WIDTH(p_param->sar.width);
> +}
> +
> +static void wave6_gen_set_param_reg_hevc(struct enc_info *p_enc_info,
> +					 struct enc_cmd_set_param_reg *reg)
> +{
> +	struct enc_open_param *p_open_param =3D &p_enc_info->open_param;
> +	struct enc_codec_param *p_param =3D &p_open_param->codec_param;
> +
> +	reg->sps =3D SET_PARAM_SPS_DEFAULT_SCALING_LIST(p_param->en_scaling_lis=
t) |
> +		=C2=A0=C2=A0 SET_PARAM_SPS_STILL_PICTURE(p_param->en_still_picture) |
> +		=C2=A0=C2=A0 SET_PARAM_SPS_AUTO_LEVEL_ADJUSTING_ON |
> +		=C2=A0=C2=A0 SET_PARAM_SPS_STRONG_INTRA_SMOOTHING(p_param->en_intra_sm=
ooth) |
> +		=C2=A0=C2=A0 SET_PARAM_SPS_INTRA_TRANSFORM_SKIP_ON |
> +		=C2=A0=C2=A0 SET_PARAM_SPS_SAMPLE_ADAPTIVE_OFFSET(p_param->en_sao) |
> +		=C2=A0=C2=A0 SET_PARAM_SPS_TEMPORAL_MVP(p_param->en_temporal_mvp) |
> +		=C2=A0=C2=A0 SET_PARAM_SPS_LONGTERM_REFERENCE(p_param->en_longterm) |
> +		=C2=A0=C2=A0 SET_PARAM_SPS_C_FMT_IDC(p_enc_info->c_fmt_idc) |
> +		=C2=A0=C2=A0 SET_PARAM_SPS_BIT_DEPTH(p_param->internal_bit_depth) |
> +		=C2=A0=C2=A0 SET_PARAM_SPS_TIER(p_param->tier) |
> +		=C2=A0=C2=A0 SET_PARAM_SPS_LEVEL(p_param->level) |
> +		=C2=A0=C2=A0 SET_PARAM_SPS_PROFILE(p_param->profile);
> +	reg->pps =3D SET_PARAM_PPS_CR_QP_OFFSET(p_param->cr_qp_offset) |
> +		=C2=A0=C2=A0 SET_PARAM_PPS_CB_QP_OFFSET(p_param->cb_qp_offset) |
> +		=C2=A0=C2=A0 SET_PARAM_PPS_TC_OFFSET_DIV2(p_param->tc_offset_div2) |
> +		=C2=A0=C2=A0 SET_PARAM_PPS_BETA_OFFSET_DIV2(p_param->beta_offset_div2)=
 |
> +		=C2=A0=C2=A0 SET_PARAM_PPS_DEBLOCKING_FILTER(!p_param->en_dbk) |
> +		=C2=A0=C2=A0 SET_PARAM_PPS_LF_SLICE_BOUNDARY(p_param->en_lf_slice_boun=
dary) |
> +		=C2=A0=C2=A0 SET_PARAM_PPS_CONST_INTRA_PREDICTION(p_param->en_const_in=
tra_pred);
> +	reg->intra =3D SET_PARAM_INTRA_PERIOD(p_param->intra_period) |
> +		=C2=A0=C2=A0=C2=A0=C2=A0 SET_PARAM_INTRA_HEADER_MODE(p_param->forced_i=
dr_header) |
> +		=C2=A0=C2=A0=C2=A0=C2=A0 SET_PARAM_INTRA_QP(p_param->qp) |
> +		=C2=A0=C2=A0=C2=A0=C2=A0 SET_PARAM_INTRA_REFRESH_TYPE(p_param->decodin=
g_refresh_type);
> +	reg->rdo =3D SET_PARAM_RDO_CUSTOM_LAMBDA(p_param->en_custom_lambda) |
> +		=C2=A0=C2=A0 SET_PARAM_RDO_ME_SEARCH_CENTER_ON |
> +		=C2=A0=C2=A0 SET_PARAM_RDO_QROUND_OFFSET(p_param->en_qround_offset) |
> +		=C2=A0=C2=A0 SET_PARAM_RDO_ADAPTIVE_ROUND_ON |
> +		=C2=A0=C2=A0 SET_PARAM_RDO_HVS_QP(p_param->en_hvs_qp);
> +	reg->slice =3D SET_PARAM_SLICE_ARGUMENT(p_param->slice_arg) |
> +		=C2=A0=C2=A0=C2=A0=C2=A0 SET_PARAM_SLICE_MODE(p_param->slice_mode);
> +	reg->quant2 =3D SET_PARAM_QUANT2_LAMBDA_DQP_INTER(p_param->lambda_dqp_i=
nter) |
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SET_PARAM_QUANT2_LAMBDA_DQP_INTRA(p_par=
am->lambda_dqp_intra);
> +	reg->non_vcl_param =3D SET_PARAM_NON_VCL_PARAM_ENCODE_VUI;
> +}
> +
> +static void wave6_gen_set_param_reg_avc(struct enc_info *p_enc_info,
> +					struct enc_cmd_set_param_reg *reg)
> +{
> +	struct enc_open_param *p_open_param =3D &p_enc_info->open_param;
> +	struct enc_codec_param *p_param =3D &p_open_param->codec_param;
> +
> +	reg->sps =3D SET_PARAM_SPS_DEFAULT_SCALING_LIST(p_param->en_scaling_lis=
t) |
> +		=C2=A0=C2=A0 SET_PARAM_SPS_AUTO_LEVEL_ADJUSTING_ON |
> +		=C2=A0=C2=A0 SET_PARAM_SPS_LONGTERM_REFERENCE(p_param->en_longterm) |
> +		=C2=A0=C2=A0 SET_PARAM_SPS_C_FMT_IDC(p_enc_info->c_fmt_idc) |
> +		=C2=A0=C2=A0 SET_PARAM_SPS_BIT_DEPTH(p_param->internal_bit_depth) |
> +		=C2=A0=C2=A0 SET_PARAM_SPS_LEVEL(p_param->level) |
> +		=C2=A0=C2=A0 SET_PARAM_SPS_PROFILE(p_param->profile);
> +	reg->pps =3D SET_PARAM_PPS_ENTROPY_CODING_MODE(p_param->en_cabac) |
> +		=C2=A0=C2=A0 SET_PARAM_PPS_TRANSFORM8X8(p_param->en_transform8x8) |
> +		=C2=A0=C2=A0 SET_PARAM_PPS_CR_QP_OFFSET(p_param->cr_qp_offset) |
> +		=C2=A0=C2=A0 SET_PARAM_PPS_CB_QP_OFFSET(p_param->cb_qp_offset) |
> +		=C2=A0=C2=A0 SET_PARAM_PPS_TC_OFFSET_DIV2(p_param->tc_offset_div2) |
> +		=C2=A0=C2=A0 SET_PARAM_PPS_BETA_OFFSET_DIV2(p_param->beta_offset_div2)=
 |
> +		=C2=A0=C2=A0 SET_PARAM_PPS_DEBLOCKING_FILTER(!p_param->en_dbk) |
> +		=C2=A0=C2=A0 SET_PARAM_PPS_LF_SLICE_BOUNDARY(p_param->en_lf_slice_boun=
dary) |
> +		=C2=A0=C2=A0 SET_PARAM_PPS_CONST_INTRA_PREDICTION(p_param->en_const_in=
tra_pred);
> +	reg->intra =3D SET_PARAM_INTRA_HEADER_MODE_AVC(p_param->forced_idr_head=
er) |
> +		=C2=A0=C2=A0=C2=A0=C2=A0 SET_PARAM_INTRA_IDR_PERIOD_AVC(p_param->idr_p=
eriod) |
> +		=C2=A0=C2=A0=C2=A0=C2=A0 SET_PARAM_INTRA_PERIOD_AVC(p_param->intra_per=
iod) |
> +		=C2=A0=C2=A0=C2=A0=C2=A0 SET_PARAM_INTRA_QP_AVC(p_param->qp);
> +	reg->rdo =3D SET_PARAM_RDO_CUSTOM_LAMBDA(p_param->en_custom_lambda) |
> +		=C2=A0=C2=A0 SET_PARAM_RDO_QROUND_OFFSET(p_param->en_qround_offset) |
> +		=C2=A0=C2=A0 SET_PARAM_RDO_ADAPTIVE_ROUND_ON |
> +		=C2=A0=C2=A0 SET_PARAM_RDO_HVS_QP(p_param->en_hvs_qp);
> +	reg->slice =3D SET_PARAM_SLICE_ARGUMENT(p_param->slice_arg) |
> +		=C2=A0=C2=A0=C2=A0=C2=A0 SET_PARAM_SLICE_MODE(p_param->slice_mode);
> +	reg->quant2 =3D SET_PARAM_QUANT2_LAMBDA_DQP_INTER(p_param->lambda_dqp_i=
nter) |
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SET_PARAM_QUANT2_LAMBDA_DQP_INTRA(p_par=
am->lambda_dqp_intra);
> +	reg->non_vcl_param =3D SET_PARAM_NON_VCL_PARAM_ENCODE_VUI;
> +}
> +
> +static void wave6_gen_change_param_reg_common(struct vpu_instance *inst,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct enc_info *p_enc_info,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct enc_cmd_change_param_reg *reg=
)
> +{
> +	if (p_enc_info->open_param.codec_param.bitrate !=3D inst->enc_ctrls.bit=
rate) {
> +		reg->enable |=3D SET_PARAM_ENABLE_RC_TARGET_RATE;
> +		reg->rc_target_rate =3D inst->enc_ctrls.bitrate;
> +		p_enc_info->open_param.codec_param.bitrate =3D inst->enc_ctrls.bitrate=
;
> +	}
> +}
> +
> +int wave6_vpu_enc_init_seq(struct vpu_instance *inst)
> +{
> +	struct enc_cmd_set_param_reg reg;
> +	struct enc_info *p_enc_info =3D &inst->codec_info->enc_info;
> +	u32 i;
> +	int ret;
> +
> +	lockdep_assert_held(&inst->dev->hw_lock);
> +
> +	memset(&reg, 0, sizeof(struct enc_cmd_set_param_reg));
> +
> +	wave6_update_enc_info(p_enc_info);
> +
> +	wave6_gen_set_param_reg_common(p_enc_info, inst->std, &reg);
> +	if (inst->std =3D=3D W_HEVC_ENC)
> +		wave6_gen_set_param_reg_hevc(p_enc_info, &reg);
> +	else if (inst->std =3D=3D W_AVC_ENC)
> +		wave6_gen_set_param_reg_avc(p_enc_info, &reg);
> +
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_OPTION, W6_SET_PARAM_OPT_=
COMMON);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_ENABLE, reg.enable);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_SRC_SIZE, reg.src_size);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_CUSTOM_MAP_ENDIAN, reg.cu=
stom_map_endian);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_SPS, reg.sps);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_PPS, reg.pps);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_GOP, reg.gop);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_INTRA, reg.intra);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_CONF_WIN0, reg.conf_win0)=
;
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_CONF_WIN1, reg.conf_win1)=
;
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_RDO, reg.rdo);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_SLICE, reg.slice);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_INTRA_REFRESH, reg.intra_=
refresh);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_INTRA_QP, reg.intra_qp);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_RC_FRAME_RATE, reg.rc_fra=
me_rate);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_RC_TARGET_RATE, reg.rc_ta=
rget_rate);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_RC, reg.rc);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_HVS, reg.hvs);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_RC_MAX_BITRATE, reg.rc_ma=
x_bitrate);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_RC_VBV_BUFFER_SIZE, reg.r=
c_vbv_buffer_size);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_INTER_QP, reg.inter_qp);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_ROT_PARAM, reg.rot_param)=
;
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_NUM_UNITS_IN_TICK, reg.nu=
m_units_in_tick);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_TIME_SCALE, reg.time_scal=
e);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_NUM_TICKS_POC_DIFF_ONE,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg.num_ticks_poc_diff_one);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_MAX_INTRA_PIC_BIT, reg.ma=
x_intra_pic_bit);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_MAX_INTER_PIC_BIT, reg.ma=
x_inter_pic_bit);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_BG, reg.bg);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_NON_VCL_PARAM, reg.non_vc=
l_param);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_VUI_RBSP_ADDR, reg.vui_rb=
sp_addr);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_HRD_RBSP_ADDR, reg.hrd_rb=
sp_addr);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_QROUND_OFFSET, reg.qround=
_offset);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_QUANT1, reg.quant1);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_QUANT2, reg.quant2);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_CUSTOM_GOP, reg.custom_go=
p);
> +	for (i =3D 0; i < MAX_CUSTOM_GOP_NUM; i++)
> +		vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_CUSTOM_GOP_PIC(i),
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg.custom_gop_pic[i]);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_TILE_PARAM, reg.tile_para=
m);
> +	for (i =3D 0; i < MAX_CUSTOM_LAMBDA_NUM; i++)
> +		vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_CUSTOM_LAMBDA(i),
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg.custom_lambda[i]);
> +	for (i =3D 0; i < MAX_NUM_CHANGEABLE_TEMP_LAYER; i++)
> +		vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_TEMP_LAYER_QP(i),
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg.temp_layer_qp[i]);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_SCALER_SIZE, reg.scaler_s=
ize);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_SCALER, reg.scaler);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_COLOR, reg.color);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_SAR, reg.sar);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_SAR_EXTENDED, reg.sar_ext=
ended);
> +
> +	wave6_send_command(inst->dev, inst->id, inst->std, W6_CMD_ENC_SET_PARAM=
);
> +	ret =3D wave6_wait_vpu_busy(inst->dev, W6_VPU_BUSY_STATUS);
> +	if (ret) {
> +		dev_err(inst->dev->dev, "%s: timeout\n", __func__);
> +		return ret;
> +	}
> +
> +	if (!vpu_read_reg(inst->dev, W6_RET_SUCCESS)) {
> +		u32 reason_code =3D vpu_read_reg(inst->dev, W6_RET_FAIL_REASON);
> +
> +		wave6_print_reg_err(inst->dev, reason_code);
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
> +int wave6_vpu_enc_get_seq_info(struct vpu_instance *inst, struct enc_seq=
_info *info)
> +{
> +	int ret;
> +
> +	lockdep_assert_held(&inst->dev->hw_lock);
> +
> +	ret =3D wave6_send_query(inst->dev, inst->id, inst->std, W6_QUERY_OPT_G=
ET_RESULT);
> +	if (ret)
> +		return ret;
> +
> +	if (vpu_read_reg(inst->dev, W6_RET_ENC_ENCODING_SUCCESS) !=3D 1) {
> +		info->err_reason =3D vpu_read_reg(inst->dev, W6_RET_ENC_ERR_INFO);
> +		ret =3D -EIO;
> +	} else {
> +		info->warn_info =3D vpu_read_reg(inst->dev, W6_RET_ENC_WARN_INFO);
> +	}
> +
> +	info->min_frame_buffer_count =3D vpu_read_reg(inst->dev, W6_RET_ENC_NUM=
_REQUIRED_FBC_FB);
> +	info->min_src_frame_count =3D vpu_read_reg(inst->dev, W6_RET_ENC_MIN_SR=
C_BUF_NUM);
> +	info->max_latency_pictures =3D vpu_read_reg(inst->dev, W6_RET_ENC_PIC_M=
AX_LATENCY_PICTURES);
> +	info->req_mv_buffer_count =3D vpu_read_reg(inst->dev, W6_RET_ENC_NUM_RE=
QUIRED_COL_BUF);
> +
> +	return ret;
> +}
> +
> +int wave6_vpu_enc_change_seq(struct vpu_instance *inst, bool *changed)
> +{
> +	struct enc_cmd_change_param_reg reg;
> +	struct enc_info *p_enc_info =3D &inst->codec_info->enc_info;
> +	int ret;
> +
> +	lockdep_assert_held(&inst->dev->hw_lock);
> +
> +	memset(&reg, 0, sizeof(struct enc_cmd_change_param_reg));
> +
> +	wave6_gen_change_param_reg_common(inst, p_enc_info, &reg);
> +
> +	if (!reg.enable)
> +		return 0;
> +
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_OPTION, W6_SET_PARAM_OPT_=
CHANGE_PARAM);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_ENABLE, reg.enable);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_RC_TARGET_RATE, reg.rc_ta=
rget_rate);
> +
> +	wave6_send_command(inst->dev, inst->id, inst->std, W6_CMD_ENC_SET_PARAM=
);
> +	ret =3D wave6_wait_vpu_busy(inst->dev, W6_VPU_BUSY_STATUS);
> +	if (ret) {
> +		dev_warn(inst->dev->dev, "enc set param timed out\n");
> +		return ret;
> +	}
> +
> +	if (!vpu_read_reg(inst->dev, W6_RET_SUCCESS)) {
> +		u32 reason_code =3D vpu_read_reg(inst->dev, W6_RET_FAIL_REASON);
> +
> +		wave6_print_reg_err(inst->dev, reason_code);
> +		return -EIO;
> +	}
> +
> +	*changed =3D true;
> +
> +	return 0;
> +}
> +
> +struct enc_cmd_set_fb_reg {
> +	u32 option;
> +	u32 pic_info;
> +	u32 pic_size;
> +	u32 num_fb;
> +	u32 fbc_stride;
> +	u32 fbc_y[WAVE6_MAX_FBS];
> +	u32 fbc_c[WAVE6_MAX_FBS];
> +	u32 fbc_cr[WAVE6_MAX_FBS];
> +	u32 fbc_y_offset[WAVE6_MAX_FBS];
> +	u32 fbc_c_offset[WAVE6_MAX_FBS];
> +	u32 fbc_cr_offset[WAVE6_MAX_FBS];
> +	u32 mv_col[WAVE6_MAX_FBS];
> +	u32 sub_sampled[WAVE6_MAX_FBS];
> +	u32 default_cdf;
> +};
> +
> +static void wave6_gen_set_fb_reg(struct enc_info *p_enc_info, enum codec=
_std std,
> +				 struct frame_buffer *fb_arr, struct enc_cmd_set_fb_reg *reg)
> +{
> +	u32 mv_count =3D p_enc_info->seq_info.req_mv_buffer_count;
> +	u32 buf_width, buf_height;
> +	u32 stride_l, stride_c, i;
> +
> +	if (std =3D=3D W_AVC_ENC) {
> +		buf_width =3D ALIGN(p_enc_info->width, 16);
> +		buf_height =3D ALIGN(p_enc_info->height, 16);
> +		if (p_enc_info->rot_angle =3D=3D ROT_90 || p_enc_info->rot_angle =3D=
=3D ROT_270) {
> +			buf_width =3D ALIGN(p_enc_info->height, 16);
> +			buf_height =3D ALIGN(p_enc_info->width, 16);
> +		}
> +	} else {
> +		buf_width =3D ALIGN(p_enc_info->width, 8);
> +		buf_height =3D ALIGN(p_enc_info->height, 8);
> +		if ((p_enc_info->rot_angle || p_enc_info->mir_dir) &&
> +		=C2=A0=C2=A0=C2=A0 !(p_enc_info->rot_angle =3D=3D ROT_180 && p_enc_inf=
o->mir_dir =3D=3D MIR_HOR_VER)) {
> +			buf_width =3D ALIGN(p_enc_info->width, 32);
> +			buf_height =3D ALIGN(p_enc_info->height, 32);
> +		}
> +		if (p_enc_info->rot_angle =3D=3D ROT_90 || p_enc_info->rot_angle =3D=
=3D ROT_270) {
> +			buf_width =3D ALIGN(p_enc_info->height, 32);
> +			buf_height =3D ALIGN(p_enc_info->width, 32);
> +		}
> +	}
> +
> +	if ((p_enc_info->rot_angle || p_enc_info->mir_dir) &&
> +	=C2=A0=C2=A0=C2=A0 !(p_enc_info->rot_angle =3D=3D ROT_180 && p_enc_info=
->mir_dir =3D=3D MIR_HOR_VER)) {
> +		stride_l =3D ALIGN((buf_width + 63), 64);
> +		stride_c =3D ALIGN((buf_width + 31), 32) / 2;
> +	} else {
> +		stride_l =3D ALIGN((p_enc_info->width) + 63, 64);
> +		stride_c =3D ALIGN((p_enc_info->width) + 31, 32) / 2;
> +	}

This is a lot of hardcoded alignment here. I favour static data for these, =
and
discourage hand written alignment which are hard to find and update when ad=
ding
new pixel formats.

I think the best direction is what Sven came up with for RGA3 driver recent=
ly
(under review):

https://lore.kernel.org/linux-media/20251203-spu-rga3-v2-3-989a67947f71@pen=
gutronix.de/

> +
> +	reg->option =3D SET_FB_OPTION_END | SET_FB_OPTION_START;
> +	reg->pic_info =3D SET_FB_PIC_INFO_STRIDE(p_enc_info->stride);
> +	reg->pic_size =3D SET_FB_PIC_SIZE_WIDTH(buf_width) |
> +			SET_FB_PIC_SIZE_HEIGHT(buf_height);
> +	reg->num_fb =3D SET_FB_NUM_FBC_END_IDX(p_enc_info->num_frame_buffers - =
1) |
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SET_FB_NUM_MV_COL_END_IDX(mv_count - 1)=
;
> +	reg->fbc_stride =3D SET_FB_FBC_STRIDE_L(stride_l) |
> +			=C2=A0 SET_FB_FBC_STRIDE_C(stride_c);
> +	reg->default_cdf =3D 0;
> +
> +	for (i =3D 0; i < p_enc_info->num_frame_buffers; i++) {
> +		reg->fbc_y[i] =3D fb_arr[i].buf_y;
> +		reg->fbc_c[i] =3D fb_arr[i].buf_cb;
> +		reg->fbc_cr[i] =3D fb_arr[i].buf_cr;
> +		reg->fbc_y_offset[i] =3D p_enc_info->vb_fbc_y_tbl[i].daddr;
> +		reg->fbc_c_offset[i] =3D p_enc_info->vb_fbc_c_tbl[i].daddr;
> +		reg->fbc_cr_offset[i] =3D p_enc_info->vb_fbc_c_tbl[i].daddr +
> +						(p_enc_info->vb_fbc_c_tbl[i].size >> 1);
> +		reg->sub_sampled[i] =3D p_enc_info->vb_sub_sam_buf[i].daddr;
> +	}
> +	for (i =3D 0; i < mv_count; i++)
> +		reg->mv_col[i] =3D p_enc_info->vb_mv[i].daddr;
> +}
> +
> +int wave6_vpu_enc_register_frame_buffer(struct vpu_instance *inst, struc=
t frame_buffer *fb_arr)
> +{
> +	struct enc_cmd_set_fb_reg *reg;
> +	struct enc_info *p_enc_info =3D &inst->codec_info->enc_info;
> +	u32 mv_count =3D p_enc_info->seq_info.req_mv_buffer_count;
> +	int ret;
> +	u32 idx;
> +
> +	lockdep_assert_held(&inst->dev->hw_lock);
> +
> +	for (idx =3D 0; idx < p_enc_info->num_frame_buffers; idx++) {
> +		if (!p_enc_info->vb_fbc_y_tbl[idx].daddr)
> +			return -EINVAL;
> +		if (!p_enc_info->vb_fbc_c_tbl[idx].daddr)
> +			return -EINVAL;
> +		if (!p_enc_info->vb_sub_sam_buf[idx].daddr)
> +			return -EINVAL;
> +	}
> +	for (idx =3D 0; idx < mv_count; idx++) {
> +		if (!p_enc_info->vb_mv[idx].daddr)
> +			return -EINVAL;
> +	}
> +
> +	reg =3D kzalloc(sizeof(*reg), GFP_KERNEL);
> +	if (!reg)
> +		return -ENOMEM;
> +
> +	wave6_gen_set_fb_reg(p_enc_info, inst->std, fb_arr, reg);
> +
> +	vpu_write_reg(inst->dev, W6_CMD_SET_FB_OPTION, reg->option);
> +	vpu_write_reg(inst->dev, W6_CMD_SET_FB_PIC_INFO, reg->pic_info);
> +	vpu_write_reg(inst->dev, W6_CMD_SET_FB_PIC_SIZE, reg->pic_size);
> +	vpu_write_reg(inst->dev, W6_CMD_SET_FB_NUM, reg->num_fb);
> +	vpu_write_reg(inst->dev, W6_CMD_SET_FB_FBC_STRIDE, reg->fbc_stride);
> +	vpu_write_reg(inst->dev, W6_CMD_SET_FB_DEFAULT_CDF, reg->default_cdf);
> +	for (idx =3D 0; idx < p_enc_info->num_frame_buffers; idx++) {
> +		vpu_write_reg(inst->dev, W6_CMD_SET_FB_FBC_Y(idx), reg->fbc_y[idx]);
> +		vpu_write_reg(inst->dev, W6_CMD_SET_FB_FBC_C(idx), reg->fbc_c[idx]);
> +		vpu_write_reg(inst->dev, W6_CMD_SET_FB_FBC_CR(idx), reg->fbc_cr[idx]);
> +		vpu_write_reg(inst->dev, W6_CMD_SET_FB_FBC_Y_OFFSET(idx),
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg->fbc_y_offset[idx]);
> +		vpu_write_reg(inst->dev, W6_CMD_SET_FB_FBC_C_OFFSET(idx),
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg->fbc_c_offset[idx]);
> +		vpu_write_reg(inst->dev, W6_CMD_SET_FB_FBC_CR_OFFSET(idx),
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg->fbc_cr_offset[idx]);
> +		vpu_write_reg(inst->dev, W6_CMD_SET_FB_SUB_SAMPLED(idx),
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg->sub_sampled[idx]);
> +	}
> +	for (idx =3D 0; idx < mv_count; idx++)
> +		vpu_write_reg(inst->dev, W6_CMD_SET_FB_MV_COL(idx), reg->mv_col[idx]);
> +
> +	wave6_send_command(inst->dev, inst->id, inst->std, W6_CMD_SET_FB);
> +	ret =3D wave6_wait_vpu_busy(inst->dev, W6_VPU_BUSY_STATUS);
> +	if (ret) {
> +		dev_err(inst->dev->dev, "%s: timeout\n", __func__);
> +		kfree(reg);
> +		return ret;
> +	}
> +
> +	if (!vpu_read_reg(inst->dev, W6_RET_SUCCESS)) {
> +		kfree(reg);
> +		return -EIO;
> +	}
> +
> +	kfree(reg);
> +	return 0;
> +}
> +
> +struct enc_cmd_enc_pic_reg {
> +	u32 bs_start;
> +	u32 bs_size;
> +	u32 bs_option;
> +	u32 sec_axi;
> +	u32 report;
> +	u32 mv_histo0;
> +	u32 mv_histo1;
> +	u32 custom_map_param;
> +	u32 custom_map_addr;
> +	u32 src_pic_idx;
> +	u32 src_addr_y;
> +	u32 src_addr_u;
> +	u32 src_addr_v;
> +	u32 src_stride;
> +	u32 src_fmt;
> +	u32 src_axi_sel;
> +	u32 code_option;
> +	u32 param;
> +	u32 longterm_pic;
> +	u32 prefix_sei_nal_addr;
> +	u32 prefix_sei_info;
> +	u32 suffix_sei_nal_addr;
> +	u32 suffix_sei_info;
> +	u32 timestamp_low;
> +	u32 timestamp_high;
> +	u32 csc_coeff[MAX_CSC_COEFF_NUM];
> +};
> +
> +static bool is_format_conv(enum frame_buffer_format in_fmt,
> +			=C2=A0=C2=A0 enum frame_buffer_format out_fmt)
> +{
> +	if (in_fmt =3D=3D FORMAT_420 ||
> +	=C2=A0=C2=A0=C2=A0 in_fmt =3D=3D FORMAT_420_P10_16BIT_MSB ||
> +	=C2=A0=C2=A0=C2=A0 in_fmt =3D=3D FORMAT_420_P10_16BIT_LSB ||
> +	=C2=A0=C2=A0=C2=A0 in_fmt =3D=3D FORMAT_420_P10_32BIT_MSB ||
> +	=C2=A0=C2=A0=C2=A0 in_fmt =3D=3D FORMAT_420_P10_32BIT_LSB) {
> +		if (out_fmt !=3D FORMAT_420 &&
> +		=C2=A0=C2=A0=C2=A0 out_fmt !=3D FORMAT_420_P10_16BIT_MSB &&
> +		=C2=A0=C2=A0=C2=A0 out_fmt !=3D FORMAT_420_P10_16BIT_LSB &&
> +		=C2=A0=C2=A0=C2=A0 out_fmt !=3D FORMAT_420_P10_32BIT_MSB &&
> +		=C2=A0=C2=A0=C2=A0 out_fmt !=3D FORMAT_420_P10_32BIT_LSB)
> +			return true;
> +	} else if (in_fmt =3D=3D FORMAT_422 ||
> +		=C2=A0=C2=A0 in_fmt =3D=3D FORMAT_422_P10_16BIT_MSB ||
> +		=C2=A0=C2=A0 in_fmt =3D=3D FORMAT_422_P10_16BIT_LSB ||
> +		=C2=A0=C2=A0 in_fmt =3D=3D FORMAT_422_P10_32BIT_MSB ||
> +		=C2=A0=C2=A0 in_fmt =3D=3D FORMAT_422_P10_32BIT_LSB) {
> +		if (out_fmt !=3D FORMAT_422 &&
> +		=C2=A0=C2=A0=C2=A0 out_fmt !=3D FORMAT_422_P10_16BIT_MSB &&
> +		=C2=A0=C2=A0=C2=A0 out_fmt !=3D FORMAT_422_P10_16BIT_LSB &&
> +		=C2=A0=C2=A0=C2=A0 out_fmt !=3D FORMAT_422_P10_32BIT_MSB &&
> +		=C2=A0=C2=A0=C2=A0 out_fmt !=3D FORMAT_422_P10_32BIT_LSB)
> +			return true;
> +	} else if (in_fmt =3D=3D FORMAT_444 ||
> +		=C2=A0=C2=A0 in_fmt =3D=3D FORMAT_444_P10_16BIT_MSB ||
> +		=C2=A0=C2=A0 in_fmt =3D=3D FORMAT_444_P10_16BIT_LSB ||
> +		=C2=A0=C2=A0 in_fmt =3D=3D FORMAT_444_P10_32BIT_MSB ||
> +		=C2=A0=C2=A0 in_fmt =3D=3D FORMAT_444_P10_32BIT_LSB) {
> +		if (out_fmt !=3D FORMAT_444 &&
> +		=C2=A0=C2=A0=C2=A0 out_fmt !=3D FORMAT_444_P10_16BIT_MSB &&
> +		=C2=A0=C2=A0=C2=A0 out_fmt !=3D FORMAT_444_P10_16BIT_LSB &&
> +		=C2=A0=C2=A0=C2=A0 out_fmt !=3D FORMAT_444_P10_32BIT_MSB &&
> +		=C2=A0=C2=A0=C2=A0 out_fmt !=3D FORMAT_444_P10_32BIT_LSB)
> +			return true;
> +	}

Please port to v4l2-common, make sure to keep around struct v4l2_format_inf=
o for
the selected format. This function will then be:

  return (in_info->hdiv =3D=3D out_info->hdiv) && (in_info->vdiv =3D=3D out=
_info->vdiv);

And that will never have to be updated when adding formats.

Nicolas

> +
> +	return false;
> +}
> +
> +static void wave6_gen_enc_pic_reg(struct enc_info *p_enc_info, bool cbcr=
_interleave, bool nv21,
> +				=C2=A0 struct enc_param *opt, struct enc_cmd_enc_pic_reg *reg)
> +{
> +	struct enc_open_param open =3D p_enc_info->open_param;
> +	struct enc_codec_param param =3D open.codec_param;
> +	bool is_lsb =3D false;
> +	bool is_10bit =3D false;
> +	bool is_3p4b =3D false;
> +	bool is_cr_first =3D nv21;
> +	u32 stride_c;
> +	u32 c_fmt_idc;
> +	bool is_ayuv =3D false;
> +	bool is_csc_format =3D false;
> +	bool is_24bit =3D false;
> +	bool is_packed =3D false;
> +	bool is_packed_uv_first =3D false;
> +	bool format_conv =3D is_format_conv(open.src_format, open.output_format=
);
> +
> +	c_fmt_idc =3D get_chroma_format_idc(open.src_format);
> +
> +	switch (open.src_format) {
> +	case FORMAT_420:
> +	case FORMAT_420_P10_16BIT_MSB:
> +	case FORMAT_420_P10_16BIT_LSB:
> +		stride_c =3D (cbcr_interleave) ? opt->source_frame->stride :
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (opt->source_frame->stride / 2=
);
> +		break;
> +	case FORMAT_420_P10_32BIT_MSB:
> +	case FORMAT_420_P10_32BIT_LSB:
> +		stride_c =3D (cbcr_interleave) ? opt->source_frame->stride :
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ALIGN((opt->source_frame->stri=
de / 2), 16);
> +		break;
> +	case FORMAT_422:
> +	case FORMAT_422_P10_16BIT_MSB:
> +	case FORMAT_422_P10_16BIT_LSB:
> +		stride_c =3D (cbcr_interleave) ? opt->source_frame->stride :
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (opt->source_frame->stride / 2=
);
> +		stride_c =3D (format_conv) ? (stride_c * 2) : stride_c;
> +		break;
> +	case FORMAT_422_P10_32BIT_MSB:
> +	case FORMAT_422_P10_32BIT_LSB:
> +		stride_c =3D (cbcr_interleave) ? opt->source_frame->stride :
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ALIGN((opt->source_frame->stri=
de / 2), 16);
> +		stride_c =3D (format_conv) ? (stride_c * 2) : stride_c;
> +		break;
> +	case FORMAT_444:
> +	case FORMAT_444_P10_16BIT_MSB:
> +	case FORMAT_444_P10_16BIT_LSB:
> +		stride_c =3D (cbcr_interleave) ? (opt->source_frame->stride * 2) :
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 opt->source_frame->stride;
> +		stride_c =3D (format_conv) ? (stride_c * 2) : stride_c;
> +		break;
> +	case FORMAT_444_P10_32BIT_MSB:
> +	case FORMAT_444_P10_32BIT_LSB:
> +		stride_c =3D (cbcr_interleave) ? ALIGN((opt->source_frame->stride * 2)=
, 16) :
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 opt->source_frame->stride;
> +		stride_c =3D (format_conv) ? (stride_c * 2) : stride_c;
> +		break;
> +	case FORMAT_YUV444_24BIT:
> +		stride_c =3D ALIGN((opt->source_frame->stride * 2), 16);
> +		break;

Port this code to v4l2-common.

> +	default:
> +		stride_c =3D 0;

Sounds like a programming error to reach that, use some BUG_ON (or WARN_ON =
if
you are sure the remaining code can safely run).

> +		break;
> +	}
> +
> +	switch (open.src_format) {
> +	case FORMAT_420:
> +	case FORMAT_422:
> +	case FORMAT_444:
> +	case FORMAT_400:
> +	case FORMAT_YUYV:
> +	case FORMAT_YVYU:
> +	case FORMAT_UYVY:
> +	case FORMAT_VYUY:
> +		is_lsb =3D false;
> +		is_3p4b =3D false;
> +		break;
> +	case FORMAT_420_P10_16BIT_MSB:
> +	case FORMAT_422_P10_16BIT_MSB:
> +	case FORMAT_444_P10_16BIT_MSB:
> +	case FORMAT_400_P10_16BIT_MSB:
> +	case FORMAT_YUYV_P10_16BIT_MSB:
> +	case FORMAT_YVYU_P10_16BIT_MSB:
> +	case FORMAT_UYVY_P10_16BIT_MSB:
> +	case FORMAT_VYUY_P10_16BIT_MSB:
> +		is_lsb =3D false;
> +		is_10bit =3D true;
> +		is_3p4b =3D false;
> +		break;
> +	case FORMAT_420_P10_16BIT_LSB:
> +	case FORMAT_422_P10_16BIT_LSB:
> +	case FORMAT_444_P10_16BIT_LSB:
> +	case FORMAT_400_P10_16BIT_LSB:
> +	case FORMAT_YUYV_P10_16BIT_LSB:
> +	case FORMAT_YVYU_P10_16BIT_LSB:
> +	case FORMAT_UYVY_P10_16BIT_LSB:
> +	case FORMAT_VYUY_P10_16BIT_LSB:
> +		is_lsb =3D true;
> +		is_10bit =3D true;
> +		is_3p4b =3D false;
> +		break;
> +	case FORMAT_420_P10_32BIT_MSB:
> +	case FORMAT_422_P10_32BIT_MSB:
> +	case FORMAT_444_P10_32BIT_MSB:
> +	case FORMAT_400_P10_32BIT_MSB:
> +	case FORMAT_YUYV_P10_32BIT_MSB:
> +	case FORMAT_YVYU_P10_32BIT_MSB:
> +	case FORMAT_UYVY_P10_32BIT_MSB:
> +	case FORMAT_VYUY_P10_32BIT_MSB:
> +		is_lsb =3D false;
> +		is_10bit =3D true;
> +		is_3p4b =3D true;
> +		break;
> +	case FORMAT_420_P10_32BIT_LSB:
> +	case FORMAT_422_P10_32BIT_LSB:
> +	case FORMAT_444_P10_32BIT_LSB:
> +	case FORMAT_400_P10_32BIT_LSB:
> +	case FORMAT_YUYV_P10_32BIT_LSB:
> +	case FORMAT_YVYU_P10_32BIT_LSB:
> +	case FORMAT_UYVY_P10_32BIT_LSB:
> +	case FORMAT_VYUY_P10_32BIT_LSB:
> +		is_lsb =3D true;
> +		is_10bit =3D true;
> +		is_3p4b =3D true;
> +		break;
> +	case FORMAT_RGB_32BIT_PACKED:
> +		is_ayuv =3D false;
> +		is_csc_format =3D true;
> +		break;
> +	case FORMAT_RGB_P10_32BIT_PACKED:
> +		is_ayuv =3D false;
> +		is_csc_format =3D true;
> +		is_10bit =3D true;
> +		break;
> +	case FORMAT_YUV444_32BIT_PACKED:
> +		is_ayuv =3D true;
> +		is_csc_format =3D true;
> +		break;
> +	case FORMAT_YUV444_P10_32BIT_PACKED:
> +		is_ayuv =3D true;
> +		is_csc_format =3D true;
> +		is_10bit =3D true;
> +		break;
> +	case FORMAT_RGB_24BIT_PACKED:
> +		is_ayuv =3D false;
> +		is_csc_format =3D true;
> +		is_24bit =3D true;
> +		break;
> +	case FORMAT_YUV444_24BIT_PACKED:
> +		is_ayuv =3D true;
> +		is_csc_format =3D true;
> +		is_24bit =3D true;
> +		break;
> +	case FORMAT_YUV444_24BIT:
> +		is_ayuv =3D true;
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	switch (open.src_format) {
> +	case FORMAT_YUYV:
> +	case FORMAT_YUYV_P10_16BIT_MSB:
> +	case FORMAT_YUYV_P10_16BIT_LSB:
> +	case FORMAT_YUYV_P10_32BIT_MSB:
> +	case FORMAT_YUYV_P10_32BIT_LSB:
> +		is_packed =3D true;
> +		break;
> +	case FORMAT_YVYU:
> +	case FORMAT_YVYU_P10_16BIT_MSB:
> +	case FORMAT_YVYU_P10_16BIT_LSB:
> +	case FORMAT_YVYU_P10_32BIT_MSB:
> +	case FORMAT_YVYU_P10_32BIT_LSB:
> +		is_packed =3D true;
> +		is_cr_first =3D true;
> +		break;
> +	case FORMAT_UYVY:
> +	case FORMAT_UYVY_P10_16BIT_MSB:
> +	case FORMAT_UYVY_P10_16BIT_LSB:
> +	case FORMAT_UYVY_P10_32BIT_MSB:
> +	case FORMAT_UYVY_P10_32BIT_LSB:
> +		is_packed =3D true;
> +		is_packed_uv_first =3D true;
> +		break;
> +	case FORMAT_VYUY:
> +	case FORMAT_VYUY_P10_16BIT_MSB:
> +	case FORMAT_VYUY_P10_16BIT_LSB:
> +	case FORMAT_VYUY_P10_32BIT_MSB:
> +	case FORMAT_VYUY_P10_32BIT_LSB:
> +		is_packed =3D true;
> +		is_packed_uv_first =3D true;
> +		is_cr_first =3D true;
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	reg->src_fmt =3D ENC_PIC_SRC_FMT_C_FMT_IDC(c_fmt_idc) |
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ENC_PIC_SRC_FMT_CSC_24BIT(is_24bi=
t) |
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ENC_PIC_SRC_FMT_CSC_AYUV(is_ayuv)=
 |
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ENC_PIC_SRC_FMT_CSC_ENABLE(is_csc=
_format) |
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ENC_PIC_SRC_FMT_CSC_FMT_ORDER(opt=
->csc.fmt_order) |
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ENC_PIC_SRC_FMT_ENDIAN(open.sourc=
e_endian) |
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ENC_PIC_SRC_FMT_10BIT_ORDER(is_ls=
b) |
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ENC_PIC_SRC_FMT_10BIT_3PIXEL_4BYT=
E(is_3p4b) |
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ENC_PIC_SRC_FMT_10BIT_ENABLE(is_1=
0bit) |
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ENC_PIC_SRC_FMT_YUV422_PACKED_ORD=
ER(is_packed_uv_first) |
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ENC_PIC_SRC_FMT_CBCR_ORDER(is_cr_=
first) |
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ENC_PIC_SRC_FMT_2PLANE(cbcr_inter=
leave) |
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ENC_PIC_SRC_FMT_YUV422_PACKED(is_=
packed);
> +	reg->bs_start =3D opt->pic_stream_buffer_addr;
> +	reg->bs_size =3D opt->pic_stream_buffer_size;
> +	reg->sec_axi =3D ENC_PIC_SEC_AXI_RDO_ENABLE(p_enc_info->sec_axi.use_enc=
_rdo) |
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ENC_PIC_SEC_AXI_LF_ENABLE(p_enc_i=
nfo->sec_axi.use_enc_lf);
> +	reg->report =3D ENC_PIC_REPORT_MV_HISTO_ENABLE(param.en_report_mv_histo=
);
> +	reg->mv_histo0 =3D ENC_PIC_MV_HISTO0_THRESHOLD0(param.mv_histo_th0) |
> +			 ENC_PIC_MV_HISTO0_THRESHOLD1(param.mv_histo_th1);
> +	reg->mv_histo1 =3D ENC_PIC_MV_HISTO1_THRESHOLD2(param.mv_histo_th2) |
> +			 ENC_PIC_MV_HISTO1_THRESHOLD3(param.mv_histo_th3);
> +	reg->src_pic_idx =3D (opt->src_end) ? ENC_PIC_SRC_PIC_IDX_END : opt->sr=
c_idx;
> +	reg->src_addr_y =3D opt->source_frame->buf_y;
> +	reg->src_addr_u =3D opt->source_frame->buf_cb;
> +	reg->src_addr_v =3D opt->source_frame->buf_cr;
> +	reg->src_stride =3D ENC_PIC_SRC_STRIDE_L(opt->source_frame->stride) |
> +			=C2=A0 ENC_PIC_SRC_STRIDE_C(stride_c);
> +	reg->src_axi_sel =3D ENC_PIC_SRC_AXI_SEL_PRP_PORT;
> +	reg->code_option =3D ENC_PIC_CODE_OPTION_ENCODE_VCL |
> +			=C2=A0=C2=A0 ENC_PIC_CODE_OPTION_ENCODE_HEADER;
> +	reg->param =3D ENC_PIC_PARAM_INTRA_4X4(param.intra_4x4) |
> +		=C2=A0=C2=A0=C2=A0=C2=A0 ENC_PIC_PARAM_FORCE_PIC_TYPE(opt->force_pic_t=
ype) |
> +		=C2=A0=C2=A0=C2=A0=C2=A0 ENC_PIC_PARAM_FORCE_PIC_TYPE_ENABLE(opt->forc=
e_pic) |
> +		=C2=A0=C2=A0=C2=A0=C2=A0 ENC_PIC_PARAM_FORCE_PIC_QP_B(opt->force_pic_q=
p_b) |
> +		=C2=A0=C2=A0=C2=A0=C2=A0 ENC_PIC_PARAM_FORCE_PIC_QP_P(opt->force_pic_q=
p_p) |
> +		=C2=A0=C2=A0=C2=A0=C2=A0 ENC_PIC_PARAM_FORCE_PIC_QP_I(opt->force_pic_q=
p_i) |
> +		=C2=A0=C2=A0=C2=A0=C2=A0 ENC_PIC_PARAM_FORCE_PIC_QP_ENABLE(opt->force_=
pic_qp) |
> +		=C2=A0=C2=A0=C2=A0=C2=A0 ENC_PIC_PARAM_PIC_SKIP_FLAG(opt->skip_picture=
);
> +	reg->timestamp_low =3D lower_32_bits(opt->timestamp);
> +	reg->timestamp_high =3D upper_32_bits(opt->timestamp);
> +	reg->csc_coeff[0] =3D ENC_PIC_CSC_COEFF0_RY(opt->csc.coef_ry) |
> +			=C2=A0=C2=A0=C2=A0 ENC_PIC_CSC_COEFF0_GY(opt->csc.coef_gy) |
> +			=C2=A0=C2=A0=C2=A0 ENC_PIC_CSC_COEFF0_BY(opt->csc.coef_by);
> +	reg->csc_coeff[1] =3D ENC_PIC_CSC_COEFF1_RCB(opt->csc.coef_rcb) |
> +			=C2=A0=C2=A0=C2=A0 ENC_PIC_CSC_COEFF1_GCB(opt->csc.coef_gcb) |
> +			=C2=A0=C2=A0=C2=A0 ENC_PIC_CSC_COEFF1_BCB(opt->csc.coef_bcb);
> +	reg->csc_coeff[2] =3D ENC_PIC_CSC_COEFF2_RCR(opt->csc.coef_rcr) |
> +			=C2=A0=C2=A0=C2=A0 ENC_PIC_CSC_COEFF2_GCR(opt->csc.coef_gcr) |
> +			=C2=A0=C2=A0=C2=A0 ENC_PIC_CSC_COEFF2_BCR(opt->csc.coef_bcr);
> +	reg->csc_coeff[3] =3D ENC_PIC_CSC_COEFF3_OFFSET_Y(opt->csc.offset_y) |
> +			=C2=A0=C2=A0=C2=A0 ENC_PIC_CSC_COEFF3_OFFSET_CB(opt->csc.offset_cb) |
> +			=C2=A0=C2=A0=C2=A0 ENC_PIC_CSC_COEFF3_OFFSET_CR(opt->csc.offset_cr);
> +}
> +
> +int wave6_vpu_encode(struct vpu_instance *inst, struct enc_param *option=
, u32 *fail_res)
> +{
> +	struct enc_cmd_enc_pic_reg reg;
> +	struct enc_info *p_enc_info =3D &inst->codec_info->enc_info;
> +	int ret;
> +
> +	lockdep_assert_held(&inst->dev->hw_lock);
> +
> +	memset(&reg, 0, sizeof(struct enc_cmd_enc_pic_reg));
> +
> +	wave6_gen_enc_pic_reg(p_enc_info, inst->cbcr_interleave,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst->nv21, option, &reg);
> +
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_BS_START, reg.bs_start);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_BS_SIZE, reg.bs_size);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_BS_OPTION, reg.bs_option);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_SEC_AXI, reg.sec_axi);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_REPORT, reg.report);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_MV_HISTO0, reg.mv_histo0);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_MV_HISTO1, reg.mv_histo1);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_CUSTOM_MAP_PARAM, reg.custom_ma=
p_param);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_CUSTOM_MAP_ADDR, reg.custom_map=
_addr);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_SRC_PIC_IDX, reg.src_pic_idx);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_SRC_ADDR_Y, reg.src_addr_y);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_SRC_ADDR_U, reg.src_addr_u);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_SRC_ADDR_V, reg.src_addr_v);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_SRC_STRIDE, reg.src_stride);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_SRC_FMT, reg.src_fmt);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_SRC_AXI_SEL, reg.src_axi_sel);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_CODE_OPTION, reg.code_option);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_PARAM, reg.param);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_LONGTERM_PIC, reg.longterm_pic)=
;
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_PREFIX_SEI_NAL_ADDR, reg.prefix=
_sei_nal_addr);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_PREFIX_SEI_INFO, reg.prefix_sei=
_info);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_SUFFIX_SEI_NAL_ADDR, reg.suffix=
_sei_nal_addr);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_SUFFIX_SEI_INFO, reg.suffix_sei=
_info);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_TIMESTAMP_LOW, reg.timestamp_lo=
w);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_TIMESTAMP_HIGH, reg.timestamp_h=
igh);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_CSC_COEFF0, reg.csc_coeff[0]);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_CSC_COEFF1, reg.csc_coeff[1]);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_CSC_COEFF2, reg.csc_coeff[2]);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_CSC_COEFF3, reg.csc_coeff[3]);
> +
> +	wave6_send_command(inst->dev, inst->id, inst->std, W6_CMD_ENC_PIC);
> +	ret =3D wave6_wait_vpu_busy(inst->dev, W6_VPU_BUSY_STATUS);
> +	if (ret) {
> +		dev_err(inst->dev->dev, "%s: timeout\n", __func__);
> +		return -ETIMEDOUT;
> +	}
> +
> +	if (!vpu_read_reg(inst->dev, W6_RET_SUCCESS)) {
> +		*fail_res =3D vpu_read_reg(inst->dev, W6_RET_FAIL_REASON);
> +		wave6_print_reg_err(inst->dev, *fail_res);
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
> +int wave6_vpu_enc_get_result(struct vpu_instance *inst, struct enc_outpu=
t_info *result)
> +{
> +	u32 reg_val;
> +	int ret;
> +
> +	lockdep_assert_held(&inst->dev->hw_lock);
> +
> +	ret =3D wave6_send_query(inst->dev, inst->id, inst->std, W6_QUERY_OPT_G=
ET_RESULT);
> +	if (ret)
> +		return ret;
> +
> +	result->encoding_success =3D vpu_read_reg(inst->dev, W6_RET_ENC_ENCODIN=
G_SUCCESS);
> +	if (!result->encoding_success)
> +		result->error_reason =3D vpu_read_reg(inst->dev, W6_RET_ENC_ERR_INFO);
> +	else
> +		result->warn_info =3D vpu_read_reg(inst->dev, W6_RET_DEC_WARN_INFO);
> +
> +	result->enc_pic_cnt =3D vpu_read_reg(inst->dev, W6_RET_ENC_PIC_NUM);
> +	result->pic_type =3D vpu_read_reg(inst->dev, W6_RET_ENC_PIC_TYPE);
> +	result->enc_vcl_nut =3D vpu_read_reg(inst->dev, W6_RET_ENC_VCL_NUT);
> +	result->non_ref_pic =3D vpu_read_reg(inst->dev, W6_RET_ENC_PIC_NON_REF_=
PIC_FLAG);
> +	result->num_of_slices =3D vpu_read_reg(inst->dev, W6_RET_ENC_PIC_SLICE_=
NUM);
> +	result->pic_skipped =3D vpu_read_reg(inst->dev, W6_RET_ENC_PIC_SKIP);
> +	result->num_of_intra =3D vpu_read_reg(inst->dev, W6_RET_ENC_PIC_NUM_INT=
RA);
> +	result->num_of_merge =3D vpu_read_reg(inst->dev, W6_RET_ENC_PIC_NUM_MER=
GE);
> +	result->num_of_skip_block =3D vpu_read_reg(inst->dev, W6_RET_ENC_PIC_NU=
M_SKIP);
> +	result->avg_ctu_qp =3D vpu_read_reg(inst->dev, W6_RET_ENC_PIC_AVG_CTU_Q=
P);
> +	result->enc_pic_byte =3D vpu_read_reg(inst->dev, W6_RET_ENC_PIC_BYTE);
> +	result->enc_gop_pic_idx =3D vpu_read_reg(inst->dev, W6_RET_ENC_GOP_PIC_=
IDX);
> +	result->enc_pic_poc =3D vpu_read_reg(inst->dev, W6_RET_ENC_PIC_POC);
> +	result->enc_src_idx =3D vpu_read_reg(inst->dev, W6_RET_ENC_USED_SRC_IDX=
);
> +	result->wr_ptr =3D vpu_read_reg(inst->dev, W6_RET_ENC_WR_PTR);
> +	result->rd_ptr =3D vpu_read_reg(inst->dev, W6_RET_ENC_RD_PTR);
> +	result->bitstream_buffer =3D vpu_read_reg(inst->dev, W6_RET_ENC_RD_PTR)=
;
> +	result->pic_distortion_low =3D vpu_read_reg(inst->dev, W6_RET_ENC_PIC_D=
IST_LOW);
> +	result->pic_distortion_high =3D vpu_read_reg(inst->dev, W6_RET_ENC_PIC_=
DIST_HIGH);
> +	result->mv_histo.cnt0 =3D vpu_read_reg(inst->dev, W6_RET_ENC_HISTO_CNT0=
);
> +	result->mv_histo.cnt1 =3D vpu_read_reg(inst->dev, W6_RET_ENC_HISTO_CNT1=
);
> +	result->mv_histo.cnt2 =3D vpu_read_reg(inst->dev, W6_RET_ENC_HISTO_CNT2=
);
> +	result->mv_histo.cnt3 =3D vpu_read_reg(inst->dev, W6_RET_ENC_HISTO_CNT3=
);
> +	result->mv_histo.cnt4 =3D vpu_read_reg(inst->dev, W6_RET_ENC_HISTO_CNT4=
);
> +	result->fme_sum.lower_x0 =3D vpu_read_reg(inst->dev, W6_RET_ENC_SUM_ME0=
_X_DIR_LOWER);
> +	result->fme_sum.higher_x0 =3D vpu_read_reg(inst->dev, W6_RET_ENC_SUM_ME=
0_X_DIR_HIGHER);
> +	result->fme_sum.lower_y0 =3D vpu_read_reg(inst->dev, W6_RET_ENC_SUM_ME0=
_Y_DIR_LOWER);
> +	result->fme_sum.higher_y0 =3D vpu_read_reg(inst->dev, W6_RET_ENC_SUM_ME=
0_Y_DIR_HIGHER);
> +	result->fme_sum.lower_x1 =3D vpu_read_reg(inst->dev, W6_RET_ENC_SUM_ME1=
_X_DIR_LOWER);
> +	result->fme_sum.higher_x1 =3D vpu_read_reg(inst->dev, W6_RET_ENC_SUM_ME=
1_X_DIR_HIGHER);
> +	result->fme_sum.lower_y1 =3D vpu_read_reg(inst->dev, W6_RET_ENC_SUM_ME1=
_Y_DIR_LOWER);
> +	result->fme_sum.higher_y1 =3D vpu_read_reg(inst->dev, W6_RET_ENC_SUM_ME=
1_Y_DIR_HIGHER);
> +	result->src_y_addr =3D vpu_read_reg(inst->dev, W6_RET_ENC_SRC_Y_ADDR);
> +	result->custom_map_addr =3D vpu_read_reg(inst->dev, W6_RET_ENC_CUSTOM_M=
AP_ADDR);
> +	result->prefix_sei_nal_addr =3D vpu_read_reg(inst->dev, W6_RET_ENC_PREF=
IX_SEI_NAL_ADDR);
> +	result->suffix_sei_nal_addr =3D vpu_read_reg(inst->dev, W6_RET_ENC_SUFF=
IX_SEI_NAL_ADDR);
> +
> +	result->recon_frame_index =3D vpu_read_reg(inst->dev, W6_RET_ENC_PIC_ID=
X);
> +	if (result->recon_frame_index =3D=3D RECON_IDX_FLAG_HEADER_ONLY)
> +		result->bitstream_size =3D result->enc_pic_byte;
> +	else if (result->recon_frame_index < 0)
> +		result->bitstream_size =3D 0;
> +	else
> +		result->bitstream_size =3D result->enc_pic_byte;
> +
> +	reg_val =3D vpu_read_reg(inst->dev, W6_RET_ENC_TIMESTAMP_LOW);
> +	result->timestamp =3D vpu_read_reg(inst->dev, W6_RET_ENC_TIMESTAMP_HIGH=
);
> +	result->timestamp =3D (result->timestamp << 32) | reg_val;
> +
> +	result->cycle.host_cmd_s =3D vpu_read_reg(inst->dev, W6_RET_CQ_IN_TICK)=
;
> +	result->cycle.host_cmd_e =3D vpu_read_reg(inst->dev, W6_RET_RQ_OUT_TICK=
);
> +	result->cycle.proc_s =3D vpu_read_reg(inst->dev, W6_RET_HW_RUN_TICK);
> +	result->cycle.proc_e =3D vpu_read_reg(inst->dev, W6_RET_HW_DONE_TICK);
> +	result->cycle.vpu_s =3D vpu_read_reg(inst->dev, W6_RET_FW_RUN_TICK);
> +	result->cycle.vpu_e =3D vpu_read_reg(inst->dev, W6_RET_FW_DONE_TICK);
> +	result->cycle.frame_cycle =3D (result->cycle.vpu_e - result->cycle.host=
_cmd_s) *
> +				=C2=A0=C2=A0=C2=A0 CYCLE_PER_TICK_VALUE;
> +	result->cycle.proc_cycle =3D (result->cycle.proc_e - result->cycle.proc=
_s) *
> +				=C2=A0=C2=A0 CYCLE_PER_TICK_VALUE;
> +	result->cycle.vpu_cycle =3D ((result->cycle.vpu_e - result->cycle.vpu_s=
) -
> +				=C2=A0=C2=A0 (result->cycle.proc_e - result->cycle.proc_s)) *
> +				=C2=A0 CYCLE_PER_TICK_VALUE;
> +
> +	return 0;
> +}
> +
> +int wave6_vpu_enc_fini_seq(struct vpu_instance *inst, u32 *fail_res)
> +{
> +	int ret;
> +
> +	lockdep_assert_held(&inst->dev->hw_lock);
> +
> +	wave6_send_command(inst->dev, inst->id, inst->std, W6_CMD_DESTROY_INSTA=
NCE);
> +	ret =3D wave6_wait_vpu_busy(inst->dev, W6_VPU_BUSY_STATUS);
> +	if (ret)
> +		return -ETIMEDOUT;
> +
> +	if (!vpu_read_reg(inst->dev, W6_RET_SUCCESS)) {
> +		*fail_res =3D vpu_read_reg(inst->dev, W6_RET_FAIL_REASON);
> +		wave6_print_reg_err(inst->dev, *fail_res);
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
> +static int wave6_vpu_enc_check_gop_param(struct vpu_instance *inst, stru=
ct enc_codec_param *p_param)
> +{
> +	struct device *dev =3D inst->dev->dev;
> +	int i;
> +	bool low_delay =3D true;
> +
> +	if (p_param->gop_preset_idx =3D=3D PRESET_IDX_CUSTOM_GOP) {
> +		if (p_param->gop_param.size > 1) {
> +			int min_val =3D p_param->gop_param.pic[0].poc_offset;
> +
> +			for (i =3D 1; i < p_param->gop_param.size; i++) {
> +				if (min_val > p_param->gop_param.pic[i].poc_offset) {
> +					low_delay =3D false;
> +					break;
> +				}
> +				min_val =3D p_param->gop_param.pic[i].poc_offset;
> +			}
> +		}
> +	} else if (p_param->gop_preset_idx =3D=3D PRESET_IDX_ALL_I ||
> +		=C2=A0=C2=A0 p_param->gop_preset_idx =3D=3D PRESET_IDX_IPP ||
> +		=C2=A0=C2=A0 p_param->gop_preset_idx =3D=3D PRESET_IDX_IBBB ||
> +		=C2=A0=C2=A0 p_param->gop_preset_idx =3D=3D PRESET_IDX_IPPPP ||
> +		=C2=A0=C2=A0 p_param->gop_preset_idx =3D=3D PRESET_IDX_IBBBB ||
> +		=C2=A0=C2=A0 p_param->gop_preset_idx =3D=3D PRESET_IDX_IPP_SINGLE) {
> +	}
> +
> +	if (p_param->gop_preset_idx >=3D PRESET_IDX_MAX) {
> +		dev_err(dev, "gop_preset_idx: %d\n", p_param->gop_preset_idx);
> +		return -EINVAL;
> +	}
> +
> +	if (p_param->gop_preset_idx =3D=3D PRESET_IDX_CUSTOM_GOP) {
> +		if (p_param->gop_param.size < 1 ||
> +		=C2=A0=C2=A0=C2=A0 p_param->gop_param.size > MAX_CUSTOM_GOP_NUM) {
> +			dev_err(dev, "gop size: %d\n", p_param->gop_param.size);
> +			return -EINVAL;
> +		}
> +		for (i =3D 0; i < p_param->gop_param.size; i++) {
> +			struct custom_gop_pic_param pic =3D p_param->gop_param.pic[i];
> +
> +			if (pic.pic_type !=3D PIC_TYPE_I &&
> +			=C2=A0=C2=A0=C2=A0 pic.pic_type !=3D PIC_TYPE_P &&
> +			=C2=A0=C2=A0=C2=A0 pic.pic_type !=3D PIC_TYPE_B) {
> +				dev_err(dev, "pic[%d].pic_type: %d\n", i, pic.pic_type);
> +				return -EINVAL;
> +			}
> +			if (pic.poc_offset < 1 ||
> +			=C2=A0=C2=A0=C2=A0 pic.poc_offset > p_param->gop_param.size) {
> +				dev_err(dev, "pic[%d].poc_offset: %d\n", i, pic.poc_offset);
> +				return -EINVAL;
> +			}
> +			if (pic.temporal_id < 0 || pic.temporal_id > 3) {
> +				dev_err(dev, "pic[%d].temporal_id: %d\n", i, pic.temporal_id);
> +				return -EINVAL;
> +			}
> +		}
> +		if (inst->std =3D=3D W_AVC_ENC && !low_delay) {
> +			for (i =3D 0; i < p_param->gop_param.size; i++) {
> +				if (p_param->gop_param.pic[i].temporal_id > 0) {
> +					dev_err(dev, "std: %d, pic[%d].temporal_id: %d\n",
> +						inst->std, i,
> +						p_param->gop_param.pic[i].temporal_id);
> +					return -EINVAL;
> +				}
> +			}
> +		}
> +	}
> +
> +	if (inst->std =3D=3D W_HEVC_ENC) {
> +		if (p_param->decoding_refresh_type > DEC_REFRESH_TYPE_IDR) {
> +			dev_err(dev, "decoding_refresh_type: %d\n", p_param->decoding_refresh=
_type);
> +			return -EINVAL;
> +		}
> +	} else {
> +		if (p_param->decoding_refresh_type !=3D DEC_REFRESH_TYPE_NON_IRAP) {
> +			dev_err(dev, "decoding_refresh_type: %d\n", p_param->decoding_refresh=
_type);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int wave6_vpu_enc_check_tile_slice_param(struct vpu_instance *ins=
t,
> +						int width, int height,
> +						struct enc_codec_param *p_param)
> +{
> +	struct device *dev =3D inst->dev->dev;
> +
> +	if (p_param->slice_mode > 2) {
> +		dev_err(dev, "slice_mode: %d\n", p_param->slice_mode);
> +		return -EINVAL;
> +	}
> +	if (p_param->slice_mode =3D=3D 1) {
> +		unsigned int ctu_size =3D (inst->std =3D=3D W_AVC_ENC) ? 16 : 64;
> +		unsigned int mb_num =3D ((width + ctu_size - 1) / ctu_size) *
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ((height + ctu_size - 1) / ctu_size);
> +
> +		if (p_param->slice_arg < 1 || p_param->slice_arg > 0x3FFFF) {
> +			dev_err(dev, "slice_arg: %d\n", p_param->slice_arg);
> +			return -EINVAL;
> +		}
> +		if (p_param->slice_arg > mb_num) {
> +			dev_info(dev, "slice_arg: %d, mb_num: %d\n",
> +				 p_param->slice_arg, mb_num);
> +			p_param->slice_arg =3D mb_num;
> +		}
> +		if (inst->std =3D=3D W_AVC_ENC && p_param->slice_arg < 4) {
> +			dev_info(dev, "std: %d, slice_arg: %d\n",
> +				 inst->std, p_param->slice_arg);
> +			p_param->slice_arg =3D 4;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int wave6_vpu_enc_check_rc_param(struct vpu_instance *inst, struc=
t enc_codec_param *p_param)
> +{
> +	struct device *dev =3D inst->dev->dev;
> +
> +	if (p_param->frame_rate < 1 || p_param->frame_rate > 960) {
> +		dev_err(dev, "frame_rate: %d\n", p_param->frame_rate);
> +		return -EINVAL;
> +	}
> +	if (p_param->bitrate > 1500000000) {
> +		dev_err(dev, "bitrate: %d\n", p_param->bitrate);
> +		return -EINVAL;
> +	}
> +	if (p_param->qp > 51) {
> +		dev_err(dev, "qp: %d\n", p_param->qp);
> +		return -EINVAL;
> +	}
> +	if (p_param->min_qp_i > 51 || p_param->min_qp_p > 51 || p_param->min_qp=
_b > 51) {
> +		dev_err(dev, "min_qp_i: %d, min_qp_p: %d, min_qp_b: %d\n",
> +			p_param->min_qp_i, p_param->min_qp_p, p_param->min_qp_b);
> +		return -EINVAL;
> +	}
> +	if (p_param->max_qp_i > 51 || p_param->max_qp_p > 51 || p_param->max_qp=
_b > 51) {
> +		dev_err(dev, "max_qp_i: %d, max_qp_p: %d, max_qp_b: %d\n",
> +			p_param->max_qp_i, p_param->max_qp_p, p_param->max_qp_b);
> +		return -EINVAL;
> +	}
> +	if (p_param->min_qp_i > p_param->max_qp_i) {
> +		dev_err(dev, "min_qp_i: %d, max_qp_i: %d\n", p_param->min_qp_i, p_para=
m->max_qp_i);
> +		return -EINVAL;
> +	}
> +	if (p_param->min_qp_p > p_param->max_qp_p) {
> +		dev_err(dev, "min_qp_p: %d, max_qp_p: %d\n", p_param->min_qp_p, p_para=
m->max_qp_p);
> +		return -EINVAL;
> +	}
> +	if (p_param->min_qp_b > p_param->max_qp_b) {
> +		dev_err(dev, "min_qp_b: %d, max_qp_b: %d\n", p_param->min_qp_b, p_para=
m->max_qp_b);
> +		return -EINVAL;
> +	}
> +	if (p_param->rc_initial_qp < -1 || p_param->rc_initial_qp > 51) {
> +		dev_err(dev, "rc_initial_qp: %d\n", p_param->rc_initial_qp);
> +		return -EINVAL;
> +	}
> +	if (p_param->en_rate_control !=3D 1 && p_param->en_rate_control !=3D 0)=
 {
> +		dev_err(dev, "en_rate_control: %d\n", p_param->en_rate_control);
> +		return -EINVAL;
> +	}
> +	if (p_param->rc_mode > 1) {
> +		dev_err(dev, "rc_mode: %d\n", p_param->rc_mode);
> +		return -EINVAL;
> +	}
> +	if (p_param->en_rate_control) {
> +		if (p_param->bitrate <=3D p_param->frame_rate) {
> +			dev_err(dev, "bitrate: %d, frame_rate: %d\n",
> +				p_param->bitrate, p_param->frame_rate);
> +			return -EINVAL;
> +		}
> +		if (p_param->rc_initial_qp !=3D -1) {
> +			if (p_param->rc_initial_qp < p_param->min_qp_i) {
> +				dev_err(dev, "rc_initial_qp: %d, min_qp_i: %d\n",
> +					p_param->rc_initial_qp, p_param->min_qp_i);
> +				return -EINVAL;
> +			}
> +			if (p_param->rc_initial_qp > p_param->max_qp_i) {
> +				dev_err(dev, "rc_initial_qp: %d, max_qp_i: %d\n",
> +					p_param->rc_initial_qp, p_param->max_qp_i);
> +				return -EINVAL;
> +			}
> +		}
> +	} else {
> +		if (p_param->qp < p_param->min_qp_i) {
> +			dev_err(dev, "qp: %d, min_qp_i: %d\n", p_param->qp, p_param->min_qp_i=
);
> +			return -EINVAL;
> +		}
> +		if (p_param->qp < p_param->min_qp_p) {
> +			dev_err(dev, "qp: %d, min_qp_p: %d\n", p_param->qp, p_param->min_qp_p=
);
> +			return -EINVAL;
> +		}
> +		if (p_param->qp < p_param->min_qp_b) {
> +			dev_err(dev, "qp: %d, min_qp_b: %d\n", p_param->qp, p_param->min_qp_b=
);
> +			return -EINVAL;
> +		}
> +		if (p_param->qp > p_param->max_qp_i) {
> +			dev_err(dev, "qp: %d, max_qp_i: %d\n", p_param->qp, p_param->max_qp_i=
);
> +			return -EINVAL;
> +		}
> +		if (p_param->qp > p_param->max_qp_p) {
> +			dev_err(dev, "qp: %d, max_qp_p: %d\n", p_param->qp, p_param->max_qp_p=
);
> +			return -EINVAL;
> +		}
> +		if (p_param->qp > p_param->max_qp_b) {
> +			dev_err(dev, "qp: %d, max_qp_b: %d\n", p_param->qp, p_param->max_qp_b=
);
> +			return -EINVAL;
> +		}
> +	}

First impression si that all this code is redundant in v4l2, since the cont=
rol
configuration always include this, and otherwise this code should be in a
try_ctrl() function.

> +
> +	return 0;
> +}
> +
> +static int wave6_vpu_enc_check_intra_param(struct vpu_instance *inst,
> +					=C2=A0=C2=A0 int width, int height,
> +					=C2=A0=C2=A0 struct enc_codec_param *p_param)
> +{
> +	struct device *dev =3D inst->dev->dev;
> +	unsigned int ctu_size =3D (inst->std =3D=3D W_AVC_ENC) ? 16 : 64;
> +	unsigned int num_ctu_col =3D (width + ctu_size - 1) / ctu_size;
> +	unsigned int num_ctu_row =3D (height + ctu_size - 1) / ctu_size;
> +
> +	if (p_param->intra_refresh_mode > INTRA_REFRESH_COLUMN) {
> +		dev_err(dev, "intra_refresh_mode: %d\n", p_param->intra_refresh_mode);
> +		return -EINVAL;
> +	}
> +	if (p_param->intra_refresh_mode !=3D INTRA_REFRESH_NONE) {
> +		if (p_param->intra_refresh_arg < 1 || p_param->intra_refresh_arg > 511=
) {
> +			dev_err(dev, "intra_refresh_arg: %d\n", p_param->intra_refresh_arg);
> +			return -EINVAL;
> +		}
> +	}
> +	if (p_param->intra_refresh_mode =3D=3D INTRA_REFRESH_ROW &&
> +	=C2=A0=C2=A0=C2=A0 p_param->intra_refresh_arg > num_ctu_row) {
> +		dev_err(dev, "intra_refresh_mode: %d, intra_refresh_arg: %d\n",
> +			p_param->intra_refresh_mode, p_param->intra_refresh_arg);
> +		return -EINVAL;
> +	}
> +	if (p_param->intra_refresh_mode =3D=3D INTRA_REFRESH_COLUMN &&
> +	=C2=A0=C2=A0=C2=A0 p_param->intra_refresh_arg > num_ctu_col) {
> +		dev_err(dev, "intra_refresh_mode: %d, intra_refresh_arg: %d\n",
> +			p_param->intra_refresh_mode, p_param->intra_refresh_arg);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int wave6_vpu_enc_check_custom_param(struct vpu_instance *inst,
> +					=C2=A0=C2=A0=C2=A0 struct enc_codec_param *p_param)
> +{
> +	struct device *dev =3D inst->dev->dev;
> +	int i;
> +
> +	if (p_param->en_custom_lambda !=3D 1 && p_param->en_custom_lambda !=3D =
0) {
> +		dev_err(dev, "en_custom_lambda: %d\n", p_param->en_custom_lambda);
> +		return -EINVAL;
> +	}
> +	for (i =3D 0; i < MAX_CUSTOM_LAMBDA_NUM; i++) {
> +		if (p_param->lambda_ssd[i] > 16383) {
> +			dev_err(dev, "lambda_ssd[%d]: %d\n", i, p_param->lambda_ssd[i]);
> +			return -EINVAL;
> +		}
> +		if (p_param->lambda_sad[i] > 127) {
> +			dev_err(dev, "lambda_sad[%d]: %d\n", i, p_param->lambda_sad[i]);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int wave6_vpu_enc_check_conf_win_size_param(struct vpu_instance *=
inst,
> +						=C2=A0=C2=A0 int width, int height,
> +						=C2=A0=C2=A0 struct vpu_rect conf_win)
> +{
> +	struct device *dev =3D inst->dev->dev;
> +
> +	if (conf_win.left % 2 || conf_win.top % 2 || conf_win.right % 2 || conf=
_win.bottom % 2) {
> +		dev_err(dev, "conf_win left: %d, top: %d, right: %d, bottom: %d\n",
> +			conf_win.left, conf_win.top, conf_win.right, conf_win.bottom);
> +		return -EINVAL;
> +	}
> +	if (conf_win.left > 8192 || conf_win.top > 8192 ||
> +	=C2=A0=C2=A0=C2=A0 conf_win.right > 8192 || conf_win.bottom > 8192) {
> +		dev_err(dev, "conf_win left: %d, top: %d, right: %d, bottom: %d\n",
> +			conf_win.left, conf_win.top, conf_win.right, conf_win.bottom);
> +		return -EINVAL;
> +	}
> +	if ((conf_win.right + conf_win.left) > width) {
> +		dev_err(dev, "conf_win.left: %d, conf_win.right: %d, width: %d\n",
> +			conf_win.left, conf_win.right, width);
> +		return -EINVAL;
> +	}
> +	if ((conf_win.bottom + conf_win.top) > height) {
> +		dev_err(dev, "conf_win.top: %d, conf_win.bottom: %d, height: %d\n",
> +			conf_win.top, conf_win.bottom, height);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int wave6_vpu_enc_check_temporal_layer_param(struct vpu_instance =
*inst,
> +						=C2=A0=C2=A0=C2=A0 struct enc_codec_param *p_param)
> +{
> +	struct device *dev =3D inst->dev->dev;
> +	int i;
> +
> +	if (p_param->temp_layer_cnt < 1 || p_param->temp_layer_cnt > 4) {
> +		dev_err(dev, "temp_layer_cnt: %d\n", p_param->temp_layer_cnt);
> +		return -EINVAL;
> +	}
> +	if (p_param->temp_layer_cnt > 1) {
> +		if (p_param->gop_preset_idx =3D=3D PRESET_IDX_CUSTOM_GOP ||
> +		=C2=A0=C2=A0=C2=A0 p_param->gop_preset_idx =3D=3D PRESET_IDX_ALL_I) {
> +			dev_err(dev, "temp_layer_cnt: %d, gop_preset_idx: %d\n",
> +				p_param->temp_layer_cnt, p_param->gop_preset_idx);
> +			return -EINVAL;
> +		}
> +	}
> +	for (i =3D 0; i < MAX_NUM_CHANGEABLE_TEMP_LAYER; i++) {
> +		if (p_param->temp_layer[i].change_qp !=3D 1 &&
> +		=C2=A0=C2=A0=C2=A0 p_param->temp_layer[i].change_qp !=3D 0) {
> +			dev_err(dev, "temp_layer[%d].change_qp: %d\n",
> +				i, p_param->temp_layer[i].change_qp);
> +			return -EINVAL;
> +		}
> +		if (p_param->temp_layer[i].qp_b > 51) {
> +			dev_err(dev, "temp_layer[%d].qp_b: %d\n", i, p_param->temp_layer[i].q=
p_b);
> +			return -EINVAL;
> +		}
> +		if (p_param->temp_layer[i].qp_p > 51) {
> +			dev_err(dev, "temp_layer[%d].qp_p: %d\n", i, p_param->temp_layer[i].q=
p_p);
> +			return -EINVAL;
> +		}
> +		if (p_param->temp_layer[i].qp_i > 51) {
> +			dev_err(dev, "temp_layer[%d].qp_i: %d\n", i, p_param->temp_layer[i].q=
p_i);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	return 0;
> +}

[...]

stopping there for now. I feel like we did a big mistake in wave5 by allowi=
ng a
heavy abstraction, its a lot harder to fix and it served no purpose since y=
ou
went for a fresh driver for wave6. I think its proper to ask for a slimmer
interface.

The V4L2 API is the front-end, and where all the validation should take pla=
ce.
The HW interface should simply manage the HW in a readable and non-redundan=
t
way. In V4L2, strides and buffer size are part of the try/s/g_fmt API, so t=
hese
should not be duplicated here and they should clearly use the common code.

I know its painful to ear, but you will be remove 50% of the code, which lo=
ng
term will be a massive win on maintenance.

regards,
Nicolas

--=-2DaQ66HMtUQYkiXhQzyu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaTnPwQAKCRDZQZRRKWBy
9BYMAQClDsdV7m/v6MDKnfsSqvJejwiy/XHdP+NDboAXKLFK9QEA0g+nbBOiHMX5
thhMhFI2QKVFM4pv8JuZY/u/2FJcOwA=
=1xE4
-----END PGP SIGNATURE-----

--=-2DaQ66HMtUQYkiXhQzyu--

