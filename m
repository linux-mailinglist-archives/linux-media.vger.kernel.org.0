Return-Path: <linux-media+bounces-52008-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PCgI5SOgGkl+wIAu9opvQ
	(envelope-from <linux-media+bounces-52008-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 12:46:28 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2068FCBE37
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 12:46:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AF1B730154B2
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 11:45:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82985364055;
	Mon,  2 Feb 2026 11:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=natalenko.name header.i=@natalenko.name header.b="pOWb1qlf"
X-Original-To: linux-media@vger.kernel.org
Received: from prime.voidband.net (prime.voidband.net [199.247.17.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B00827F163;
	Mon,  2 Feb 2026 11:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.247.17.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770032734; cv=none; b=GROdM8Z29HfxegomkAqe1LBcM2PjCbL4lekLb3CzUJ/FAfGS2guwbZ7Kl4yLTtWB7jv4qGXxl4ZViLKHg3f03saaE6XCwX9jyt0cVbxLRf3Kj/AzCW9z9es/5XaeKrNzB6l22KCP/5d+B8Vj7OsKXYjc/lclckgkkZ2Dqk4hAJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770032734; c=relaxed/simple;
	bh=45kZMTj5AnKDV6qoLepYo77H/w8eGSLzxv0O9Ma1vYk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QaRVcX+sd0+x1m2eImSaqwA2/+fThZefg/KJTEkORs7I0DHHLrVBBcGpWkon25RDaistdpsxb4S1JZOTAYZsa6Nod9QchT6OIGPMyKRnOpV/Doz3EWWhHMSjPp0jeLkwGUwTTRgtCcTfSMbnGF1CkUx5u4KiHknlZTT4SEpmMKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=natalenko.name; spf=pass smtp.mailfrom=natalenko.name; dkim=pass (1024-bit key) header.d=natalenko.name header.i=@natalenko.name header.b=pOWb1qlf; arc=none smtp.client-ip=199.247.17.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=natalenko.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=natalenko.name
Received: from spock.localnet (unknown [212.20.115.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by prime.voidband.net (Postfix) with ESMTPSA id ABE9D635B040;
	Mon, 02 Feb 2026 12:45:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=natalenko.name;
	s=dkim-20170712; t=1770032729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QYqSsMVSmVeX98GgboTEstQmryntM/vuwJJOdTYGVm0=;
	b=pOWb1qlfHgWGVY4qSkKWWY88n1VOL97T57anUdEwLCVk4rJ0kwN4t0dv/XJa+5zVAMur46
	2Hy3irfj33RvuvkC7l+OHyvxypaqvhCHi8lQZzAjIobYSuPSAAcBlVZ2hau6cieeANYRgw
	X2zgDH0NC3VA/356nwg6TDxjtW9dDgQ=
From: Oleksandr Natalenko <oleksandr@natalenko.name>
To: Gergo Koteles <soyer@irl.hu>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jarkko Sakkinen <jarkko@kernel.org>, linux-media@vger.kernel.org,
 jani.nikula@linux.intel.com, anisse@astier.eu,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Ricardo Ribalda <ribalda@chromium.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH] media: Virtual camera driver
Date: Mon, 02 Feb 2026 12:45:15 +0100
Message-ID: <22989766.EfDdHjke4D@natalenko.name>
In-Reply-To: <20260202114012.GA4173464@killaraus>
References:
 <20260201133342.335680-1-jarkko@kernel.org>
 <0fc43020620f211a7962a819c617056fbb499d86.camel@irl.hu>
 <20260202114012.GA4173464@killaraus>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart7904260.EvYhyI6sBW";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
x-ms-reactions: disallow
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[natalenko.name,reject];
	R_DKIM_ALLOW(-0.20)[natalenko.name:s=dkim-20170712];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-52008-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[natalenko.name:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksandr@natalenko.name,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,huawei];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[natalenko.name:mid,natalenko.name:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2068FCBE37
X-Rspamd-Action: no action

--nextPart7904260.EvYhyI6sBW
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Oleksandr Natalenko <oleksandr@natalenko.name>
Subject: Re: [RFC PATCH] media: Virtual camera driver
Date: Mon, 02 Feb 2026 12:45:15 +0100
Message-ID: <22989766.EfDdHjke4D@natalenko.name>
In-Reply-To: <20260202114012.GA4173464@killaraus>
MIME-Version: 1.0

On pond=C4=9Bl=C3=AD 2. =C3=BAnora 2026 12:40:12, st=C5=99edoevropsk=C3=BD =
standardn=C3=AD =C4=8Das Laurent Pinchart wrote:
> > If I understand correctly, it would be more forward-thinking to develop
> > virtual camera support in PipeWire rather than in the kernel.
>=20
> I don't think there's even a need for development in PipeWire
>=20
> $ gst-launch-1.0 \
> 	videotestsrc ! \
> 	video/x-raw,format=3DYUY2 ! \
> 	pipewiresink mode=3Dprovide stream-properties=3D"properties,media.class=
=3DVideo/Source,media.role=3DCamera"
>=20
> This gives me a virtual camera in Firefox. Extending the GStreamer
> pipeline to get the video stream from the network should be quite
> trivial.

So far, I came up with this:

* sender:

$ gst-launch-1.0 pipewiresrc path=3D<webcam_id> ! image/jpeg, width=3D1280,=
 height=3D720, framerate=3D24/1 ! rndbuffersize max=3D1400 ! udpsink host=
=3D<receiver_host> port=3D<receiver_port>

* receiver:

$ gst-launch-1.0 udpsrc address=3D<receiver_host> port=3D<receiver_port> ! =
queue ! image/jpeg, width=3D1280, height=3D720, framerate=3D24/1 ! jpegpars=
e ! jpegdec ! pipewiresink mode=3Dprovide stream-properties=3D"properties,m=
edia.class=3DVideo/Source,media.role=3DCamera" client-name=3DVirtualCam

Please let me know if I do something dumb here. Trial and error to make thi=
s work took a couple of hours for me, but it seems to provide what I need.

Thank you.

=2D-=20
Oleksandr Natalenko, MSE
--nextPart7904260.EvYhyI6sBW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEZUOOw5ESFLHZZtOKil/iNcg8M0sFAmmAjksACgkQil/iNcg8
M0smLQ/+Pd85tqx4yUhqYPMT6nj8QVPRf+CK8Z+SwiN/pBKdX5bidURso5u4jPJw
PNQ9LGVfFEGEYchfnj4BN5w8I2AezScW1E5Cr4NYEgUGM/gef1thFBhNrfxZOAR9
EriDeL++tfRGGcmSR4dHhTF9GH2eAaXfeO17z9tgkf1R9ebgVhkdzBctEReRuRyk
sE9TvDfO2x+NnqfKpqmU2+OSQP6QB9GqkP0di1H6XpKnmq1FOdZslYt7p6T86NGI
0cYwU1xZ3bylPRde32RV9V4z16oFJSc4pz0Cdjj2rHC5Uda4HQkYeJEo6MY+yy21
jiyqfKMfJ3n3yodWxjYvT3nDu2sD+YQ/CSJBfcGabb+tXligBi5xxgloVjZlx6cg
9ZettGPa+sEGD15EOFMoQ97WsGyW53ewjTC1svuRFG4uxFehnOCIIQjkVYZ8DqhC
c6VRjIihECfDSwtkmdjYWUyAJHHSz131YUTfCIRW/e5uCM4smzy0EP1/T5MqZAj2
bVCCBTQkez0dFIeHq5IbXuFAs3wfz3VAAZEcC30GZwrpsWURvrUP0r3dmHJfnH07
Q01TXRbzLLRQ89FMFALYJpcJmiUmATZyQbqEvTFQbTM3GVIKBnKI8B4qsuDy3kqr
PsZKvM0aJ0axRaRiZ71xFgWK3JlG4gddI2+MfE4nUycFtbITYrs=
=E1tQ
-----END PGP SIGNATURE-----

--nextPart7904260.EvYhyI6sBW--




