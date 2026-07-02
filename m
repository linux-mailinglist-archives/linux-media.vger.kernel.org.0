Return-Path: <linux-media+bounces-66401-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FG6hDZCsRmqdbQsAu9opvQ
	(envelope-from <linux-media+bounces-66401-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 20:23:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F78B6FBFAF
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 20:23:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=fastmail.org header.s=fm2 header.b=iw7wH5Fm;
	dkim=pass header.d=messagingengine.com header.s=fm2 header.b="P 54UQM2";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66401-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-66401-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=fastmail.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 961A0309239E
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 17:27:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C979331D74B;
	Thu,  2 Jul 2026 17:27:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from flow-b7-smtp.messagingengine.com (flow-b7-smtp.messagingengine.com [202.12.124.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003E631691A;
	Thu,  2 Jul 2026 17:27:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783013230; cv=none; b=kt38Bc4DB66QZ6nlHAphvCYtc6OswX5ja5sZ25O2+v1w+2DaNTK+FC8zxEPusI0iTkmEiuX2phEQ1mAmu2szUqoHFAA9L+ft9o6gu+bOk0DbanjEGqbMGUFruDIvHZxo4mUmZRFotF8CYosM+UwtfV+6pdfBF/6MMIeSnoorfXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783013230; c=relaxed/simple;
	bh=8zb3pRfWFqDgJI7e7/4uFJ2yBNri71TEyEZQAg+0D3o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fkatDmdZEYIH+UGQo/FvvNxuT9LwLeqLGMcUsxzoXolpmHVlor/ZBYD0/giXgAa40D2wd3K2x7Q/tP38as1qaQdhiIk4B+hw0fFsKqiUTJ86RfVlGiQ/gj+ebysfbxkQWOE0bXbUe0ehd5QL/45xK8dcvkt4aIBUQ/vG7ND0Rrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.org; spf=pass smtp.mailfrom=fastmail.org; dkim=pass (2048-bit key) header.d=fastmail.org header.i=@fastmail.org header.b=iw7wH5Fm; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=P54UQM2Z; arc=none smtp.client-ip=202.12.124.142
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailflow.stl.internal (Postfix) with ESMTP id 887721300107;
	Thu,  2 Jul 2026 13:26:41 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Thu, 02 Jul 2026 13:26:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.org; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm2;
	 t=1783013201; x=1783016801; bh=A1mAq9QgeDFQGoc1g0bU/qewhTBVLQPT
	Wx4Ov6Yt/nQ=; b=iw7wH5Fm1WmPuWFN8hL3+Il+pjRNAk02KOsV5yEc8Y3yv1gS
	aRtc1lPnS8GfZ7PHm5qDQgZZFoJ7WUYHMuOTbF7pu6v8Ij7vtHdZKm+GLbHDBJh5
	hLSAdFIAIn479UM3KjIYStjl4yYIFIUMydbB9xMsf+RY6M1XQWIn+Vg1GHV0NDsZ
	hsCVrhLZsYDhfIEYYDmorsTxdoMpRrmfSm5nYh6Kit+bbMwDGNAbc2okjLN41C0r
	ZKczCSG3LrfFE5A71sQ+tKiN0GusNPtwpSgQ2kbUOG4ogIDSpFdBnZonbVzpFR1L
	bMPhKO7MlbxHK93dfRxGPtrwS5WILozyVn3u2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1783013201; x=
	1783016801; bh=A1mAq9QgeDFQGoc1g0bU/qewhTBVLQPTWx4Ov6Yt/nQ=; b=P
	54UQM2ZnN/6imxnbJrNe1+9M72MTaMIzk3ZrtQNwBc6PAaZK0/Q7daspjfR57kZx
	1jN53rl5t85F+jMuggjmPt2Nu8f4nL3zT4eM/uxNiDh5Tt+C2Ab7JGs82rLDwCLZ
	SNcstwQrXSw7bpJZRZ7IjynFHWcs3H/FvIPpnmr9ihEkK6uGzGUp0CGDKBK+zxhx
	iK6FGfQ/8kSr8AqBXoSJmD4GigT4+euhBsDrQuj6d8uwuop2AOLU0r50brDirCXL
	UHIar7lFFVEBAXN89FHzzlcHYKYGV1XAwE1m37KhLH2SojmZCKZkpMFT4te+3twv
	gmIn6c81GoZdDW3TC+8xg==
X-ME-Sender: <xms:UZ9GatdPz5u0aM_VAYwBbAEEe6poFKzKUDcKlOspgACgUID-9y6OuA>
    <xme:UZ9GakKCMKnFJxMV8w0s6KEDoN6lZEIE93WSpkB0AP7k8XwaIQJZ-TQufeTXJUaL5
    8eAk3WFwna6Ji8dr8eInVWlOD8PdmE28GN3i_WAPe_RXuJTfrUrzFE>
X-ME-Received: <xmr:UZ9GaiEKwEX32_dMGGhH8yMRM5hDJ3_i3RD-8xkc_VS6DRpHrTmnWoxwzeI>
X-ME-Proxy-Cause: dmFkZTGeEpR+AsdLrpWZ77U4u+gogj5Rn2qvzLNI4DWk5vaM4M191xqWXgmVv8E4h7oBcQ
    39deDZ7h2yJzGUf6cDCm7cDzMR95VhjRxVjnL4OIz6d2SHcWAYZcWOAZtVU/e+/OTK8HVz
    OQvKOVQARvAHO0zLXGJ+7VJ/Bh5HNnhWNtr9+X98qb+BnnWMkNrnyyek2SoyBKwQJhsQ9U
    D140zIQEcNQBZCtIFMfjkKe0rzDx8OcBmad8r7emM7x62zMV60W5AuIJxpSMe0mjnxOnpQ
    dalSnPW6KjpISgAS0jMTQrz2zTslPToO9cyDIkGk7KEyEQcA/lrbnJdHY4jc4SZA71UMjD
    1hev/O1XBjg7IQlfs6V/4JZi7ZPavmMj2Wt7P/YNOL/QDNeZ8qKqfWKsXURQk4Hp1fo1+A
    FVTTKbJkPOG9ZEIm36H8p40HHsiP0Dvf5sXgcNYvanR8R3a+39O0pPT2lh35Ww7cnLvko/
    nOvKYfPUDcD6wM63QTPGHwAkBJCRvq38lfSnWKf+ZbUC8qRavhtcnSDsMio7NjASiOh3aX
    swegRWZON4WjBk07KGyuCwCwP0ResfvK2qWdu+HgdnQgTgVFMekYf8OLpV9Rhjzu7b9tnM
    clugM+UtXCFSslSZHXiDFp7x/apB2IHwElJv/g03FMcOw7D8cKbj784VSybQ
X-ME-Proxy: <xmx:UZ9GanA3uyciShD84Ziq53-huaMsVMfVP7Jhjm72E7zdNG85XBY-8Q>
    <xmx:UZ9Gal-ViKLR0-3KSckbyFHw8nB_Yvfhz6vu8GHS9UzFAzfl5dQ4og>
    <xmx:UZ9GajBj3ONGd98PJre0zOQ_Fy6uVVJcyiwYb2MwOvnbrCmjwReBdg>
    <xmx:UZ9GaqQqqXx2w50--tomR5r6MicyKe3i3ElTvhnmg-iuUEgycPe6Ag>
    <xmx:UZ9GamM0iBjYu8pa-BVbPhBGJBAtCiXNeWVBGXI_xgKdWWjy4M05paBQ>
Feedback-ID: ib53e4b78:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Jul 2026 13:26:40 -0400 (EDT)
Date: Thu, 2 Jul 2026 12:26:38 -0500
From: Ian Bridges <icb@fastmail.org>
To: Matthias Schwarzott <zzam@gentoo.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] media: si2165: Replace strlcat() with snprintf()
Message-ID: <akafTmRDnPK4L3A1@dev>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fastmail.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[fastmail.org:s=fm2,messagingengine.com:s=fm2];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66401-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[icb@fastmail.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zzam@gentoo.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hardening@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[fastmail.org:+,messagingengine.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[icb@fastmail.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[104.64.211.4:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dev:mid,fastmail.org:dkim,fastmail.org:email,fastmail.org:from_mime,messagingengine.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4F78B6FBFAF

In preparation for removing the strlcat() API[1], replace its uses in
si2165_probe(). The chip name and the supported delivery systems are
already known when the frontend name is built, so the whole name can be
produced by a single snprintf(), seeded from the same si2165_ops
template default that the strlcat() calls appended to.

Link: https://github.com/KSPP/linux/issues/370 [1]
Signed-off-by: Ian Bridges <icb@fastmail.org>
---
I don't have si2165 hardware, so I tested the patch with:
 - x86_64 build at W=1 with no warnings. Applies cleanly on the media
   tree next branch.
 - Module load/unload in an x86_64 QEMU guest.
 - A userspace comparison of the old and new name construction for both
   chip types; outputs are identical.

 drivers/media/dvb-frontends/si2165.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/media/dvb-frontends/si2165.c b/drivers/media/dvb-frontends/si2165.c
index f1241b63aa5c..ebb4083b99a8 100644
--- a/drivers/media/dvb-frontends/si2165.c
+++ b/drivers/media/dvb-frontends/si2165.c
@@ -1243,20 +1243,16 @@ static int si2165_probe(struct i2c_client *client)
 		chip_name, rev_char, state->chip_type,
 		state->chip_revcode);
 
-	strlcat(state->fe.ops.info.name, chip_name,
-		sizeof(state->fe.ops.info.name));
+	snprintf(state->fe.ops.info.name, sizeof(state->fe.ops.info.name),
+		 "%s%s%s%s", si2165_ops.info.name, chip_name,
+		 state->has_dvbt ? " DVB-T" : "",
+		 state->has_dvbc ? " DVB-C" : "");
 
 	n = 0;
-	if (state->has_dvbt) {
+	if (state->has_dvbt)
 		state->fe.ops.delsys[n++] = SYS_DVBT;
-		strlcat(state->fe.ops.info.name, " DVB-T",
-			sizeof(state->fe.ops.info.name));
-	}
-	if (state->has_dvbc) {
+	if (state->has_dvbc)
 		state->fe.ops.delsys[n++] = SYS_DVBC_ANNEX_A;
-		strlcat(state->fe.ops.info.name, " DVB-C",
-			sizeof(state->fe.ops.info.name));
-	}
 
 	/* return fe pointer */
 	*pdata->fe = &state->fe;
-- 
2.47.3


