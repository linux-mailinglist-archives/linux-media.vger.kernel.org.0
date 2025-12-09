Return-Path: <linux-media+bounces-48494-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 26348CB12C0
	for <lists+linux-media@lfdr.de>; Tue, 09 Dec 2025 22:20:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D067230F4DBD
	for <lists+linux-media@lfdr.de>; Tue,  9 Dec 2025 21:18:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6BA831DDBB;
	Tue,  9 Dec 2025 20:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="ig2CwViB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C27631D744
	for <linux-media@vger.kernel.org>; Tue,  9 Dec 2025 20:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765313857; cv=none; b=D012chn9MzV6sWObM7psLNzkPg3taZLBhnp41ucgn2kvx+Ju9YcAGtMsQI8cNVadptMU2ea6C+koFh7oXg8D0mJzpF26XruuY0oYjXwxQLuBgTz8PO2PM4NE+PD3zYO2cYg0dTJlAX4svkesJRjxsZyRH3uwxiMdDWbaNa+YrtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765313857; c=relaxed/simple;
	bh=fjyq+RNUjNnOTZdRG12RmpzNexwI9SlRNjx52n4aYlQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OTNo/DQTZqKkjFPYre6taY1LRiILAwb9vibZDvaV/iAAB9Q91+qRNez6EyJw7yXM13iEolezWgw3vzYjMADkwW2i0c44WigWOw3Tufz1sexlzJsuj9NhJg5B7VaRn7eHOInEUm2BWIywzVAOuXZNrO+7HEi09JRrHw9vW3e7aZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=ig2CwViB; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8a3eac7ca30so371588485a.2
        for <linux-media@vger.kernel.org>; Tue, 09 Dec 2025 12:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1765313854; x=1765918654; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ks4rfgwcPnh21bBJ5QetQ/t2Y7bRA0w+3d0dKO5oFWI=;
        b=ig2CwViBiHFunbVPEIbOch+YCTpkxIrmbSd87u2rKaxbUuLFjxTSBdhLHgPm8F7ues
         wYY3JXFey6PO3tMdNfhuPO3QEFrM3U6HjpRCBZkBWiZzI+QS7BC4+142XOuE79MG+dfw
         Ey4BexlYWaH1YyhdbRZWsJFPjdZb90Fnz7zPU3McTEIG5ImIeBeQuZ7hByM0A28dinM2
         OKtpGIdyOdHKYMaqcJ+yQM4UOxtjLHPrj9sTP6iEo8WoVw8rZiPu2+2TmiUoedXbvVE+
         oF77Se74o+mf5qvg2cDwq7ct0ZR3dKxNR+D5sxqA078pyvM0T9dpXo/KqM6F7nzplEbp
         gpzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765313854; x=1765918654;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ks4rfgwcPnh21bBJ5QetQ/t2Y7bRA0w+3d0dKO5oFWI=;
        b=XSY8qSVxOgCK0Ip/oiyEWFZgj7Bzs65NxLus7sK3FE9p32uKbnBuTWaCblNNk6aEjs
         5+cIrfSIlP6JxW8y6KNGg8gsSKoS639z0t1IqygS7HaOtawsaLxmDjDbBf03qm0QDNRU
         qatE71xxunHrRHxQ9IZaMdwJU0emv8cIuoLGMf6/Zuw1kdxMWY1Dc2Yuw68i9QlSATnX
         +kwLEW4jV3CPXDikjwxVPSBTLcVKJ9hfJfDReRoQRXtRRmcPpZpBwfTm0pL76U4qbvpo
         eVAkbQPL2w3WBY0ANiVIpl+Z255p103gB+2hGjhRfU+OMYGSy8M87IhJspQam5PK4lwv
         hG2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXx/CMnJsAIaajbSXLYrinWICI2O6MVXy2Wf81cQHLwN2XT/PDJ63xdri17VZfq1T3A20COuHJb6Si+mQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYrFTLyen6V62iPa9/I5GcODmduzsfsSjttHt3y47HT90hyj2e
	krM9xSdIlSw9nmWT9S5r2cxUtfOUf4qSd/Gz2B5vyPHyOA6dKWwubHpXv7qQ18QIRiQ=
X-Gm-Gg: ASbGnctYEm8oUkLyGZIa3mtBwco7731qROl5XzwQtx8xSQmtFPMaL287s5vv081x9pS
	kfYBwcqYHWFPeVyOrInWt3GF13MpoHmqxxzfVmDv6WM8AaYBz/cKLE2uX0UFEbTx8uFJ9H7KYwr
	Pz7wsjHfFnAK9+OQRPJa3qFgiY8ty75fl85AI/eYDzZHhOiEP0o7afv5L4Yj/EeYb3pP/J6MgFP
	tCFw2CZJtgL7tE2oq6Rx5KZMjGRGbomqyZdPcX782Us/z/WxQHpzPKsVYXO+4ah4ZSHmc+WGLlL
	upkPcSJUeotdcvSVzpsKEqQZNo6Xvk3df7dqn4P6kfgAx3eCsdB/wTXWpK5rGZNua70RYFHASFF
	KmO9TC3QHsx+3v+92etYjqxHTL8yXOzV9taG6nzC6X9b+ytb9+KAG+e3FdR+69aNoycV1wM8tf4
	xsHr7Vwg+tcmvhk6Hli9Ec0YN78VY=
