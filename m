Return-Path: <linux-media+bounces-60596-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDj0JHg7+2nUXwMAu9opvQ
	(envelope-from <linux-media+bounces-60596-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 15:00:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E314DAA41
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 15:00:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B50F2301CF5A
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 12:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8018346AF11;
	Wed,  6 May 2026 12:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=puri.sm header.i=@puri.sm header.b="rBcMD0KF"
X-Original-To: linux-media@vger.kernel.org
Received: from ms.puri.sm (ms.puri.sm [135.181.196.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC8A41B366;
	Wed,  6 May 2026 12:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=135.181.196.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778072353; cv=none; b=Oim20XAJb5+UMNhg7HBunuhSklA0xMqhrAwtTgnYrRgEKzpb5535c8ZdDwf6w4wK2gQrdtf5fAULoZPWFKfIVVzelOCigKJ5layuOFG62J0M5u6K0hqQmovxC4sV5iRnAdRWwPNcdeerPL+3AHGq2Uz2hhrdpSPrbaqAGpr4v3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778072353; c=relaxed/simple;
	bh=iDOLKuOjSEQmJAZ+IgIXl7Itx+RNr8G7XoHaZmpI50Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H93E9kq12k+m1mGLzap5D6MhzDsVxgdpHvuKl3+OLLJoGTBjgPjDOnGJxxz1BCdepn4FV26Cg2gIkvbaGzOG9eGUaIrNPJmcNfFVZhOGWYFmj5vMcCMA/k7AEVF+YbFlmWVh+RCjNfzHBq17ahhBQYn28lrPOCYUroDWBXTiykg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=puri.sm; spf=pass smtp.mailfrom=puri.sm; dkim=pass (2048-bit key) header.d=puri.sm header.i=@puri.sm header.b=rBcMD0KF; arc=none smtp.client-ip=135.181.196.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=puri.sm
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=puri.sm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=puri.sm; s=smtp2;
	t=1778071871; bh=iDOLKuOjSEQmJAZ+IgIXl7Itx+RNr8G7XoHaZmpI50Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=rBcMD0KFWemPOTp9tAX7xOpHhrl2rB4HTzkO+THGK43UJ654ByeFwM/Nb2MSiTrdR
	 NFXWqOLhUPkl4w2XoPBCH/ZOchpFupOWf5W1CMOLGN887Fq7GLL7Jykz1oP75TDlRm
	 KkAFSC4NdyvpQU2gGZuoYaXibad0ZuUUgXjKUasb41edCUWKHib5ppks5V3oy3J+V/
	 gB3aAshQVT75+589ZIhEGp208BK6pzxIZAmlwipEmjir+EWDZx2N0xJo3fGe1AXN/f
	 8wo9SqBaM0lbO9LAjYF9Nc5+jQvGKCCbdOuwP8KdF2Jtco2AGxvkOAZSyvARa8nXrx
	 MrJ1BTMFPSP6Q==
Received: from pliszka.localnet (83.24.27.154.ipv4.supernova.orange.pl [83.24.27.154])
	by ms.puri.sm (Postfix) with ESMTPSA id 79E311F79D;
	Wed, 06 May 2026 05:51:10 -0700 (PDT)
From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Martin Kepplinger-Novakovic <martink@posteo.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>, Pengyu Luo <mitltlatltl@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, Pengyu Luo <mitltlatltl@gmail.com>
Subject: Re: [PATCH v2 3/4] media: hi846: Add 6MP and 8MP modes support
Date: Wed, 06 May 2026 14:51:08 +0200
Message-ID: <OmTXoHZJTSGePymL9I-1Cw@puri.sm>
In-Reply-To: <20260501095433.1609309-4-mitltlatltl@gmail.com>
References:
 <20260501095433.1609309-1-mitltlatltl@gmail.com>
 <20260501095433.1609309-4-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Queue-Id: D8E314DAA41
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[puri.sm,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[puri.sm:s=smtp2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60596-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,nxp.com,pengutronix.de,gmail.com,linux.intel.com,posteo.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,lists.infradead.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RBL_SEM_FAIL(0.00)[104.64.211.4:query timed out];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[sebastian.krzyszkowiak@puri.sm,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[puri.sm:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[puri.sm:dkim,puri.sm:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

On pi=C4=85tek, 1 maja 2026 11:54:32 czas =C5=9Brodkowoeuropejski letni Pen=
gyu Luo=20
wrote:
> Hi846 is an 8MP sensor, but the upstream driver has only supported 2MP
> mode for years. This patch adds 6MP and 8MP modes to maximize sensor
> utilization.
>=20
> Note that these modes require 4-lane MIPI CSI-2, as the downstream
> driver only exposes 2MP, 6MP, and 8MP configurations in 4-lane
> operation on the target device. The register sequences are extracted
> from the downstream Windows driver.

Has this been tested in this form at all? I tried, failed and looking at th=
e=20
driver I don't see how could it ever end up using these modes in its curren=
t=20
state. It can only cause troubles when used with 2 lanes, while 4 lanes are=
=20
completely broken.

The driver defaults to its first supported mode, which happens to be a 640x=
480=20
mode that only defines its register list for 2 lanes. hi846_set_format was=
=20
supposedly meant to check whether the mode returned by v4l2_find_nearest_si=
ze=20
is compatible with the used lane count, but it does so too early - it actua=
lly=20
checks it against the already set mode rather than the one it's about to se=
t.=20
This means that you're never going to be able to set any valid mode when us=
ing=20
4 lanes without fixing this first.

And even if this was fixed, with 2 lanes this makes some calls from userspa=
ce=20
that previously succeeded now fail when v4l2_find_nearest_size happens to m=
atch=20
a mode that's only supported with 4 lanes. v4l2_find_nearest_size would hav=
e to=20
be fed with already filtered list of modes to fix that (which would actuall=
y=20
make the check mentioned above unnecessary).

Of course these are preexisting issues in the driver, but they make it=20
impossible to actually use what's being added in this patch and to add thes=
e=20
modes without causing regressions. So far these didn't matter as this drive=
r=20
was only ever used with 2 lanes, but they have to be fixed first before add=
ing=20
any actual 4 lane usage or modes that require 4 lanes.

S.



