Return-Path: <linux-media+bounces-52415-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GtPHCj6iWkiFQAAu9opvQ
	(envelope-from <linux-media+bounces-52415-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 16:15:52 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C0610111C8F
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 16:15:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A8FEC31242B3
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 15:01:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3027D37D135;
	Mon,  9 Feb 2026 15:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b="cUpctzdK";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="t4UubUuL"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396EA3612CC;
	Mon,  9 Feb 2026 15:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770649271; cv=none; b=inQTv/9QXScpjAjr1Y6h1GwBYqI1vitBCmMShJC5ct5Rn090av+OexQn4YLsPuFabGVx2F9lP0Gm4UqCh+t3jmvqMOvBc2hDsZuTJe2RsailOX83Xtemf7QctasybBYACxhwQrrHN4pNjWNSQMQyEgK01D7TCYTUF/dE89GdLOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770649271; c=relaxed/simple;
	bh=6ReE5VIHLx3N9CG+rtcyN01632FpJ+E0YCNQBvEC8Kc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CviNFgI9JhKyS2jtjG9ADd1q3VPqGC//S+mK54MZBDPXUzIJjObs1z+G2wU5qjaKoXAXddNngNqHYIHozxiG4Vt7hUCpth8C/sOYTKzvFjAp0fmTX0S++cCCwtyhV3XTqBAWMcDZID5CJnz8pGVdAg/GRYrOW7QQFmakuhiCXA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com; spf=pass smtp.mailfrom=fastmail.com; dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b=cUpctzdK; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=t4UubUuL; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.com
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 39BC7EC0626;
	Mon,  9 Feb 2026 10:01:10 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Mon, 09 Feb 2026 10:01:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm3;
	 t=1770649270; x=1770735670; bh=qBP8CAa3S5jQW57WvRTHGGtEqTNwVqhE
	DcsU1gl8sjI=; b=cUpctzdKyqtv3ebKpD6ZGnFjWiWOs6lZ8wVAUftbmgNNPjjl
	rSlk8bMAldaNCmsSvtkJjAlf9pKgtR7W4UdK4VPv1mn5B4UNH2/sgUsIg7d/3f34
	Hgngcj3FaNjgxdYsZT46JX9CVWVjCJ30pz8/iQTUJtAth1+jTFU1eEFNPFT6Nqkg
	lAYKWHYozSc0FA8yeF8fPiGxIykBozha1dMBxwmZoQdQhZfo2oRa1Hy2E3GKywUg
	sWCj7xnZ1GbiVpgyGXBllsCNnCcP4M3hy6aOM+E45Snzwm3vWQKGfEtqAq+mzCZ+
	bSPM5e0+kUvTWjYyS8YsODGGkeqxucCoJWXBKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1770649270; x=
	1770735670; bh=qBP8CAa3S5jQW57WvRTHGGtEqTNwVqhEDcsU1gl8sjI=; b=t
	4UubUuLhcYmk0YuUpEtWtPPs9z6G8CU38Jjo1pSN715kFqcZUkUYnmnzdS55kxpB
	jmUctZBMZPEDpD+EfQE6vFGTVvli9KnqgxqPXQ8U2eOuPHc5/KRR6Uuv2ir8pA2/
	bpFDJigt7cLCSwa7yPr6BLH8VBcDq7CA/bBFUoht6SVINP69UEQE9mkJgrKfDiZs
	FbhKSTdlbbBuZxYl60M/iU9ojGDH4CidXo2tWaVR1pHDT3DTxKmnsspzElyDOMeI
	pthgE7ck1VPJqoDtQGKs9HCLfoVaqWu/4OFAVuOnNHJqt5K8PV9UtMZDkvGixCvB
	Oclka30n973Hvz9sCaUqQ==
X-ME-Sender: <xms:tfaJaeK7FSwgKNPNFlutUOxNdEl9feiZKESpsIu6hD30A3q-pUAKpQ>
    <xme:tfaJaWnBB45adEU9HVVx8lnObFTtO6MErizeRlELZHxTFgvuwnXDfyR6bZP4hZa9D
    U16-hWwm1kpLJ4LBo_ohwiXsEAY_0vv2u7-JMLJLnFr58EncvVXQw>
X-ME-Received: <xmr:tfaJafar5JQJudDeSXLfWgw7DLUa6yVf5HGRvZAAYIRymTFLpk7tfg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduleejudduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukffpifggtggusehgtderre
    dttddvnecuhfhrohhmpeetnhgurhhihicufghtkhhinhcuoegrnhgurhgvhigpuhhtkhhi
    nhesfhgrshhtmhgrihhlrdgtohhmqeenucggtffrrghtthgvrhhnpeduhfevjeeggeffie
    efgefggeehvedtjedtgfdtffevhedvieegtefgjeelueffleenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvhigpuhhtkhhinhesfh
    grshhtmhgrihhlrdgtohhmpdhnsggprhgtphhtthhopeelpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohephhhvvghrkhhuihhlsehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrghinhhtrghi
    nhgvrhhssegslhhuvggthhgvrhhrhiguvhhrrdgtohhmpdhrtghpthhtohepihhsmhgrvg
    hlsehiohguvghvrdgtohdruhhkpdhrtghpthhtoheprghnthhonhesphhitggrphhitggr
    rdhimhdprhgtphhtthhopegrnhgurhhihigpuhhtkhhinhesfhgrshhtmhgrihhlrdgtoh
    hmpdhrtghpthhtohephhgvlhhlohesrghuthhkihhnrdhnvght
X-ME-Proxy: <xmx:tfaJaa8icCqwJj_GuQPS7kiAAcsvvMjTqPhtueqxh9OiVSfBiUT4Gw>
    <xmx:tfaJaWY34v_rnVAnfoWGuf6crrAUjl3NukINYwXadOocadU-y99E7g>
    <xmx:tfaJacc7lOe_nrTimWkG1Ukn-RkfBBCN7Kh9JXK9VLpbROppyIIvGQ>
    <xmx:tfaJabkVZNGWfS1Q_F15Ga69ZHT154huh_ARn_D51Et7DkB_DiEW8w>
    <xmx:tvaJaYtRNTYA53ZifJdZx0V5sSZAgwmV-DqikDbGxuT0yW5dgSHkAEvZ>
Feedback-ID: i74c34308:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 9 Feb 2026 10:01:08 -0500 (EST)
Date: Mon, 9 Feb 2026 15:01:06 +0000
From: Andriy Utkin <andrey_utkin@fastmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	hverkuil@kernel.org, mchehab@kernel.org, maintainers@bluecherrydvr.com, 
	ismael@iodev.co.uk, anton@picapica.im
Cc: andriy_utkin@fastmail.com, hello@autkin.net
Subject: [PATCH] MAINTAINERS: drop myself from solo6x10, tw5864
Message-ID: <aYn2ldgvGR1ceRHd@gray>
Disposition-Notification-To: Andriy Utkin <andriy_utkin@fastmail.com>
X-Confirm-Reading-To: Andriy Utkin <andriy_utkin@fastmail.com>
Return-Receipt-To: Andriy Utkin <andriy_utkin@fastmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="anuk5z3wboopbqd6"
Content-Disposition: inline
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.24 / 15.00];
	SIGNED_PGP(-2.00)[];
	HEADER_FORGED_MDN(2.00)[];
	HEADER_RCONFIRM_MISMATCH(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[fastmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[fastmail.com:s=fm3,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[fastmail.com:+,messagingengine.com:+];
	FREEMAIL_CC(0.00)[fastmail.com,autkin.net];
	TAGGED_FROM(0.00)[bounces-52415-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrey_utkin@fastmail.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_MDN(0.00)[fastmail.com];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[fastmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fastmail.com:email,fastmail.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bluecherry.net:email,bluecherrydvr.com:email,messagingengine.com:dkim]
X-Rspamd-Queue-Id: C0610111C8F
X-Rspamd-Action: no action


--anuk5z3wboopbqd6
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [PATCH] MAINTAINERS: drop myself from solo6x10, tw5864
MIME-Version: 1.0

Years passed since I stopped being involved in development of these
drivers. Don't possess hardware samples, too.

Signed-off-by: Andriy Utkin <andrey_utkin@fastmail.com>
---
 MAINTAINERS | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e08767323..d984a8213 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24246,7 +24246,6 @@ F:	include/uapi/rdma/rdma_user_rxe.h
=20
 SOFTLOGIC 6x10 MPEG CODEC
 M:	Bluecherry Maintainers <maintainers@bluecherrydvr.com>
-M:	Andrey Utkin <andrey_utkin@fastmail.com>
 M:	Ismael Luceno <ismael@iodev.co.uk>
 L:	linux-media@vger.kernel.org
 S:	Supported
@@ -26639,8 +26638,6 @@ F:	drivers/platform/x86/tuxedo/
=20
 TW5864 VIDEO4LINUX DRIVER
 M:	Bluecherry Maintainers <maintainers@bluecherrydvr.com>
-M:	Andrey Utkin <andrey.utkin@corp.bluecherry.net>
-M:	Andrey Utkin <andrey_utkin@fastmail.com>
 L:	linux-media@vger.kernel.org
 S:	Supported
 F:	drivers/media/pci/tw5864/
--=20
2.52.0


--anuk5z3wboopbqd6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQKTBAABCgB9FiEEQtXEeQ89N5Y1BX/FMEr79spYDpcFAmmJ9rBfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldDQy
RDVDNDc5MEYzRDM3OTYzNTA1N0ZDNTMwNEFGQkY2Q0E1ODBFOTcACgkQMEr79spY
Dpfb7A/+PyzLH7mI2tZJwCegj7EmrIrp/W5bYIMCbtr4EuZSPLEBtCWS6YFur0p6
4hRKHgNRLyiYsq6VIvkfGV/27cvf90/vukZuyXwUmZClLVp3lB94XXho4wjCTIXK
wcUSmuuB1Kt6q86+RGk0xXsl3JoK7051ACgFuzFm7R3a1PZP30RwGNMsp1LlOtdU
gFtqAgyydkI/b5j+OQQSjzCrMuH7iS+XA4J0Q/o0sDZTtJMKcrDYNLRuXmE9qrS6
bSzPRSb0rg4ETuk0nf7TNMJB51NU65sF0L3vh9QQcxgzCwea69wr2l8kX7/jtM2+
DkTD8Qeoz9OSckswL5nH8uV1uSgK/8+6L6v0cFwEIJB2pU1gP4qEbFU9zxU3J7WZ
OXgAI67KyZr7JaG/Tm73XLZIdKQ9cSeYjUvlNcviYUmresJUOJQmRueK5brI7EKP
+OOCry4vqm+li5u7Cu8xouFB5zYxxidKrpXdEVRSjKRbYM2hGGlQ1AeyebaNPpE7
9kDwcphoyDXhtp47WF9DKselUNDmdva/xMqLOELllKRLdKWctF1eM4FtgTUvFj/C
a0IPH9QsL5PdgknibydIP/mATyC9M/NDOm7asLwY5x+dkFrctitINy8ntCH0sgQl
FYEfwutk6gnfl9X3uE6WE0Y1sDRsoemB+EqcwBAI0/nL6UYDQkE=
=i941
-----END PGP SIGNATURE-----

--anuk5z3wboopbqd6--

