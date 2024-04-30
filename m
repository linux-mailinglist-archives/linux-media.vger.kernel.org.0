Return-Path: <linux-media+bounces-10506-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D89318B81FB
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 23:39:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8AEB6285F95
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 21:39:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD0951BED6A;
	Tue, 30 Apr 2024 21:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Y3lmcpdE"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0EC11E52C
	for <linux-media@vger.kernel.org>; Tue, 30 Apr 2024 21:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714513184; cv=none; b=U9sXtsKSGFYnWmZJUJrD1NfkICDYq4Hv4zHywGRJSq+4TU+xisKhOj2l4wIT+GzviWVjjM9ZUxJW/vYPWeUSzirBWxkIZG13HA8dPsRGi1sA222f9kJglS2NEw1UItI9LGnu6rV1dGQsnR1LdCC9eCKiYyMNRvqwQ1LdA4QblqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714513184; c=relaxed/simple;
	bh=pt60BcWpYFaH/1tThZ4RMCBjchzn+FLr49ZZAr1CCMA=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=n9iIGeRzOg0OGY6B8HGHV1AC+2DzRE8dBPdIxpC/Stx83ItUX3nbbEoUEI9tgfZO3cMwdF+I0gAMKjgoWMO1ezKASYmMxtOunRfF5SlnwXjxtCDqrntJHQKCImQ2B5434OQ74jY8nB3Nbjpk/Y9/YpIl9hXsBvUzJzN764hGaG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Y3lmcpdE; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1714513175;
	bh=pt60BcWpYFaH/1tThZ4RMCBjchzn+FLr49ZZAr1CCMA=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To:From;
	b=Y3lmcpdEqr63iBFL0N4ihcOpaEqTr0zhRU1jZrneHXuLq1VSsqEsKhNZd5T7q5Nx8
	 slhDRMpQnkj0qgPTy5bz1/KfUmlf/+kq4Oso7MY//qhA4/vMaa2QWU5Nin6Euq0Qag
	 JA5Btf5xuEAFlz2FFzSA9WMsD2G58Ys5XgvrPB99WCogQTtDSKhlOVPZLU+9DP0+uI
	 GQ1pz9odAG1rOkK0k0W3vjg8itY681TCbX4W3hfo1bX5qfL3ITuUEhiM1RDD7TWjyN
	 c6tmTiRkuBvI/Bm+4+vibyHbh/DyZDoIXTOIRdB/TG1SpsxYL5mEFp4ssaz2F+E78t
	 GAdVPL+Hra0ww==
Received: from smtpclient.apple (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: dwlsalmeida)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 10F79378201A;
	Tue, 30 Apr 2024 21:39:33 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: Discuss the multi-core media scheduler
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <77872a349e77e61e69f160629e1b53a97bc472e4.camel@ndufresne.ca>
Date: Tue, 30 Apr 2024 18:39:22 -0300
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <3321FDF4-15F9-45AF-A7BF-36C5CFA863B2@collabora.com>
References: <3F80AC0D-DCAA-4EDE-BF58-BB1369C7EDCA@collabora.com>
 <77872a349e77e61e69f160629e1b53a97bc472e4.camel@ndufresne.ca>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
X-Mailer: Apple Mail (2.3774.500.171.1.1)


Hi Nicolas,


>=20
> There is one use case that isn't covered here that we really need to =
move
> forward on RPi4/5 is cores that can execute multiple task at once.
>=20
> In the case of Argon HEVC decoder on the Pi, the Entropy decoder and =
the
> Rescontruction is ran in parallel, but the two function are using the =
same
> trigger/irq pair.
>=20
> In short, we need to be able to (if there is enough data in the vb2 =
queue) to
> schedule two consecutive jobs at once. On a timeline:
>=20
> ----------------------------------------------------->
> [entropy0][no decoder]
>                      [entropy1][decode0]
>                                         [entropy2][decode1]
>=20
> Perhaps it already fits in the RFC, but it wasn't expressed clearly as =
a use
> case. For real-time reason, its not really driver responsibility to =
wait for
> buffers to be queued, and a no-op can happen in any of the two =
functions. Also,
> I believe you can mix entropy decoding from one stream, while decoding =
a frame
> from another stream (another video session / m2m ctx).
>=20
> Nicolas
>=20

I assume that the cores can be programmed separately, and that you can =
find which of the two
cores is now idle when processing the interrupt? i.e.: this is =
effectively the same scenario we have
with Mediatek vcodec?

If so, this is already covered.

Basically, whenever a core is done with a job, that will signal the =
pipeline to try and make progress. =20

i.e: you push `entropy0` and `entropy1` at the beginning of the =
pipeline, that will cause the entropy=20
decoder to start running. Whenever the entropy decoder is done, it will =
try to schedule the reconstruction
core with `decode0` and start working on `entropy1`.

When the reconstruction core is done, it will push `decode0` to the =
pipeline=E2=80=99s output
queue and grab `decode1` (from the queue it shares with the upstream =
core) to work on.

That way, all cores run concurrently, so long as there is work to do.

=E2=80=94 Daniel=

