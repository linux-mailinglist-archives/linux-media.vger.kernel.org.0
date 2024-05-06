Return-Path: <linux-media+bounces-10864-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C008BCD60
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 14:05:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BB5F285E35
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 12:05:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F61B143889;
	Mon,  6 May 2024 12:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NDyJNXDR"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2AE39FF4
	for <linux-media@vger.kernel.org>; Mon,  6 May 2024 12:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714997119; cv=none; b=EoSnffmOpmYd2clDfkSqFsskH7Wxdnp7fwZpTGfC6ewMCSi4COFmXy2zdhJsPYIsXBFpumUdO17v1oG8+MbMCmsRF8y1UVDyImkVYzXd1oFHvAMQtraDlb+t8vNQ70N4v7WOvt3ZjaGRPfwYrLgdnkLcRS3EynnN4598hS/eIkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714997119; c=relaxed/simple;
	bh=wg4P/Pbqq/XpQKnqNmu961tyb2/1PRVK/1FUHgvoSas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YdEPZkGUyBh4/tOA+tauL69D5CKm3MRIeQdVZMgp8fdhi8AGMIN1HVcwzH5Ef82+q8wfn4K7M5dz4JOqWUDPft8+pNdWxAyyeXoV6HypomgFD3K9KAxymdLOomQE/oC6/KPzMFJ1X86s9fb8Aiz2MQT545jLkFbLLKQ4iAMDxB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NDyJNXDR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714997117;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wg4P/Pbqq/XpQKnqNmu961tyb2/1PRVK/1FUHgvoSas=;
	b=NDyJNXDR4hTXeX3TtVpq4DrssS4cOeCWQdYWIeIR4gK+TJg2xEqyBjTw1VMg1+YdOSO+mO
	sd7HqcD+jyvWW2g6U3lWorhw01zoznqG1vnFpJbRbyE04RW1htKqwq6/B5HDBzOa9U2JGn
	nBo18C/5zVvsDtqlW2Andg4TA+wHW9g=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-54-HhFDh1E6POejYbOsmcnmpA-1; Mon, 06 May 2024 08:05:15 -0400
X-MC-Unique: HhFDh1E6POejYbOsmcnmpA-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-51f8cf57f17so1334368e87.1
        for <linux-media@vger.kernel.org>; Mon, 06 May 2024 05:05:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714997114; x=1715601914;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wg4P/Pbqq/XpQKnqNmu961tyb2/1PRVK/1FUHgvoSas=;
        b=YUuyRih88jRP+qADpFatMBg5GUuikthVvQ4KOQlwqlvc+oPH7K6xArSircFEoT8nKV
         Tm6aUMq81tTMBIxpX5QR7p7+33Jn4rIn6Gj7BXk6Sci8+JTmXzhIsYn6HOvusoP43tbO
         4TjoPbgxX7C8yVg5brvAW8yBfCSWRw5+mImQoKUm4bzXej78hMJTod295nWOPdTktfzg
         IbErDMnU0DaaRbjZpvLrgpJ03GHL3WsCniZb5wy5tOlDz/jV7xlBvgrRDOQAVTebrrMK
         ZIEI4hMkdObTVe3qud2/tffk6ovh76mhuAecaDpKySGQ6HEH7NxCCu5+kxT8/qrwX0aL
         C4vQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbFU1G4bph0gx+TNo+o6sVgqlUovcJt2U3XQcChbZwHTJ08o91Ik9v/O0ZbV04i4NSkJ3UtKnnf9TtKi4Mk/9FbBJFm6ufuGoa39s=
X-Gm-Message-State: AOJu0YyBXCLjcNEEUx3/crJQn5zqxi57iQOzGADclkY2ZSxa5aJvZ6v0
	IdbBmb0Z+dDpJ5OpxeEvRUdQ0Y4F3sjGew2Hq48wHbp5bJY24xHJCBLE44CvtzXacm6K/iJbkNk
	SUV8smC1zWlN8Y71hIwBh+IE85Fl/7sibwJo6spiyi+FMye1BV25R4Q6NHIHL
