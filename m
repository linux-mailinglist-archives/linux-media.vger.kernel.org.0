Return-Path: <linux-media+bounces-55072-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mE3bFo7hr2nkdAIAu9opvQ
	(envelope-from <linux-media+bounces-55072-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 10:17:02 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 70826248230
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 10:17:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 09D58302B466
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 09:13:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A19343D511;
	Tue, 10 Mar 2026 09:12:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1728543C05F
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 09:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773133977; cv=none; b=W1fMjt+3vfS7gG/BSy9ckBc6sM240RL0EWLt0Jl/HR6BGPTFJgGULhDtp2u7QcUt62VBALqtB5UVygaepo3beLaixELJXGjRzS7plC2sYu6KJ9H7o9gaKlNIatzUYl4up64g/rH+BCDBmbsGMTw71p2CzLBsmQteNPxOS6DtVMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773133977; c=relaxed/simple;
	bh=Aw/V52j4K+VGbu9EWXM8h0N4vfL0EnlrmyYVrsbGzaU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XeM3Ky3jEO2GV9DnRJD4/9QzU8zwvvvNlPdLPyQzqPjK4jq2I+czQVHANLQmePRkDglHIjrYYWGP4KTrm4YLY8wchTL8rca8rxvwMiEpVcaTXRFPr76iEEigtuCv42etEvGCWNjCnOeyg+mtiQkqPlhqnPyExKqRQxYAPrQCcuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vzt8b-0005hl-1a; Tue, 10 Mar 2026 10:12:25 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vzt8Z-004fpC-14;
	Tue, 10 Mar 2026 10:12:24 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vzt8a-0000000038R-2UlK;
	Tue, 10 Mar 2026 10:12:24 +0100
Message-ID: <2c47fbc85fd867b801904507a5024c868a3cbe72.camel@pengutronix.de>
Subject: Re: [PATCH v2 1/9] media: i2c: ov08d10: fix runtime PM handling in
 probe
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Matthias Fend <matthias.fend@emfend.at>, Jimmy Su <jimmy.su@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring	 <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley	 <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, bsp-development.geo@leica-geosystems.com
Date: Tue, 10 Mar 2026 10:12:24 +0100
In-Reply-To: <20260309-ov08d10-v2-1-81f8b5d99984@emfend.at>
References: <20260309-ov08d10-v2-0-81f8b5d99984@emfend.at>
	 <20260309-ov08d10-v2-1-81f8b5d99984@emfend.at>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Rspamd-Queue-Id: 70826248230
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-55072-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[p.zabel@pengutronix.de,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.763];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,pengutronix.de:mid,pengutronix.de:email]
X-Rspamd-Action: no action

On Mo, 2026-03-09 at 18:07 +0100, Matthias Fend wrote:
> Set the device's runtime PM status and enable runtime PM before registeri=
ng
> the async sub-device. This is needed to avoid the case where the device i=
s
> runtime PM resumed while runtime PM has not been enabled yet.
>=20
> Remove the related, non-driver-specific comment while at it.
>=20
> Fixes: 7be91e02ed57 ("media: i2c: Add ov08d10 camera sensor driver")
> Signed-off-by: Matthias Fend <matthias.fend@emfend.at>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

