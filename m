Return-Path: <linux-media+bounces-28718-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4979DA70389
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 15:22:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C49FA3A832F
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 14:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E9CD259CA4;
	Tue, 25 Mar 2025 14:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fbb9MmNo"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599DA13AA2E
	for <linux-media@vger.kernel.org>; Tue, 25 Mar 2025 14:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742912197; cv=none; b=uTh3pAI+tdIamm3KTvwiMUoUgK9PzsHQXIIUolkMy6a1IDyZy+NsIxt4hcG/oSloKwu7qx+HN1jJQXH9TP0GpknkUwOJxWx0ygw4rPOnna0gZqA3FLza3m7bkpOEycQfMZYwygXl1GSMKD/T8sS88KRJb/MLWNTsZ4ZvUl5nfbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742912197; c=relaxed/simple;
	bh=En209Tf/ES6jI5ufgxg6RbhAKPcJBzJBwSYZAZ0lXz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ry61w7HTW0/sPTlPrcBai6VyW9UTkrRFsSq6mZGTk4yfo5RrSluq8eTxrxm41jrmuXiLzm26agxeckOCkymtcR87GezfWXw661PBr+IhBJGAKlDibh+ZkgCZw/Q3FHTherLt5CJoEMTOl/RytRj1xPTcvzftvLD9S1vftxY44vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fbb9MmNo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BAE1C4CEEA;
	Tue, 25 Mar 2025 14:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742912195;
	bh=En209Tf/ES6jI5ufgxg6RbhAKPcJBzJBwSYZAZ0lXz8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fbb9MmNoMMOOJ89joApDO/q0sxtsjAXYbmxUrY7NifWAZRmgcGoqAVvcS0AZiWCMq
	 IoahdNQOcZz7+GUgIBKNsqh/R9Ysk3Nd46voXpHp/N74YyLPNYQG+GPTxmcsqgOz2p
	 bJbvKH+MURM3fKYtmCcLXG3kyuKFNXil4ITGVaeHnxmxXknGgT9pnzc6tGIMZaju3o
	 h+Db1OJGq+tBZmOs8REPMg6UfTsJTPVhlHLW0D2PzYYjPjm8PBtCg3Nf6O7ipuycSY
	 lzIoef9ziUR96xbqLeW3Dooom4Iu3D/9vwnrlxkz+zrKZwXmD5Sks02MHEo1JqPsJB
	 YRvhZGOydsFRQ==
Date: Tue, 25 Mar 2025 15:16:33 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	linux-media@vger.kernel.org
Subject: Re: tc358743 EDID / hotplug bug?
Message-ID: <20250325-dynamic-sexy-bobcat-0b7d69@houat>
References: <20240628-stoic-bettong-of-fortitude-e25611@houat>
 <f780e747-0159-48d5-aef9-2ed324feeae2@xs4all.nl>
 <20240702-certain-lion-of-focus-692c12@houat>
 <6750a726-d02f-4da8-83ae-6badedcf35f7@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="w5yvhgkhwh6nxtd4"
Content-Disposition: inline
In-Reply-To: <6750a726-d02f-4da8-83ae-6badedcf35f7@xs4all.nl>


--w5yvhgkhwh6nxtd4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: tc358743 EDID / hotplug bug?
MIME-Version: 1.0

Hi Hans,

Sorry, it took a while.