X-Received: by 2002:a05:6512:3ba:b0:51c:d528:c333 with SMTP id v26-20020a05651203ba00b0051cd528c333mr5199774lfp.20.1714997113691;
        Mon, 06 May 2024 05:05:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHphnXY9iSaGnb+HJd4yfUj7KyxshMeIg/OSpxyANFwIkap9NrMHL6tDBSURF261b7+6kCIdw==
X-Received: by 2002:a05:6512:3ba:b0:51c:d528:c333 with SMTP id v26-20020a05651203ba00b0051cd528c333mr5199738lfp.20.1714997112973;
        Mon, 06 May 2024 05:05:12 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
        by smtp.gmail.com with ESMTPSA id bh10-20020a05600c3d0a00b0041c130520fbsm15791169wmb.46.2024.05.06.05.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 05:05:12 -0700 (PDT)
Date: Mon, 6 May 2024 14:05:12 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Lennart Poettering <mzxreary@0pointer.de>, 
	Robert Mader <robert.mader@collabora.com>, Sebastien Bacher <sebastien.bacher@canonical.com>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Milan Zamazal <mzamazal@redhat.com>, Andrey Konovalov <andrey.konovalov.ynk@gmail.com>
Subject: Re: Safety of opening up /dev/dma_heap/* to physically present users
 (udev uaccess tag) ?
Message-ID: <20240506-dazzling-nippy-rhino-eabccd@houat>
References: <bb372250-e8b8-4458-bc99-dd8365b06991@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="gbe3pjich3tg5p2e"
Content-Disposition: inline
In-Reply-To: <bb372250-e8b8-4458-bc99-dd8365b06991@redhat.com>


--gbe3pjich3tg5p2e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, May 06, 2024 at 01:49:17PM GMT, Hans de Goede wrote:
> Hi dma-buf maintainers, et.al.,
>=20
> Various people have been working on making complex/MIPI cameras work OOTB
> with mainline Linux kernels and an opensource userspace stack.
>=20
> The generic solution adds a software ISP (for Debayering and 3A) to
> libcamera. Libcamera's API guarantees that buffers handed to applications
> using it are dma-bufs so that these can be passed to e.g. a video encoder.
>=20
> In order to meet this API guarantee the libcamera software ISP allocates
> dma-bufs from userspace through one of the /dev/dma_heap/* heaps. For
> the Fedora COPR repo for the PoC of this:
> https://hansdegoede.dreamwidth.org/28153.html

For the record, we're also considering using them for ARM KMS devices,
so it would be better if the solution wasn't only considering v4l2
devices.

> I have added a simple udev rule to give physically present users access
> to the dma_heap-s:
>=20
> KERNEL=3D=3D"system", SUBSYSTEM=3D=3D"dma_heap", TAG+=3D"uaccess"
>=20
> (and on Rasperry Pi devices any users in the video group get access)
>=20
> This was just a quick fix for the PoC. Now that we are ready to move out
> of the PoC phase and start actually integrating this into distributions
> the question becomes if this is an acceptable solution; or if we need some
> other way to deal with this ?
>=20
> Specifically the question is if this will have any negative security
> implications? I can certainly see this being used to do some sort of
> denial of service attack on the system (1). This is especially true for
> the cma heap which generally speaking is a limited resource.

There's plenty of other ways to exhaust CMA, like allocating too much
KMS or v4l2 buffers. I'm not sure we should consider dma-heaps
differently than those if it's part of our threat model.

> But devices tagged for uaccess are only opened up to users who are=20
> physcially present behind the machine and those can just hit
> the powerbutton, so I don't believe that any *on purpose* DOS is part of
> the thread model.=20

How would that work for headless devices?

Maxime

--gbe3pjich3tg5p2e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZjjHcwAKCRAnX84Zoj2+
dtGRAX9KOFTUx08TR6/BPgCjqz6x5kwTQyME2k4EktSNP9VtdPA/QywEsUKG9cMf
YI+IcV8BfA9X629JAJvBtP5fq6/WotSONpmpfH5NFifseTSPHNkYTsgEh02n5sXC
NsrXhvP+8g==
=rIyT
-----END PGP SIGNATURE-----

--gbe3pjich3tg5p2e--


