Return-Path: <linux-media+bounces-4445-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C8F8429C0
	for <lists+linux-media@lfdr.de>; Tue, 30 Jan 2024 17:42:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 96E63B29577
	for <lists+linux-media@lfdr.de>; Tue, 30 Jan 2024 16:42:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0B2E36102;
	Tue, 30 Jan 2024 16:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bZ1Uckbo"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD22823AA
	for <linux-media@vger.kernel.org>; Tue, 30 Jan 2024 16:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706632909; cv=none; b=Mc1HpPUEygsQu02FaIvhAGUFiHhwYVTDSun4IZ9/cpjCSCyPQMEet4PmvK/EJPdqLGVhbyZN4VlgLBXqF0FXIvKkUeks+iyRGMj8VY9JmlNvVD0CUJkjYhbx4SIzf181BVawv4g9ECn6ia0W4/BuBvNNPojCQiRFJP7zzQDcC/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706632909; c=relaxed/simple;
	bh=0a8Vv0gX5TmfcBehEaGEXroXN+WTwGWZK2Ym5VnWplo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YjmoQADpY73tFWpd7/DZm8GK+gt8WObPZnD1TqL4O5M6dGCgzQ84/eiI12qA/vEoRthmuaD6JPV7RNo8B5VNA/LCBNFiQTzJYikOVe3c23HFm9ddXM5jGD3v7G9wOgRqX9U9kPQrxHpzSC97ybeJPpaGf8f+LgLmpoIuucL54ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bZ1Uckbo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04708C433C7;
	Tue, 30 Jan 2024 16:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706632908;
	bh=0a8Vv0gX5TmfcBehEaGEXroXN+WTwGWZK2Ym5VnWplo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bZ1Uckbo4CR9c3Xkk4yXt5LLyTnT5tCLuAqdKFPoxMVDEwoiD/NOacozH5fH5tKrQ
	 QEt8dXjF726CparF6J+UykLFJSUAp4DDKj8OpyrhgDv2ITGWk36yEfze80cHo3xw8W
	 cFfFSGfSaCDcQJOUNnfclsbg17EZkiJQnCo7qKXRUWD5bx4zf0aEKVdsotkP/42NAf
	 78nAEPOwVLIgqAxPe6v/HHa+WUcym1tLXBO5g7FJjOVk2j2g9iq4rOrS+3beHX6aIO
	 JFtku2PgpT0qO5rbehSIvYDVSrN9oMcpVBjANmZGJMK25dAqHOBYKY05JhdgLS5DdH
	 TQDQRs3Ocqk5Q==
Date: Tue, 30 Jan 2024 17:41:44 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: linux-media@vger.kernel.org
Subject: Re: RESEND: RFC: dtv-scan-tables: plans to upstream changes from
 Tvheadend.org
Message-ID: <20240130174144.64f0f5b6@coco.lan>
In-Reply-To: <3880598D-563D-4A40-A7E4-0AE9C655443F@gmail.com>
References: <3880598D-563D-4A40-A7E4-0AE9C655443F@gmail.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Christian

Em Mon, 29 Jan 2024 11:30:26 +0400
Christian Hewitt <christianshewitt@gmail.com> escreveu:

> Resending due to no response since 12th Jan:
>=20
> Hello Mauro,
>=20
> The Tvheadend project bundles dtv-scan-tables in our deb/rpm packages. We=
 have
> our own repo for them; an unmaintained fork of someone else=E2=80=99s unm=
aintained fork
> of the upstream linuxtv repo https://git.linuxtv.org/dtv-scan-tables.git.

Maintaining forks are hard :-)

>=20
> To improve things for everyone we are planning to retool around the linux=
tv.org
> repo and would like to sync/upstream the differences to you. The current =
diff
> can be seen here:=20
>=20
> https://github.com/chewitt/dtv-scan-tables/compare/master...tvheadend

Wow! diff sounds huge!

> The main challenges are, a) scrappy descriptions, b) contributor real-nam=
es and
> email are missing from most of them, c) multiple contributors to the same=
 files
> over time.
>=20
> I was thinking to send a series with one patch for each country-code to r=
educe
> the number of patches to review, with links to original pull-requests in =
patch
> descriptions to provide attribution to original changes, and any other in=
fo
> like URLs added to files as comments if the links still work.

Works for me. I also have a couple of scripts here to help updating from=20
https://www.lyngsat.com/ and from a Brazilian site for ISDB-T.=20

I'm run them right now to update dvb-s and isdb-t channels. With that,
it probably won't make sense for you to update dvb-s/s2 and isdb-t channels
from tvheadend fork.

Still, we have gaps on dvb-c/t/t2 and atsc.

> Moving forwards we plan to add a PR template to our GitHub repo that enco=
urages
> patches to be sent directly to the linux-media list; or for contributors =
to
> provide us with real-name/email for attribution so we can upstream patche=
s on
> their behalf, or remain anonymous but give permission for patches to be s=
ent
> under Tvheadend attribution (likely as myself).

Makes sense. Once we get this in sync, we can discuss further about how to
keep it updated.

> Would my per-country-code patch suggestion work for you? or how would you=
 like
> us to handle the changes?

Per-country-code seems good to me, but the sync has to happen on both
directions, as we've been receiving channels upstream too. Checking what
is the more updated version can be harsh, as you'll need to check it patch
per patch.

>=20
> Regards, Christian
> chewitt@tvheadend.org
>=20
> NB: The pending patch from Simon Liddicott [0] reduces the diff. Could th=
at be
> merged soon?
>=20
> [0] https://patchwork.linuxtv.org/project/linux-media/patch/2023021601052=
8.5921-1-simon@liddicott.com/

Merged, thanks!

Thanks,
Mauro

