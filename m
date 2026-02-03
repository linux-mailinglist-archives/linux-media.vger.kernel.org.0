Return-Path: <linux-media+bounces-52135-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFRpGGxrgmkpUAMAu9opvQ
	(envelope-from <linux-media+bounces-52135-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Feb 2026 22:41:00 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B43E1DEE67
	for <lists+linux-media@lfdr.de>; Tue, 03 Feb 2026 22:40:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 152603036D62
	for <lists+linux-media@lfdr.de>; Tue,  3 Feb 2026 21:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4F7236D4FA;
	Tue,  3 Feb 2026 21:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=natalenko.name header.i=@natalenko.name header.b="idHg9DeE"
X-Original-To: linux-media@vger.kernel.org
Received: from prime.voidband.net (prime.voidband.net [199.247.17.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66320F50F;
	Tue,  3 Feb 2026 21:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.247.17.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770154801; cv=none; b=aaoZtiJnOzl9uuyauQihNO7KYxLcyDuhajPgCMqVEC81d4/d0vBp8GG/LorY1Wn8WbsMSm3o9Tkg9G/hIKkNk6Bp1RFGbgJPHaCrkXR7lbpGYSGuoRgqbsv+QL5CVgsuYalmEtDx+yGGmeyv0Vl3+X2Z+SEtLsqT0U39hfaPx+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770154801; c=relaxed/simple;
	bh=XffciXnZ907f78eYALyOFTInKX8bLvoO/C5+bAntWI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j559DjagIYKc1pAb9vypgisAlD23BorItdjWwxg5mCXdYmkED9QzIkZHjnGgYjDr2O84Pwh5thiTfxpDxzjcRQjiRNrTqedifMxBJicSQDzQac6nD+i62pSvW0olbPK7bfqdfKg/iHnnlQRZgs2e7qZTQ2JaJPJM4/JGtkzHi8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=natalenko.name; spf=pass smtp.mailfrom=natalenko.name; dkim=pass (1024-bit key) header.d=natalenko.name header.i=@natalenko.name header.b=idHg9DeE; arc=none smtp.client-ip=199.247.17.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=natalenko.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=natalenko.name
Received: from spock.localnet (unknown [212.20.115.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by prime.voidband.net (Postfix) with ESMTPSA id 553DC635B044;
	Tue, 03 Feb 2026 22:39:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=natalenko.name;
	s=dkim-20170712; t=1770154795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YExBc/2l3cSDdDNMiSHxvAvJ2THL7Ijl6HTRTyITesA=;
	b=idHg9DeE5casi/yHIei2OBuR14sNznYs7vY7PXsK7CO1tGdzbPv0y6+3NcZx9/uZ0uQ9e/
	l4MhOP1TR4d/BbyVfJYLgHMM9N/VLT6/cr+1HXcai5VgIeWQMFDZvPT0J85ozQRtyObwoP
	EICUmUCgEb44VmvbWDat3puIQVWWfB8=
From: Oleksandr Natalenko <oleksandr@natalenko.name>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Gergo Koteles <soyer@irl.hu>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jarkko Sakkinen <jarkko@kernel.org>, linux-media@vger.kernel.org,
 jani.nikula@linux.intel.com, anisse@astier.eu,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Ricardo Ribalda <ribalda@chromium.org>,
 open list <linux-kernel@vger.kernel.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: Re: [RFC PATCH] media: Virtual camera driver
Date: Tue, 03 Feb 2026 22:39:41 +0100
Message-ID: <6235268.lOV4Wx5bFT@natalenko.name>
In-Reply-To: <20260203203648.GA56480@killaraus>
References:
 <20260201133342.335680-1-jarkko@kernel.org>
 <20260203145341.GB33304@killaraus> <20260203203648.GA56480@killaraus>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5074405.31r3eYUQgx";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
x-ms-reactions: disallow
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[natalenko.name,reject];
	R_DKIM_ALLOW(-0.20)[natalenko.name:s=dkim-20170712];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-52135-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[natalenko.name:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksandr@natalenko.name,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,huawei];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B43E1DEE67
X-Rspamd-Action: no action

--nextPart5074405.31r3eYUQgx
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Oleksandr Natalenko <oleksandr@natalenko.name>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [RFC PATCH] media: Virtual camera driver
Date: Tue, 03 Feb 2026 22:39:41 +0100
Message-ID: <6235268.lOV4Wx5bFT@natalenko.name>
In-Reply-To: <20260203203648.GA56480@killaraus>
MIME-Version: 1.0

On =C3=BAter=C3=BD 3. =C3=BAnora 2026 21:36:48, st=C5=99edoevropsk=C3=BD st=
andardn=C3=AD =C4=8Das Laurent Pinchart wrote:
> On Tue, Feb 03, 2026 at 04:53:41PM +0200, Laurent Pinchart wrote:
> > On Tue, Feb 03, 2026 at 03:38:06PM +0100, Oleksandr Natalenko wrote:
> > >=20
> > > Just to share my current state of affairs:
> > >=20
> > > * sender:
> > >=20
> > > $ gst-launch-1.0 pipewiresrc path=3D<webcam_id> ! video/x-h264, width=
=3D1280, height=3D720, framerate=3D24/1 ! rtph264pay ! rtpstreampay ! udpsi=
nk host=3D<receiver_host> port=3D<receiver_port>
> > >=20
> > > * receiver:
> > >=20
> > > $ gst-launch-1.0 udpsrc address=3D<receiver_host> port=3D<receiver_po=
rt> ! queue ! application/x-rtp-stream,encoding-name=3DH264 ! rtpstreamdepa=
y ! application/x-rtp,encoding-name=3DH264 ! rtph264depay ! h264parse ! ope=
nh264dec ! pipewiresink mode=3Dprovide stream-properties=3D"properties,medi=
a.class=3DVideo/Source,media.role=3DCamera" client-name=3DVirtualCam
> > >=20
> > > I chose H.264 because of much lower (tenfold) traffic comparing to
> > > MJPEG, wrapped this into RTP, opted in for OpenH264 decoder because I
> > > read it was handling low latency streams better than avdec_h264, and
> > > tested this setup with both Firefox and Chromium, and it actually
> > > worked pretty reliably, so I'm impressed now.
> >=20
> > Thank you for the update. I'll give this a try.
>=20
> I've tried those, but as soon as Firefox is connecting, I get
>=20
> 0:00:03.569028999 131465 0x7f85cc002030 DEBUG           pipewiresink gstp=
ipewiresink.c:692:on_state_changed:<pipewiresink0> got stream state "error"=
 (-1)
> 0:00:03.569060959 131465 0x7f85cc002030 DEBUG           pipewiresink gstp=
ipewiresink.c:692:on_state_changed:<pipewiresink0> got stream state "error"=
 (-1)
> 0:00:03.569070767 131465 0x7f85cc002030 WARN            pipewiresink gstp=
ipewiresink.c:710:on_state_changed:<pipewiresink0> error: stream error: no =
more input formats
> ERROR: from element /GstPipeline:pipeline0/GstPipeWireSink:pipewiresink0:=
 stream error: no more input formats
> Additional debug info:
> ../pipewire-1.4.9/src/gst/gstpipewiresink.c(710): on_state_changed (): /G=
stPipeline:pipeline0/GstPipeWireSink:pipewiresink0
>=20
> Maybe I should try the pipewire master branch.

I'd be glad to help, but my understanding of this "stream error: no more in=
put formats" boils down only to the absence of caps identifiers (like those=
 "application/x-rtp-stream"blahblah), which is not the case here. Also, Fir=
efox behaves differently from Chrome when using sites like webcamtests, and=
 also when using google meet. I may speculate Firefox more eagerly closes l=
ink to a pipewire node, but I have no knowledge of this at all.

That said, "pretty reliably" doesn't mean without issues whatsoever, and I =
manage to crash both Chrome and Firefox from time to time while experimenti=
ng with pipelines. Probably because I occasionally unintentionally feed som=
e crap into the pipewire sink.

=46WIW, I'm using 1:1.4.10-2 pipewire packages from Arch.

=2D-=20
Oleksandr Natalenko, MSE
--nextPart5074405.31r3eYUQgx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEZUOOw5ESFLHZZtOKil/iNcg8M0sFAmmCax0ACgkQil/iNcg8
M0tu+Q/8CnsW/p17DVOo9+4DX7kbRTLvG/fElu7L4nqDWOi7XM0f+DxPSY0RbdPV
m9Vlg2u2myFKYGG7nfJwqOmqE3oyosgeX3mg9yKzeyHYww0imgGgZPDUXp2BpGjz
BVlRtzvXvow1ZdTXb5/sUaDS4fmqXh/353H5SBYU6G3U49H5y8SbIuTnl9ELakv+
9i521wgcUbJW9ZU3ThAQnjpTD1/XNVgA0xkhue7oGpdbWGK4ZAteBu9AKrISGwGs
UpJwkoO8ONV9DNqGCaLi0ikfXZTnuOpEyEXxUnm/OWOXPqyuPu8APUNZoODjpFG+
ZJmde7+P6mzGOoeDe6MpzgnrF37FXEytMHA5OMBJBSqLcZ84hL+/ODJc+0ywNAg0
+rxOiWZYchUlcus7rSDdrWg4mC3jJw5+pqsl0WwincddJm7LDMzBUmaGpXo99kuv
z4zqndB/y9vUMmdsCd7xncJepx7OWKHoQ5NPdrs+/t5sTmUnb0K4leIWGC1gqQms
LPDqtfuNZHT0ermtTf1gGBK1AfhytUizZ7MxSncJCvx+6k7bQ8N2WAYbVlOlS5dz
u8gCCoLZoQWc0WpFNM4h2USk3d9NTIuhh3DR/TkUU2cQ/ljmEe1xDohyy4etYioP
gaD+OVD/Vu+vtgHhWeAmpAFaLKxCsxvwYTLpdjAZ5nrxDyXI3T0=
=VCxR
-----END PGP SIGNATURE-----

--nextPart5074405.31r3eYUQgx--




