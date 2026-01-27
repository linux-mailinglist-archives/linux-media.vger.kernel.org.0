Return-Path: <linux-media+bounces-51661-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sL85CyXFeGmltAEAu9opvQ
	(envelope-from <linux-media+bounces-51661-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 15:01:09 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E68E95484
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 15:01:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2DDD33063B63
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 13:51:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EC553557E1;
	Tue, 27 Jan 2026 13:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="EpNF9iYR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9516426ED54
	for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 13:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769521883; cv=none; b=JHKbnYznROPMLRFLWLxOYDCWZOchIBF8srN7bdtYBOL8UclmYdBXLnDmg3eLjL41XzLQCGUeFh1XlyI3q1U6Ux8WMDG2kSsD70btu86cLSI0lCmQ6ofqSNV8Cm05DY/FlfIGEO6FUa3RF8tZbzkTBKcsPiTfmelMR6b328JIhP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769521883; c=relaxed/simple;
	bh=26a1JMciDcTJ+TZWbqnJJKHWKRs9hvl9k+BGAGE5Hns=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Pkn73IWwNgPPagRhFhBUIzSxMj1pZSCotVuCWneUc0SmcZZmx35hrZN2Hvlr94XcawYTrVjKLuR5JEI4PgKf3Cb68RZlOcvfp//MSnEh6woU527fDT1akfQbN+Zfu5wifxgTk+oXQMpD2o3kdrh8mDocoM4yVvUvhqNC6EVdi20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=EpNF9iYR; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-894770e34afso95555176d6.0
        for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 05:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1769521880; x=1770126680; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TWb9tHCixSdnVfIgDBaxxTLH7WM+nmMGf9vhIY0VeHY=;
        b=EpNF9iYRJUoF2Zu1QVs0lClzULFFAKGuLbl8JGy6Z+fUMZjOcbdoQvCefzcBYFCV3F
         tReDNV2jC1X6gYekYxd1qBTJI1uDJhOUSR8+wdA4G9IkInbLhptzdqSs4eLpoK9EhAkU
         o9J1UQnzDiYjWu8uH8Paw8KHNRaei/coQcOJCXZud3tqhC09WbnyDQtTukeDO80uoVZh
         Pqjo684jDxWIwtrm+N3drSH+ku1jIuyX6jbHOespN0SwzHhJnaMmTH3V8uCLbcbBi14s
         z2MizUrtRWus0S1+u8szRU9UEpx2+40PHj6LSQIzTi7dxg9RwtsTQe2t66uivFVlZ3o1
         tGVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769521880; x=1770126680;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TWb9tHCixSdnVfIgDBaxxTLH7WM+nmMGf9vhIY0VeHY=;
        b=caHETLmVir6LfkSHuxJmVRaHL6Fd6ErX5nwfihisJwJMQPS05uDoziEWl+lAGQvF0X
         FhE1jrEfH0JMkUg4HZZkoIy6xOYRzmARnfUme7w4K3ehXpvwtwlMBdXzvyP6rbjygkEv
         qo2CIrr2bHcZWJah3D/muQhvhpw0j7jNJeR0tTjIRWsDsX1vTX0/rrpXFdoY1II6ancp
         HFDCEG5MyaU34jAKUOkQcSOI29nbpoTt9QzAO6sFRJ+sMNLODdstM35k4if1T2VferCo
         d+KNS6JLbjrvEmCHlX71wjSk5h3pLx+JL1Kc3dpCGqYdGmluC+liySLVpElye0Cyp5De
         BGHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlLd8Yckb+9w0mDgRLIPT6D0oaUfKup6G5/463lqaubaOlOZD62DEcbH4ML0OxmQD0ERYCMAOtWBjfSg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTMjfw+ouBVphg7NSIYynXWPDDxFp4lhciRnN0uqhu2Szaeufk
	TJckM9GlnHubJi6lemRpKck6ds5/eTkzM2tPdi4DCe0TstZVOoyo4M7a1fq3qRpH1jc=
X-Gm-Gg: AZuq6aIDZ6kXWYCf5FfGLq3TegNGJL4FOE2pbEKE3EX6GKtbVQgf3BBAx5AJ6RgQHKj
	MJpKpCsnHlsZxtT3WYNUwGe7S+t+whU+IHJKWuvXbouafVaMem8KkPWgkooif33UJTWWwbM7KA5
	s0flmM/UM2xDdmtH+/7XvzqSKdwona6fIy89xDhSL79tVuuWlU1UO6HRAoIWnConuw2UfcaqBFU
	nJGzJ+z/uuNoEQ6nc0dH3BJC04ADyjD1AUpCVsU0HqO7xqBN7N3+Myi2JjNArXlN2wlaLHpb5Wl
	0KulCDFMLcfC43K5YL206uojPyQrnCDEIM6lMl41vjPe+yo5xfAmDbuoyAzNqxr7X8uQYDOyRyr
	EjF+SkKAQrE+sXKfwPuvmG03GQ4b1UeKvaaX+hOVbv7OnKqKTiNChUdQ6qZuLg5nxcikdHALhHJ
	DrATkpN8bMyvMlGCz9
X-Received: by 2002:ac8:7f0e:0:b0:4ff:a40c:c6c4 with SMTP id d75a77b69052e-5032f774757mr18752511cf.15.1769521880245;
        Tue, 27 Jan 2026 05:51:20 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::5ac? ([2606:6d00:17:7b4b::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-503337f04a3sm4279551cf.5.2026.01.27.05.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 05:51:19 -0800 (PST)
Message-ID: <95ea1872a0afb10265aa675817647d830de42d70.camel@ndufresne.ca>
Subject: Re: [PATCH 3/7] of/iommu: add multi-map support
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Vikash Garodia
	 <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar	
 <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Saravana Kannan	 <saravanak@kernel.org>, Joerg
 Roedel <joro@8bytes.org>, Will Deacon	 <will@kernel.org>, Robin Murphy
 <robin.murphy@arm.com>, Stefan Schmidt	 <stefan.schmidt@linaro.org>, Hans
 Verkuil <hverkuil@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, Hans Verkuil	
 <hverkuil+cisco@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, Bryan O'Donoghue	
 <bryan.odonoghue@linaro.org>, Charan Teja Kalla
 <charan.kalla@oss.qualcomm.com>,  Vijayanand Jitta
 <vijayanand.jitta@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 08:51:17 -0500
In-Reply-To: <hunwsdkmeo6efpv3yt3izkgmarelnubd74dywj3scryxrreq6p@njijwtoyjh46>
References: <20260126-kaanapali-iris-v1-0-e2646246bfc1@oss.qualcomm.com>
	 <20260126-kaanapali-iris-v1-3-e2646246bfc1@oss.qualcomm.com>
	 <hunwsdkmeo6efpv3yt3izkgmarelnubd74dywj3scryxrreq6p@njijwtoyjh46>
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
	protocol="application/pgp-signature"; boundary="=-sqPE2tvWLzFfDUXBP4ZG"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20230601.gappssmtp.com:s=20230601];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51661-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[26];
	DKIM_TRACE(0.00)[ndufresne-ca.20230601.gappssmtp.com:+];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,ndufresne-ca.20230601.gappssmtp.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ndufresne.ca:mid]
X-Rspamd-Queue-Id: 3E68E95484
X-Rspamd-Action: no action


--=-sqPE2tvWLzFfDUXBP4ZG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 27 janvier 2026 =C3=A0 13:45 +0200, Dmitry Baryshkov a =C3=A9crit=
=C2=A0:
> On Mon, Jan 26, 2026 at 05:55:46PM +0530, Vikash Garodia wrote:
> > From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> >=20
> > When multiple mappings are present for an input id, linux matches just
> > the first one. There is a usecase[1] where all the mappings are to be
> > maintained in parallel for an iommu-map entry of a same input id.
>=20
> This contradicts the IOMMU idealogy (at least as far as I understood it
> fom the maintainers): the device (driver) doesn't control which IOMMUs
> are getting used. Instead _all_ defined entries should get used. For
> iommu-map it means that if the map defines several entries for a single
> function, then all entries should always get mapped.
>=20
> >=20
> > Whether multi-map is needed is reported by the callers through the
> > callback function passed, which is called for every input id match.
> >=20
> > Since the requirement in the usecase[1] is for platform devices, not
> > sure if it is really clean to maintain this decision on the bus type at
> > the of_iommu layer or further to be from the respective
> > iommu_driver->impl_ops().
>=20
> This doesn't tell us, why do you want to control, which entries of the
> map get used.
>=20
> >=20
> > [1]
> > https://lore.kernel.org/all/20250627-video_cb-v3-0-51e18c0ffbce@quicinc=
.com/

Since its for an M2M V4L2 device, and its all about having more address spa=
ce
according to this link, you may want to use a different iommu domain per m2=
m
instances, rather then per device (what is done implicitly). On top of whic=
h, it
will ensure memory isolation between instances, making this driver suitable=
 for
virtualisation. 4Gb per instance (which is also per stream) seems like a lo=
t of
memory to me. But like Dmitry says, there is little clarity in what you are
trying to achieve.

Nicolas

> >=20
> > Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> > Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
> > Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > ---
> > =C2=A0drivers/iommu/of_iommu.c | 36 ++++++++++++++++++++++++++++-------=
-
> > =C2=A0drivers/of/base.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 38 =
++++++++++++++++++++++++++++----------
> > =C2=A0include/linux/of.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 6 =
++++++
> > =C2=A03 files changed, 62 insertions(+), 18 deletions(-)
> >=20
> > diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
> > index
> > 768eaddf927b0700b2497b08ea21611b1a1b5688..067bb2298973671e1eaf01bb2ea52=
df3d2
> > a52a44 100644
> > --- a/drivers/iommu/of_iommu.c
> > +++ b/drivers/iommu/of_iommu.c
> > @@ -16,6 +16,7 @@
> > =C2=A0#include <linux/pci.h>
> > =C2=A0#include <linux/slab.h>
> > =C2=A0#include <linux/fsl/mc.h>
> > +#include <linux/platform_device.h>
> > =C2=A0
> > =C2=A0#include "iommu-priv.h"
> > =C2=A0
> > @@ -41,22 +42,41 @@ static int of_iommu_xlate(struct device *dev,
> > =C2=A0	return ret;
> > =C2=A0}
> > =C2=A0
> > +/*
> > + * Callback to be called from of_map_id(), that tells if
> > + * all the mappings for an input id to be maintained in
> > + * parallel. Should this decission be from further layers,
> > + * iommu_driver->impl_ops?
> > + */
> > +static int of_iommu_configure_cb(struct of_map_id_arg *arg)
> > +{
> > +	struct of_phandle_args *iommu_spec =3D &arg->map_args;
> > +	struct device *dev =3D arg->dev;
> > +	int err;
> > +
> > +	err =3D of_iommu_xlate(dev, iommu_spec);
> > +	of_node_put(iommu_spec->np);
> > +
> > +	/* !iommu_spec->np may be from the bypassed translations */
> > +	if (!err)
> > +		err =3D (!arg->multi_map || !iommu_spec->np) ? 0 : -EAGAIN;
> > +
> > +	return err;
> > +}
> > +
> > =C2=A0static int of_iommu_configure_dev_id(struct device_node *master_n=
p,
> > =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 struct device *dev,
> > =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 const u32 *id)
> > =C2=A0{
> > =C2=A0	struct of_map_id_arg arg =3D {
> > =C2=A0		.map_args =3D {},
> > +		.cb =3D of_iommu_configure_cb,
> > +		.dev =3D dev,
> > +		/* Should this be pushed to iommu_driver->impl_ops? */
> > +		.multi_map =3D dev_is_platform(dev),
> > =C2=A0	};
> > -	int err;
> > -
> > -	err =3D of_map_iommu_id(master_np, *id, &arg);
> > -	if (err)
> > -		return err;
> > =C2=A0
> > -	err =3D of_iommu_xlate(dev, &arg.map_args);
> > -	of_node_put(arg.map_args.np);
> > -	return err;
> > +	return of_map_iommu_id(master_np, *id, &arg);
> > =C2=A0}
> > =C2=A0
> > =C2=A0static int of_iommu_configure_dev(struct device_node *master_np,
> > diff --git a/drivers/of/base.c b/drivers/of/base.c
> > index
> > 606bef4f90e7d13bae4f7b0c45acd1755ad89826..a1c3c5954ec7e8eb3753c8fd782a1=
570f9
> > eb9c17 100644
> > --- a/drivers/of/base.c
> > +++ b/drivers/of/base.c
> > @@ -2122,14 +2122,21 @@ static bool of_check_bad_map(const __be32 *map,=
 int
> > len)
> > =C2=A0	return true;
> > =C2=A0}
> > =C2=A0
> > -static int of_map_id_fill_output(struct of_map_id_arg *arg,
> > -				 struct device_node *phandle_node, u32
> > id_or_offset,
> > -				 const __be32 *out_base, u32 cells,
> > -				 bool bypass)
> > +/*
> > + * Fill the id_out and target for the of_map_id() caller. Also
> > + * call the callback passed to the of_map_id() as part of the arg
> > + * that decides if to continue further search.
> > + */
> > +static int of_map_id_fill_arg(struct of_map_id_arg *arg,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct device_node *phandle_node, u3=
2
> > id_or_offset,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const __be32 *out_base, u32 cells,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool bypass, bool *multi_id_map)
> > =C2=A0{
> > +	int ret;
> > +
> > =C2=A0	if (bypass) {
> > =C2=A0		arg->map_args.args[0] =3D id_or_offset;
> > -		return 0;
> > +		goto output;
> > =C2=A0	}
> > =C2=A0
> > =C2=A0	if (arg->map_args.np)
> > @@ -2145,7 +2152,14 @@ static int of_map_id_fill_output(struct of_map_i=
d_arg
> > *arg,
> > =C2=A0
> > =C2=A0	arg->map_args.args_count =3D cells;
> > =C2=A0
> > -	return 0;
> > +output:
> > +	/* pass the output for the callback, callers may further decide */
> > +	ret =3D=C2=A0 arg->cb ? arg->cb(arg) : 0;
> > +
> > +	if (multi_id_map && ret =3D=3D -EAGAIN)
> > +		*multi_id_map =3D true;
> > +
> > +	return ret;
> > =C2=A0}
> > =C2=A0
> > =C2=A0/**
> > @@ -2179,6 +2193,7 @@ int of_map_id(const struct device_node *np, u32 i=
d,
> > const char *map_name,
> > =C2=A0	int map_bytes, map_len, offset =3D 0;
> > =C2=A0	bool bad_map =3D false;
> > =C2=A0	const __be32 *map =3D NULL;
> > +	bool multi_id_map =3D false;
> > =C2=A0
> > =C2=A0	if (!np || !map_name || !arg)
> > =C2=A0		return -EINVAL;
> > @@ -2264,23 +2279,26 @@ int of_map_id(const struct device_node *np, u32=
 id,
> > const char *map_name,
> > =C2=A0		if (masked_id < id_base || id_off >=3D id_len)
> > =C2=A0			continue;
> > =C2=A0
> > -		ret =3D of_map_id_fill_output(arg, phandle_node, id_off,
> > out_base, cells, false);
> > +		ret =3D of_map_id_fill_arg(arg, phandle_node, id_off,
> > out_base,
> > +					 cells, false, &multi_id_map);
> > =C2=A0		if (ret =3D=3D -EAGAIN)
> > =C2=A0			continue;
> > =C2=A0
> > =C2=A0		pr_debug("%pOF: %s, using mask %08x, id-base: %08x, out-
> > base: %08x, length: %08x, id: %08x -> %08x\n",
> > =C2=A0			np, map_name, map_mask, id_base,
> > be32_to_cpup(out_base),
> > =C2=A0			id_len, id, id_off + be32_to_cpup(out_base));
> > -		return 0;
> > +		return ret;
> > =C2=A0	}
> > =C2=A0
> > +	if (multi_id_map)
> > +		return 0;
> > +
> > =C2=A0	pr_info("%pOF: no %s translation for id 0x%x on %pOF\n", np,
> > map_name,
> > =C2=A0		id, arg->map_args.np=C2=A0 ? arg->map_args.np : NULL);
> > =C2=A0
> > =C2=A0bypass_translation:
> > =C2=A0	/* Bypasses translation */
> > -	return of_map_id_fill_output(arg, NULL, id, 0, 0, true);
> > -
> > +	return of_map_id_fill_arg(arg, NULL, id, 0, 0, true, NULL);
> > =C2=A0err_map_len:
> > =C2=A0	pr_err("%pOF: Error: Bad %s length: %d\n", np, map_name,
> > map_bytes);
> > =C2=A0	return -EINVAL;
> > diff --git a/include/linux/of.h b/include/linux/of.h
> > index
> > 9efa6f93712c6024f05476f9fd39f3294f942ec1..abab73a76682351f5635c1127a6c8=
99917
> > 525050 100644
> > --- a/include/linux/of.h
> > +++ b/include/linux/of.h
> > @@ -25,6 +25,9 @@
> > =C2=A0typedef u32 phandle;
> > =C2=A0typedef u32 ihandle;
> > =C2=A0
> > +struct of_map_id_arg;
> > +typedef int (*of_map_id_cb)(struct of_map_id_arg *arg);
> > +
> > =C2=A0struct property {
> > =C2=A0	char	*name;
> > =C2=A0	int	length;
> > @@ -76,6 +79,9 @@ struct of_phandle_args {
> > =C2=A0
> > =C2=A0struct of_map_id_arg {
> > =C2=A0	struct of_phandle_args map_args;
> > +	of_map_id_cb cb;
> > +	struct device *dev;
> > +	bool multi_map;
> > =C2=A0};
> > =C2=A0
> > =C2=A0struct of_phandle_iterator {
> >=20
> > --=20
> > 2.34.1
> >=20

--=-sqPE2tvWLzFfDUXBP4ZG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaXjC1QAKCRDZQZRRKWBy
9AdQAP4gtvm3/cBxyYM8uZ50t1efySdzZ/rt1/ZyrL5c2cGZhAD9FLIi6O56sq1S
VY5E1+gXbEXsbTA/TbUUH5BjQojFPA0=
=+cdM
-----END PGP SIGNATURE-----

--=-sqPE2tvWLzFfDUXBP4ZG--

