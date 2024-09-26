Return-Path: <linux-media+bounces-18641-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A184987542
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 16:15:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA6101C24F05
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 14:15:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56E5B136352;
	Thu, 26 Sep 2024 14:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P4EBY8c8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16ED76410;
	Thu, 26 Sep 2024 14:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727360098; cv=none; b=eFxpDnaR1hJeQuyb1GYpgQ/6GjsTyh4FUSjsO6MrBBQeBlP4kgnfuoTqHRusamhup6URweYknEUGuv98LnFIjzLBMBzLD0/GKoEa2fdQGsRGSveo9p4Nzuupp5q9cCvus8FfZX4+G/z5SmhRDuKfMuarmuS+jnh3+LhHnerKA7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727360098; c=relaxed/simple;
	bh=xOYG5RGqxeLQkmMttklxNRWvBmW1y2v3QvsWponf7F8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mnQQ84DsNfPxzK5rpK6NokvasPhQi+B2CaXJ5ptJjxTcRqwY48qSc/gg7PWYy33k5l6jZSR2XMGsGIU7z4XhvkPVlwv8AmA/FRJqbk0VJkXvRhaXQ9vwzQj9LOyhScHBsshNiE18GSYUftZEXVcEMTz2sIIKlfs/gZ9N3oaVQT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P4EBY8c8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1BA2C4CEC5;
	Thu, 26 Sep 2024 14:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727360098;
	bh=xOYG5RGqxeLQkmMttklxNRWvBmW1y2v3QvsWponf7F8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=P4EBY8c8D7c4iGAO+4T3IyhZDELYEe74LPDGwT7whsmjEfrzXO3cYGW80RNobghBO
	 AXrNJVPUrSfrhWA8/T4HNZ2hJHbAGMn5XCvmWDUpPpk89h3CxZp3o+laoysO0A3Urk
	 g4XTmp8gqlReFGM6t4ZFujYiaI/ulOxzado4dbhd0A6PR7hpJcV022Gbl/PetTjZ7o
	 ohoXaol8K56ZqjAZpbEGK/swko6Rqz0hVnORS3rmcfK3gBMR+k0O2sVtCd4FQkuuD4
	 +NVkIIXSRlmDbW/9WXt2L/Oraqs3s2LpKPe3GVC5/v/ID3QA3zlHvfXq0y7a2/FbCz
	 EfOqqPKfp1VsA==
Date: Thu, 26 Sep 2024 16:14:50 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Hecht, Martin (Avnet Silica)" <Martin.Hecht@avnet.eu>
Cc: Sebastian Fricke <sebastian.fricke@collabora.com>, Hans Verkuil
 <hverkuil@xs4all.nl>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Tommaso Merciai <tomm.merciai@gmail.com>, Jacopo
 Mondi <jacopo.mondi@ideasonboard.com>, Benjamin Mugnier
 <benjamin.mugnier@foss.st.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Ricardo Ribalda
 <ribalda@chromium.org>, Michael Tretter <m.tretter@pengutronix.de>, Alain
 Volmat <alain.volmat@foss.st.com>, Sean Young <sean@mess.org>, Steve Cho
 <stevecho@chromium.org>, Tomasz Figa <tfiga@chromium.org>, Hidenori
 Kobayashi <hidenorik@chromium.org>, "Hu, Jerry W" <jerry.w.hu@intel.com>,
 "Suresh Vankadara" <svankada@qti.qualcomm.com>, Devarsh Thakkar
 <devarsht@ti.com>, "r-donadkar@ti.com" <r-donadkar@ti.com>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, Mehdi Djait
 <mehdi.djait@linux.intel.com>, Nicolas Dufresne <nicolas@ndufresne.ca>,
 Salahaldeen Altous <salahaldeen.altous@leica-camera.com>,
 kernelci@lists.linux.dev, Gustavo Padovan <gus@collabora.com>
Subject: Kernel CI media test - Was: Re: [ANN] Media Summit September 16th:
 Final Agenda (v7)
Message-ID: <20240926161450.5022ba06@foz.lan>
In-Reply-To: <FR4P281MB3434AE7AEB218146C9CD062CFD6C2@FR4P281MB3434.DEUP281.PROD.OUTLOOK.COM>
References: <98236d10-4024-4b96-a8ce-8e1dc2a34f1b@xs4all.nl>
	<20240917091744.qltmddftdy7bpgpg@basti-XPS-13-9310>
	<bb8c09c7-0eae-4e1a-8fb8-e325fcf326df@xs4all.nl>
	<20240918092454.21884920@sal.lan>
	<20240918093020.u5rz7qfjoumfezql@basti-XPS-13-9310>
	<FR4P281MB3434AE7AEB218146C9CD062CFD6C2@FR4P281MB3434.DEUP281.PROD.OUTLOOK.COM>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Martin,

Em Wed, 25 Sep 2024 22:53:42 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:

> Hi Martin,
>=20
> On Fri, Sep 20, 2024 at 12:16:29PM +0000, Hecht, Martin (Avnet Silica) wr=
ote:
> > Hey Hans and Mauro,
> >=20
> > I remember also on a very little point regarding hardware for testing.
> > But we didn't go in detail again during the summit.
> >=20
> > How do we can go ahead here? Are there some test systems up and
> > running somewhere centralized or how it is organized right now? =20
>=20
> Testing on real hardware is among our goals, but will require quite som
> extra work. We will likely need to setup lava labs and integrate them
> with media-ci. We had a discussion on Friday with kernel-ci developers,
> and we will probably benefit from ongoing work on their side. I don't
> think there's a plan to address this on our side in the very short term
> (mostly due to lack of time, we're currently focusing on getting
> media-ci up and running and integrated with the maintenance workflow).

With regards to integrating Avnet Silica labs for doing CI tests on
media hardware with upstream kernels, this is something I always wanted.

Yet, as Laurent mentioned, right now we're not doing it directly=20
(but I guess Collabora is doing it for some media drivers they're=20
developing).

=46rom the discussions I had during LPC and the ones I also had one year
ago at ELCE, it seems that the best way to do it is by using Kernel CI
to aggregate results from different test labs.

The main idea is to use Kernel CI for such purpose.

With such purpose, let's start a separate thread to discuss it together
with the Kernel CI community.=20

So, I'm c/c Kernel CI public ML here and Gustavo Padovan that have been=20
involved on several efforts related to that. I had some hallway=20
discussions with him during LPC.

It I recall correctly, we need to is:

1. To define a common test set (probably a subset of what we do=20
   already for the virtual drivers);
2. add hardware platforms to Kernel CI infrastructure;
3. add some logic at Kernel CI to execute the tests at the hardware
   that will be made available at the labs.

=46rom our discussions during the Media Summit, my understanding is that
Avnet Silica can help us with that by providing some hardware platforms
that could be integrated at Kernel CI infra and test real drivers with
real hardware. If you have someone to spare, maybe you can also contribute
with (1) and (3).

Anyway, this is just an introduction e-mail with what I captured so far
to start our discussions.


Thanks,
Mauro

