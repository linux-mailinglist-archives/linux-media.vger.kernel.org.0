Return-Path: <linux-media+bounces-43637-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AA741BB3EA8
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 14:40:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 62C027AF75B
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 12:39:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5250310624;
	Thu,  2 Oct 2025 12:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="FI0IxCa1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818FD30AD1B
	for <linux-media@vger.kernel.org>; Thu,  2 Oct 2025 12:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759408842; cv=none; b=CiRjDp+x7PAQe43AshSEuY3OLydTZtGtwqKkbFcR2yBHvV6tkCr2okf9OQWeGMrTRNFF1clcWaWeejFY3Ue6ETkr0z/8nF6earbUGJn89SmUS58sHl42aQGLMapfM0RSY6kKZGwcpUBqzYOzEL52ee4/eu1CbbXPz4Pumh06xWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759408842; c=relaxed/simple;
	bh=dqw7ChviJ3egtYgDVIDKcHGr1DxNENX9MEkcL5O+J18=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=I9GrKTmGloAt/jNh1S1ns8YZZfTU54uIn7uf8KeoaIKKUFvxw5bnUik3+yJm71UoBgY/MmRhUQUygbjec1yG4FaT1hUCqQ+xlSpqh6Unb1hxeghujQ357ZXUWIKURPWfbNoImrb05SpULH+n8aMLXR5T7z1WDZFllr4JAgCgv5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=FI0IxCa1; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-875d55217a5so104402685a.2
        for <linux-media@vger.kernel.org>; Thu, 02 Oct 2025 05:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1759408839; x=1760013639; darn=vger.kernel.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9tG3CglHbeY/0AI4Rz2tx44tc/toPYUH7TVppo+t14c=;
        b=FI0IxCa1zBrmxcw58Kkl978uJV9+qq15rhpj36+DGSfWp2WAZfbUxPafj9owYS0NeO
         +THpUGtsPPDowqosEXBM8DGd9qkoScfG9fX0K6femHngWXa+ivtqbxLXR6uj5fufGgBd
         JML4X0na4Kmw7g8MCErUWXXc2bMK00L23rrUS9y5XVoZ/SaHlaTTCK5PhBIYmLVX9vsR
         2EDsggb7oR0UP4HAZa4kxiAG5364ISzC+eveLHQy/aW1SYRMZGg2f6z593TaAexkyUG+
         onr4cuv4zzYzQpuMOZCer1575VuCZOhqgG6N2+/IxmarouRxD27/NKG0NtHIZDLdcxGP
         cgEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759408839; x=1760013639;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9tG3CglHbeY/0AI4Rz2tx44tc/toPYUH7TVppo+t14c=;
        b=o1oejQrlR0vYI3xKpZCQOEp68kEpc6/IF4L+RFp5YiLhMOupyY2x3B06Qv/VuTgTwj
         SoadRzvivFXAQyGR+KIIAffKzX++m3+gnnGtIAlbkVxApCtczr2qMb3rj6lUzplt1JGP
         5/BpNc3J3LiUm+0ZvHDwiy+hJDFwSL1XVit8/UEFzvUq2FzwnbYzTvEKiNPckju60zbm
         ck2aQpUF7/xWVSHz45ghqN1qb27GoBQNcCD9gIqmcO+BjnWkqeqCwJPXoa3hrSabaOFK
         JceDoWd0BjRbL7ptT49FGwqUkHQPdgOrbTMfekzHZL0/rpuRCRyRa+1cjEzx5vBu2/TO
         EI9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVL+1SH9e6espY8m9kHQAiiiPXwZVHsEufDf/W47l6N4FNO2FjAIe+CaaOV2hfGuJ4fxViZfGC+m3cAIg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvn+3FpMDu5oT+c2YjTC0+hdaYHp6XnSep9NppGF3QkCL+etQO
	lnVVdWOpH7RlO2s7xZuTBktmE1sk0HxNzsKyqjos4IXj/WvEwPodZy+gvWBXdMOgO8c=
X-Gm-Gg: ASbGncvrWVJoUhy+WRrxx57zVNqSISj7dqhmwqad+v3/5L4tj+NxRf/pDzranbMafHb
	7tZ3A7hN6mAoJAr5O1A0tB+ljk2SfPf+Z4+kuOBjcWvPUM/1v32XbJDacVMUHjFp9BEIAluRF/9
	x+4Y9n2Xn1sd+OtNvoO27BF2s97RoTHS0WGbtrZXTMxqIEyIUyjIFNGVXWiZiDKj+WZTqaxNJvb
	aPMzugwJOV4e8BWQZzB3KY9otxjyQqGaT52CoWRbKMu40zvNP5fN1ozxpD+slvp7WgFaoJst4pR
	4FbJUvZe4BRliq9vHrgR1zPgJ4CHXdFFzi9P0xfDbQLBlkyaeZZCG3BGQ1v53/RyxKfo7+hHXBr
	jw219dT4HlJbLr3J3uAw1SN1qa5f9eaH1PZnk/IsZk0d5dEHfPpb4aVESrewpNEg=
