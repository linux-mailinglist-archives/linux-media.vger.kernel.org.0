Return-Path: <linux-media+bounces-36813-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 494C5AF8EBE
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 11:35:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3915EB614B0
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 09:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB6842E3AEC;
	Fri,  4 Jul 2025 09:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fxLeLunk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CF328D841;
	Fri,  4 Jul 2025 09:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751620035; cv=none; b=kaF4G6X0yrbr+R/QL13sdUHO4LskM7+mt6s+COoMnjhX7YxCnGOjRsUx3lD9KgBfjmwjYvonH0vno9Wpt9n/8pV5kSwq6q5jXtbDaLCZnFHlNY9qjCEvrsdcJ+6+EupSZmLEWdxWWAjChmeP2yxMrxxY3M0UqKuz7vFRosYDXV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751620035; c=relaxed/simple;
	bh=K/pDT6NEfs9vZStUh/AAp3iRYDEmDGOlly4bnEkujTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nlOd8jU0goUUZgJ1TBG97eueih9Jw/kHepA81aR3RP+MTwYpgVND10YGHrFBy6A+SUp94Akgeou2YxPbZdz0PCcafsGhLWgJOjivSnuIG28VLRzC1bZgX5TGZQmSA7R33ZmF8bWH6axkdCP3sKwQmBIoUZGuHdYG3f6umzywAWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fxLeLunk; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a548a73ff2so677341f8f.0;
        Fri, 04 Jul 2025 02:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751620032; x=1752224832; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VDywWjxdtqgZteOHlklAyHpSbZ7foh31pe/ikqYRz6k=;
        b=fxLeLunkwj8qY3FzOh1LVQ4z4mtZyL0Sc1t7BB21axAfVGQe1VbPZxBDS7nXsNB8t1
         wFi8J2jUwwJr2jbWeVExRyaqtNT9rrw2s1Hq4wTFTAjo9qhqpYf10KNP+0tQ1VKtn2Gx
         Z7UH2Fc6GC/8bCpNMQUU7sxH5OLLa84XrFrLUSwc9XGB5SmVZKpvSiFncIdQuX5b/g5r
         XA1DNsWq6pL2gC6mVNqH5r1RIrcUSg9jwWs2/eEqqqKeawcZIIYN56pJ6G/XGLESZ6zD
         XcHB2saL1FZZ38vpg2qhg1ABmXDkSgTHu8nSMDSWRzhc/x4yoDp9HpJARLwVb5WJAbxl
         GQ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751620032; x=1752224832;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VDywWjxdtqgZteOHlklAyHpSbZ7foh31pe/ikqYRz6k=;
        b=pV1TH/tk9gTEVgoiFcoaXAco231bMR+RW0kNgO93tA0IRJSMXvM70mCpekenqey3aW
         F9zaEjgtPlGsaSHLavjUuM48jbDA5Y5PiuiL8JG18POAeLFfQvqtSiYhJi036ypVybBh
         944cfa9GW7Kww05ej/BfTILcJUzSoY/yazlNvuLJCRIP8u7jzWmTrGvVxwTqI2WuOkC5
         A3rUcFIB370fjrqEDzN1ZHcVOnbItCwIaY1XUqMLr9gTskUmpmJCPFEiQZA8pLR+wG8/
         QYRuBUrGcJ+WxP/aO/HhnvRsxO5ZTr1x1erJcHHbSN0jmZ4cYoKGXSnfcIaRzkhi33Ni
         MfDA==
X-Forwarded-Encrypted: i=1; AJvYcCVm1BeyQ7S75s6sLBaTUVQRCx6UFf04KS9ELMPaH1XqYXYnMXSSrSot3iERsQ8R6QngDqEVddjmju+/hYo=@vger.kernel.org, AJvYcCVpIXruhUcoCU5TpVT8LDFlzdvvJ3PSj2UIcozpDr25ZYQWNiXMcDJFjTwT8CM7BGKQS5bPllEBxxmmRvQh@vger.kernel.org, AJvYcCWJo35zE3L/CT5ZKMOOdfJfZgNRC1yf23eu2Qp2+8iOaWVSxDlBZjNamUxip96+1fXoP+UvakLAjQ9bnKA=@vger.kernel.org, AJvYcCXKUZF2SOtL7dNGRSi0m09+OBvC/6cg0BlI/1Ho3WR29Z/AbukVEdzzJ3YfQj5BJ9CpP89Z5gC9Ve9+2N34@vger.kernel.org
X-Gm-Message-State: AOJu0Yz17CMHMtWKrXmNzdckXsJT+f+j1ie+2gDDTYOp5ihM6ZGgCX5e
	5Xt53ppIjTK6Zw0rCSsVjjZo6HkKKmCkfNKaHqnOkJXqEVrFJ4hpnYqL
