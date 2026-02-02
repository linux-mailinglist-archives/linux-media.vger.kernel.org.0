Return-Path: <linux-media+bounces-52006-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFdXKgiOgGkl+wIAu9opvQ
	(envelope-from <linux-media+bounces-52006-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 12:44:08 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 15AC7CBDEB
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 12:44:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D5530303DADE
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 11:42:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18950363C50;
	Mon,  2 Feb 2026 11:41:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44310361DD4;
	Mon,  2 Feb 2026 11:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.85.9.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770032517; cv=none; b=imayyP7dKzl0QAARuPYNxWeOeMI8gzOPxt4zFMn9hq3muSnEpf4NIhtisTcEaV34+IyaqPDybLZcBs0jrd6cNZqYSP2aaLnLofcsTM+KgrrjEeM/Z/Jli30uCx3e87tSrYVCasaKaGvutz5l05Z1P2Db6G8nMz0Rr71DocWbXsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770032517; c=relaxed/simple;
	bh=OXNveMzXk+8u4+ask+y8kf2gdzy68BKE3FWx8I+55C4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H/P0BYscb9NyiZJkQiEdzl4QhNFahK8TU6nG99oM24Qwp8ekDWMawYuqXuFa+ya5sH645185bRU7CwS97wThTxvCjGqhLuu6vM9r96OPNfp25lj4Ez31aHcwcjZsgwHwOiILwvEQF/Tz6u679UsV8PRTyy7IZXzw25pZ8uJ/Iw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu; spf=pass smtp.mailfrom=irl.hu; arc=none smtp.client-ip=95.85.9.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=irl.hu
Received: from [192.168.2.4] (51b688e0.dsl.pool.telekom.hu [::ffff:81.182.136.224])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 00000000000C70AC.0000000069808C4D.003D8AAF; Mon, 02 Feb 2026 12:36:45 +0100
Message-ID: <0fc43020620f211a7962a819c617056fbb499d86.camel@irl.hu>
Subject: Re: [RFC PATCH] media: Virtual camera driver
From: Gergo Koteles <soyer@irl.hu>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
  Oleksandr Natalenko <oleksandr@natalenko.name>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
  Jarkko Sakkinen <jarkko@kernel.org>, linux-media@vger.kernel.org,
  jani.nikula@linux.intel.com, anisse@astier.eu,
  Mauro Carvalho Chehab <mchehab@kernel.org>,
  Hans Verkuil <hverkuil@kernel.org>,
  Sakari Ailus <sakari.ailus@linux.intel.com>,
  Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
  Ricardo Ribalda <ribalda@chromium.org>,
  open list <linux-kernel@vger.kernel.org>
Date: Mon, 02 Feb 2026 12:36:44 +0100
In-Reply-To: <20260202020214.2243acec@foz.lan>
References: <20260201133342.335680-1-jarkko@kernel.org>
		<5073898.31r3eYUQgx@natalenko.name>	<20260202001704.2419778a@foz.lan>
		<13939245.uLZWGnKmhe@natalenko.name> <20260202020214.2243acec@foz.lan>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[irl.hu : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52006-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[soyer@irl.hu,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[astier.eu:email,intel.com:email,ideasonboard.com:email,irl.hu:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,chromium.org:email,natalenko.name:email]
X-Rspamd-Queue-Id: 15AC7CBDEB
X-Rspamd-Action: no action

On Mon, 2026-02-02 at 02:02 +0100, Mauro Carvalho Chehab wrote:
> On Mon, 02 Feb 2026 00:25:37 +0100
> Oleksandr Natalenko <oleksandr@natalenko.name> wrote:
>=20
> > Date: Mon, 02 Feb 2026 00:25:37 +0100
> > From: Oleksandr Natalenko <oleksandr@natalenko.name>
> > To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jarkko Sakkin=
en <jarkko@kernel.org>, linux-media@vger.kernel.org, jani.nikula@linux.inte=
l.com, anisse@astier.eu, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans V=
erkuil <hverkuil@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, =
Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Ricardo Ribalda <ribalda@chro=
mium.org>, open list <linux-kernel@vger.kernel.org>
> > Message-ID: <13939245.uLZWGnKmhe@natalenko.name>
> >=20
> > On pond=C4=9Bl=C3=AD 2. =C3=BAnora 2026 0:17:20, st=C5=99edoevropsk=C3=
=BD standardn=C3=AD =C4=8Das Mauro Carvalho Chehab wrote:
> > > No. At the machine with the camera, obs can read from a V4L2 input,
> > > generate a mpeg TS stream, and listen to a UDP port (for instance).=
=20
> > >=20
> > > At the remote machine, you can just pass the URL to ffmpeg. =20
> >=20
> > I can't, I have to feed the stream into Firefox somehow for it to see t=
he stream as a virtual webcam.
>=20
> Motioneye could be used on such scenario. It has a proper web
> interface, allows multiple users to watch, has login control accepts
> multiple cameras.
>=20

WebRTC in browsers isn't that bad. Firefox and Chrome also have
PipeWire video support.=C2=A0

If I understand correctly, it would be more forward-thinking to develop
virtual camera support in PipeWire rather than in the kernel.

Best Regards,
Gergo Koteles

