Return-Path: <linux-media+bounces-52110-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJz/GF4JgmmCOQMAu9opvQ
	(envelope-from <linux-media+bounces-52110-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Feb 2026 15:42:38 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BECE3DABAD
	for <lists+linux-media@lfdr.de>; Tue, 03 Feb 2026 15:42:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF0BD30A15B8
	for <lists+linux-media@lfdr.de>; Tue,  3 Feb 2026 14:38:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A4FB3AA1A9;
	Tue,  3 Feb 2026 14:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=natalenko.name header.i=@natalenko.name header.b="i8Da/IAq"
X-Original-To: linux-media@vger.kernel.org
Received: from prime.voidband.net (prime.voidband.net [199.247.17.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B0D3A0B18;
	Tue,  3 Feb 2026 14:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.247.17.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770129515; cv=none; b=ONgxVjDJZERMJEaiHaWgeEhSLgQRFJWf2CiWbxD4NK1SHIK1M1RjOQdkvVMl48P6BfViw1ikiMITKXGkEnDS9oevmBdA/4ArgX0JQgvPlNXZTJ2bIkqF7O7RCDptskGKE8Af4DseEqnTh9+oebgysOsxXr8COS4DLew4qN55kN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770129515; c=relaxed/simple;
	bh=hn1cVF23Ff5SZkYLR8WdfUUOV8CdjlBmo89TF0alEfA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rlHNrMcgiKgMr5WorgPRHOPIRQYm8vlNMiIOoKSCN1GF7UicbCte/415q7oklopTFJuAcIlxj8RUvG2AGX/s5X/NjdoKMbGPYoeLNoVyd1FiKFjejrN4tg96kk2Afaiqv82A0jLKzlO9xEfhVtOv6Qsd9fIWIib+OW5Kpz2ltDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=natalenko.name; spf=pass smtp.mailfrom=natalenko.name; dkim=pass (1024-bit key) header.d=natalenko.name header.i=@natalenko.name header.b=i8Da/IAq; arc=none smtp.client-ip=199.247.17.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=natalenko.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=natalenko.name
Received: from spock.localnet (unknown [212.20.115.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by prime.voidband.net (Postfix) with ESMTPSA id 5810B635B044;
	Tue, 03 Feb 2026 15:38:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=natalenko.name;
	s=dkim-20170712; t=1770129505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ThTSMXVi2lSUsiDsHxZg8ggmVtOHN7ZmIvOnMyXKvNY=;
	b=i8Da/IAqweZPg5YYmtNd1AH8CvK7X3WYy1grdh3m2uJBPhiOHKHmcG4kfd/r8w1kMYwWGC
	+9Le4i3fzU04o3NiyVex4wuemy1vKQAg1+87OGw8l+G9GB0Q8gXTEL+ifDaHCVJJjcU4/j
	+qDFJKBwy44nQaBo3Qil4rcimh6kjmI=
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
Date: Tue, 03 Feb 2026 15:38:06 +0100
Message-ID: <5069963.GXAFRqVoOG@natalenko.name>
In-Reply-To: <20260203012313.GA280953@killaraus>
References:
 <20260201133342.335680-1-jarkko@kernel.org>
 <22989766.EfDdHjke4D@natalenko.name> <20260203012313.GA280953@killaraus>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1969922.tdWV9SEqCh";
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
	TAGGED_FROM(0.00)[bounces-52110-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,natalenko.name:mid,natalenko.name:dkim]
X-Rspamd-Queue-Id: BECE3DABAD
X-Rspamd-Action: no action

--nextPart1969922.tdWV9SEqCh
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Oleksandr Natalenko <oleksandr@natalenko.name>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [RFC PATCH] media: Virtual camera driver
Date: Tue, 03 Feb 2026 15:38:06 +0100
Message-ID: <5069963.GXAFRqVoOG@natalenko.name>
In-Reply-To: <20260203012313.GA280953@killaraus>
MIME-Version: 1.0

On =C3=BAter=C3=BD 3. =C3=BAnora 2026 2:23:13, st=C5=99edoevropsk=C3=BD sta=
ndardn=C3=AD =C4=8Das Laurent Pinchart wrote:
> Hi Oleksandr,
>=20
> (Cc'ing Nicolas Dufresne)
>=20
> On Mon, Feb 02, 2026 at 12:45:15PM +0100, Oleksandr Natalenko wrote:
> > On pond=C4=9Bl=C3=AD 2. =C3=BAnora 2026 12:40:12, st=C5=99edoevropsk=C3=
=BD standardn=C3=AD =C4=8Das Laurent Pinchart wrote:
> > > > If I understand correctly, it would be more forward-thinking to dev=
elop
> > > > virtual camera support in PipeWire rather than in the kernel.
> > >=20
> > > I don't think there's even a need for development in PipeWire
> > >=20
> > > $ gst-launch-1.0 \
> > > 	videotestsrc ! \
> > > 	video/x-raw,format=3DYUY2 ! \
> > > 	pipewiresink mode=3Dprovide stream-properties=3D"properties,media.cl=
ass=3DVideo/Source,media.role=3DCamera"
> > >=20
> > > This gives me a virtual camera in Firefox. Extending the GStreamer
> > > pipeline to get the video stream from the network should be quite
> > > trivial.
> >=20
> > So far, I came up with this:
> >=20
> > * sender:
> >=20
> > $ gst-launch-1.0 pipewiresrc path=3D<webcam_id> ! image/jpeg, width=3D1=
280, height=3D720, framerate=3D24/1 ! rndbuffersize max=3D1400 ! udpsink ho=
st=3D<receiver_host> port=3D<receiver_port>
> >
> > * receiver:
> >=20
> > $ gst-launch-1.0 udpsrc address=3D<receiver_host> port=3D<receiver_port=
> ! queue ! image/jpeg, width=3D1280, height=3D720, framerate=3D24/1 ! jpeg=
parse ! jpegdec ! pipewiresink mode=3Dprovide stream-properties=3D"properti=
es,media.class=3DVideo/Source,media.role=3DCamera" client-name=3DVirtualCam
> >
> > Please let me know if I do something dumb here. Trial and error to
> > make this work took a couple of hours for me, but it seems to provide
> > what I need.
>=20
> There's nothing dumb at all, especially given that it works :-) I have
> been able to reproduce it locally (using a different pipeline on the
> sender side).
>=20
> I compared your pipelines with another JPEG-over-UDP setup I used a
> while ago, which used an rtpjpegpay element before udpsink on the sender
> side to encapsulate the payload in RTP packets, and an rtpjpegdepay
> element on the receiver side after udpsrc. This helps the receiver
> synchronize with the sender if the sender is started first. The full
> pipelines are
>=20
> * Sender:
>=20
> gst-launch-1.0 \
> 	v4l2src ! \
> 	video/x-raw,pixelformat=3DYUYV,size=3D640x480 ! \
> 	jpegenc ! \
> 	rtpjpegpay ! \
> 	udpsink host=3D192.168.10.200 port=3D8000
>=20
> * Receiver:
>=20
> gst-launch-1.0 \
> 	udpsrc port=3D8000 ! \
> 	application/x-rtp,encoding-name=3DJPEG,payload=3D26 ! \
> 	rtpjpegdepay ! \
> 	jpegdec ! \
> 	video/x-raw,pixelformat=3DYUYV,size=3D640x480 ! \
> 	queue ! \
> 	pipewiresink mode=3Dprovide \
> 	       stream-properties=3D"properties,media.class=3DVideo/Source,media.=
role=3DCamera" \
> 	       client-name=3D"Remote Camera"
>=20
> Unfortunatley this doesn't work, when the pipewire client connects to
> the stream on the receiver side I get
>=20
> ERROR: from element /GstPipeline:pipeline0/GstPipeWireSink:pipewiresink0:=
 stream error: no more input formats
>=20
> Nicolas, would you have any wisdom to share about this and tell me if I
> did something dumb ? :-) There's no hurry.

Just to share my current state of affairs:

* sender:

$ gst-launch-1.0 pipewiresrc path=3D<webcam_id> ! video/x-h264, width=3D128=
0, height=3D720, framerate=3D24/1 ! rtph264pay ! rtpstreampay ! udpsink hos=
t=3D<receiver_host> port=3D<receiver_port>

* receiver:

$ gst-launch-1.0 udpsrc address=3D<receiver_host> port=3D<receiver_port> ! =
queue ! application/x-rtp-stream,encoding-name=3DH264 ! rtpstreamdepay ! ap=
plication/x-rtp,encoding-name=3DH264 ! rtph264depay ! h264parse ! openh264d=
ec ! pipewiresink mode=3Dprovide stream-properties=3D"properties,media.clas=
s=3DVideo/Source,media.role=3DCamera" client-name=3DVirtualCam

I chose H.264 because of much lower (tenfold) traffic comparing to MJPEG, w=
rapped this into RTP, opted in for OpenH264 decoder because I read it was h=
andling low latency streams better than avdec_h264, and tested this setup w=
ith both Firefox and Chromium, and it actually worked pretty reliably, so I=
'm impressed now.

The only issue I have with this thing is that once a tab with meeting in th=
e browser is closed, the whole receiver pipeline stops gracefully because "=
PipeWire link to remote node was destroyed". I didn't find a way to tell th=
e pipeline to just restart, so in fact I had to wrap it into a Python scrip=
t with Gst.parse_launch() and friends, and add error message parsing to res=
tart the pipeline inside the script.

Leaving this in public, because it's a straightforward and potentially wide=
ly used setup, yet there's little to no info on how to do it properly, and =
the knowledge is scattered across random posts of varying age.

=2D-=20
Oleksandr Natalenko, MSE
--nextPart1969922.tdWV9SEqCh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEZUOOw5ESFLHZZtOKil/iNcg8M0sFAmmCCE4ACgkQil/iNcg8
M0ttcA/+KM0iHjQcId2qpZDyop0R4PU9k+yu3qGyNWBsXM4QO349FIRpKu0V7epn
9hIuYMS48xmWvNa5+UWaiJWK/1xrXY1TcmgT0bxir6ijYvP+oI5PqiYidMhw4RMm
dJmcryxEUDHNy5PbN/vXjE7i6asnFOCleJpur1MRV8HpzoMPuSBUkgbHEbhIcJcs
XHicg1dodH91J2lk8wRoSQ7FxWtjIanLc9vGAa32KYwyKg6UOeGMl3MjRWQn7g2y
TggeqJx3HdEvbf5lFbye80S3eeCtWPU/KyPsPGcQsmQCpsrHmoX+r/1WtrJtQHfU
liPyG7o5GOT7EHZnmwcpgbvecsLi6FggJqc7Yufrk7ZnoyotCSMcmjoOv8O3hNFT
WAUmAhJ0awnX/oH/NS+a38DOBn5yRh5qtrc834h7Z2e0yELT9UdzvX5r2FreiWKW
ALir4fc+yJBFY9ewXL4bNApjurnAe+XKoNh6BwX1Kx7dg/bXlhVFFhisbWHZKDXW
wH0oiPj52rjg2zd5bxKOBgQb+Yq7rFVcQiX2Ag6k7LBrX03BB9bYWEBPLCu3175w
reNU5rGksJbHMd8X2H2OYwBhiVuAtfE1ZrLQ/HgY9hec79czsmoIJbrWjPQbTt0Z
otkD9w2Qyc4MlyS+PxCwmWM2QIc4Rq1MXV/sPNS0eEoLPSw/HLs=
=1npZ
-----END PGP SIGNATURE-----

--nextPart1969922.tdWV9SEqCh--