X-Gm-Gg: ASbGncuIi+UKiqFmUkxvn5oQU1VvrchNtnz/y4zyRJAYzB37Oqtlvkrfl70Dgv4dq/B
	hHjlHN/KRedNJAUu3q4kLx9TQUnoFBGpvQw4L54lMYhjqVLFZz2n22WGjBtKWAHNJGoDF30HuCs
	3FatvrOjGS6mm0NCsyJxQpjaKRM6Vic5dDmkqnv1SMYGZDxJNNQVc7nA4acSmqKC1XZPFBO9524
	jFuCcMvqd37BQiloOjywRxV3TSNXYvacnkeig9nY5O9mswGNrI2Eb5OPRRWy/dYLcFKris7GMV/
	x0FX42NMRXCUMHWZaHZYwcgddGdBwfSdYMSQfnRCW0P+q+ShaMupb2F5QqvPcB6vEO4jNCfEsNz
	x2uuYubYnJrlLxwvZghCjPFaagKc2kvaQk0Gj5eGTm6XfyiG4
X-Google-Smtp-Source: AGHT+IHEPxQdMHTXbR1zyfFVxzPQhYfItopt0GRpKhNC4icZ8avdDH2El8o9lUAz/MQc695EIAp2Fw==
X-Received: by 2002:a5d:5d8a:0:b0:3a4:e4ee:4c7b with SMTP id ffacd0b85a97d-3b4964f8be8mr1457452f8f.15.1751620031616;
        Fri, 04 Jul 2025 02:07:11 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47285c9f9sm1967858f8f.93.2025.07.04.02.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 02:07:10 -0700 (PDT)
Date: Fri, 4 Jul 2025 11:07:07 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tommaso Merciai <tomm.merciai@gmail.com>, 
	Martin Hecht <mhecht73@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Alain Volmat <alain.volmat@foss.st.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Umang Jain <umang.jain@ideasonboard.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Michael Riesch <michael.riesch@collabora.com>, 
	Mikhail Rudenko <mike.rudenko@gmail.com>, Steve Longerbeam <slongerbeam@gmail.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Nicholas Roth <nicholas@rothemail.net>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Paul Elder <paul.elder@ideasonboard.com>, Matt Ranostay <matt@ranostay.sg>, 
	Nas Chung <nas.chung@chipsnmedia.com>, Jackson Lee <jackson.lee@chipsnmedia.com>, 
	Dmitry Osipenko <digetx@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Vikash Garodia <quic_vgarodia@quicinc.com>, Dikshita Agarwal <quic_dikshita@quicinc.com>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Sean Young <sean@mess.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Matthias Fend <matthias.fend@emfend.at>, Marco Felsch <m.felsch@pengutronix.de>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Ricardo Ribalda <ribalda@chromium.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 41/80] media: Remove redundant
 pm_runtime_mark_last_busy() calls
Message-ID: <oanwnvwlfewhtihgxqhxeuyayiqehzryqdsvmq5hku62nn7ri7@favwssinmjjq>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
 <20250704075431.3220262-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kwmvyrwxhkrq3xlc"
Content-Disposition: inline
In-Reply-To: <20250704075431.3220262-1-sakari.ailus@linux.intel.com>


--kwmvyrwxhkrq3xlc
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 41/80] media: Remove redundant
 pm_runtime_mark_last_busy() calls
MIME-Version: 1.0

On Fri, Jul 04, 2025 at 10:54:31AM +0300, Sakari Ailus wrote:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
>=20
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
[...]
>  drivers/media/platform/nvidia/tegra-vde/h264.c           | 2 --
[...]

Acked-by: Thierry Reding <treding@nvidia.com>

--kwmvyrwxhkrq3xlc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhnmbsACgkQ3SOs138+
s6HR2g/+NoY3pcxcF7vUmDQS013DsHFgpV+Tl+JcGqzntxo7nvqoPqTVCDHLybr8
bkYad4XE946YrelbKsxzncJn4vZjVB6qrGMujyv65H8WfO7AG6nzlibOIunL8WOd
Y+uxVe5SBCDS7bajKFtmuEKFnz08e0bpIWOgKkOauDAuEkrbPsqXXYSUxXE+pf0z
8XTFc6AQAMeg4AQTnDMUYRA1FgHi5ZQCFhedxjKRmXSQd+P8td6GZsvYK427AWyK
mvKwRu4NPb6FosulEpEctkbpI6ObbN7fAUdjbIlSIHnNm9L/GDApH3zAGn5oGT0q
m1XodmUsGZHRJt7KEzAqHqx2pzM/ab9UNEJGDaCMzpYGJMjowIYpoVgxubKmwVUV
YgVNJ0IZL4QrGL5yr1S5XZD0+0pi+vH0nrjX9MewaJyhDebyBNKuifREtuPndWqS
hXBQXVtSFW/mMCCxyMYmmT6GBNjnbd+vaTiRFGCNz1cds0nz0F3LtGTAg+UjGe7o
p5+7dWzdafTk8aIeGY6Pozuei+LziegbVWpegNMLkK9TRVwm21bKvhggMay1Fl8z
R3OBaZKmkHmsqC25vsdaVhwNjFoR36UqmGhXUMnl3gl4aee0lbG6nCqJKBAfCJUa
dkGr3BlRGwk0DC98kTAVD7TUuwmROlTKR5tlcoLgvi7rPb/C/Ek=
=tZ0M
-----END PGP SIGNATURE-----

--kwmvyrwxhkrq3xlc--

