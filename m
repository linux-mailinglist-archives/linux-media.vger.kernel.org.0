Return-Path: <linux-media+bounces-58094-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id rTBbOEun02klkAcAu9opvQ
	(envelope-from <linux-media+bounces-58094-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Apr 2026 14:30:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F76A3A3480
	for <lists+linux-media@lfdr.de>; Mon, 06 Apr 2026 14:30:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 02AB63015889
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2026 12:29:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8E473368BF;
	Mon,  6 Apr 2026 12:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=natalenko.name header.i=@natalenko.name header.b="tYJHpUoC"
X-Original-To: linux-media@vger.kernel.org
Received: from prime.voidband.net (prime.voidband.net [199.247.17.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A822332608;
	Mon,  6 Apr 2026 12:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.247.17.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775478592; cv=none; b=hlKBitLgzUVH6ESbl0xjR0/ctDJHUR9/dEY2ZEYzZ09W8mpOlEuZLmoJuaB6NSXUF4Pvcq8OMuYmriHdhAW6JsqCucyOFTNXSwRx5ggeGUbRi/Sar14fUGTe/1mB4EqiBPTBZkOVIPkM74AyalgsqLwrkibEbqNP/P1+uUoZM+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775478592; c=relaxed/simple;
	bh=IhCi7QJlUederKfskaIR2lPAczOCkCYtX7cwGtCx8iU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GQowI1lBjqPffAovp9aSeiAmGN6bFrrC9+MaqM3FcU9ks1YJ4XGYNqyYWoGJ3QiEy3ukbo8HlCxXaapm4a/LFF++ril1/eITOpC5g1ceyptzTquVbZj9pORUALhKYckA9rvkKJx+NDyROYm+KKKR2lKw6GiHXZC/M9tIkMzFdec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=natalenko.name; spf=pass smtp.mailfrom=natalenko.name; dkim=pass (1024-bit key) header.d=natalenko.name header.i=@natalenko.name header.b=tYJHpUoC; arc=none smtp.client-ip=199.247.17.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=natalenko.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=natalenko.name
Received: from spock.localnet (unknown [212.20.115.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by prime.voidband.net (Postfix) with ESMTPSA id 8AF10635B044;
	Mon, 06 Apr 2026 14:24:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=natalenko.name;
	s=dkim-20170712; t=1775478240;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IhCi7QJlUederKfskaIR2lPAczOCkCYtX7cwGtCx8iU=;
	b=tYJHpUoCpSivDFVymH4ZeOYqZe/V0IBE0zFEsC5SGizxe7Syg5CipzJDKRxALdr2kVErXe
	YKBj8u76z8ruUG1TCNL6E+C2CklX9XlUeYdB0yEw0ew5qq/SqYH3WRFjnjoofoq1/hi414
	tMhqojh74EN+q1vrvkQVPOrqRI6tqMI=
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
 Nicolas Dufresne <nicolas@ndufresne.ca>, pobrn@protonmail.com
Subject: Re: [RFC PATCH] media: Virtual camera driver
Date: Mon, 06 Apr 2026 14:23:46 +0200
Message-ID: <12919433.O9o76ZdvQC@natalenko.name>
In-Reply-To: <20260203204911.GB56480@killaraus>
References:
 <20260201133342.335680-1-jarkko@kernel.org>
 <20260203145341.GB33304@killaraus> <20260203204911.GB56480@killaraus>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart6031690.DvuYhMxLoT";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
x-ms-reactions: disallow
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[natalenko.name,reject];
	R_DKIM_ALLOW(-0.20)[natalenko.name:s=dkim-20170712];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58094-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[irl.hu,kernel.org,vger.kernel.org,linux.intel.com,astier.eu,ideasonboard.com,chromium.org,ndufresne.ca,protonmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksandr@natalenko.name,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[natalenko.name:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,huawei];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:url,natalenko.name:dkim,natalenko.name:mid,gitlab.freedesktop.org:url]
X-Rspamd-Queue-Id: 3F76A3A3480
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

--nextPart6031690.DvuYhMxLoT
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Oleksandr Natalenko <oleksandr@natalenko.name>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [RFC PATCH] media: Virtual camera driver
Date: Mon, 06 Apr 2026 14:23:46 +0200
Message-ID: <12919433.O9o76ZdvQC@natalenko.name>
In-Reply-To: <20260203204911.GB56480@killaraus>
MIME-Version: 1.0

Hello.

On =C3=BAter=C3=BD 3. =C3=BAnora 2026 21:49:11, st=C5=99edoevropsk=C3=BD le=
tn=C3=AD =C4=8Das Laurent Pinchart wrote:
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

> > I'm writing a blog post on this topic, I'll reply with a link when I'll
> > be done.
>=20
> https://www.ideasonboard.com/news/pipewire-is-the-new-v4l2loopback/

It looks like it's now broken in PipeWire 1.6.x. I've reported it here: [1]=
, but I'm not sure what's next.

Do you maybe have more info on this?

Thank you.

[1]: https://gitlab.freedesktop.org/pipewire/pipewire/-/work_items/5165

=2D-=20
Oleksandr Natalenko, MSE
--nextPart6031690.DvuYhMxLoT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEZUOOw5ESFLHZZtOKil/iNcg8M0sFAmnTpdIACgkQil/iNcg8
M0ufLg//Vu/yynwz1n6NO/c05Ufhj4EwfptlOxOqnYleVgqh2wAPIekW8NZOD42s
DSLm90cxnfKFYRJdL+lHuKUi/z1SvlP2MdcWRMZEdIyIz0ZbV+9ubsTPXhYfXE9u
LB3kCAGBrliVBtEV1ErbhqcgyyUnV9Z9e8KCxoMoXoOG7PHCjwyiO1g3fKMzfsPD
VpOcZOok7oIRE4DKfqs0kwy+eaYcHEVHmsSvz0RfvJ+E96EDgwi6OPavKBuctRmz
45/dFyQBIGGiU6gKlUoePCdHO1V9kZ1jALcmmEV4hYuivDwjDjD1YFV5h7az7wnM
es3qTrcUC3t73kDYGQtdB5hp0bC5uJWJrg2eMbq9iV3kN8XMkBupauKblmnfdUc6
7a8brclY5/eGVvk0zvssXexoBzpVCPJPiRp0slB/afMkXjGrjqRE8k5Qgm3eNFXE
nxkzI5ayZMusmRN4+snQo2FoW+GxYr72kpvFsRF4Z/MmSmNnvgya4ISRAySOYYCM
Zl0URY2UjNYGtFSDpE1AsHciMi3lPTBfPEBCqbl5lBhU8bdNl9PfSlbEXFPNNMUh
MQQgNKT+6AOB9vNm4483E1JefWjsfPQ9olQMIyyHh0WYX6BHoEKaL2eD/MzxG1zI
DmcfTf2+e7PQp/nigkuvMwXuR9RktAUU0U0xIoJsUB1UmI2xs7w=
=Hn8x
-----END PGP SIGNATURE-----

--nextPart6031690.DvuYhMxLoT--




