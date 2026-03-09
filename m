Return-Path: <linux-media+bounces-54921-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0B9tAkuArmlfFQIAu9opvQ
	(envelope-from <linux-media+bounces-54921-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 09:09:47 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55463235542
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 09:09:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2373530087B9
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2026 08:09:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA2E036B04E;
	Mon,  9 Mar 2026 08:09:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4943C34F473
	for <linux-media@vger.kernel.org>; Mon,  9 Mar 2026 08:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773043780; cv=none; b=cprLtWAxT3IDz6PltNJTDBgEosx4lCJHw3CmLy6/PJfaneYM/GWsN9ne0sA5BRUQgv3CbPVyOzyY6XZhF2+V8ITnBtGLX30S2eZ2UuhlutlsWdXR4WGxRjicZJUvb9H8a+pX99PZ3BVy0buXlVspMP+q4eZ4ZtTyOlYnmKE3NzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773043780; c=relaxed/simple;
	bh=WTBs7NOH3cvbVsDdAXXgD8yqzjMwmfcGEXYOhY1BLQ0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fFn4El7sd7tpDNpqxRdL0pckLy6JNOkzacHt7loD4wGF/OMxn1bhzjK74/DBV9E+8h4Scr6C/VfK4TouHiUDVneMOhVsgh4cnUJ1IOo05Y7MqEw56voAE9GSlqzY7QFz2MHoKi721nfsu8tlpn7Zfmxl6GMMQt44EK8Hy7wMUCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vzVgE-0001rh-A0; Mon, 09 Mar 2026 09:09:34 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vzVgC-004Uqx-2H;
	Mon, 09 Mar 2026 09:09:34 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vzVgE-000000002Xj-08Zg;
	Mon, 09 Mar 2026 09:09:34 +0100
Message-ID: <40a03c2851678fc12fcb0e57f4048d6062e124aa.camel@pengutronix.de>
Subject: Re: [PATCH] staging: media: imx: fix parenthesis ending checks
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Mark Adamenko <marusik.adamenko@gmail.com>, linux-staging@lists.linux.dev
Cc: slongerbeam@gmail.com, gregkh@linuxfoundation.org, imx@lists.linux.dev, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 09 Mar 2026 09:09:33 +0100
In-Reply-To: <20260307062353.22069-1-marusik.adamenko@gmail.com>
References: <20260307062353.22069-1-marusik.adamenko@gmail.com>
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
X-Rspamd-Queue-Id: 55463235542
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linuxfoundation.org,lists.linux.dev,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-54921-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[p.zabel@pengutronix.de,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.073];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,pengutronix.de:mid,pengutronix.de:email]
X-Rspamd-Action: no action

On Fr, 2026-03-06 at 22:23 -0800, Mark Adamenko wrote:
> Remove 4 checks for ending with a parenthesis by removing
> unnecessary line breaks, and forward declare a variable for a function
> call that would otherwise remain over 80 columns.
>=20
> Signed-off-by: Mark Adamenko <marusik.adamenko@gmail.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

