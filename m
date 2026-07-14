Return-Path: <linux-media+bounces-67579-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 52HnL+VmVmqD4wAAu9opvQ
	(envelope-from <linux-media+bounces-67579-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 18:42:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DD575703C
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 18:42:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=datapath.co.uk header.s=mailjet header.b=A8LCEiVF;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67579-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67579-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=datapath.co.uk (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B4D3E303903F
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 16:42:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD0774D8DBC;
	Tue, 14 Jul 2026 16:42:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from o84.p38.mailjet.com (o84.p38.mailjet.com [185.250.237.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008064D90B6
	for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 16:42:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784047323; cv=none; b=k4rm8AAmSeil6zmDPFfTDMwzvkw8JZmP1vT45OLfhvAmWAY9OAWLgp68b0ApBg5ymDbW2w9/1NnKZseypKIBcNsoXq9FIxHNuj5E4aEidq21+mwfeKoTFrY6EgexIT9uZ57jWWz4EaqRHfobNjFhHQ4W8lnhCekR+sJp4P8ZF8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784047323; c=relaxed/simple;
	bh=dcD3gkL5ewMWLDxgLbQlUZf6q5rbERuY06bERkOlGaI=;
	h=Message-Id:MIME-Version:From:To:Subject:Date:Cc:In-Reply-To:
	 References; b=Gg6/Ua4ID4NXmrH2zfbELoJbaIZ6NYgcxYS64F5ktbxHvWAoc/LsJTLq7V80xPgZk9qUxFyM9RJRXmmv2tmAhpOBeApX4EbilrJ37xdN17rsnnUN7WD41sJ6KUCibyrz/1WGy7JwtCI0tX8LrGb5AfHwr7XSBrBDOgGO0xWspT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=datapath.co.uk; spf=pass smtp.mailfrom=a1809859.bnc3.mailjet.com; dkim=pass (1024-bit key) header.d=datapath.co.uk header.i=przemek.gajos@datapath.co.uk header.b=A8LCEiVF; arc=none smtp.client-ip=185.250.237.84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; q=dns/txt;
  d=datapath.co.uk; i=przemek.gajos@datapath.co.uk; s=mailjet; t=1784047318; x=1784054518;
  h=Message-Id: MIME-Version: From: Reply-To: To: Subject: Date:
   List-Unsubscribe: List-Unsubscribe-Post: Cc: Feedback-Id:
   In-Reply-To: References: X-CSA-Complaints: X-MJ-Mid:
   X-MJ-SMTPGUID: X-REPORT-ABUSE-TO:
   Content-Transfer-Encoding: To: From: Sender: Subject: Date;
  bh=nQDkSqRId+ENCRqrt+PD+Zgdn82mU+WHdGoWctIchuc=;
  b=A8LCEiVF2NTIu0YqXKT2ZtM8U6JJYrOtCByqJzqR/2AzgRHng1lt2PVA7
 FC2v3ISStvpOBW1H/ew0jApzHm1FcQinXChRJfYU+LtLl+g0Od7MPWdoqf2z
 lq12yUqhtzqVMYJQBhW4yjfJT/70g4H8Liret9OYvLh9JeDFgvd8KE=
Message-Id: <e921d18a.AWUAAKFWI7AAAAAAAAAAA-L_6E0AAYDONroAAAAAABudwwBqVmbW@mailjet.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Przemek Gajos <przemek.gajos@datapath.co.uk>
Reply-To: przemek.gajos@datapath.co.uk
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: Re: [RFC] media: Question about reserving V4L2 UAPI control IDs for
 out-of-tree rgb133 kernel driver
Date: Tue, 14 Jul 2026 17:41:29 +0100
List-Unsubscribe-Post: List-Unsubscribe=One-Click
Cc: Przemek Gajos <przemek.gajos@datapath.co.uk>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	mchehab@kernel.org
Feedback-Id: 42.1809859.1736069:MJ
In-Reply-To: <619056acd2d8493315e8ca1055d4ce0068e3e95f.camel@ndufresne.ca>
References:
	<fb3f8857.AVEAAKBfiogAAAAAAAAAA-L_6E0AAYDONroAAAAAABudwwBqVkiC@mailjet.com>
	<619056acd2d8493315e8ca1055d4ce0068e3e95f.camel@ndufresne.ca>
X-CSA-Complaints: csa-complaints@eco.de
X-MJ-Mid:
	AWUAAKFWI7AAAAAAAAAAA-L_6E0AAYDONroAAAAAABudwwBqVmbWGLg0eT6uTsikLqAXZJ1jegAafYU
X-MJ-SMTPGUID: ef4076b2-8eb4-48d6-9158-7a407644363b
X-REPORT-ABUSE-TO: Message sent by Mailjet please report to
	abuse@mailjet.com with a copy of the message
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.14 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[datapath.co.uk:s=mailjet];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[datapath.co.uk : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67579-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:nicolas@ndufresne.ca,m:przemek.gajos@datapath.co.uk,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mchehab@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[datapath.co.uk:-];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[przemek.gajos@datapath.co.uk,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	HAS_REPLYTO(0.00)[przemek.gajos@datapath.co.uk];
	FROM_NEQ_ENVFROM(0.00)[przemek.gajos@datapath.co.uk,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailjet.com:mid,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 86DD575703C

Hi Nicolas,

Thanks for the quick reply.

> I could not find specific changes between 6.19 and 7.0 that would explain=
 this
> failure. Perhaps you could share a bit more details on what you are doing=
, and
> how it fails ? Are you using v4l2_ctrl_new_custom() ?

It is a fairly old driver we are now modernising. We have a set of
hardware-specific controls for which we have been using
V4L2_CID_PRIVATE_BASE (0x08000000) as a CID base. We have now
integrated the driver into the v4l2 control framework and noticed
that controls that fall into that range are rejected by
v4l2_ctrl_new_custom(). Specifically, there is a gate in the
internal helper v4l2_ctrl_new() that rejects any id greater than or
equal to V4L2_CID_PRIVATE_BASE:

    /* Sanity checks */
    if (id =3D=3D 0 || name =3D=3D NULL || !elem_size ||
        id >=3D V4L2_CID_PRIVATE_BASE ||
        (type =3D=3D V4L2_CTRL_TYPE_MENU && qmenu =3D=3D NULL) ||
        (type =3D=3D V4L2_CTRL_TYPE_INTEGER_MENU && qmenu_int =3D=3D NULL))=
 {
            handler_set_err(hdl, -ERANGE);
            return NULL;
    }

I understand that V4L2_CID_PRIVATE_BASE belongs to the legacy
model. From looking into uapi/linux/v4l2-controls.h, my current
understanding is that custom controls should use the User Class
Base and that drivers can get a dedicated offset within that base,
e.g.:

    #define V4L2_CID_USER_<MY_DRIVER_NAME>_BASE \
            (V4L2_CID_USER_BASE + <MY_DRIVER_OFFSET>)

> Up-streaming is the path forward.

We have not made the decision to up-stream the driver yet.
Is up-streaming a requirement for a driver to reserve an offset within the
V4L2_CID_USER_BASE in the v4l2-controls.h header?

Thank you,
Przemyslaw Gajos
=