X-Google-Smtp-Source: AGHT+IEXuP3gduHDjZ+BJ+UcY5fM7ciYm9iPLAaAwZ5toDAd6Y+XsgFLolUEdBbI7QgsGC3wyhqL+A==
X-Received: by 2002:ac8:7d48:0:b0:4e8:a850:e7db with SMTP id d75a77b69052e-4f1b1acb520mr453381cf.71.1765313854144;
        Tue, 09 Dec 2025 12:57:34 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f02cdaf4e6sm100873991cf.3.2025.12.09.12.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 12:57:33 -0800 (PST)
Message-ID: <7e24110636db36e8c0a877d90d2ed9570c4aecf5.camel@ndufresne.ca>
Subject: Re: [PATCH] media: platform: mtk-mdp3: add WQ_PERCPU to
 alloc_workqueue users
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Marco Crivellari <marco.crivellari@suse.com>, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
 Frederic Weisbecker	 <frederic@kernel.org>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>,  Michal Hocko <mhocko@suse.com>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Matthias Brugger	 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno	 <angelogioacchino.delregno@collabora.com>
Date: Tue, 09 Dec 2025 15:57:32 -0500
In-Reply-To: <20251107141303.223254-1-marco.crivellari@suse.com>
References: <20251107141303.223254-1-marco.crivellari@suse.com>
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
	protocol="application/pgp-signature"; boundary="=-UeS4cSZwWRtHwAn48Sle"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-UeS4cSZwWRtHwAn48Sle
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le vendredi 07 novembre 2025 =C3=A0 15:13 +0100, Marco Crivellari a =C3=A9c=
rit=C2=A0:
> Currently if a user enqueues a work item using schedule_delayed_work() th=
e
> used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
> WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
> schedule_work() that is using system_wq and queue_work(), that makes use
> again of WORK_CPU_UNBOUND.
> This lack of consistency cannot be addressed without refactoring the API.
>=20
> alloc_workqueue() treats all queues as per-CPU by default, while unbound
> workqueues must opt-in via WQ_UNBOUND.
>=20
> This default is suboptimal: most workloads benefit from unbound queues,
> allowing the scheduler to place worker threads where they=E2=80=99re need=
ed and
> reducing noise when CPUs are isolated.
>=20
> This continues the effort to refactor workqueue APIs, which began with
> the introduction of new workqueues and a new alloc_workqueue flag in:
>=20
> commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
> commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")
>=20
> This change adds a new WQ_PERCPU flag to explicitly request
> alloc_workqueue() to be per-cpu when WQ_UNBOUND has not been specified.
>=20
> With the introduction of the WQ_PERCPU flag (equivalent to !WQ_UNBOUND),
> any alloc_workqueue() caller that doesn=E2=80=99t explicitly specify WQ_U=
NBOUND
> must now use WQ_PERCPU.
>=20
> Once migration is complete, WQ_UNBOUND can be removed and unbound will
> become the implicit default.

I have to admit, there is likely no review here due to the lack of knowledg=
e, so
in order to help educate myself (hopefully its not just me), can you explai=
n why
the new default of WQ_UNBOUND would not be a fit for this driver ? After al=
l,
the author didn't care and didn't make a choice, so I feel like its worth
asking.

cheers,
Nicolas

>=20
> Suggested-by: Tejun Heo <tj@kernel.org>
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
> ---
> =C2=A0drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c | 6 ++++--
> =C2=A01 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
> b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
> index 6559d72d5d42..9083367ae2e4 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
> @@ -255,14 +255,16 @@ static int mdp_probe(struct platform_device *pdev)
> =C2=A0		goto err_free_mutex;
> =C2=A0	}
> =C2=A0
> -	mdp->job_wq =3D alloc_workqueue(MDP_MODULE_NAME, WQ_FREEZABLE, 0);
> +	mdp->job_wq =3D alloc_workqueue(MDP_MODULE_NAME,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WQ_FREEZABLE | WQ_PERCPU, 0);
> =C2=A0	if (!mdp->job_wq) {
> =C2=A0		dev_err(dev, "Unable to create job workqueue\n");
> =C2=A0		ret =3D -ENOMEM;
> =C2=A0		goto err_deinit_comp;
> =C2=A0	}
> =C2=A0
> -	mdp->clock_wq =3D alloc_workqueue(MDP_MODULE_NAME "-clock",
> WQ_FREEZABLE,
> +	mdp->clock_wq =3D alloc_workqueue(MDP_MODULE_NAME "-clock",
> +					WQ_FREEZABLE | WQ_PERCPU,
> =C2=A0					0);
> =C2=A0	if (!mdp->clock_wq) {
> =C2=A0		dev_err(dev, "Unable to create clock workqueue\n");

--=-UeS4cSZwWRtHwAn48Sle
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaTiNPAAKCRDZQZRRKWBy
9FiwAP0fJ+8iO5Ik0RjPFylUjAq7S8bsNJJcC+1KzXvIKpRkNQEA3unsVtcMYzBe
Tyv8O0zclWEEPN7vZaUVvfJOXbdoVwU=
=UyuZ
-----END PGP SIGNATURE-----

--=-UeS4cSZwWRtHwAn48Sle--