On Tue, Jul 02, 2024 at 06:01:41PM +0200, Hans Verkuil wrote:
> On 02/07/2024 16:22, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Mon, Jul 01, 2024 at 10:29:55AM GMT, Hans Verkuil wrote:
> >> Hi Maxime,
> >>
> >> On 28/06/2024 10:50, Maxime Ripard wrote:
> >>> Hi Hans,
> >>>
> >>> I've been playing with the unicam driver and the TC358743 HDMI -> CSI
> >>> bridge recently.
> >>>
> >>> The program I was testing it with had a (arguably suboptimal) pattern
> >>> where it would (in a non-blocking way):
> >>>
> >>> In a loop:
> >>>   - set EDID
> >>>   - In a loop:
> >>>     - call query_dv_timings
> >>>     - if we have a timing matching the mode we expect:
> >>>       - break the loop
> >>>
> >>>   - Call s_dv_timings
> >>>   - Call s_fmt
> >>>   - Call reqbufs
> >>>   - Query and Queue all requested buffers
> >>>   - Call streamon
> >>>   - In a loop:
> >>>     - Dequeue the events
> >>>     - If there's a resolution change:
> >>>       - Call streamoff
> >>>       - Call reqbufs with 0 buffers to clear all buffers
> >>>       - Restart the entire sequence
> >>>     - Dequeue a buffer
> >>>     - Queue it again
> >>>
> >>> This works mostly fine, but when trying to capture the boot of a devi=
ce
> >>> connected on the other end, I'm always getting at some point an
> >>> resolution change event in the very first iteration.
> >>>
> >>> The event itself looks fine: there's no remaining events at any point,
> >>> the sequence is correct, etc. However, this puts the s_edid call super
> >>> close to streamoff and the next s_edid call.
> >>>
> >>> And it looks like the tc358743 driver doesn't like that very much and
> >>> the HPD pin ends up in the wrong state on the next iteration: both the
> >>> driver itself and the device at the other reports the hotplug pin as
> >>> being low, and thus, not connected.
> >>>
> >>> I'm not entirely sure what is the reason, but I suspect a race in:
> >>> https://elixir.bootlin.com/linux/v6.9.3/source/drivers/media/i2c/tc35=
8743.c#L403
> >>>
> >>> Possibly due to the 100ms delay?
> >>>
> >>> I've attached a kernel log with debug logs from both v4l2 and the dri=
ver
> >>> enabled.
>=20
> The relevant part is here:
>=20
> [  149.457319] Starting new Test
> [  149.460387] tc358743 10-000f: tc358743_s_edid, pad 0, start block 0, b=
locks 2
> [  149.460396] tc358743 10-000f: tc358743_disable_edid:
>=20
> HPD is pulled low here.
>=20
> [  149.486259] tc358743 10-000f: tc358743_enable_edid:
> [  149.486268] tc358743 10-000f: tc358743_enable_interrupts: cable connec=
ted =3D 1
>=20
> Here the delayed work is started.
>=20
> [  149.488760] video0: VIDIOC_S_EDID
> [  149.495353] tc358743 10-000f: tc358743_query_dv_timings: 1280x720p60.0=
0 (1650x750)
>=20
> But here the tc358743 accepts a query_dv_timings call, even though the so=
urce
> should have stopped transmitting because the HPD went low.
>=20
> [  149.502929] video0: VIDIOC_QUERY_DV_TIMINGS
>=20
> ...
>=20
> [  149.555039] Starting new Test
>=20
> And the new test started within 100 ms of the previous test, so we never =
saw the
> tc358743_delayed_work_enable_hotplug call that pulls the HPD high.
>=20
> [  149.558153] tc358743 10-000f: tc358743_s_edid, pad 0, start block 0, b=
locks 2
> [  149.558163] tc358743 10-000f: tc358743_disable_edid:
>=20
> HPD is pulled low here.
>=20
> [  149.584032] tc358743 10-000f: tc358743_enable_edid:
> [  149.584041] tc358743 10-000f: tc358743_enable_interrupts: cable connec=
ted =3D 1
> [  149.586526] video0: VIDIOC_S_EDID
> [  149.587052] tc358743 10-000f: tc358743_get_detected_timings: no valid =
signal
> [  149.587057] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
> [  149.687340] tc358743 10-000f: tc358743_delayed_work_enable_hotplug:
>=20
> HPD is pulled high here (about 100 ms later).
>=20
> I think the solution might be ensure that tc358743_get_detected_timings()
> returns -ENOLINK if the HPD is low. So add:
>=20
> 	if (!(i2c_rd8(sd, HPD_CTL) & MASK_HPD_OUT0))
> 		return -ENOLINK;

This fixes the issue indeed.

I still can't wrap my head around what the race condition leading to HPD
always being low is exactly. I tried to write a commit log and just failed =
:)

Can you send that patch with my Tested-by, or explain it some more?

Thanks again,
Maxime

--w5yvhgkhwh6nxtd4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ+K6wQAKCRAnX84Zoj2+
dllmAX9d9Ym8G6hamLnvMgG3NuGYKkeqlgFyjA+YDVJK+Gn1QznZ+iiW32s9hlp6
WweHpeoBf119DXF+psU/QO5N1xVy5ay4TocWFfv3z7FB4bq8g5I3LWcHWx1sNgjn
2crrqF0hUg==
=BWa/
-----END PGP SIGNATURE-----

--w5yvhgkhwh6nxtd4--

