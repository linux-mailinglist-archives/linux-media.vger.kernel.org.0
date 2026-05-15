Return-Path: <linux-media+bounces-61722-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBuWGu0lB2oEsQIAu9opvQ
	(envelope-from <linux-media+bounces-61722-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 15:55:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 703C7550D65
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 15:55:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B0C7030252A7
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 13:51:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B603481AA7;
	Fri, 15 May 2026 13:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="Wky5e/xd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com [209.85.222.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031C23D25C2
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 13:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778853056; cv=none; b=uyGI5UMXZq47UYDAP/Jzxw2ZfZDLsu2azsDQEw1aWTQFHseAfphFsoXEtI6vHIuNcYO3mUZSx4SY/xB9I8KWuTSm+sjWXujm4okx2Za2QrJlO6Q99AUNW9D04E+75PAnQapjBHNs2iAwyu5YHOX/swjxmGBK+PNBKBjC2+f6cB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778853056; c=relaxed/simple;
	bh=v7jg5GcnAOLkSwAfSp+9m2jX2pgzHnuHOm81CwxeLx0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=d0v5+6JUdbvZ/Q57R2JhoBzhrMBQhcD1x12QI9FGwkN0+jHEidQkLF4LxssrapvwOJw27+XIYWLyXcF2WScid9nvlq4ThT/mMmfyms8y/Mo78e1I6SOe/6d5NtWq0UAb/iUlaBfAfqI+KjwU9gfTE48UEgnK70nWeXaTZGzOjKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=Wky5e/xd; arc=none smtp.client-ip=209.85.222.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-ua1-f68.google.com with SMTP id a1e0cc1a2514c-95673f7b5baso2767788241.1
        for <linux-media@vger.kernel.org>; Fri, 15 May 2026 06:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1778853046; x=1779457846; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SWSyMZIJZbyjWphuYfGV9j5CRolEpbpv01omCE1bdVQ=;
        b=Wky5e/xdAQhbp8HKkCZ0XX1MsCMrA/bNWWzJ4JO99RNgJw49QZ+8CwNgFv5y8AEgBL
         mgtm6LjaIe6LhwCRwydTnu9/M9SE9n6NSTP/82xh7Zk617svd2zte1IqtNjXKbo0Hh3e
         qJEilAq/F5HgtdzRpcyBV+eQoTmEq5dHwf5vkp/xjA4eJ8hSWGuN2e9pWtGAe9Zt/jV8
         J+fDVtlrZEhmA62OpZcPRopDsyb9iDu4xIRJyZSV814niAY5wvxFK2ch6mjCkbg/fAiA
         BqoocTYmHK8b+EZwL4cCptsWQsnt1WOtjQEkE+wSISCGrZ1KWMTYqDuk0SMbLbHGlydb
         rfIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778853046; x=1779457846;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SWSyMZIJZbyjWphuYfGV9j5CRolEpbpv01omCE1bdVQ=;
        b=Zrc2RvnvbVQDK9XuZQu79FZRmQr8shncN7MSQZ/WRuAJ1U6a4nR2NfOgbLaQ03UFO3
         2gYrmeHe93vK09nKnS/LdWnovV0thQX3akKP2BhQtSeJP7HS/vAUUoPgh2Q1VDP3DVtF
         zbRiyvj9psjFzC9vQMfA9vzCxHyYjcNK2v/1GrLDCvtrnPZNaXMq/sQWvM8dc1u9zha3
         9vgpk2HW4A078mElsspwOxqThJKb5kDieeBhGR8hWHRLhaOflfclHvicPSACBdep+/L/
         744/tnZSb8mdmhgCsbOoK0kXDzbv/sduCTX7ipysm2aJjElgM8umYqK7/8uNS9LMGdIV
         z3yA==
X-Forwarded-Encrypted: i=1; AFNElJ85HX56PAYP41hHwTcjl/mcjRbCKsaWYLXGAj6RevORqDeRtMoQDdS8Sb9vOlENUoPnZRGenuNCZHXG2g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx942q3sa0Cn6eO/kE4/fbKVl1hZw64yk0ijy8O8hbMiOFhXlOj
	GQgNkE6y+dtoJDNNUmsxuDgMtkzjtzuyaovKkJzCJv6v89m0BtyNqBPzCUsS6/6vI3w=
X-Gm-Gg: Acq92OF5AUpZEWBTl2ZIPvdAxM21yzkELsoHRI2i7TkyQzJvejY8zdOENBAJam3dAta
	tf5Uu2iEPLincqmMioTurs2zplqjY/OxlyspFitTWoVKIgGp8aDPPNbZUnuxnqrgBFM3sij+tZO
	hIokH/FWkllNnJYnYXf4dHyeog1c6/Soy/AUo2RGkxVMAaYL9nql4awqBTkKvUv80/dAypcsX1j
	jho5pCbZOvzPJK3E+iy4mcEo668qTNI/f4BpXiFx7HJTurCHvTw5+W4o0+j8/OIViFy+C3flPnS
	oKKwdpVR3DDOoPP/DtfK0Di1Mlqmd6qS/Y4Fc9GZAM6EDfokOYK2Lp6Ucpku5W1N3wcr3c61mH4
	gpyRE6I+pkgliRRCyeuWZI6gNgC0wazJDsNBf3WrDF23WRgIA+JEGl+QB4OgXcUYcjo0ZM59BSW
	IR7ZAYAbnwotJcI23OmeXqKV1mOq9lMYReSaAMhawULSSIxG3sAI7lNWkWEb57z9Ta5tUb
X-Received: by 2002:a05:6102:f13:b0:639:3b08:d64c with SMTP id ada2fe7eead31-63a3dc48530mr2000631137.13.1778853045599;
        Fri, 15 May 2026 06:50:45 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b:3a7c:76ff:fea1:2ac0? ([2606:6d00:15:e06b:3a7c:76ff:fea1:2ac0])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95fc2d07a31sm978934241.5.2026.05.15.06.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 06:50:44 -0700 (PDT)
Message-ID: <deffd254819be55fc71623137cf2e6bce09146de.camel@ndufresne.ca>
Subject: Re: [PATCH 2/3] qcom: media: jpeg: Add Qualcomm JPEG V4L2 encoder
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Atanas Filipov
	 <atanas.filipov@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kapatrala Syed	
 <akapatra@quicinc.com>, Hariram Purushothaman <hariramp@quicinc.com>, Bjorn
 Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Gjorgji Rosikopulos	 <grosikop@quicinc.com>, afilipov@quicinc.com,
 linux-media@vger.kernel.org, 	linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Fri, 15 May 2026 09:50:42 -0400
In-Reply-To: <l63scukg3xa4qgarvqaagp3kvn67pg4tdhdpvjio5mmybdgcfo@pjaib4tdxkwd>
References: <20260515-qcom-jpeg-v4l2-v1-0-f38c2e1b3555@oss.qualcomm.com>
	 <20260515-qcom-jpeg-v4l2-v1-2-f38c2e1b3555@oss.qualcomm.com>
	 <l63scukg3xa4qgarvqaagp3kvn67pg4tdhdpvjio5mmybdgcfo@pjaib4tdxkwd>
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
	protocol="application/pgp-signature"; boundary="=-LcsaRh3+7HVfX4MShkkH"
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 703C7550D65
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.66 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61722-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ndufresne-ca.20251104.gappssmtp.com:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ndufresne-ca.20251104.gappssmtp.com:dkim,ndufresne.ca:mid,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action


--=-LcsaRh3+7HVfX4MShkkH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 15 mai 2026 =C3=A0 16:28 +0300, Dmitry Baryshkov a =C3=A9crit=
=C2=A0:
> On Fri, May 15, 2026 at 02:47:00PM +0300, Atanas Filipov wrote:
> > Implementation of a V4L2 JPEG encoder device driver supporting
> > Qualcomm SC7180, SM8250, SM7280, and SM8550 chipsets.
> >=20
> > Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> > ---
> > =C2=A0drivers/media/platform/qcom/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=
=C2=A0 1 +
> > =C2=A0drivers/media/platform/qcom/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0 1 +
> > =C2=A0drivers/media/platform/qcom/jpeg/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 17 +
> > =C2=A0drivers/media/platform/qcom/jpeg/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 9 +
> > =C2=A0drivers/media/platform/qcom/jpeg/qcom_jenc_defs.h=C2=A0 |=C2=A0 2=
53 ++++
> > =C2=A0drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c=C2=A0=C2=A0 |=C2=
=A0 370 +++++
> > =C2=A0drivers/media/platform/qcom/jpeg/qcom_jenc_dev.h=C2=A0=C2=A0 |=C2=
=A0 111 ++
> > =C2=A0drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.c=C2=A0=C2=A0 |=C2=
=A0 388 +++++
> > =C2=A0drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.h=C2=A0=C2=A0 |=C2=
=A0 130 ++
> > =C2=A0drivers/media/platform/qcom/jpeg/qcom_jenc_ops.c=C2=A0=C2=A0 | 15=
22 ++++++++++++++++++++
> > =C2=A0drivers/media/platform/qcom/jpeg/qcom_jenc_ops.h=C2=A0=C2=A0 |=C2=
=A0=C2=A0 49 +
> > =C2=A0drivers/media/platform/qcom/jpeg/qcom_jenc_res.c=C2=A0=C2=A0 |=C2=
=A0 268 ++++
> > =C2=A0drivers/media/platform/qcom/jpeg/qcom_jenc_res.h=C2=A0=C2=A0 |=C2=
=A0=C2=A0 70 +
> > =C2=A0drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.c=C2=A0 | 1082 ++=
++++++++++++
> > =C2=A0drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.h=C2=A0 |=C2=A0=
=C2=A0 27 +
> > =C2=A0.../platform/qcom/jpeg/qcom_v165_jenc_hw_info.h=C2=A0=C2=A0=C2=A0=
 |=C2=A0 509 +++++++
> > =C2=A0.../platform/qcom/jpeg/qcom_v580_jenc_hw_info.h=C2=A0=C2=A0=C2=A0=
 |=C2=A0 509 +++++++
> > =C2=A0.../platform/qcom/jpeg/qcom_v680_jenc_hw_info.h=C2=A0=C2=A0=C2=A0=
 |=C2=A0 509 +++++++
> > =C2=A0.../platform/qcom/jpeg/qcom_v780_jenc_hw_info.h=C2=A0=C2=A0=C2=A0=
 |=C2=A0 509 +++++++
> > =C2=A019 files changed, 6334 insertions(+)
> >=20
> > diff --git a/drivers/media/platform/qcom/Kconfig b/drivers/media/platfo=
rm/qcom/Kconfig
> > index 4f4d3a68e6e5..f33d53a754a0 100644
> > --- a/drivers/media/platform/qcom/Kconfig
> > +++ b/drivers/media/platform/qcom/Kconfig
> > @@ -5,3 +5,4 @@ comment "Qualcomm media platform drivers"
> > =C2=A0source "drivers/media/platform/qcom/camss/Kconfig"
> > =C2=A0source "drivers/media/platform/qcom/iris/Kconfig"
> > =C2=A0source "drivers/media/platform/qcom/venus/Kconfig"
> > +source "drivers/media/platform/qcom/jpeg/Kconfig"
> > diff --git a/drivers/media/platform/qcom/Makefile b/drivers/media/platf=
orm/qcom/Makefile
> > index ea2221a202c0..30c94949e9de 100644
> > --- a/drivers/media/platform/qcom/Makefile
> > +++ b/drivers/media/platform/qcom/Makefile
> > @@ -2,3 +2,4 @@
> > =C2=A0obj-y +=3D camss/
> > =C2=A0obj-y +=3D iris/
> > =C2=A0obj-y +=3D venus/
> > +obj-y +=3D jpeg/
> > diff --git a/drivers/media/platform/qcom/jpeg/Kconfig b/drivers/media/p=
latform/qcom/jpeg/Kconfig
> > new file mode 100644
> > index 000000000000..51846aeafaf3
> > --- /dev/null
> > +++ b/drivers/media/platform/qcom/jpeg/Kconfig
> > @@ -0,0 +1,17 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +config VIDEO_QCOM_JENC
> > +	tristate "Qualcomm V4L2 JPEG Encoder driver"
> > +	depends on V4L_MEM2MEM_DRIVERS
> > +	depends on (ARCH_QCOM && IOMMU_DMA) || COMPILE_TEST
> > +	depends on VIDEO_DEV
> > +	select VIDEO_V4L2_SUBDEV_API
> > +	select VIDEOBUF2_DMA_SG
> > +	select V4L2_MEM2MEM_DEV
> > +	help
> > +	=C2=A0 Qualcomm JPEG memory-to-memory V4L2 encoder driver.
> > +
> > +	=C2=A0 Provides:
> > +	=C2=A0=C2=A0=C2=A0 - qcom-jenc (encode)
> > +
> > +	=C2=A0 To compile this driver as a module, choose M here: the
> > +	=C2=A0 module will be called qcom-jenc
> > diff --git a/drivers/media/platform/qcom/jpeg/Makefile b/drivers/media/=
platform/qcom/jpeg/Makefile
> > new file mode 100644
> > index 000000000000..310f6c3c1f19
> > --- /dev/null
> > +++ b/drivers/media/platform/qcom/jpeg/Makefile
> > @@ -0,0 +1,9 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +obj-$(CONFIG_VIDEO_QCOM_JENC) +=3D qcom-jenc.o
> > +
> > +qcom-jenc-objs +=3D \
> > +	qcom_jenc_dev.o \
> > +	qcom_jenc_v4l2.o \
> > +	qcom_jenc_ops.o \
> > +	qcom_jenc_res.o \
> > +	qcom_jenc_hdr.o
> > diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_defs.h b/driver=
s/media/platform/qcom/jpeg/qcom_jenc_defs.h
> > new file mode 100644
> > index 000000000000..40e46820c546
> > --- /dev/null
> > +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_defs.h
> > @@ -0,0 +1,253 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +
> > +#ifndef QCOM_JENC_DEFS_H_
> > +#define QCOM_JENC_DEFS_H_
> > +
> > +#include <linux/types.h>
> > +#include <linux/io.h>
> > +#include <linux/bitfield.h>
> > +#include <linux/videodev2.h>
> > +#include <media/videobuf2-core.h>
>=20
> Keep the list sorted
>=20
> > +
> > +/* Offline JPEG encoder constraints */
> > +#define QCOM_JPEG_HW_MAX_WIDTH	9248
> > +#define QCOM_JPEG_HW_MAX_HEIGHT	8192
> > +#define QCOM_JPEG_HW_MIN_WIDTH	128
> > +#define QCOM_JPEG_HW_MIN_HEIGHT	96
> > +
> > +#define QCOM_JPEG_HW_DEF_HSTEP	16
> > +#define QCOM_JPEG_HW_DEF_VSTEP	16
> > +
> > +#define QCOM_JPEG_HW_DEF_WIDTH	1920
> > +#define QCOM_JPEG_HW_DEF_HEIGHT	1080
> > +
> > +#define QCOM_JPEG_MAX_PLANES	3
> > +
> > +#define QCOM_JPEG_QUALITY_MIN	1
> > +#define QCOM_JPEG_QUALITY_DEF	95
> > +#define QCOM_JPEG_QUALITY_MAX	100
> > +#define QCOM_JPEG_QUALITY_MID	(QCOM_JPEG_QUALITY_MAX / 2)
> > +#define QCOM_JPEG_QUALITY_UNT	1
> > +
> > +enum qcom_jpeg_soc_id {
> > +	QCOM_V165_SOC_ID =3D 0,
> > +	QCOM_V580_SOC_ID,
> > +	QCOM_V680_SOC_ID,
> > +	QCOM_V780_SOC_ID,
> > +	QCOM_UNKNOWN_SOC_ID,
> > +};
> > +
> > +enum qcom_soc_perf_level {
> > +	QCOM_SOC_PERF_SUSPEND =3D 0,
>=20
> These should be a part of the OPP tables in DT.
>=20
> > +	QCOM_SOC_PERF_LOWSVS,
> > +	QCOM_SOC_PERF_SVS,
> > +	QCOM_SOC_PERF_SVS_L1,
> > +	QCOM_SOC_PERF_NOMINAL,
> > +	QCOM_SOC_PERF_TURBO,
> > +	QCOM_SOC_PERF_LEVEL_MAX,
> > +};
> > +
> > +enum qcom_jpeg_mask_id {
> > +	JMSK_HW_VER_STEP,
> > +	JMSK_HW_VER_MINOR,
> > +	JMSK_HW_VER_MAJOR,
> > +
> > +	JMSK_HW_CAP_ENCODE,
> > +	JMSK_HW_CAP_DECODE,
> > +	JMSK_HW_CAP_UPSCALE,
> > +	JMSK_HW_CAP_DOWNSCALE,
> > +
> > +	JMSK_RST_CMD_COMMON,
> > +	JMSK_RST_CMD_FE_RESET,
> > +	JMSK_RST_CMD_WE_RESET,
> > +	JMSK_RST_CMD_ENCODER_RESET,
> > +	JMSK_RST_CMD_DECODER_RESET,
> > +	JMSK_RST_CMD_BLOCK_FORMATTER_RST,
> > +	JMSK_RST_CMD_SCALE_RESET,
> > +	JMSK_RST_CMD_REGISTER_RESET,
> > +	JMSK_RST_CMD_MISR_RESET,
> > +	JMSK_RST_CMD_CORE_RESET,
> > +	JMSK_RST_CMD_JMSK_DOMAIN_RESET,
> > +	JMSK_RST_CMD_RESET_BYPASS,
> > +
> > +	JMSK_CMD_HW_START,
> > +	JMSK_CMD_HW_STOP,
> > +	JMSK_CMD_CLR_RD_PLNS_QUEUE,
> > +	JMSK_CMD_CLR_WR_PLNS_QUEUE,
> > +	JMSK_CMD_APPLY_SWC_RD_PARAMS,
> > +
> > +	JMSK_CORE_CFG_FE_ENABLE,
> > +	JMSK_CORE_CFG_WE_ENABLE,
> > +	JMSK_CORE_CFG_ENC_ENABLE,
> > +	JMSK_CORE_CFG_SCALE_ENABLE,
> > +	JMSK_CORE_CFG_TESTBUS_ENABLE,
> > +	JMSK_CORE_CFG_MODE,
> > +	JMSK_CORE_CFG_CGC_DISABLE,
> > +
> > +	JMSK_CORE_STATUS_ENCODE_STATE,
> > +	JMSK_CORE_STATUS_SCALE_STATE,
> > +	JMSK_CORE_STATUS_RT_STATE,
> > +	JMSK_CORE_STATUS_BUS_STATE,
> > +	JMSK_CORE_STATUS_CGC_STATE,
> > +
> > +	JMSK_IRQ_ENABLE_ALL,
> > +	JMSK_IRQ_DISABLE_ALL,
> > +	JMSK_IRQ_CLEAR_ALL,
> > +
> > +	JMSK_IRQ_STATUS_SESSION_DONE,
> > +	JMSK_IRQ_STATUS_RD_BUF_PLN0_DONE,
> > +	JMSK_IRQ_STATUS_RD_BUF_PLN1_DONE,
> > +	JMSK_IRQ_STATUS_RD_BUF_PLN2_DONE,
> > +	JMSK_IRQ_STATUS_RD_BUF_PLNS_ATTN,
> > +	JMSK_IRQ_STATUS_WR_BUF_PLN0_DONE,
> > +	JMSK_IRQ_STATUS_WR_BUF_PLN1_DONE,
> > +	JMSK_IRQ_STATUS_WR_BUF_PLN2_DONE,
> > +	JMSK_IRQ_STATUS_WR_BUF_PLNS_ATTN,
> > +	JMSK_IRQ_STATUS_SESSION_ERROR,
> > +	JMSK_IRQ_STATUS_STOP_ACK,
> > +	JMSK_IRQ_STATUS_RESET_ACK,
> > +
> > +	JMSK_FE_CFG_BYTE_ORDERING,
> > +	JMSK_FE_CFG_BURST_LENGTH_MAX,
> > +	JMSK_FE_CFG_MEMORY_FORMAT,
> > +	JMSK_FE_CFG_CBCR_ORDER,
> > +	JMSK_FE_CFG_BOTTOM_VPAD_EN,
> > +	JMSK_FE_CFG_PLN0_EN,
> > +	JMSK_FE_CFG_PLN1_EN,
> > +	JMSK_FE_CFG_PLN2_EN,
> > +	JMSK_FE_CFG_SIXTEEN_MCU_EN,
> > +	JMSK_FE_CFG_MCUS_PER_BLOCK,
> > +	JMSK_FE_CFG_MAL_BOUNDARY,
> > +	JMSK_FE_CFG_MAL_EN,
> > +
> > +	JMSK_FE_VBPAD_CFG_BLOCK_ROW,
> > +
> > +	JMSK_PLNS_RD_OFFSET,
> > +	JMSK_PLNS_RD_BUF_SIZE_WIDTH,
> > +	JMSK_PLNS_RD_BUF_SIZE_HEIGHT,
> > +	JMSK_PLNS_RD_STRIDE,
> > +	JMSK_PLNS_RD_HINIT,
> > +	JMSK_PLNS_RD_VINIT,
> > +
> > +	JMSK_WE_CFG_BYTE_ORDERING,
> > +	JMSK_WE_CFG_BURST_LENGTH_MAX,
> > +	JMSK_WE_CFG_MEMORY_FORMAT,
> > +	JMSK_WE_CFG_CBCR_ORDER,
> > +	JMSK_WE_CFG_PLN0_EN,
> > +	JMSK_WE_CFG_PLN1_EN,
> > +	JMSK_WE_CFG_PLN2_EN,
> > +	JMSK_WE_CFG_MAL_BOUNDARY,
> > +	JMSK_WE_CFG_MAL_EN,
> > +	JMSK_WE_CFG_POP_BUFF_ON_EOS,
> > +
> > +	JMSK_PLNS_WR_BUF_SIZE_WIDTH,
> > +	JMSK_PLNS_WR_BUF_SIZE_HEIGHT,
> > +
> > +	JMSK_PLNS_WR_STRIDE,
> > +	JMSK_PLNS_WR_HINIT,
> > +	JMSK_PLNS_WR_VINIT,
> > +	JMSK_PLNS_WR_HSTEP,
> > +	JMSK_PLNS_WR_VSTEP,
> > +	JMSK_PLNS_WR_BLOCK_CFG_PER_COL,
> > +	JMSK_PLNS_WR_BLOCK_CFG_PER_RAW,
> > +
> > +	JMSK_ENC_CFG_IMAGE_FORMAT,
> > +	JMSK_ENC_CFG_APPLY_EOI,
> > +	JMSK_ENC_CFG_HUFFMAN_SEL,
> > +	JMSK_ENC_CFG_FSC_ENABLE,
> > +	JMSK_ENC_CFG_OUTPUT_DISABLE,
> > +	JMSK_ENC_CFG_RST_MARKER_PERIOD,
> > +	JMSK_ENC_IMAGE_SIZE_WIDTH,
> > +	JMSK_ENC_IMAGE_SIZE_HEIGHT,
> > +
> > +	JMSK_SCALE_CFG_HSCALE_ENABLE,
> > +	JMSK_SCALE_CFG_VSCALE_ENABLE,
> > +	JMSK_SCALE_CFG_UPSAMPLE_EN,
> > +	JMSK_SCALE_CFG_SUBSAMPLE_EN,
> > +	JMSK_SCALE_CFG_HSCALE_ALGO,
> > +	JMSK_SCALE_CFG_VSCALE_ALGO,
> > +	JMSK_SCALE_CFG_H_SCALE_FIR_ALGO,
> > +	JMSK_SCALE_CFG_V_SCALE_FIR_ALGO,
> > +
> > +	JMSK_SCALE_PLNS_OUT_CFG_BLK_WIDTH,
> > +	JMSK_SCALE_PLNS_OUT_CFG_BLK_HEIGHT,
> > +
> > +	JMSK_SCALE_PLNS_HSTEP_FRACTIONAL,
> > +	JMSK_SCALE_PLNS_HSTEP_INTEGER,
> > +	JMSK_SCALE_PLNS_VSTEP_FRACTIONAL,
> > +	JMSK_SCALE_PLNS_VSTEP_INTEGER,
> > +
> > +	JMSK_DMI_CFG,
> > +	JMSK_DMI_ADDR,
> > +	JMSK_DMI_DATA,
> > +
> > +	JMSK_TESTBUS_CFG,
> > +	JMSK_FE_VBPAD_CFG,
> > +
> > +	JMSK_PLN0_RD_HINIT_INT,
> > +	JMSK_PLN1_RD_HINIT_INT,
> > +	JMSK_PLN2_RD_HINIT_INT,
> > +	JMSK_PLN0_RD_VINIT_INT,
> > +	JMSK_PLN1_RD_VINIT_INT,
> > +	JMSK_PLN2_RD_VINIT_INT,
> > +	JMSK_ID_MAX
> > +};
> > +
> > +struct qcom_jpeg_reg_offs {
> > +	u32 hw_version;
> > +	u32 hw_capability;
> > +	u32 reset_cmd;
> > +	u32 core_cfg;
> > +	u32 int_mask;
> > +	u32 int_clr;
> > +	u32 int_status;
> > +	u32 hw_cmd;
> > +	u32 enc_core_state;
> > +
> > +	struct {
> > +		u32 pntr[QCOM_JPEG_MAX_PLANES];
> > +		u32 offs[QCOM_JPEG_MAX_PLANES];
> > +		u32 cnsmd[QCOM_JPEG_MAX_PLANES];
> > +		u32 bsize[QCOM_JPEG_MAX_PLANES];
> > +		u32 stride[QCOM_JPEG_MAX_PLANES];
> > +		u32 hinit[QCOM_JPEG_MAX_PLANES];
> > +		u32 vinit[QCOM_JPEG_MAX_PLANES];
> > +		u32 pntr_cnt;
> > +		u32 vbpad_cfg;
> > +	} fe;
> > +	u32 fe_cfg;
> > +
> > +	struct {
> > +		u32 pntr[QCOM_JPEG_MAX_PLANES];
> > +		u32 cnsmd[QCOM_JPEG_MAX_PLANES];
> > +		u32 bsize[QCOM_JPEG_MAX_PLANES];
> > +		u32 stride[QCOM_JPEG_MAX_PLANES];
> > +		u32 hinit[QCOM_JPEG_MAX_PLANES];
> > +		u32 hstep[QCOM_JPEG_MAX_PLANES];
> > +		u32 vinit[QCOM_JPEG_MAX_PLANES];
> > +		u32 vstep[QCOM_JPEG_MAX_PLANES];
> > +		u32 blocks[QCOM_JPEG_MAX_PLANES];
> > +		u32 pntr_cnt;
> > +	} we;
> > +	u32 we_cfg;
> > +
> > +	struct {
> > +		u32 hstep[QCOM_JPEG_MAX_PLANES];
> > +		u32 vstep[QCOM_JPEG_MAX_PLANES];
> > +	} scale;
> > +	u32 scale_cfg;
> > +	u32 scale_out_cfg[QCOM_JPEG_MAX_PLANES];
> > +
> > +	u32 enc_cfg;
> > +	u32 enc_img_size;
> > +	u32 enc_out_size;
> > +
> > +	u32 dmi_cfg;
> > +	u32 dmi_data;
> > +	u32 dmi_addr;
> > +} __packed;
> > +
> > +#endif /* QCOM_JENC_DEFS_H_ */
> > diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c b/drivers=
/media/platform/qcom/jpeg/qcom_jenc_dev.c
> > new file mode 100644
> > index 000000000000..4ef6bf9fd48d
> > --- /dev/null
> > +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c
> > @@ -0,0 +1,370 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/module.h>
> > +#include <linux/of_device.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/slab.h>
> > +
> > +#include <media/v4l2-mem2mem.h>
> > +
> > +#include "qcom_jenc_dev.h"
> > +
> > +#include "qcom_jenc_defs.h"
> > +#include "qcom_jenc_ops.h"
> > +#include "qcom_jenc_res.h"
> > +#include "qcom_jenc_v4l2.h"
> > +
> > +static int qcom_jpeg_match_data(struct qcom_jenc_dev *jenc)
> > +{
> > +	struct device *dev =3D jenc->dev;
> > +	const struct qcom_dev_resources *res;
> > +
> > +	res =3D device_get_match_data(dev);
> > +	if (!res)
> > +		return dev_err_probe(dev, -ENODEV, "unsupported SoC\n");
> > +
> > +	jenc->res =3D res;
> > +
> > +	return 0;
>=20
> Useless wrapper, inline it.
>=20
> > +}
> > +
> > +static int qcom_jpeg_clk_init(struct qcom_jenc_dev *jenc)
> > +{
> > +	const struct qcom_dev_resources *res =3D jenc->res;
> > +	int c_idx;
> > +
> > +	jenc->clks =3D devm_kcalloc(jenc->dev, ARRAY_SIZE(res->clk_names), si=
zeof(*jenc->clks),
> > +				=C2=A0 GFP_KERNEL);
> > +	if (!jenc->clks)
> > +		return -ENOMEM;
> > +
> > +	for (c_idx =3D 0; c_idx < ARRAY_SIZE(res->clk_names); c_idx++) {
> > +		if (!res->clk_names[c_idx])
> > +			break;
> > +
> > +		jenc->clks[c_idx].clk =3D devm_clk_get(jenc->dev, res->clk_names[c_i=
dx]);
> > +		if (IS_ERR(jenc->clks[c_idx].clk)) {
> > +			return dev_err_probe(jenc->dev, PTR_ERR(jenc->clks[c_idx].clk),
> > +					=C2=A0=C2=A0=C2=A0=C2=A0 "failed to get clock %s\n", res->clk_nam=
es[c_idx]);
> > +		}
> > +
> > +		jenc->clks[c_idx].id =3D res->clk_names[c_idx];
> > +		jenc->num_clks++;
> > +	}
> > +
>=20
> Use bulk clock API instead of manually implementing those.
>=20
> > +	return 0;
> > +}
> > +
> > +static int qcom_jpeg_clk_rate(struct qcom_jenc_dev *jenc, enum qcom_so=
c_perf_level level)
> > +{
> > +	const struct qcom_dev_resources	*res =3D jenc->res;
> > +	const struct qcom_perf_resource	*perf =3D &res->perf_cfg[level];
> > +	int c_idx;
> > +	int rc =3D 0;
> > +
> > +	for (c_idx =3D 0; c_idx < jenc->num_clks; c_idx++) {
> > +		/* skip clocks with fixed or default frequency */
> > +		if (!perf->clk_rate[c_idx])
> > +			continue;
> > +
> > +		/* setup frequency according to performance level */
> > +		rc =3D clk_set_rate(jenc->clks[c_idx].clk, perf->clk_rate[c_idx]);
> > +		if (rc < 0) {
> > +			dev_err(jenc->dev, "clock set rate failed: %d\n", rc);
> > +			return rc;
> > +		}
> > +
> > +		dev_dbg(jenc->dev, "clock %s current rate: %ld\n",
> > +			jenc->clks[c_idx].id, clk_get_rate(jenc->clks[c_idx].clk));
>=20
> People have invented OPP tables. Please use those instead.
>=20
> > +	}
> > +
> > +	return rc;
> > +}
> > +
>=20
> [...]
>=20
> > +
> > +static int qcom_jpeg_probe(struct platform_device *pdev)
> > +{
> > +	struct qcom_jenc_dev *jenc;
> > +	int rc;
> > +
> > +	jenc =3D devm_kzalloc(&pdev->dev, sizeof(*jenc), GFP_KERNEL);
> > +	if (!jenc)
> > +		return -ENOMEM;
> > +
> > +	jenc->dev =3D &pdev->dev;
> > +	mutex_init(&jenc->dev_mutex);
> > +	spin_lock_init(&jenc->hw_lock);
> > +	init_completion(&jenc->reset_complete);
> > +	init_completion(&jenc->stop_complete);
> > +
> > +	rc =3D qcom_jpeg_match_data(jenc);
> > +	if (rc)
> > +		return dev_err_probe(jenc->dev, rc, "failed to attach hardware\n");
> > +
> > +	if (!jenc->res->hw_offs || !jenc->res->hw_ops)
> > +		return dev_err_probe(jenc->dev, -EINVAL, "missing hw resources\n");
> > +
> > +	rc =3D dma_set_mask_and_coherent(jenc->dev, DMA_BIT_MASK(32));
> > +	if (rc)
> > +		return dev_err_probe(jenc->dev, rc, "failed to set DMA mask\n");
> > +
> > +	platform_set_drvdata(pdev, jenc);
> > +
> > +	jenc->jpeg_base =3D devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(jenc->jpeg_base)) {
> > +		rc =3D PTR_ERR(jenc->jpeg_base);
> > +		return dev_err_probe(jenc->dev, rc, "failed to map JPEG resource\n")=
;
> > +	}
> > +
> > +	jenc->cpas_base =3D devm_platform_ioremap_resource(pdev, 1);
> > +	if (IS_ERR(jenc->cpas_base)) {
> > +		rc =3D PTR_ERR(jenc->cpas_base);
> > +		return dev_err_probe(jenc->dev, rc, "failed to map CPAS resource\n")=
;
> > +	}
> > +
> > +	rc =3D qcom_jpeg_clk_init(jenc);
> > +	if (rc)
> > +		return dev_err_probe(jenc->dev, rc, "failed to init bulk clocks\n");
> > +
> > +	jenc->irq =3D platform_get_irq(pdev, 0);
> > +	if (jenc->irq < 0)
> > +		return dev_err_probe(jenc->dev, jenc->irq, "failed to get IRQ\n");
> > +
> > +	rc =3D devm_request_threaded_irq(jenc->dev, jenc->irq,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 jenc->res->hw_ops->hw_irq_top=
,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 jenc->res->hw_ops->hw_irq_bot=
,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 IRQF_ONESHOT, dev_name(jenc->=
dev), jenc);
> > +	if (rc)
> > +		return dev_err_probe(jenc->dev, rc, "failed to request IRQ\n");
> > +
> > +	rc =3D qcom_jpeg_icc_init(jenc);
> > +	if (rc)
> > +		return dev_err_probe(jenc->dev, rc, "failed to get ICC resources\n")=
;
> > +
> > +	rc =3D kfifo_alloc(&jenc->kfifo_inst, sizeof(jenc->enc_status) * VB2_=
MAX_FRAME, GFP_KERNEL);
> > +	if (rc) {
> > +		dev_err(jenc->dev, "failed to allocate kfifo\n");
> > +		return rc;
> > +	}
> > +
> > +	spin_lock_init(&jenc->kfifo_lock);
> > +
> > +	rc =3D v4l2_device_register(jenc->dev, &jenc->v4l2_dev);
> > +	if (rc) {
> > +		dev_err(jenc->dev, "failed to register V4L2 device\n");
> > +		goto err_kfifo_free;
> > +	}
> > +
> > +	rc =3D qcom_jpeg_v4l2_register(jenc);
> > +	if (rc) {
> > +		dev_err(jenc->dev, "failed to register video device\n");
> > +		goto err_v4l2_device_unregister;
> > +	}
> > +
> > +	jenc->perf =3D QCOM_SOC_PERF_NOMINAL;
> > +
> > +	pm_runtime_enable(jenc->dev);
>=20
> devm_pm_runtime_enable()
>=20
> > +
> > +	dev_info(jenc->dev, "Qualcomm JPEG encoder registered\n");
> > +
> > +	return 0;
> > +
> > +err_v4l2_device_unregister:
> > +	v4l2_device_unregister(&jenc->v4l2_dev);
> > +err_kfifo_free:
> > +	kfifo_free(&jenc->kfifo_inst);
> > +
> > +	return rc;
> > +}
> > +
> > +static void qcom_jpeg_remove(struct platform_device *pdev)
> > +{
> > +	struct qcom_jenc_dev *jenc =3D platform_get_drvdata(pdev);
> > +
> > +	pm_runtime_disable(&pdev->dev);
> > +
> > +	qcom_jpeg_v4l2_unregister(jenc);
> > +
> > +	v4l2_device_unregister(&jenc->v4l2_dev);
> > +
> > +	kfifo_free(&jenc->kfifo_inst);
> > +
> > +	dev_info(jenc->dev, "Qualcomm JPEG encoder deregistered\n");
>=20
> Don't spam the logs with useless info.
>=20
> > +}
> > +
> > +static const struct of_device_id qcom_jpeg_of_match[] =3D {
> > +	{
> > +		.compatible	=3D "qcom,sc7180-jenc",
> > +		.data		=3D &qcom_jpeg_v165_drvdata
> > +	},
> > +	{
> > +		.compatible	=3D "qcom,sm8250-jenc",
> > +		.data		=3D &qcom_jpeg_v580_drvdata
> > +	},
> > +	{
> > +		.compatible	=3D "qcom,sm7325-jenc",
> > +		.data		=3D &qcom_jpeg_v580_drvdata
>=20
> Don't regisger multiple entries for compatible devices. Use fallback
> compats instead.
>=20
> > +	},
> > +	{
> > +		.compatible	=3D "qcom,sc7280-jenc",
> > +		.data		=3D &qcom_jpeg_v680_drvdata
> > +	},
> > +	{
> > +		.compatible	=3D "qcom,qcm6490-jenc",
> > +		.data		=3D &qcom_jpeg_v680_drvdata
> > +	},
> > +	{
> > +		.compatible	=3D "qcom,sm8550-jenc",
> > +		.data		=3D &qcom_jpeg_v780_drvdata
> > +	},
> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(of, qcom_jpeg_of_match);
> > +
> > +static struct platform_driver qcom_jpeg_platform_driver =3D {
> > +	.probe=C2=A0 =3D qcom_jpeg_probe,
> > +	.remove =3D qcom_jpeg_remove,
> > +	.driver =3D {
> > +		.name =3D QCOM_JPEG_ENC_NAME,
> > +		.of_match_table =3D qcom_jpeg_of_match,
> > +		.pm=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 =3D &qcom_jpeg_pm_ops,
> > +	},
> > +};
> > +
> > +module_platform_driver(qcom_jpeg_platform_driver);
> > +
> > +MODULE_DESCRIPTION("QCOM JPEG mem2mem V4L2 encoder");
> > +MODULE_LICENSE("GPL");
>=20
> [...]
>=20
> > +
> > +int qcom_jenc_header_init(struct qcom_jenc_header *c, u32 fourcc)
> > +{
> > +	int rc;
> > +	struct jpeg_header_buf b =3D {
> > +		.ptr =3D c->data,
> > +		.size =3D sizeof(c->data),
> > +		.pos =3D 0,
> > +	};
> > +
> > +	c->sof_offset	=3D 0;
> > +	c->dqt_one_offs =3D 0;
> > +	c->dqt_two_offs =3D 0;
> > +
> > +	rc =3D jb_put_mem(&b, &soi_app0, sizeof(soi_app0));
> > +	if (rc)
> > +		return rc;
> > +
> > +	if (fourcc !=3D V4L2_PIX_FMT_GREY) {
> > +		rc =3D jb_put_mem(&b, &dqt_chroma_hdr, sizeof(dqt_chroma_hdr));
> > +		if (rc)
> > +			return rc;
> > +
> > +		/* Store the offset of the first DQT table for later use. */
> > +		c->dqt_one_offs =3D b.pos;
> > +		rc =3D jb_put_mem(&b, &dqt_luma_data, sizeof(dqt_luma_data));
> > +		if (rc)
> > +			return rc;
> > +
> > +		/* Store the offset of the second DQT table for later use. */
> > +		c->dqt_two_offs =3D b.pos;
> > +		rc =3D jb_put_mem(&b, &dqt_chroma_data, sizeof(dqt_chroma_data));
> > +		if (rc)
> > +			return rc;
> > +	} else {
> > +		rc =3D jb_put_mem(&b, &dqt_luma_hdr, sizeof(dqt_luma_hdr));
> > +		if (rc)
> > +			return rc;
> > +
> > +		/* Store the offset of the first DQT table for later use. */
> > +		c->dqt_one_offs =3D b.pos;
> > +		rc =3D jb_put_mem(&b, &dqt_luma_data, sizeof(dqt_luma_data));
> > +		if (rc)
> > +			return rc;
> > +	}
>=20
> Do we absolutely need to do this in the kernel? Can we have defer that
> to the userspace using V4L2 encoders? Are there any other JPEG encoders
> handling JPEG headers in the kernel code?

Yes, see drivers/media/platform/verisilicon/hantro_jpeg.c (though its using
shortcuts compare to this. In any case, make an implementation for v4l2-jpe=
g,
then use it, and port hantro to show it is portable.

Stop using your own structure to represent a jpeg headers, v4l2-jpeg alread=
y
have that.

cheers,
Nicolas

>=20
> > +
> > +	/* Store the offset of the SOF record for later use. */
> > +	c->sof_offset =3D b.pos;
> > +
> > +	if (fourcc !=3D V4L2_PIX_FMT_GREY) {
> > +		rc =3D jb_put_mem(&b, &sof0_color_hdr, sizeof(sof0_color_hdr));
> > +		if (rc)
> > +			return rc;
> > +		rc =3D jb_put_mem(&b, &sof0_color_data, sizeof(sof0_color_data));
> > +		if (rc)
> > +			return rc;
> > +		rc =3D jb_put_mem(&b, &coeff_color_hdr, sizeof(coeff_color_hdr));
> > +		if (rc)
> > +			return rc;
> > +		rc =3D jb_put_mem(&b, &luma_dc_coeff, sizeof(luma_dc_coeff));
> > +		if (rc)
> > +			return rc;
> > +		rc =3D jb_put_mem(&b, &luma_ac_coeff, sizeof(luma_ac_coeff));
> > +		if (rc)
> > +			return rc;
> > +		rc =3D jb_put_mem(&b, &chroma_dc_coeff, sizeof(chroma_dc_coeff));
> > +		if (rc)
> > +			return rc;
> > +		rc =3D jb_put_mem(&b, &chroma_ac_coeff, sizeof(chroma_ac_coeff));
> > +		if (rc)
> > +			return rc;
> > +		rc =3D jb_put_mem(&b, &sos_color_hdr, sizeof(sos_color_hdr));
> > +		if (rc)
> > +			return rc;
> > +		rc =3D jb_put_mem(&b, &sos_color_data, sizeof(sos_color_data));
> > +		if (rc)
> > +			return rc;
> > +	} else {
> > +		rc =3D jb_put_mem(&b, &sof0_mono_hdr, sizeof(sof0_mono_hdr));
> > +		if (rc)
> > +			return rc;
> > +		rc =3D jb_put_mem(&b, &sof0_mono_data, sizeof(sof0_mono_data));
> > +		if (rc)
> > +			return rc;
> > +		rc =3D jb_put_mem(&b, &coeff_mono_hdr, sizeof(coeff_mono_hdr));
> > +		if (rc)
> > +			return rc;
> > +		rc =3D jb_put_mem(&b, &luma_dc_coeff, sizeof(luma_dc_coeff));
> > +		if (rc)
> > +			return rc;
> > +		rc =3D jb_put_mem(&b, &luma_ac_coeff, sizeof(luma_ac_coeff));
> > +		if (rc)
> > +			return rc;
> > +		rc =3D jb_put_mem(&b, &sos_mono_hdr, sizeof(sos_mono_hdr));
> > +		if (rc)
> > +			return rc;
> > +		rc =3D jb_put_mem(&b, &sos_mono_data, sizeof(sos_mono_data));
> > +		if (rc)
> > +			return rc;
> > +	}
> > +
> > +	c->size =3D b.pos;
> > +
> > +	return 0;
> > +}
> > +
> > +void qcom_jenc_dqts_emit(const struct qcom_jenc_header *c, u8 *dst)
> > +{
> > +	/* Propagate DQT tables into the JPEG header */
> > +	if (c->dqt_one_offs) {
> > +		u32 one_offs =3D c->dqt_one_offs + sizeof(dqt_luma_data.index);
> > +
> > +		memcpy(dst + one_offs, &c->data[one_offs], sizeof(dqt_luma_data.valu=
e));
> > +	}
> > +
> > +	if (c->dqt_two_offs) {
> > +		u32 two_offs =3D c->dqt_two_offs + sizeof(dqt_chroma_data.index);
> > +
> > +		memcpy(dst + two_offs, &c->data[two_offs], sizeof(dqt_chroma_data.va=
lue));
> > +	}
> > +}
> > +
> > +u32 qcom_jenc_header_emit(const struct qcom_jenc_header *c, u8 *dst, u=
32 dst_size, u16 width,
> > +			=C2=A0 u16 height)
> > +{
> > +	/* Copy JFIF into JPEG header and update actual image size */
> > +	if (dst_size < c->size)
> > +		return 0;
> > +
> > +	memcpy(dst, c->data, c->size);
> > +
> > +	/* Update output image size */
> > +	patch_u16be(dst, c->sof_offset + JFIF_HEADER_WIDTH_OFFS, width);
> > +	patch_u16be(dst, c->sof_offset + JFIF_HEADER_HEIGHT_OFFS, height);
> > +
> > +	return c->size;
> > +}
> > diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.h b/drivers=
/media/platform/qcom/jpeg/qcom_jenc_hdr.h
> > new file mode 100644
> > index 000000000000..0c5fcc69e7cd
> > --- /dev/null
> > +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.h
> > @@ -0,0 +1,130 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +
> > +#ifndef QCOM_JENC_HDR_H
> > +#define QCOM_JENC_HDR_H
> > +
> > +#include <linux/types.h>
> > +
> > +#include "qcom_jenc_defs.h"
> > +
> > +#define JPEG_QDT_LENGTH	64
> > +#define JPEG_HEADER_MAX	1024
> > +
> > +struct qcom_jenc_header {
> > +	u8=C2=A0 data[JPEG_HEADER_MAX];
> > +	u32 size;
> > +	u32 sof_offset;
> > +	u32 dqt_one_offs;
> > +	u32 dqt_two_offs;
> > +};
> > +
> > +struct jpeg_record_hdr {
> > +	u8 marker[2];
> > +	u8 length[2];
> > +} __packed;
> > +
> > +struct jpeg_dqt_header {
> > +	u8 index;
> > +	u8 value[JPEG_QDT_LENGTH];
> > +} __packed;
> > +
> > +struct jpeg_soi_app0 {
> > +	u8 soi[2];
> > +	u8 app0_marker[2];
> > +	u8 app0_length[2];
> > +	u8 jfif_id[5];
> > +	u8 version[2];
> > +	u8 units;
> > +	u8 density_x[2];
> > +	u8 density_y[2];
> > +	u8 thumb_x;
> > +	u8 thumb_y;
> > +} __packed;
> > +
> > +struct jpeg_sof0_mono {
> > +	u8 precision;
> > +	u8 height[2];
> > +	u8 width[2];
> > +	u8 components;
> > +
> > +	u8 y_id;
> > +	u8 y_sampling;
> > +	u8 y_qtable;
> > +} __packed;
> > +
> > +struct jpeg_sof0_color {
> > +	u8 precision;
> > +	u8 height[2];
> > +	u8 width[2];
> > +	u8 components;
> > +
> > +	u8 y_id;
> > +	u8 y_sampling;
> > +	u8 y_qtable;
> > +
> > +	u8 cb_id;
> > +	u8 cb_sampling;
> > +	u8 cb_qtable;
> > +
> > +	u8 cr_id;
> > +	u8 cr_sampling;
> > +	u8 cr_qtable;
> > +} __packed;
> > +
> > +struct jpeg_dc_coeff_desc {
> > +	u8 index;
> > +	u8 bits[16];
> > +	u8 values[12];
> > +} __packed;
> > +
> > +struct jpeg_ac_coeff_desc {
> > +	u8 index;
> > +	u8 bits[16];
> > +	u8 values[162];
> > +} __packed;
> > +
> > +struct jpeg_sos_hdr {
> > +	u8 sos_marker[2];
> > +	u8 sos_length[2];
> > +	u8 components;
> > +} __packed;
> > +
> > +struct jpeg_sos_mono {
> > +	u8 components;
> > +
> > +	u8 y_id;
> > +	u8 y_tables;
> > +
> > +	u8 spectral[2];
> > +	u8 approx;
> > +} __packed;
> > +
> > +struct jpeg_sos_color {
> > +	u8 components;
> > +
> > +	u8 y_id;
> > +	u8 y_tables;
> > +
> > +	u8 cb_id;
> > +	u8 cb_tables;
> > +
> > +	u8 cr_id;
> > +	u8 cr_tables;
> > +
> > +	u8 spectral[2];
> > +	u8 approx;
> > +} __packed;
> > +
> > +struct jenc_context;
> > +
> > +int qcom_jenc_header_init(struct qcom_jenc_header *c, u32 fourcc);
> > +
> > +void qcom_jenc_dqts_emit(const struct qcom_jenc_header *c, u8 *dst);
> > +
> > +u32 qcom_jenc_header_emit(const struct qcom_jenc_header *c, u8 *dst, u=
32 dst_size, u16 width,
> > +			=C2=A0 u16 height);
> > +
> > +#endif /* QCOM_JENC_HDR_H */
> > diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_ops.c b/drivers=
/media/platform/qcom/jpeg/qcom_jenc_ops.c
> > new file mode 100644
> > index 000000000000..92e3c09df3d1
> > --- /dev/null
> > +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_ops.c
> > @@ -0,0 +1,1522 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +
> > +#include <asm/div64.h>
> > +#include <linux/pm_runtime.h>
> > +
> > +#include <media/v4l2-common.h>
> > +#include <media/v4l2-mem2mem.h>
> > +#include <media/videobuf2-dma-sg.h>
> > +#include <media/videobuf2-dma-contig.h>
> > +
> > +#include "qcom_jenc_dev.h"
> > +#include "qcom_jenc_ops.h"
> > +#include "qcom_jenc_defs.h"
> > +
> > +#define JPEG_RESET_TIMEOUT_MS	300
> > +#define JPEG_STOP_TIMEOUT_MS	200
> > +
> > +#define JPEG_DQT_SHIFT		20
> > +#define JPEG_Q5_21_SHIFT	21
> > +
> > +#define JPEG_MCU_BLOCK_8	8
> > +#define JPEG_MCU_BLOCK_16	16
> > +#define JPEG_MCU_BLOCK_128	128
> > +#define JPEG_MCU_BLOCK_256	256
> > +
> > +#define JPEG_DEFAULT_SCALE_STEP	0x200000
> > +
> > +#define JPEG_U32_CLR	(0U)
> > +#define JPEG_U32_SET	(~0U)
> > +
> > +/*
> > + *=C2=A0 JPEG | V4L2
> > + *=C2=A0 ---- | -------
> > + *=C2=A0 H1V1 | GREY
> > + *=C2=A0 H1V2 | YUV422M
> > + *=C2=A0 H2V1 | NV16M
> > + *=C2=A0 H2V2 | NV12M
> > + */
> > +enum qcom_jpeg_encode_fmt {
> > +	JPEG_ENCODE_H1V1 =3D 0,
> > +	JPEG_ENCODE_H1V2,
> > +	JPEG_ENCODE_H2V1,
> > +	JPEG_ENCODE_H2V2,
> > +	JPEG_ENCODE_MONO,
> > +};
> > +
> > +enum qcom_jpeg_memory_fmt {
> > +	JPEG_MEM_FMT_PLANAR	 =3D 0x0,
> > +	JPEG_MEM_FMT_PPLANAR	 =3D 0x1,
> > +	JPEG_MEM_FMT_MONO	 =3D 0x2,
> > +	JPEG_MEM_FMT_COEFFICIENT =3D 0x3
> > +};
> > +
> > +enum jpeg_mal_bounds {
> > +	JPEG_CFG_MAL_BOUND_32_BYTES	=3D 0x0,
> > +	JPEG_CFG_MAL_BOUND_64_BYTES	=3D 0x1,
> > +	JPEG_CFG_MAL_BOUND_128_BYTES	=3D 0x2,
> > +	JPEG_CFG_MAL_BOUND_256_BYTES	=3D 0x3,
> > +	JPEG_CFG_MAL_BOUND_512_BYTES	=3D 0x4,
> > +	JPEG_CFG_MAL_BOUND_1K_BYTES	=3D 0x5,
> > +	JPEG_CFG_MAL_BOUND_2K_BYTES	=3D 0x6,
> > +	JPEG_CFG_MAL_BOUND_4K_BYTES	=3D 0x7
> > +};
> > +
> > +struct qcom_jpeg_scale_blocks {
> > +	u8 w_block[QCOM_JPEG_MAX_PLANES];
> > +	u8 h_block[QCOM_JPEG_MAX_PLANES];
> > +};
> > +
> > +struct qcom_jpeg_mal_boundary {
> > +	u32 bytes;
> > +	int boundary;
> > +};
> > +
> > +struct qcom_jpeg_formats {
> > +	u32 fourcc;
> > +	enum qcom_jpeg_encode_fmt encode;
> > +	enum qcom_jpeg_memory_fmt memory;
> > +};
> > +
> > +/*
> > + * Luminance quantization table defined by CCITT T.81.
> > + * See: https://www.w3.org/Graphics/JPEG/itu-t81.pdf
> > + */
> > +static const u8 t81k1_dct_luma_table[JPEG_QDT_LENGTH] =3D {
> > +	16,=C2=A0 11,=C2=A0 10,=C2=A0 16,=C2=A0 24,=C2=A0 40,=C2=A0 51,=C2=A0=
 61,
> > +	12,=C2=A0 12,=C2=A0 14,=C2=A0 19,=C2=A0 26,=C2=A0 58,=C2=A0 60,=C2=A0=
 55,
> > +	14,=C2=A0 13,=C2=A0 16,=C2=A0 24,=C2=A0 40,=C2=A0 57,=C2=A0 69,=C2=A0=
 56,
> > +	14,=C2=A0 17,=C2=A0 22,=C2=A0 29,=C2=A0 51,=C2=A0 87,=C2=A0 80,=C2=A0=
 62,
> > +	18,=C2=A0 22,=C2=A0 37,=C2=A0 56,=C2=A0 68, 109, 103,=C2=A0 77,
> > +	24,=C2=A0 35,=C2=A0 55,=C2=A0 64,=C2=A0 81, 104, 113,=C2=A0 92,
> > +	49,=C2=A0 64,=C2=A0 78,=C2=A0 87, 103, 121, 120, 101,
> > +	72,=C2=A0 92,=C2=A0 95,=C2=A0 98, 112, 100, 103,=C2=A0 99
> > +};
> > +
> > +/*
> > + * Chrominance quantization table defined by CCITT T.81.
> > + * See: https://www.w3.org/Graphics/JPEG/itu-t81.pdf
> > + */
> > +static const u8 t81k2_dct_chroma_table[JPEG_QDT_LENGTH] =3D {
> > +	17,=C2=A0 18,=C2=A0 24,=C2=A0 47,=C2=A0 99,=C2=A0 99,=C2=A0 99,=C2=A0=
 99,
> > +	18,=C2=A0 21,=C2=A0 26,=C2=A0 66,=C2=A0 99,=C2=A0 99,=C2=A0 99,=C2=A0=
 99,
> > +	24,=C2=A0 26,=C2=A0 56,=C2=A0 99,=C2=A0 99,=C2=A0 99,=C2=A0 99,=C2=A0=
 99,
> > +	47,=C2=A0 66,=C2=A0 99,=C2=A0 99,=C2=A0 99,=C2=A0 99,=C2=A0 99,=C2=A0=
 99,
> > +	99,=C2=A0 99,=C2=A0 99,=C2=A0 99,=C2=A0 99,=C2=A0 99,=C2=A0 99,=C2=A0=
 99,
> > +	99,=C2=A0 99,=C2=A0 99,=C2=A0 99,=C2=A0 99,=C2=A0 99,=C2=A0 99,=C2=A0=
 99,
> > +	99,=C2=A0 99,=C2=A0 99,=C2=A0 99,=C2=A0 99,=C2=A0 99,=C2=A0 99,=C2=A0=
 99,
> > +	99,=C2=A0 99,=C2=A0 99,=C2=A0 99,=C2=A0 99,=C2=A0 99,=C2=A0 99,=C2=A0=
 99
> > +};
> > +
> > +/*
> > + * Zig-zag scan order for quantized DCT coefficients
> > + * as defined by CCITT T.81.
> > + * See: https://www.w3.org/Graphics/JPEG/itu-t81.pdf
> > + */
> > +static const u8 t81a6_dct_zig_zag_table[] =3D {
> > +	 0,=C2=A0 1,=C2=A0 5,=C2=A0 6, 14, 15, 27, 28,
> > +	 2,=C2=A0 4,=C2=A0 7, 13, 16, 26, 29, 42,
> > +	 3,=C2=A0 8, 12, 17, 25, 30, 41, 43,
> > +	 9, 11, 18, 24, 31, 40, 44, 53,
> > +	10, 19, 23, 32, 39, 45, 52, 54,
> > +	20, 22, 33, 38, 46, 51, 55, 60,
> > +	21, 34, 37, 47, 50, 56, 59, 61,
> > +	35, 36, 48, 49, 57, 58, 62, 63
> > +};
> > +
> > +static const u8 jpeg_mcu_per_ratio[] =3D {
> > +	0, /* MCU =3D 1, Ratio < 2x	 */
> > +	3, /* MCU =3D 0, 2x <=3D Ratio < 4x	 */
> > +	2, /* MCU =3D 0, 4x <=3D Ratio < 8x	 */
> > +	1, /* MCU =3D 0, 8x <=3D Ratio < 16x */
> > +	0, /* MCU =3D 0, Ratio > 16x	 */
> > +};
> > +
> > +static const struct qcom_jpeg_formats jpeg_encode_fmt[] =3D {
> > +	{
> > +		.fourcc =3D V4L2_PIX_FMT_GREY,
> > +		.encode =3D JPEG_ENCODE_MONO,
> > +		.memory =3D JPEG_MEM_FMT_MONO
> > +	},
> > +	{
> > +		.fourcc =3D V4L2_PIX_FMT_JPEG,
> > +		.encode =3D JPEG_ENCODE_H1V1,
> > +		.memory =3D JPEG_MEM_FMT_PPLANAR
> > +	},
> > +	{
> > +		.fourcc =3D V4L2_PIX_FMT_YUV422M,
> > +		.encode =3D JPEG_ENCODE_H1V2,
> > +		.memory =3D JPEG_MEM_FMT_PLANAR
> > +	},
> > +	{
> > +		.fourcc =3D V4L2_PIX_FMT_YVU422M,
> > +		.encode =3D JPEG_ENCODE_H1V2,
> > +		.memory =3D JPEG_MEM_FMT_PLANAR
> > +	},
> > +	{
> > +		.fourcc =3D V4L2_PIX_FMT_NV16M,
> > +		.encode =3D JPEG_ENCODE_H2V1,
> > +		.memory =3D JPEG_MEM_FMT_PPLANAR
> > +	},
> > +	{
> > +		.fourcc =3D V4L2_PIX_FMT_NV61M,
> > +		.encode =3D JPEG_ENCODE_H2V1,
> > +		.memory =3D JPEG_MEM_FMT_PPLANAR
> > +	},
> > +	{
> > +		.fourcc =3D V4L2_PIX_FMT_NV12M,
> > +		.encode =3D JPEG_ENCODE_H2V2,
> > +		.memory =3D JPEG_MEM_FMT_PPLANAR
> > +	},
> > +	{
> > +		.fourcc =3D V4L2_PIX_FMT_NV21M,
> > +		.encode =3D JPEG_ENCODE_H2V2,
> > +		.memory =3D JPEG_MEM_FMT_PPLANAR
> > +	}
> > +};
> > +
> > +static const struct qcom_jpeg_mal_boundary jpeg_mal_bounds[] =3D {
> > +	{ .bytes =3D=C2=A0=C2=A0 32, .boundary =3D JPEG_CFG_MAL_BOUND_32_BYTE=
S=C2=A0 },
> > +	{ .bytes =3D=C2=A0=C2=A0 64, .boundary =3D JPEG_CFG_MAL_BOUND_64_BYTE=
S=C2=A0 },
> > +	{ .bytes =3D=C2=A0 128, .boundary =3D JPEG_CFG_MAL_BOUND_128_BYTES },
> > +	{ .bytes =3D=C2=A0 256, .boundary =3D JPEG_CFG_MAL_BOUND_256_BYTES },
> > +	{ .bytes =3D=C2=A0 512, .boundary =3D JPEG_CFG_MAL_BOUND_512_BYTES },
> > +	{ .bytes =3D 1024, .boundary =3D JPEG_CFG_MAL_BOUND_1K_BYTES=C2=A0 },
> > +	{ .bytes =3D 4096, .boundary =3D JPEG_CFG_MAL_BOUND_4K_BYTES=C2=A0 }
> > +};
> > +
> > +static const struct qcom_jpeg_scale_blocks jpeg_mcu_blocks[] =3D {
> > +	[JPEG_ENCODE_H1V1] =3D {
> > +		.w_block =3D { JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8 =
},
> > +		.h_block =3D { JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8 =
},
> > +	},
> > +	[JPEG_ENCODE_H1V2] =3D {
> > +		.w_block =3D { JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8=
=C2=A0 },
> > +		.h_block =3D { JPEG_MCU_BLOCK_16, JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8=
 },
> > +	},
> > +	[JPEG_ENCODE_H2V1] =3D {
> > +		.w_block =3D { JPEG_MCU_BLOCK_16, JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8=
 },
> > +		.h_block =3D { JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8=
=C2=A0 },
> > +	},
> > +	[JPEG_ENCODE_H2V2] =3D {
> > +		.w_block =3D { JPEG_MCU_BLOCK_16, JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8=
 },
> > +		.h_block =3D { JPEG_MCU_BLOCK_16, JPEG_MCU_BLOCK_8, JPEG_MCU_BLOCK_8=
 },
> > +	},
> > +	[JPEG_ENCODE_MONO] =3D {
> > +		.w_block =3D { JPEG_MCU_BLOCK_8 },
> > +		.h_block =3D { JPEG_MCU_BLOCK_8 }
> > +	},
> > +};
> > +
> > +static inline int jpeg_get_memory_fmt(u32 fourcc)
> > +{
> > +	u32 fi;
> > +
> > +	for (fi =3D 0; fi < ARRAY_SIZE(jpeg_encode_fmt); fi++) {
> > +		if (jpeg_encode_fmt[fi].fourcc =3D=3D fourcc)
> > +			return jpeg_encode_fmt[fi].memory;
> > +	}
> > +
> > +	return -EINVAL;
> > +}
> > +
> > +static inline int jpeg_get_encode_fmt(u32 fourcc)
> > +{
> > +	u32 fi;
> > +
> > +	for (fi =3D 0; fi < ARRAY_SIZE(jpeg_encode_fmt); fi++) {
> > +		if (jpeg_encode_fmt[fi].fourcc =3D=3D fourcc)
> > +			return jpeg_encode_fmt[fi].encode;
> > +	}
> > +
> > +	return -EINVAL;
> > +}
> > +
> > +static inline int jpeg_get_mal_boundary(u32 width, const struct qcom_j=
peg_mal_boundary *table,
> > +					u32 count)
> > +{
> > +	u32 bi;
> > +
> > +	if (!table || !count)
> > +		return -EINVAL;
> > +
> > +	for (bi =3D 0; bi < count; bi++) {
> > +		if (table[bi].bytes > width)
> > +			break;
> > +	}
> > +
> > +	if (!bi)
> > +		return table[0].boundary;
> > +
> > +	return table[bi - 1].boundary;
> > +}
> > +
> > +static inline u8 jpeg_get_mcu_per_block(u32 src_size, u32 dst_size)
> > +{
> > +	u8 h_rto;
> > +
> > +	if (!src_size || !dst_size)
> > +		return 0;
> > +
> > +	/* Calculate scale factor */
> > +	h_rto =3D max(src_size, dst_size) / min(src_size, dst_size);
> > +
> > +	if (h_rto >=3D 0 && h_rto < 2)
> > +		return jpeg_mcu_per_ratio[0];
> > +	else if (h_rto >=3D 2 && h_rto < 4)
> > +		return jpeg_mcu_per_ratio[1];
> > +	else if (h_rto >=3D 4 && h_rto < 8)
> > +		return jpeg_mcu_per_ratio[2];
> > +	else if (h_rto >=3D 8 && h_rto < 16)
> > +		return jpeg_mcu_per_ratio[3];
> > +
> > +	return jpeg_mcu_per_ratio[4];
> > +}
> > +
> > +static inline int jpeg_get_mcu_geometry(enum qcom_jpeg_encode_fmt fmt,=
 u32 width, u32 height,
> > +					u32 *blk_w, u32 *blk_h, u32 *mcu_cols, u32 *mcu_rows)
> > +{
> > +	const struct qcom_jpeg_scale_blocks *blks;
> > +	u32 bw =3D 0, bh =3D 0;
> > +	u8 pln;
> > +
> > +	if (!width || !height)
> > +		return -EINVAL;
> > +
> > +	blks =3D &jpeg_mcu_blocks[fmt];
> > +
> > +	for (pln =3D 0; pln < QCOM_JPEG_MAX_PLANES; pln++) {
> > +		bw =3D max(bw, blks->w_block[pln]);
> > +		bh =3D max(bh, blks->h_block[pln]);
> > +	}
> > +
> > +	if (!bw || !bh)
> > +		return -EINVAL;
> > +
> > +	if (blk_w)
> > +		*blk_w =3D bw;
> > +	if (blk_h)
> > +		*blk_h =3D bh;
> > +
> > +	if (mcu_cols)
> > +		*mcu_cols =3D ALIGN(width, bw) / bw;
> > +
> > +	if (mcu_rows)
> > +		*mcu_rows =3D ALIGN(height, bh) / bh;
> > +
> > +	return 0;
> > +}
> > +
> > +/* Integer part of scale */
> > +static inline s32 jpeg_calc_scale_int(u32 in_width, u32 out_width)
> > +{
> > +	if (!out_width)
> > +		return 0;
> > +
> > +	return (s32)(in_width / out_width);
> > +}
> > +
> > +/* Fractional part od scale */
> > +static inline u32 jpeg_calc_scale_frac(u32 in_width, u32 out_width)
> > +{
> > +	u32 remainder =3D in_width % out_width;
> > +
> > +	if (!out_width)
> > +		return 0;
> > +
> > +	/* 64-bit to avoid overflow during shift */
> > +	return (u32)(((u64)remainder << JPEG_Q5_21_SHIFT) / out_width);
> > +}
> > +
> > +static inline s32 jpeg_calc_q5_21(s32 int_part, u32 frac_part)
> > +{
> > +	return ((s32)((u32)int_part << JPEG_Q5_21_SHIFT)) | (frac_part & ((1u=
 << 21) - 1));
> > +}
> > +
> > +static inline u32 jpeg_io_read(struct qcom_jenc_dev *jenc, u32 offset)
> > +{
> > +	u32 data;
> > +
> > +	rmb();	/* Preventing concurrency read/write interference */
> > +	data =3D readl_relaxed(jenc->jpeg_base + offset);
> > +
> > +	return data;
> > +}
> > +
> > +static inline void jpeg_io_write(struct qcom_jenc_dev *jenc, u32 offse=
t, u32 value)
> > +{
> > +	wmb();	/* Preventing concurrency read/write interference */
> > +	writel_relaxed(value, jenc->jpeg_base + offset);
> > +}
> > +
> > +/*
> > + * Runtime bitfield helpers (for non-constant masks).
> > + *
> > + * Requirements:
> > + *=C2=A0 - mask must be non-zero
> > + *=C2=A0 - mask must be contiguous (e.g. 0x7u << n)
> > + */
> > +
> > +static inline u32 jpeg_bits_get(u32 mask, u32 reg)
> > +{
> > +	return (reg & mask) >> __builtin_ctz(mask);
> > +}
> > +
> > +static inline u32 jpeg_bits_set(u32 mask, u32 val)
> > +{
> > +	return (val << __builtin_ctz(mask)) & mask;
> > +}
> > +
> > +static inline u32 jpeg_rd_bits(struct qcom_jenc_dev *jenc, u32 offs, e=
num qcom_jpeg_mask_id mid)
> > +{
> > +	u32 reg=C2=A0 =3D jpeg_io_read(jenc, offs);
> > +	u32 mask =3D jenc->res->hw_mask[mid];
> > +
> > +	return jpeg_bits_get(mask, reg);
> > +}
> > +
> > +/*
> > + * Read-modify-write (for R/W registers)
> > + */
> > +static inline void jpeg_rw_bits(struct qcom_jenc_dev *jenc, u32 offs, =
enum qcom_jpeg_mask_id mid,
> > +				u32 val)
> > +{
> > +	u32 reg=C2=A0 =3D jpeg_io_read(jenc, offs);
> > +	u32 mask =3D jenc->res->hw_mask[mid];
> > +
> > +	reg &=3D ~mask;
> > +	reg |=3D jpeg_bits_set(mask, val);
> > +
> > +	jpeg_io_write(jenc, offs, reg);
> > +}
> > +
> > +/*
> > + * Write-only variant (for write only registers)
> > + */
> > +static inline void jpeg_wo_bits(struct qcom_jenc_dev *jenc, u32 offs, =
enum qcom_jpeg_mask_id mid,
> > +				u32 val)
> > +{
> > +	u32 mask =3D jenc->res->hw_mask[mid];
> > +
> > +	jpeg_io_write(jenc, offs, jpeg_bits_set(mask, val));
> > +}
> > +
> > +static u8 jpeg_calculate_dqt(struct jenc_context *ectx, u8 dqt_value)
> > +{
> > +	u64 ratio;
> > +	u8 calc_val;
> > +
> > +	ratio =3D (QCOM_JPEG_QUALITY_MAX - ectx->quality_requested) << JPEG_D=
QT_SHIFT;
> > +	ratio =3D max_t(u64, 1, ratio);
> > +	do_div(ratio, QCOM_JPEG_QUALITY_MID);
> > +
> > +	calc_val =3D DIV64_U64_ROUND_CLOSEST(ratio * dqt_value, 1LU << JPEG_D=
QT_SHIFT);
> > +
> > +	return max_t(u8, 1, calc_val);
> > +}
> > +
> > +static void jpeg_apply_dmi_table(struct jenc_context *ectx)
> > +{
> > +	const struct qcom_jpeg_reg_offs *offs =3D ectx->jenc->res->hw_offs;
> > +	u32 pcfg =3D { 0x00000011 };
> > +	u32 addr =3D { 0x00000000 };
> > +	u8 *base;
> > +	u8 dqt_val, idx;
> > +	u32 reg_val;
> > +	int i;
> > +
> > +	/* DMI upload start sequence */
> > +	jpeg_io_write(ectx->jenc, offs->dmi_addr, addr);
> > +	jpeg_io_write(ectx->jenc, offs->dmi_cfg, pcfg);
> > +
> > +	/* DMI Luma upload */
> > +	base =3D &ectx->hdr_cache.data[ectx->hdr_cache.dqt_one_offs + 1];
> > +	for (i =3D 0; i < ARRAY_SIZE(t81k1_dct_luma_table); i++) {
> > +		dqt_val =3D jpeg_calculate_dqt(ectx, t81k1_dct_luma_table[i]);
> > +		/*
> > +		 * Store the luma to be propagated to the JPEG header at a later sta=
ge.
> > +		 * If offs =3D=3D 0, no DQT is present in the header and the write
> > +		 * should be skipped.
> > +		 */
> > +		if (ectx->hdr_cache.dqt_one_offs) {
> > +			idx =3D t81a6_dct_zig_zag_table[i];
> > +			/* Perform reordering to arrange transformed DQT in a zigzag patter=
n */
> > +			base[idx] =3D dqt_val;
> > +		}
> > +		/* The calculated DQT value cannot be less than 1 */
> > +		reg_val =3D div_u64(U16_MAX + 1U, dqt_val);
> > +		jpeg_io_write(ectx->jenc, offs->dmi_data, clamp_t(u32, reg_val, 0, U=
16_MAX));
> > +	}
> > +
> > +	/* DMI Chroma upload */
> > +	base =3D &ectx->hdr_cache.data[ectx->hdr_cache.dqt_two_offs + 1];
> > +	for (i =3D 0; i < ARRAY_SIZE(t81k2_dct_chroma_table); i++) {
> > +		dqt_val =3D jpeg_calculate_dqt(ectx, t81k2_dct_chroma_table[i]);
> > +		/*
> > +		 * Store the chroma to be propagated to the JPEG header at a later s=
tage.
> > +		 * If offs =3D=3D 0, no DQT is present in the header and the write
> > +		 * should be skipped.
> > +		 */
> > +		if (ectx->hdr_cache.dqt_two_offs) {
> > +			idx =3D t81a6_dct_zig_zag_table[i];
> > +			/* Perform reordering to arrange transformed DQT in a zigzag patter=
n */
> > +			base[idx] =3D dqt_val;
> > +		}
> > +		/* The calculated DQT value cannot be less than 1 */
> > +		reg_val =3D div_u64(U16_MAX + 1U, dqt_val);
> > +		jpeg_io_write(ectx->jenc, offs->dmi_data, clamp_t(u32, reg_val, 0, U=
16_MAX));
> > +	}
> > +
> > +	/* DMI upload end sequence */
> > +	jpeg_io_write(ectx->jenc, offs->dmi_cfg, addr);
> > +
> > +	ectx->quality_programmed =3D ectx->quality_requested;
> > +
> > +	dev_dbg(ectx->dev, "%s: ctx=3D%p quality_programmed=3D%d\n", __func__=
, ectx,
> > +		ectx->quality_programmed);
> > +}
> > +
> > +static void jpeg_cpu_access(struct device *dev, struct qcom_jpeg_buff =
*frame,
> > +			=C2=A0=C2=A0=C2=A0 enum dma_data_direction direction)
> > +{
> > +	u8 pln;
> > +
> > +	for (pln =3D 0; pln < QCOM_JPEG_MAX_PLANES; pln++) {
> > +		struct sg_table	*sgt =3D frame->plns[pln].sgt;
> > +
> > +		if (!frame->plns[pln].dma || !sgt)
> > +			break;
> > +
> > +		dma_sync_sg_for_cpu(dev, sgt->sgl, sgt->orig_nents, direction);
> > +	}
> > +}
> > +
> > +static void jpeg_dev_access(struct device *dev, struct qcom_jpeg_buff =
*frame,
> > +			=C2=A0=C2=A0=C2=A0 enum dma_data_direction direction)
> > +{
> > +	u8 pln;
> > +
> > +	for (pln =3D 0; pln < QCOM_JPEG_MAX_PLANES; pln++) {
> > +		struct sg_table	*sgt =3D frame->plns[pln].sgt;
> > +
> > +		if (!frame->plns[pln].dma || !sgt)
> > +			continue;
> > +
> > +		dma_sync_sg_for_device(dev, sgt->sgl, sgt->orig_nents, direction);
> > +	}
> > +}
> > +
> > +static int jpeg_init(struct qcom_jenc_dev *jenc)
> > +{
> > +	const struct qcom_jpeg_reg_offs *offs;
> > +	void __iomem *mem_base;
> > +	unsigned long rtime;
> > +	u32 hw_ver;
> > +
> > +	if (!jenc || !jenc->dev || !jenc->jpeg_base || !jenc->res->hw_offs) {
>=20
> How can jenc be NULL here? Or any other field?
>=20
> > +		pr_err("encoder HW init failed\n");
>=20
> dev_err.
>=20
> > +		return -EINVAL;
> > +	}
> > +
> > +	offs	 =3D jenc->res->hw_offs;
> > +	mem_base =3D jenc->jpeg_base;
> > +
> > +	jpeg_wo_bits(jenc, offs->int_clr, JMSK_IRQ_CLEAR_ALL, JPEG_U32_SET);
> > +	jpeg_rw_bits(jenc, offs->int_mask, JMSK_IRQ_STATUS_RESET_ACK, JPEG_U3=
2_SET);
> > +
> > +	reinit_completion(&jenc->reset_complete);
> > +
> > +	jpeg_wo_bits(jenc, offs->reset_cmd, JMSK_RST_CMD_COMMON, JPEG_U32_SET=
);
> > +
> > +	rtime =3D wait_for_completion_timeout(&jenc->reset_complete,
> > +					=C2=A0=C2=A0=C2=A0 msecs_to_jiffies(JPEG_RESET_TIMEOUT_MS));
> > +	if (!rtime) {
> > +		dev_err(jenc->dev, "encoder HW reset timeout\n");
> > +		disable_irq(jenc->irq);
> > +		return -ETIME;
> > +	}
> > +
> > +	hw_ver =3D jpeg_io_read(jenc, offs->hw_version);
> > +	dev_info(jenc->dev, "JPEG HW encoder version %d.%d.%d\n",
>=20
> No useless log spamming.
>=20
> > +		 jpeg_bits_get(jenc->res->hw_mask[JMSK_HW_VER_MAJOR], hw_ver),
> > +		 jpeg_bits_get(jenc->res->hw_mask[JMSK_HW_VER_MINOR], hw_ver),
> > +		 jpeg_bits_get(jenc->res->hw_mask[JMSK_HW_VER_STEP], hw_ver));
> > +
> > +	jpeg_wo_bits(jenc, offs->hw_cmd, JMSK_CMD_CLR_RD_PLNS_QUEUE, JPEG_U32=
_SET);
> > +	jpeg_wo_bits(jenc, offs->hw_cmd, JMSK_CMD_CLR_RD_PLNS_QUEUE, JPEG_U32=
_CLR);
> > +
> > +	jpeg_wo_bits(jenc, offs->hw_cmd, JMSK_CMD_CLR_WR_PLNS_QUEUE, JPEG_U32=
_SET);
> > +	jpeg_wo_bits(jenc, offs->hw_cmd, JMSK_CMD_CLR_WR_PLNS_QUEUE, JPEG_U32=
_CLR);
> > +
> > +	jpeg_wo_bits(jenc, offs->int_clr, JMSK_IRQ_CLEAR_ALL, JPEG_U32_SET);
> > +	jpeg_rw_bits(jenc, offs->int_mask, JMSK_IRQ_ENABLE_ALL, JPEG_U32_SET)=
;
> > +
> > +	return 0;
> > +}
> > +
> > +static int jpeg_exec(struct qcom_jenc_dev *jenc)
> > +{
> > +	const struct qcom_jpeg_reg_offs *offs =3D jenc->res->hw_offs;
> > +
> > +	jpeg_wo_bits(jenc, offs->hw_cmd, JMSK_CMD_HW_START, 1);
> > +
> > +	return 0;
> > +}
> > +
> > +static void jpeg_stop(struct qcom_jenc_dev *jenc)
> > +{
> > +	const struct qcom_jpeg_reg_offs *offs =3D jenc->res->hw_offs;
> > +
> > +	jpeg_wo_bits(jenc, offs->hw_cmd, JMSK_CMD_HW_START, 0);
> > +
> > +	jpeg_wo_bits(jenc, offs->hw_cmd, JMSK_CMD_CLR_RD_PLNS_QUEUE, JPEG_U32=
_SET);
> > +	jpeg_wo_bits(jenc, offs->hw_cmd, JMSK_CMD_CLR_RD_PLNS_QUEUE, JPEG_U32=
_CLR);
> > +
> > +	jpeg_wo_bits(jenc, offs->hw_cmd, JMSK_CMD_CLR_WR_PLNS_QUEUE, JPEG_U32=
_SET);
> > +	jpeg_wo_bits(jenc, offs->hw_cmd, JMSK_CMD_CLR_WR_PLNS_QUEUE, JPEG_U32=
_CLR);
> > +
> > +	jpeg_wo_bits(jenc, offs->int_clr, JMSK_IRQ_CLEAR_ALL, JPEG_U32_SET);
> > +	jpeg_rw_bits(jenc, offs->int_mask, JMSK_IRQ_ENABLE_ALL, JPEG_U32_SET)=
;
> > +}
> > +
> > +static int jpeg_deinit(struct qcom_jenc_dev *jenc)
> > +{
> > +	const struct qcom_jpeg_reg_offs *offs =3D jenc->res->hw_offs;
> > +	unsigned long rtime;
> > +
> > +	jpeg_wo_bits(jenc, offs->int_clr, JMSK_IRQ_CLEAR_ALL, JPEG_U32_SET);
> > +	jpeg_rw_bits(jenc, offs->int_mask, JMSK_IRQ_STATUS_STOP_ACK, JPEG_U32=
_SET);
> > +
> > +	jpeg_wo_bits(jenc, offs->hw_cmd, JMSK_CMD_HW_STOP, 1);
> > +
> > +	reinit_completion(&jenc->stop_complete);
> > +	rtime =3D wait_for_completion_timeout(&jenc->stop_complete,
> > +					=C2=A0=C2=A0=C2=A0 msecs_to_jiffies(JPEG_STOP_TIMEOUT_MS));
> > +	if (!rtime) {
> > +		dev_err(jenc->dev, "encoder HW stop timeout\n");
> > +		return -ETIME;
> > +	}
> > +
> > +	jpeg_rw_bits(jenc, offs->int_mask, JMSK_IRQ_DISABLE_ALL, JPEG_U32_CLR=
);
> > +	jpeg_rw_bits(jenc, offs->int_clr, JMSK_IRQ_CLEAR_ALL, JPEG_U32_SET);
> > +
> > +	return 0;
> > +}
> > +
> > +static int jpeg_apply_fe_addr(struct jenc_context *ectx, struct qcom_j=
enc_queue *q,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vb2_buffer *vb)
> > +{
> > +	struct qcom_jenc_dev *jenc =3D ectx->jenc;
> > +	const struct qcom_jpeg_reg_offs *offs =3D jenc->res->hw_offs;
> > +	struct qcom_jpeg_buff *frame =3D &q->buff[vb->index];
> > +	struct v4l2_pix_format_mplane *fmt =3D &q->vf;
> > +	u8 pln =3D 0;
> > +
> > +	if (WARN_ON_ONCE(!frame->plns[pln].dma))
> > +		return -EPERM;
> > +
> > +	for (pln =3D 0; pln < fmt->num_planes; pln++) {
> > +		if (!frame->plns[pln].sgt || !frame->plns[pln].sgt->sgl)
> > +			break;
> > +
> > +		jpeg_io_write(jenc, offs->fe.pntr[pln], frame->plns[pln].dma);
> > +		jpeg_io_write(jenc, offs->fe.offs[pln], 0);
> > +
> > +		dev_dbg(jenc->dev, "%s: pln=3D%d addr=3D0x%llx idx:%d\n", __func__,
> > +			pln, frame->plns[pln].dma, vb->index);
> > +	}
> > +
> > +	q->buff_id =3D vb->index;
> > +
> > +	jpeg_dev_access(jenc->dev, frame, DMA_TO_DEVICE);
> > +
> > +	return 0;
> > +}
> > +
> > +static int jpeg_store_fe_next(struct jenc_context *ectx, struct vb2_bu=
ffer *vb2)
> > +{
> > +	struct qcom_jenc_queue *q =3D &ectx->bufq[TYPE2QID(vb2->type)];
> > +	struct qcom_jpeg_buff *buff =3D &q->buff[vb2->index];
> > +	u8 pln =3D 0;
> > +
> > +	buff->plns[pln].sgt =3D vb2_dma_sg_plane_desc(vb2, pln);
> > +	if (WARN_ON_ONCE(!buff->plns[pln].sgt))
> > +		return -EINVAL;
> > +
> > +	if (WARN_ON_ONCE(!buff->plns[pln].sgt->sgl))
> > +		return -EINVAL;
> > +
> > +	buff->plns[pln].dma =3D sg_dma_address(buff->plns[pln].sgt->sgl);
> > +	if (WARN_ON_ONCE(!buff->plns[pln].dma))
> > +		return -EINVAL;
> > +
> > +	buff->plns[pln].size =3D vb2_plane_size(vb2, pln);
> > +	if (WARN_ON_ONCE(!buff->plns[pln].size))
> > +		return -EINVAL;
> > +
> > +	for (pln =3D 1; pln < q->vf.num_planes; pln++) {
> > +		buff->plns[pln].sgt =3D vb2_dma_sg_plane_desc(vb2, pln);
> > +		if (WARN_ON_ONCE(!buff->plns[pln].sgt || !buff->plns[pln].sgt->sgl))
> > +			return -EINVAL;
> > +
> > +		buff->plns[pln].dma =3D sg_dma_address(buff->plns[pln].sgt->sgl);
> > +		if (WARN_ON_ONCE(!buff->plns[pln].dma))
> > +			return -EINVAL;
> > +
> > +		buff->plns[pln].size =3D vb2_plane_size(vb2, pln);
> > +		if (WARN_ON_ONCE(!buff->plns[pln].size))
> > +			return -EINVAL;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int jpeg_setup_fe_size(struct jenc_context *ectx, struct qcom_j=
enc_queue *q)
> > +{
> > +	struct qcom_jenc_dev *jenc =3D ectx->jenc;
> > +	struct v4l2_pix_format_mplane *sfmt =3D &q->vf;
> > +	const struct qcom_jpeg_reg_offs *offs =3D jenc->res->hw_offs;
> > +	u8 pln;
> > +
> > +	for (pln =3D 0; pln < QCOM_JPEG_MAX_PLANES; pln++) {
> > +		jpeg_rw_bits(jenc, offs->fe.bsize[pln], JMSK_PLNS_RD_BUF_SIZE_WIDTH,=
 0);
> > +		jpeg_rw_bits(jenc, offs->fe.bsize[pln], JMSK_PLNS_RD_BUF_SIZE_HEIGHT=
, 0);
> > +		jpeg_rw_bits(jenc, offs->fe.bsize[pln], JMSK_PLNS_RD_STRIDE, 0);
> > +	}
> > +
> > +	for (pln =3D 0; pln < sfmt->num_planes; pln++) {
> > +		jpeg_rw_bits(jenc, offs->fe.bsize[pln], JMSK_PLNS_RD_BUF_SIZE_WIDTH,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0 sfmt->width=C2=A0 - 1);
> > +		jpeg_rw_bits(jenc, offs->fe.bsize[pln], JMSK_PLNS_RD_BUF_SIZE_HEIGHT=
,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0 sfmt->height=C2=A0 - 1);
> > +		jpeg_rw_bits(jenc, offs->fe.stride[pln], JMSK_PLNS_RD_STRIDE,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0 sfmt->plane_fmt[pln].bytesperline);
> > +
> > +		dev_dbg(ectx->dev, "%s: ctx=3D%p pln=3D%d width=3D%d height=3D%d str=
ide=3D%d\n",
> > +			__func__, ectx, pln,
> > +			jpeg_rd_bits(jenc, offs->fe.bsize[pln], JMSK_PLNS_RD_BUF_SIZE_WIDTH=
),
> > +			jpeg_rd_bits(jenc, offs->fe.bsize[pln], JMSK_PLNS_RD_BUF_SIZE_HEIGH=
T),
> > +			jpeg_rd_bits(jenc, offs->fe.stride[pln], JMSK_PLNS_RD_STRIDE));
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int jpeg_setup_fe_hinit(struct jenc_context *ectx, struct qcom_=
jenc_queue *q)
> > +{
> > +	struct qcom_jenc_dev *jenc =3D ectx->jenc;
> > +	struct v4l2_pix_format_mplane *sfmt =3D &q->vf;
> > +	const struct qcom_jpeg_reg_offs *offs =3D jenc->res->hw_offs;
> > +	u8 pln;
> > +
> > +	if (!sfmt->width) {
> > +		dev_err(ectx->dev, "%s: invalid source width=3D%d\n", __func__, sfmt=
->width);
> > +		return -EINVAL;
> > +	}
> > +
> > +	for (pln =3D 0; pln < QCOM_JPEG_MAX_PLANES; pln++)
> > +		jpeg_io_write(jenc, offs->fe.hinit[pln], 0);
> > +
> > +	return 0;
> > +}
> > +
> > +static int jpeg_setup_fe_vinit(struct jenc_context *ectx, struct qcom_=
jenc_queue *q)
> > +{
> > +	struct qcom_jenc_dev *jenc =3D ectx->jenc;
> > +	struct v4l2_pix_format_mplane *sfmt =3D &q->vf;
> > +	const struct qcom_jpeg_reg_offs *offs =3D jenc->res->hw_offs;
> > +	u8 pln;
> > +
> > +	if (!sfmt->height) {
> > +		dev_err(ectx->dev, "%s: invalid source height=3D%d\n", __func__, sfm=
t->height);
> > +		return -EINVAL;
> > +	}
> > +
> > +	for (pln =3D 0; pln < QCOM_JPEG_MAX_PLANES; pln++)
> > +		jpeg_io_write(jenc, offs->fe.vinit[pln], 0);
> > +
> > +	return 0;
> > +}
> > +
> > +static int jpeg_setup_fe_params(struct jenc_context *ectx, struct qcom=
_jenc_queue *q)
> > +{
> > +	struct qcom_jenc_dev *jenc =3D ectx->jenc;
> > +	struct v4l2_pix_format_mplane *sfmt =3D &q->vf;
> > +	struct v4l2_pix_format_mplane *dfmt =3D &ectx->bufq[JENC_DST_QUEUE].v=
f;
> > +	const struct qcom_jpeg_reg_offs *offs =3D jenc->res->hw_offs;
> > +	u8 expected_planes, pln;
> > +	int rval;
> > +
> > +	jpeg_rw_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_MAL_EN, 1);
> > +	jpeg_rw_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_BOTTOM_VPAD_EN, 1);
> > +
> > +	rval =3D jpeg_get_memory_fmt(sfmt->pixelformat);
> > +	if (rval < 0) {
> > +		dev_err(ectx->dev, "%s: invalid memory format for v4l2 format:0x%x\n=
",
> > +			__func__, sfmt->pixelformat);
> > +		return -EINVAL;
> > +	}
> > +
> > +	switch (rval) {
> > +	case JPEG_MEM_FMT_MONO:
> > +		expected_planes =3D 1;
> > +		break;
> > +	case JPEG_MEM_FMT_PPLANAR:
> > +		expected_planes =3D 2;
> > +		break;
> > +	case JPEG_MEM_FMT_PLANAR:
> > +		expected_planes =3D 3;
> > +		break;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (sfmt->num_planes !=3D expected_planes) {
> > +		dev_err(ectx->dev, "%s: plane mismatch fmt=3D%u expected=3D%u got=3D=
%u\n",
> > +			__func__, rval, expected_planes, sfmt->num_planes);
> > +		return -EINVAL;
> > +	}
> > +
> > +	jpeg_rw_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_MEMORY_FORMAT, rval);
> > +
> > +	jpeg_rw_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_PLN0_EN, 0);
> > +	jpeg_rw_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_PLN1_EN, 0);
> > +	jpeg_rw_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_PLN2_EN, 0);
> > +
> > +	if (sfmt->width =3D=3D dfmt->width && sfmt->height =3D=3D dfmt->heigh=
t) {
> > +		/* No scaling */
> > +		jpeg_rw_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_SIXTEEN_MCU_EN, 1);
> > +		jpeg_rw_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_MCUS_PER_BLOCK, 0);
> > +	} else {
> > +		u8 mcu_per_blks;
> > +
> > +		/* Scaling */
> > +		jpeg_rw_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_SIXTEEN_MCU_EN, 0);
> > +		/* get value according to image width */
> > +		mcu_per_blks =3D jpeg_get_mcu_per_block(sfmt->width, dfmt->width);
> > +		/* get value according to image height assign the bigger */
> > +		mcu_per_blks =3D max_t(u8, mcu_per_blks,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 jpeg_get_mcu_per_block(sfmt->height, dfmt=
->height));
> > +
> > +		jpeg_rw_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_MCUS_PER_BLOCK, mcu_per=
_blks);
> > +	}
> > +
> > +	dev_dbg(ectx->dev, "%s: sixteen MCU enabled=3D%d, %d MCU per blocks\n=
", __func__,
> > +		jpeg_rd_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_SIXTEEN_MCU_EN),
> > +		jpeg_rd_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_MCUS_PER_BLOCK));
> > +
> > +	rval =3D jpeg_get_mal_boundary(sfmt->width, jpeg_mal_bounds, ARRAY_SI=
ZE(jpeg_mal_bounds));
> > +	if (rval < 0) {
> > +		dev_err(ectx->dev, "%s: failed to get FE mal boundary width=3D%u\n",=
 __func__,
> > +			sfmt->width);
> > +		return -EINVAL;
> > +	}
> > +	jpeg_rw_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_MAL_BOUNDARY, rval);
> > +
> > +	dev_dbg(ectx->dev, "%s: optimal FE mal boundary=3D%d\n", __func__,
> > +		jpeg_rd_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_MAL_BOUNDARY));
> > +
> > +	rval =3D jpeg_get_encode_fmt(sfmt->pixelformat);
> > +	if (rval < 0) {
> > +		dev_err(ectx->dev, "%s: unsupported encode format fourcc=3D0x%x\n",
> > +			__func__, sfmt->pixelformat);
> > +		return -EINVAL;
> > +	}
> > +
> > +	switch (rval) {
> > +	case JPEG_ENCODE_MONO:
> > +	case JPEG_ENCODE_H1V1:
> > +	case JPEG_ENCODE_H2V1:
> > +		jpeg_rw_bits(jenc, offs->fe.vbpad_cfg, JMSK_FE_VBPAD_CFG_BLOCK_ROW,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0 DIV_ROUND_UP(sfmt->height, JPEG_MCU_BLOCK_=
8));
> > +		break;
> > +	case JPEG_ENCODE_H1V2:
> > +	case JPEG_ENCODE_H2V2:
> > +		jpeg_rw_bits(jenc, offs->fe.vbpad_cfg, JMSK_FE_VBPAD_CFG_BLOCK_ROW,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0 DIV_ROUND_UP(sfmt->height, JPEG_MCU_BLOCK_=
16));
> > +		break;
> > +	default:
> > +		dev_err(ectx->dev, "%s: unsupported encode format fourcc=3D0x%x\n", =
__func__, rval);
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (sfmt->pixelformat =3D=3D V4L2_PIX_FMT_NV21 || sfmt->pixelformat =
=3D=3D V4L2_PIX_FMT_NV61)
> > +		jpeg_rw_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_CBCR_ORDER, 1);
> > +	else
> > +		jpeg_rw_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_CBCR_ORDER, 0);
> > +
> > +	for (pln =3D 0; pln < sfmt->num_planes; pln++) {
> > +		if (sfmt->width && sfmt->height) {
> > +			switch (pln) {
> > +			case 0:
> > +				jpeg_rw_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_PLN0_EN, 1);
> > +				break;
> > +			case 1:
> > +				jpeg_rw_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_PLN1_EN, 1);
> > +				break;
> > +			case 2:
> > +				jpeg_rw_bits(jenc, offs->fe_cfg, JMSK_FE_CFG_PLN2_EN, 1);
> > +				break;
> > +			}
> > +		}
> > +	}
> > +
> > +	jpeg_rw_bits(jenc, offs->core_cfg, JMSK_CORE_CFG_FE_ENABLE, 1);
> > +
> > +	return 0;
> > +}
> > +
> > +static int jpeg_setup_fe(struct jenc_context *ectx, struct qcom_jenc_q=
ueue *q)
> > +{
> > +	int rc;
> > +
> > +	rc =3D jpeg_setup_fe_size(ectx, q);
> > +	if (rc)
> > +		return rc;
> > +
> > +	rc =3D jpeg_setup_fe_hinit(ectx, q);
> > +	if (rc)
> > +		return rc;
> > +
> > +	rc =3D jpeg_setup_fe_vinit(ectx, q);
> > +	if (rc)
> > +		return rc;
> > +
> > +	rc =3D jpeg_setup_fe_params(ectx, q);
> > +	if (rc)
> > +		return rc;
> > +
> > +	return 0;
> > +}
> > +
> > +static int jpeg_apply_we_addr(struct jenc_context *ectx, struct qcom_j=
enc_queue *q,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vb2_buffer *vb)
> > +{
> > +	struct qcom_jenc_dev *jenc =3D ectx->jenc;
> > +	const struct qcom_jpeg_reg_offs *offs =3D jenc->res->hw_offs;
> > +	struct qcom_jpeg_buff *frame =3D &q->buff[vb->index];
> > +	u8 pln =3D 0;
> > +
> > +	if (WARN_ON_ONCE(!frame->plns[pln].dma))
> > +		return -EPERM;
> > +
> > +	jpeg_io_write(jenc, offs->we.pntr[pln], frame->plns[pln].dma);
> > +
> > +	dev_dbg(jenc->dev, "%s: pln=3D%d addr=3D0x%llx idx:%d\n", __func__,
> > +		pln, frame->plns[pln].dma, vb->index);
> > +
> > +	q->buff_id =3D vb->index;
> > +
> > +	return 0;
> > +}
> > +
> > +static int jpeg_store_we_next(struct jenc_context *ectx, struct vb2_bu=
ffer *vb2)
> > +{
> > +	struct qcom_jenc_dev *jenc =3D ectx->jenc;
> > +	struct qcom_jenc_queue *q =3D &ectx->bufq[TYPE2QID(vb2->type)];
> > +	struct qcom_jpeg_buff *frame =3D &q->buff[vb2->index];
> > +	struct qc_jfif *mptr;
> > +	struct sg_table *sgt;
> > +	dma_addr_t dma;
> > +
> > +	sgt =3D vb2_dma_sg_plane_desc(vb2, 0);
> > +	if (WARN_ON_ONCE(!sgt || !sgt->sgl))
> > +		return -EINVAL;
> > +
> > +	dma =3D sg_dma_address(sgt->sgl);
> > +	if (WARN_ON_ONCE(!dma))
> > +		return -EINVAL;
> > +
> > +	mptr =3D vb2_plane_vaddr(vb2, 0);
> > +	if (WARN_ON_ONCE(!mptr))
> > +		return -EINVAL;
> > +
> > +	mutex_lock(&ectx->quality_mutex);
> > +	if (ectx->quality_programmed !=3D ectx->quality_requested)
> > +		jpeg_apply_dmi_table(ectx);
> > +	mutex_unlock(&ectx->quality_mutex);
> > +
> > +	dma +=3D qcom_jenc_header_emit(&ectx->hdr_cache, (void *)mptr,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 min_t(size_t, vb2->planes[0].length, ectx=
->hdr_cache.size),
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 q->vf.width, q->vf.height);
> > +	qcom_jenc_dqts_emit(&ectx->hdr_cache, (void *)mptr);
> > +
> > +	frame->plns[0].sgt	=3D sgt;
> > +	frame->plns[0].dma	=3D dma;
> > +	frame->plns[0].size	=3D vb2_plane_size(vb2, 0);
> > +
> > +	jpeg_dev_access(jenc->dev, frame, DMA_TO_DEVICE);
> > +
> > +	return 0;
> > +}
> > +
> > +static int jpeg_setup_we_size(struct jenc_context *ectx, struct qcom_j=
enc_queue *q)
> > +{
> > +	struct qcom_jenc_dev *jenc =3D ectx->jenc;
> > +	const struct qcom_jpeg_reg_offs *offs =3D jenc->res->hw_offs;
> > +	struct v4l2_pix_format_mplane *dfmt =3D &q->vf;
> > +	u8 pln;
> > +
> > +	if (!dfmt->plane_fmt[0].sizeimage) {
> > +		dev_err(ectx->dev, "%s: invalid destination buffer size=3D0\n", __fu=
nc__);
> > +		return -EINVAL;
> > +	}
> > +
> > +	for (pln =3D 0; pln < QCOM_JPEG_MAX_PLANES; pln++)
> > +		jpeg_rw_bits(jenc, offs->we.stride[pln], JMSK_PLNS_WR_STRIDE, 0);
> > +
> > +	jpeg_io_write(jenc, offs->we.bsize[0], dfmt->plane_fmt[0].sizeimage);
> > +
> > +	dev_dbg(ectx->dev, "%s: ctx=3D%p size=3D%u\n", __func__,
> > +		ectx, dfmt->plane_fmt[0].sizeimage);
> > +
> > +	return 0;
> > +}
> > +
> > +static int jpeg_setup_we_hinit(struct jenc_context *ectx, struct qcom_=
jenc_queue *q)
> > +{
> > +	struct qcom_jenc_dev *jenc =3D ectx->jenc;
> > +	const struct qcom_jpeg_reg_offs *offs =3D jenc->res->hw_offs;
> > +	struct v4l2_pix_format_mplane *dfmt =3D &q->vf;
> > +	u8 pln;
> > +
> > +	if (!dfmt->width) {
> > +		dev_err(ectx->dev, "%s: invalid destination width=3D%d\n", __func__,=
 dfmt->width);
> > +		return -EINVAL;
> > +	}
> > +
> > +	for (pln =3D 0; pln < QCOM_JPEG_MAX_PLANES; pln++) {
> > +		jpeg_rw_bits(jenc, offs->we.hinit[pln], JMSK_PLNS_WR_HINIT, 0);
> > +		jpeg_rw_bits(jenc, offs->we.hstep[pln], JMSK_PLNS_WR_HSTEP, 0);
> > +	}
> > +
> > +	jpeg_rw_bits(jenc, offs->we.hstep[0], JMSK_PLNS_WR_HSTEP, dfmt->width=
);
> > +
> > +	dev_dbg(ectx->dev, "%s: ctx=3D%p hstep=3D%u\n", __func__, ectx,
> > +		jpeg_rd_bits(jenc, offs->we.hstep[0], JMSK_PLNS_WR_HSTEP));
> > +
> > +	return 0;
> > +}
> > +
> > +static int jpeg_setup_we_vinit(struct jenc_context *ectx, struct qcom_=
jenc_queue *q)
> > +{
> > +	struct qcom_jenc_dev *jenc =3D ectx->jenc;
> > +	const struct qcom_jpeg_reg_offs *offs =3D jenc->res->hw_offs;
> > +	struct v4l2_pix_format_mplane *dfmt =3D &q->vf;
> > +	u8 pln;
> > +
> > +	if (!dfmt->height) {
> > +		dev_err(ectx->dev, "%s: invalid destination height=3D%d\n", __func__=
, dfmt->height);
> > +		return -EINVAL;
> > +	}
> > +
> > +	for (pln =3D 0; pln < QCOM_JPEG_MAX_PLANES; pln++) {
> > +		jpeg_rw_bits(jenc, offs->we.vinit[pln], JMSK_PLNS_WR_VINIT, 0);
> > +		jpeg_rw_bits(jenc, offs->we.vstep[pln], JMSK_PLNS_WR_VSTEP, 0);
> > +	}
> > +
> > +	jpeg_rw_bits(jenc, offs->we.vstep[0], JMSK_PLNS_WR_VSTEP, dfmt->heigh=
t);
> > +
> > +	dev_dbg(ectx->dev, "%s: ctx=3D%p vstep=3D%u\n", __func__, ectx,
> > +		jpeg_rd_bits(jenc, offs->we.vstep[0], JMSK_PLNS_WR_VSTEP));
> > +
> > +	return 0;
> > +}
> > +
> > +static int jpeg_setup_we_params(struct jenc_context *ectx, struct qcom=
_jenc_queue *q)
> > +{
> > +	struct qcom_jenc_dev *jenc =3D ectx->jenc;
> > +	const struct qcom_jpeg_reg_offs *offs =3D jenc->res->hw_offs;
> > +	struct v4l2_pix_format_mplane *dfmt =3D &q->vf;
> > +	u32 blk_w, blk_h, mcu_cols, mcu_rows;
> > +	int rval;
> > +
> > +	rval =3D jpeg_get_memory_fmt(dfmt->pixelformat);
> > +	if (rval < 0) {
> > +		dev_err(ectx->dev, "%s: invalid memory format for v4l2 format:0x%x\n=
",
> > +			__func__, dfmt->pixelformat);
> > +		return -EINVAL;
> > +	}
> > +	jpeg_rw_bits(jenc, offs->we_cfg, JMSK_WE_CFG_MEMORY_FORMAT, rval);
> > +
> > +	rval =3D jpeg_get_mal_boundary(dfmt->width, jpeg_mal_bounds, ARRAY_SI=
ZE(jpeg_mal_bounds));
> > +	if (rval < 0) {
> > +		dev_err(ectx->dev, "%s: failed to get WE mal boundary width=3D%u\n",
> > +			__func__, dfmt->width);
> > +		return -EINVAL;
> > +	}
> > +	jpeg_rw_bits(jenc, offs->we_cfg, JMSK_WE_CFG_MAL_BOUNDARY, rval);
> > +
> > +	dev_dbg(ectx->dev, "%s: optimal WE mal boundary=3D%d\n", __func__,
> > +		jpeg_rd_bits(jenc, offs->we_cfg, JMSK_WE_CFG_MAL_BOUNDARY));
> > +
> > +	rval =3D jpeg_get_encode_fmt(dfmt->pixelformat);
> > +	if (rval < 0) {
> > +		dev_err(ectx->dev, "%s: unsupported encode format fourcc=3D0x%x\n",
> > +			__func__, dfmt->pixelformat);
> > +		return rval;
> > +	}
> > +
> > +	rval =3D jpeg_get_mcu_geometry(rval, dfmt->width, dfmt->height, &blk_=
w, &blk_h,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 &mcu_cols, &mcu_rows);
> > +	if (rval < 0) {
> > +		dev_err(ectx->dev, "%s: invalid MCU geometry mcu_cols=3D%d mcu_rows=
=3D%d\n",
> > +			__func__, mcu_cols, mcu_rows);
> > +		return rval;
> > +	}
> > +
> > +	dev_dbg(ectx->dev, "%s blk_w=3D%u blk_h=3D%u cols=3D%u rows=3D%u\n", =
__func__,
> > +		blk_w, blk_h, mcu_cols, mcu_rows);
> > +
> > +	jpeg_rw_bits(jenc, offs->we.blocks[0], JMSK_PLNS_WR_BLOCK_CFG_PER_RAW=
, mcu_rows - 1);
> > +	jpeg_rw_bits(jenc, offs->we.blocks[0], JMSK_PLNS_WR_BLOCK_CFG_PER_COL=
, mcu_cols - 1);
> > +
> > +	jpeg_rw_bits(jenc, offs->we_cfg, JMSK_WE_CFG_CBCR_ORDER, 1);
> > +	jpeg_rw_bits(jenc, offs->we_cfg, JMSK_WE_CFG_MAL_EN, 1);
> > +	jpeg_rw_bits(jenc, offs->we_cfg, JMSK_WE_CFG_POP_BUFF_ON_EOS, 1);
> > +	jpeg_rw_bits(jenc, offs->we_cfg, JMSK_WE_CFG_PLN0_EN, 1);
> > +
> > +	jpeg_rw_bits(jenc, offs->core_cfg, JMSK_CORE_CFG_MODE, 1);
> > +	jpeg_rw_bits(jenc, offs->core_cfg, JMSK_CORE_CFG_WE_ENABLE, 1);
> > +
> > +	return 0;
> > +}
> > +
> > +static int jpeg_setup_we(struct jenc_context *ectx, struct qcom_jenc_q=
ueue *q)
> > +{
> > +	int rc;
> > +
> > +	rc =3D jpeg_setup_we_size(ectx, q);
> > +	if (rc)
> > +		return rc;
> > +
> > +	rc =3D jpeg_setup_we_hinit(ectx, q);
> > +	if (rc)
> > +		return rc;
> > +
> > +	rc =3D jpeg_setup_we_vinit(ectx, q);
> > +	if (rc)
> > +		return rc;
> > +
> > +	return jpeg_setup_we_params(ectx, q);
> > +}
> > +
> > +static int jpeg_setup_scale(struct jenc_context *ectx)
> > +{
> > +	struct qcom_jenc_dev *jenc =3D ectx->jenc;
> > +	const struct qcom_jpeg_reg_offs *offs =3D jenc->res->hw_offs;
> > +	struct qcom_jenc_queue *sq =3D &ectx->bufq[JENC_SRC_QUEUE];
> > +	struct qcom_jenc_queue *dq =3D &ectx->bufq[JENC_DST_QUEUE];
> > +	struct v4l2_pix_format_mplane *sfmt =3D &sq->vf;
> > +	struct v4l2_pix_format_mplane *dfmt =3D &dq->vf;
> > +	u32 blk_w, blk_h, mcu_cols, mcu_rows;
> > +	int rval;
> > +	u8 pln;
> > +
> > +	jpeg_rw_bits(jenc, offs->reset_cmd, JMSK_RST_CMD_SCALE_RESET, 1);
> > +
> > +	/* explicit no scaling */
> > +	jpeg_rw_bits(jenc, offs->scale_cfg, JMSK_SCALE_CFG_HSCALE_ENABLE, 0);
> > +	jpeg_rw_bits(jenc, offs->scale_cfg, JMSK_SCALE_CFG_VSCALE_ENABLE, 0);
> > +
> > +	for (pln =3D 0; pln < QCOM_JPEG_MAX_PLANES; pln++) {
> > +		jpeg_io_write(jenc, offs->scale.hstep[pln], JPEG_DEFAULT_SCALE_STEP)=
;
> > +		jpeg_io_write(jenc, offs->scale.vstep[pln], JPEG_DEFAULT_SCALE_STEP)=
;
> > +	}
> > +
> > +	if (jpeg_rd_bits(jenc, offs->scale_cfg, JMSK_SCALE_CFG_HSCALE_ENABLE)=
) {
> > +		for (pln =3D 0; pln < sq->vf.num_planes; pln++) {
> > +			jpeg_rw_bits(jenc, offs->scale.hstep[pln],
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 JMSK_SCALE_PLNS_HSTEP_INTEGER,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 jpeg_calc_scale_int(sfmt->width, dfmt->wi=
dth));
> > +			jpeg_rw_bits(jenc, offs->scale.hstep[pln],
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 JMSK_SCALE_PLNS_HSTEP_FRACTIONAL,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 jpeg_calc_scale_frac(sfmt->width, dfmt->w=
idth));
> > +
> > +			dev_dbg(ectx->dev, "%s: ctx=3D%p hint=3D%d hfrac=3D%d\n",
> > +				__func__, ectx,
> > +				jpeg_rd_bits(jenc, offs->scale.hstep[pln],
> > +					=C2=A0=C2=A0=C2=A0=C2=A0 JMSK_SCALE_PLNS_HSTEP_INTEGER),
> > +				jpeg_rd_bits(jenc, offs->scale.hstep[pln],
> > +					=C2=A0=C2=A0=C2=A0=C2=A0 JMSK_SCALE_PLNS_HSTEP_FRACTIONAL));
> > +		}
> > +	}
> > +
> > +	if (jpeg_rd_bits(jenc, offs->scale_cfg, JMSK_SCALE_CFG_VSCALE_ENABLE)=
) {
> > +		for (pln =3D 0; pln < sq->vf.num_planes; pln++) {
> > +			jpeg_rw_bits(jenc, offs->scale.vstep[pln],
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 JMSK_SCALE_PLNS_VSTEP_INTEGER,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 jpeg_calc_scale_int(sfmt->height, dfmt->h=
eight));
> > +			jpeg_rw_bits(jenc, offs->scale.vstep[pln],
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 JMSK_SCALE_PLNS_VSTEP_FRACTIONAL,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 jpeg_calc_scale_frac(sfmt->height, dfmt->=
height));
> > +
> > +			dev_dbg(ectx->dev, "%s: ctx=3D%p vint=3D%d vfrac=3D%d\n",
> > +				__func__, ectx,
> > +				jpeg_rd_bits(jenc, offs->scale.vstep[pln],
> > +					=C2=A0=C2=A0=C2=A0=C2=A0 JMSK_SCALE_PLNS_VSTEP_INTEGER),
> > +				jpeg_rd_bits(jenc, offs->scale.vstep[pln],
> > +					=C2=A0=C2=A0=C2=A0=C2=A0 JMSK_SCALE_PLNS_VSTEP_FRACTIONAL));
> > +		}
> > +	}
> > +
> > +	rval =3D jpeg_get_encode_fmt(sfmt->pixelformat);
> > +	if (rval < 0) {
> > +		dev_err(ectx->dev, "%s: unsupported encode format fourcc=3D0x%x\n",
> > +			__func__, sfmt->pixelformat);
> > +		return -EINVAL;
> > +	}
> > +
> > +	rval =3D jpeg_get_mcu_geometry(rval, dfmt->width, dfmt->height, &blk_=
w, &blk_h,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 &mcu_cols, &mcu_rows);
> > +	if (rval < 0) {
> > +		dev_err(ectx->dev, "%s: invalid MCU geometry blk_w=3D%d blk_h=3D%d\n=
",
> > +			__func__, blk_w, blk_h);
> > +		return -EINVAL;
> > +	}
> > +
> > +	dev_dbg(ectx->dev, "%s blk_w=3D%u blk_h=3D%u cols=3D%u rows=3D%u\n", =
__func__, blk_w, blk_h,
> > +		mcu_cols, mcu_rows);
> > +
> > +	for (pln =3D 0; pln < sq->vf.num_planes; pln++) {
> > +		jpeg_rw_bits(jenc, offs->scale_out_cfg[pln],
> > +			=C2=A0=C2=A0=C2=A0=C2=A0 JMSK_SCALE_PLNS_OUT_CFG_BLK_WIDTH, mcu_col=
s - 1);
> > +		jpeg_rw_bits(jenc, offs->scale_out_cfg[pln],
> > +			=C2=A0=C2=A0=C2=A0=C2=A0 JMSK_SCALE_PLNS_OUT_CFG_BLK_HEIGHT, mcu_ro=
ws - 1);
> > +	}
> > +
> > +	dev_dbg(ectx->dev, "%s: ctx=3D%p scale src=3D%ux%u dst=3D%ux%u enable=
=3D%d/%d\n",
> > +		__func__, ectx, sfmt->width, sfmt->height, dfmt->width, dfmt->height=
,
> > +		jpeg_rd_bits(jenc, offs->scale_cfg, JMSK_SCALE_CFG_HSCALE_ENABLE),
> > +		jpeg_rd_bits(jenc, offs->scale_cfg, JMSK_SCALE_CFG_VSCALE_ENABLE));
> > +
> > +	/* Disabled, but must be configured */
> > +	jpeg_rw_bits(jenc, offs->core_cfg, JMSK_CORE_CFG_SCALE_ENABLE, 0);
> > +
> > +	return 0;
> > +}
> > +
> > +static int jpeg_setup_encode(struct jenc_context *ectx)
> > +{
> > +	struct qcom_jenc_dev *jenc =3D ectx->jenc;
> > +	struct qcom_jenc_queue *sq =3D &ectx->bufq[JENC_SRC_QUEUE];
> > +	struct v4l2_pix_format_mplane *sfmt =3D &sq->vf;
> > +	const struct qcom_jpeg_reg_offs *offs =3D jenc->res->hw_offs;
> > +	u32 blk_w, blk_h, mcu_cols, mcu_rows;
> > +	int rval;
> > +
> > +	if (!sfmt->width || !sfmt->height)
> > +		return -EINVAL;
> > +
> > +	jpeg_rw_bits(jenc, offs->reset_cmd, JMSK_RST_CMD_ENCODER_RESET, 1);
> > +
> > +	rval =3D jpeg_get_encode_fmt(sfmt->pixelformat);
> > +	if (rval < 0) {
> > +		dev_err(ectx->dev, "%s: unsupported encode format fourcc=3D0x%x\n",
> > +			__func__, sfmt->pixelformat);
> > +		return -EINVAL;
> > +	}
> > +	jpeg_rw_bits(jenc, offs->enc_cfg, JMSK_ENC_CFG_IMAGE_FORMAT, rval);
> > +
> > +	rval =3D jpeg_get_mcu_geometry(rval, sfmt->width, sfmt->height, &blk_=
w, &blk_h,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 &mcu_cols, &mcu_rows);
> > +	if (rval < 0) {
> > +		dev_err(ectx->dev, "%s: invalid MCU geometry mcu_cols=3D%d mcu_rows=
=3D%d\n",
> > +			__func__, mcu_cols, mcu_rows);
> > +		return -EINVAL;
> > +	}
> > +
> > +	dev_dbg(ectx->dev, "%s blk_w=3D%u blk_h=3D%u cols=3D%u rows=3D%u\n", =
__func__,
> > +		blk_w, blk_h, mcu_cols, mcu_rows);
> > +
> > +	jpeg_rw_bits(jenc, offs->enc_img_size, JMSK_ENC_IMAGE_SIZE_WIDTH, mcu=
_cols - 1);
> > +	jpeg_rw_bits(jenc, offs->enc_img_size, JMSK_ENC_IMAGE_SIZE_HEIGHT, mc=
u_rows - 1);
> > +
> > +	dev_dbg(ectx->dev, "%s: ctx=3D%p width=3D%d height=3D%d\n", __func__,=
 ectx,
> > +		jpeg_rd_bits(jenc, offs->enc_img_size, JMSK_ENC_IMAGE_SIZE_WIDTH),
> > +		jpeg_rd_bits(jenc, offs->enc_img_size, JMSK_ENC_IMAGE_SIZE_HEIGHT));
> > +
> > +	jpeg_rw_bits(jenc, offs->enc_cfg, JMSK_ENC_CFG_APPLY_EOI, 1);
> > +	jpeg_rw_bits(jenc, offs->core_cfg, JMSK_CORE_CFG_ENC_ENABLE, 1);
> > +
> > +	return 0;
> > +}
> > +
> > +static irqreturn_t op_jpeg_irq_bot(int irq, void *data)
> > +{
> > +	struct qcom_jenc_dev *jenc =3D data;
> > +	const struct qcom_jpeg_reg_offs *offs =3D jenc->res->hw_offs;
> > +	u32 irq_status;
> > +	u32 irq_mask;
> > +	unsigned long flags;
> > +	int rc;
> > +
> > +	rc =3D kfifo_out_spinlocked(&jenc->kfifo_inst, &irq_status, sizeof(ir=
q_status),
> > +				=C2=A0 &jenc->kfifo_lock);
> > +	if (rc !=3D sizeof(irq_status)) {
> > +		dev_err(jenc->dev, "IRQ status: FIFO empty\n");
> > +		return IRQ_HANDLED;
> > +	}
> > +
> > +	irq_mask =3D jenc->res->hw_mask[JMSK_IRQ_STATUS_SESSION_DONE];
> > +	if (jpeg_bits_get(irq_mask, irq_status)) {
> > +		struct jenc_context *ctx =3D jenc->actx;
> > +		struct qcom_jenc_queue *dq =3D &ctx->bufq[JENC_DST_QUEUE];
> > +		size_t out_size;
> > +
> > +		spin_lock_irqsave(&jenc->hw_lock, flags);
> > +		jenc->actx =3D NULL;
> > +		spin_unlock_irqrestore(&jenc->hw_lock, flags);
> > +
> > +		if (ctx && dq->buff_id >=3D 0) {
> > +			struct qcom_jpeg_buff *frame;
> > +			unsigned long flags;
> > +
> > +			spin_lock_irqsave(&jenc->hw_lock, flags);
> > +			frame =3D &dq->buff[dq->buff_id];
> > +			out_size =3D jpeg_io_read(jenc, offs->enc_out_size);
> > +			spin_unlock_irqrestore(&jenc->hw_lock, flags);
> > +
> > +			dev_dbg(jenc->dev, "complete idx:%d addr=3D0x%llx size=3D%zu\n",
> > +				dq->buff_id, frame->plns[0].dma, out_size);
> > +
> > +			jpeg_cpu_access(jenc->dev, frame, DMA_FROM_DEVICE);
> > +			jenc->enc_hw_irq_cb(ctx, VB2_BUF_STATE_DONE,
> > +					=C2=A0=C2=A0=C2=A0 out_size + JPEG_HEADER_MAX);
> > +			jpeg_stop(jenc);
> > +		}
> > +	}
> > +
> > +	irq_mask =3D jenc->res->hw_mask[JMSK_IRQ_STATUS_SESSION_ERROR];
> > +	if (jpeg_bits_get(irq_mask, irq_status)) {
> > +		struct jenc_context *ctx =3D jenc->actx;
> > +
> > +		spin_lock_irqsave(&jenc->hw_lock, flags);
> > +		jenc->actx =3D NULL;
> > +		spin_unlock_irqrestore(&jenc->hw_lock, flags);
> > +
> > +		dev_err(jenc->dev, "encoder hardware failure=3D0x%x\n",
> > +			jpeg_bits_get(JMSK_IRQ_STATUS_SESSION_ERROR, irq_status));
> > +		if (ctx)
> > +			jenc->enc_hw_irq_cb(ctx, VB2_BUF_STATE_ERROR, 0);
> > +
> > +		jpeg_stop(jenc);
> > +	}
> > +
> > +	return IRQ_HANDLED;
> > +}
> > +
> > +static irqreturn_t op_jpeg_irq_top(int irq, void *data)
> > +{
> > +	struct qcom_jenc_dev *jenc =3D data;
> > +	const struct qcom_jpeg_reg_offs *offs =3D jenc->res->hw_offs;
> > +	u32 irq_status;
> > +	u32 irq_mask;
> > +	unsigned long flags;
> > +	int rc;
> > +
> > +	spin_lock_irqsave(&jenc->hw_lock, flags);
> > +
> > +	irq_status =3D jpeg_io_read(jenc, offs->int_status);
> > +	jpeg_wo_bits(jenc, offs->int_clr, JMSK_IRQ_CLEAR_ALL, irq_status);
> > +
> > +	irq_mask =3D jenc->res->hw_mask[JMSK_IRQ_STATUS_RESET_ACK];
> > +	if (jpeg_bits_get(irq_mask, irq_status)) {
> > +		complete(&jenc->reset_complete);
> > +		spin_unlock_irqrestore(&jenc->hw_lock, flags);
> > +		return IRQ_HANDLED;
> > +	}
> > +
> > +	irq_mask =3D jenc->res->hw_mask[JMSK_IRQ_STATUS_STOP_ACK];
> > +	if (jpeg_bits_get(irq_mask, irq_status)) {
> > +		complete(&jenc->stop_complete);
> > +		dev_dbg(jenc->dev, "hardware stop acknowledged\n");
> > +		spin_unlock_irqrestore(&jenc->hw_lock, flags);
> > +		return IRQ_HANDLED;
> > +	}
> > +
> > +	rc =3D kfifo_in(&jenc->kfifo_inst, &irq_status, sizeof(irq_status));
> > +	if (rc !=3D sizeof(irq_status))
> > +		dev_err(jenc->dev, "IRQ status: FIFO full\n");
> > +
> > +	spin_unlock_irqrestore(&jenc->hw_lock, flags);
> > +
> > +	return IRQ_WAKE_THREAD;
> > +}
> > +
> > +static void op_jpeg_get_hw_caps(struct qcom_jenc_dev *jenc, u32 *caps)
> > +{
> > +	const struct qcom_jpeg_reg_offs *offs =3D jenc->res->hw_offs;
> > +	u32 hw_caps;
> > +
> > +	hw_caps =3D jpeg_io_read(jenc, offs->hw_capability);
> > +	dev_dbg(jenc->dev, "CAPS: encode=3D%d decode=3D%d upscale=3D%d downsc=
ale=3D%d\n",
> > +		jpeg_bits_get(jenc->res->hw_mask[JMSK_HW_CAP_ENCODE], hw_caps),
> > +		jpeg_bits_get(jenc->res->hw_mask[JMSK_HW_CAP_DECODE], hw_caps),
> > +		jpeg_bits_get(jenc->res->hw_mask[JMSK_HW_CAP_UPSCALE], hw_caps),
> > +		jpeg_bits_get(jenc->res->hw_mask[JMSK_HW_CAP_DOWNSCALE], hw_caps));
> > +
> > +	*caps =3D hw_caps;
> > +}
> > +
> > +static struct qcom_jenc_queue *op_jpeg_get_buff_queue(struct jenc_cont=
ext *ectx,
> > +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum qcom_enc_qid id)
> > +{
> > +	return &ectx->bufq[id];
> > +}
> > +
> > +static int op_jpeg_queue_setup(struct jenc_context *ectx, enum qcom_en=
c_qid id)
> > +{
> > +	int rc;
> > +
> > +	if (id =3D=3D JENC_SRC_QUEUE) {
> > +		struct qcom_jenc_queue *q =3D &ectx->bufq[id];
> > +
> > +		rc =3D qcom_jenc_header_init(&ectx->hdr_cache, q->vf.pixelformat);
> > +		if (rc) {
> > +			dev_err(ectx->dev, "JFIF header init failed\n");
> > +			return rc;
> > +		}
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int op_jpeg_buffer_prepare(struct jenc_context *ectx, struct vb=
2_buffer *vb2)
> > +{
> > +	int rc;
> > +
> > +	if (V4L2_TYPE_IS_OUTPUT(vb2->type)) {
> > +		rc =3D jpeg_store_fe_next(ectx, vb2);
> > +		if (rc)
> > +			dev_err(ectx->dev, "%s: cannot set up fetch addr\n", __func__);
> > +	} else {
> > +		rc =3D jpeg_store_we_next(ectx, vb2);
> > +		if (rc)
> > +			dev_err(ectx->dev, "%s: cannot set up write addr\n", __func__);
> > +	}
> > +
> > +	return rc;
> > +}
> > +
> > +static int op_jpeg_process_exec(struct qcom_jenc_dev *jenc, struct jen=
c_context *ectx,
> > +				struct vb2_buffer *vb)
> > +{
> > +	struct qcom_jenc_queue *sq =3D &ectx->bufq[JENC_SRC_QUEUE];
> > +	struct qcom_jenc_queue *dq =3D &ectx->bufq[JENC_DST_QUEUE];
> > +	unsigned long flags;
> > +	int rc;
> > +
> > +	spin_lock_irqsave(&jenc->hw_lock, flags);
> > +	jenc->actx =3D ectx;
> > +	spin_unlock_irqrestore(&jenc->hw_lock, flags);
> > +
> > +	if (V4L2_TYPE_IS_OUTPUT(vb->type)) {
> > +		rc =3D jpeg_setup_fe(ectx, sq);
> > +		if (rc)
> > +			return rc;
> > +
> > +		jpeg_apply_fe_addr(ectx, sq, vb);
> > +
> > +	} else {
> > +		rc =3D jpeg_setup_we(ectx, dq);
> > +		if (rc)
> > +			return rc;
> > +
> > +		jpeg_apply_we_addr(ectx, dq, vb);
> > +	}
> > +
> > +	if (sq->sequence =3D=3D dq->sequence) {
> > +		rc =3D jpeg_setup_scale(ectx);
> > +		if (rc)
> > +			return rc;
> > +
> > +		rc =3D jpeg_setup_encode(ectx);
> > +		if (rc)
> > +			return rc;
> > +
> > +		jpeg_exec(jenc);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int op_jpeg_prepare(struct qcom_jenc_dev *jenc)
> > +{
> > +	const struct qcom_jpeg_reg_offs *offs =3D jenc->res->hw_offs;
> > +
> > +	jpeg_rw_bits(jenc, offs->reset_cmd, JMSK_RST_CMD_DECODER_RESET, 1);
> > +	jpeg_rw_bits(jenc, offs->reset_cmd, JMSK_RST_CMD_BLOCK_FORMATTER_RST,=
 1);
> > +	jpeg_rw_bits(jenc, offs->reset_cmd, JMSK_RST_CMD_CORE_RESET, 1);
> > +
> > +	return 0;
> > +}
> > +
> > +static int op_jpeg_acquire(struct jenc_context *ectx, struct vb2_queue=
 *q)
> > +{
> > +	struct qcom_jenc_dev *jenc =3D ectx->jenc;
> > +	struct qcom_jenc_queue *sq, *dq;
> > +	int rc;
> > +
> > +	if (atomic_inc_return(&jenc->ref_count) =3D=3D 1) {
> > +		rc =3D pm_runtime_resume_and_get(jenc->dev);
> > +		if (rc < 0) {
> > +			dev_err(jenc->dev, "PM runtime get failed\n");
> > +			atomic_dec(&jenc->ref_count);
> > +			return rc;
> > +		}
> > +
> > +		rc =3D jpeg_init(jenc);
> > +		if (rc) {
> > +			dev_err(jenc->dev, "hardware init failed\n");
> > +			atomic_dec(&jenc->ref_count);
> > +			pm_runtime_put(jenc->dev);
> > +			return rc;
> > +		}
> > +
> > +		sq =3D &ectx->bufq[JENC_SRC_QUEUE];
> > +		sq->sequence =3D 0;
> > +		sq->buff_id=C2=A0=C2=A0 =3D -1;
> > +		dq =3D &ectx->bufq[JENC_DST_QUEUE];
> > +		dq->sequence =3D 0;
> > +		dq->buff_id=C2=A0=C2=A0 =3D -1;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int op_jpeg_release(struct jenc_context *ectx, struct vb2_queue=
 *q)
> > +{
> > +	struct qcom_jenc_dev *jenc =3D ectx->jenc;
> > +	int rc;
> > +
> > +	if (!atomic_dec_if_positive(&jenc->ref_count)) {
> > +		rc =3D jpeg_deinit(jenc);
> > +		if (rc)
> > +			dev_err(jenc->dev, "hardware exit failed\n");
> > +
> > +		rc =3D=C2=A0 pm_runtime_put_sync(jenc->dev);
> > +		if (rc < 0)
> > +			dev_err(jenc->dev, "PM runtime put failed\n");
> > +
> > +		dev_dbg(jenc->dev, "JPEG HW encoder released\n");
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +const struct qcom_jpeg_hw_ops qcom_jpeg_default_ops =3D {
> > +	.hw_get_cap	=3D op_jpeg_get_hw_caps,
> > +	.hw_acquire	=3D op_jpeg_acquire,
> > +	.hw_release	=3D op_jpeg_release,
> > +	.hw_prepare	=3D op_jpeg_prepare,
> > +	.get_queue	=3D op_jpeg_get_buff_queue,
> > +	.queue_setup	=3D op_jpeg_queue_setup,
> > +	.buf_prepare	=3D op_jpeg_buffer_prepare,
> > +	.process_exec	=3D op_jpeg_process_exec,
> > +	.hw_irq_top	=3D op_jpeg_irq_top,
> > +	.hw_irq_bot	=3D op_jpeg_irq_bot
> > +};
> > diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_ops.h b/drivers=
/media/platform/qcom/jpeg/qcom_jenc_ops.h
> > new file mode 100644
> > index 000000000000..751a045a3486
> > --- /dev/null
> > +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_ops.h
> > @@ -0,0 +1,49 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +
> > +#ifndef QCOM_JENC_OPS_H
> > +#define QCOM_JENC_OPS_H
> > +
> > +#include <linux/types.h>
> > +#include <linux/device.h>
> > +#include <media/videobuf2-core.h>
> > +
> > +#include "qcom_jenc_dev.h"
> > +
> > +/*
> > + * JENC encoder hardware operations.
> > + */
> > +struct qcom_jpeg_hw_ops {
> > +	void (*hw_get_cap)
> > +		(struct qcom_jenc_dev *jenc_dev, u32 *hw_caps);
> > +
> > +	int (*hw_acquire)
> > +		(struct jenc_context *ectx, struct vb2_queue *queue);
> > +
> > +	int (*hw_release)
> > +		(struct jenc_context *ectx, struct vb2_queue *queue);
> > +
> > +	int (*hw_prepare)
> > +		(struct qcom_jenc_dev *jenc);
> > +
> > +	struct qcom_jenc_queue * (*get_queue)
> > +		(struct jenc_context *ectx, enum qcom_enc_qid id);
> > +
> > +	int (*queue_setup)
> > +		(struct jenc_context *ectx, enum qcom_enc_qid id);
> > +
> > +	int (*buf_prepare)
> > +		(struct jenc_context *ectx, struct vb2_buffer *vb2);
> > +
> > +	int (*process_exec)
> > +		(struct qcom_jenc_dev *jenc, struct jenc_context *ectx, struct vb2_b=
uffer *vb2);
> > +
> > +	irqreturn_t (*hw_irq_top)(int irq_num, void *data);
> > +	irqreturn_t (*hw_irq_bot)(int irq_num, void *data);
> > +};
> > +
> > +extern const struct qcom_jpeg_hw_ops qcom_jpeg_default_ops;
> > +
> > +#endif /* QCOM_JENC_OPS_H */
> > diff --git a/drivers/media/platform/qcom/jpeg/qcom_jenc_res.c b/drivers=
/media/platform/qcom/jpeg/qcom_jenc_res.c
> > new file mode 100644
> > index 000000000000..c935ea690837
> > --- /dev/null
> > +++ b/drivers/media/platform/qcom/jpeg/qcom_jenc_res.c
> > @@ -0,0 +1,268 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +
> > +#include <linux/clk.h>
> > +
> > +#include "qcom_jenc_ops.h"
> > +#include "qcom_jenc_res.h"
> > +
> > +#include "qcom_v165_jenc_hw_info.h"
> > +#include "qcom_v580_jenc_hw_info.h"
> > +#include "qcom_v680_jenc_hw_info.h"
> > +#include "qcom_v780_jenc_hw_info.h"
> > +
> > +#define QCOM_PERF_ROW(_axi_rate, _jpeg_rate) \
> > +{ \
> > +	.clk_rate =3D { \
> > +		[JPEG_CAMNOC_AXI_CLK]	=3D (_axi_rate),	\
> > +		[JPEG_CORE_CLK]		=3D (_jpeg_rate),	\
> > +	}, \
> > +}
> > +
> > +/*
> > + * Baseline AXI clock rates shared across v165/v580, reused by later
> > + * derivatives where the hardware does not change these domains.
> > + */
> > +static const u64 cnoc_axi_clk_base[] =3D {
> > +	[QCOM_SOC_PERF_SUSPEND]	=3D=C2=A0 19200000,
> > +	[QCOM_SOC_PERF_LOWSVS]	=3D 300000000,
> > +	[QCOM_SOC_PERF_SVS]	=3D 300000000,
> > +	[QCOM_SOC_PERF_SVS_L1]	=3D 300000000,
> > +	[QCOM_SOC_PERF_NOMINAL]	=3D 400000000,
> > +	[QCOM_SOC_PERF_TURBO]	=3D 400000000,
> > +};
> > +
> > +/*
> > + * Derivative with an improved CAMNOC AXI frequency range
> > + */
> > +static const u64 cnoc_axi_clk_v680[] =3D {
> > +	[QCOM_SOC_PERF_SUSPEND]	=3D=C2=A0 19200000,
> > +	[QCOM_SOC_PERF_LOWSVS]	=3D 150000000,
> > +	[QCOM_SOC_PERF_SVS]	=3D 240000000,
> > +	[QCOM_SOC_PERF_SVS_L1]	=3D 320000000,
> > +	[QCOM_SOC_PERF_NOMINAL]	=3D 400000000,
> > +	[QCOM_SOC_PERF_TURBO]	=3D 480000000,
> > +};
> > +
> > +/*
> > + * Baseline JPEG clock rates shared across v165/v680, reused by later
> > + * derivatives where the hardware does not change these domains.
> > + */
> > +static const u64 qcom_jpeg_clk_base[] =3D {
> > +	[QCOM_SOC_PERF_SUSPEND]	=3D=C2=A0 19200000,
> > +	[QCOM_SOC_PERF_LOWSVS]	=3D 300000000,
> > +	[QCOM_SOC_PERF_SVS]	=3D 400000000,
> > +	[QCOM_SOC_PERF_SVS_L1]	=3D 480000000,
> > +	[QCOM_SOC_PERF_NOMINAL]	=3D 600000000,
> > +	[QCOM_SOC_PERF_TURBO]	=3D 600000000,
> > +};
> > +
> > +/*
> > + * Derivative with an improved maximum JPEG frequency
> > + */
> > +static const u64 qcom_jpeg_clk_v780[] =3D {
> > +	[QCOM_SOC_PERF_SUSPEND]	=3D=C2=A0 19200000,
> > +	[QCOM_SOC_PERF_LOWSVS]	=3D 200000000,
> > +	[QCOM_SOC_PERF_SVS]	=3D 200000000,
> > +	[QCOM_SOC_PERF_SVS_L1]	=3D 400000000,
> > +	[QCOM_SOC_PERF_NOMINAL]	=3D 480000000,
> > +	[QCOM_SOC_PERF_TURBO]	=3D 785000000,
> > +};
> > +
> > +static const struct qcom_perf_resource qcom_perf_rates_base[] =3D {
> > +	[QCOM_SOC_PERF_SUSPEND]	=3D
> > +		QCOM_PERF_ROW(cnoc_axi_clk_base[QCOM_SOC_PERF_SUSPEND],
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qcom_jpeg_clk_base[QCOM_SOC_PERF_SUS=
PEND]),
> > +
> > +	[QCOM_SOC_PERF_LOWSVS]		=3D
> > +		QCOM_PERF_ROW(cnoc_axi_clk_base[QCOM_SOC_PERF_LOWSVS],
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qcom_jpeg_clk_base[QCOM_SOC_PERF_LOW=
SVS]),
> > +
> > +	[QCOM_SOC_PERF_SVS]		=3D
> > +		QCOM_PERF_ROW(cnoc_axi_clk_base[QCOM_SOC_PERF_SVS],
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qcom_jpeg_clk_base[QCOM_SOC_PERF_SVS=
]),
> > +
> > +	[QCOM_SOC_PERF_SVS_L1]		=3D
> > +		QCOM_PERF_ROW(cnoc_axi_clk_base[QCOM_SOC_PERF_SVS_L1],
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qcom_jpeg_clk_base[QCOM_SOC_PERF_SVS=
_L1]),
> > +
> > +	[QCOM_SOC_PERF_NOMINAL]	=3D
> > +		QCOM_PERF_ROW(cnoc_axi_clk_base[QCOM_SOC_PERF_NOMINAL],
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qcom_jpeg_clk_base[QCOM_SOC_PERF_NOM=
INAL]),
> > +
> > +	[QCOM_SOC_PERF_TURBO]		=3D
> > +		QCOM_PERF_ROW(cnoc_axi_clk_base[QCOM_SOC_PERF_TURBO],
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qcom_jpeg_clk_base[QCOM_SOC_PERF_TUR=
BO]),
> > +};
> > +
> > +static const struct qcom_perf_resource qcom_perf_rates_v680[] =3D {
> > +	[QCOM_SOC_PERF_SUSPEND]	=3D
> > +		QCOM_PERF_ROW(cnoc_axi_clk_v680[QCOM_SOC_PERF_SUSPEND],
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qcom_jpeg_clk_base[QCOM_SOC_PERF_SUS=
PEND]),
> > +
> > +	[QCOM_SOC_PERF_LOWSVS]		=3D
> > +		QCOM_PERF_ROW(cnoc_axi_clk_v680[QCOM_SOC_PERF_LOWSVS],
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qcom_jpeg_clk_base[QCOM_SOC_PERF_LOW=
SVS]),
> > +
> > +	[QCOM_SOC_PERF_SVS]		=3D
> > +		QCOM_PERF_ROW(cnoc_axi_clk_v680[QCOM_SOC_PERF_SVS],
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qcom_jpeg_clk_base[QCOM_SOC_PERF_SVS=
]),
> > +
> > +	[QCOM_SOC_PERF_SVS_L1]		=3D
> > +		QCOM_PERF_ROW(cnoc_axi_clk_v680[QCOM_SOC_PERF_SVS_L1],
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qcom_jpeg_clk_base[QCOM_SOC_PERF_SVS=
_L1]),
> > +
> > +	[QCOM_SOC_PERF_NOMINAL]	=3D
> > +		QCOM_PERF_ROW(cnoc_axi_clk_v680[QCOM_SOC_PERF_NOMINAL],
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qcom_jpeg_clk_base[QCOM_SOC_PERF_NOM=
INAL]),
> > +
> > +	[QCOM_SOC_PERF_TURBO]		=3D
> > +		QCOM_PERF_ROW(cnoc_axi_clk_v680[QCOM_SOC_PERF_TURBO],
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qcom_jpeg_clk_base[QCOM_SOC_PERF_TUR=
BO]),
> > +};
> > +
> > +static const struct qcom_perf_resource qcom_perf_rates_v780[] =3D {
> > +	[QCOM_SOC_PERF_SUSPEND]	=3D
> > +		QCOM_PERF_ROW(cnoc_axi_clk_base[QCOM_SOC_PERF_SUSPEND],
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qcom_jpeg_clk_v780[QCOM_SOC_PERF_SUS=
PEND]),
> > +
> > +	[QCOM_SOC_PERF_LOWSVS]		=3D
> > +		QCOM_PERF_ROW(cnoc_axi_clk_base[QCOM_SOC_PERF_LOWSVS],
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qcom_jpeg_clk_v780[QCOM_SOC_PERF_LOW=
SVS]),
> > +
> > +	[QCOM_SOC_PERF_SVS]		=3D
> > +		QCOM_PERF_ROW(cnoc_axi_clk_base[QCOM_SOC_PERF_SVS],
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qcom_jpeg_clk_v780[QCOM_SOC_PERF_SVS=
]),
> > +
> > +	[QCOM_SOC_PERF_SVS_L1]		=3D
> > +		QCOM_PERF_ROW(cnoc_axi_clk_base[QCOM_SOC_PERF_SVS_L1],
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qcom_jpeg_clk_v780[QCOM_SOC_PERF_SVS=
_L1]),
> > +
> > +	[QCOM_SOC_PERF_NOMINAL]	=3D
> > +		QCOM_PERF_ROW(cnoc_axi_clk_base[QCOM_SOC_PERF_NOMINAL],
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qcom_jpeg_clk_v780[QCOM_SOC_PERF_NOM=
INAL]),
> > +
> > +	[QCOM_SOC_PERF_TURBO]		=3D
> > +		QCOM_PERF_ROW(cnoc_axi_clk_base[QCOM_SOC_PERF_TURBO],
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qcom_jpeg_clk_v780[QCOM_SOC_PERF_TUR=
BO]),
> > +};
> > +
> > +static const struct qcom_icc_resource qcom_jpeg_default_icc[] =3D {
> > +	{
> > +		.icc_id =3D "cam_ahb",
> > +		.pair	=3D { 38400, 76800 }
> > +	},
> > +	{
> > +		.icc_id =3D "cam_hf_0_mnoc",
> > +		.pair	=3D { 2097152, 2097152 }
> > +	},
> > +	{
> > +		.icc_id =3D "cam_sf_0_mnoc",
> > +		.pair	=3D { 0, 2097152 }
> > +	},
> > +	{
> > +		.icc_id	=3D "cam_sf_icp_mnoc",
> > +		.pair	=3D { 2097152, 2097152 }
> > +	},
> > +};
> > +
> > +static const struct qcom_mem_resource qcom_jpeg_default_mem[] =3D {
> > +	{
> > +		.map_id	=3D 0,
> > +		.res_id	=3D "JPEG"
> > +	},
> > +	{
> > +		.map_id	=3D 1,
> > +		.res_id	=3D "CPAS"
> > +	}
> > +};
>=20
> You don't even use these in the driver
>=20
> > +
> > +/*
> > + * Resources for T165, T170 JPEG version and derivatives
> > + */
> > +const struct qcom_dev_resources qcom_jpeg_v165_drvdata =3D {
> > +	.hw_ops		=3D &qcom_jpeg_default_ops,
> > +	.hw_offs	=3D &qcom_v165_jpeg_hw_reg_offs,
> > +	.hw_mask	=3D &qcom_v165_jpeg_hw_reg_mask[0],
> > +	.icc_res	=3D qcom_jpeg_default_icc,
> > +	.num_of_icc	=3D ARRAY_SIZE(qcom_jpeg_default_icc),
> > +	.mem_res	=3D qcom_jpeg_default_mem,
> > +	.num_of_mem	=3D ARRAY_SIZE(qcom_jpeg_default_mem),
> > +	.perf_cfg	=3D qcom_perf_rates_base,
> > +	.clk_names =3D {
> > +		[JPEG_CAMNOC_AXI_CLK]	=3D "camnoc_axi_clk",
> > +		[JPEG_CORE_CLK]		=3D "jpeg_clk",
> > +		[JPEG_CORE_AHB_CLK]	=3D "core_ahb_clk",
> > +		[JPEG_CPAS_AHB_CLK]	=3D "cpas_ahb_clk",
> > +		[JPEG_GCC_HF_AXI]	=3D "gcc_hf_axi_clk",
> > +		[JPEG_GCC_SF_AXI]	=3D "gcc_sf_axi_clk",
> > +	}
> > +};
> > +
> > +/*
> > + * Resources for T480, T580 JPEG version and derivatives
> > + */
> > +const struct qcom_dev_resources qcom_jpeg_v580_drvdata =3D {
> > +	.hw_ops		=3D &qcom_jpeg_default_ops,
> > +	.hw_offs	=3D &qcom_v580_jpeg_hw_reg_offs,
> > +	.hw_mask	=3D &qcom_v580_jpeg_hw_reg_mask[0],
> > +	.icc_res	=3D qcom_jpeg_default_icc,
> > +	.num_of_icc	=3D ARRAY_SIZE(qcom_jpeg_default_icc),
> > +	.mem_res	=3D qcom_jpeg_default_mem,
> > +	.num_of_mem	=3D ARRAY_SIZE(qcom_jpeg_default_mem),
> > +	.perf_cfg	=3D qcom_perf_rates_base,
> > +	.clk_names =3D {
> > +		[JPEG_CAMNOC_AXI_CLK]	=3D "camnoc_axi_clk",
> > +		[JPEG_CORE_CLK]		=3D "jpeg_clk",
> > +		[JPEG_CORE_AHB_CLK]	=3D "core_ahb_clk",
> > +		[JPEG_CPAS_AHB_CLK]	=3D "cpas_ahb_clk",
> > +		[JPEG_GCC_HF_AXI]	=3D "gcc_hf_axi_clk",
> > +		[JPEG_GCC_SF_AXI]	=3D "gcc_sf_axi_clk",
> > +	}
> > +};
> > +
> > +/*
> > + * Resources for T680 JPEG version and derivatives
> > + */
> > +const struct qcom_dev_resources qcom_jpeg_v680_drvdata =3D {
> > +	.hw_ops		=3D &qcom_jpeg_default_ops,
>=20
> All hw_ops are the same, remove them from the struct.
>=20
> > +	.hw_offs	=3D &qcom_v680_jpeg_hw_reg_offs,
> > +	.hw_mask	=3D &qcom_v680_jpeg_hw_reg_mask[0],
> > +	.icc_res	=3D qcom_jpeg_default_icc,
> > +	.num_of_icc	=3D ARRAY_SIZE(qcom_jpeg_default_icc),
> > +	.mem_res	=3D qcom_jpeg_default_mem,
> > +	.num_of_mem	=3D ARRAY_SIZE(qcom_jpeg_default_mem),
> > +	.perf_cfg	=3D qcom_perf_rates_v680,
> > +	.clk_names =3D {
> > +		[JPEG_CAMNOC_AXI_CLK]	=3D "camnoc_axi_clk",
> > +		[JPEG_CORE_CLK]		=3D "jpeg_clk",
> > +		[JPEG_CORE_AHB_CLK]	=3D "core_ahb_clk",
> > +		[JPEG_CPAS_AHB_CLK]	=3D "cpas_ahb_clk",
> > +		[JPEG_GCC_HF_AXI]	=3D "gcc_hf_axi_clk",
> > +		[JPEG_GCC_SF_AXI]	=3D "gcc_sf_axi_clk",
> > +	}
>=20
> Nope. You don't really need all those clock names here. Use
> devm_clk_bulk_get_all().
>=20
> > +};
> > +
> > +/*
> > + * Resources for T780 JPEG version and derivatives
> > + */
> > +const struct qcom_dev_resources qcom_jpeg_v780_drvdata =3D {
> > +	.hw_ops		=3D &qcom_jpeg_default_ops,
> > +	.hw_offs	=3D &qcom_v780_jpeg_hw_reg_offs,
> > +	.hw_mask	=3D &qcom_v780_jpeg_hw_reg_mask[0],
> > +	.icc_res	=3D qcom_jpeg_default_icc,
> > +	.num_of_icc	=3D ARRAY_SIZE(qcom_jpeg_default_icc),
> > +	.mem_res	=3D qcom_jpeg_default_mem,
> > +	.num_of_mem	=3D ARRAY_SIZE(qcom_jpeg_default_mem),
> > +	.perf_cfg	=3D qcom_perf_rates_v780,
> > +	.clk_names =3D {
> > +		[JPEG_CAMNOC_AXI_CLK]	=3D "camnoc_axi_clk",
> > +		[JPEG_CORE_CLK]		=3D "jpeg_clk",
> > +		[JPEG_CORE_AHB_CLK]	=3D "core_ahb_clk",
> > +		[JPEG_CPAS_AHB_CLK]	=3D "cpas_ahb_clk",
> > +		[JPEG_GCC_HF_AXI]	=3D "gcc_hf_axi_clk",
> > +		[JPEG_GCC_SF_AXI]	=3D "gcc_sf_axi_clk",
> > +	}
> > +};
>=20
>=20
> > diff --git a/drivers/media/platform/qcom/jpeg/qcom_v165_jenc_hw_info.h =
b/drivers/media/platform/qcom/jpeg/qcom_v165_jenc_hw_info.h
> > new file mode 100644
> > index 000000000000..16e4eae04d5f
> > --- /dev/null
> > +++ b/drivers/media/platform/qcom/jpeg/qcom_v165_jenc_hw_info.h
> > @@ -0,0 +1,509 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +
> > +#ifndef QCOM_JENC_HW_INFO_V165_H
> > +#define QCOM_JENC_HW_INFO_V165_H
> > +
> > +#include "qcom_jenc_defs.h"
> > +
> > +#define JPEG_V165_HW_VER_STEP_POS 0
> > +#define JPEG_V165_HW_VER_STEP_MSK \
> > +	(0xffff << JPEG_V165_HW_VER_STEP_POS)
>=20
> Use GENMASK instead.
>=20
> > +
> > +#define JPEG_V165_HW_VER_MINOR_POS 16
> > +#define JPEG_V165_HW_VER_MINOR_MSK \
> > +	(0x0fff << JPEG_V165_HW_VER_MINOR_POS)
> > +
> > +#define JPEG_V165_HW_VER_MAJOR_POS 28
> > +#define JPEG_V165_HW_VER_MAJOR_MSK \
> > +	(0xf << JPEG_V165_HW_VER_MAJOR_POS)
> > +
> > +#define JPEG_V165_HW_CAP_ENCODE_MSK BIT(0)
> > +#define JPEG_V165_HW_CAP_DECODE_MSK BIT(1)
>=20
> Stop declaring bits and pieces which are common to all platforms as
> platform-specific. Get them handled in the code directly without this
> extra intervention. Ideally, get one(!) of the platforms merged first
> and then implement corresponding differences for all other platforms.
>=20

--=-LcsaRh3+7HVfX4MShkkH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCagcksgAKCRDZQZRRKWBy
9K1dAP9kEVcaYD+YBxLZJa9N0+Bw125yxX5ix3FoFdrsPXGbqQEAmpiOidcGcCtm
aTvbaUJNc/RQttni5Fwp7l/+HpB5DwA=
=W4d7
-----END PGP SIGNATURE-----

--=-LcsaRh3+7HVfX4MShkkH--