X-Google-Smtp-Source: AGHT+IHfFbRDc0lxQJHEnEb/USvJWquapfe/e1sD30gNrrrl/FzbGv+DojWArzyJNLJRhyT1vMSzeQ==
X-Received: by 2002:a05:620a:1a0c:b0:85e:5022:33b7 with SMTP id af79cd13be357-8737780ae60mr1022559585a.72.1759408837081;
        Thu, 02 Oct 2025 05:40:37 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:ebd3::5ac? ([2606:6d00:17:ebd3::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-87771129fcdsm200898385a.13.2025.10.02.05.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 05:40:36 -0700 (PDT)
Message-ID: <9ca0e8b7b644637101f8bbc3f69cb71f20665f04.camel@ndufresne.ca>
Subject: Re: [PATCH v12 2/9] dma-buf: dma-heap: export declared functions
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Maxime Ripard <mripard@redhat.com>, Jens Wiklander
	 <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
 Olivier Masse <olivier.masse@nxp.com>, Thierry Reding
 <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>,  Sumit Semwal
 <sumit.semwal@linaro.org>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Brian Starkey	 <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>, "T . J . Mercier"	
 <tjmercier@google.com>, Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>, Sumit Garg <sumit.garg@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com,
 Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone
 <daniel@fooishbar.org>, Rouven Czerwinski	 <rouven.czerwinski@linaro.org>,
 robin.murphy@arm.com, Sumit Garg	 <sumit.garg@oss.qualcomm.com>
Date: Thu, 02 Oct 2025 08:40:35 -0400
In-Reply-To: <20251002-shaggy-mastiff-of-elevation-c8e1f0@houat>
References: <20250911135007.1275833-1-jens.wiklander@linaro.org>
	 <20250911135007.1275833-3-jens.wiklander@linaro.org>
	 <20251002-shaggy-mastiff-of-elevation-c8e1f0@houat>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-45N4bvp/oD9a6lFdlKUD"
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-45N4bvp/oD9a6lFdlKUD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 02 octobre 2025 =C3=A0 09:47 +0200, Maxime Ripard a =C3=A9crit=C2=
=A0:
> Hi,
>=20
> On Thu, Sep 11, 2025 at 03:49:43PM +0200, Jens Wiklander wrote:
> > Export the dma-buf heap functions to allow them to be used by the OP-TE=
E
> > driver. The OP-TEE driver wants to register and manage specific secure
> > DMA heaps with it.
> >=20
> > Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > Reviewed-by: T.J. Mercier <tjmercier@google.com>
> > Acked-by: Sumit Semwal <sumit.semwal@linaro.org>
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> > =C2=A0drivers/dma-buf/dma-heap.c | 4 ++++
> > =C2=A01 file changed, 4 insertions(+)
> >=20
> > diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> > index 3cbe87d4a464..8ab49924f8b7 100644
> > --- a/drivers/dma-buf/dma-heap.c
> > +++ b/drivers/dma-buf/dma-heap.c
> > @@ -11,6 +11,7 @@
> > =C2=A0#include <linux/dma-buf.h>
> > =C2=A0#include <linux/dma-heap.h>
> > =C2=A0#include <linux/err.h>
> > +#include <linux/export.h>
> > =C2=A0#include <linux/list.h>
> > =C2=A0#include <linux/nospec.h>
> > =C2=A0#include <linux/syscalls.h>
> > @@ -202,6 +203,7 @@ void *dma_heap_get_drvdata(struct dma_heap *heap)
> > =C2=A0{
> > =C2=A0	return heap->priv;
> > =C2=A0}
> > +EXPORT_SYMBOL_NS_GPL(dma_heap_get_drvdata, "DMA_BUF_HEAP");
> > =C2=A0
> > =C2=A0/**
> > =C2=A0 * dma_heap_get_name - get heap name
> > @@ -214,6 +216,7 @@ const char *dma_heap_get_name(struct dma_heap *heap=
)
> > =C2=A0{
> > =C2=A0	return heap->name;
> > =C2=A0}
> > +EXPORT_SYMBOL_NS_GPL(dma_heap_get_name, "DMA_BUF_HEAP");
> > =C2=A0
> > =C2=A0/**
> > =C2=A0 * dma_heap_add - adds a heap to dmabuf heaps
> > @@ -303,6 +306,7 @@ struct dma_heap *dma_heap_add(const struct
> > dma_heap_export_info *exp_info)
> > =C2=A0	kfree(heap);
> > =C2=A0	return err_ret;
> > =C2=A0}
> > +EXPORT_SYMBOL_NS_GPL(dma_heap_add, "DMA_BUF_HEAP");
>=20
> It's not clear to me why we would need to export those symbols.
>=20
> As far as I know, heaps cannot be removed, and compiling them as module
> means that we would be able to remove them.
>=20
> Now, if we don't expect the users to be compiled as modules, then we
> don't need to export these symbols at all.

Maybe I'm getting out of topic, sorry if its the case, but making that a ha=
rd
rule seems very limiting. Didn't we said that a heap driver could be made t=
o
represent memory region on a remote device such as an eGPU ?

Nicolas

>=20
> Am I missing something?
>=20
> Maxime

--=-45N4bvp/oD9a6lFdlKUD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaN5ywwAKCRDZQZRRKWBy
9KyVAP0e+zNS/qwzQzV67XRNZS/HR4iYLotJyohgk+o985wA0gD/cUs7EW6a2cas
LUv2nPsRzhxVleDso0vC+2RD1vBV7wE=
=kgiD
-----END PGP SIGNATURE-----

--=-45N4bvp/oD9a6lFdlKUD--

