Return-Path: <linux-media+bounces-14313-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DB091BA64
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 10:50:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43690284687
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 08:50:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7566C14D43E;
	Fri, 28 Jun 2024 08:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vESb7BNX"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97572139D4
	for <linux-media@vger.kernel.org>; Fri, 28 Jun 2024 08:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719564618; cv=none; b=CMA1B7ZysyIikn+mfqyGRekXSpTfOxfHlYLc1lT7DzPOG/jaqrWCmV0w58eEjpxIB2PMIQ2asjePCd34auHnlYBxZJkyehLbcWTidurISb2DHnrIg+7CRR4EyMr3F5Nupdk7Da2ObAamh/EklVmi/0CvqGKbbIQ0YPbJtzBq5uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719564618; c=relaxed/simple;
	bh=+9duJ9v5tMaZ3WppIMSZBb193ALtb9UNSqsLfEzeBc8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NQb/liyudc6sb9jAGPdsRrMgqKqX9MXwZcQeZURuFfHBJUDsS+eqOGbWCsMIv0LjQmFF/9oyS46zOYHlBfPzU+5EO342w25gPu1hHGQsyZfJkTo1S059f/NO0mRqQ47lRVIVDC7IWXr3hwAeBJf4y4jat4zvlr/ejBgXQ6fGH6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vESb7BNX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CF02C116B1;
	Fri, 28 Jun 2024 08:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719564618;
	bh=+9duJ9v5tMaZ3WppIMSZBb193ALtb9UNSqsLfEzeBc8=;
	h=Date:From:To:Cc:Subject:From;
	b=vESb7BNXdz6zPUMEwif8vaK5wZ7rw3IQ32CFveP38HiCNdF/viNQRH3sofhhERTyV
	 E+RJhmwH6vxnMMkl9bE9AEfcxyQsDEqpKFsHmr+BVW5DLySbfHskx67AZtoWkilS2u
	 QTkVkE3m4U7dJlKN/vLPNsCtqXy+ES62Lyl/GzfLdl15NI4TncEkK2usR51ITRyHZ7
	 E0XHBuSc/LsWJm9WJxAI4CIkcPe3FqjXYi8hL88kh14hwkLa6x7N/QZhfc0fFShNzL
	 dRIJGH/u2MySipiUsv8XvgVyTO9x0hs8pkOiKdt6LN07ccXuCGLyaM1NA0Md8p1Rvd
	 dzx9NgTrRrATA==
Date: Fri, 28 Jun 2024 10:50:15 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	linux-media@vger.kernel.org
Subject: tc358743 EDID / hotplug bug?
Message-ID: <20240628-stoic-bettong-of-fortitude-e25611@houat>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ltgbac75g3vadbj3"
Content-Disposition: inline


--ltgbac75g3vadbj3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hans,

I've been playing with the unicam driver and the TC358743 HDMI -> CSI
bridge recently.

The program I was testing it with had a (arguably suboptimal) pattern
where it would (in a non-blocking way):

In a loop:
  - set EDID
  - In a loop:
    - call query_dv_timings
    - if we have a timing matching the mode we expect:
      - break the loop

  - Call s_dv_timings
  - Call s_fmt
  - Call reqbufs
  - Query and Queue all requested buffers
  - Call streamon
  - In a loop:
    - Dequeue the events
    - If there's a resolution change:
      - Call streamoff
      - Call reqbufs with 0 buffers to clear all buffers
      - Restart the entire sequence
    - Dequeue a buffer
    - Queue it again

This works mostly fine, but when trying to capture the boot of a device
connected on the other end, I'm always getting at some point an
resolution change event in the very first iteration.

The event itself looks fine: there's no remaining events at any point,
the sequence is correct, etc. However, this puts the s_edid call super
close to streamoff and the next s_edid call.

And it looks like the tc358743 driver doesn't like that very much and
the HPD pin ends up in the wrong state on the next iteration: both the
driver itself and the device at the other reports the hotplug pin as
being low, and thus, not connected.

I'm not entirely sure what is the reason, but I suspect a race in:
https://elixir.bootlin.com/linux/v6.9.3/source/drivers/media/i2c/tc358743.c#L403

Possibly due to the 100ms delay?

I've attached a kernel log with debug logs from both v4l2 and the driver
enabled.

The occurence I'm talking about starts at 149.457319, and you can see
that it looks like there's less than 100ms between the s_edid call
(149.488760) and the streamoff call (149.553513)

Thanks!
Maxime

--ltgbac75g3vadbj3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZn55RwAKCRDj7w1vZxhR
xalKAQCysk1yiJY2m7e/GMn8fm+Zvj0jJhQkVdpRDjErwy42xwEAou+dEeDFvsF2
4jjOrAyGzN8aEKnGjFfOcY/Drk1PCwk=
=AOW4
-----END PGP SIGNATURE-----

--ltgbac75g3vadbj3--

